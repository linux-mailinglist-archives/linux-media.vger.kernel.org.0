Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 079D024DE1
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 13:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbfEUL3r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 07:29:47 -0400
Received: from casper.infradead.org ([85.118.1.10]:49572 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbfEUL3q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 07:29:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=9EKjbnM6U37hodtPz75oP5rDndY+XNZ+ZE4FJTCmaZI=; b=P9rPFdsWJLKwWKPiuFG/y6mrPC
        knZOtbCtlVyYPLFPfNtZ6XdiTlbg2KQfY5jWAdosXvbWcf0WB6LJIG+PD1ND+XLuVy2uF55UfdVGK
        kMQ6pgqtUDiU/8/K9s6YUG5BcEGMkdcS+kysnYIIfaBANOfUn8Cl8PnXOLhWuWYTkEkuhSmSBsqJ3
        EwQXjraLlX4d6BNi+02BMdd/Fd03IagG8X2N124uF/xoF0y76ZCLbIslXtXGMCBMn6Tq8QrnvR4jH
        E01uAbLi372iuBOyfm+YqJytW08OSA3Jf3Q0UsTn6cYalYj230aB19cj5uV5NIxHAlCw4tOMnnVSo
        auLOjb9Q==;
Received: from 189.27.21.94.dynamic.adsl.gvt.net.br ([189.27.21.94] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hT2xk-0007RO-HQ; Tue, 21 May 2019 11:29:45 +0000
Date:   Tue, 21 May 2019 08:29:40 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 08/13] media: coda: add decoder MPEG-4 profile and level
 controls
Message-ID: <20190521082940.774cb91e@coco.lan>
In-Reply-To: <20190412155135.13907-8-p.zabel@pengutronix.de>
References: <20190412155135.13907-1-p.zabel@pengutronix.de>
        <20190412155135.13907-8-p.zabel@pengutronix.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 12 Apr 2019 17:51:30 +0200
Philipp Zabel <p.zabel@pengutronix.de> escreveu:

> The MPEG-4 decoder firmware reports profile and level indication values
> that can be used to update V4L2 MPEG-4 profile and level controls.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

This one causes a GCC error:

drivers/media/platform/coda/coda-common.c: In function 'coda_decode_ctrls':
drivers/media/platform/coda/coda-common.c:2143:11: error: 'struct coda_ctx' has no member named 'mpeg2_level_ctrl'; did you mean 'mpeg4_level_ctrl'?
 2143 |  if (ctx->mpeg2_level_ctrl)
      |           ^~~~~~~~~~~~~~~~
      |           mpeg4_level_ctrl
drivers/media/platform/coda/coda-common.c:2144:8: error: 'struct coda_ctx' has no member named 'mpeg2_level_ctrl'; did you mean 'mpeg4_level_ctrl'?
 2144 |   ctx->mpeg2_level_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
      |        ^~~~~~~~~~~~~~~~
      |        mpeg4_level_ctrl
make[3]: *** [scripts/Makefile.build:279: drivers/media/platform/coda/coda-common.o] Error 1
make[2]: *** [scripts/Makefile.build:489: drivers/media/platform/coda] Error 2
make[1]: *** [scripts/Makefile.build:489: drivers/media/platform] Error 2
make: *** [Makefile:1596: _module_drivers/media] Error 2
***********
***ERROR***
***********

Please fix.


> ---
>  drivers/media/platform/coda/Makefile      |  2 +-
>  drivers/media/platform/coda/coda-common.c | 23 +++++++++++
>  drivers/media/platform/coda/coda-mpeg4.c  | 48 +++++++++++++++++++++++
>  drivers/media/platform/coda/coda.h        |  5 +++
>  4 files changed, 77 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/platform/coda/coda-mpeg4.c
> 
> diff --git a/drivers/media/platform/coda/Makefile b/drivers/media/platform/coda/Makefile
> index 858284328af9..3a068206cea8 100644
> --- a/drivers/media/platform/coda/Makefile
> +++ b/drivers/media/platform/coda/Makefile
> @@ -1,6 +1,6 @@
>  ccflags-y += -I$(src)
>  
> -coda-objs := coda-common.o coda-bit.o coda-gdi.o coda-h264.o coda-jpeg.o
> +coda-objs := coda-common.o coda-bit.o coda-gdi.o coda-h264.o coda-mpeg4.o coda-jpeg.o
>  
>  obj-$(CONFIG_VIDEO_CODA) += coda.o
>  obj-$(CONFIG_VIDEO_IMX_VDOA) += imx-vdoa.o
> diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
> index 667dafc06afb..9d25899a9af6 100644
> --- a/drivers/media/platform/coda/coda-common.c
> +++ b/drivers/media/platform/coda/coda-common.c
> @@ -1580,6 +1580,15 @@ void coda_update_profile_level_ctrls(struct coda_ctx *ctx, u8 profile_idc,
>  		profile = coda_h264_profile(profile_idc);
>  		level = coda_h264_level(level_idc);
>  		break;
> +	case V4L2_PIX_FMT_MPEG4:
> +		codec_name = "MPEG-4";
> +		profile_cid = V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE;
> +		level_cid = V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL;
> +		profile_ctrl = ctx->mpeg4_profile_ctrl;
> +		level_ctrl = ctx->mpeg4_level_ctrl;
> +		profile = coda_mpeg4_profile(profile_idc);
> +		level = coda_mpeg4_level(level_idc);
> +		break;
>  	default:
>  		return;
>  	}
> @@ -2109,6 +2118,20 @@ static void coda_decode_ctrls(struct coda_ctx *ctx)
>  		&coda_ctrl_ops, V4L2_CID_MPEG_VIDEO_H264_LEVEL, max, 0, max);
>  	if (ctx->h264_level_ctrl)
>  		ctx->h264_level_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	ctx->mpeg4_profile_ctrl = v4l2_ctrl_new_std_menu(&ctx->ctrls,
> +		&coda_ctrl_ops, V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE,
> +		V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY, 0,
> +		V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY);
> +	if (ctx->mpeg4_profile_ctrl)
> +		ctx->mpeg4_profile_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	ctx->mpeg4_level_ctrl = v4l2_ctrl_new_std_menu(&ctx->ctrls,
> +		&coda_ctrl_ops, V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL,
> +		V4L2_MPEG_VIDEO_MPEG4_LEVEL_5, 0,
> +		V4L2_MPEG_VIDEO_MPEG4_LEVEL_5);
> +	if (ctx->mpeg2_level_ctrl)
> +		ctx->mpeg2_level_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  }
>  
>  static int coda_ctrls_setup(struct coda_ctx *ctx)
> diff --git a/drivers/media/platform/coda/coda-mpeg4.c b/drivers/media/platform/coda/coda-mpeg4.c
> new file mode 100644
> index 000000000000..762091ae1956
> --- /dev/null
> +++ b/drivers/media/platform/coda/coda-mpeg4.c
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Coda multi-standard codec IP - MPEG-4 helper functions
> + *
> + * Copyright (C) 2019 Pengutronix, Philipp Zabel
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/videodev2.h>
> +#include <coda.h>
> +
> +int coda_mpeg4_profile(int profile_idc)
> +{
> +	switch (profile_idc) {
> +	case 0:
> +		return V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE;
> +	case 15:
> +		return V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE;
> +	case 2:
> +		return V4L2_MPEG_VIDEO_MPEG4_PROFILE_CORE;
> +	case 1:
> +		return V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE_SCALABLE;
> +	case 11:
> +		return V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +int coda_mpeg4_level(int level_idc)
> +{
> +	switch (level_idc) {
> +	case 0:
> +		return V4L2_MPEG_VIDEO_MPEG4_LEVEL_0;
> +	case 1:
> +		return V4L2_MPEG_VIDEO_MPEG4_LEVEL_1;
> +	case 2:
> +		return V4L2_MPEG_VIDEO_MPEG4_LEVEL_2;
> +	case 3:
> +		return V4L2_MPEG_VIDEO_MPEG4_LEVEL_3;
> +	case 4:
> +		return V4L2_MPEG_VIDEO_MPEG4_LEVEL_4;
> +	case 5:
> +		return V4L2_MPEG_VIDEO_MPEG4_LEVEL_5;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> diff --git a/drivers/media/platform/coda/coda.h b/drivers/media/platform/coda/coda.h
> index 1c822dfdb3ce..d8c8b3777db8 100644
> --- a/drivers/media/platform/coda/coda.h
> +++ b/drivers/media/platform/coda/coda.h
> @@ -217,6 +217,8 @@ struct coda_ctx {
>  	struct v4l2_ctrl_handler	ctrls;
>  	struct v4l2_ctrl		*h264_profile_ctrl;
>  	struct v4l2_ctrl		*h264_level_ctrl;
> +	struct v4l2_ctrl		*mpeg4_profile_ctrl;
> +	struct v4l2_ctrl		*mpeg4_level_ctrl;
>  	struct v4l2_fh			fh;
>  	int				gopcounter;
>  	int				runcounter;
> @@ -328,6 +330,9 @@ int coda_sps_parse_profile(struct coda_ctx *ctx, struct vb2_buffer *vb);
>  int coda_h264_sps_fixup(struct coda_ctx *ctx, int width, int height, char *buf,
>  			int *size, int max_size);
>  
> +int coda_mpeg4_profile(int profile_idc);
> +int coda_mpeg4_level(int level_idc);
> +
>  void coda_update_profile_level_ctrls(struct coda_ctx *ctx, u8 profile_idc,
>  				     u8 level_idc);
>  



Thanks,
Mauro
