Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E55810EDAD
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2019 18:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbfLBRDA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Dec 2019 12:03:00 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:34084 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727513AbfLBRDA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Dec 2019 12:03:00 -0500
Received: (qmail 4189 invoked by uid 2102); 2 Dec 2019 12:02:59 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 2 Dec 2019 12:02:59 -0500
Date:   Mon, 2 Dec 2019 12:02:59 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Michael Olbrich <m.olbrich@pengutronix.de>
cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 2/2] usb: dwc3: gadget: restart the transfer if a isoc
 request is queued too late
In-Reply-To: <20191202154120.o4yt266cat6uzxd7@pengutronix.de>
Message-ID: <Pine.LNX.4.44L0.1912021103470.1559-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2 Dec 2019, Michael Olbrich wrote:

> > > My current test-case is video frames with 450kB on average at 30fps. This
> > > currently results in ~10 CPU load for the threaded interrupt handler.
> > > At least in my test, filling the actual video data into the frame has very
> > > little impact. So if I reserve 900kB to support occasionally larger video
> > > frames, then I expect that this CPU load will almost double in all cases,
> > > not just when the video frames are larger.
> > 
> > This is the sort of thing you need to confirm by experimenting.  It is 
> > not at all clear that doubling the interrupt rate will also double the 
> > CPU load, especially if half of the interrupts don't require the CPU to 
> > do much work.
> 
> As I noted before, actually filling in the video data is only a small part
> of the measured CPU load. To put in in more precise numbers:
> 
> From my limited understanding, there are 8000 interrupts per second
> regardless of the bandwidth (or maybe less for very low bandwidth
> configurations?).
> Just queuing requests without any content (so skipping the buffer handling
> and 'encode()' in uvc_video_complete()) results in ~17% CPU load.

Can you tell dwc3 to request only 4000 interrupts per second?  Or 2000?
Or even 60?

> If I fill in the data for a video stream with ~1.8MB per frame and 30 fps
> (and empty requests for the rest) then the CPU load goes up to ~19.5%.

I assume you're talking about a SuperSpeed USB connection here, since 
high speed can handle no more than 0.8 MB per frame at 30 fps.

> This number remains the same for different bandwidths (and therefore
> different request sizes and a different zero-length request percentage).
> 
> With my patches the CPU load changes as expected. The 2.5% to fill the data
> remains and the rest goes down with less interrupts.
> 
> I am hoping that more batching will help here a bit. But either way the
> overhead of queuing zero-length request is significant.

Hmmm.  It may be that my thinking has been prejudiced by a 
host-centered attitude, and things may work out different on the gadget 
side.

There's one aspect I'm not clear on.  Suppose you decide to skip
submitting requests for USB microframes 5 - 7 (at 8000 microframes
per second, as you mentioned) and then submit a request to be queued
for microframe 8.  How does the UDC driver know which microframe to use
for that request?  Does it always use the first available microframe?


> My problem is this:
> Let's assume a (for simplicity) that I have a video stream that fills
> almost the full available bandwidth. And two reduce the bandwidth, two
> interrupts will be requested for each video frame.

Let's assume the video frame rate is 30 fps.  Since you say almost the
full available bandwidth is in use, the number of USB microframes per
video frame must be just under 8000 / 30, or around 266.

> - When the first frame arrives, the whole frame is queued.

Requiring 266 microframes, let's say starting at microframe 0.

> - When the first half of the frame is transmitted the first interrupt
>   arrives.

That would be at microframe 133.

> - The second frame has not yet arrived so half a frame worth of 0-length
>   requests are queued.

133 microframes, extending out to microframe 399.

> - When the second half of the frame is transmitted the second interrupt
>   arrives.

At the end of microframe 266.

> - The second frame has still not yet arrived so another half a frame worth
>   of 0-length requests are queued.

At this point, it has been about 266/8000 s = 33.25 ms since the first 
video frame arrived.  But at a rate of 30 fps, the interval between 
frames should be 33.33 ms.  So either something is wrong or else the 
second frame is just about to arrive.

(Since the frame rate is slightly lower than the rate of transmission
of the USB data, it's inevitable that every so often you'll get an
interrupt just before a frame arrives.)

> - Immediately afterwards the second frame arrives from userspace. At this
>   point, almost one frame worth of 0-length requests are queued so the
>   second frame will have an extra latency of almost one frame.

I see.  There is another way to approach this, however.  When you get a
USB interrupt and no video data is available, nothing says you have to
queue an entire frame (or half-frame) worth of 0-length packets.  
Instead, queue a request containing 2 ms (for example) of 0-length
packets.  Presumably the next video frame will arrive during those 2 ms
(since it's _expected_ to arrive in no more than 0.08 ms), and from
then on you'll be okay until once again the USB data has caught up to
the video data.

On the other hand, I don't know how the UVC driver manages the
alignment between USB packets and video frames on the host end.  
Perhaps it would prefer something slightly different -- that would be
another good question to ask the UVC maintainer (CC'ed).

> With my patch this does not happen and the transmission of the second
> starts immediately.

> The question is, can we do better than that? What could be done in the
> driver if it knows that 0-length requests must be transmitted because no
> new data is available?

It does seems reasonable to require that when a UDC driver encounters a
gap in an isochronous stream, it should associate the next request with
the first available microframe.  If dcw3 did that then you wouldn't 
have to worry about filling extra space with 0-length packets.

But if we make this change, it should be documented in an appropriate
place and it should apply to all UDC drivers -- not just dwc3.

Alan Stern

