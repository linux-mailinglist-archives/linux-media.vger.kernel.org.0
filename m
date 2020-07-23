Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C072C22B1D7
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 16:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbgGWOwh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 10:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgGWOwh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 10:52:37 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 076C7C0619DC
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2020 07:52:37 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id d27so4573473qtg.4
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2020 07:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=667OVqTdBPL3+aQGX8O77abepTaUwtR2JbP4eAx1Ruk=;
        b=F/t5lFqu5yc8rrtoEGHHiCLOeWZ+70ipuIl+6YEA/Fbcr6juaXxS26J3kqSRTxffmM
         QbxC3aIs+oq9jmTyh6tb3e+ffzBPGewlApFXFm4tYWfrywcssBmKKhR+Kmk/vbFQsQDC
         XlbTnMIC4zUwY+GSoiacHiKwOmkj6d2ONie9Pc2YG15RmV5Ttqg2qwDNIqRPdm1iC66d
         MQU71sz7TzBvTroplr+9GiR+ebOyecYc3vQNadiPoMvSOWucW/F4a9D/fJRoWe5awVjO
         REBILBfSVFjILFQlO72uOoSlCoRc5n3MSW5TU4w5NVowMPwiWZ7PqznxwtmssCWO0O8H
         Ep+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=667OVqTdBPL3+aQGX8O77abepTaUwtR2JbP4eAx1Ruk=;
        b=paMO73/A0lsqQMYUfl/TdMkWiRub0IM9gAqEmHENLIXzHQLwrd3FDnedfeer+jVteL
         4q8kpoAfAnhKe+ZWAKjYksBwEg8PNSBt9UKjKLa0Z+b5Gl+i1capzgHzyPMC/s9bD6Si
         O8CxJBcdRzf7P25L3/0MZr2LOoPuh2nXuuc724wvZNgFmQwNnL9Y7duJT4OZpsbaCtwW
         CQHs+6PVuWVUPnOpRWWOXhVU5wgqzws0ubwpdbmg+GVbkXvji8YttvocJURjvtxW7gto
         eHOIGH/WumOYOXjW+ipFiuFF21+asWlyaE/xoRnQ892bheIjy23nCgKKifEHB/10SJOs
         ppyw==
X-Gm-Message-State: AOAM531TIRJzaVUaYDl0avGwPFvkDlVh51cpa7MoQUidCEbmZ/8v/F+h
        0qkuyfkc0aJhjnxefZ9np8xY/Q==
X-Google-Smtp-Source: ABdhPJzFPWZ33aCMl/hnpju+nZ6nDW5atXI9jtKp5RARo7q6pgK5Kl0gTrZVjTfHhZX80FbQTrHL3Q==
X-Received: by 2002:ac8:3fcf:: with SMTP id v15mr4747782qtk.274.1595515955910;
        Thu, 23 Jul 2020 07:52:35 -0700 (PDT)
Received: from [192.168.0.102] ([186.136.155.69])
        by smtp.gmail.com with ESMTPSA id o37sm2961877qte.9.2020.07.23.07.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 07:52:34 -0700 (PDT)
Subject: Re: [PATCH v4l-utils v2] Move sync-with-kernel make target into
 dedicated shell script ./sync-with-kernel.sh
To:     Sean Young <sean@mess.org>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Gregor Jasny <gjasny@googlemail.com>
References: <20200722203217.GA720@gofer.mess.org>
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Message-ID: <8e64a383-10bf-c876-a8dc-d01aaaf504f1@vanguardiasur.com.ar>
Date:   Thu, 23 Jul 2020 11:52:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200722203217.GA720@gofer.mess.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

Patch looks good to me.

Reviewed-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>

Thanks,
Ariel

On 7/22/20 5:32 PM, Sean Young wrote:
> The sync-with-kernel make target is a collection of shell fragments scattered
> over the tree. Collect all of them into a single shell script. This makes
> it is easier to see what sync-with-kernel does, and makes the move away
> from autotools to meson easier.
> 
> Signed-off-by: Sean Young <sean@mess.org>
> ---
> Changes since v2:
>  - Implemented review changes
>  - Updated to latest master
> 
> ---
>  Makefile.am                         |  58 +-------------
>  README                              |   4 +-
>  configure.ac                        |   2 +-
>  contrib/freebsd/Makefile.am         |  14 ----
>  contrib/test/Makefile.am            |   9 ---
>  contrib/test/gen_ioctl_list.pl      |   4 +-
>  contrib/test/ioctl-test.h           |   2 +-
>  contrib/test/ioctl_32.h             |   2 +-
>  contrib/test/ioctl_64.h             |   2 +-
>  contrib/xc3028-firmware/Makefile.am |   9 ---
>  lib/libdvbv5/Makefile.am            |   3 -
>  sync-with-kernel.sh                 | 115 ++++++++++++++++++++++++++++
>  utils/keytable/Makefile.am          |  13 ----
>  13 files changed, 127 insertions(+), 110 deletions(-)
>  create mode 100755 sync-with-kernel.sh
> 
> diff --git a/Makefile.am b/Makefile.am
> index 52eb8af9..3237ab49 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -7,60 +7,10 @@ if WITH_V4LUTILS
>  SUBDIRS += utils contrib
>  endif
>  
> -EXTRA_DIST = android-config.h bootstrap.sh doxygen_libdvbv5.cfg include COPYING.libv4l \
> -        COPYING.libdvbv5 README.libv4l README.lib-multi-threading TODO.libdvbv5 \
> -        doc/libdvbv5-index.doc
> +EXTRA_DIST = android-config.h sync-with-kernel.sh bootstrap.sh \
> +	doxygen_libdvbv5.cfg include COPYING.libv4l \
> +	COPYING.libdvbv5 README.libv4l README.lib-multi-threading \
> +	TODO.libdvbv5 doc/libdvbv5-index.doc
>  
>  include $(top_srcdir)/aminclude.am
>  
> -# custom targets
> -
> -sync-with-kernel:
> -	@if [ ! -f $(KERNEL_DIR)/usr/include/linux/videodev2.h -o \
> -	      ! -f $(KERNEL_DIR)/usr/include/linux/fb.h -o \
> -	      ! -f $(KERNEL_DIR)/usr/include/linux/v4l2-controls.h -o \
> -	      ! -f $(KERNEL_DIR)/usr/include/linux/v4l2-common.h -o \
> -	      ! -f $(KERNEL_DIR)/usr/include/linux/v4l2-subdev.h -o \
> -	      ! -f $(KERNEL_DIR)/usr/include/linux/v4l2-mediabus.h -o \
> -	      ! -f $(KERNEL_DIR)/usr/include/linux/ivtv.h -o \
> -	      ! -f $(KERNEL_DIR)/usr/include/linux/dvb/frontend.h -o \
> -	      ! -f $(KERNEL_DIR)/usr/include/linux/dvb/dmx.h -o \
> -	      ! -f $(KERNEL_DIR)/usr/include/linux/lirc.h -o \
> -	      ! -f $(KERNEL_DIR)/usr/include/linux/bpf.h -o \
> -	      ! -f $(KERNEL_DIR)/usr/include/linux/bpf_common.h ]; then \
> -	  echo "Error you must set KERNEL_DIR to point to an extracted kernel source dir"; \
> -	  echo "and run 'make headers_install' in \$$KERNEL_DIR."; \
> -	  exit 1; \
> -	fi
> -	cp -a $(KERNEL_DIR)/usr/include/linux/videodev2.h $(top_srcdir)/include/linux
> -	cp -a $(KERNEL_DIR)/usr/include/linux/fb.h $(top_srcdir)/include/linux
> -	cp -a $(KERNEL_DIR)/usr/include/linux/v4l2-controls.h $(top_srcdir)/include/linux
> -	cp -a $(KERNEL_DIR)/usr/include/linux/v4l2-common.h $(top_srcdir)/include/linux
> -	cp -a $(KERNEL_DIR)/usr/include/linux/v4l2-subdev.h $(top_srcdir)/include/linux
> -	cp -a $(KERNEL_DIR)/usr/include/linux/v4l2-mediabus.h $(top_srcdir)/include/linux
> -	cp -a $(KERNEL_DIR)/usr/include/linux/media-bus-format.h $(top_srcdir)/include/linux
> -	cp -a $(KERNEL_DIR)/usr/include/linux/media.h $(top_srcdir)/include/linux
> -	cp -a $(KERNEL_DIR)/usr/include/linux/ivtv.h $(top_srcdir)/include/linux
> -	cp -a $(KERNEL_DIR)/usr/include/linux/dvb/frontend.h $(top_srcdir)/include/linux/dvb
> -	cp $(top_srcdir)/include/linux/dvb/frontend.h $(top_srcdir)/lib/include/libdvbv5/dvb-frontend.h
> -	cp -a $(KERNEL_DIR)/usr/include/linux/dvb/dmx.h $(top_srcdir)/include/linux/dvb
> -	cp -a $(KERNEL_DIR)/usr/include/linux/lirc.h $(top_srcdir)/include/linux
> -	cp -a $(KERNEL_DIR)/usr/include/linux/bpf.h $(top_srcdir)/include/linux
> -	cp -a $(KERNEL_DIR)/usr/include/linux/bpf_common.h $(top_srcdir)/include/linux
> -	cp -a $(KERNEL_DIR)/usr/include/linux/cec.h $(top_srcdir)/include/linux
> -	cp -a $(KERNEL_DIR)/usr/include/linux/cec-funcs.h $(top_srcdir)/include/linux
> -	cp -a $(KERNEL_DIR)/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c $(top_srcdir)/utils/common
> -	cp -a $(KERNEL_DIR)/drivers/media/common/v4l2-tpg/v4l2-tpg-colors.c $(top_srcdir)/utils/common
> -	cp -a $(KERNEL_DIR)/include/media/tpg/v4l2-tpg.h $(top_srcdir)/utils/common
> -	cp -a $(KERNEL_DIR)/include/media/fwht-ctrls.h $(top_srcdir)/utils/common
> -	patch -d $(top_srcdir) --no-backup-if-mismatch -p1 <$(top_srcdir)/utils/common/v4l2-tpg.patch
> -	cp -a $(KERNEL_DIR)/drivers/media/test-drivers/vicodec/codec-fwht.[ch] $(top_srcdir)/utils/common/
> -	cp -a $(KERNEL_DIR)/drivers/media/test-drivers/vicodec/codec-v4l2-fwht.[ch] $(top_srcdir)/utils/common/
> -	patch -d $(top_srcdir) --no-backup-if-mismatch -p1 <$(top_srcdir)/utils/common/codec-fwht.patch
> -	grep V4L2_.*_FMT.*descr $(KERNEL_DIR)/drivers/media/v4l2-core/v4l2-ioctl.c | grep -v V4L2_PIX_FMT_H264_SLICE | grep -v V4L2_PIX_FMT_VP8_FRAME | grep -v V4L2_PIX_FMT_HEVC_SLICE | perl -pe 's/.*V4L2_(.*)_FMT/\tcase V4L2_\1_FMT/; s/:.*descr = /: return /; s/;.*/;/;' >$(top_srcdir)/utils/common/v4l2-pix-formats.h
> -
> -	$(MAKE) -C utils/keytable $@
> -	$(MAKE) -C lib/libdvbv5 $@
> -	$(MAKE) -C contrib/freebsd $@
> -	$(MAKE) -C contrib/test $@
> -	$(MAKE) -C contrib/xc3028-firmware $@
> diff --git a/README b/README
> index e344dee1..48b33713 100644
> --- a/README
> +++ b/README
> @@ -264,11 +264,11 @@ Be sure that you have installed both glibc development packages for
>  
>  step 3) at v4l-utils tree:
>  
> -	$ export KERNEL_DIR=location/of/the/kernel/tree make sync-with-kernel
> +	$ export KERNEL_DIR=location/of/the/kernel/tree ./sync-with-kernel.sh
>  
>  Alternatively, steps 1 to 3 can be replaced with:
>  
> -export KERNEL_DIR=location/of/the/kernel/tree && (cd $KERNEL_DIR && make headers_install INSTALL_HDR_PATH=usr/) && make sync-with-kernel
> +export KERNEL_DIR=location/of/the/kernel/tree && (cd $KERNEL_DIR && make headers_install INSTALL_HDR_PATH=usr/) && ./sync-with-kernel.sh
>  
>  step 4)
>  
> diff --git a/configure.ac b/configure.ac
> index b3b090f2..d9f43ab5 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -128,7 +128,7 @@ fi
>  AC_DEFINE_UNQUOTED(LOCALEDIR, "$v4l_localedir", [locale directory])
>  AC_SUBST(localedir)
>  
> -# sync-with-kernel and keytable install could make use of them
> +# sync-with-kernel.sh and keytable install could make use of them
>  #AC_PROG_GREP
>  #AC_PROG_SED
>  gl_PROMOTED_TYPE_MODE_T
> diff --git a/contrib/freebsd/Makefile.am b/contrib/freebsd/Makefile.am
> index ca322749..abf0d57b 100644
> --- a/contrib/freebsd/Makefile.am
> +++ b/contrib/freebsd/Makefile.am
> @@ -1,17 +1,3 @@
>  EXTRA_DIST = \
>  	include \
>  	patches
> -
> -sync-with-kernel:
> -	rm -rf .pc
> -
> -	for i in input.h input-event-codes.h ivtv.h uinput.h videodev2.h v4l2-controls.h v4l2-common.h; do \
> -	    mkdir -p include/linux/$$(dirname $$i); \
> -	    cp $(KERNEL_DIR)/usr/include/linux/$$i include/linux/$$i; \
> -	done
> -
> -	for i in ivtv.h uinput.h videodev2.h v4l2-common.h; do \
> -	    sed -e 's/__u8/uint8_t/g' -e 's/__u16/uint16_t/g' -e 's/__u32/uint32_t/g' -e 's/__u64/uint64_t/g' -e 's/__s8/int8_t/g' -e 's/__s16/int16_t/g' -e 's/__s32/int32_t/g' -e 's/__s64/int64_t/g' -e 's/__le32/uint32_t/g' -e 's/__user//g' -i include/linux/$$i; \
> -	done
> -
> -	quilt push -a
> diff --git a/contrib/test/Makefile.am b/contrib/test/Makefile.am
> index 55e4ba09..5771ee4d 100644
> --- a/contrib/test/Makefile.am
> +++ b/contrib/test/Makefile.am
> @@ -57,15 +57,6 @@ capture_example_SOURCES = capture-example.c
>  
>  ioctl-test.c: ioctl-test.h
>  
> -sync-with-kernel:
> -	./gen_ioctl_list.pl --gen_ioctl_numbers >.tmp_ioctl.c
> -	gcc -I ../../include/ .tmp_ioctl.c -o tmp_ioctl32 -m32
> -	gcc -I ../../include/ .tmp_ioctl.c -o tmp_ioctl64 -m64
> -	./tmp_ioctl32 32 >ioctl_32.h
> -	./tmp_ioctl64 64 >ioctl_64.h
> -	rm .tmp_ioctl.c tmp_ioctl32 tmp_ioctl64
> -	./gen_ioctl_list.pl >ioctl-test.h
> -
>  EXTRA_DIST = \
>  	gen_ioctl_list.pl \
>  	test-media \
> diff --git a/contrib/test/gen_ioctl_list.pl b/contrib/test/gen_ioctl_list.pl
> index fca51778..9d59cd7f 100755
> --- a/contrib/test/gen_ioctl_list.pl
> +++ b/contrib/test/gen_ioctl_list.pl
> @@ -69,7 +69,7 @@ sub print_ioc()
>  	printf "#define S_IOCTLS sizeof(ioctls)/sizeof(ioctls[0])\n";
>  }
>  
> -printf "/* This file is auto-generated by make sync-with-kernel */\n";
> +printf "/* This file is auto-generated by sync-with-kernel.sh */\n";
>  printf "#include <linux/compiler.h>\n";
>  
>  foreach my $h (sort keys %headers) {
> @@ -110,7 +110,7 @@ my $arg = shift;
>  if ($arg eq "--gen_ioctl_numbers") {
>  	printf "#include <stdio.h>\n";
>  	printf "int main(int argc, char *argv[]) {\n";
> -	printf "\tprintf(\"/* This file is auto-generated by make sync-with-kernel */\\n\\n\");\n";
> +	printf "\tprintf(\"/* This file is auto-generated by make sync-with-kernel.sh */\\n\\n\");\n";
>  	foreach my $ioctl (sort keys %ioc) {
>  		printf "\tprintf(\"#define CMD%%s_%s 0x%%x\\n\", argv[1], %s);\n", $ioctl, $ioctl;
>  	}
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
> diff --git a/contrib/test/ioctl_32.h b/contrib/test/ioctl_32.h
> index 6c008241..f6e7ef0b 100644
> --- a/contrib/test/ioctl_32.h
> +++ b/contrib/test/ioctl_32.h
> @@ -1,4 +1,4 @@
> -/* This file is auto-generated by make sync-with-kernel */
> +/* This file is auto-generated by make sync-with-kernel.sh */
>  
>  #define CMD32_DMX_ADD_PID 0x40026f33
>  #define CMD32_DMX_DQBUF 0xc0186f40
> diff --git a/contrib/test/ioctl_64.h b/contrib/test/ioctl_64.h
> index 5001d7c7..a4d2448a 100644
> --- a/contrib/test/ioctl_64.h
> +++ b/contrib/test/ioctl_64.h
> @@ -1,4 +1,4 @@
> -/* This file is auto-generated by make sync-with-kernel */
> +/* This file is auto-generated by make sync-with-kernel.sh */
>  
>  #define CMD64_DMX_ADD_PID 0x40026f33
>  #define CMD64_DMX_DQBUF 0xc0186f40
> diff --git a/contrib/xc3028-firmware/Makefile.am b/contrib/xc3028-firmware/Makefile.am
> index 43ff8b12..8b23d1e1 100644
> --- a/contrib/xc3028-firmware/Makefile.am
> +++ b/contrib/xc3028-firmware/Makefile.am
> @@ -3,12 +3,3 @@ noinst_PROGRAMS = firmware-tool
>  firmware_tool_SOURCES = firmware-tool.c standards.c extract_head.h standards.h tuner-xc2028-types.h
>  
>  EXTRA_DIST = README
> -
> -# custom targets
> -
> -sync-with-kernel:
> -	@if [ ! -f $(KERNEL_DIR)/drivers/media/tuners/tuner-xc2028-types.h ]; then \
> -	  echo "Error you must set KERNEL_DIR to point to an extracted kernel source dir"; \
> -	  exit 1; \
> -	fi
> -	cp -a $(KERNEL_DIR)/drivers/media/tuners/tuner-xc2028-types.h $(srcdir)/
> diff --git a/lib/libdvbv5/Makefile.am b/lib/libdvbv5/Makefile.am
> index e65066e9..09c261be 100644
> --- a/lib/libdvbv5/Makefile.am
> +++ b/lib/libdvbv5/Makefile.am
> @@ -122,6 +122,3 @@ libdvbv5_la_LDFLAGS = $(LIBDVBV5_VERSION) $(ENFORCE_LIBDVBV5_STATIC) $(LIBUDEV_L
>  libdvbv5_la_LIBADD = $(LTLIBICONV)
>  
>  EXTRA_DIST = README gen_dvb_structs.pl
> -
> -sync-with-kernel:
> -	./gen_dvb_structs.pl $(KERNEL_DIR)/usr/include/
> diff --git a/sync-with-kernel.sh b/sync-with-kernel.sh
> new file mode 100755
> index 00000000..28ad07f4
> --- /dev/null
> +++ b/sync-with-kernel.sh
> @@ -0,0 +1,115 @@
> +#!/bin/bash
> +
> +TOPSRCDIR="$( cd "$( dirname "$0" )" && pwd )"
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
> +     ! -f ${KERNEL_DIR}/usr/include/linux/bpf_common.h -o \
> +     ! -f ${KERNEL_DIR}/drivers/media/tuners/tuner-xc2028-types.h -o \
> +     ! -f ${KERNEL_DIR}/usr/include/linux/input-event-codes.h ]; then
> +	echo "Error you must set KERNEL_DIR to point to an extracted kernel source dir"
> +	echo "and run 'make headers_install' in \$KERNEL_DIR."
> +	exit 1
> +fi
> +
> +cp -a ${KERNEL_DIR}/usr/include/linux/videodev2.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/fb.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/v4l2-controls.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/v4l2-common.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/v4l2-subdev.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/v4l2-mediabus.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/media-bus-format.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/media.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/ivtv.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/dvb/frontend.h ${TOPSRCDIR}/include/linux/dvb
> +cp ${TOPSRCDIR}/include/linux/dvb/frontend.h ${TOPSRCDIR}/lib/include/libdvbv5/dvb-frontend.h
> +cp -a ${KERNEL_DIR}/usr/include/linux/dvb/dmx.h ${TOPSRCDIR}/include/linux/dvb
> +cp -a ${KERNEL_DIR}/usr/include/linux/lirc.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/bpf.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/bpf_common.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/cec.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/usr/include/linux/cec-funcs.h ${TOPSRCDIR}/include/linux
> +cp -a ${KERNEL_DIR}/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c ${TOPSRCDIR}/utils/common
> +cp -a ${KERNEL_DIR}/drivers/media/common/v4l2-tpg/v4l2-tpg-colors.c ${TOPSRCDIR}/utils/common
> +cp -a ${KERNEL_DIR}/include/media/tpg/v4l2-tpg.h ${TOPSRCDIR}/utils/common
> +cp -a ${KERNEL_DIR}/include/media/fwht-ctrls.h ${TOPSRCDIR}/utils/common
> +patch -d ${TOPSRCDIR} --no-backup-if-mismatch -p1 <${TOPSRCDIR}/utils/common/v4l2-tpg.patch
> +cp -a ${KERNEL_DIR}/drivers/media/test-drivers/vicodec/codec-fwht.[ch] ${TOPSRCDIR}/utils/common/
> +cp -a ${KERNEL_DIR}/drivers/media/test-drivers/vicodec/codec-v4l2-fwht.[ch] ${TOPSRCDIR}/utils/common/
> +patch -d ${TOPSRCDIR} --no-backup-if-mismatch -p1 <${TOPSRCDIR}/utils/common/codec-fwht.patch
> +grep V4L2_.*_FMT.*descr ${KERNEL_DIR}/drivers/media/v4l2-core/v4l2-ioctl.c | grep -v V4L2_PIX_FMT_H264_SLICE | grep -v V4L2_PIX_FMT_VP8_FRAME | grep -v V4L2_PIX_FMT_HEVC_SLICE | perl -pe 's/.*V4L2_(.*)_FMT/\tcase V4L2_\1_FMT/; s/:.*descr = /: return /; s/;.*/;/;' >${TOPSRCDIR}/utils/common/v4l2-pix-formats.h
> +
> +function keytable {
> +	SRCDIR=${TOPSRCDIR}/utils/keytable
> +
> +	cd ${SRCDIR}
> +	echo generating ${SRCDIR}/parse.h
> +	./gen_input_events.pl < ${KERNEL_DIR}/usr/include/linux/input-event-codes.h  > ${SRCDIR}/parse.h
> +	mkdir -p ${SRCDIR}/rc_keymaps
> +	rm -f ${SRCDIR}/rc_keymaps/*
> +	echo storing existing keymaps at ${SRCDIR}/rc_keymaps/
> +	./gen_keytables.pl ${KERNEL_DIR};
> +	cp ${SRCDIR}/rc_keymaps_userspace/* ${SRCDIR}/rc_keymaps/
> +}
> +
> +function libdvbv5 {
> +	SRCDIR=${TOPSRCDIR}/lib/libdvbv5
> +
> +	cd ${SRCDIR}
> +	./gen_dvb_structs.pl ${KERNEL_DIR}/usr/include/
> +}
> +
> +function xc3028-firmware {
> +	SRCDIR=${TOPSRCDIR}/contrib/xc3028-firmware
> +
> +	cp -a ${KERNEL_DIR}/drivers/media/tuners/tuner-xc2028-types.h ${SRCDIR}/
> +}
> +
> +function ioctl-test {
> +	SRCDIR=${TOPSRCDIR}/contrib/test
> +
> +	cd ${SRCDIR}
> +
> +	./gen_ioctl_list.pl --gen_ioctl_numbers >.tmp_ioctl.c
> +	gcc -I ../../include/ .tmp_ioctl.c -o tmp_ioctl32 -m32
> +	gcc -I ../../include/ .tmp_ioctl.c -o tmp_ioctl64 -m64
> +	./tmp_ioctl32 32 >ioctl_32.h
> +	./tmp_ioctl64 64 >ioctl_64.h
> +	rm .tmp_ioctl.c tmp_ioctl32 tmp_ioctl64
> +	./gen_ioctl_list.pl >ioctl-test.h
> +}
> +
> +function freebsd {
> +	SRCDIR=${TOPSRCDIR}/contrib/freebsd
> +
> +	cd ${SRCDIR}
> +
> +	rm -rf .pc
> +
> +	for i in input.h input-event-codes.h ivtv.h uinput.h videodev2.h v4l2-controls.h v4l2-common.h; do
> +		mkdir -p include/linux/$(dirname $i)
> +		cp ${KERNEL_DIR}/usr/include/linux/$i include/linux/$i
> +	done
> +
> +	for i in ivtv.h uinput.h videodev2.h v4l2-common.h; do
> +		sed -e 's/__u8/uint8_t/g' -e 's/__u16/uint16_t/g' -e 's/__u32/uint32_t/g' -e 's/__u64/uint64_t/g' -e 's/__s8/int8_t/g' -e 's/__s16/int16_t/g' -e 's/__s32/int32_t/g' -e 's/__s64/int64_t/g' -e 's/__le32/uint32_t/g' -e 's/__user//g' -i include/linux/$i
> +	done
> +
> +	quilt push -a
> +}
> +
> +keytable
> +libdvbv5
> +freebsd
> +ioctl-test
> +xc3028-firmware
> diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
> index 4724897e..a057eb89 100644
> --- a/utils/keytable/Makefile.am
> +++ b/utils/keytable/Makefile.am
> @@ -29,16 +29,3 @@ check:
>  # custom target
>  install-data-local:
>  	$(install_sh) -d "$(DESTDIR)$(keytableuserdir)"
> -
> -sync-with-kernel:
> -	@if [ ! -f $(KERNEL_DIR)/usr/include/linux/input-event-codes.h ]; then \
> -	  echo "Error you must set KERNEL_DIR to point to an extracted kernel source dir"; \
> -	  exit 1; \
> -	fi
> -	@echo generating $(srcdir)/parse.h
> -	@./gen_input_events.pl < $(KERNEL_DIR)/usr/include/linux/input-event-codes.h  > $(srcdir)/parse.h
> -	@-mkdir -p $(srcdir)/rc_keymaps
> -	@-rm $(srcdir)/rc_keymaps/*
> -	@echo storing existing keymaps at $(srcdir)/rc_keymaps/
> -	@cd $(srcdir) && ./gen_keytables.pl $(KERNEL_DIR);
> -	@-cp $(srcdir)/rc_keymaps_userspace/* $(srcdir)/rc_keymaps/
> 
