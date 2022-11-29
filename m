Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3D163BFA4
	for <lists+linux-media@lfdr.de>; Tue, 29 Nov 2022 13:03:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233794AbiK2MDH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Nov 2022 07:03:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233305AbiK2MCV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Nov 2022 07:02:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD3E519C0C;
        Tue, 29 Nov 2022 04:02:19 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BA024E6;
        Tue, 29 Nov 2022 13:02:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669723338;
        bh=aVCxIaq5g63Utk4jLPnARlDptvgQlV3Yk95tr7DoDWY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tetWnmjBJA2YwM0Mj+BZHv5CU8O5q0dzWJOgziLSS2xVfUoVouOvzvdODMfcCmEDV
         Od4n3qs4xySWdw7T+0scoQMHKJuoPlEdPIeg0eM92phOoxbrzZH6EBgKRDxiwtqbht
         j9hSotKfdEhqPyHwWAoLMlyeEyP2zEdoTk80O1NU=
Date:   Tue, 29 Nov 2022 14:02:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        kernel@pengutronix.de, Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v7] usb: gadget: uvc: add validate and fix function for
 uvc response
Message-ID: <Y4X0unPRK7iAnfaH@pendragon.ideasonboard.com>
References: <20221128103124.655264-1-m.grzeschik@pengutronix.de>
 <Y4V4IED+SBhUR7Su@pendragon.ideasonboard.com>
 <20221129102308.GO18924@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221129102308.GO18924@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Tue, Nov 29, 2022 at 11:23:08AM +0100, Michael Grzeschik wrote:
> On Tue, Nov 29, 2022 at 05:10:24AM +0200, Laurent Pinchart wrote:
> > On Mon, Nov 28, 2022 at 11:31:25AM +0100, Michael Grzeschik wrote:
> >> When the userspace gets the setup requests for UVC_GET_CUR UVC_GET_MIN,
> >> UVC_GET_MAX, UVC_GET_DEF it will fill out the ctrl response. This data
> >> needs to be validated. Since the kernel also knows the limits for valid
> >> cases, it can fixup the values in case the userspace is setting invalid
> >> data.
> >
> > Why is this a good idea ?
> 
> Why is it not? We don't want the userspace to communicate other things
> to the host than what is configured in the configfs. If you only object
> the explanation, then I will improve the commit message and send an
> fixed v8. If you have more objections please share your doubts, thanks.

What bothers me is that this patch silently clamps invalid value, trying
to hide the gadget userspace error from the host. It may allow the host
to proceed one step further, but if the gadget userspace got it wrong in
the first place, there's a very high chance it won't do the right thing
in the next step anyway. This will make debugging more complicated,
while at the same time not bringing much value.

> >> Fixes: e219a712bc06 ("usb: gadget: uvc: add v4l2 try_format api call")
> >> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> >>
> >> ---
> >> v1: -> v4:
> >> - new patch
> >> v4: -> v5:
> >> - changed uvcg_info to uvcg_dbg for fixups, updated info strings
> >> v5: -> v6:
> >> - no changes
> >> v6 -> v7:
> >> - reworked to not need 'd182bf156c4c ("usb: gadget: uvc: default the ctrl request interface offsets")'
> >>
> >> This will apply to v6.1-rc6.
> >>
> >>  drivers/usb/gadget/function/f_uvc.c    |  4 ++
> >>  drivers/usb/gadget/function/uvc.h      |  1 +
> >>  drivers/usb/gadget/function/uvc_v4l2.c | 76 ++++++++++++++++++++++++++
> >>  3 files changed, 81 insertions(+)
> >>
> >> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> >> index 6e196e06181ecf..89f0100dae60f4 100644
> >> --- a/drivers/usb/gadget/function/f_uvc.c
> >> +++ b/drivers/usb/gadget/function/f_uvc.c
> >> @@ -248,6 +248,10 @@ uvc_function_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
> >>  	memset(&v4l2_event, 0, sizeof(v4l2_event));
> >>  	v4l2_event.type = UVC_EVENT_SETUP;
> >>  	memcpy(&uvc_event->req, ctrl, sizeof(uvc_event->req));
> >> +
> >> +	if (interface == uvc->streaming_intf)
> >> +		uvc->streaming_request = ctrl->bRequest;
> >> +
> >>  	v4l2_event_queue(&uvc->vdev, &v4l2_event);
> >>
> >>  	return 0;
> >> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> >> index 40226b1f7e148a..1be4d5f24b46bf 100644
> >> --- a/drivers/usb/gadget/function/uvc.h
> >> +++ b/drivers/usb/gadget/function/uvc.h
> >> @@ -151,6 +151,7 @@ struct uvc_device {
> >>  	void *control_buf;
> >>
> >>  	unsigned int streaming_intf;
> >> +	unsigned char streaming_request;
> >>
> >>  	/* Events */
> >>  	unsigned int event_length;
> >> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> >> index a189b08bba800d..a12475d289167a 100644
> >> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> >> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> >> @@ -178,6 +178,67 @@ static struct uvcg_frame *find_closest_frame_by_size(struct uvc_device *uvc,
> >>   * Requests handling
> >>   */
> >>
> >> +/* validate and fixup streaming ctrl request response data if possible */
> >> +static void
> >> +uvc_validate_streaming_ctrl(struct uvc_device *uvc,
> >> +			    struct uvc_streaming_control *ctrl)
> >> +{
> >> +	struct f_uvc_opts *opts = fi_to_f_uvc_opts(uvc->func.fi);
> >> +	unsigned int iformat, iframe;
> >> +	struct uvcg_format *uformat;
> >> +	struct uvcg_frame *uframe;
> >> +	bool ival_found = false;
> >> +	int i;
> >> +
> >> +	iformat = ctrl->bFormatIndex;
> >> +	iframe = ctrl->bFrameIndex;
> >> +
> >> +	/* Restrict the iformat, iframe and dwFrameInterval to valid values.
> >> +	 * Negative values for iformat and iframe will result in the maximum
> >> +	 * valid value being selected
> >> +	 */
> >> +	iformat = clamp((unsigned int)iformat, 1U,
> >> +			(unsigned int)uvc->header->num_fmt);
> >> +	if (iformat != ctrl->bFormatIndex) {
> >> +		uvcg_dbg(&uvc->func,
> >> +			  "userspace set invalid format index - fixup\n");
> >> +		ctrl->bFormatIndex = iformat;
> >> +	}
> >> +	uformat = find_format_by_index(uvc, iformat);
> >> +
> >> +	iframe = clamp((unsigned int)iframe, 1U,
> >> +		       (unsigned int)uformat->num_frames);
> >> +	if (iframe != ctrl->bFrameIndex) {
> >> +		uvcg_dbg(&uvc->func,
> >> +			  "userspace set invalid frame index - fixup\n");
> >> +		ctrl->bFrameIndex = iframe;
> >> +	}
> >> +	uframe = find_frame_by_index(uvc, uformat, iframe);
> >> +
> >> +	if (ctrl->dwFrameInterval) {
> >> +		for (i = 0; i < uframe->frame.b_frame_interval_type; i++) {
> >> +			if (ctrl->dwFrameInterval ==
> >> +				 uframe->dw_frame_interval[i])
> >> +				ival_found = true;
> >> +		}
> >> +	}
> >> +	if (!ival_found) {
> >> +		uvcg_dbg(&uvc->func,
> >> +			  "userspace set invalid frame interval - fixup\n");
> >> +		ctrl->dwFrameInterval = uframe->frame.dw_default_frame_interval;
> >> +	}
> >> +
> >> +	if (!ctrl->dwMaxPayloadTransferSize ||
> >> +			ctrl->dwMaxPayloadTransferSize >
> >> +				opts->streaming_maxpacket)
> >> +		ctrl->dwMaxPayloadTransferSize = opts->streaming_maxpacket;
> >> +
> >> +	if (!ctrl->dwMaxVideoFrameSize ||
> >> +			ctrl->dwMaxVideoFrameSize >
> >> +				uframe->frame.dw_max_video_frame_buffer_size)
> >> +		ctrl->dwMaxVideoFrameSize = uvc_get_frame_size(uformat, uframe);
> >> +}
> >> +
> >>  static int
> >>  uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
> >>  {
> >> @@ -192,6 +253,21 @@ uvc_send_response(struct uvc_device *uvc, struct uvc_request_data *data)
> >>
> >>  	memcpy(req->buf, data->data, req->length);
> >>
> >> +	/* validate the ctrl content and fixup */
> >> +	if (!uvc->event_setup_out) {
> >> +		struct uvc_streaming_control *ctrl = req->buf;
> >> +
> >> +		switch (uvc->streaming_request) {
> >> +		case UVC_GET_CUR:
> >> +		case UVC_GET_MIN:
> >> +		case UVC_GET_MAX:
> >> +		case UVC_GET_DEF:
> >> +			uvc_validate_streaming_ctrl(uvc, ctrl);
> >> +		default:
> >> +			break;
> >> +		}
> >> +	}
> >> +
> >>  	return usb_ep_queue(cdev->gadget->ep0, req, GFP_KERNEL);
> >>  }
> >>

-- 
Regards,

Laurent Pinchart
