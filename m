Return-Path: <linux-media+bounces-1540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA60803285
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6872D1F20FAD
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 12:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572E02377E;
	Mon,  4 Dec 2023 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net header.b="ToxjwWWi"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF1DC0
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 04:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1701692687; x=1702297487; i=ps.report@gmx.net;
	bh=OZ7kJe8lKmEcJAcHqIk021GudjAG6QM62VVv5r+NA5M=;
	h=X-UI-Sender-Class:Date:From:To:Subject:In-Reply-To:References;
	b=ToxjwWWikjEumiaXU7AAZPFnLEsr2KZ5doL7V+C/aJR3V2XIIA4ODu/z1V/UZUw3
	 17Dyalc7ZeqLtb8ap29lXZ9QxpH2Jx6FXbhlbnAXwwWflpzev2J+1HrH+EuzUr0FA
	 T+0IsdTi6i9EsGZsUSKaxqE/zqkr1jo55LHEFMAMBREdThWtRtnEgDeLfgcDep5PD
	 sKPCp9msAIcnHiPKr+AiAx/ljpaHVMfV1s2Vay3V6ZqbgANGpLD93QcoGLnd793Yi
	 Hv22S4SF2EI6pq8nKhJvwPxtJoOQaP2K3L6FIxqSEe/8vYrgUWlNnqnFWiYeXnTo1
	 HQQfBiZtkEYbSRe4TA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.4]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MI5QF-1r4x562Afn-00F8Tt for
 <linux-media@vger.kernel.org>; Mon, 04 Dec 2023 13:24:47 +0100
Date: Mon, 4 Dec 2023 13:24:46 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: linux-media@vger.kernel.org
Subject: Re: [PATCH v4l-utils v1 2/2] meson: v4l2grab needs libv4lconvert
 with fork support enabled
Message-ID: <20231204132446.3575d926@gmx.net>
In-Reply-To: <20231204091134.28481-2-ps.report@gmx.net>
References: <20231204091134.28481-1-ps.report@gmx.net>
	<20231204091134.28481-2-ps.report@gmx.net>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MoUeTYi7TXeG5s6G1giRK4eMN398VQs0o8+3nApqI7wQ73XHRWH
 l48/AOsezY3sn4hYLQFIhtV9lbUCEq1xIz+ytDUyEdVTOrwVJ/3EqP3R5XHKM9IwV+34frj
 KxrFhvdyaEmWpYxaFu2JPE1B27binv6lkLMx8+LzeaiiXqA2W0Tyasu3vTnXazq2JrX+gix
 +IBdP4aRsBL7gF7UXpVsw==
UI-OutboundReport: notjunk:1;M01:P0:VvuzbARr/5Q=;j9WyNmg0h3VOGFSEAdihPbUrw+n
 yzlUohCPfx9KIsNiGwEWhTLMA7lHzJZNMtH9arBSkewmPuBQi28fbwy9dQcLRKUKoJ1S/ZRHH
 nRPSwsXS3r+TqcCjOros+fOUNbmzkCf+HqSf+gN/REvtriR1/pXhlDIkugLgtY8nAtAs8kCnr
 bPRjwh6tly/qiQ6KBKDj7pRmig4F/eVSdrIEBejkxb6JCDS342F1DCbuuNzMLD4jvUGYn/TDR
 k4yuwFnc4yCXjf4lSoPw9W1G30wWWCRK/t9RidzkwJu+hn2AoP0kgq0f2eiXK7b5OXaaeeMnC
 1hEfargf4xJPqcc5z/otWaCXGs3p6JglKyq/Svxd865+RY/9eaIZPrOaTVs99Spr6n2UdO1Yx
 aHnvKSxqEj8IxfupFKlWSlYxMhuZCuXIwcP6r1LfRJNBeQQseAjqar5uEO+eYzjAoernY7aot
 VSXq9Ipcz0ypCZDagbnymAIJknCh9NL8hcQK3dUttZLImYifdfkgAP0cJ2rgAmXAjLfn3GNmW
 8g93gUxKtMeQAIZjRsMITJY+mE7wMqmJSShCuxCXoS2eMVjNuxrvCkYkZrRfsWIFoIePfpaBo
 uL3CsNxfl+JkclV5AKk9NdKebs7RoYdaNOnG7gGpxY0E+8inmvqiq8/I0lLANmw/5JwwRSr4m
 AI8RgTOoxgBNF/K68QX3VYe8FDnuAXZZK4m2tPUaZKqwh/Vozj2gWBGOrvuKDFQYcIgFCLTRT
 kDnEDZdvbH6nEFh/MENfgYTeM5w5LvDxTRO1VBwwCrRVbVlh+4T3HKEvR3KqnFZFsSnCj3nng
 JM5qeK2ofTdyWQ+WuUklU1Uc+XEE++6jDJwUmF8xyHuT7a0QGRrgQIbt/ZLhyh21tVy+t/NIY
 7QlV/I31r+mkYubK/mwm2G6l7q065zo4sUWHGF3j+41kDuazDizHz2f8w3y4mi7ykPzzdI/9J
 4oTZQjkaj4puHMkf2z50ESPVQXU=

Hello *,

On Mon,  4 Dec 2023 10:11:34 +0100, Peter Seiderer <ps.report@gmx.net> wro=
te:

> - v4l2grab needs libv4lconvert with fork support enabled
>
> Fixes:
>
>   FAILED: contrib/test/v4l2grab
>   .../bootlin-armv7m-uclibc/host/bin/arm-linux-gcc  -o contrib/test/v4l2=
grab contrib/test/v4l2grab.p/v4l2grab.c.o -Wl,--as-needed -Wl,--no-undefin=
ed -Wl,-O1 -Wl,-elf2flt=3D-r -static -Wl,--start-group lib/libv4l2/libv4l2=
.a lib/libv4lconvert/libv4lconvert.a -largp -pthread -ldl -lm -lrt -Wl,--e=
nd-group
>   .../bootlin-armv7m-uclibc/host/opt/ext-toolchain/arm-buildroot-uclinux=
-uclibcgnueabi/bin/ld.real: lib/libv4lconvert/libv4lconvert.a(libv4lconver=
t.c.o): in function `v4lconvert_destroy':
>   libv4lconvert.c:(.text+0x5c0): undefined reference to `v4lconvert_help=
er_cleanup'
>   .../bootlin-armv7m-uclibc/host/opt/ext-toolchain/arm-buildroot-uclinux=
-uclibcgnueabi/bin/ld.real: lib/libv4lconvert/libv4lconvert.a(libv4lconver=
t.c.o): in function `v4lconvert_convert_pixfmt':
>   libv4lconvert.c:(.text+0x1450): undefined reference to `v4lconvert_hel=
per_decompress'
>   collect2: error: ld returned 1 exit status
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>   - patch is more or less a quick work around, maybe an better handling
>     of the no-fork-case in libv4lconvert (without v4lconvert_helper_clea=
nup,
>     v4lconvert_helper_decompress, etc. as they depend on have_fork, see
>     lib/libv4lconvert/meson.build and conditional helper.c compile)
>     is possible???

Did find a more suitable solution (?):

diff --git a/lib/libv4lconvert/meson.build b/lib/libv4lconvert/meson.build
index 38740755..4bda5671 100644
=2D-- a/lib/libv4lconvert/meson.build
+++ b/lib/libv4lconvert/meson.build
@@ -91,7 +91,7 @@ if have_fork
                               include_directories : v4l2_utils_incdir)
 endif

-if have_visibility
+if have_visibility and have_fork
     libv4lconvert_c_args +=3D [
       '-fvisibility=3Dhidden',
       '-DHAVE_LIBV4LCONVERT_HELPERS',


Will provide an updated patch (or follow up patch as this one is already a=
pplied to
git master) soon...

Regards,
Peter

> ---
>  contrib/test/meson.build | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/contrib/test/meson.build b/contrib/test/meson.build
> index 29b51df6..c1f40354 100644
> --- a/contrib/test/meson.build
> +++ b/contrib/test/meson.build
> @@ -25,6 +25,7 @@ sliced_vbi_detect =3D executable('sliced-vbi-detect',
>                                 sliced_vbi_detect_sources,
>                                 include_directories : v4l2_utils_incdir)
>
> +if have_fork
>  v4l2grab_sources =3D files(
>      'v4l2grab.c',
>
> @@ -41,6 +42,7 @@ v4l2grab =3D executable('v4l2grab',
>                        v4l2grab_sources,
>                        dependencies : v4l2grab_deps,
>                        include_directories : v4l2_utils_incdir)
> +endif
>
>  driver_test_sources =3D files(
>      'driver-test.c',


