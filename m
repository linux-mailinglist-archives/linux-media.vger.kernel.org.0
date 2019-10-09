Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 711F8D0F4D
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 14:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731192AbfJIM6y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 08:58:54 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:56147 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730490AbfJIM6x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Oct 2019 08:58:53 -0400
Received: from [IPv6:2001:983:e9a7:1:2801:e038:f2c3:e060] ([IPv6:2001:983:e9a7:1:2801:e038:f2c3:e060])
        by smtp-cloud7.xs4all.net with ESMTPA
        id IBYIigkvMjZ8vIBYJiI0ib; Wed, 09 Oct 2019 14:58:52 +0200
Subject: Re: [PATCH 2/2 RESEND] media: usbvision: Fix races among open, close,
 and disconnect
To:     Alan Stern <stern@rowland.harvard.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
References: <Pine.LNX.4.44L0.1910071109050.1513-100000@iolanthe.rowland.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ab4a8b5f-24c9-ddf9-9cd7-885fb9e33e9f@xs4all.nl>
Date:   Wed, 9 Oct 2019 14:58:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.1910071109050.1513-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfE9BN3Lh7/znjnC5OrS+EXQ4xHMoNTUsF5/lwupTlzb3tF6ob2L0q3DMXA4smni/HOrt2hcW8N/mSw3eT4AYY40UdUf/kDwSMEQPe1V0cAIO3j9LEmxr
 zzqXM99mRxEHnA8HDku99onvEmRyGi0QFEQo8d5qNPj1JFQWb4LVrtkJDCEqAmxrl5VV+fzrJGCJg2iGmZIvF8V8YUG+/BAstQdnJhUdq0mvotcRli3VRdri
 FXUD/Dzbq2FbiGIkWcnEAS61jsH5cw6+QJrH671EFEv7/eBzpwz1N6TpfDTnJl+Vu3vg+ZA2vjO/byKFHQ0JvtAxnCzuxMrvrfb1mIpJpiQCJJKO8kAY/3Ya
 jPelHWZOOZrMzYGaJy/dQuqAoKAbJPpdrbgPSdfnJLpwBJQDhkIxzvWtEw2UUxfL8Kez1Xs0JLGcXEsooYT1X5Q3JskTwA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/7/19 5:09 PM, Alan Stern wrote:
> Visual inspection of the usbvision driver shows that it suffers from
> three races between its open, close, and disconnect handlers.  In
> particular, the driver is careful to update its usbvision->user and
> usbvision->remove_pending flags while holding the private mutex, but:
> 
> 	usbvision_v4l2_close() and usbvision_radio_close() don't hold
> 	the mutex while they check the value of
> 	usbvision->remove_pending;
> 
> 	usbvision_disconnect() doesn't hold the mutex while checking
> 	the value of usbvision->user; and
> 
> 	also, usbvision_v4l2_open() and usbvision_radio_open() don't
> 	check whether the device has been unplugged before allowing
> 	the user to open the device files.
> 
> Each of these can potentially lead to usbvision_release() being called
> twice and use-after-free errors.
> 
> This patch fixes the races by reading the flags while the mutex is
> still held and checking for pending removes before allowing an open to
> succeed.

I suspect usbvision is full of races like that. It isn't using the proper
frameworks to take care of this. The problem is that it's old hardware and
nobody really cares about reworking the driver.

I'll take the patch, but if there is anyone interested in doing work on
this driver, then let me know. Otherwise I might just deprecate it.

Regards,

	Hans

> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> CC: <stable@vger.kernel.org>
> 
> ---
> 
> [as1920]
> 
> 
>  drivers/media/usb/usbvision/usbvision-video.c |   21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> Index: usb-devel/drivers/media/usb/usbvision/usbvision-video.c
> ===================================================================
> --- usb-devel.orig/drivers/media/usb/usbvision/usbvision-video.c
> +++ usb-devel/drivers/media/usb/usbvision/usbvision-video.c
> @@ -314,6 +314,10 @@ static int usbvision_v4l2_open(struct fi
>  	if (mutex_lock_interruptible(&usbvision->v4l2_lock))
>  		return -ERESTARTSYS;
>  
> +	if (usbvision->remove_pending) {
> +		err_code = -ENODEV;
> +		goto unlock;
> +	}
>  	if (usbvision->user) {
>  		err_code = -EBUSY;
>  	} else {
> @@ -377,6 +381,7 @@ unlock:
>  static int usbvision_v4l2_close(struct file *file)
>  {
>  	struct usb_usbvision *usbvision = video_drvdata(file);
> +	int r;
>  
>  	PDEBUG(DBG_IO, "close");
>  
> @@ -391,9 +396,10 @@ static int usbvision_v4l2_close(struct f
>  	usbvision_scratch_free(usbvision);
>  
>  	usbvision->user--;
> +	r = usbvision->remove_pending;
>  	mutex_unlock(&usbvision->v4l2_lock);
>  
> -	if (usbvision->remove_pending) {
> +	if (r) {
>  		printk(KERN_INFO "%s: Final disconnect\n", __func__);
>  		usbvision_release(usbvision);
>  		return 0;
> @@ -1076,6 +1082,11 @@ static int usbvision_radio_open(struct f
>  
>  	if (mutex_lock_interruptible(&usbvision->v4l2_lock))
>  		return -ERESTARTSYS;
> +
> +	if (usbvision->remove_pending) {
> +		err_code = -ENODEV;
> +		goto out;
> +	}
>  	err_code = v4l2_fh_open(file);
>  	if (err_code)
>  		goto out;
> @@ -1108,6 +1119,7 @@ out:
>  static int usbvision_radio_close(struct file *file)
>  {
>  	struct usb_usbvision *usbvision = video_drvdata(file);
> +	int r;
>  
>  	PDEBUG(DBG_IO, "");
>  
> @@ -1121,9 +1133,10 @@ static int usbvision_radio_close(struct
>  	usbvision_audio_off(usbvision);
>  	usbvision->radio = 0;
>  	usbvision->user--;
> +	r = usbvision->remove_pending;
>  	mutex_unlock(&usbvision->v4l2_lock);
>  
> -	if (usbvision->remove_pending) {
> +	if (r) {
>  		printk(KERN_INFO "%s: Final disconnect\n", __func__);
>  		v4l2_fh_release(file);
>  		usbvision_release(usbvision);
> @@ -1555,6 +1568,7 @@ err_usb:
>  static void usbvision_disconnect(struct usb_interface *intf)
>  {
>  	struct usb_usbvision *usbvision = to_usbvision(usb_get_intfdata(intf));
> +	int u;
>  
>  	PDEBUG(DBG_PROBE, "");
>  
> @@ -1571,13 +1585,14 @@ static void usbvision_disconnect(struct
>  	v4l2_device_disconnect(&usbvision->v4l2_dev);
>  	usbvision_i2c_unregister(usbvision);
>  	usbvision->remove_pending = 1;	/* Now all ISO data will be ignored */
> +	u = usbvision->user;
>  
>  	usb_put_dev(usbvision->dev);
>  	usbvision->dev = NULL;	/* USB device is no more */
>  
>  	mutex_unlock(&usbvision->v4l2_lock);
>  
> -	if (usbvision->user) {
> +	if (u) {
>  		printk(KERN_INFO "%s: In use, disconnect pending\n",
>  		       __func__);
>  		wake_up_interruptible(&usbvision->wait_frame);
> 
> 
> 

