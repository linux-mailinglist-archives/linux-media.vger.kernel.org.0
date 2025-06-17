Return-Path: <linux-media+bounces-35044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE1DADC69E
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 11:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB3853B867B
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 09:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19122293B4F;
	Tue, 17 Jun 2025 09:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvTEgw9U"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A331DE2BF;
	Tue, 17 Jun 2025 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152799; cv=none; b=VZmFm+uKt4BQgchSelL6Ebbg8oGDrgw+hGFXwkTQBFjFYlZf1XpHxlhfb0fJ/aeWq3/RsjvOnuNVYViWNqeO8eE3hmJ4xJjX/Z7Ul9N1ZJxRUU/Jvyikx8zWGiU8HMoaGHqTT/WK3CyabwGHq9Xmg9gXp4LPAG39RixLgrRMvTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152799; c=relaxed/simple;
	bh=KyzMbQfhZJNmDrTnESBqCjvNW4ddcm/X4dit05DF09A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UhsZxyQT9QKVCWBpjZaWYlbwc0uZhOIyV/xlwfwBnSvZRPh6KJo2Uj4wgn1/kI4El9L9jn3RycosLyVLUeedlFmv3J09QtRYRT7SsrU1AwpL0oqiMfqc/7nHQvB393L5ZWkvmmdtcnePQWlZZJxsvV3iinHzLcdToSci8x09J4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvTEgw9U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08452C4CEE3;
	Tue, 17 Jun 2025 09:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750152797;
	bh=KyzMbQfhZJNmDrTnESBqCjvNW4ddcm/X4dit05DF09A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FvTEgw9UmFMMc1dqWUmhZ94c2FSeqzHYW0RewK1Zb4PVvQHjAeont1yXOUbM4U53T
	 9Vqmug6RGUbD7DoaArpYISACU4ws7xZ4GtSQTAfZH4UqQLOW1WV4gyIYPtAZwSum79
	 h2/KNlh1vGVyJUmBKTbc78UMtGSfKp52mCyRO8Vyxlcvkl9pNOIKhii4u2OWkkgX9Q
	 kfkIo9A+N6IXLUdiuAO/ANP9GYHCMQAZhwka6Nos9ZL8YxFUqr8wotDQB0q5e2c+8z
	 6wyc8k4+CEuv3be9KbmdzR8OL06yiWq5jL7NJWYGzfryP3+HHXmDt3SWI658KAMNJB
	 QEY6sQiuTVusg==
Message-ID: <9233836e-c50e-4118-95f6-0be02dc0c45e@kernel.org>
Date: Tue, 17 Jun 2025 11:33:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
 <20250604-uvc-meta-v6-4-7141d48c322c@chromium.org>
 <d1e5942b-f8e5-42c6-98ae-d346927df3cb@kernel.org>
 <CANiDSCtXmXYkv3b_62iegTFOxBVrGUv9+mbioxvQvPsadwBpqg@mail.gmail.com>
 <ec722aa6-17d4-4264-b99f-bdae1d908713@kernel.org>
 <CANiDSCu1b2n9c7WH2ZHysOY2xV1RbV9Z6AHBuXXfF8fV8OwYgg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <CANiDSCu1b2n9c7WH2ZHysOY2xV1RbV9Z6AHBuXXfF8fV8OwYgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 16-Jun-25 11:02 PM, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Mon, 16 Jun 2025 at 22:47, Hans de Goede <hansg@kernel.org> wrote:
>>
>> Hi Ricardo,
>>
>> On 16-Jun-25 5:04 PM, Ricardo Ribalda wrote:
>>> Hi Hans
>>>
>>> On Mon, 16 Jun 2025 at 16:38, Hans de Goede <hansg@kernel.org> wrote:
>>>>
>>>> Hi Ricardo,
>>>>
>>>> On 4-Jun-25 14:16, Ricardo Ribalda wrote:
>>>>> If the camera supports the MSXU_CONTROL_METADATA control, auto set the
>>>>> MSXU_META quirk.
>>>>>
>>>>> Reviewed-by: Hans de Goede <hansg@kernel.org>
>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>>> ---
>>>>>  drivers/media/usb/uvc/uvc_metadata.c | 72 ++++++++++++++++++++++++++++++++++++
>>>>>  include/linux/usb/uvc.h              |  3 ++
>>>>>  2 files changed, 75 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
>>>>> index df3f259271c675feb590c4534dad95b3b786f082..cd58427578ff413591b60abe0a210b90802dddc7 100644
>>>>> --- a/drivers/media/usb/uvc/uvc_metadata.c
>>>>> +++ b/drivers/media/usb/uvc/uvc_metadata.c
>>>>> @@ -10,6 +10,7 @@
>>>>>  #include <linux/list.h>
>>>>>  #include <linux/module.h>
>>>>>  #include <linux/usb.h>
>>>>> +#include <linux/usb/uvc.h>
>>>>>  #include <linux/videodev2.h>
>>>>>
>>>>>  #include <media/v4l2-ioctl.h>
>>>>> @@ -188,11 +189,82 @@ static const struct v4l2_file_operations uvc_meta_fops = {
>>>>>       .mmap = vb2_fop_mmap,
>>>>>  };
>>>>>
>>>>> +static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
>>>>> +
>>>>> +static struct uvc_entity *uvc_meta_find_msxu(struct uvc_device *dev)
>>>>> +{
>>>>> +     struct uvc_entity *entity;
>>>>> +
>>>>> +     list_for_each_entry(entity, &dev->entities, list) {
>>>>> +             if (!memcmp(entity->guid, uvc_msxu_guid, sizeof(entity->guid)))
>>>>> +                     return entity;
>>>>> +     }
>>>>> +
>>>>> +     return NULL;
>>>>> +}
>>>>> +
>>>>> +#define MSXU_CONTROL_METADATA 0x9
>>>>> +static int uvc_meta_detect_msxu(struct uvc_device *dev)
>>>>> +{
>>>>> +     u32 *data __free(kfree) = NULL;
>>>>> +     struct uvc_entity *entity;
>>>>> +     int ret;
>>>>> +
>>>>> +     entity = uvc_meta_find_msxu(dev);
>>>>> +     if (!entity)
>>>>> +             return 0;
>>>>> +
>>>>> +     /*
>>>>> +      * USB requires buffers aligned in a special way, simplest way is to
>>>>> +      * make sure that query_ctrl will work is to kmalloc() them.
>>>>> +      */
>>>>> +     data = kmalloc(sizeof(*data), GFP_KERNEL);
>>>>> +     if (!data)
>>>>> +             return -ENOMEM;
>>>>> +
>>>>> +     /* Check if the metadata is already enabled. */
>>>>> +     ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
>>>>> +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
>>>>> +     if (ret)
>>>>> +             return 0;
>>>>> +
>>>>> +     if (*data) {
>>>>> +             dev->quirks |= UVC_QUIRK_MSXU_META;
>>>>> +             return 0;
>>>>> +     }
>>>>> +
>>>>> +     /*
>>>>> +      * We have seen devices that require 1 to enable the metadata, others
>>>>> +      * requiring a value != 1 and others requiring a value >1. Luckily for
>>>>> +      * us, the value from GET_MAX seems to work all the time.
>>>>> +      */
>>>>> +     ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
>>>>> +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
>>>>> +     if (ret || !*data)
>>>>> +             return 0;
>>>>> +
>>>>> +     /*
>>>>> +      * If we can set MSXU_CONTROL_METADATA, the device will report
>>>>> +      * metadata.
>>>>> +      */
>>>>> +     ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
>>>>> +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
>>>>> +     if (!ret)
>>>>> +             dev->quirks |= UVC_QUIRK_MSXU_META;
>>>>
>>>> Since we set the ctrl to enable MSXU fmt metadata here, this means that
>>>> cameras which also support V4L2_META_FMT_D4XX will be switched to MSXU
>>>> metadata mode at probe() time.
>>>
>>> Not sure that I completely follow you. D4XX cameras will not be
>>> switched to MSXU, they will support MSXU and D4XX with the current
>>> patchset.
>>
>> Is MSXU an extension on top of D4XX ? If not then we need to tell
>> the camera which metadata we want in uvc_meta_v4l2_set_format()
> 
> I think I know where the miss-comunication happened :)
> 
> MSXU is indeed a superset of D4xx. D4xx metadata is formatted in MSXU.
> 
> If an app fetches D4XX and MSXU from an Intel D4xx device, they are identical.
> 
> Or in other words, if D4XX devices have MSXU_CONTROL_METADATA, they
> are probably today initialized with a value != 0.

Ok I see. But I still think the way this is handled in patch 3/4
is a bit "clunky". I think we should maybe add a 0 terminated
meta_format array to struct uvc_device and populate that during
probe with (again maybe) a uvc_device_add_metadata_fmt() helper?

Having such an array should make uvc_meta_v4l2_try_format() /
uvc_meta_v4l2_set_format() / uvc_meta_v4l2_enum_format() much
cleaner. And maybe we can even use a single implementation
for try and set?

Can you give this approach a try ?

Regards,

Hans




