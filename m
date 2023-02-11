Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49938693424
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 23:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjBKWIj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 17:08:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBKWIi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 17:08:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECEE312872;
        Sat, 11 Feb 2023 14:08:36 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77E5E4B0;
        Sat, 11 Feb 2023 23:08:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676153315;
        bh=R4uwL53SzuJAkJqq7hXZNUxVcgQwwntqJb7XBontHjc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dJYHSopwXSViplVRTk2vwjbPsgT30PCh5tKUdJA3RjaYM6ABGV4ueq4/WamJ7VPqo
         dn1WrOfPa8qSjn/DGdpUBc97c9EBVm8BieegZnyzYRLYNWwDywD+6OkBzdaq88P4AK
         5gpMRVyczTiFsRKkvGy7/gM3NOtz98+oUCllmiag=
Date:   Sun, 12 Feb 2023 00:08:34 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] configure.ac: Add option to disable compilation of
 v4l2-tracer
Message-ID: <Y+gR4soeDPQQulce@pendragon.ideasonboard.com>
References: <20230211101231.3060841-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211101231.3060841-1-niklas.soderlund@ragnatech.se>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Sat, Feb 11, 2023 at 11:12:31AM +0100, Niklas Söderlund wrote:
> Add a configuration time option to disable compilation of the
> v4l2-tracer utility.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

with my limited autotools knowledge.

I'll add the same option to meson support :-)

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

-- 
Regards,

Laurent Pinchart
