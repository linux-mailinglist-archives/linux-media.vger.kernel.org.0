Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9B47DA679
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 09:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387545AbfJQH3w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 03:29:52 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:33675 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731498AbfJQH3u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 03:29:50 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id L0ECiNJ4GPduvL0EFitUjh; Thu, 17 Oct 2019 09:29:48 +0200
Subject: Re: [PATCHv8 1/2] drm: tda998x: use cec_notifier_conn_(un)register
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     linux-media@vger.kernel.org,
        Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20191016133916.21475-1-hverkuil-cisco@xs4all.nl>
 <20191016133916.21475-2-hverkuil-cisco@xs4all.nl>
 <20191016161417.GX25745@shell.armlinux.org.uk>
 <cef1582a-7198-7331-cd2b-1b30ad8dd47b@xs4all.nl>
Message-ID: <fa6b354a-2a56-d612-f034-20323b2f55e5@xs4all.nl>
Date:   Thu, 17 Oct 2019 09:29:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cef1582a-7198-7331-cd2b-1b30ad8dd47b@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJYnk5+tCJsnu2ep58E5QMj/aObGXKVMuPXWsd5cg6dprT5StnmLlKrOSHhVYkDhoYKpFOC8AIAhod8FUC/s2ymO6kQwld4BgI/b3z0hGeU5ImT6G19T
 jJtbvXAcjEkw00czmklsOQ1u0/+9LMa01P3wjCFMEeLX+zlhfUrcG+kuXkfeGmSNgIso9FLTJyJ/BAN/t+Xa/i/OHTZoBaT/Uhg7kKbmCISZ2yto3//LykS2
 GxVvZfSTNtMYe27KyV18KolVDrtwvvvQz8g7gVKR3ojZhzgw6/6bJGEOAqrthZQMgQ4mcX+kTjskqXC1FGOt73f+mBTIFrLpMVZ/CYf7a/wMZqdVeCeWR9Wm
 4JjwZMidKGfJPFafKkYfLEOVqaF7/Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/17/19 9:03 AM, Hans Verkuil wrote:
> On 10/16/19 6:14 PM, Russell King - ARM Linux admin wrote:
>> On Wed, Oct 16, 2019 at 03:39:15PM +0200, Hans Verkuil wrote:
>>> From: Dariusz Marcinkiewicz <darekm@google.com>
>>>
>>> Use the new cec_notifier_conn_(un)register() functions to
>>> (un)register the notifier for the HDMI connector.
>>>
>>> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>
>> Please explain in detail what this mutex actually achieves.
> 
> Dariusz, since you're the author, can you reply to Russell?
> 
> If this is going to be a delaying factor, then I'll post a new version
> without the mutex that just replaces the cec_notifier API.

I decided to post a v9, moving the mutex to the second patch, which should
make the first patch acceptable to everyone for v5.5.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>>
>>> ---
>>>  drivers/gpu/drm/i2c/tda998x_drv.c | 21 ++++++++++++++++-----
>>>  1 file changed, 16 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
>>> index 84c6d4c91c65..8262b44b776e 100644
>>> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
>>> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
>>> @@ -82,6 +82,9 @@ struct tda998x_priv {
>>>  	u8 audio_port_enable[AUDIO_ROUTE_NUM];
>>>  	struct tda9950_glue cec_glue;
>>>  	struct gpio_desc *calib;
>>> +
>>> +	/* protect cec_notify */
>>> +	struct mutex cec_notify_mutex;
>>>  	struct cec_notifier *cec_notify;
>>>  };
>>>  
>>> @@ -805,8 +808,11 @@ static irqreturn_t tda998x_irq_thread(int irq, void *data)
>>>  				tda998x_edid_delay_start(priv);
>>>  			} else {
>>>  				schedule_work(&priv->detect_work);
>>> -				cec_notifier_set_phys_addr(priv->cec_notify,
>>> -						   CEC_PHYS_ADDR_INVALID);
>>> +
>>> +				mutex_lock(&priv->cec_notify_mutex);
>>> +				cec_notifier_phys_addr_invalidate(
>>> +						priv->cec_notify);
>>> +				mutex_unlock(&priv->cec_notify_mutex);
>>>  			}
>>>  
>>>  			handled = true;
>>> @@ -1790,8 +1796,10 @@ static void tda998x_destroy(struct device *dev)
>>>  
>>>  	i2c_unregister_device(priv->cec);
>>>  
>>> -	if (priv->cec_notify)
>>> -		cec_notifier_put(priv->cec_notify);
>>> +	mutex_lock(&priv->cec_notify_mutex);
>>> +	cec_notifier_conn_unregister(priv->cec_notify);
>>> +	priv->cec_notify = NULL;
>>> +	mutex_unlock(&priv->cec_notify_mutex);
>>
>> By the time we get here:
>>
>> 1) The interrupt has been freed (which is a synchronous operation)
>>    tda998x_irq_thread() can't be called and can't be running, and
>>    therefore cec_notifier_phys_addr_invalidate() also can't be called
>>    or be running.
>> 2) You don't touch the cec_notifier_set_phys_addr_from_edid() site;
>>    if there's any case that _might_ possibly conflict, it is that one.
>> 3) tda998x_destroy() and tda998x_create() can't be called concurrently
>>    in any case; the driver model guarantees that ->probe and ->remove
>>    for the same device are serialised.
>>
>>>  }
>>>  
>>>  static int tda998x_create(struct device *dev)
>>> @@ -1812,6 +1820,7 @@ static int tda998x_create(struct device *dev)
>>>  	mutex_init(&priv->mutex);	/* protect the page access */
>>>  	mutex_init(&priv->audio_mutex); /* protect access from audio thread */
>>>  	mutex_init(&priv->edid_mutex);
>>> +	mutex_init(&priv->cec_notify_mutex);
>>>  	INIT_LIST_HEAD(&priv->bridge.list);
>>>  	init_waitqueue_head(&priv->edid_delay_waitq);
>>>  	timer_setup(&priv->edid_delay_timer, tda998x_edid_delay_done, 0);
>>> @@ -1916,7 +1925,9 @@ static int tda998x_create(struct device *dev)
>>>  		cec_write(priv, REG_CEC_RXSHPDINTENA, CEC_RXSHPDLEV_HPD);
>>>  	}
>>>  
>>> -	priv->cec_notify = cec_notifier_get(dev);
>>> +	mutex_lock(&priv->cec_notify_mutex);
>>> +	priv->cec_notify = cec_notifier_conn_register(dev, NULL, NULL);
>>> +	mutex_unlock(&priv->cec_notify_mutex);
>>
>> and:
>>
>> 4) priv->cec_notify will be NULL here until such time that
>>    cec_notifier_conn_register() has returned.  If the mutex is trying
>>    to protect something, it's very unclear what it is.
>>    
>> Trying to guess what it's protecting against:
>>
>> - Is it protecting against NULL priv->cec_notify?  No, because it can
>>   be NULL just before we take the lock.
>> - Is it protecting the internals of cec_notifier_conn_register()
>>   against the other calls - no, because priv->cec_notify will be NULL
>>   until the function has finished.
>> - Is it protecting the write to priv->cec_notify?  Maybe, but that
>>   doesn't need any protection - architectures are single-copy atomic,
>>   which means that a pointer is either written or it is not written.
>>   Therefore, it will either be NULL (the state before the call is made)
>>   or it will be set correctly (after the call has completed.)
>>
>> So, all in all, I don't see what this lock is doing, and I think it
>> should be removed.
>>
>> If it's necessary for a future change (which may or may not be merged)
>> then the lock should be part of that future change, because the change
>> proposed by this patch certainly does not need it.
>>
>> Thanks.
>>
> 

