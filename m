Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 702E015D68C
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 12:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbgBNLaf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 06:30:35 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:47895 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727652AbgBNLaf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 06:30:35 -0500
Received: from [IPv6:2001:983:e9a7:1:bd23:d5c7:5f0e:7bef]
 ([IPv6:2001:983:e9a7:1:bd23:d5c7:5f0e:7bef])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 2ZAzjN1DMP9a92ZB0jGUkq; Fri, 14 Feb 2020 12:30:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581679832; bh=MS6C5N4u23BO/oIpgceyI7lXYW2eDvQuIBO/ULD7dCc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=XiMsMystTf+S2CGk47dCYqe0Min8Iq3UYq5nhorHJVmUDetogdC6w7d48SknpOMaw
         mOtDhgouUDpl3nsdpZzIZHu7g0l8qPxiLiqkOEFgHfI2RXbQGvmQGeIpnT71y9nw9/
         FnF7p/K6DF38pX5e0hR3jljnL2vXGKLrR0BVSpuNRwOsZZ7eEP4aqNyq++PbwuG4q+
         4EbOQCKgwWMKUq9YB5r7RD0PRi5IVutFbmZqPkfSNYEQrNrveU/36yvFQk5AX62IbI
         fUGKIsy/j1WiEcA3voTs/pcvGvXA7pjErwqkDMlnjmXODdzOzLkbST8duDcSBFvZ5k
         o4UHrTvYZp9Ug==
Subject: Re: [PATCH] media: usbvision: Fix a use after free in v4l2_release()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        syzbot <syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com>,
        Hillf Danton <hdanton@sina.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Souptick Joarder <jrdr.linux@gmail.com>, andreyknvl@google.com,
        bnvandana@gmail.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
References: <20200124141356.365bgzg2lp3tjedm@kili.mountain>
 <d8663b81-e920-3e1d-11d0-f636ea52c6ef@xs4all.nl>
 <20200214112239.GC4831@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b1d071e2-0428-a08c-392d-3ca5d4a7e710@xs4all.nl>
Date:   Fri, 14 Feb 2020 12:30:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200214112239.GC4831@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAaOfoH6UqgTQdQdpWGQMI7AIsyH5gOX2jNxzLEjy1s7a/Uck5os1npguU8fsBBOoCDhOUCTVbsar9GPlRf+eq+DiXkye9c9rGOUVDCq56+/8hzAjuyC
 BTCaO+jKnRCg+91kivRgU1CEHdyVh93yIBRGDCrImByYkO1QgDIfmMczSEkjXuQexuJtyF4B0Ng2LaEzyAtFsDTDzgtqA82uiwKn4aINneXnZuBgbgShQ7+U
 CePAWUMDUoB7ZNuKt0Jmqd0FtnD5DCGhdMvU/NhxLlPH6qqOb2dr9n8rn//iUpgNC55i3uLIdzoQunBWezD0mBHHiTrFT+tUABvjTYn/FmswXmctr+JkNgB/
 4coHkVHEZ+tVPVul6gVJUMjCa7t7kDlLTb2fkWo9Dg7Y2hVf46vqfEEJ51Yge5wsoK4wIe4WhGNxJvvmpnlIDdb3rtIX/stXUKtC80IvyfbOn4SrCZnQDuok
 1/BR5Lho1Amf43Ad6ndL7t+4DZE4N9YysIzKf2R1C2n8slxZ82qtEHhvUF1NC0r46W+kZPt28KOviNRQpBAnOdF0ZXdBoI9d9vlO7SERkXOkGpq7Z/MMD/cU
 4gYqFz87qViN4u9FN232hWa9ahf50NBp/Qp4jszX5jadZ651BhnmdLrkhWSGCUy2qIMUwU5SQNNRgFidn3G5MJJodMo/HjUDezi7o3gBXIJlfIOCHdO0fS0p
 rXJjLHrOinp/EaAx+IftYcBU16OGuQuxxJud55JtW997ibw85++bWKUxs0z7SdLGtj/Xz1wS8kd7900dx//fzwIifrBb1kjPgqg9RHCxbTVVXxe4+0s/JA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/14/20 12:22 PM, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Fri, Feb 14, 2020 at 11:06:36AM +0100, Hans Verkuil wrote:
>> On 1/24/20 3:13 PM, Dan Carpenter wrote:
>>> Syzbot triggered a use after free in v5.5-rc6:
>>>
>>> BUG: KASAN: use-after-free in v4l2_release+0x2f1/0x390 drivers/media/v4l2-core/v4l2-dev.c:459
>>>
>>> Allocated by task 94:
>>>  usbvision_alloc drivers/media/usb/usbvision/usbvision-video.c:1315 [inline]
>>>  usbvision_probe.cold+0x5c5/0x1f21 drivers/media/usb/usbvision/usbvision-video.c:1469
>>>
>>> Freed by task 1913:
>>>  kfree+0xd5/0x300 mm/slub.c:3957
>>>  usbvision_release+0x181/0x1c0 drivers/media/usb/usbvision/usbvision-video.c:1364
>>>  usbvision_radio_close.cold+0x2b/0x74 drivers/media/usb/usbvision/usbvision-video.c:1130
>>>  v4l2_release+0x2e7/0x390 drivers/media/v4l2-core/v4l2-dev.c:455
>>>
>>> The problem is that the v4l2_release() calls usbvision_release() which
>>> frees "usbvision" but v4l2_release() still wants to use
>>> "usbvision->vdev".  One solution is to make this devm_ allocated memory
>>> so the memory isn't freed until later.
>>
>> devm_ allocated memory is freed after disconnect, so I doubt this will help, or at
>> best it will just move the problem elsewhere.
> 
> Yes, devm_*alloc is evil :-( It has spread to many drivers and is used
> incorrectly in most cases.
> 
>> The right approach would be to use the release() callback from struct v4l2_device:
>> that's called when the very last open filehandle is closed.
> 
> Hillf Danton has sent a patch to do so in the "Re: KASAN: use-after-free
> Read in v4l2_release (3)" thread. Have you seen it ?

Ah, that was never mailed to linux-media, so never ended up in patchwork. And
if it ain't in patchwork, then I don't know about it :-)

Hillf, if you want your patch to be merged, then make sure it is CC-ed to
linux-media as well.

Regards,

	Hans

> 
>> But I'm not sure if it is worth the effort. The usbvision driver is a mess and
>> personally I think it should be deprecated.
> 
> I agree.
> 
>>> Reported-by: syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> ---
>>> I copied this idea from a different driver, but I haven't tested it.
>>> I wanted to try the #syz fix command to see if it works.
>>>
>>>  drivers/media/usb/usbvision/usbvision-video.c | 4 +---
>>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/media/usb/usbvision/usbvision-video.c b/drivers/media/usb/usbvision/usbvision-video.c
>>> index 93d36aab824f..07b4763062c4 100644
>>> --- a/drivers/media/usb/usbvision/usbvision-video.c
>>> +++ b/drivers/media/usb/usbvision/usbvision-video.c
>>> @@ -1312,7 +1312,7 @@ static struct usb_usbvision *usbvision_alloc(struct usb_device *dev,
>>>  {
>>>  	struct usb_usbvision *usbvision;
>>>  
>>> -	usbvision = kzalloc(sizeof(*usbvision), GFP_KERNEL);
>>> +	usbvision = devm_kzalloc(&dev->dev, sizeof(*usbvision), GFP_KERNEL);
>>>  	if (!usbvision)
>>>  		return NULL;
>>>  
>>> @@ -1336,7 +1336,6 @@ static struct usb_usbvision *usbvision_alloc(struct usb_device *dev,
>>>  	v4l2_ctrl_handler_free(&usbvision->hdl);
>>>  	v4l2_device_unregister(&usbvision->v4l2_dev);
>>>  err_free:
>>> -	kfree(usbvision);
>>>  	return NULL;
>>>  }
>>>  
>>> @@ -1361,7 +1360,6 @@ static void usbvision_release(struct usb_usbvision *usbvision)
>>>  
>>>  	v4l2_ctrl_handler_free(&usbvision->hdl);
>>>  	v4l2_device_unregister(&usbvision->v4l2_dev);
>>> -	kfree(usbvision);
>>>  
>>>  	PDEBUG(DBG_PROBE, "success");
>>>  }
> 

