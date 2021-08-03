Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E910B3DF20F
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 18:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbhHCQEx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 12:04:53 -0400
Received: from gfs2.fields.utoronto.ca ([128.100.216.21]:43722 "EHLO
        gfs2.fields.utoronto.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231688AbhHCQEt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 12:04:49 -0400
Received: from fields.fields.utoronto.ca (fields.fields.utoronto.ca [128.100.216.11])
        by gfs2.fields.utoronto.ca (8.15.2/8.15.2/Fields_9.1_server_1625693608) with ESMTPS id 173G4TBJ018403
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Aug 2021 12:04:29 -0400
Received: from fields.fields.utoronto.ca (localhost [127.0.0.1])
        by fields.fields.utoronto.ca (8.15.2/8.15.2/Fields_9.1_workstation_1) with ESMTPS id 173G4TsO004962
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 3 Aug 2021 12:04:29 -0400
Received: from localhost (pspencer@localhost)
        by fields.fields.utoronto.ca (8.15.2/8.15.2/Submit) with ESMTP id 173G4T4H004959;
        Tue, 3 Aug 2021 12:04:29 -0400
Date:   Tue, 3 Aug 2021 12:04:29 -0400 (EDT)
From:   Philip Spencer <pspencer@fields.utoronto.ca>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] uvcvideo: Support devices that require SET_INTERFACE(0)
 before/after streaming
In-Reply-To: <alpine.LFD.2.21.2108021331010.12783@fields.fields.utoronto.ca>
Message-ID: <alpine.LFD.2.21.2108031201460.28227@fields.fields.utoronto.ca>
References: <alpine.LFD.2.21.2108021331010.12783@fields.fields.utoronto.ca>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Assessment: NotSpam -3.898/5 BAYES_00,SPF_HELO_NONE,SPF_NONE,FROM_LOCAL_MACHINE
X-Scanned-By: MIMEDefang 2.79
X-Greylist: No major spam indications; not delayed by milter-greylist-4.6.1 (gfs2.fields.utoronto.ca [128.100.216.26]); Tue, 03 Aug 2021 12:04:31 -0400 (EDT)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2 Aug 2021, Philip Spencer wrote:

> (This is my first kernel-related mailing list posting; my apologies if I have
> targeted wrong maintainers and/or lists. This is posted on the Ubuntu
> launchpad bug tracker at
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1938669 and it was
> suggested there that I post directly to the maintainers/mailing lists).

My apologies; I thought I had set my mailer not to mangle the patches but
I hadn't. Resending properly formatted patch (I hope):

--- a/drivers/media/usb/uvc/uvc_video.c	2021-08-01 10:19:19.343564026 -0400
+++ b/drivers/media/usb/uvc/uvc_video.c	2021-08-01 10:38:54.234311440 -0400
@@ -2108,6 +2081,15 @@ int uvc_video_start_streaming(struct uvc
 {
 	int ret;

+	/* On a bulk-based device where there is only one alternate
+	 * setting possibility, set it explicitly to 0. This should be
+	 * the default value, but some devices (e.g. Epiphan Systems
+	 * framegrabbers) freeze and won't restart streaming until they
+	 * receive a SET_INTERFACE(0) request.
+	 */
+	if (stream->intf->num_altsetting == 1)
+  		usb_set_interface(stream->dev->udev, stream->intfnum, 0);
+
 	ret = uvc_video_clock_init(stream);
 	if (ret < 0)
 		return ret;
@@ -2135,9 +2117,17 @@ void uvc_video_stop_streaming(struct uvc
 {
 	uvc_video_stop_transfer(stream, 1);

-	if (stream->intf->num_altsetting > 1) {
-		usb_set_interface(stream->dev->udev, stream->intfnum, 0);
-	} else {
+	/* On isochronous devices, switch back to interface 0 to move
+	 * the device out of the "streaming" state.
+	 *
+	 * On bulk-based devices, this interface will already be selected
+	 * but we re-select it explicitly because some devices seem to need
+	 * a SET_INTERFACE(0) request to prepare them for receiving other
+	 * control requests and/or to tell them to stop streaming.
+	 */
+	usb_set_interface(stream->dev->udev, stream->intfnum, 0);
+
+	if (stream->intf->num_altsetting == 1) {
 		/* UVC doesn't specify how to inform a bulk-based device
 		 * when the video stream is stopped. Windows sends a
 		 * CLEAR_FEATURE(HALT) request to the video streaming


>
> Video capture devices made by Epiphan Systems (vendor id 0x2b77) work once,
> but as soon as the video device is closed (or even if it is kept open but the
> application issues a VIDIOC_STREAMOFF ioctl) it won't work again - subsequent
> calls to VIDOC_DQBUF simply hang - until the device is unbound from and
> rebound to the uvcvideo module. (modprobe -r uvcvideo; modprobe uvcvideo also
> works).
>
> For example:
>
>   ffplay /dev/video0 -- works fine and shows the captured stream.
>
>   ffplay /dev/video0 -- when run a second time: hangs and does not capture
> anything
>
>   modprobe -r uvcvideo ; modprobe uvcvideo; ffplay /dev/video0 -- works fine
> again.
>
> Experimenting with the device and the uvcvideo module source code reveals that
> problem is the device is expecting SET_INTERFACE(0) to be sent to return it to
> a state where it can accept control requests and start streaming again.
>
> The code in uvc_video.c has several comments stating that some bulk-transfer
> devices require a SET_INTERFACE(0) call to be made before any control
> commands, even though 0 is already the default and only valid interface value.
> And, the function uvc_video_init makes such a call (which is why the device
> starts working again after rebinding to the uvcvideo module). But no such call
> is made when streaming is stopped then restarted.
>
> Furthermore, SET_INTERFACE(0) is the mechanism by which isochronous devices
> are told to stop streaming, and the comments in uvc_video_stop_streaming state
> that the UVC specification is unclear on how a bulk-based device should be
> told to stop streaming, so it is reasonable to imagine this particular
> bulk-based device might be expecting the same SET_INTERFACE(0) call that an
> isochronous device would get as means of being told to stop streaming.
>
> The attached patch fixes the problem for these Epiphan devices by adding a
> SET_INTERFACE(0) call in two places. Either one by itself is sufficient to
> resolve the symptoms but I think it is probably safest to include both.
>
> The first hunk adds a SET_INTERFACE(0) call in uvc_video_start_streaming, but
> only in the bulk-based case where 0 is the only possible interface value (it
> won't mess with an isochronous device that might be set to a different
> interface).
>
> The second hunk modifies the behaviour of uvc_video_stop_streaming to call
> SET_INTERFACE(0) unconditionally instead of only calling it for isochronous
> devices. Since interface 0 should already be set on non-isochronous devices,
> it should be safe to set it again, and this way devices that are expecting it
> as a signal to stop streaming will get it.
>
> The patch is against 5.4.137 but also applies cleanly to 5.14-rc3.
>
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
> +	if (stream->intf->num_altsetting == 1) +
> usb_set_interface(stream->dev->udev, stream->intfnum, 0);
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
> +	 */
> +	usb_set_interface(stream->dev->udev, stream->intfnum, 0);
> +
> +	if (stream->intf->num_altsetting == 1) {
>  		/* UVC doesn't specify how to inform a bulk-based device
>  		 * when the video stream is stopped. Windows sends a
>  		 * CLEAR_FEATURE(HALT) request to the video streaming
>
> Philip
>
> --------------------------------------------+-------------------------------
> Philip Spencer  pspencer@fields.utoronto.ca | Director of Computing Services
> Room 348        (416)-348-9710  ext3048     | The Fields Institute for
> 222 College St, Toronto ON M5T 3J1 Canada   | Research in Mathematical
> Sciences
>

--------------------------------------------+-------------------------------
Philip Spencer  pspencer@fields.utoronto.ca | Director of Computing Services
Room 348        (416)-348-9710  ext3048     | The Fields Institute for
222 College St, Toronto ON M5T 3J1 Canada   | Research in Mathematical Sciences
