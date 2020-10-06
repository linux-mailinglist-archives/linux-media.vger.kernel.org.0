Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D033F284E7D
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 16:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgJFO5Q convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 6 Oct 2020 10:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgJFO5P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Oct 2020 10:57:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C92EC061755
        for <linux-media@vger.kernel.org>; Tue,  6 Oct 2020 07:57:15 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kPoOw-0004M5-7O; Tue, 06 Oct 2020 16:57:14 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kPoOv-0002rt-85; Tue, 06 Oct 2020 16:57:13 +0200
Message-ID: <5bb1752f211f9f9c529906c0304d6e90be4d41bc.camel@pengutronix.de>
Subject: Re: [PATCH 6/6] coda: Add a V4L2 user for control concealed MB
 (ERR_MB)
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, cphealy@gmail.com,
        Benjamin.Bara@skidata.com, l.stach@pengutronix.de,
        kernel@collabora.com
Date:   Tue, 06 Oct 2020 16:57:13 +0200
In-Reply-To: <20201006104414.67984-7-ezequiel@collabora.com>
References: <20201006104414.67984-1-ezequiel@collabora.com>
         <20201006104414.67984-7-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-10-06 at 07:44 -0300, Ezequiel Garcia wrote:
> To avoid potentially overflowing the kernel logs in the case
> of corrupted streams, this commit adds a per-stream counter
> to be read through a driver-specific control. This allows
> applicationsto read the per-stream accumulated concealed
> macroblocks count.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  MAINTAINERS                               |  1 +
>  drivers/media/platform/coda/coda-bit.c    |  4 +--
>  drivers/media/platform/coda/coda-common.c | 40 +++++++++++++++++++++++
>  drivers/media/platform/coda/coda.h        |  2 ++
>  include/media/drv-intf/coda.h             | 13 ++++++++
>  include/uapi/linux/v4l2-controls.h        |  4 +++
>  6 files changed, 61 insertions(+), 3 deletions(-)
>  create mode 100644 include/media/drv-intf/coda.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ba5eb1dff9c2..4c7a59a4dda3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4334,6 +4334,7 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/coda.txt
>  F:	drivers/media/platform/coda/
> +F:	include/media/drv-intf/coda.h
>  
>  CODE OF CONDUCT
>  M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
> index 928a640b0056..60d8f6f29e97 100644
> --- a/drivers/media/platform/coda/coda-bit.c
> +++ b/drivers/media/platform/coda/coda-bit.c
> @@ -2369,9 +2369,7 @@ static void coda_finish_decode(struct coda_ctx *ctx)
>  	}
>  
>  	err_mb = coda_read(dev, CODA_RET_DEC_PIC_ERR_MB);
> -	if (err_mb > 0)
> -		v4l2_err(&dev->v4l2_dev,
> -			 "errors in %d macroblocks\n", err_mb);

Can we please keep this as a debug message, then?
Maybe rate limited if this causes issues with very broken streams.

> +	ctx->err_mb += err_mb;
>  
>  	if (dev->devtype->product == CODA_HX4 ||
>  	    dev->devtype->product == CODA_7541) {
> diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
> index 487dd653b24a..5d63f3687c03 100644
> --- a/drivers/media/platform/coda/coda-common.c
> +++ b/drivers/media/platform/coda/coda-common.c
> @@ -28,6 +28,7 @@
>  #include <linux/platform_data/media/coda.h>
>  #include <linux/reset.h>
>  
> +#include <media/drv-intf/coda.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> @@ -2062,6 +2063,7 @@ static int coda_start_streaming(struct vb2_queue *q, unsigned int count)
>  	if (q_data_dst->fourcc == V4L2_PIX_FMT_JPEG)
>  		ctx->params.gop_size = 1;
>  	ctx->gopcounter = ctx->params.gop_size - 1;
> +	ctx->err_mb = 0;
>  
>  	ret = ctx->ops->start_streaming(ctx);
>  	if (ctx->inst_type == CODA_INST_DECODER) {
> @@ -2162,6 +2164,22 @@ static const struct vb2_ops coda_qops = {
>  	.wait_finish		= vb2_ops_wait_finish,
>  };
>  
> +static int coda_g_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct coda_ctx *ctx =
> +			container_of(ctrl->handler, struct coda_ctx, ctrls);
> +	switch (ctrl->id) {
> +	case V4L2_CID_CODA_ERR_MB:
> +		ctrl->val = ctx->err_mb;
> +		break;
> +	default:
> +		coda_dbg(1, ctx, "Invalid control, id=%d, val=%d\n",
> +			 ctrl->id, ctrl->val);
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
>  static int coda_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	const char * const *val_names = v4l2_ctrl_get_menu(ctrl->id);
> @@ -2291,6 +2309,10 @@ static int coda_s_ctrl(struct v4l2_ctrl *ctrl)
>  	return 0;
>  }
>  
> +static const struct v4l2_ctrl_ops coda_err_mb_ctrl_ops = {
> +	.g_volatile_ctrl = coda_g_ctrl,
> +};
> +
>  static const struct v4l2_ctrl_ops coda_ctrl_ops = {
>  	.s_ctrl = coda_s_ctrl,
>  };
> @@ -2462,6 +2484,16 @@ static void coda_decode_ctrls(struct coda_ctx *ctx)
>  		ctx->mpeg4_level_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  }
>  
> +static const struct v4l2_ctrl_config coda_err_mb_ctrl_config = {
> +	.ops	= &coda_err_mb_ctrl_ops,
> +	.id	= V4L2_CID_CODA_ERR_MB,
> +	.name	= "Concealed MB count",

Is this right? In the old GPL imx-vpu-lib code this was called
numOfErrMBs, but was filled for h.264, MPEG-4, MPEG-2, or JPEG alike.
Not all of them have error concealment.

> +	.type	= V4L2_CTRL_TYPE_INTEGER,
> +	.min	= 0,
> +	.max	= 0xffffffff,
> +	.step	= 1,
> +};
> +
>  static int coda_ctrls_setup(struct coda_ctx *ctx)
>  {
>  	v4l2_ctrl_handler_init(&ctx->ctrls, 2);
> @@ -2484,6 +2516,14 @@ static int coda_ctrls_setup(struct coda_ctx *ctx)
>  				  1, 1, 1, 1);
>  		if (ctx->cvd->src_formats[0] == V4L2_PIX_FMT_H264)
>  			coda_decode_ctrls(ctx);
> +
> +		ctx->err_mb_ctrl = v4l2_ctrl_new_custom(&ctx->ctrls,
> +						&coda_err_mb_ctrl_config,
> +						NULL);
> +		if (ctx->err_mb_ctrl)
> +			ctx->err_mb_ctrl->flags |=
> +				V4L2_CTRL_FLAG_READ_ONLY |
> +				V4L2_CTRL_FLAG_VOLATILE;
>  	}
>  
>  	if (ctx->ctrls.error) {
> diff --git a/drivers/media/platform/coda/coda.h b/drivers/media/platform/coda/coda.h
> index e53f7a65d532..c5b7d2260060 100644
> --- a/drivers/media/platform/coda/coda.h
> +++ b/drivers/media/platform/coda/coda.h
> @@ -242,6 +242,7 @@ struct coda_ctx {
>  	struct v4l2_ctrl		*mpeg2_level_ctrl;
>  	struct v4l2_ctrl		*mpeg4_profile_ctrl;
>  	struct v4l2_ctrl		*mpeg4_level_ctrl;
> +	struct v4l2_ctrl		*err_mb_ctrl;
>  	struct v4l2_fh			fh;
>  	int				gopcounter;
>  	int				runcounter;
> @@ -274,6 +275,7 @@ struct coda_ctx {
>  	struct dentry			*debugfs_entry;
>  	bool				use_bit;
>  	bool				use_vdoa;
> +	unsigned int			err_mb;
>  	struct vdoa_ctx			*vdoa;
>  	/*
>  	 * wakeup mutex used to serialize encoder stop command and finish_run,
> diff --git a/include/media/drv-intf/coda.h b/include/media/drv-intf/coda.h
> new file mode 100644
> index 000000000000..1d767bec4c4a
> --- /dev/null
> +++ b/include/media/drv-intf/coda.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef VIDEO_CODA_INTF_H
> +#define VIDEO_CODA_INTF_H
> +
> +#include <linux/types.h>
> +#include <linux/videodev2.h>
> +
> +enum coda_ctrl_id {
> +	V4L2_CID_CODA_ERR_MB = (V4L2_CID_USER_CODA_BASE + 0),
> +};
> +
> +#endif /* VIDEO_CODA_INTF_H */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index a184c4939438..b4481d9579e7 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -198,6 +198,10 @@ enum v4l2_colorfx {
>   */
>  #define V4L2_CID_USER_ATMEL_ISC_BASE		(V4L2_CID_USER_BASE + 0x10c0)
>  
> +/* The base for the CODA driver controls.
> + * We reserve 16 controls for this driver. */
> +#define V4L2_CID_USER_CODA_BASE			(V4L2_CID_USER_BASE + 0x10e0)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */

regards
Philipp
