Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE2516C7B7B
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 10:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbjCXJcx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 05:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbjCXJcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 05:32:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C32FB24126;
        Fri, 24 Mar 2023 02:32:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DC30A49;
        Fri, 24 Mar 2023 10:32:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679650356;
        bh=MinzGS8ke0+YkEYfVpw7PpfNhp1E5Hgot/ncK7T3uhA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bxRDdoRATPbQ5NVsc1ZDL2w6mhYJytKWfcC90W6OyCgKlndEzq/c/el1hV2pvba7l
         HvqitlJ3nVAwDe/UZzybjd9VuI0Qo8z7wXohcIqMmkihmwvII0NgT0EtL3rQnP8jj0
         Z3YGDs7RI1gTE9qk1K8/fWQ/Ihj53sHKfMT5nTvs=
Date:   Fri, 24 Mar 2023 11:32:43 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 8/8] usb: gadget: uvc: implement s/g_parm
Message-ID: <20230324093243.GG18895@pendragon.ideasonboard.com>
References: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
 <20230323-uvc-gadget-cleanup-v1-8-e41f0c5d9d8e@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230323-uvc-gadget-cleanup-v1-8-e41f0c5d9d8e@pengutronix.de>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Thu, Mar 23, 2023 at 12:41:16PM +0100, Michael Tretter wrote:
> As the UVC gadget implements ENUM_FRAMEINTERVALS it should also
> implement S_PARM and G_PARM to allow to get and set the frame interval.
> While the driver doesn't actually do something with the frame interval,
> it should still handle and store the interval correctly, if the user
> space request it.

We've had a similar discussion before related to format handling. The
UVC gadget driver doesn't need this information, everything below is
dead code that userspace won't exercise. It will increase the kernel
size for no gain at all.

> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/usb/gadget/function/uvc.h      |  1 +
>  drivers/usb/gadget/function/uvc_v4l2.c | 94 ++++++++++++++++++++++++++++++++++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index 6b4ab3e07173..a9a5a9d2f554 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -96,6 +96,7 @@ struct uvc_video {
>  	unsigned int width;
>  	unsigned int height;
>  	unsigned int imagesize;
> +	struct v4l2_fract timeperframe;
>  	enum v4l2_colorspace colorspace;
>  	enum v4l2_ycbcr_encoding ycbcr_enc;
>  	enum v4l2_quantization quantization;
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index 673532ff0faa..a9564dc2445d 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -185,6 +185,9 @@ void uvc_init_default_format(struct uvc_device *uvc)
>  		video->xfer_func = V4L2_XFER_FUNC_SRGB;
>  		video->ycbcr_enc = V4L2_YCBCR_ENC_601;
>  
> +		video->timeperframe.numerator = 1;
> +		video->timeperframe.denominator = 30;
> +
>  		return;
>  	}
>  
> @@ -209,6 +212,11 @@ void uvc_init_default_format(struct uvc_device *uvc)
>  	video->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>  	video->xfer_func = V4L2_XFER_FUNC_SRGB;
>  	video->ycbcr_enc = V4L2_YCBCR_ENC_601;
> +
> +	video->timeperframe.numerator = uframe->frame.dw_default_frame_interval;
> +	video->timeperframe.denominator = 10000000;
> +	v4l2_simplify_fraction(&video->timeperframe.numerator,
> +			       &video->timeperframe.denominator, 8, 333);
>  }
>  
>  static struct uvcg_frame *find_closest_frame_by_size(struct uvc_device *uvc,
> @@ -255,6 +263,46 @@ static struct uvcg_frame *find_closest_frame_by_size(struct uvc_device *uvc,
>  	return uframe;
>  }
>  
> +static void find_closest_timeperframe(struct uvc_device *uvc,
> +				      struct v4l2_fract *timeperframe)
> +{
> +	struct uvc_video *video = &uvc->video;
> +	struct uvcg_format *uformat;
> +	struct uvcg_frame *uframe;
> +	unsigned long interval;
> +	unsigned int best_interval;
> +	unsigned int curr;
> +	unsigned int dist;
> +	unsigned int best_dist = UINT_MAX;
> +	int i;
> +
> +	if (timeperframe->denominator == 0)
> +		timeperframe->denominator = video->timeperframe.denominator;
> +	if (timeperframe->numerator == 0)
> +		timeperframe->numerator = video->timeperframe.numerator;
> +
> +	uformat = find_format_by_pix(uvc, video->fcc);
> +	uframe = find_closest_frame_by_size(uvc, uformat,
> +					    video->width, video->height);
> +
> +	interval = timeperframe->numerator * 10000000;
> +	do_div(interval, timeperframe->denominator);
> +
> +	for (i = 0; i < uframe->frame.b_frame_interval_type; i++) {
> +		curr = uframe->dw_frame_interval[i];
> +		dist = interval > curr ? interval - curr : curr - interval;
> +		if (dist < best_dist) {
> +			best_dist = dist;
> +			best_interval = curr;
> +		}
> +	}
> +
> +	timeperframe->numerator = best_interval;
> +	timeperframe->denominator = 10000000;
> +	v4l2_simplify_fraction(&timeperframe->numerator,
> +			       &timeperframe->denominator, 8, 333);
> +}
> +
>  /* --------------------------------------------------------------------------
>   * Requests handling
>   */
> @@ -456,6 +504,50 @@ uvc_v4l2_enum_framesizes(struct file *file, void *fh,
>  	return 0;
>  }
>  
> +static int
> +uvc_v4l2_s_parm(struct file *file, void *fh, struct v4l2_streamparm *parm)
> +{
> +	struct video_device *vdev = video_devdata(file);
> +	struct uvc_device *uvc = video_get_drvdata(vdev);
> +	struct uvc_video *video = &uvc->video;
> +	struct v4l2_outputparm *out;
> +
> +	if (parm->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
> +	    parm->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +		return -EINVAL;
> +
> +	out = &parm->parm.output;
> +
> +	memset(out->reserved, 0, sizeof(out->reserved));
> +
> +	out->capability = V4L2_CAP_TIMEPERFRAME;
> +	find_closest_timeperframe(uvc, &out->timeperframe);
> +
> +	video->timeperframe = out->timeperframe;
> +
> +	return 0;
> +}
> +
> +static int
> +uvc_v4l2_g_parm(struct file *file, void *fh, struct v4l2_streamparm *parm)
> +{
> +	struct video_device *vdev = video_devdata(file);
> +	struct uvc_device *uvc = video_get_drvdata(vdev);
> +	struct uvc_video *video = &uvc->video;
> +	struct v4l2_outputparm *out;
> +
> +	if (parm->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
> +	    parm->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +		return -EINVAL;
> +
> +	out = &parm->parm.output;
> +
> +	out->capability |= V4L2_CAP_TIMEPERFRAME;
> +	out->timeperframe = video->timeperframe;
> +
> +	return 0;
> +}
> +
>  static int
>  uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>  {
> @@ -671,6 +763,8 @@ const struct v4l2_ioctl_ops uvc_v4l2_ioctl_ops = {
>  	.vidioc_s_fmt_vid_out = uvc_v4l2_set_format,
>  	.vidioc_enum_frameintervals = uvc_v4l2_enum_frameintervals,
>  	.vidioc_enum_framesizes = uvc_v4l2_enum_framesizes,
> +	.vidioc_g_parm = uvc_v4l2_g_parm,
> +	.vidioc_s_parm = uvc_v4l2_s_parm,
>  	.vidioc_enum_fmt_vid_out = uvc_v4l2_enum_format,
>  	.vidioc_enum_output = uvc_v4l2_enum_output,
>  	.vidioc_g_output = uvc_v4l2_g_output,
> 
> -- 
> 2.30.2

-- 
Regards,

Laurent Pinchart
