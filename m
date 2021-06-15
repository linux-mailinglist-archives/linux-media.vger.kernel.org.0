Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4C3B3A78FF
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 10:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhFOI22 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 04:28:28 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:54837 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230190AbhFOI22 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 04:28:28 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id t4Okla3YIhg8Zt4OnlNW8I; Tue, 15 Jun 2021 10:26:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623745582; bh=ZTRCW0WiskrdGzlsdFEoxXqcFBj3Oe5Up1ZbP3p2TBk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fWnTzbWpL6estA1ZiGUwLO5SYRs+9GN61S+GMVVkuFC0IHN1upNXWOM+5rHyexxfA
         qaQjxenCkd6RZ7CbwemTasilI9WfGMjXe202Tf6DbBWqdBd3hrve541uRxToKFekc0
         NNOJgPcYcv9O7289RdLW69/pi9CzUQZZPq1F1sBooPaLEDkxMD86PZ2Ifu/tKLCgr8
         Nv+jgYvJBGK4jX2ygSiecaxym/bpgJS4R+aa5pHl549SK7RCvKAulG04wl63XSTgz7
         fILt8Oxzox6khidNPIuNEKih0j2+ODC5OcQYj1l+IVqdRboQp2FuV7Avf6fbqJ+MwX
         hNOwL0eUZ/7vQ==
Subject: Re: [PATCH v3 7/8] media: subdev: fix compat_ioctl32
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
References: <20210614103409.3154127-1-arnd@kernel.org>
 <20210614103409.3154127-8-arnd@kernel.org>
 <YMePUYfDzdsErRab@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2d988daa-cb25-9f0d-8309-99f4de2a1e58@xs4all.nl>
Date:   Tue, 15 Jun 2021 10:26:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YMePUYfDzdsErRab@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfC6HRC5tsAQ+zZpT9lCPZYDj7PDQI8U97USdIDIZr7hy5NKtwvbfGEmlLFf9sQraFpyNO9GieEIKeXnpOA5MRP9m7gO187WMrzNr6lzQIOGeV5KW9ySr
 PsOMhhG4psR7d/eJailZjbc1PHdeC+tvOnUFOY1SAPJafVUwmyjddvwkYW+VUtYaXB3sGSMsWbRBstTLhR+9v6tW8slZCKYFfUF2W1D83ww5Ig78rfGxW/Cd
 7sfmCDWdpO/W8GEqkx8A8stD43QpFZaIBrsB0ZQQ8N2gO7dOe+ProKx/bmsDUwqIQgKlgHHlSJ43xI+Gg7FsYWIp2EBhqSbKPWa5UyRCFywkd7innOQ3FLoe
 GsNd9eKE+TsVDhyoZoq53LppD43xNluSIIMaTUL9+qHVbUkNfwhHiIMMNOk5LJqH7vWLGo2MiQdwo61Rf4wcKL31lN+o/agvYz2BZmKTKM+yUW9k4SLZ241V
 LFdXHRjfxEMkhe2ZUxw9NmWwyFBqkymgW+ixUTEf/PRouCwEeealriZmUDl0ciwwMMc1pZYgtCXzzOwt99g5Liazw8HiBQOBYGELAYHXPmETs9F2NIKc0W1o
 B273mWu6B+jMZU4WlotYvUihw8DFnay/ZBXD+NTqtaBpwgsOn8wYTuyT0s2cDrGV2mCIRzt7ScGy48Fpu1D4Gl6Woyy0rFvjlBI7mUGXlpiILXAiaoGokd85
 D4HYpFeEPfeQREzfH39Pi3TPXOhe1Tm6
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/06/2021 19:18, Laurent Pinchart wrote:
> Hi Arnd,
> 
> Thank you for the patch.
> 
> On Mon, Jun 14, 2021 at 12:34:08PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The adv7842 and si4713 drivers each define one private ioctl command that
>> are handled through the subdev_ioctl() helpers, but that don't work in
> 
> s/don't/doesn't/
> 
>> compat mode because this does not handle private ioctl commands.
>>
>> The compat_ioctl32 callback for subdevs has outdated calling conventions,
>> but as there are no users of that, it is easy to change the function
>> pointer type and the caller to make it behave the same way as the normal
>> ioctl callback and hook in the two drivers that need no argument
>> conversion.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  drivers/media/i2c/adv7842.c           |  3 +++
>>  drivers/media/radio/si4713/si4713.c   |  3 +++
>>  drivers/media/v4l2-core/v4l2-subdev.c | 19 ++++++++++++++++---
>>  include/media/v4l2-subdev.h           |  3 +--
>>  4 files changed, 23 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
>> index 78e61fe6f2f0..cd6df4f52f33 100644
>> --- a/drivers/media/i2c/adv7842.c
>> +++ b/drivers/media/i2c/adv7842.c
>> @@ -3293,6 +3293,9 @@ static const struct v4l2_ctrl_ops adv7842_ctrl_ops = {
>>  static const struct v4l2_subdev_core_ops adv7842_core_ops = {
>>  	.log_status = adv7842_log_status,
>>  	.ioctl = adv7842_ioctl,
>> +#ifdef CONFIG_COMPAT
>> +	.compat_ioctl32 = adv7842_ioctl,
>> +#endif
>>  	.interrupt_service_routine = adv7842_isr,
>>  	.subscribe_event = adv7842_subscribe_event,
>>  	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
>> diff --git a/drivers/media/radio/si4713/si4713.c b/drivers/media/radio/si4713/si4713.c
>> index adbf43ff6a21..ae7e477774e3 100644
>> --- a/drivers/media/radio/si4713/si4713.c
>> +++ b/drivers/media/radio/si4713/si4713.c
>> @@ -1398,6 +1398,9 @@ static const struct v4l2_ctrl_ops si4713_ctrl_ops = {
>>  
>>  static const struct v4l2_subdev_core_ops si4713_subdev_core_ops = {
>>  	.ioctl		= si4713_ioctl,
>> +#ifdef CONFIG_COMPAT
>> +	.compat_ioctl32	= si4713_ioctl,
>> +#endif
> 
> Should we drop v4l2_subdev_core_ops.compat_ioctl32 and call
> v4l2_subdev_core_ops.ioctl from subdev_do_compat_ioctl32() ? New drivers
> should design custom ioctls in a way that doesn't require compat code.

I agree, we can drop it completely.

I'll skip this patch, but I'll take the other 7 patches and make a v3 PR with
updated Reviewed-by tags from Laurent.

Regards,

	Hans

> 
>>  };
>>  
>>  static const struct v4l2_subdev_tuner_ops si4713_subdev_tuner_ops = {
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index bf3aa9252458..fbd176d6c415 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -686,13 +686,26 @@ static long subdev_ioctl(struct file *file, unsigned int cmd,
>>  }
>>  
>>  #ifdef CONFIG_COMPAT
>> -static long subdev_compat_ioctl32(struct file *file, unsigned int cmd,
>> -	unsigned long arg)
>> +static long subdev_do_compat_ioctl32(struct file *file, unsigned int cmd, void *arg)
>>  {
>>  	struct video_device *vdev = video_devdata(file);
>>  	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
>> +	struct mutex *lock = vdev->lock;
>> +	long ret = -ENODEV;
>>  
>> -	return v4l2_subdev_call(sd, core, compat_ioctl32, cmd, arg);
>> +	if (lock && mutex_lock_interruptible(lock))
>> +		return -ERESTARTSYS;
>> +	if (video_is_registered(vdev))
>> +		ret = v4l2_subdev_call(sd, core, compat_ioctl32, cmd, arg);
>> +	if (lock)
>> +		mutex_unlock(lock);
>> +	return ret;
>> +}
>> +
>> +static long subdev_compat_ioctl32(struct file *file, unsigned int cmd,
>> +	unsigned long arg)
>> +{
>> +	return video_usercopy(file, cmd, arg, subdev_do_compat_ioctl32);
>>  }
>>  #endif
>>  
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index d0e9a5bdb08b..42aa1f6c7c3f 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -195,8 +195,7 @@ struct v4l2_subdev_core_ops {
>>  	int (*s_gpio)(struct v4l2_subdev *sd, u32 val);
>>  	long (*ioctl)(struct v4l2_subdev *sd, unsigned int cmd, void *arg);
>>  #ifdef CONFIG_COMPAT
>> -	long (*compat_ioctl32)(struct v4l2_subdev *sd, unsigned int cmd,
>> -			       unsigned long arg);
>> +	long (*compat_ioctl32)(struct v4l2_subdev *sd, unsigned int cmd, void *arg);
>>  #endif
>>  #ifdef CONFIG_VIDEO_ADV_DEBUG
>>  	int (*g_register)(struct v4l2_subdev *sd, struct v4l2_dbg_register *reg);
> 

