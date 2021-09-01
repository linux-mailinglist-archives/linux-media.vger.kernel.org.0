Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D6A3FD837
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 12:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237483AbhIAK4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 06:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236965AbhIAK4c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 06:56:32 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5684DC061575;
        Wed,  1 Sep 2021 03:55:35 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id LNtxmJYIX0e6wLNtymQ7BH; Wed, 01 Sep 2021 12:55:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630493732; bh=3CR+//ZxhJt9SvSfSJN0ubf+WZpbZg5T/z9jzNJLfFw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=JuHBV1abuHmEeV6iCn7c2sw7BQJDxzn7qfiJ/HId0GOQKX24YI0VbMKEOp4CmCEnO
         ZMs4VWwiM3M8qvO6n3zqa5gxqcOS6ptsNbZElDLifHIW+ivei92N+t7fohS+Ur8oF6
         AWBstphX4Bb7pGb8EVxG4+jOQlDJJ7lWF76BlCwpOvfST+T3690Bo6XVwsIirShREK
         VlhsJYryuV3MnKv57GETkwzRJ3kKhgDC+feNRp5un28y4Y53PyzCZTzLiTO5MQawaA
         q1jzOf9CssjvCHt+I9AWx1ldqsj5UfVPJvgMHNFe0sTkUYpmjYL76kHbH9prKTdj5/
         rsNUGOy6cLfdQ==
Subject: Re: [PATCH v2] usb: stkwebcam: update the reference count of the usb
 device structure
To:     Salah Triki <salah.triki@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Cai Huoqing <caihuoqing@baidu.com>
References: <20210731161831.GA909851@pc>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ab85c4e6-d3f4-5861-f998-028cdab5fe5a@xs4all.nl>
Date:   Wed, 1 Sep 2021 12:55:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210731161831.GA909851@pc>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJuBWBuoZ5MLRLDrRIZFbRcF/uoyY7AETq9z/srKgOsXZp8S2mUwaeWniWVJmxUFnBOzyWq167wEdLaQSVW6Ajo6OsDCFYP41xf1RdbVdVvrLpndrbHN
 9lhdSGpzlSQwAV7TRqiDhJMcEN4AnCoOUu4NXPx/RFPPXt9OUg75Qt2M7xIOytD9jDq2VdPzo7M7p53QhRdclNHwl0TE01P8zebmZQuPEqiSeMi1Z+/y90Z+
 QLRJVMtzcvB0cT82CpF+olv9dpZbMT5R/j7EBr2njwRHIM9/fHlmHxGBMw2fEhJMVHMkzHKWjqPxHcb04giHV3fC7a++nkkY7AZELf6NFnpWMmpYbTvRsrvX
 V29QWJKW4wpplpztKD5hxsGamkVKbiMdaa0tReaplskVaBatk0ayquWrHRnX63ecn8O4f6TL0He0o6qG9zhkvJogNjLOCZ5/yeiZHlD5RF/dIRzNbM8=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Salah, Cai,

I received patches for this from both of you, but both have issues:

On 31/07/2021 18:18, Salah Triki wrote:
> Use usb_get_dev() to increment the reference count of the usb device
> structure in order to avoid releasing the structure while it is still in
> use. And use usb_put_dev() to decrement the reference count and thus,
> when it will be equal to 0 the structure will be released.
> 
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
> Change since v1:
> 	Modification of the description
> 
>  drivers/media/usb/stkwebcam/stk-webcam.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
> index a45d464427c4..3b14679829ed 100644
> --- a/drivers/media/usb/stkwebcam/stk-webcam.c
> +++ b/drivers/media/usb/stkwebcam/stk-webcam.c
> @@ -1309,7 +1309,7 @@ static int stk_camera_probe(struct usb_interface *interface,
>  	init_waitqueue_head(&dev->wait_frame);
>  	dev->first_init = 1; /* webcam LED management */
>  
> -	dev->udev = udev;
> +	dev->udev = usb_get_dev(udev);
>  	dev->interface = interface;
>  	usb_get_intf(interface);

In the error path of stk_camera_probe you need to call usb_put_dev(), otherwise
the udev refcount won't go to 0.

>  
> @@ -1376,6 +1376,7 @@ static void stk_camera_disconnect(struct usb_interface *interface)
>  
>  	usb_set_intfdata(interface, NULL);
>  	unset_present(dev);
> +	usb_put_dev(interface_to_usbdev(interface));

Cai just used usb_put_dev(dev->udev) here which makes more sense.

Cai also moved this to the stk_v4l_dev_release() function, which is probably
a better place.

However, there is another bug here as well: these lines in stk_camera_disconnect()
should be moved to stk_v4l_dev_release():

        v4l2_ctrl_handler_free(&dev->hdl);
        v4l2_device_unregister(&dev->v4l2_dev);
        kfree(dev);

When the last user of the video device has closed their fh, then stk_v4l_dev_release()
is called, so any cleanup of resources/memory should happen there. Right now if you are
streaming and the webcam is disconnected (or the device forcibly unloaded), the dev
pointer is freed in disconnect, but stk_v4l_dev_release() is called later and will
reference freed memory.

I'm not sure who of the two of you will make a v3, I leave that to you to fight out :-)

Regards,

	Hans

>  
>  	wake_up_interruptible(&dev->wait_frame);
>  
> 

