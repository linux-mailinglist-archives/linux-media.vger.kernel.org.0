Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADEF693366
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 20:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjBKTwC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 14:52:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjBKTwB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 14:52:01 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F62216327;
        Sat, 11 Feb 2023 11:51:59 -0800 (PST)
Received: from localhost (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id B53A1660211A;
        Sat, 11 Feb 2023 19:51:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1676145117;
        bh=Dds6dBFqJOASeFzEjW9BSrdneYSHbK+I+VSvvl3QM4c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cb7dTDmFWMnGeEHL2Natpvar52pjhcZfPI4x2JckWA+y7AlE1Ff1xVcHoaUDLYy4O
         Bi2tEDF39IDye96DP8jUnI9e/uhFuCQz8hT/V2McWorDPZu0X5w8fIVPgA8seMMQf3
         zYND3tPLUaPTqteKYjDSZufz1jD8twQJbUF61V7B2Hj7kLNEOq0fR6RNc7cgQr3Doa
         lGDwTpUwNK8VcyIvld9iVGnHGIZdSZmgP3Qro4T9DxhTQnSsi2JAtxLgZeWkX1eGVW
         kaSWNBUqSHMQIyzskfh/2Tjf44rb1saAe5sQsdh97niM/POKQ3d+vlRie+yZkp6cdv
         uj9bDRiUVkmqA==
Date:   Sat, 11 Feb 2023 11:53:31 -0800
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] configure.ac: Add option to disable compilation of
 v4l2-tracer
Message-ID: <Y+fx6OYqCVEgK9ii@xps>
References: <20230211101231.3060841-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211101231.3060841-1-niklas.soderlund@ragnatech.se>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Feb 11, 2023 at 11:12:31AM +0100, Niklas Söderlund wrote:
> Add a configuration time option to disable compilation of the
> v4l2-tracer utility.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
> ---
> 
> Hi Hans,
> 
> The v4l2-tracer fails to build on arm32. While I'm sure that can be
> fixed, this is an utility I don't use and building on target any thing I
> can disable in the build saves me time.
> 
> From completes, the classes of errors I see are around v4l2_fourcc(),
> _IOR() and _IOWR().
> 
> ../../include/linux/videodev2.h:81:66: error: narrowing conversion of '3039908417' from '__u32' {aka 'unsigned int'} to 'long int' [-Wnarrowing]
>    81 | #define v4l2_fourcc_be(a, b, c, d)      (v4l2_fourcc(a, b, c, d) | (1U << 31))
> 
> ../../include/linux/videodev2.h:2528:34: error: narrowing conversion of '2154321408' from 'unsigned int' to 'long int' [-Wnarrowing]
>  2528 | #define VIDIOC_QUERYCAP          _IOR('V',  0, struct v4l2_capability)
> 
> ../../include/linux/videodev2.h:2529:33: error: narrowing conversion of '3225441794' from 'unsigned int' to 'long int' [-Wnarrowing]
>  2529 | #define VIDIOC_ENUM_FMT         _IOWR('V',  2, struct v4l2_fmtdesc)
> 
> I'm building on target with gcc 12.1.0, nothing fancy,
> 
>     $ ./bootstrap.sh && ./configure && make
> 
> Kind Regards
> Niklas

Hi Niklas,
Thanks for this patch it is good and probably how I should have done it
originally :) It does make the "HAVE_JSONC" conditional redundant, so once
this is applied, I will send a follow-up patch to replace "HAVE_JSONC" with
"WITH_V4L2_TRACER" in the v4l2-tracer Makefile.am.

Best,
Deb

> ---
>  configure.ac      | 11 +++++++++++
>  utils/Makefile.am |  2 +-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/configure.ac b/configure.ac
> index dc9c4af71c45..46ddc7a8b404 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -497,6 +497,14 @@ AC_ARG_ENABLE(v4l2-compliance-32,
>     esac]
>  )
>  
> +AC_ARG_ENABLE(v4l2-tracer,
> +  AS_HELP_STRING([--disable-v4l2-tracer], [disable v4l2-tracer compilation]),
> +  [case "${enableval}" in
> +     yes | no ) ;;
> +     *) AC_MSG_ERROR(bad value ${enableval} for --disable-v4l2-tracer) ;;
> +   esac]
> +)
> +
>  AC_ARG_ENABLE(v4l2-ctl-libv4l,
>    AS_HELP_STRING([--disable-v4l2-ctl-libv4l], [disable use of libv4l in v4l2-ctl]),
>    [case "${enableval}" in
> @@ -578,6 +586,7 @@ AM_CONDITIONAL([WITH_V4L2_CTL_32], [test x${enable_v4l2_ctl_32} = xyes])
>  AM_CONDITIONAL([WITH_V4L2_COMPLIANCE], [test x$ac_cv_func_fork = xyes])
>  AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_LIBV4L], [test x$ac_cv_func_fork = xyes -a x${enable_v4l2_compliance_libv4l} != xno])
>  AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_32], [test x$ac_cv_func_fork = xyes -a x${enable_v4l2_compliance_32} = xyes])
> +AM_CONDITIONAL([WITH_V4L2_TRACER], [test x$jsonc_pkgconfig = xyes -a x$enable_v4l2_tracer != xno])
>  PKG_CHECK_MODULES([LIBBPF], [libbpf >= 0.7], [bpf_pc=yes], [bpf_pc=no])
>  AM_CONDITIONAL([WITH_BPF],          [test x$enable_bpf != xno -a x$libelf_pkgconfig = xyes -a x$CLANG = xclang -a x$bpf_pc = xyes])
>  
> @@ -628,6 +637,7 @@ AM_COND_IF([WITH_V4L2_CTL_32], [USE_V4L2_CTL_32="yes"], [USE_V4L2_CTL_32="no"])
>  AM_COND_IF([WITH_V4L2_COMPLIANCE], [USE_V4L2_COMPLIANCE="yes"], [USE_V4L2_COMPLIANCE="no"])
>  AM_COND_IF([WITH_V4L2_COMPLIANCE_LIBV4L], [USE_V4L2_COMPLIANCE_LIBV4L="yes"], [USE_V4L2_COMPLIANCE_LIBV4L="no"])
>  AM_COND_IF([WITH_V4L2_COMPLIANCE_32], [USE_V4L2_COMPLIANCE_32="yes"], [USE_V4L2_COMPLIANCE_32="no"])
> +AM_COND_IF([WITH_V4L2_TRACER], [USE_V4L2_TRACER="yes"], [USE_V4L2_TRACER="no"])
>  AM_COND_IF([WITH_BPF],         [USE_BPF="yes"
>                                  AC_DEFINE([HAVE_BPF], [1], [BPF IR decoder support enabled])],
>  				[USE_BPF="no"])
> @@ -679,5 +689,6 @@ compile time options summary
>      v4l2-compliance            : $USE_V4L2_COMPLIANCE
>      v4l2-compliance uses libv4l: $USE_V4L2_COMPLIANCE_LIBV4L
>      v4l2-compliance-32         : $USE_V4L2_COMPLIANCE_32
> +    v4l2-tracer                : $USE_V4L2_TRACER
>      BPF IR Decoders:           : $USE_BPF
>  EOF
> diff --git a/utils/Makefile.am b/utils/Makefile.am
> index 6f59515ef29d..b2a6ac211473 100644
> --- a/utils/Makefile.am
> +++ b/utils/Makefile.am
> @@ -15,7 +15,7 @@ SUBDIRS = \
>  	cec-follower \
>  	rds-ctl
>  
> -if HAVE_JSONC
> +if WITH_V4L2_TRACER
>  SUBDIRS += \
>  	v4l2-tracer
>  endif
> -- 
> 2.39.1
> 
