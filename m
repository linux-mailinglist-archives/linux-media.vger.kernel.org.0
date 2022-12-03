Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6834641938
	for <lists+linux-media@lfdr.de>; Sat,  3 Dec 2022 22:27:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbiLCV1j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Dec 2022 16:27:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbiLCV1g (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Dec 2022 16:27:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A34BF4;
        Sat,  3 Dec 2022 13:27:32 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CAD70993;
        Sat,  3 Dec 2022 22:27:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670102851;
        bh=e7S1OeUSATt+152BtDILig0A5Z6qqfT5p17icOtZjQM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bZUw5SnYgT6iZuafUilz0rRoGlFI7VdMiz1Yk3Q2KdVlz3kcJQI5WIpYXTpoRyqze
         Rr3rCkKwPJTjKQm8tnpI3hIaqWRbXgSqgRlB0JLsS39SbTk7AnaHxESjleYxBhJoG1
         KRjEunPcCMRbGwhcQbI8T+AZSw0gdeEMcnFcWsrg=
Date:   Sat, 3 Dec 2022 23:27:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v8] usb: gadget: uvc: add validate and fix function for
 uvc response
Message-ID: <Y4u/Qc0ygsBV6yR0@pendragon.ideasonboard.com>
References: <20221130132855.1263114-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221130132855.1263114-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Wed, Nov 30, 2022 at 02:28:55PM +0100, Michael Grzeschik wrote:
> When the userspace gets the setup requests for UVC_GET_CUR, UVC_GET_MIN,
> UVC_GET_MAX, UVC_GET_DEF it will fill out the ctrl response. This data
> needs to be validated. Since the kernel also knows the limits we can
> return EINVAL if the userspace does try to send invalid data to the
> host.
> 
> For UVC_GET_MAX and UVC_GET_MIN we fixup the bFrameIndex and
> bFormatIndex to the correct boundaries. And for all other requests we
> set valid dwFrameInterval, dwMaxPayloadTransferSize and
> dwMaxVideoFrameSize if the userspace did not set any value at all.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

For the reason explained in the review of v7, NACK.

> ---
> v1: -> v4:
> - new patch
> v4: -> v5:
> - changed uvcg_info to uvcg_dbg for fixups, updated info strings
> v5: -> v6:
> - no changes
> v6 -> v7:
> - reworked to not need 'd182bf156c4c ("usb: gadget: uvc: default the ctrl request interface offsets")'
> v7 -> v8:
> - splitup validate and fix to separate functions
> - only validate on UVC_GET_CUR
> - return with EINVAL if validate fails
> - fixup on UVC_GET_MIN, UVC_GET_MAX and UVC_GET_DEF
> - rebased again on necessary patch 'd182bf156c4c ("usb: gadget: uvc: default the ctrl request interface offsets")'
> - after validating one streaming request unset the current streaming_request
> 
>  drivers/usb/gadget/function/f_uvc.c    |   4 +-
>  drivers/usb/gadget/function/uvc.h      |   1 +
>  drivers/usb/gadget/function/uvc_v4l2.c | 154 +++++++++++++++++++++++++
>  3 files changed, 158 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index 6e131624011a5e..098bd3c4e3c0b3 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -254,8 +254,10 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
>  	 */
>  	mctrl = &uvc_event->req;
>  	mctrl->wIndex &= ~cpu_to_le16(0xff);
> -	if (interface == uvc->streaming_intf)
> +	if (interface == uvc->streaming_intf) {
> +		uvc->streaming_request = ctrl->bRequest;
>  		mctrl->wIndex = cpu_to_le16(UVC_STRING_STREAMING_IDX);
> +	}
>  
>  	v4l2_event_queue(&uvc->vdev, &v4l2_event);
>  
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index 40226b1f7e148a..1be4d5f24b46bf 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -151,6 +151,7 @@ struct uvc_device {
>  	void *control_buf;
>  
>  	unsigned int streaming_intf;
> +	unsigned char streaming_request;
>  
>  	/* Events */
>  	unsigned int event_length;
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index a189b08bba800d..a5a109e7708f4b 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -178,6 +178,137 @@ static struct uvcg_frame *find_closest_frame_by_size(struct uvc_device *uvc,
>   * Requests handling
>   */
>  
> +/* validate streaming ctrl request response data for valid parameters */
> +static int
> +uvc_validate_streaming_ctrl(struct uvc_device *uvc,
> +			    struct uvc_streaming_control *ctrl)
> +{
> +	struct f_uvc_opts *opts = fi_to_f_uvc_opts(uvc->func.fi);
> +	unsigned int iformat, iframe;
> +	struct uvcg_format *uformat;
> +	struct uvcg_frame *uframe;
> +	bool ival_found = false;
> +	int i;
> +
> +	iformat = ctrl->bFormatIndex;
> +	iframe = ctrl->bFrameIndex;
> +
> +	iformat = clamp((unsigned int)iformat, 1U,
> +			(unsigned int)uvc->header->num_fmt);
> +	if (iformat != ctrl->bFormatIndex) {
> +		uvcg_dbg(&uvc->func,
> +			 "invalid bFormatIndex set: %d\n",
> +			 ctrl->bFormatIndex);
> +		return -EINVAL;
> +	}
> +	uformat = find_format_by_index(uvc, iformat);
> +
> +	iframe = clamp((unsigned int)iframe, 1U,
> +		       (unsigned int)uformat->num_frames);
> +	if (iframe != ctrl->bFrameIndex) {
> +		uvcg_dbg(&uvc->func,
> +			 "invalid bFrameIndex set: %d\n",
> +			 ctrl->bFrameIndex);
> +		return -EINVAL;
> +	}
> +	uframe = find_frame_by_index(uvc, uformat, iframe);
> +
> +	if (ctrl->dwFrameInterval) {
> +		for (i = 0; i < uframe->frame.b_frame_interval_type; i++) {
> +			if (ctrl->dwFrameInterval ==
> +				 uframe->dw_frame_interval[i]) {
> +				ival_found = true;
> +				break;
> +			}
> +		}
> +		if (!ival_found) {
> +			uvcg_dbg(&uvc->func,
> +				 "invalid dwFrameInterval set: %d\n",
> +				 ctrl->dwFrameInterval);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (ctrl->dwMaxPayloadTransferSize >
> +				opts->streaming_maxpacket) {
> +		uvcg_dbg(&uvc->func,
> +			  "invalid dwMaxPayloadTransferSize set: %d\n",
> +			  ctrl->dwMaxPayloadTransferSize);
> +		return -EINVAL;
> +	}
> +
> +	if (ctrl->dwMaxVideoFrameSize >
> +				uframe->frame.dw_max_video_frame_buffer_size) {
> +		uvcg_dbg(&uvc->func,
> +			  "invalid dwMaxVideoFrameSize set: %d\n",
> +			  ctrl->dwMaxVideoFrameSize);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void
> +uvc_fixup_streaming_ctrl(struct uvc_device *uvc,
> +			    struct uvc_streaming_control *ctrl)
> +{
> +	struct f_uvc_opts *opts = fi_to_f_uvc_opts(uvc->func.fi);
> +	unsigned int iformat, iframe;
> +	struct uvcg_format *uformat;
> +	struct uvcg_frame *uframe;
> +
> +	iformat = ctrl->bFormatIndex;
> +	iframe = ctrl->bFrameIndex;
> +
> +	/* Fixup the bFormatIndex on UVC_GET_{MIN,MAX} events */
> +	if (ctrl->bFormatIndex == U8_MAX || !ctrl->bFormatIndex) {
> +		iformat = clamp((unsigned int)iformat, 1U,
> +				(unsigned int)uvc->header->num_fmt);
> +		ctrl->bFormatIndex = iformat;
> +		uvcg_dbg(&uvc->func,
> +			  "fixup bFormatIndex: %d\n",
> +			  ctrl->bFormatIndex);
> +	}
> +
> +	uformat = find_format_by_index(uvc, iformat);
> +
> +	/* Fixup the bFrameIndex on UVC_GET_{MIN,MAX} events */
> +	if (ctrl->bFrameIndex == U8_MAX || !ctrl->bFrameIndex) {
> +		iframe = clamp((unsigned int)iframe, 1U,
> +			       (unsigned int)uformat->num_frames);
> +		ctrl->bFrameIndex = iframe;
> +		uvcg_dbg(&uvc->func,
> +			  "fixup bFrameIndex: %d\n",
> +			  ctrl->bFrameIndex);
> +	}
> +
> +	uframe = find_frame_by_index(uvc, uformat, iframe);
> +
> +	/* Fixup values where the userspace does not set the paramters
> +	 * but does handover the preparing of the values to the kernel.
> +	 */
> +	if (!ctrl->dwFrameInterval) {
> +		ctrl->dwFrameInterval = uframe->frame.dw_default_frame_interval;
> +		uvcg_dbg(&uvc->func,
> +			  "fixup dwFrameInterval: %d\n",
> +			  ctrl->dwFrameInterval);
> +	}
> +
> +	if (!ctrl->dwMaxPayloadTransferSize) {
> +		ctrl->dwMaxPayloadTransferSize = opts->streaming_maxpacket;
> +		uvcg_dbg(&uvc->func,
> +			  "fixup dwMaxPayloadTransferSize: %d\n",
> +			  ctrl->dwMaxPayloadTransferSize);
> +	}
> +
> +	if (!ctrl->dwMaxVideoFrameSize) {
> +		ctrl->dwMaxVideoFrameSize = uvc_get_frame_size(uformat, uframe);
> +		uvcg_dbg(&uvc->func,
> +			  "fixup dwMaxVideoFrameSize: %d\n",
> +			  ctrl->dwMaxVideoFrameSize);
> +	}
> +}
> +
>  static int
>  uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
>  {
> @@ -192,6 +323,29 @@ uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
>  
>  	memcpy(req->buf, data->data, req->length);
>  
> +	/* validate the ctrl content and fixup */
> +	if (!uvc->event_setup_out) {
> +		struct uvc_streaming_control *ctrl = req->buf;
> +		int ret;
> +
> +		switch (uvc->streaming_request) {
> +		case UVC_GET_CUR:
> +			ret = uvc_validate_streaming_ctrl(uvc, ctrl);
> +			if (ret)
> +				return ret;
> +			fallthrough;
> +		case UVC_GET_MIN:
> +		case UVC_GET_MAX:
> +		case UVC_GET_DEF:
> +			uvc_fixup_streaming_ctrl(uvc, ctrl);
> +			break;
> +		default:
> +			break;
> +		}
> +
> +		uvc->streaming_request = UVC_RC_UNDEFINED;
> +	}
> +
>  	return usb_ep_queue(cdev->gadget->ep0, req, GFP_KERNEL);
>  }
>  

-- 
Regards,

Laurent Pinchart
