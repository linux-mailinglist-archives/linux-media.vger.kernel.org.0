Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC70746453D
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 04:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346386AbhLADIa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 22:08:30 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50916 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbhLADIO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 22:08:14 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAD692A5;
        Wed,  1 Dec 2021 04:04:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638327893;
        bh=srS3unrKV9eIwD6la9ncSzfe9yDFgixGWuXjcEQzyzE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LFM3pyNzrofLgQxhrQEwRrg5cRS2uzLGYJ6xBbdw35GZK2r8ldvmLZp3qABY7sCIO
         Xi1hoDswNIGnsjyoScY2QT9AadBQnOo7ZmSNwCamE05n6YmzGP/FF73jKhi/2lJFqd
         XSu/GRcCBZuCbn/assirmwUFH9FbEXBBbVQssFVk=
Date:   Wed, 1 Dec 2021 05:04:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] uvc: fix sequence counting
Message-ID: <YabmOi2tOBNqC8nI@pendragon.ideasonboard.com>
References: <0d3ee0aa-0f1f-4670-a5cc-8dd982e2e3b0@xs4all.nl>
 <CAPybu_0Z_Sa1OqVWVhK0RmPchxH1Z=N_BDZft66Bd-uBxpMTBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPybu_0Z_Sa1OqVWVhK0RmPchxH1Z=N_BDZft66Bd-uBxpMTBQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Fri, Nov 26, 2021 at 05:14:31PM +0100, Ricardo Ribalda Delgado wrote:
> Hello Hans
> 
> What if we make something like:
> 
> #define UVC_STREAM_FID_UNINITIALISED (UVC_STREAM_FID + 1)
> 
> and then use that define at the initialization and in decode_start() ?
> I think it will be clearer than the current comparison.
> 
> 
> Also you might want to wait to assign "stream->last_fid = fid;" until
> line 1106, because otherwise the "Dropping payload" will be triggered
> (I believe)
> 
> Thanks!
> 
> PS: You will get better response time if you email me at
> ribalda@chromium.org , not much time recently for the personal email
> :(
> 
> On Wed, Nov 24, 2021 at 11:49 AM Hans Verkuil wrote:
> >
> > When you start streaming from uvc, then the first buffer will
> > have sequence number 0 and the second buffer has sequence number
> > 2. Fix the logic to ensure proper monotonically increasing sequence
> > numbers.
> >
> > The root cause is not setting last_fid when you start streaming
> > and a new fid is found for the first time.

I can confirm the issue with my device, but this short explanation
doesn't really tell me where the problem comes from. Could you elaborate
on this, maybe with a detailed sequence ?

> > This patch also changes the initial last_fid value from -1 to 0xff.
> > Since last_fid is unsigned, it is better to stick to unsigned values.

Maybe U8_MAX then ?

> > Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index 9f37eaf28ce7..8ba8d25e2c4a 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1055,7 +1055,10 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
> >          * that discontinuous sequence numbers always indicate lost frames.
> >          */
> >         if (stream->last_fid != fid) {
> > -               stream->sequence++;
> > +               if (stream->last_fid > UVC_STREAM_FID)
> > +                       stream->last_fid = fid;
> > +               else
> > +                       stream->sequence++;
> >                 if (stream->sequence)
> >                         uvc_video_stats_update(stream);
> >         }
> > @@ -1080,7 +1083,7 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
> >
> >         /* Synchronize to the input stream by waiting for the FID bit to be
> >          * toggled when the the buffer state is not UVC_BUF_STATE_ACTIVE.
> > -        * stream->last_fid is initialized to -1, so the first isochronous
> > +        * stream->last_fid is initialized to 0xff, so the first isochronous
> >          * frame will always be in sync.
> >          *
> >          * If the device doesn't toggle the FID bit, invert stream->last_fid
> > @@ -1111,7 +1114,7 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
> >          * last payload can be lost anyway). We thus must check if the FID has
> >          * been toggled.
> >          *
> > -        * stream->last_fid is initialized to -1, so the first isochronous
> > +        * stream->last_fid is initialized to 0xff, so the first isochronous
> >          * frame will never trigger an end of frame detection.
> >          *
> >          * Empty buffers (bytesused == 0) don't trigger end of frame detection
> > @@ -1895,7 +1898,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
> >         int ret;
> >
> >         stream->sequence = -1;
> > -       stream->last_fid = -1;
> > +       stream->last_fid = 0xff;
> >         stream->bulk.header_size = 0;
> >         stream->bulk.skip_payload = 0;
> >         stream->bulk.payload_size = 0;

-- 
Regards,

Laurent Pinchart
