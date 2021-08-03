Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 782093DF28F
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 18:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233015AbhHCQbu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 12:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232662AbhHCQbu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 12:31:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1DAC061757;
        Tue,  3 Aug 2021 09:31:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB7713F0;
        Tue,  3 Aug 2021 18:31:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1628008296;
        bh=szAjbLMYnVTaIxc1Bcc/bna35bdig8dzvvk/QSrpxu4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bmTR+xAxX80VNOz3kTD4f947AyBR0VjbTJEIGiBi9aRwv2NJNvsqaCpFBJC5Mso8k
         aOHmUv3JbTvgMcrh2K9qFHaC5KWRtxvaYzKkIZUBJuPtRouILJ3A0U8ybWNKmFjs4J
         o3mjXORvcQnYY5b2fPI6iiV1raqOOb3qfP5Gs2Es=
Date:   Tue, 3 Aug 2021 19:31:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Philip Spencer <pspencer@fields.utoronto.ca>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] uvcvideo: Support devices that require SET_INTERFACE(0)
 before/after streaming
Message-ID: <YQlvXDCsM3DI6QIj@pendragon.ideasonboard.com>
References: <alpine.LFD.2.21.2108021331010.12783@fields.fields.utoronto.ca>
 <alpine.LFD.2.21.2108031201460.28227@fields.fields.utoronto.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2108031201460.28227@fields.fields.utoronto.ca>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philip,

On Tue, Aug 03, 2021 at 12:04:29PM -0400, Philip Spencer wrote:
> On Mon, 2 Aug 2021, Philip Spencer wrote:
> 
> > (This is my first kernel-related mailing list posting; my apologies if I have
> > targeted wrong maintainers and/or lists. This is posted on the Ubuntu
> > launchpad bug tracker at
> > https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1938669 and it was
> > suggested there that I post directly to the maintainers/mailing lists).

Welcome to the kernel community :-)

> My apologies; I thought I had set my mailer not to mangle the patches but
> I hadn't. Resending properly formatted patch (I hope):

Could you please resend the whole patch ? Otherwise I can't apply it
easily with git-am.

> --- a/drivers/media/usb/uvc/uvc_video.c	2021-08-01 10:19:19.343564026 -0400
> +++ b/drivers/media/usb/uvc/uvc_video.c	2021-08-01 10:38:54.234311440 -0400
> @@ -2108,6 +2081,15 @@ int uvc_video_start_streaming(struct uvc
>  {
>  	int ret;
> 
> +	/* On a bulk-based device where there is only one alternate
> +	 * setting possibility, set it explicitly to 0. This should be
> +	 * the default value, but some devices (e.g. Epiphan Systems
> +	 * framegrabbers) freeze and won't restart streaming until they
> +	 * receive a SET_INTERFACE(0) request.
> +	 */
> +	if (stream->intf->num_altsetting == 1)
> +  		usb_set_interface(stream->dev->udev, stream->intfnum, 0);

I'm concerned about this, as it may break other bulk devices that don't
expect a SET_INTERFACE(0) request here.

It would be useful to know if Windows issues this request when starting
streaming for bulk devices.

> +
>  	ret = uvc_video_clock_init(stream);
>  	if (ret < 0)
>  		return ret;
> @@ -2135,9 +2117,17 @@ void uvc_video_stop_streaming(struct uvc
>  {
>  	uvc_video_stop_transfer(stream, 1);
> 
> -	if (stream->intf->num_altsetting > 1) {
> -		usb_set_interface(stream->dev->udev, stream->intfnum, 0);
> -	} else {
> +	/* On isochronous devices, switch back to interface 0 to move
> +	 * the device out of the "streaming" state.
> +	 *
> +	 * On bulk-based devices, this interface will already be selected
> +	 * but we re-select it explicitly because some devices seem to need
> +	 * a SET_INTERFACE(0) request to prepare them for receiving other
> +	 * control requests and/or to tell them to stop streaming.

Does the device refuse any control request while streaming, or can you
still set controls ? Does the driver print any error message in the
kernel log when you stop and restart streaming without this patch ?

> +	 */
> +	usb_set_interface(stream->dev->udev, stream->intfnum, 0);
> +
> +	if (stream->intf->num_altsetting == 1) {
>  		/* UVC doesn't specify how to inform a bulk-based device
>  		 * when the video stream is stopped. Windows sends a
>  		 * CLEAR_FEATURE(HALT) request to the video streaming
> 
> > Video capture devices made by Epiphan Systems (vendor id 0x2b77) work once,
> > but as soon as the video device is closed (or even if it is kept open but the
> > application issues a VIDIOC_STREAMOFF ioctl) it won't work again - subsequent
> > calls to VIDOC_DQBUF simply hang - until the device is unbound from and
> > rebound to the uvcvideo module. (modprobe -r uvcvideo; modprobe uvcvideo also
> > works).
> >
> > For example:
> >
> >   ffplay /dev/video0 -- works fine and shows the captured stream.
> >
> >   ffplay /dev/video0 -- when run a second time: hangs and does not capture
> > anything
> >
> >   modprobe -r uvcvideo ; modprobe uvcvideo; ffplay /dev/video0 -- works fine
> > again.
> >
> > Experimenting with the device and the uvcvideo module source code reveals that
> > problem is the device is expecting SET_INTERFACE(0) to be sent to return it to
> > a state where it can accept control requests and start streaming again.
> >
> > The code in uvc_video.c has several comments stating that some bulk-transfer
> > devices require a SET_INTERFACE(0) call to be made before any control
> > commands, even though 0 is already the default and only valid interface value.
> > And, the function uvc_video_init makes such a call (which is why the device
> > starts working again after rebinding to the uvcvideo module). But no such call
> > is made when streaming is stopped then restarted.
> >
> > Furthermore, SET_INTERFACE(0) is the mechanism by which isochronous devices
> > are told to stop streaming, and the comments in uvc_video_stop_streaming state
> > that the UVC specification is unclear on how a bulk-based device should be
> > told to stop streaming, so it is reasonable to imagine this particular
> > bulk-based device might be expecting the same SET_INTERFACE(0) call that an
> > isochronous device would get as means of being told to stop streaming.

It would be quite confusing to use SET_INTERFACE(0) to instruct the
device to start streaming *and* to stop streaming though. I think this
has just not been properly thought of when the UVC specification was
designed, it's undefined, and different devices likely implement
different mechanisms :-(

> > The attached patch fixes the problem for these Epiphan devices by adding a

s/This attached patch/This commit/ as it won't be attached anymore once
we merge this.

> > SET_INTERFACE(0) call in two places. Either one by itself is sufficient to
> > resolve the symptoms but I think it is probably safest to include both.

I think we should be cautious. UVC devices tend to be buggy in lots of
different ways, you can't assume that something that is valid according
to the USB and UVC specifications will not break some devices.

> > The first hunk adds a SET_INTERFACE(0) call in uvc_video_start_streaming, but
> > only in the bulk-based case where 0 is the only possible interface value (it
> > won't mess with an isochronous device that might be set to a different
> > interface).
> >
> > The second hunk modifies the behaviour of uvc_video_stop_streaming to call
> > SET_INTERFACE(0) unconditionally instead of only calling it for isochronous
> > devices. Since interface 0 should already be set on non-isochronous devices,
> > it should be safe to set it again, and this way devices that are expecting it
> > as a signal to stop streaming will get it.
> >
> > The patch is against 5.4.137 but also applies cleanly to 5.14-rc3.
> >
> > --- a/drivers/media/usb/uvc/uvc_video.c	2021-08-01 10:19:19.343564026 -0400
> > +++ b/drivers/media/usb/uvc/uvc_video.c	2021-08-01 10:38:54.234311440 -0400
> > @@ -2108,6 +2081,15 @@ int uvc_video_start_streaming(struct uvc
> >  {
> >  	int ret;
> >
> > +	/* On a bulk-based device where there is only one alternate
> > +	 * setting possibility, set it explicitly to 0. This should be
> > +	 * the default value, but some devices (e.g. Epiphan Systems
> > +	 * framegrabbers) freeze and won't restart streaming until they
> > +	 * receive a SET_INTERFACE(0) request.
> > +	 */
> > +	if (stream->intf->num_altsetting == 1) +
> > usb_set_interface(stream->dev->udev, stream->intfnum, 0);
> > +
> >  	ret = uvc_video_clock_init(stream);
> >  	if (ret < 0)
> >  		return ret;
> > @@ -2135,9 +2117,17 @@ void uvc_video_stop_streaming(struct uvc
> >  {
> >  	uvc_video_stop_transfer(stream, 1);
> >
> > -	if (stream->intf->num_altsetting > 1) {
> > -		usb_set_interface(stream->dev->udev, stream->intfnum, 0);
> > -	} else {
> > +	/* On isochronous devices, switch back to interface 0 to move
> > +	 * the device out of the "streaming" state.
> > +	 *
> > +	 * On bulk-based devices, this interface will already be selected
> > +	 * but we re-select it explicitly because some devices seem to need
> > +	 * a SET_INTERFACE(0) request to prepare them for receiving other
> > +	 * control requests and/or to tell them to stop streaming.
> > +	 */
> > +	usb_set_interface(stream->dev->udev, stream->intfnum, 0);
> > +
> > +	if (stream->intf->num_altsetting == 1) {
> >  		/* UVC doesn't specify how to inform a bulk-based device
> >  		 * when the video stream is stopped. Windows sends a
> >  		 * CLEAR_FEATURE(HALT) request to the video streaming
> >

-- 
Regards,

Laurent Pinchart
