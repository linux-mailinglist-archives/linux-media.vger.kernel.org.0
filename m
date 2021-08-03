Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D292C3DF42B
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 19:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233627AbhHCRxg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 13:53:36 -0400
Received: from gfs2.fields.utoronto.ca ([128.100.216.21]:33070 "EHLO
        gfs2.fields.utoronto.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233195AbhHCRxd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 13:53:33 -0400
Received: from fields.fields.utoronto.ca (fields.fields.utoronto.ca [128.100.216.11])
        by gfs2.fields.utoronto.ca (8.15.2/8.15.2/Fields_9.1_server_1625693608) with ESMTPS id 173HrAOI004854
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 3 Aug 2021 13:53:10 -0400
Received: from fields.fields.utoronto.ca (localhost [127.0.0.1])
        by fields.fields.utoronto.ca (8.15.2/8.15.2/Fields_9.1_workstation_1) with ESMTPS id 173HrAcT008299
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 3 Aug 2021 13:53:10 -0400
Received: from localhost (pspencer@localhost)
        by fields.fields.utoronto.ca (8.15.2/8.15.2/Submit) with ESMTP id 173HrAsG008296;
        Tue, 3 Aug 2021 13:53:10 -0400
Date:   Tue, 3 Aug 2021 13:53:10 -0400 (EDT)
From:   Philip Spencer <pspencer@fields.utoronto.ca>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] uvcvideo: Support devices that require SET_INTERFACE(0)
 before/after streaming
In-Reply-To: <YQlvXDCsM3DI6QIj@pendragon.ideasonboard.com>
Message-ID: <alpine.LFD.2.21.2108031300050.28227@fields.fields.utoronto.ca>
References: <alpine.LFD.2.21.2108021331010.12783@fields.fields.utoronto.ca> <alpine.LFD.2.21.2108031201460.28227@fields.fields.utoronto.ca> <YQlvXDCsM3DI6QIj@pendragon.ideasonboard.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Assessment: NotSpam -3.898/5 BAYES_00,SPF_HELO_NONE,SPF_NONE,FROM_LOCAL_MACHINE
X-Scanned-By: MIMEDefang 2.79
X-Greylist: No major spam indications; not delayed by milter-greylist-4.6.1 (gfs2.fields.utoronto.ca [128.100.216.26]); Tue, 03 Aug 2021 13:53:12 -0400 (EDT)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, 3 Aug 2021, Laurent Pinchart wrote:

> Hi Philip,
>
> On Tue, Aug 03, 2021 at 12:04:29PM -0400, Philip Spencer wrote:
> > On Mon, 2 Aug 2021, Philip Spencer wrote:
> >
> > > (This is my first kernel-related mailing list posting; my apologies if I have
> > > targeted wrong maintainers and/or lists. This is posted on the Ubuntu
> > > launchpad bug tracker at
> > > https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1938669 and it was
> > > suggested there that I post directly to the maintainers/mailing lists).
>
> Welcome to the kernel community :-)

Thank you!

> > My apologies; I thought I had set my mailer not to mangle the patches but
> > I hadn't. Resending properly formatted patch (I hope):
>
> Could you please resend the whole patch ? Otherwise I can't apply it
> easily with git-am.

By "whole patch" you mean the entire message, not just the "diff -up"
output? Yes, I can do that, but maybe after you decide what changes you'd
like to see in the patch based on your concerns below. I've added my
comments below too. Then I can prepare a new message with the revised
diff and commentary.

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
> > +	if (stream->intf->num_altsetting == 1)
> > +  		usb_set_interface(stream->dev->udev, stream->intfnum, 0);
>
> I'm concerned about this, as it may break other bulk devices that don't
> expect a SET_INTERFACE(0) request here.

The reason I thought it safe to put here was that they would get it anyway
if they got unbound from / rebound to the uvcvideo module, and they would
also get it if they returned an error response to the start transfer
request (because there is a SET_INTERFACE(0) call in the "error_video:"
goto block).

But I do agree it would be confusing to think of this as both a "start
streaming" and "stop streaming" call. I don't think it is correct to think
of this as a "start streaming" call as I don't see any justification for
that, but I was thinking of it more as a "device reset" type of call.

It is also present in uvc_video_suspend, and it is also called in
uvc_video_resume if the reset argument is true, so the device will already
be getting it in those circumstances (unless those routines are only used
for isochronous devices?)

Given your concerns, however, maybe it is best to just stick with this in
the stop_streaming routine (where it is already present for isochronous
devices and when suspending) and ditch the first part of the patch.

> It would be useful to know if Windows issues this request when starting
> streaming for bulk devices.

I don't have a Windows computers available where I'm set up to do any kind
of USB debugging. I would guess that it might issue it on stop_streaming,
but probably not on start_streaming.

If you have any pointers to documentation on how to set up USB/UVC
monitoring on a Windows computer I could try to test it with these
Epiphan devices.

>
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
>
> Does the device refuse any control request while streaming, or can you
> still set controls ? Does the driver print any error message in the
> kernel log when you stop and restart streaming without this patch ?

Controls (at least ones I tested, like brightness) can successfully be
both queried and changed while streaming, and can also successfully be
queried and changed after a stop streaming is done. There are no error
messages printed on either stop streaming or restart streaming. The only
thing that happens is that no buffers ever get dequeued on the second
streaming attempt -- as if the device is still trying to stream to the
(now empty) set of buffers from the first streaming. Controls can still be
queried and changed, however.

>
> > +	 */
> > +	usb_set_interface(stream->dev->udev, stream->intfnum, 0);
> > +
> > +	if (stream->intf->num_altsetting == 1) {
> >  		/* UVC doesn't specify how to inform a bulk-based device
> >  		 * when the video stream is stopped. Windows sends a
> >  		 * CLEAR_FEATURE(HALT) request to the video streaming
> >
> > > Video capture devices made by Epiphan Systems (vendor id 0x2b77) work once,
> > > but as soon as the video device is closed (or even if it is kept open but the
> > > application issues a VIDIOC_STREAMOFF ioctl) it won't work again - subsequent
> > > calls to VIDOC_DQBUF simply hang - until the device is unbound from and
> > > rebound to the uvcvideo module. (modprobe -r uvcvideo; modprobe uvcvideo also
> > > works).
> > >
> > > For example:
> > >
> > >   ffplay /dev/video0 -- works fine and shows the captured stream.
> > >
> > >   ffplay /dev/video0 -- when run a second time: hangs and does not capture
> > > anything
> > >
> > >   modprobe -r uvcvideo ; modprobe uvcvideo; ffplay /dev/video0 -- works fine
> > > again.
> > >
> > > Experimenting with the device and the uvcvideo module source code reveals that
> > > problem is the device is expecting SET_INTERFACE(0) to be sent to return it to
> > > a state where it can accept control requests and start streaming again.
> > >
> > > The code in uvc_video.c has several comments stating that some bulk-transfer
> > > devices require a SET_INTERFACE(0) call to be made before any control
> > > commands, even though 0 is already the default and only valid interface value.
> > > And, the function uvc_video_init makes such a call (which is why the device
> > > starts working again after rebinding to the uvcvideo module). But no such call
> > > is made when streaming is stopped then restarted.
> > >
> > > Furthermore, SET_INTERFACE(0) is the mechanism by which isochronous devices
> > > are told to stop streaming, and the comments in uvc_video_stop_streaming state
> > > that the UVC specification is unclear on how a bulk-based device should be
> > > told to stop streaming, so it is reasonable to imagine this particular
> > > bulk-based device might be expecting the same SET_INTERFACE(0) call that an
> > > isochronous device would get as means of being told to stop streaming.
>
> It would be quite confusing to use SET_INTERFACE(0) to instruct the
> device to start streaming *and* to stop streaming though. I think this
> has just not been properly thought of when the UVC specification was
> designed, it's undefined, and different devices likely implement
> different mechanisms :-(

Yes, it's definitely either a stop streaming instruction or a reset type
of instruction, not a start streaming instruction.
>
> > > The attached patch fixes the problem for these Epiphan devices by adding a
>
> s/This attached patch/This commit/ as it won't be attached anymore once
> we merge this.
>
> > > SET_INTERFACE(0) call in two places. Either one by itself is sufficient to
> > > resolve the symptoms but I think it is probably safest to include both.
>
> I think we should be cautious. UVC devices tend to be buggy in lots of
> different ways, you can't assume that something that is valid according
> to the USB and UVC specifications will not break some devices.

I will prepare a revised patch that only issues the SET_INTERFACE(0) call
as part of stop_streaming, where it is already done for isochronous
devices, and is already done in uvc_video_suspend, with comments to that
effect.

For exta safety, shall I build a bigger patch that adds a new hardware
quirk, sets it for the Epiphan vendor id (or I could even make it specific
to the device ids for the two models I've been testing with), and does the
call only if that quirk is set?

Let me know what you'd like and I'll prepare the appropriate revised
patch.

Thanks very much,

Philip

>
> > > The first hunk adds a SET_INTERFACE(0) call in uvc_video_start_streaming, but
> > > only in the bulk-based case where 0 is the only possible interface value (it
> > > won't mess with an isochronous device that might be set to a different
> > > interface).
> > >
> > > The second hunk modifies the behaviour of uvc_video_stop_streaming to call
> > > SET_INTERFACE(0) unconditionally instead of only calling it for isochronous
> > > devices. Since interface 0 should already be set on non-isochronous devices,
> > > it should be safe to set it again, and this way devices that are expecting it
> > > as a signal to stop streaming will get it.
> > >
> > > The patch is against 5.4.137 but also applies cleanly to 5.14-rc3.
> > >
> > > --- a/drivers/media/usb/uvc/uvc_video.c	2021-08-01 10:19:19.343564026 -0400
> > > +++ b/drivers/media/usb/uvc/uvc_video.c	2021-08-01 10:38:54.234311440 -0400
> > > @@ -2108,6 +2081,15 @@ int uvc_video_start_streaming(struct uvc
> > >  {
> > >  	int ret;
> > >
> > > +	/* On a bulk-based device where there is only one alternate
> > > +	 * setting possibility, set it explicitly to 0. This should be
> > > +	 * the default value, but some devices (e.g. Epiphan Systems
> > > +	 * framegrabbers) freeze and won't restart streaming until they
> > > +	 * receive a SET_INTERFACE(0) request.
> > > +	 */
> > > +	if (stream->intf->num_altsetting == 1) +
> > > usb_set_interface(stream->dev->udev, stream->intfnum, 0);
> > > +
> > >  	ret = uvc_video_clock_init(stream);
> > >  	if (ret < 0)
> > >  		return ret;
> > > @@ -2135,9 +2117,17 @@ void uvc_video_stop_streaming(struct uvc
> > >  {
> > >  	uvc_video_stop_transfer(stream, 1);
> > >
> > > -	if (stream->intf->num_altsetting > 1) {
> > > -		usb_set_interface(stream->dev->udev, stream->intfnum, 0);
> > > -	} else {
> > > +	/* On isochronous devices, switch back to interface 0 to move
> > > +	 * the device out of the "streaming" state.
> > > +	 *
> > > +	 * On bulk-based devices, this interface will already be selected
> > > +	 * but we re-select it explicitly because some devices seem to need
> > > +	 * a SET_INTERFACE(0) request to prepare them for receiving other
> > > +	 * control requests and/or to tell them to stop streaming.
> > > +	 */
> > > +	usb_set_interface(stream->dev->udev, stream->intfnum, 0);
> > > +
> > > +	if (stream->intf->num_altsetting == 1) {
> > >  		/* UVC doesn't specify how to inform a bulk-based device
> > >  		 * when the video stream is stopped. Windows sends a
> > >  		 * CLEAR_FEATURE(HALT) request to the video streaming
> > >
>
> --
> Regards,
>
> Laurent Pinchart
>

--------------------------------------------+-------------------------------
Philip Spencer  pspencer@fields.utoronto.ca | Director of Computing Services
Room 348        (416)-348-9710  ext3048     | The Fields Institute for
222 College St, Toronto ON M5T 3J1 Canada   | Research in Mathematical Sciences
