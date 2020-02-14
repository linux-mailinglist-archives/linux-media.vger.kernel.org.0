Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DAC715D531
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 11:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729017AbgBNKGm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 05:06:42 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:34355 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728522AbgBNKGl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 05:06:41 -0500
Received: from [IPv6:2001:983:e9a7:1:f887:140a:e9b5:d382]
 ([IPv6:2001:983:e9a7:1:f887:140a:e9b5:d382])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2XrojHZfI8i432XrqjPJ9i; Fri, 14 Feb 2020 11:06:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581674799; bh=XK9wS6VTvGQo/7aOlmJ1ms3hulo1Zgl2Sc6AimCvIaQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=gOyjjtob/LnpJmpGPdgjTfSBzTY7ha8jFVOsl0QbqVgPr35bRT45i0tFqDCfQUfz0
         QavccYB8szlBsjt+CAbt+LKc+5wmM3ZiBEX+zqJEQVsHYq1XKRDtdcQIHpKywC5624
         7K7uYEoY6iPT1gN4PZSdtVmosbeOQzD0VVlxk50ynP6ZQPCdA64wIDrQhDENnieqYo
         z6MT3fCX+7pA4fXRcWAMHXaQw91vYplTeJlR1VyOUCXRuro6rIaVLlwnvTcv9KhpMK
         8DpVx1jrAc19q3vnSR1Se0NnGs/MuZSTGoIfIpybb6LEjwRs/vDLhn7mmYFnNUHYU7
         ydSuHiuu1l87g==
Subject: Re: [PATCH] media: usbvision: Fix a use after free in v4l2_release()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        syzbot <syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com>,
        Hillf Danton <hdanton@sina.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Souptick Joarder <jrdr.linux@gmail.com>, andreyknvl@google.com,
        bnvandana@gmail.com, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
References: <20200124141356.365bgzg2lp3tjedm@kili.mountain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d8663b81-e920-3e1d-11d0-f636ea52c6ef@xs4all.nl>
Date:   Fri, 14 Feb 2020 11:06:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200124141356.365bgzg2lp3tjedm@kili.mountain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfD5b730u68C1OfmcFWAgg02NoSNkgNclJNc1nSdbddkVkhztFo5KDBr3rEs3IPL53BFxASJXzlVJy+Khu0WXjIs4mo3Nai9dSHEl/38rexsFxyvyA6DS
 c126GE7gTgEVOGqitoQ/esIDi8p3HFSaO31Tmo4EzO6Wt0GJmYp6qpVsOmLDcF9qlzMuyMcNfsk1Sp1TTfEHTf24tgUlvo40sv25F1FwQdjrmH4EWXH2ZKJd
 nBCW1Va1cb+5EnlutVK+4yLKc0W8GJG4/kVKIy5DpTsMAwfrvzVroYWOIXtHH15tyUlw8lNV4DuPKb5Tr0F52R0ho6W7W8cgyVFpLfwMoS6/fBp7l4NBMWXp
 htDZHm1IrJJDsYc8VFh4jRvDpU05jvYoySN6iNV8EN4Gc/ANS9axUjrlsBQ1G6VSVJ8Jk0uiUkb8MpgN5yELp1+rzFVvCL4uxGaS/qp/VK8P1FRVChFQyp/2
 VC41H7HSuCw6V0LRc5PzZKE5XMM38yHYAGxUta7tItIAWPeY2DweaCE/agqBld+L49b/oY6jRoAXqwrs6qjXpBJBFb77M6RrXByp9PtacvpHEJ/wygUmV4p7
 PoPsRN9o39TRQn+Xo2fUV6U144jqwJWLaVVFUyDdIJ9Lmpe/JVstRdOfHM8CtDm43yHAp9/WlBD96nYuCNb4wle1SShFJW/8Ug2PltpMQmLJGjfQVNJgS2do
 bfVe6r9yfiXT865kNCoKODXwmTTai3WlDv4IVt1C0KQtqbrqTRmUA7yOTIYFL55z7PSyf7Utm0izLvVVv/skPp6xO3ikGr6vJXhiRr+yXKYpr1ctw/tFow==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/24/20 3:13 PM, Dan Carpenter wrote:
> Syzbot triggered a use after free in v5.5-rc6:
> 
> BUG: KASAN: use-after-free in v4l2_release+0x2f1/0x390 drivers/media/v4l2-core/v4l2-dev.c:459
> 
> Allocated by task 94:
>  usbvision_alloc drivers/media/usb/usbvision/usbvision-video.c:1315 [inline]
>  usbvision_probe.cold+0x5c5/0x1f21 drivers/media/usb/usbvision/usbvision-video.c:1469
> 
> Freed by task 1913:
>  kfree+0xd5/0x300 mm/slub.c:3957
>  usbvision_release+0x181/0x1c0 drivers/media/usb/usbvision/usbvision-video.c:1364
>  usbvision_radio_close.cold+0x2b/0x74 drivers/media/usb/usbvision/usbvision-video.c:1130
>  v4l2_release+0x2e7/0x390 drivers/media/v4l2-core/v4l2-dev.c:455
> 
> The problem is that the v4l2_release() calls usbvision_release() which
> frees "usbvision" but v4l2_release() still wants to use
> "usbvision->vdev".  One solution is to make this devm_ allocated memory
> so the memory isn't freed until later.

devm_ allocated memory is freed after disconnect, so I doubt this will help, or at
best it will just move the problem elsewhere.

The right approach would be to use the release() callback from struct v4l2_device:
that's called when the very last open filehandle is closed.

But I'm not sure if it is worth the effort. The usbvision driver is a mess and
personally I think it should be deprecated.

Regards,

	Hans

> 
> Reported-by: syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I copied this idea from a different driver, but I haven't tested it.
> I wanted to try the #syz fix command to see if it works.
> 
>  drivers/media/usb/usbvision/usbvision-video.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/usbvision/usbvision-video.c b/drivers/media/usb/usbvision/usbvision-video.c
> index 93d36aab824f..07b4763062c4 100644
> --- a/drivers/media/usb/usbvision/usbvision-video.c
> +++ b/drivers/media/usb/usbvision/usbvision-video.c
> @@ -1312,7 +1312,7 @@ static struct usb_usbvision *usbvision_alloc(struct usb_device *dev,
>  {
>  	struct usb_usbvision *usbvision;
>  
> -	usbvision = kzalloc(sizeof(*usbvision), GFP_KERNEL);
> +	usbvision = devm_kzalloc(&dev->dev, sizeof(*usbvision), GFP_KERNEL);
>  	if (!usbvision)
>  		return NULL;
>  
> @@ -1336,7 +1336,6 @@ static struct usb_usbvision *usbvision_alloc(struct usb_device *dev,
>  	v4l2_ctrl_handler_free(&usbvision->hdl);
>  	v4l2_device_unregister(&usbvision->v4l2_dev);
>  err_free:
> -	kfree(usbvision);
>  	return NULL;
>  }
>  
> @@ -1361,7 +1360,6 @@ static void usbvision_release(struct usb_usbvision *usbvision)
>  
>  	v4l2_ctrl_handler_free(&usbvision->hdl);
>  	v4l2_device_unregister(&usbvision->v4l2_dev);
> -	kfree(usbvision);
>  
>  	PDEBUG(DBG_PROBE, "success");
>  }
> 

