Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55C70426B06
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 14:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241408AbhJHMkq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 8 Oct 2021 08:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbhJHMkp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Oct 2021 08:40:45 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB60C061570
        for <linux-media@vger.kernel.org>; Fri,  8 Oct 2021 05:38:50 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mYp9E-0006uR-Ap; Fri, 08 Oct 2021 14:38:48 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mYp9D-00084Z-OA; Fri, 08 Oct 2021 14:38:47 +0200
Message-ID: <b7f8d810bbfedbb68e467d73ae821396f9bfc5a7.camel@pengutronix.de>
Subject: Re: [PATCH v3] media: imx-pxp: Add rotation support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Fabio Estevam <festevam@denx.de>
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Date:   Fri, 08 Oct 2021 14:38:47 +0200
In-Reply-To: <20211007125744.2056374-1-festevam@denx.de>
References: <20211007125744.2056374-1-festevam@denx.de>
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

Hi Fabio,

On Thu, 2021-10-07 at 09:57 -0300, Fabio Estevam wrote:
> PXP allows clockwise rotation of 0°, 90°, 180° and 270°.
> 
> Add support for it.
> 
> Tested on a imx6ull-evk.
> 
> For example, to rotate 90° the following Gstreamer pipeline can
> be used:
> 
> gst-launch-1.0 videotestsrc ! video/x-raw,width=640,height=480 ! \
> v4l2convert extra-controls=cid,rotate=90  ! \
> video/x-raw,width=120,height=160 ! fbdevsink
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v2:
> - Move the swap prior to the first usage of dst_height.
> 
>  drivers/media/platform/imx-pxp.c | 38 ++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/imx-pxp.c b/drivers/media/platform/imx-pxp.c
> index 723b096fedd1..acfc77f9d58f 100644
> --- a/drivers/media/platform/imx-pxp.c
> +++ b/drivers/media/platform/imx-pxp.c
> @@ -168,6 +168,13 @@ enum {
>  	V4L2_M2M_DST = 1,
>  };
>  
> +enum pxp_rotation_modes {
> +	PXP_ROTATE_0,
> +	PXP_ROTATE_90,
> +	PXP_ROTATE_180,
> +	PXP_ROTATE_270,

These values are already defined in the imx-pxp.h header:

#define BV_PXP_CTRL_ROTATE0__ROT_0   0x0
#define BV_PXP_CTRL_ROTATE0__ROT_90  0x1
#define BV_PXP_CTRL_ROTATE0__ROT_180 0x2
#define BV_PXP_CTRL_ROTATE0__ROT_270 0x3

I'd use those instead.

> +};
> +
>  static struct pxp_fmt *find_format(struct v4l2_format *f)
>  {
>  	struct pxp_fmt *fmt;
> @@ -211,6 +218,7 @@ struct pxp_ctx {
>  	/* Processing mode */
>  	int			mode;
>  	u8			alpha_component;
> +	u8			rotation;
>  
>  	enum v4l2_colorspace	colorspace;
>  	enum v4l2_xfer_func	xfer_func;
> @@ -767,14 +775,19 @@ static int pxp_start(struct pxp_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
>  		 V4L2_BUF_FLAG_BFRAME |
>  		 V4L2_BUF_FLAG_TSTAMP_SRC_MASK);
>  
> -	/* Rotation disabled, 8x8 block size */
> +	/* 8x8 block size */
>  	ctrl = BF_PXP_CTRL_VFLIP0(!!(ctx->mode & MEM2MEM_VFLIP)) |
> -	       BF_PXP_CTRL_HFLIP0(!!(ctx->mode & MEM2MEM_HFLIP));
> +	       BF_PXP_CTRL_HFLIP0(!!(ctx->mode & MEM2MEM_HFLIP)) |
> +	       BF_PXP_CTRL_ROTATE0(ctx->rotation);
>  	/* Always write alpha value as V4L2_CID_ALPHA_COMPONENT */
>  	out_ctrl = BF_PXP_OUT_CTRL_ALPHA(ctx->alpha_component) |
>  		   BF_PXP_OUT_CTRL_ALPHA_OUTPUT(1) |
>  		   pxp_v4l2_pix_fmt_to_out_format(dst_fourcc);
>  	out_buf = p_out;
> +
> +	if (ctx->rotation == PXP_ROTATE_90 || ctx->rotation == PXP_ROTATE_270)
> +		swap(dst_width, dst_height);
> +
>  	switch (dst_fourcc) {
>  	case V4L2_PIX_FMT_NV12:
>  	case V4L2_PIX_FMT_NV21:
> @@ -1297,6 +1310,22 @@ static int pxp_s_fmt_vid_out(struct file *file, void *priv,
>  	return 0;
>  }
>  
> +static u8 pxp_degrees_to_rot_mode(u32 degrees)
> +{
> +	switch (degrees) {
> +	case 0:
> +		return PXP_ROTATE_0;
> +	case 90:
> +		return PXP_ROTATE_90;
> +	case 180:
> +		return PXP_ROTATE_180;
> +	case 270:
> +		return PXP_ROTATE_270;
> +	default:
> +		return PXP_ROTATE_0;

You can combine the 0° and default cases.

> +	}
> +}
> +
>  static int pxp_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct pxp_ctx *ctx =
> @@ -1317,6 +1346,10 @@ static int pxp_s_ctrl(struct v4l2_ctrl *ctrl)
>  			ctx->mode &= ~MEM2MEM_VFLIP;
>  		break;
>  
> +	case V4L2_CID_ROTATE:
> +		ctx->rotation = pxp_degrees_to_rot_mode(ctrl->val);
> +		break;
> +
>  	case V4L2_CID_ALPHA_COMPONENT:
>  		ctx->alpha_component = ctrl->val;
>  		break;
> @@ -1524,6 +1557,7 @@ static int pxp_open(struct file *file)
>  	v4l2_ctrl_handler_init(hdl, 4);
>  	v4l2_ctrl_new_std(hdl, &pxp_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
>  	v4l2_ctrl_new_std(hdl, &pxp_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
> +	v4l2_ctrl_new_std(hdl, &pxp_ctrl_ops, V4L2_CID_ROTATE, 0, 270, 90, 0);
>  	v4l2_ctrl_new_std(hdl, &pxp_ctrl_ops, V4L2_CID_ALPHA_COMPONENT,
>  			  0, 255, 1, 255);
>  	if (hdl->error) {

regards
Philipp
