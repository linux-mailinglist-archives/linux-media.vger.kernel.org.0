Return-Path: <linux-media+bounces-8437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D43C6895D73
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 22:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 633331F26955
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 20:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BAC15D5AD;
	Tue,  2 Apr 2024 20:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OxXCNG22"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408E415D5A3
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 20:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712089122; cv=none; b=DyoyxLb6lLf7LCOE00hQTDt9o5D4Q5zYx+fRYnf01c5pnZ92caj1zz9M8DswPijVNVe42OXQn1DU7gHNZSLe3r2o64LU9k/XuREkF8XAArfE5UgitPydNw8u4kCIRl+6EpFunMqQ17XgPWgk/cWHvbzVekTrTY2fJbhGbGn94FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712089122; c=relaxed/simple;
	bh=KtbANLV9jwf79hX8EBLkVWy5YdfF/xR012YM2dDiBiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tdwLXEb55AwPQwfXdigVxzI0hOIlPRMYrpmrZyTOP0z71WFMcvTU9LihTQvjY++pcysiR92a+Zz6cUVON84tbFdn8u9qr+ix4ZSkJJtycjP2exDnZSLNl20M7706zZ2B10uCgv9fpEYNk99HsyqcxIqOEFVBZlxMPN9VM7gvlDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OxXCNG22; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712089119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l4SFKie4/7fDdKgSLurI8mZwIt/QLCQEOWbvE+Um4Jo=;
	b=OxXCNG226NsGBalMoEPWWOsuRgGlxWStNkvmyinhKPRGC8iwZudtwTNLmBQcGAjC2977G+
	B8/6OGzPYiJGQWWZpsqxupMJt7ibpVrOHqkFN73jTf16bvFPCUYZRMeeJofILIXVPdzrEJ
	Rj1Gi99nx21mD6Ty0OOfmnIGEAd1uU8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-kWiQUoYlO7S67E7YOfoWqA-1; Tue, 02 Apr 2024 16:18:37 -0400
X-MC-Unique: kWiQUoYlO7S67E7YOfoWqA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-515bd3d89c9so4075390e87.3
        for <linux-media@vger.kernel.org>; Tue, 02 Apr 2024 13:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712089116; x=1712693916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4SFKie4/7fDdKgSLurI8mZwIt/QLCQEOWbvE+Um4Jo=;
        b=v2v/MRZU3ql/GUrWoYfXXWReXqWVeNxeHiOPD4+7aBb7HJ755+zO9ESAPCpV1z0jM6
         fJk3Cog9+z30b/E90SoNkXegu4B1k4KdvN1m6qn7Pnq4uPK+ob/Kq3VquhNHo6kiV80A
         landsDpGptvzU3FXErObcouN4h65ZA/aEKHF9TtimJ4+Nz2AHk9K+D9zyVfN+4w/PYId
         y+kZznJLGEcr1OS73iLyHDqoQ9ZFSOh9FRFrk09kHT/6EXrpfvNJNqJ+HQdcLaLmtFbs
         1wiYLdrujwp/kF5piFnxf02owu34+YgbRzPqLfk4BWKF1AvAnNXB/0MUrmwu0fg5n7s9
         Scfg==
X-Gm-Message-State: AOJu0YyCXtyf9KifnqbEj1+1+4NcEU+5G+X0FLd/XNsb3NWsUvv3sPin
	YnEFm7f3s9VkVsUwbWItB0ZycPXCoXZ4BVU59iyaKV6iA4mgb7oHuY9pWWHyQ3WE/G7E/wbV7L4
	Gqd02T9pptfrlLOAdvt+6N3LshrDkzKZYnwmwpMAfx/r2p1e5YUw+f51NaUKrmQZRrabUJLDgG9
	XbVIm1ZzpT3mrD6SwvXcveFUmIfIhpiSrnzwvYpj6O65uscw==
X-Received: by 2002:a19:7512:0:b0:513:cc91:9ed7 with SMTP id y18-20020a197512000000b00513cc919ed7mr295077lfe.11.1712089115954;
        Tue, 02 Apr 2024 13:18:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqvVyVqjIRmdekRyTZq7TPXist+2qs4PHQX3FUJKliWWmQez9529BSEELtQthem/P0FHpzpfqBoeT5HGaRNqM=
X-Received: by 2002:a19:7512:0:b0:513:cc91:9ed7 with SMTP id
 y18-20020a197512000000b00513cc919ed7mr295071lfe.11.1712089115509; Tue, 02 Apr
 2024 13:18:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305115451.210807-1-sebastian.wick@redhat.com> <bc78ca92-d839-4a6f-bb9e-1fec0685be68@xs4all.nl>
In-Reply-To: <bc78ca92-d839-4a6f-bb9e-1fec0685be68@xs4all.nl>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Tue, 2 Apr 2024 22:18:24 +0200
Message-ID: <CA+hFU4wJEXhxY4m9edBP1kO9w6aCqMHEBy2JfkynwPHvsk026A@mail.gmail.com>
Subject: Re: [PATCH v2] edid-decode: build: add support for building with meson
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, Apr 2, 2024 at 6:35=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> wr=
ote:
>
> Hi Sebastian,
>
> Sorry for the delay, I was on vacation.
>
> I still need to look at this since I have to be certain that it doesn't b=
reak
> installation (esp. the emscripten part). I hope to find the time for that=
 later
> this week.

Great! Send out a new version as well because I forgot to make the
executable available when used as a subproject.

> I am also considering moving edid-decode into https://git.linuxtv.org/v4l=
-utils.git/
> That way it is actually part of proper releases with a version number and=
 tarballs,
> which is something that has been requested a few times.
>
> What is your opinion on that? Or would that just make life harder for you=
?

It should be fine for us. We can use get_variable() on the subproject
to get to edid-decode even if there are other things being built.
Might have to change the meson files to support building just
edid-decode but that should be doable as well.

> Regards,
>
>         Hans
>
> On 05/03/2024 12:54, Sebastian Wick wrote:
> > This also removes the old Makefile based build-system.
> >
> > The immediate reason for adding support for meson is that this allows u=
s
> > to include edid-decode as a subproject in libdisplay-info.
> >
> > v2:
> >  * Remove the make build-system
> >  * Adjust the README on how to build/install with meson
> >  * Fix installing for the wasm-build
> >
> > Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
> > ---
> >  Makefile                      | 50 ---------------------------
> >  README                        | 28 +++++++++------
> >  emscripten/wasm-crossfile.txt | 14 ++++++++
> >  meson.build                   | 65 +++++++++++++++++++++++++++++++++++
> >  4 files changed, 96 insertions(+), 61 deletions(-)
> >  delete mode 100644 Makefile
> >  create mode 100644 emscripten/wasm-crossfile.txt
> >  create mode 100644 meson.build
> >
> > diff --git a/Makefile b/Makefile
> > deleted file mode 100644
> > index 375fedb..0000000
> > --- a/Makefile
> > +++ /dev/null
> > @@ -1,50 +0,0 @@
> > -ifeq ($(OS),Windows_NT)
> > -     bindir ?=3D /usr/bin
> > -     mandir ?=3D /usr/share/man
> > -else
> > -     UNAME_S :=3D $(shell uname -s)
> > -     ifeq ($(UNAME_S),Darwin)
> > -             bindir ?=3D /usr/local/sbin
> > -             mandir ?=3D /usr/local/share/man
> > -     else
> > -             bindir ?=3D /usr/bin
> > -             mandir ?=3D /usr/share/man
> > -     endif
> > -endif
> > -
> > -EMXX ?=3D em++
> > -
> > -SOURCES =3D $(wildcard *.cpp)
> > -OBJECTS :=3D $(patsubst %.cpp, %.o, $(SOURCES))
> > -EMOBJECTS :=3D $(patsubst %.cpp, emscripten/%.o, $(SOURCES))
> > -
> > -WARN_FLAGS =3D -Wall -Wextra -Wno-missing-field-initializers -Wno-unus=
ed-parameter -Wimplicit-fallthrough
> > -
> > -all: edid-decode
> > -
> > -sha =3D -DSHA=3D$(shell if test -d .git ; then git rev-parse --short=
=3D12 HEAD ; fi)
> > -date =3D -DDATE=3D$(shell if test -d .git ; then TZ=3DUTC git show --q=
uiet --date=3D'format-local:"%F %T"' --format=3D'%cd'; fi)
> > -
> > -edid-decode: $(OBJECTS)
> > -     $(CXX) $(LDFLAGS) -g -o $@ $(OBJECTS) -lm
> > -
> > -edid-decode.js: emscripten/edid-decode.js
> > -
> > -emscripten/edid-decode.js: $(EMOBJECTS)
> > -     $(EMXX) $(LDFLAGS) -s EXPORTED_FUNCTIONS=3D'["_parse_edid"]' -s E=
XPORTED_RUNTIME_METHODS=3D'["ccall", "cwrap"]' -o $@ $(EMOBJECTS) -lm
> > -
> > -%.o: %.cpp edid-decode.h oui.h Makefile
> > -     $(CXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(WARN_FLAGS) -g $(sha) $=
(date) -o $@ -c $<
> > -
> > -emscripten/%.o: %.cpp edid-decode.h oui.h Makefile
> > -     $(EMXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(WARN_FLAGS) $(sha) $(d=
ate) -o $@ -c $<
> > -
> > -clean:
> > -     rm -f *.o emscripten/*.o
> > -     rm -f edid-decode emscripten/edid-decode.js emscripten/edid-decod=
e.wasm
> > -
> > -install:
> > -     mkdir -p $(DESTDIR)$(bindir)
> > -     install -m 0755 edid-decode $(DESTDIR)$(bindir)
> > -     mkdir -p $(DESTDIR)$(mandir)/man1
> > -     install -m 0644 edid-decode.1 $(DESTDIR)$(mandir)/man1
> > diff --git a/README b/README
> > index 4c2b7fe..bf4e668 100644
> > --- a/README
> > +++ b/README
> > @@ -6,8 +6,9 @@ To build this do:
> >
> >  git clone git://linuxtv.org/edid-decode.git
> >  cd edid-decode
> > -make
> > -make install
> > +meson setup _build
> > +meson compile -C _build
> > +meson install -C _build
> >
> >  Patches and bug reports can be sent to the linux-media@vger.kernel.org
> >  mailinglist (see https://www.linuxtv.org/lists.php). Please make sure
> > @@ -46,15 +47,20 @@ https://hverkuil.home.xs4all.nl/edid-decode/edid-de=
code.html
> >
> >  This is updated regularly with the latest edid-decode. It uses emscrip=
ten
> >  and the html file is maintained in the emscripten directory of edid-de=
code.
> > -To build edid-decode.js/wasm run 'make edid-decode.js'. This assumes
> > -that emscripten is installed, of course.
> > -
> > -You can use the konqueror browser to run it locally:
> > -
> > -     konqueror emscripten/edid-decode.html
> > -
> > -For other browsers you need to serve the files using a local webserver=
.
> > -See also https://emscripten.org/docs/getting_started/Tutorial.html
> > +To build it, set the project up using the provided crossfile:
> > +
> > +     meson setup _build-wasm \
> > +             --cross-file ./emscripten/wasm-crossfile.txt \
> > +             --prefix=3D$(pwd)/_install-wasm
> > +     meson install _build-wasm
> > +     # serve the files using a local webserver
> > +     cd _install-wasm/bin
> > +     python3 -m http.server
> > +
> > +This assumes that emscripten is installed, of course. The location of =
the
> > +toolchain can be adjusted in emscripten/wasm-crossfile.txt.
> > +See also https://emscripten.org/docs/getting_started/Tutorial.html and
> > +https://mesonbuild.com/Cross-compilation.html.
> >
> >  You can find a very large collection of EDIDs here:
> >  https://github.com/linuxhw/EDID
> > diff --git a/emscripten/wasm-crossfile.txt b/emscripten/wasm-crossfile.=
txt
> > new file mode 100644
> > index 0000000..a41f46c
> > --- /dev/null
> > +++ b/emscripten/wasm-crossfile.txt
> > @@ -0,0 +1,14 @@
> > +[binaries]
> > +c =3D '/usr/lib/emscripten/emcc'
> > +cpp =3D '/usr/lib/emscripten/em++'
> > +ar =3D '/usr/lib/emscripten/emar'
> > +strip =3D '/usr/lib/emscripten/emstrip'
> > +
> > +[built-in options]
> > +default_library =3D 'static'
> > +
> > +[host_machine]
> > +system =3D 'emscripten'
> > +cpu_family =3D 'wasm32'
> > +cpu =3D 'wasm32'
> > +endian =3D 'little'
> > \ No newline at end of file
> > diff --git a/meson.build b/meson.build
> > new file mode 100644
> > index 0000000..3a5bc71
> > --- /dev/null
> > +++ b/meson.build
> > @@ -0,0 +1,65 @@
> > +project(
> > +     'edid-decode',
> > +     'cpp',
> > +)
> > +
> > +edid_decode_args =3D [
> > +     '-Wno-missing-field-initializers',
> > +     '-Wno-unused-parameter',
> > +     '-Wimplicit-fallthrough',
> > +]
> > +edid_decode_link_args =3D []
> > +
> > +git =3D find_program('git', native: true, required: false)
> > +if git.found()
> > +     git_commit =3D run_command(
> > +             [git, 'rev-parse', '--short=3D12', 'HEAD'],
> > +             check: false,
> > +     )
> > +     git_date =3D run_command(
> > +             [git, 'show', '--quiet', '--date=3Dformat-local:%F %T', '=
--format=3D%cd'],
> > +             env: {'TZ': 'UTC'},
> > +             check: false,
> > +     )
> > +
> > +     if git_commit.returncode() =3D=3D 0
> > +             edid_decode_args +=3D ['-DSHA=3D' + git_commit.stdout().s=
trip()]
> > +     endif
> > +     if git_date.returncode() =3D=3D 0
> > +             edid_decode_args +=3D ['-DDATE=3D' + git_date.stdout().st=
rip()]
> > +     endif
> > +endif
> > +
> > +if target_machine.system() =3D=3D 'emscripten'
> > +     edid_decode_link_args +=3D [
> > +             '-sEXPORTED_FUNCTIONS=3D_parse_edid',
> > +             '-sEXPORTED_RUNTIME_METHODS=3Dccall,cwrap'
> > +     ]
> > +
> > +     fs =3D import('fs')
> > +     foreach filename : ['edid-decode.html', 'edid-decode.ico']
> > +             fs.copyfile(
> > +                     'emscripten' / filename,
> > +                     install: true,
> > +                     install_dir: 'bin',
> > +             )
> > +     endforeach
> > +endif
> > +
> > +executable(
> > +     'edid-decode',
> > +     'calc-gtf-cvt.cpp',
> > +     'calc-ovt.cpp',
> > +     'edid-decode.cpp',
> > +     'parse-base-block.cpp',
> > +     'parse-cta-block.cpp',
> > +     'parse-di-ext-block.cpp',
> > +     'parse-displayid-block.cpp',
> > +     'parse-ls-ext-block.cpp',
> > +     'parse-vtb-ext-block.cpp',
> > +     cpp_args : edid_decode_args,
> > +     link_args: edid_decode_link_args,
> > +     install : true,
> > +)
> > +
> > +install_man('edid-decode.1')
> > \ No newline at end of file
>


