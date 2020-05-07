Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B941C8346
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 09:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgEGHOX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 03:14:23 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:52945 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725834AbgEGHOX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 03:14:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id WajXjt77j8hmdWajbjESeT; Thu, 07 May 2020 09:14:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588835660; bh=+qDNWwp87lKMUHdFLqR7C9oEa5HDPiDUf0yQGM9reW4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BcwGC74kEZ4arp0j6SJREbhrlWgXdkMIwUYa1Qr04/MG9QzCU4J+N+zuPNegu0phU
         S32TRGQr9ixvNFR9BALLc/ENwwCWDvogSpQt0o4HvgzKB+ybebOzdq+4Oi+HC1Urkm
         3VaJvMGE8BsrykbGMnvwQEWwBVgDTz4I4xxm55yRfT9SlVCfkfSHCH7GYf0KZVzEu4
         K0BersbtZONYMNwKQtp/Ll2ySoSvIQTQx6M5vESLu00b6xlg6P58qsHfwDOeyYDeAQ
         vfHdzf4ePFNEGPulRUd34MwBk7qKRHDmO6+Ct+uhLGfsWiYp2AfC8/vOH3VVg5bdfD
         js3xnZ4k8sjyA==
Subject: Re: [PATCH v5 5/6] v4l2-subdev: add VIDIOC_SUBDEV_QUERYCAP ioctl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org, mchehab@kernel.org,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com,
        Hans Verkuil <hans.verkuil@cisco.com>
References: <20200428210609.6793-1-jacopo@jmondi.org>
 <20200428210609.6793-6-jacopo@jmondi.org>
 <20200428212858.GC5381@paasikivi.fi.intel.com>
 <20200429080949.walimwkrth3ixn2o@uno.localdomain>
 <20200429081859.GA9190@paasikivi.fi.intel.com>
 <15053210-8d02-afbd-0d02-b08f9b5f4378@xs4all.nl>
 <20200506183459.GA9190@paasikivi.fi.intel.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5a016d20-6582-1dff-935f-ad49434c5eeb@xs4all.nl>
Date:   Thu, 7 May 2020 09:14:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200506183459.GA9190@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCSmQ0b8oiZu9UvRlLVqzFsS7TmJ1LBnD1fHi4yHm6RgiiiAa87xyI8bkkQvp+ixxvcdxBHRA8Aa3+8TK3iaIduVss1X7xB/2HCXzt1Xujk1IOVxmJDh
 aWvoBDen5X2oRi3xaKfo28nGTSjgV4N10VFiVDtXxaAH1CnKANwE11gIugfk9OtQZ4eMxPeUxMUZJbM2VO9OIcrFrcX7TcJdmpHAwC23iOvpPewW6JDraSjG
 LXX9NTRx/5MqpHuqI8Thqgc+xaSQHn6PVgnoNILhkEI2GtkkyOs0zjLNESR5yyHCvhgTO+vmhooy1gxmHUMUw0wlOcVOgBpDibeLImf5+GIxhOqeBBLMXuFC
 CrvdFtdTxfemV68jiGTOrq6Xeccz24Tge6HbxR/oTaMc1IAC5TGfAblL0+u0YvzBVpKcaIeqqO0rH1rErgMMofq30LxaN/DUN2zPoDnupT9vAIOz804=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/05/2020 20:34, Sakari Ailus wrote:
> Hi Hans, Jacopo,
> 
> On Wed, May 06, 2020 at 03:29:03PM +0200, Hans Verkuil wrote:
>> On 29/04/2020 10:18, Sakari Ailus wrote:
>>> Hi Jacopo,
>>>
>>> On Wed, Apr 29, 2020 at 10:09:49AM +0200, Jacopo Mondi wrote:
>>>> Hi Sakari,
>>>>
>>>> On Wed, Apr 29, 2020 at 12:28:58AM +0300, Sakari Ailus wrote:
>>>>> Hi Jacopo,
>>>>>
>>>>> On Tue, Apr 28, 2020 at 11:06:08PM +0200, Jacopo Mondi wrote:
>>>>>> From: Hans Verkuil <hans.verkuil@cisco.com>
>>>>>>
>>>>>> While normal video/radio/vbi/swradio nodes have a proper QUERYCAP ioctl
>>>>>> that apps can call to determine that it is indeed a V4L2 device, there
>>>>>> is currently no equivalent for v4l-subdev nodes. Adding this ioctl will
>>>>>> solve that, and it will allow utilities like v4l2-compliance to be used
>>>>>> with these devices as well.
>>>>>>
>>>>>> SUBDEV_QUERYCAP currently returns the version and subdev_caps of the
>>>>>> subdevice. Define as the initial set of subdev_caps the read-only or
>>>>>> read/write flags, to signal to userspace which set of IOCTLs are
>>>>>> available on the subdevice.
>>>>>>
>>>>>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
>>>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>>>>> ---
>>>>>>  drivers/media/v4l2-core/v4l2-subdev.c | 12 ++++++++++++
>>>>>>  include/uapi/linux/v4l2-subdev.h      | 15 +++++++++++++++
>>>>>>  2 files changed, 27 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>>>>>> index f3fe515b8ccb..b8c0071aa4d0 100644
>>>>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>>>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>>>>> @@ -15,6 +15,7 @@
>>>>>>  #include <linux/types.h>
>>>>>>  #include <linux/videodev2.h>
>>>>>>  #include <linux/export.h>
>>>>>> +#include <linux/version.h>
>>>>>>
>>>>>>  #include <media/v4l2-ctrls.h>
>>>>>>  #include <media/v4l2-device.h>
>>>>>> @@ -331,6 +332,17 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>>>>>  	int rval;
>>>>>>
>>>>>>  	switch (cmd) {
>>>>>> +	case VIDIOC_SUBDEV_QUERYCAP: {
>>>>>> +		struct v4l2_subdev_capability *cap = arg;
>>>>>> +
>>>>>> +		memset(cap, 0, sizeof(*cap));
>>>>>> +		cap->version = LINUX_VERSION_CODE;
>>>>>> +		cap->subdev_caps |= ro_subdev ? V4L2_SUBDEV_CAP_RO_SUBDEV
>>>>>> +					      : V4L2_SUBDEV_CAP_RW_SUBDEV;
>>>>>> +
>>>>>> +		return 0;
>>>>>> +	}
>>>>>> +
>>>>>>  	case VIDIOC_QUERYCTRL:
>>>>>>  		/*
>>>>>>  		 * TODO: this really should be folded into v4l2_queryctrl (this
>>>>>> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
>>>>>> index 03970ce30741..89dc8f2ba6b3 100644
>>>>>> --- a/include/uapi/linux/v4l2-subdev.h
>>>>>> +++ b/include/uapi/linux/v4l2-subdev.h
>>>>>> @@ -155,9 +155,24 @@ struct v4l2_subdev_selection {
>>>>>>  	__u32 reserved[8];
>>>>>>  };
>>>>>>
>>>>>> +/**
>>>>>> + * struct v4l2_subdev_capability - subdev capabilities
>>>>>> + * @device_caps: the subdev capabilities, see V4L2_SUBDEV_CAP_*.
>>>>>> + */
>>>>>> +struct v4l2_subdev_capability {
>>>>>> +	__u32 version;
>>>>>> +	__u32 subdev_caps;
>>>>>
>>>>> How do you intend to address additional fields being added to the struct in
>>>>> the future? Something else than what's been done in V4L2 traditionally?
>>>>>
>>>>
>>>> I'm not sure I get what you mean here, so I assume I don't know what
>>>> "has been done in V4L2 traditionally" and why what I have here goes
>>>> against it...
>>>
>>> I can't help noticing you have no reserved fields in your IOCTL argument
>>> struct. That has generally been the way V4L2 IOCTLs have been extended when
>>> there's been a need to.
>>>
>>> Media controller adopted a different approach to that recently, based on
>>> the argument size. We've discussed doing that on V4L2 but I don't think
>>> a decision has been made.
>>>
>>
>> While I agree that using the argument size to do 'versioning' of the API
>> is a better solution, the fact is that historically we always used a 'reserved'
>> field. And I think we need to do that here as well. It's consistent with
>> the existing subdev ioctls, so I would be in favor of adding a 'u32 reserved[6];'
>> field.
> 
> Agreed. Could be even 14, in practice it matters little performance-wise.

True. Let's make it 14.

Regards,

	Hans

> 
>>
>> If there are such strong feelings against it that it wouldn't be merged, then
>> we can always just leave it as-is. It's not worth blocking this patch just
>> because of that.
> 
> I'm not (strongly) pushing either here; just that we need to make a
> decision. I'm in favour of the reserved field for the same reason. I was
> just wondering whether it was intentional. :-)
> 
>>
>> BTW, one thing that should be changed is the name 'subdev_caps': just name it
>> 'capabilities'. It's a field in a struct v4l2_subdev_capability, so it is
>> already obvious that this is subdev specific.
> 

