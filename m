Return-Path: <linux-media+bounces-8408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D48438959AD
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 18:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A11781C21533
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 16:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5251414B06C;
	Tue,  2 Apr 2024 16:25:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30EE14AD1D
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 16:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712075110; cv=none; b=TW1dCNvjtvpydN8AIcMVhyz50OI/QterPyVfm3igQG1LEzmuDvQa0Oghm9h35xHrMwD4pVrL6kxI4TvXsKY1HymXB9fLZFrsv0J59xO5SchRddCiS1UC/kqGt+VlshMxfHprDmJrsLF8hYo55Dx4ByU3KMqqlkMolpf+smYTxJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712075110; c=relaxed/simple;
	bh=vuB0Ay6jptZEo8nV8l2CcSwDnpqJ2QgCZ61bNviFV/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ADWAMTYJLPor11mBrpP87cb8fBqgEt9LhLGJjGz7Bygb8U/O+8Lr5iT3YhjtLJuRzyC8KcQ6GoFDvk817xdJr70BjAYLS56FrdG6xtegOJbWQSggGtk0KMchG5bp7CzREtebjHAqjIv7Y5hFy+hJH6uJs4dwyGNlGAXWI8OMXPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA65C433F1;
	Tue,  2 Apr 2024 16:25:09 +0000 (UTC)
Message-ID: <bc78ca92-d839-4a6f-bb9e-1fec0685be68@xs4all.nl>
Date: Tue, 2 Apr 2024 18:25:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] edid-decode: build: add support for building with
 meson
Content-Language: en-US, nl
To: Sebastian Wick <sebastian.wick@redhat.com>, linux-media@vger.kernel.org
References: <20240305115451.210807-1-sebastian.wick@redhat.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240305115451.210807-1-sebastian.wick@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sebastian,

Sorry for the delay, I was on vacation.

I still need to look at this since I have to be certain that it doesn't break
installation (esp. the emscripten part). I hope to find the time for that later
this week.

I am also considering moving edid-decode into https://git.linuxtv.org/v4l-utils.git/
That way it is actually part of proper releases with a version number and tarballs,
which is something that has been requested a few times.

What is your opinion on that? Or would that just make life harder for you?

Regards,

	Hans

On 05/03/2024 12:54, Sebastian Wick wrote:
> This also removes the old Makefile based build-system.
> 
> The immediate reason for adding support for meson is that this allows us
> to include edid-decode as a subproject in libdisplay-info.
> 
> v2:
>  * Remove the make build-system
>  * Adjust the README on how to build/install with meson
>  * Fix installing for the wasm-build
> 
> Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
> ---
>  Makefile                      | 50 ---------------------------
>  README                        | 28 +++++++++------
>  emscripten/wasm-crossfile.txt | 14 ++++++++
>  meson.build                   | 65 +++++++++++++++++++++++++++++++++++
>  4 files changed, 96 insertions(+), 61 deletions(-)
>  delete mode 100644 Makefile
>  create mode 100644 emscripten/wasm-crossfile.txt
>  create mode 100644 meson.build
> 
> diff --git a/Makefile b/Makefile
> deleted file mode 100644
> index 375fedb..0000000
> --- a/Makefile
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -ifeq ($(OS),Windows_NT)
> -	bindir ?= /usr/bin
> -	mandir ?= /usr/share/man
> -else
> -	UNAME_S := $(shell uname -s)
> -	ifeq ($(UNAME_S),Darwin)
> -		bindir ?= /usr/local/sbin
> -		mandir ?= /usr/local/share/man
> -	else
> -		bindir ?= /usr/bin
> -		mandir ?= /usr/share/man
> -	endif
> -endif
> -
> -EMXX ?= em++
> -
> -SOURCES = $(wildcard *.cpp)
> -OBJECTS := $(patsubst %.cpp, %.o, $(SOURCES))
> -EMOBJECTS := $(patsubst %.cpp, emscripten/%.o, $(SOURCES))
> -
> -WARN_FLAGS = -Wall -Wextra -Wno-missing-field-initializers -Wno-unused-parameter -Wimplicit-fallthrough
> -
> -all: edid-decode
> -
> -sha = -DSHA=$(shell if test -d .git ; then git rev-parse --short=12 HEAD ; fi)
> -date = -DDATE=$(shell if test -d .git ; then TZ=UTC git show --quiet --date='format-local:"%F %T"' --format='%cd'; fi)
> -
> -edid-decode: $(OBJECTS)
> -	$(CXX) $(LDFLAGS) -g -o $@ $(OBJECTS) -lm
> -
> -edid-decode.js: emscripten/edid-decode.js
> -
> -emscripten/edid-decode.js: $(EMOBJECTS)
> -	$(EMXX) $(LDFLAGS) -s EXPORTED_FUNCTIONS='["_parse_edid"]' -s EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]' -o $@ $(EMOBJECTS) -lm
> -
> -%.o: %.cpp edid-decode.h oui.h Makefile
> -	$(CXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(WARN_FLAGS) -g $(sha) $(date) -o $@ -c $<
> -
> -emscripten/%.o: %.cpp edid-decode.h oui.h Makefile
> -	$(EMXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(WARN_FLAGS) $(sha) $(date) -o $@ -c $<
> -
> -clean:
> -	rm -f *.o emscripten/*.o
> -	rm -f edid-decode emscripten/edid-decode.js emscripten/edid-decode.wasm
> -
> -install:
> -	mkdir -p $(DESTDIR)$(bindir)
> -	install -m 0755 edid-decode $(DESTDIR)$(bindir)
> -	mkdir -p $(DESTDIR)$(mandir)/man1
> -	install -m 0644 edid-decode.1 $(DESTDIR)$(mandir)/man1
> diff --git a/README b/README
> index 4c2b7fe..bf4e668 100644
> --- a/README
> +++ b/README
> @@ -6,8 +6,9 @@ To build this do:
>  
>  git clone git://linuxtv.org/edid-decode.git
>  cd edid-decode
> -make
> -make install
> +meson setup _build
> +meson compile -C _build
> +meson install -C _build
>  
>  Patches and bug reports can be sent to the linux-media@vger.kernel.org
>  mailinglist (see https://www.linuxtv.org/lists.php). Please make sure
> @@ -46,15 +47,20 @@ https://hverkuil.home.xs4all.nl/edid-decode/edid-decode.html
>  
>  This is updated regularly with the latest edid-decode. It uses emscripten
>  and the html file is maintained in the emscripten directory of edid-decode.
> -To build edid-decode.js/wasm run 'make edid-decode.js'. This assumes
> -that emscripten is installed, of course.
> -
> -You can use the konqueror browser to run it locally:
> -
> -	konqueror emscripten/edid-decode.html
> -
> -For other browsers you need to serve the files using a local webserver.
> -See also https://emscripten.org/docs/getting_started/Tutorial.html
> +To build it, set the project up using the provided crossfile:
> +
> +	meson setup _build-wasm \
> +		--cross-file ./emscripten/wasm-crossfile.txt \
> +		--prefix=$(pwd)/_install-wasm
> +	meson install _build-wasm
> +	# serve the files using a local webserver
> +	cd _install-wasm/bin
> +	python3 -m http.server
> +
> +This assumes that emscripten is installed, of course. The location of the
> +toolchain can be adjusted in emscripten/wasm-crossfile.txt.
> +See also https://emscripten.org/docs/getting_started/Tutorial.html and
> +https://mesonbuild.com/Cross-compilation.html.
>  
>  You can find a very large collection of EDIDs here:
>  https://github.com/linuxhw/EDID
> diff --git a/emscripten/wasm-crossfile.txt b/emscripten/wasm-crossfile.txt
> new file mode 100644
> index 0000000..a41f46c
> --- /dev/null
> +++ b/emscripten/wasm-crossfile.txt
> @@ -0,0 +1,14 @@
> +[binaries]
> +c = '/usr/lib/emscripten/emcc'
> +cpp = '/usr/lib/emscripten/em++'
> +ar = '/usr/lib/emscripten/emar'
> +strip = '/usr/lib/emscripten/emstrip'
> +
> +[built-in options]
> +default_library = 'static'
> +
> +[host_machine]
> +system = 'emscripten'
> +cpu_family = 'wasm32'
> +cpu = 'wasm32'
> +endian = 'little'
> \ No newline at end of file
> diff --git a/meson.build b/meson.build
> new file mode 100644
> index 0000000..3a5bc71
> --- /dev/null
> +++ b/meson.build
> @@ -0,0 +1,65 @@
> +project(
> +	'edid-decode',
> +	'cpp',
> +)
> +
> +edid_decode_args = [
> +	'-Wno-missing-field-initializers',
> +	'-Wno-unused-parameter',
> +	'-Wimplicit-fallthrough',
> +]
> +edid_decode_link_args = []
> +
> +git = find_program('git', native: true, required: false)
> +if git.found()
> +	git_commit = run_command(
> +		[git, 'rev-parse', '--short=12', 'HEAD'],
> +		check: false,
> +	)
> +	git_date = run_command(
> +		[git, 'show', '--quiet', '--date=format-local:%F %T', '--format=%cd'],
> +		env: {'TZ': 'UTC'},
> +		check: false,
> +	)
> +
> +	if git_commit.returncode() == 0
> +		edid_decode_args += ['-DSHA=' + git_commit.stdout().strip()]
> +	endif
> +	if git_date.returncode() == 0
> +		edid_decode_args += ['-DDATE=' + git_date.stdout().strip()]
> +	endif
> +endif
> +
> +if target_machine.system() == 'emscripten'
> +	edid_decode_link_args += [
> +		'-sEXPORTED_FUNCTIONS=_parse_edid',
> +		'-sEXPORTED_RUNTIME_METHODS=ccall,cwrap'
> +	]
> +
> +	fs = import('fs')
> +	foreach filename : ['edid-decode.html', 'edid-decode.ico']
> +		fs.copyfile(
> +			'emscripten' / filename,
> +			install: true,
> +			install_dir: 'bin',
> +		)
> +	endforeach
> +endif
> +
> +executable(
> +	'edid-decode',
> +	'calc-gtf-cvt.cpp',
> +	'calc-ovt.cpp',
> +	'edid-decode.cpp',
> +	'parse-base-block.cpp',
> +	'parse-cta-block.cpp',
> +	'parse-di-ext-block.cpp',
> +	'parse-displayid-block.cpp',
> +	'parse-ls-ext-block.cpp',
> +	'parse-vtb-ext-block.cpp',
> +	cpp_args : edid_decode_args,
> +	link_args: edid_decode_link_args,
> +	install : true,
> +)
> +
> +install_man('edid-decode.1')
> \ No newline at end of file


