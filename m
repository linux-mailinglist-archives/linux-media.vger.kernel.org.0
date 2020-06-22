Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0C1203E20
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 19:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729886AbgFVRhP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 13:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729857AbgFVRhO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 13:37:14 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 988A1C061573
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 10:37:14 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id p5so16714106ile.6
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2020 10:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NPM7C3eTtN05iEnfJCdqDlBcs/PDLlz4BjRJFo0Njts=;
        b=Rt6cI/MIEvrNpnjvD5xjNHUyXJOP236CO093WJrWefaWXXsH94r89DCKeO9uXlZ3jQ
         RUhLRYTmJK72pp6JTKA8IHmw6qQxIjQJKtnC5so1Qdvc0cobLuNww0j4tiLWfpHBy82I
         a0337UIg+VMEwLJto7d8VyaiMK+vLh1p/HAxo/XnV2AWiJrDeqDrjbBgZX+qdCJbSnvP
         jZvllSa+KR8TQbQiQNKCSRwkCb80v3Zh3AsgVtTJY/ugOTifg8vXMPgzeTQDhsCmzoSS
         UUpXRSTbjiXiLFoNnNjxuYoaoTtUTxiQetI34TtGRh63sfKHkLbB/ZVwk2+diSVbq7q2
         RE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NPM7C3eTtN05iEnfJCdqDlBcs/PDLlz4BjRJFo0Njts=;
        b=ZumZvkyPIVY/bdmXpWgfWBy5AOR8i1mUrSwqzuedvW6xyE+lUeJ0NM/2EjnBRFwe4y
         IwGs7n8Dai7SB3J39tkcgTeKGs5kAvbC6X0K3tnrWNoMJ/2Ycm2jAlXBVSfJzk6hYUpG
         LTqWgLH7eSXpUn02dmWFLTuAZfQkbz43xwYAwwaCIjtZi455k6yl+kCJhmdbr81valMF
         4aTFpODZuF+ceOgs3EdYBwcTkWZ8eV3yeo2Fz7DD8thr76utR87788j24ane6W9JA+ki
         TK5hRkkubYV7xmBzZXgA7i1kd5yWxFPRCdl5lY98H39fF3UPonOkBvmSkCnL6d8RVKui
         9SjQ==
X-Gm-Message-State: AOAM531oYvMEwYw23eEd2GAq3AEpZHKU9JaMBH0Xoc0l8QlD4AXWQvih
        1xSs94pNi5r5qxixYwk2jsSIhzzNo8kq0M4eTtaXLKayvAKt/Q==
X-Google-Smtp-Source: ABdhPJxhNHgo/4nX2eJwOo/7atXBsTLkm+R8zSIEf4dJO3QYSuf6kCYimMLrHSqUjRqRjtEPRql+VQWIyln/AszHzHc=
X-Received: by 2002:a92:c9c5:: with SMTP id k5mr19591595ilq.259.1592847433788;
 Mon, 22 Jun 2020 10:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200620100853.GA4377@gofer.mess.org>
In-Reply-To: <20200620100853.GA4377@gofer.mess.org>
From:   "Ariel D'Alessandro" <ariel@vanguardiasur.com.ar>
Date:   Mon, 22 Jun 2020 14:37:11 -0300
Message-ID: <CADutaf2PKF6xnmjKeRSnw-az=cPNQmRyyTXVcrPUJtsNxz=8sA@mail.gmail.com>
Subject: Re: [PATCH v4l-utils] Move sync-with-kernel into dedicated shell
 script ./sync-with-kernel.sh
To:     Sean Young <sean@mess.org>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Gregor Jasny <gjasny@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

Great! Thanks for picking this up so quickly. A few comments below.

On Sat, Jun 20, 2020 at 7:08 AM Sean Young <sean@mess.org> wrote:
>
> The sync-with-kernel target is a collection of shell fragments scattered
> over the tree. Collect all of them into a single shell script. This makes
> it is easier to see what sync-with-kernel does, and makes the move away
> from autotools to meson easier.
>
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  Makefile.am                         |  59 +--------------
>  README                              |   4 +-
>  contrib/freebsd/Makefile.am         |  14 ----
>  contrib/test/Makefile.am            |   9 ---
>  contrib/test/gen_ioctl_list.pl      |   2 +-
>  contrib/test/ioctl-test.h           |   2 +-
>  contrib/xc3028-firmware/Makefile.am |   9 ---
>  lib/libdvbv5/Makefile.am            |   3 -
>  sync-with-kernel.sh                 | 113 ++++++++++++++++++++++++++++
>  utils/keytable/Makefile.am          |  13 ----
>  10 files changed, 121 insertions(+), 107 deletions(-)
>  create mode 100755 sync-with-kernel.sh
>
> diff --git a/Makefile.am b/Makefile.am
> index 3c3d3ce6..3c0ceb49 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -7,60 +7,9 @@ if WITH_V4LUTILS
>  SUBDIRS +=3D utils contrib
>  endif
>
> -EXTRA_DIST =3D android-config.h bootstrap.sh doxygen_libdvbv5.cfg includ=
e COPYING.libv4l \
> -        COPYING.libdvbv5 README.libv4l README.lib-multi-threading TODO.l=
ibdvbv5 \
> -        doc/libdvbv5-index.doc
> +EXTRA_DIST =3D android-config.h sync-with-kernel.sh bootstrap.sh \
> +       doxygen_libdvbv5.cfg include COPYING.libv4l \
> +       COPYING.libdvbv5 README.libv4l README.lib-multi-threading \
> +       TODO.libdvbv5 doc/libdvbv5-index.doc
>
>  include $(top_srcdir)/aminclude.am
> -
> -# custom targets
> -
> -sync-with-kernel:
> -       @if [ ! -f $(KERNEL_DIR)/usr/include/linux/videodev2.h -o \
> -             ! -f $(KERNEL_DIR)/usr/include/linux/fb.h -o \
> -             ! -f $(KERNEL_DIR)/usr/include/linux/v4l2-controls.h -o \
> -             ! -f $(KERNEL_DIR)/usr/include/linux/v4l2-common.h -o \
> -             ! -f $(KERNEL_DIR)/usr/include/linux/v4l2-subdev.h -o \
> -             ! -f $(KERNEL_DIR)/usr/include/linux/v4l2-mediabus.h -o \
> -             ! -f $(KERNEL_DIR)/usr/include/linux/ivtv.h -o \
> -             ! -f $(KERNEL_DIR)/usr/include/linux/dvb/frontend.h -o \
> -             ! -f $(KERNEL_DIR)/usr/include/linux/dvb/dmx.h -o \
> -             ! -f $(KERNEL_DIR)/usr/include/linux/lirc.h -o \
> -             ! -f $(KERNEL_DIR)/usr/include/linux/bpf.h -o \
> -             ! -f $(KERNEL_DIR)/usr/include/linux/bpf_common.h ]; then \
> -         echo "Error you must set KERNEL_DIR to point to an extracted ke=
rnel source dir"; \
> -         echo "and run 'make headers_install' in \$$KERNEL_DIR."; \
> -         exit 1; \
> -       fi
> -       cp -a $(KERNEL_DIR)/usr/include/linux/videodev2.h $(top_srcdir)/i=
nclude/linux
> -       cp -a $(KERNEL_DIR)/usr/include/linux/fb.h $(top_srcdir)/include/=
linux
> -       cp -a $(KERNEL_DIR)/usr/include/linux/v4l2-controls.h $(top_srcdi=
r)/include/linux
> -       cp -a $(KERNEL_DIR)/usr/include/linux/v4l2-common.h $(top_srcdir)=
/include/linux
> -       cp -a $(KERNEL_DIR)/usr/include/linux/v4l2-subdev.h $(top_srcdir)=
/include/linux
> -       cp -a $(KERNEL_DIR)/usr/include/linux/v4l2-mediabus.h $(top_srcdi=
r)/include/linux
> -       cp -a $(KERNEL_DIR)/usr/include/linux/media-bus-format.h $(top_sr=
cdir)/include/linux
> -       cp -a $(KERNEL_DIR)/usr/include/linux/media.h $(top_srcdir)/inclu=
de/linux
> -       cp -a $(KERNEL_DIR)/usr/include/linux/ivtv.h $(top_srcdir)/includ=
e/linux
> -       cp -a $(KERNEL_DIR)/usr/include/linux/dvb/frontend.h $(top_srcdir=
)/include/linux/dvb
> -       cp $(top_srcdir)/include/linux/dvb/frontend.h $(top_srcdir)/lib/i=
nclude/libdvbv5/dvb-frontend.h
> -       cp -a $(KERNEL_DIR)/usr/include/linux/dvb/dmx.h $(top_srcdir)/inc=
lude/linux/dvb
> -       cp -a $(KERNEL_DIR)/usr/include/linux/lirc.h $(top_srcdir)/includ=
e/linux
> -       cp -a $(KERNEL_DIR)/usr/include/linux/bpf.h $(top_srcdir)/include=
/linux
> -       cp -a $(KERNEL_DIR)/usr/include/linux/bpf_common.h $(top_srcdir)/=
include/linux
> -       cp -a $(KERNEL_DIR)/usr/include/linux/cec.h $(top_srcdir)/include=
/linux
> -       cp -a $(KERNEL_DIR)/usr/include/linux/cec-funcs.h $(top_srcdir)/i=
nclude/linux
> -       cp -a $(KERNEL_DIR)/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c=
 $(top_srcdir)/utils/common
> -       cp -a $(KERNEL_DIR)/drivers/media/common/v4l2-tpg/v4l2-tpg-colors=
.c $(top_srcdir)/utils/common
> -       cp -a $(KERNEL_DIR)/include/media/tpg/v4l2-tpg.h $(top_srcdir)/ut=
ils/common
> -       cp -a $(KERNEL_DIR)/include/media/fwht-ctrls.h $(top_srcdir)/util=
s/common
> -       patch -d $(top_srcdir) --no-backup-if-mismatch -p0 <$(top_srcdir)=
/utils/common/v4l2-tpg.patch
> -       cp -a $(KERNEL_DIR)/drivers/media/test-drivers/vicodec/codec-fwht=
.[ch] $(top_srcdir)/utils/common/
> -       cp -a $(KERNEL_DIR)/drivers/media/test-drivers/vicodec/codec-v4l2=
-fwht.[ch] $(top_srcdir)/utils/common/
> -       patch -d $(top_srcdir) --no-backup-if-mismatch -p1 <$(top_srcdir)=
/utils/common/codec-fwht.patch
> -       grep V4L2_.*_FMT.*descr $(KERNEL_DIR)/drivers/media/v4l2-core/v4l=
2-ioctl.c | grep -v V4L2_PIX_FMT_H264_SLICE | grep -v V4L2_PIX_FMT_VP8_FRAM=
E | grep -v V4L2_PIX_FMT_HEVC_SLICE | perl -pe 's/.*V4L2_(.*)_FMT/\tcase V4=
L2_\1_FMT/; s/:.*descr =3D /: return /; s/;.*/;/;' >$(top_srcdir)/utils/com=
mon/v4l2-pix-formats.h
> -
> -       $(MAKE) -C utils/keytable $@
> -       $(MAKE) -C lib/libdvbv5 $@
> -       $(MAKE) -C contrib/freebsd $@
> -       $(MAKE) -C contrib/test $@
> -       $(MAKE) -C contrib/xc3028-firmware $@
> diff --git a/README b/README
> index e344dee1..48b33713 100644
> --- a/README
> +++ b/README
> @@ -264,11 +264,11 @@ Be sure that you have installed both glibc developm=
ent packages for
>
>  step 3) at v4l-utils tree:
>
> -       $ export KERNEL_DIR=3Dlocation/of/the/kernel/tree make sync-with-=
kernel
> +       $ export KERNEL_DIR=3Dlocation/of/the/kernel/tree ./sync-with-ker=
nel.sh
>
>  Alternatively, steps 1 to 3 can be replaced with:
>
> -export KERNEL_DIR=3Dlocation/of/the/kernel/tree && (cd $KERNEL_DIR && ma=
ke headers_install INSTALL_HDR_PATH=3Dusr/) && make sync-with-kernel
> +export KERNEL_DIR=3Dlocation/of/the/kernel/tree && (cd $KERNEL_DIR && ma=
ke headers_install INSTALL_HDR_PATH=3Dusr/) && ./sync-with-kernel.sh
>
>  step 4)
>
> diff --git a/contrib/freebsd/Makefile.am b/contrib/freebsd/Makefile.am
> index ca322749..abf0d57b 100644
> --- a/contrib/freebsd/Makefile.am
> +++ b/contrib/freebsd/Makefile.am
> @@ -1,17 +1,3 @@
>  EXTRA_DIST =3D \
>         include \
>         patches
> -
> -sync-with-kernel:
> -       rm -rf .pc
> -
> -       for i in input.h input-event-codes.h ivtv.h uinput.h videodev2.h =
v4l2-controls.h v4l2-common.h; do \
> -           mkdir -p include/linux/$$(dirname $$i); \
> -           cp $(KERNEL_DIR)/usr/include/linux/$$i include/linux/$$i; \
> -       done
> -
> -       for i in ivtv.h uinput.h videodev2.h v4l2-common.h; do \
> -           sed -e 's/__u8/uint8_t/g' -e 's/__u16/uint16_t/g' -e 's/__u32=
/uint32_t/g' -e 's/__u64/uint64_t/g' -e 's/__s8/int8_t/g' -e 's/__s16/int16=
_t/g' -e 's/__s32/int32_t/g' -e 's/__s64/int64_t/g' -e 's/__le32/uint32_t/g=
' -e 's/__user//g' -i include/linux/$$i; \
> -       done
> -
> -       quilt push -a
> diff --git a/contrib/test/Makefile.am b/contrib/test/Makefile.am
> index ded3c1f4..6650cd27 100644
> --- a/contrib/test/Makefile.am
> +++ b/contrib/test/Makefile.am
> @@ -57,15 +57,6 @@ capture_example_SOURCES =3D capture-example.c
>
>  ioctl-test.c: ioctl-test.h
>
> -sync-with-kernel:
> -       ./gen_ioctl_list.pl --gen_ioctl_numbers >.tmp_ioctl.c
> -       gcc -I ../../include/ .tmp_ioctl.c -o tmp_ioctl32 -m32
> -       gcc -I ../../include/ .tmp_ioctl.c -o tmp_ioctl64 -m64
> -       ./tmp_ioctl32 32 >ioctl_32.h
> -       ./tmp_ioctl64 64 >ioctl_64.h
> -       rm .tmp_ioctl.c tmp_ioctl32 tmp_ioctl64
> -       ./gen_ioctl_list.pl >ioctl-test.h
> -
>  EXTRA_DIST =3D \
>         gen_ioctl_list.pl \
>         test-media \
> diff --git a/contrib/test/gen_ioctl_list.pl b/contrib/test/gen_ioctl_list=
.pl
> index fca51778..82168b39 100755
> --- a/contrib/test/gen_ioctl_list.pl
> +++ b/contrib/test/gen_ioctl_list.pl
> @@ -69,7 +69,7 @@ sub print_ioc()
>         printf "#define S_IOCTLS sizeof(ioctls)/sizeof(ioctls[0])\n";
>  }
>
> -printf "/* This file is auto-generated by make sync-with-kernel */\n";
> +printf "/* This file is auto-generated by sync-with-kernel.sh */\n";
>  printf "#include <linux/compiler.h>\n";
>
>  foreach my $h (sort keys %headers) {
> diff --git a/contrib/test/ioctl-test.h b/contrib/test/ioctl-test.h
> index 32084c52..03b53078 100644
> --- a/contrib/test/ioctl-test.h
> +++ b/contrib/test/ioctl-test.h
> @@ -1,4 +1,4 @@
> -/* This file is auto-generated by make sync-with-kernel */
> +/* This file is auto-generated by sync-with-kernel.sh */
>  #include <linux/compiler.h>
>  #include "linux/dvb/dmx.h"
>  #include "linux/dvb/frontend.h"
> diff --git a/contrib/xc3028-firmware/Makefile.am b/contrib/xc3028-firmwar=
e/Makefile.am
> index 43ff8b12..8b23d1e1 100644
> --- a/contrib/xc3028-firmware/Makefile.am
> +++ b/contrib/xc3028-firmware/Makefile.am
> @@ -3,12 +3,3 @@ noinst_PROGRAMS =3D firmware-tool
>  firmware_tool_SOURCES =3D firmware-tool.c standards.c extract_head.h sta=
ndards.h tuner-xc2028-types.h
>
>  EXTRA_DIST =3D README
> -
> -# custom targets
> -
> -sync-with-kernel:
> -       @if [ ! -f $(KERNEL_DIR)/drivers/media/tuners/tuner-xc2028-types.=
h ]; then \
> -         echo "Error you must set KERNEL_DIR to point to an extracted ke=
rnel source dir"; \
> -         exit 1; \
> -       fi

Note that sync-with-kernel.sh script is not checking for the above file any=
more.

> -       cp -a $(KERNEL_DIR)/drivers/media/tuners/tuner-xc2028-types.h $(s=
rcdir)/
> diff --git a/lib/libdvbv5/Makefile.am b/lib/libdvbv5/Makefile.am
> index e65066e9..09c261be 100644
> --- a/lib/libdvbv5/Makefile.am
> +++ b/lib/libdvbv5/Makefile.am
> @@ -122,6 +122,3 @@ libdvbv5_la_LDFLAGS =3D $(LIBDVBV5_VERSION) $(ENFORCE=
_LIBDVBV5_STATIC) $(LIBUDEV_L
>  libdvbv5_la_LIBADD =3D $(LTLIBICONV)
>
>  EXTRA_DIST =3D README gen_dvb_structs.pl
> -
> -sync-with-kernel:
> -       ./gen_dvb_structs.pl $(KERNEL_DIR)/usr/include/
> diff --git a/sync-with-kernel.sh b/sync-with-kernel.sh
> new file mode 100755
> index 00000000..ab15cb8a
> --- /dev/null
> +++ b/sync-with-kernel.sh
> @@ -0,0 +1,113 @@
> +#!/bin/bash
> +
> +TOPSRCDIR=3D"$( cd "$( dirname "$0" )" && pwd )"
> +
> +if [ -z "${KERNEL_DIR}" -o \
> +     ! -f ${KERNEL_DIR}/usr/include/linux/videodev2.h -o \
> +     ! -f ${KERNEL_DIR}/usr/include/linux/fb.h -o \
> +     ! -f ${KERNEL_DIR}/usr/include/linux/v4l2-controls.h -o \
> +     ! -f ${KERNEL_DIR}/usr/include/linux/v4l2-common.h -o \
> +     ! -f ${KERNEL_DIR}/usr/include/linux/v4l2-subdev.h -o \
> +     ! -f ${KERNEL_DIR}/usr/include/linux/v4l2-mediabus.h -o \
> +     ! -f ${KERNEL_DIR}/usr/include/linux/ivtv.h -o \
> +     ! -f ${KERNEL_DIR}/usr/include/linux/dvb/frontend.h -o \
> +     ! -f ${KERNEL_DIR}/usr/include/linux/dvb/dmx.h -o \
> +     ! -f ${KERNEL_DIR}/usr/include/linux/lirc.h -o \
> +     ! -f ${KERNEL_DIR}/usr/include/linux/bpf.h -o \
> +     ! -f ${KERNEL_DIR}/usr/include/linux/bpf_common.h ]; then
> +  echo "Error you must set KERNEL_DIR to point to an extracted kernel so=
urce dir"
> +  echo "and run 'make headers_install' in \$KERNEL_DIR."
> +  exit 1
> +fi
> +
> +cp -a ${KERNEL_DIR}/usr/include/linux/videodev2.h ${TOPSRCDIR}/include/l=
inux
> +cp -a ${KERNEL_DIR}/usr/include/linux/fb.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/v4l2-controls.h ${TOPSRCDIR}/inclu=
de/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/v4l2-common.h ${TOPSRCDIR}/include=
/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/v4l2-subdev.h ${TOPSRCDIR}/include=
/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/v4l2-mediabus.h ${TOPSRCDIR}/inclu=
de/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/media-bus-format.h ${TOPSRCDIR}/in=
clude/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/media.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/ivtv.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/dvb/frontend.h ${TOPSRCDIR}/includ=
e/linux/dvb
> +cp ${TOPSRCDIR}/include/linux/dvb/frontend.h ${TOPSRCDIR}/lib/include/li=
bdvbv5/dvb-frontend.h
> +cp -a ${KERNEL_DIR}/usr/include/linux/dvb/dmx.h ${TOPSRCDIR}/include/lin=
ux/dvb
> +cp -a ${KERNEL_DIR}/usr/include/linux/lirc.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/bpf.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/bpf_common.h ${TOPSRCDIR}/include/=
linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/cec.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/cec-funcs.h ${TOPSRCDIR}/include/l=
inux
> +cp -a ${KERNEL_DIR}/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c ${TOPS=
RCDIR}/utils/common
> +cp -a ${KERNEL_DIR}/drivers/media/common/v4l2-tpg/v4l2-tpg-colors.c ${TO=
PSRCDIR}/utils/common
> +cp -a ${KERNEL_DIR}/include/media/tpg/v4l2-tpg.h ${TOPSRCDIR}/utils/comm=
on
> +cp -a ${KERNEL_DIR}/include/media/fwht-ctrls.h ${TOPSRCDIR}/utils/common
> +patch -d ${TOPSRCDIR} --no-backup-if-mismatch -p0 <${TOPSRCDIR}/utils/co=
mmon/v4l2-tpg.patch
> +cp -a ${KERNEL_DIR}/drivers/media/test-drivers/vicodec/codec-fwht.[ch] $=
{TOPSRCDIR}/utils/common/
> +cp -a ${KERNEL_DIR}/drivers/media/test-drivers/vicodec/codec-v4l2-fwht.[=
ch] ${TOPSRCDIR}/utils/common/
> +patch -d ${TOPSRCDIR} --no-backup-if-mismatch -p1 <${TOPSRCDIR}/utils/co=
mmon/codec-fwht.patch
> +grep V4L2_.*_FMT.*descr ${KERNEL_DIR}/drivers/media/v4l2-core/v4l2-ioctl=
.c | grep -v V4L2_PIX_FMT_H264_SLICE | grep -v V4L2_PIX_FMT_VP8_FRAME | gre=
p -v V4L2_PIX_FMT_HEVC_SLICE | perl -pe 's/.*V4L2_(.*)_FMT/\tcase V4L2_\1_F=
MT/; s/:.*descr =3D /: return /; s/;.*/;/;' >${TOPSRCDIR}/utils/common/v4l2=
-pix-formats.h
> +
> +function keytable {
> +       SRCDIR=3D${TOPSRCDIR}/utils/keytable
> +
> +       cd ${SRCDIR}
> +       echo generating ${SRCDIR}/parse.h
> +       ./gen_input_events.pl < ${KERNEL_DIR}/usr/include/linux/input-eve=
nt-codes.h  > ${SRCDIR}/parse.h
> +       mkdir -p ${SRCDIR}/rc_keymaps
> +       rm -f ${SRCDIR}/rc_keymaps/*
> +       echo storing existing keymaps at ${SRCDIR}/rc_keymaps/
> +       ./gen_keytables.pl ${KERNEL_DIR};
> +       cp ${SRCDIR}/rc_keymaps_userspace/* ${SRCDIR}/rc_keymaps/
> +}
> +
> +function libdvbv5 {
> +       SRCDIR=3D${TOPSRCDIR}/lib/libdvbv5
> +
> +       cd ${SRCDIR}
> +       ./gen_dvb_structs.pl ${KERNEL_DIR}/usr/include/
> +}
> +
> +function freebsd {
> +       SRCDIR=3D${TOPSRCDIR}/contrib/freebsd
> +
> +       cp -a ${KERNEL_DIR}/drivers/media/tuners/tuner-xc2028-types.h ${S=
RCDIR}/
> +}
> +
> +function ioctl-test {
> +       SRCDIR=3D${TOPSRCDIR}/contrib/test
> +
> +       cd ${SRCDIR}
> +
> +       ./gen_ioctl_list.pl --gen_ioctl_numbers >.tmp_ioctl.c
> +       gcc -I ../../include/ .tmp_ioctl.c -o tmp_ioctl32 -m32
> +       gcc -I ../../include/ .tmp_ioctl.c -o tmp_ioctl64 -m64
> +       ./tmp_ioctl32 32 >ioctl_32.h
> +       ./tmp_ioctl64 64 >ioctl_64.h
> +       rm .tmp_ioctl.c tmp_ioctl32 tmp_ioctl64
> +       ./gen_ioctl_list.pl >ioctl-test.h
> +}
> +
> +function xc3028-firmware {
> +       SRCDIR=3D${TOPSRCDIR}/contrib/xc3028-firmware
> +
> +       cd ${SRCDIR}
> +
> +       rm -rf .pc
> +
> +       for i in input.h input-event-codes.h ivtv.h uinput.h videodev2.h =
v4l2-controls.h v4l2-common.h; do
> +           mkdir -p include/linux/$(dirname $i)
> +           cp ${KERNEL_DIR}/usr/include/linux/$i include/linux/$i
> +       done
> +
> +       for i in ivtv.h uinput.h videodev2.h v4l2-common.h; do
> +           sed -e 's/__u8/uint8_t/g' -e 's/__u16/uint16_t/g' -e 's/__u32=
/uint32_t/g' -e 's/__u64/uint64_t/g' -e 's/__s8/int8_t/g' -e 's/__s16/int16=
_t/g' -e 's/__s32/int32_t/g' -e 's/__s64/int64_t/g' -e 's/__le32/uint32_t/g=
' -e 's/__user//g' -i include/linux/$i
> +       done
> +
> +       quilt push -a
> +}

Functions freebsd and xc3028-firmware seem to be swapped.

> +
> +keytable
> +libdvbv5
> +freebsd
> +ioctl-test
> +xc3028-firmware

In the above script, I'd choose using spaces or tabs for indentation.
There's a mixing of both right now.

> diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
> index 4724897e..a057eb89 100644
> --- a/utils/keytable/Makefile.am
> +++ b/utils/keytable/Makefile.am
> @@ -29,16 +29,3 @@ check:
>  # custom target
>  install-data-local:
>         $(install_sh) -d "$(DESTDIR)$(keytableuserdir)"
> -
> -sync-with-kernel:
> -       @if [ ! -f $(KERNEL_DIR)/usr/include/linux/input-event-codes.h ];=
 then \
> -         echo "Error you must set KERNEL_DIR to point to an extracted ke=
rnel source dir"; \
> -         exit 1; \
> -       fi

Same as before, sync-with-kernel.sh script is not checking for the
above file anymore.

> -       @echo generating $(srcdir)/parse.h
> -       @./gen_input_events.pl < $(KERNEL_DIR)/usr/include/linux/input-ev=
ent-codes.h  > $(srcdir)/parse.h
> -       @-mkdir -p $(srcdir)/rc_keymaps
> -       @-rm $(srcdir)/rc_keymaps/*
> -       @echo storing existing keymaps at $(srcdir)/rc_keymaps/
> -       @cd $(srcdir) && ./gen_keytables.pl $(KERNEL_DIR);
> -       @-cp $(srcdir)/rc_keymaps_userspace/* $(srcdir)/rc_keymaps/
> --
> 2.26.2
>

Being pedantic, there are a few more occurrences of `make
sync-with-kernel` that should be changed to `sync-with-kernel.sh`.

$ git grep "sync-with-kernel[^\.]" -- ':^ChangeLog'
    configure.ac:# sync-with-kernel and keytable install could make use of =
them
    contrib/test/gen_ioctl_list.pl: printf "\tprintf(\"/* This file is
auto-generated by make sync-with-kernel */\\n\\n\");\n";
    contrib/test/ioctl_32.h:/* This file is auto-generated by make
sync-with-kernel */
    contrib/test/ioctl_64.h:/* This file is auto-generated by make
sync-with-kernel */

Thanks again!
Ariel D'Alessandro
