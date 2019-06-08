Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C59339BE0
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 10:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfFHIhc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jun 2019 04:37:32 -0400
Received: from gofer.mess.org ([88.97.38.141]:35439 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbfFHIhb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 8 Jun 2019 04:37:31 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C410860570; Sat,  8 Jun 2019 09:37:29 +0100 (BST)
Date:   Sat, 8 Jun 2019 09:37:29 +0100
From:   Sean Young <sean@mess.org>
To:     A Sun <as1033x@comcast.net>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 3/3] [media] mceusb: Show USB halt/stall error recovery
Message-ID: <20190608083729.bw47vkplpf3r4e4b@gofer.mess.org>
References: <999ae5cd-d72b-983f-2f96-5aaca72e8214@comcast.net>
 <43f4ef6e-2c64-cd7a-26f7-3c1309b68936@comcast.net>
 <20190606095337.jfhmc6jqgyhmxn4q@gofer.mess.org>
 <2548e827-1d11-4ce2-013f-bf36c9f5436e@comcast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2548e827-1d11-4ce2-013f-bf36c9f5436e@comcast.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, Jun 06, 2019 at 05:11:04PM -0400, A Sun wrote:
> Hi Sean,
> 
> Thanks again for reviewing my patch submission.
> 
> This patch updates mceusb RX and TX HALT error handling and recovery reporting,
> and provides placeholder for a later patch.
> 
> The possible later patch would have mceusb call usb_reset_device() in place of the
> new "... requires USB Reset ..." message. I say "possible" because I'm running into
> multiple issues invoking usb_reset_device() from within mceusb.
> 
> I'll also mention the difficulty obtaining even a single fault replication
> (~ 1/month) and test cycle.

OK, thank you.

> Additional comments below...  ..A Sun
> 
> On 6/6/2019 5:53 AM, Sean Young wrote:
> > On Sat, Jun 01, 2019 at 07:35:09PM -0400, A Sun wrote:

-snip-

 >> Additional findings are "modprobe -r mceusb" and "modprobe mceusb"
> >> are unable to clear stuck RX or TX HALT state.
> >> Attempts to call usb_reset_endpoint() and usb_reset_configuration()
> >> from within the mceusb driver also did not clear stuck HALTs.
> >>
> >> A possible future patch could have the mceusb call usb_reset_device()
> >> on itself, when necessary. Limiting the number of HALT error recovery
> >> attempts may also be necessary to prevent halt/clear-halt loops.
> >>
> >> Unresolved for now, deadlock complications occur if mceusb's worker
> >> thread, mceusb_deferred_kevent(), calls usb_reset_device(),
> >> which calls mceusb_dev_disconnect(), which calls cancel_work_sync(),
> >> which waits on the still active worker thread.
> > 
> > I think you can call usb_lock_device_for_reset() to prevent that problem.
> 
> Deadlock still occurs in test:
> mceusb_deferred_kevent()
>     ->usb_reset_device()
>         ->mceusb_dev_disconnect()
>             ->cancel_work_sync()
> where cancel_work_sync() blocks because mceusb_deferred_kevent() is active.

I understand. The usb_reset_device() does not need to happen synchronously
in mceusb_deferred_kevent(). Possibly another delayed workqueue.

Actually there is also a function usb_queue_reset_device() which might do
what you want here.

> 
> > It would be nice to see this implemented too.
> > 
> 
> Any additional tips to implement would help!
> How to validate and test a rare condition with a larger audience?

This is hard. Do you know the model of the mceusb and host hardware?

> >>
> >> Signed-off-by: A Sun <as1033x@comcast.net>
> >> ---
> >>  drivers/media/rc/mceusb.c | 35 +++++++++++++++++++++++++----------
> >>  1 file changed, 25 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
> >> index efffb1795..5d81ccafc 100644
> >> --- a/drivers/media/rc/mceusb.c
> >> +++ b/drivers/media/rc/mceusb.c
> >> @@ -765,7 +765,7 @@ static void mceusb_defer_kevent(struct mceusb_dev *ir, int kevent)
> >>  {
> >>  	set_bit(kevent, &ir->kevent_flags);
> >>  	if (!schedule_work(&ir->kevent))
> >> -		dev_err(ir->dev, "kevent %d may have been dropped", kevent);
> >> +		dev_dbg(ir->dev, "kevent %d already scheduled", kevent);
> >>  	else
> >>  		dev_dbg(ir->dev, "kevent %d scheduled", kevent);
> >>  }
> >> @@ -1404,19 +1404,26 @@ static void mceusb_deferred_kevent(struct work_struct *work)
> >>  		container_of(work, struct mceusb_dev, kevent);
> >>  	int status;
> >>  
> >> +	dev_info(ir->dev, "kevent handler called (flags 0x%lx)",
> >> +		 ir->kevent_flags);
> >> +
> >>  	if (test_bit(EVENT_RX_HALT, &ir->kevent_flags)) {
> >>  		usb_unlink_urb(ir->urb_in);
> >>  		status = usb_clear_halt(ir->usbdev, ir->pipe_in);
> >> +		dev_err(ir->dev, "rx clear halt status = %d", status);
> >>  		if (status < 0) {
> >> -			dev_err(ir->dev, "rx clear halt error %d",
> >> -				status);
> >> -		}
> >> -		clear_bit(EVENT_RX_HALT, &ir->kevent_flags);
> >> -		if (status == 0) {
> >> +			/*
> >> +			 * Unable to clear RX stall/halt.
> >> +			 * Will need to call usb_reset_device().
> >> +			 */
> >> +			dev_err(ir->dev,
> >> +				"stuck RX HALT state requires USB Reset Device to clear");
> > 
> > Here you say if the usb_clear_halt() returns < 0 then we're in the bad
> > code path. But in this code path, we're not re-submitting the urb so
> > we wouldn't end up in an infinite loop.
> > 
> 
> The theory for the infinite loop case is usb_clear_halt() returned 0.
> The infinite loop isn't resolved with this patch.
> 
> > 
> >> +		} else {
> >> +			clear_bit(EVENT_RX_HALT, &ir->kevent_flags);
> > 
> > Why have you moved this line?
> > 
> 
> Clear bit but only if usb_clear_halt() recovery succeeds.

To what affect? Will it be attempted again? Might it cause an infinite
loop?
> 
> A future usb_device_reset() operation affects both RX and TX and its
> success code path must clear both EVENT_RX_HALT and EVENT_TX_HALT
> and do its own usb_submit_urb() with message "rx reset device submit urb status = %d"
> 
> Hence, the moved line.

That's in a future patch. Please only change error strings in this patch.

Thanks,

Sean
