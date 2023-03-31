Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5B56D2999
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 22:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbjCaUqP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 16:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231609AbjCaUqO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 16:46:14 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E09B2220E
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 13:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1680295569; i=ps.report@gmx.net;
        bh=dd5rEfw18YdB4YEbE4JvD+pnVSzlgDTVm2XE24vfeBs=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=qAUgkia4E0Xs3r7ASROBQb3OSfZm43Dr32zzdWcwX04kfTTg/z3DTieumxESz8pNK
         wcUeGTabq6gh/zBMYb+5pmcaseJ0nd5CtEPoJRXMKT7vOzoGkxgaMrzwEGnbMUNUUR
         O3v3S9dAqKRhH+cKKksatltqZjCDorJdNSHNk06tZAvFlPLAdFir1o9hzMQLRch8rC
         jIXEEkP3VLyrKagAmU5c5JMw2vxW9xGhyXWJpLKLxk0D6aCYXipsAjYf5pG3t3pLW5
         oZ0hnEY4sM+eXE3D9rJLg9FyCwumeuifIRQSGJ4R9rnQsmKGG8zbpVPTgR0IyrIWsz
         Rt0rsMbB1Qq/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.208.135]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mqs0X-1qD3p21rBx-00ms7P; Fri, 31
 Mar 2023 22:46:09 +0200
Date:   Fri, 31 Mar 2023 22:46:08 +0200
From:   Peter Seiderer <ps.report@gmx.net>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v4l-utils v1] v4l2-tracer: fix 'symbol mmap64/open64 is
 already defined' compile failure
Message-ID: <20230331224608.2e1bf935@gmx.net>
In-Reply-To: <c7249ba0-f1f4-f199-7a1b-5dde2b79c920@xs4all.nl>
References: <20230330150606.20483-1-ps.report@gmx.net>
        <c7249ba0-f1f4-f199-7a1b-5dde2b79c920@xs4all.nl>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GhtsrTrS8lwdcA2G7bLIma8K9hl4ME/70wlyjqk6Sl/xlql9wrA
 z36fkX7VQpffm98icA4SV2my8HCHcusBGDZJ2qlsHwsnBjsyfy9sE33XV6LcEDzahtL9Pqu
 WC6fXpNfNUU2attPX21Jr2B0aW+7Hdb7qKMY24U3XeqvSjmilUSXkrXXtJ6SnqTF9tk9I2U
 rNzuVxaPZ3rNv+pIUcxRA==
UI-OutboundReport: notjunk:1;M01:P0:g8FhULCZVNo=;PKob1wlrOZF13HkO7iXTlpr+4li
 aoZf/JjLfHPxmOZep3h4zLMRyQHxzEGrHjy/WG9UmNnGfGYwLuDJz72+WTvkoCbtSKOGb0Jya
 TTsjo+JBEaGjiVaLwz8VV1ISSz9YO8wgYEdVnPffSad4wSjCUSgttWXySlCorXuLQa8rXX6+/
 v9fw7HRqzn5B6bTqHnxOPW+RTiIIZjgeDAQEQjRvNrGoZ34o6BXEbadTxQTXuz67YCjLk8G5E
 7j6Qq8jfeS1gDD18QBgle/gQ6Z8QGANgGBkKzvGE8rEhrkNWAHpnGX0e1roWE4Uw8LL9+0+jn
 QupvRxsakxkjOyGQb4mxpvui5Jw7RAfLMJvfUR3KCucReMqKhD+/pG5yWnuvkui5TFqC17BSS
 DuSGXSky/zRFs5TUYt9MEvmGDj1MnUHaYT3xEeeGA+LfucKD0X49x32vyokMGpIBuOAq0PV+4
 3SpSjEyflnJWEveOO/zfN0gl+auEfeeyCKM69mUk3xQ9yFnqs1PNwTlKMddFU+AjxUSeHYg3J
 IGKZ/xbtNIkTy9+16QQ6L0nmXE/hd34YTQaSaE/2MYha3hy+K/F3M4GaQh5HDfbVKEUVEgkM3
 I/oqpkR5iC02PvA5DlgMdtRlzo0uiv4T2LteGJoxnNLmGDw/hClmHlCDJfCLwcqj3BA8011w1
 RDogafKJpzg+g1cleMQUqQlTdEI4/dOcNnGd0rPC6toeT2p26BMe368q4aSCn3pvoQp1stzif
 x3+1NcGNSrmgHKyVKkw6l8r8Vp/mno8pOH7t4WxcxmDSMk9M7kTEQejojDWGP+ok3WuffwKIY
 plICUieMu3fQc4xOMWWclerl9+5K0BeD2LXTqxBjr3IQqgh9DkFV6tA+xtEf6p/3whNUgYR4X
 2JzxYtT0l3NvXzEPvHHMWONOIF5Qu9MpZ8eF2JMjaq7XBPpHPdshwfmFnO7b+vpphicUAuyJD
 SFxjpAFoQDmFIMUHFCIZR4eW/tw=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans,

On Fri, 31 Mar 2023 10:27:18 +0200, Hans Verkuil <hverkuil@xs4all.nl> wrot=
e:

> Hi Peter,
>
> On 30/03/2023 17:06, Peter Seiderer wrote:
> > Compiling for RPi4 (64-bit) using buildroot failes with the following
> > error:
> >
> >   .../host/bin/aarch64-buildroot-linux-gnu-g++ -DHAVE_CONFIG_H -I. -I.=
./.. -I../../utils/common -I.../aarch64-buildroot-linux-gnu/sysroot/usr/in=
clude/json-c -I../../lib/include -Wall -Wpointer-arith -D_GNU_SOURCE -I../=
../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=
=3D64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -=
Os -g0 -D_FORTIFY_SOURCE=3D1 -std=3Dgnu++11 -c libv4l2tracer.cpp  -fPIC -D=
PIC -o .libs/libv4l2tracer_la-libv4l2tracer.o
> >   /tmp/ccfbectY.s: Assembler messages:
> >   /tmp/ccfbectY.s:208: Error: symbol `open64' is already defined
> >   /tmp/ccfbectY.s:762: Error: symbol `mmap64' is already defined
> >
> > The preprocessor output shows:
> >
> >   [...]
> >   extern "C" {
> >   # 61 ".../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/sys/m=
man.h" 3 4
> >   extern void * mmap (void *__addr, size_t __len, int __prot, int __fl=
ags, int __fd, __off64_t __offset) noexcept (true) __asm__ ("" "mmap64");
> >   [...]
> >   extern void *mmap64 (void *__addr, size_t __len, int __prot,
> >          int __flags, int __fd, __off64_t __offset) noexcept (true);
> >
> > And host/aarch64-buildroot-linux-gnu/sysroot/usr/include/sys/mman.h:
> >
> >   56 #ifndef __USE_FILE_OFFSET64
> >   57 extern void *mmap (void *__addr, size_t __len, int __prot,
> >   58                    int __flags, int __fd, __off_t __offset) __THR=
OW;
> >   59 #else
> >   60 # ifdef __REDIRECT_NTH
> >   61 extern void * __REDIRECT_NTH (mmap,
> >   62                               (void *__addr, size_t __len, int __=
prot,
> >   63                                int __flags, int __fd, __off64_t _=
_offset),
> >   64                               mmap64);
> >   65 # else
> >   66 #  define mmap mmap64
> >   67 # endif
> >   68 #endif
> >   69 #ifdef __USE_LARGEFILE64
> >   70 extern void *mmap64 (void *__addr, size_t __len, int __prot,
> >   71                      int __flags, int __fd, __off64_t __offset) _=
_THROW;
> >   72 #endif
> >
> > Fix it by applying the same undef _LARGEFILE_SOURCE/_FILE_OFFSET_BITS,
> > define _LARGEFILE64_SOURCE as in as in lib/libv4l1/v4l1compat.c
>
> If I look at 'man feature_test_macros', then that man page suggests that
> _LARGEFILE64_SOURCE is out of date and instead you should use
> '#define _FILE_OFFSET_BITS 64'.
>
> Can you test that? If this works, then it should be applied to v4l1compa=
t.c
> as well.

Did you mean as utils/v4l2-tracer/meson.build all ready does:

 73 libv4l2_tracer_cpp_args =3D [
 74     # Meson enables large file support unconditionally, which redirect=
s file
 75     # operations to 64-bit versions. This results in some symbols bein=
g
 76     # renamed, for instance open() being renamed to open64(). As the l=
ibrary
 77     # needs to provide both 32-bit and 64-bit versions of file operati=
ons,
 78     # disable transparent large file support.
 79     '-U_FILE_OFFSET_BITS',
 80     '-D_FILE_OFFSET_BITS=3D32',
 81     '-D_LARGEFILE64_SOURCE',
 82 ]

Did my previous test against the 1.24.1 release using the autoconf/automak=
e
build system...

A quick (compile) test for lib/libv4l1/v4l1compat.c with

	#undef _FILE_OFFSET_BITS
	#define _FILE_OFFSET_BITS 32
	#define _LARGEFILE64_SOURCE 1

seems to work...

>
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Notes:
> >
> >   - maybe the 'defined(linux) && defined(__GLIBC__)' protection
> >     present in lib/libv4l1/v4l1compat.c for open64/mmap64 is needed
> >     for non glibc compiles of utils/v4l2-tracer/libv4l2tracer.cpp too?
>
> I think we need this too. If nothing else, it is consistent.

So this patch should be o.k. for the stable-1.24 branch?

Will send one adding the 'defined(linux) && defined(__GLIBC__)' to
v4l2-tracer and one changing the in-file undef/define to the
meson.build solution for lib/libv4l1/v4l1compat.c (in case this
is o.k. here)...

Regards,
Peter

>
> Regards,
>
> 	Hans
>
> > ---
> >  utils/v4l2-tracer/libv4l2tracer.cpp | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/utils/v4l2-tracer/libv4l2tracer.cpp b/utils/v4l2-tracer/l=
ibv4l2tracer.cpp
> > index a9f039c7..1e3900db 100644
> > --- a/utils/v4l2-tracer/libv4l2tracer.cpp
> > +++ b/utils/v4l2-tracer/libv4l2tracer.cpp
> > @@ -3,6 +3,11 @@
> >   * Copyright 2022 Collabora Ltd.
> >   */
> >
> > +/* ensure we see *64 variants and they aren't transparently used */
> > +#undef _LARGEFILE_SOURCE
> > +#undef _FILE_OFFSET_BITS
> > +#define _LARGEFILE64_SOURCE 1
> > +
> >  #include "trace.h"
> >  #include <dlfcn.h>
> >  #include <stdarg.h>
>

