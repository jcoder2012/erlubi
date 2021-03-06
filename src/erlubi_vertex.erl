%% ----------------------------------------------------------------------------
%%
%% erlubi: Erlang Process Visualizer
%%
%% Copyright 2012 (c) Trifork A/S.  All Rights Reserved.
%% http://trifork.com/ info@trifork.com
%%
%% This file is provided to you under the Apache License, Version 2.0 (the
%% "License"); you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%   http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
%% WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
%% License for the specific language governing permissions and limitations
%% under the License.
%%
%% ----------------------------------------------------------------------------

-module(erlubi_vertex, [ID]).

-export([id/0, color/1, shape/1, shapedetail/1, label/1, size/1, fontfamily/1,
        fontcolor/1, fontsize/1, visible/1, remove/0]).

id() ->
    ID.

remove() ->
    erlubi:callv('ubigraph.remove_vertex', [ID]).

set(Att,Value) ->
    erlubi:callv('ubigraph.set_vertex_attribute',
                 [ID,
                  erlubi_util:to_string(Att),
                  erlubi_util:to_string(Value)]).

color(Color) ->
    set("color", erlubi_util:color_string(Color)).

shape(cone) ->
    set("shape", "cone");
shape(cube) ->
    set("shape", "cube");
shape(dodecahedron) ->
    set("shape", "dodecahedron");
shape(icosahedron) ->
    set("shape", "icosahedron");
shape(octahedron) ->
    set("shape", "octahedron");
shape(sphere) ->
    set("shape", "sphere");
shape(torus) ->
    set("shape", "torus");
shape(none) ->
    set("shape", "none").

shapedetail(N) when N >= 0 ->
    set("shapedetail", N).

label(Text) when is_list(Text) ->
    set("label", Text);
label(Any) ->
    set("label", Any).

size(Size) when is_number(Size) ->
    set("size", Size).

fontfamily(times) ->
    set("fontfamily", "Times Roman");
fontfamily(helvetica) ->
    set("fontfamily", "Helvetica").


fontcolor(Color) ->
    set("fontcolor", erlubi_util:color_string(Color)).


fontsize(N) when is_integer(N) ->
    set("fontsize", N).


visible(true) ->
    set("visible", "true");
visible(false) ->
    set("visible", "false").



