Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38EE137F43
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 23:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbfFFVLF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 17:11:05 -0400
Received: from resqmta-po-11v.sys.comcast.net ([96.114.154.170]:60582 "EHLO
        resqmta-po-11v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725267AbfFFVLF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 17:11:05 -0400
Received: from resomta-po-19v.sys.comcast.net ([96.114.154.243])
        by resqmta-po-11v.sys.comcast.net with ESMTP
        id YzLjh9z7oQa0lYzf6hPaav; Thu, 06 Jun 2019 21:11:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
        s=20190202a; t=1559855464;
        bh=R/0iKT40BygdiRjv08CcPPNtWGPc2MrnPg9TL2+pDqk=;
        h=Received:Received:From:Subject:To:Message-ID:Date:MIME-Version:
         Content-Type;
        b=kNSmGe7xYUsY6IMa0nKaF8ugouKy3snY2qQKdafD80hiKFmnrjxKGkWpGX5gspfV1
         op1ycxTJx7V62Tbr+s+fs9C50XCweymIIeWJMEYLYZYWvrY53SgeEu37hFZtXA9oah
         2W1aolixO4MpkyoSX1gg0Ue9ltyaHLX1/5YpkVFu/wTvVSATW/y9/w/muZMtAgpCC7
         7XQDdoPW5QHZfcuTSRabTOVbL05aOMcccB7aMxBO5uFd6cHji9gqPM+NzAAbt7ga2L
         12Xty6X0G3cAMQAKldECl+BN3vsoPU26xxFlYRklnHc8WO4XAP/+Fd96wsQ07N9FQ6
         aSNmqagJg9iXw==
Received: from [192.168.4.4] ([73.248.220.215])
        by resomta-po-19v.sys.comcast.net with ESMTPA
        id Yzexhlwv6mPHJYzf4hdUCD; Thu, 06 Jun 2019 21:11:03 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgeduuddrudeggedgudehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucevohhmtggrshhtqdftvghsihdpqfgfvfdppffquffrtefokffrnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhuffvfhfkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeetucfuuhhnuceorghsuddtfeefgiestghomhgtrghsthdrnhgvtheqnecuffhomhgrihhnpehusghunhhtuhhfohhruhhmshdrohhrghenucfkphepjeefrddvgeekrddvvddtrddvudehnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrgedrgegnpdhinhgvthepjeefrddvgeekrddvvddtrddvudehpdhmrghilhhfrhhomheprghsuddtfeefgiestghomhgtrghsthdrnhgvthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgvrghnsehmvghsshdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-Xfinity-VMeta: sc=-100;st=legit
From:   A Sun <as1033x@comcast.net>
Subject: Re: [PATCH v1 3/3] [media] mceusb: Show USB halt/stall error recovery
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <999ae5cd-d72b-983f-2f96-5aaca72e8214@comcast.net>
 <43f4ef6e-2c64-cd7a-26f7-3c1309b68936@comcast.net>
 <20190606095337.jfhmc6jqgyhmxn4q@gofer.mess.org>
Message-ID: <2548e827-1d11-4ce2-013f-bf36c9f5436e@comcast.net>
Date:   Thu, 6 Jun 2019 17:11:04 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606095337.jfhmc6jqgyhmxn4q@gofer.mess.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

Thanks again for reviewing my patch submission.

This patch updates mceusb RX and TX HALT error handling and recovery reporting,
and provides placeholder for a later patch.

The possible later patch would have mceusb call usb_reset_device() in place of the
new "... requires USB Reset ..." message. I say "possible" because I'm running into
multiple issues invoking usb_reset_device() from within mceusb.

I'll also mention the difficulty obtaining even a single fault replication
(~ 1/month) and test cycle.

Additional comments below...  ..A Sun

On 6/6/2019 5:53 AM, Sean Young wrote:
> On Sat, Jun 01, 2019 at 07:35:09PM -0400, A Sun wrote:
>> Update dev_err() messages to report status (including success) for each
>> step of USB RX HALT and TX HALT error recovery. If error recovery fails,
>> show the message:
>>         stuck RX HALT state requires USB Reset Device to clear
>> or
>>         stuck TX HALT state requires USB Reset Device to clear
>>

>>
>> This patch just affects RX and TX HALT error handling and recovery
>> reporting.
>>
>> A possible future patch may enable the mceusb driver to attempt
>> itself usb_reset_device() when necessary.
>>

>> ---
>>
>> As seen on very rare occasions with mceusb device 2304:0225
>>         [59388.696941] mceusb 1-1.1.2:1.0: Error: urb status = -32 (RX HALT)
>>         [59388.698838] mceusb 1-1.1.2:1.0: rx clear halt error -32
>> the device can get into RX or TX HALT state where usb_clear_halt()
>> also fails and also returns -EPIPE (HALT/STALL). After which,
>> all further mceusb device control and data I/O fails with HALT/STALL.
>> Cause and problem replication conditions are still unknown.
>>
>> As seen in https://ubuntuforums.org/showthread.php?t=2406882
>>         ...
>>         mceusb 2-1.4:1.0: Error: urb status = -32 (RX HALT)
>>         ...
>> for an unknown mceusb device, usb_clear_halt() apparently can return
>> false success. After which, RX HALT immediately reoccurs resulting in
> 
> I'm having trouble understanding this. usb_clear_halt() returns an int.
> Do you mean usb_clear_halt() returns 0? 
> 
>> a RX halt and clear halt infinite loop and message flooding. Again,
>> cause and problem replication conditions remain unknown.
> 
> So usb_clear_halt() returns 0 yet after the next usb_submit_urb() 
> the completion function gets -EPIPE again?

Yes, for the infinite loop with the unknown mceusb device, RX completion gets -EPIPE,
usb_clear_halt() probably returned 0 (success), but after the usb_submit_urb(),
the RX completion again gets -EPIPE.

> Are you trying to address this problem in this patch or just the error
> reporting? If you're trying to change the error reporting then there is
> no reason to move code around like you have.

This patch is mainly just error reporting.
A future patch would replace the "stuck HALT state" placeholder with code.
The move code would be for the placeholder.

The infinite loop case isn't resolved. But a false usb_clear_halt() status 0 (success)
return would be printed/shown by this patch to confirm the infinite loop theory above.

> 
>>
>> After observing a rx clear halt fault with mceusb 2304:0225, further
>> troubleshooting reveals usb_reset_device() is able to restore device
>> functionality.
>>         $ lsusb
>>         Bus 001 Device 010: ID 2304:0225 Pinnacle Systems, Inc. Remote Kit Infrared Transceiver
>>         ...
>>         $ sudo ./usbreset /dev/bus/usb/001/010  # ioctl(fd, USBDEVFS_RESET, 0);
>>         Resetting USB device /dev/bus/usb/001/010
>>         Reset successful
>>         $ dmesg
>>         ...
>>         [272392.540679] usb 1-1.2.7: reset full-speed USB device number 10 using dwc_otg
>>         [272392.676616] Registered IR keymap rc-rc6-mce
>>         ...
>>         [272392.678313] rc rc0: lirc_dev: driver ir-lirc-codec (mceusb) registered at minor = 0
> 
> Note the ir-lirc-codec. This is a pre-4.16 kernel. 
> 
>>         [272392.678616] mceusb 1-1.2.7:1.0: long-range (0x1) receiver active
>>         [272392.940671] mceusb 1-1.2.7:1.0: Registered Pinnacle Systems PCTV Remote USB with mce emulator interface version 1
>>         [272392.940687] mceusb 1-1.2.7:1.0: 2 tx ports (0x3 cabled) and 2 rx sensors (0x1 active)
> 
> 
>>         ...
>>
>> Additional findings are "modprobe -r mceusb" and "modprobe mceusb"
>> are unable to clear stuck RX or TX HALT state.
>> Attempts to call usb_reset_endpoint() and usb_reset_configuration()
>> from within the mceusb driver also did not clear stuck HALTs.
>>
>> A possible future patch could have the mceusb call usb_reset_device()
>> on itself, when necessary. Limiting the number of HALT error recovery
>> attempts may also be necessary to prevent halt/clear-halt loops.
>>
>> Unresolved for now, deadlock complications occur if mceusb's worker
>> thread, mceusb_deferred_kevent(), calls usb_reset_device(),
>> which calls mceusb_dev_disconnect(), which calls cancel_work_sync(),
>> which waits on the still active worker thread.
> 
> I think you can call usb_lock_device_for_reset() to prevent that problem.

Deadlock still occurs in test:
mceusb_deferred_kevent()
    ->usb_reset_device()
        ->mceusb_dev_disconnect()
            ->cancel_work_sync()
where cancel_work_sync() blocks because mceusb_deferred_kevent() is active.

> It would be nice to see this implemented too.
> 

Any additional tips to implement would help!
How to validate and test a rare condition with a larger audience?

>>
>> Signed-off-by: A Sun <as1033x@comcast.net>
>> ---
>>  drivers/media/rc/mceusb.c | 35 +++++++++++++++++++++++++----------
>>  1 file changed, 25 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
>> index efffb1795..5d81ccafc 100644
>> --- a/drivers/media/rc/mceusb.c
>> +++ b/drivers/media/rc/mceusb.c
>> @@ -765,7 +765,7 @@ static void mceusb_defer_kevent(struct mceusb_dev *ir, int kevent)
>>  {
>>  	set_bit(kevent, &ir->kevent_flags);
>>  	if (!schedule_work(&ir->kevent))
>> -		dev_err(ir->dev, "kevent %d may have been dropped", kevent);
>> +		dev_dbg(ir->dev, "kevent %d already scheduled", kevent);
>>  	else
>>  		dev_dbg(ir->dev, "kevent %d scheduled", kevent);
>>  }
>> @@ -1404,19 +1404,26 @@ static void mceusb_deferred_kevent(struct work_struct *work)
>>  		container_of(work, struct mceusb_dev, kevent);
>>  	int status;
>>  
>> +	dev_info(ir->dev, "kevent handler called (flags 0x%lx)",
>> +		 ir->kevent_flags);
>> +
>>  	if (test_bit(EVENT_RX_HALT, &ir->kevent_flags)) {
>>  		usb_unlink_urb(ir->urb_in);
>>  		status = usb_clear_halt(ir->usbdev, ir->pipe_in);
>> +		dev_err(ir->dev, "rx clear halt status = %d", status);
>>  		if (status < 0) {
>> -			dev_err(ir->dev, "rx clear halt error %d",
>> -				status);
>> -		}
>> -		clear_bit(EVENT_RX_HALT, &ir->kevent_flags);
>> -		if (status == 0) {
>> +			/*
>> +			 * Unable to clear RX stall/halt.
>> +			 * Will need to call usb_reset_device().
>> +			 */
>> +			dev_err(ir->dev,
>> +				"stuck RX HALT state requires USB Reset Device to clear");
> 
> Here you say if the usb_clear_halt() returns < 0 then we're in the bad
> code path. But in this code path, we're not re-submitting the urb so
> we wouldn't end up in an infinite loop.
> 

The theory for the infinite loop case is usb_clear_halt() returned 0.
The infinite loop isn't resolved with this patch.

> 
>> +		} else {
>> +			clear_bit(EVENT_RX_HALT, &ir->kevent_flags);
> 
> Why have you moved this line?
> 

Clear bit but only if usb_clear_halt() recovery succeeds.

A future usb_device_reset() operation affects both RX and TX and its
success code path must clear both EVENT_RX_HALT and EVENT_TX_HALT
and do its own usb_submit_urb() with message "rx reset device submit urb status = %d"

Hence, the moved line.

>>  			status = usb_submit_urb(ir->urb_in, GFP_KERNEL);
>>  			if (status < 0) {
>>  				dev_err(ir->dev,
>> -					"rx unhalt submit urb error %d",
>> +					"rx unhalt submit urb error = %d",
>>  					status);
>>  			}
>>  		}
> 
> I don't understand how this code change has changed anything. In the existing
> code and the patch code the urb only gets re-submitted if usb_clear_halt()
> succeeds.
> 

This patch is mainly just error reporting revisions.
A future patch would replace the "stuck HALT state" message and placeholder 
with code to perform USB reset.

>> @@ -1424,9 +1431,17 @@ static void mceusb_deferred_kevent(struct work_struct *work)
>>  
>>  	if (test_bit(EVENT_TX_HALT, &ir->kevent_flags)) {
>>  		status = usb_clear_halt(ir->usbdev, ir->pipe_out);
>> -		if (status < 0)
>> -			dev_err(ir->dev, "tx clear halt error %d", status);
>> -		clear_bit(EVENT_TX_HALT, &ir->kevent_flags);
>> +		dev_err(ir->dev, "tx clear halt status = %d", status);
>> +		if (status < 0) {
>> +			/*
>> +			 * Unable to clear TX stall/halt.
>> +			 * Will need to call usb_reset_device().
>> +			 */
>> +			dev_err(ir->dev,
>> +				"stuck TX HALT state requires USB Reset Device to clear");
>> +		} else {
>> +			clear_bit(EVENT_TX_HALT, &ir->kevent_flags);
>> +		}
>>  	}
>>  }
>>  
>> -- 
>> 2.11.0
> 

