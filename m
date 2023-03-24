Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21D216C7B12
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 10:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbjCXJU0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 05:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbjCXJUX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 05:20:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F782331A;
        Fri, 24 Mar 2023 02:20:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0747FA49;
        Fri, 24 Mar 2023 10:20:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679649615;
        bh=pki/0go3xFs807tIx8JCF2lB90/pCB8Q2/9mcXVfvBI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cHp5w5LiLYc5Ee/9bsGHwwM9tie1udHt0QGc7i7JUVjmCVTnlVR8LA81TOCpNDHZs
         KchHblIkwkN1NKquWMYE4i1r6mCbvHIW0WTqQimb0UgyAWUS5g4seyRGIO0SOo3kZN
         JDoRdHRKboQb8bRQtUr2xByhZqXRENbqfpVnvZyo=
Date:   Fri, 24 Mar 2023 11:20:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 3/8] usb: gadget: uvc: implement s/g_output ioctl
Message-ID: <20230324092021.GC18895@pendragon.ideasonboard.com>
References: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
 <20230323-uvc-gadget-cleanup-v1-3-e41f0c5d9d8e@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230323-uvc-gadget-cleanup-v1-3-e41f0c5d9d8e@pengutronix.de>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

(CC'ing Hans)

Thank you for the patch.

On Thu, Mar 23, 2023 at 12:41:11PM +0100, Michael Tretter wrote:
> V4L2 OUTPUT devices should implement ENUM_OUTPUT, G_OUTPUT, and
> S_OUTPUT. The UVC gadget provides only a single output. Therefore, allow
> only a single output 0.
> 
> According to the documentation, "_TYPE_ANALOG" is historical and should
> be read as "_TYPE_VIDEO".

I think v4l2-compliance should be fixed to not require those ioctls. As
this patch clearly shows, they're useless :-)

> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/usb/gadget/function/uvc_v4l2.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index 13c7ba06f994..4b8bf94e06fc 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -377,6 +377,31 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>  	return 0;
>  }
>  
> +static int
> +uvc_v4l2_enum_output(struct file *file, void *priv_fh, struct v4l2_output *out)
> +{
> +	if (out->index != 0)
> +		return -EINVAL;
> +
> +	out->type = V4L2_OUTPUT_TYPE_ANALOG;
> +	snprintf(out->name, sizeof(out->name), "UVC");
> +
> +	return 0;
> +}
> +
> +static int
> +uvc_v4l2_g_output(struct file *file, void *priv_fh, unsigned int *i)
> +{
> +	*i = 0;
> +	return 0;
> +}
> +
> +static int
> +uvc_v4l2_s_output(struct file *file, void *priv_fh, unsigned int i)
> +{
> +	return i ? -EINVAL : 0;
> +}
> +
>  static int
>  uvc_v4l2_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *b)
>  {
> @@ -547,6 +572,9 @@ const struct v4l2_ioctl_ops uvc_v4l2_ioctl_ops = {
>  	.vidioc_enum_frameintervals = uvc_v4l2_enum_frameintervals,
>  	.vidioc_enum_framesizes = uvc_v4l2_enum_framesizes,
>  	.vidioc_enum_fmt_vid_out = uvc_v4l2_enum_format,
> +	.vidioc_enum_output = uvc_v4l2_enum_output,
> +	.vidioc_g_output = uvc_v4l2_g_output,
> +	.vidioc_s_output = uvc_v4l2_s_output,
>  	.vidioc_reqbufs = uvc_v4l2_reqbufs,
>  	.vidioc_querybuf = uvc_v4l2_querybuf,
>  	.vidioc_qbuf = uvc_v4l2_qbuf,

-- 
Regards,

Laurent Pinchart
