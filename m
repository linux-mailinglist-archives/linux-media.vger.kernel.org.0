Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 247906C7BE4
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 10:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbjCXJtB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 05:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjCXJs6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 05:48:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A73E65A9;
        Fri, 24 Mar 2023 02:48:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63932A58;
        Fri, 24 Mar 2023 10:48:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679651334;
        bh=vNcmCDNvm9Z+LMhyE/DCnHGIcH41sIoiH6gUb/T9Oyk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ysh3w3/jGi24/IlmaDuMS7vCW0BltXvwrGozjgbJ5QMwOIyPY8mO8SWgG3h3UqaJ+
         8jFCj9gEIxvWtFnOt4gRu+0FKIICui/coR9Bo2c2v7vZkR+neAVAwuNi4VU/E/62+o
         MTVFDkDfZ8CxM3I3hzCp4gnHVnR/se03/wyh2/W4=
Date:   Fri, 24 Mar 2023 11:49:00 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 3/8] usb: gadget: uvc: implement s/g_output ioctl
Message-ID: <20230324094900.GL18895@pendragon.ideasonboard.com>
References: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
 <20230323-uvc-gadget-cleanup-v1-3-e41f0c5d9d8e@pengutronix.de>
 <20230324092021.GC18895@pendragon.ideasonboard.com>
 <79c319ab-1d65-f3cf-473c-ca4cd502c1f9@ideasonboard.com>
 <caa72a5c-a40f-e5e1-84c5-44d376cbe87c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <caa72a5c-a40f-e5e1-84c5-44d376cbe87c@xs4all.nl>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Mar 24, 2023 at 10:39:13AM +0100, Hans Verkuil wrote:
> On 24/03/2023 10:21, Dan Scally wrote:
> > On 24/03/2023 09:20, Laurent Pinchart wrote:
> >> Hi Michael,
> >>
> >> (CC'ing Hans)
> >>
> >> Thank you for the patch.
> >>
> >> On Thu, Mar 23, 2023 at 12:41:11PM +0100, Michael Tretter wrote:
> >>> V4L2 OUTPUT devices should implement ENUM_OUTPUT, G_OUTPUT, and
> >>> S_OUTPUT. The UVC gadget provides only a single output. Therefore, allow
> >>> only a single output 0.
> >>>
> >>> According to the documentation, "_TYPE_ANALOG" is historical and should
> >>> be read as "_TYPE_VIDEO".
> >> I think v4l2-compliance should be fixed to not require those ioctls. As
> >> this patch clearly shows, they're useless :-)
> 
> They are not useless. An application doesn't know how many outputs there are,
> and what type they are. Just because there is only one output, doesn't mean
> you can skip this.
> 
> The application also has to know the capabilities of the output.

In the generic case, possibly, but for the UVC gadget that's not
relevant. The driver requires a specialized userspace application that
handles driver-specific events and ioctls to operate, so there's no need
for output enumeration.

> Now, it can be useful to add some helper functions for this to v4l2-common.c,
> at least for g/s_output.

I would indeed much rather provide default implementations in
v4l2-common.c, and call them automatically from v4l2-ioctl.c when the
driver doesn't provide custom handlers for those ioctls.

> Regards,
> 
> 	Hans
> 
> > +1 for this vote
> 
> >>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> >>> ---
> >>>   drivers/usb/gadget/function/uvc_v4l2.c | 28 ++++++++++++++++++++++++++++
> >>>   1 file changed, 28 insertions(+)
> >>>
> >>> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> >>> index 13c7ba06f994..4b8bf94e06fc 100644
> >>> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> >>> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> >>> @@ -377,6 +377,31 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
> >>>       return 0;
> >>>   }
> >>>   +static int
> >>> +uvc_v4l2_enum_output(struct file *file, void *priv_fh, struct v4l2_output *out)
> >>> +{
> >>> +    if (out->index != 0)
> >>> +        return -EINVAL;
> >>> +
> >>> +    out->type = V4L2_OUTPUT_TYPE_ANALOG;
> >>> +    snprintf(out->name, sizeof(out->name), "UVC");
> >>> +
> >>> +    return 0;
> >>> +}
> >>> +
> >>> +static int
> >>> +uvc_v4l2_g_output(struct file *file, void *priv_fh, unsigned int *i)
> >>> +{
> >>> +    *i = 0;
> >>> +    return 0;
> >>> +}
> >>> +
> >>> +static int
> >>> +uvc_v4l2_s_output(struct file *file, void *priv_fh, unsigned int i)
> >>> +{
> >>> +    return i ? -EINVAL : 0;
> >>> +}
> >>> +
> >>>   static int
> >>>   uvc_v4l2_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *b)
> >>>   {
> >>> @@ -547,6 +572,9 @@ const struct v4l2_ioctl_ops uvc_v4l2_ioctl_ops = {
> >>>       .vidioc_enum_frameintervals = uvc_v4l2_enum_frameintervals,
> >>>       .vidioc_enum_framesizes = uvc_v4l2_enum_framesizes,
> >>>       .vidioc_enum_fmt_vid_out = uvc_v4l2_enum_format,
> >>> +    .vidioc_enum_output = uvc_v4l2_enum_output,
> >>> +    .vidioc_g_output = uvc_v4l2_g_output,
> >>> +    .vidioc_s_output = uvc_v4l2_s_output,
> >>>       .vidioc_reqbufs = uvc_v4l2_reqbufs,
> >>>       .vidioc_querybuf = uvc_v4l2_querybuf,
> >>>       .vidioc_qbuf = uvc_v4l2_qbuf,

-- 
Regards,

Laurent Pinchart
