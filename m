Return-Path: <linux-media+bounces-35004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1C6ADBB74
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 22:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4D0A3B3FFD
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 20:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45EAF215F7C;
	Mon, 16 Jun 2025 20:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k55DcCHw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964BE2139CE;
	Mon, 16 Jun 2025 20:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750106825; cv=none; b=meYkY3yPJWJT/LXH3oIRaUmVdC1l7nE3gutrWBX1uRJu0EdLdYLs03CAQE4ZTwCPr/k6v3NI8JdIVzKWdYcnkr5X83RIxBBGzuEfIoZrXM1JptPwWfAfHoKLYnuuW7nGDxxO0kisA2c9JYPgKbZWni9OFTIYWwb3LTvhRDMdQAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750106825; c=relaxed/simple;
	bh=0OgSSjO6xbyQI46xG7vaabloFQEtXfOKW8TtUv1V/Cc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kus5tkORMrq3GYS2l0eZbaVnKIOfU9V8YP/WaQ/HzBW2dfckgyUlXUTVPxhGpU34yGIX5+9c8P/zBqZGyDsxlyWPengeJNRsZsyvCcA0Nshcq2D798jIcjY2npTj7go+Uz6QAeG2AUtC7LN6JoHs2lH6RA27CLt7Q0NmoNYRexg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k55DcCHw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49172C4CEEA;
	Mon, 16 Jun 2025 20:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750106825;
	bh=0OgSSjO6xbyQI46xG7vaabloFQEtXfOKW8TtUv1V/Cc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k55DcCHwuZsapo4JLZGnNei7Rvl+wX5uTEekWGMWQDAlzpIzfRSeFv8b0OQa3QpeB
	 nLOdKgWK+W5BmrHMGBHC8A/VZNGLY8w0K03JsxA8Atlrzcwq+UiA1BfnOw/BwY9aFk
	 XUruHie4GcWEH5Nf0nGt42LYdtYfjjoye3qmpz/WLSc3ktQFYzV4xBe9dz7r+kpk0r
	 vxWt7ZVNAtoJf4IWjyCO0ytwY5uFPY1/AshJiwMK4XDwvAyD/d9S3GPDD2DPcvYhB9
	 fEzWWZwPzmvQDTtHwxXGxIWtNMB4HNdjNzVodetv50A68QUW4z6xRAfOUmMwlnchv/
	 p+kY4kr1hG/SQ==
Message-ID: <ec722aa6-17d4-4264-b99f-bdae1d908713@kernel.org>
Date: Mon, 16 Jun 2025 22:47:01 +0200
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
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <CANiDSCtXmXYkv3b_62iegTFOxBVrGUv9+mbioxvQvPsadwBpqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 16-Jun-25 5:04 PM, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Mon, 16 Jun 2025 at 16:38, Hans de Goede <hansg@kernel.org> wrote:
>>
>> Hi Ricardo,
>>
>> On 4-Jun-25 14:16, Ricardo Ribalda wrote:
>>> If the camera supports the MSXU_CONTROL_METADATA control, auto set the
>>> MSXU_META quirk.
>>>
>>> Reviewed-by: Hans de Goede <hansg@kernel.org>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>>  drivers/media/usb/uvc/uvc_metadata.c | 72 ++++++++++++++++++++++++++++++++++++
>>>  include/linux/usb/uvc.h              |  3 ++
>>>  2 files changed, 75 insertions(+)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
>>> index df3f259271c675feb590c4534dad95b3b786f082..cd58427578ff413591b60abe0a210b90802dddc7 100644
>>> --- a/drivers/media/usb/uvc/uvc_metadata.c
>>> +++ b/drivers/media/usb/uvc/uvc_metadata.c
>>> @@ -10,6 +10,7 @@
>>>  #include <linux/list.h>
>>>  #include <linux/module.h>
>>>  #include <linux/usb.h>
>>> +#include <linux/usb/uvc.h>
>>>  #include <linux/videodev2.h>
>>>
>>>  #include <media/v4l2-ioctl.h>
>>> @@ -188,11 +189,82 @@ static const struct v4l2_file_operations uvc_meta_fops = {
>>>       .mmap = vb2_fop_mmap,
>>>  };
>>>
>>> +static const u8 uvc_msxu_guid[16] = UVC_GUID_MSXU_1_5;
>>> +
>>> +static struct uvc_entity *uvc_meta_find_msxu(struct uvc_device *dev)
>>> +{
>>> +     struct uvc_entity *entity;
>>> +
>>> +     list_for_each_entry(entity, &dev->entities, list) {
>>> +             if (!memcmp(entity->guid, uvc_msxu_guid, sizeof(entity->guid)))
>>> +                     return entity;
>>> +     }
>>> +
>>> +     return NULL;
>>> +}
>>> +
>>> +#define MSXU_CONTROL_METADATA 0x9
>>> +static int uvc_meta_detect_msxu(struct uvc_device *dev)
>>> +{
>>> +     u32 *data __free(kfree) = NULL;
>>> +     struct uvc_entity *entity;
>>> +     int ret;
>>> +
>>> +     entity = uvc_meta_find_msxu(dev);
>>> +     if (!entity)
>>> +             return 0;
>>> +
>>> +     /*
>>> +      * USB requires buffers aligned in a special way, simplest way is to
>>> +      * make sure that query_ctrl will work is to kmalloc() them.
>>> +      */
>>> +     data = kmalloc(sizeof(*data), GFP_KERNEL);
>>> +     if (!data)
>>> +             return -ENOMEM;
>>> +
>>> +     /* Check if the metadata is already enabled. */
>>> +     ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
>>> +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
>>> +     if (ret)
>>> +             return 0;
>>> +
>>> +     if (*data) {
>>> +             dev->quirks |= UVC_QUIRK_MSXU_META;
>>> +             return 0;
>>> +     }
>>> +
>>> +     /*
>>> +      * We have seen devices that require 1 to enable the metadata, others
>>> +      * requiring a value != 1 and others requiring a value >1. Luckily for
>>> +      * us, the value from GET_MAX seems to work all the time.
>>> +      */
>>> +     ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
>>> +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
>>> +     if (ret || !*data)
>>> +             return 0;
>>> +
>>> +     /*
>>> +      * If we can set MSXU_CONTROL_METADATA, the device will report
>>> +      * metadata.
>>> +      */
>>> +     ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
>>> +                          MSXU_CONTROL_METADATA, data, sizeof(*data));
>>> +     if (!ret)
>>> +             dev->quirks |= UVC_QUIRK_MSXU_META;
>>
>> Since we set the ctrl to enable MSXU fmt metadata here, this means that
>> cameras which also support V4L2_META_FMT_D4XX will be switched to MSXU
>> metadata mode at probe() time.
> 
> Not sure that I completely follow you. D4XX cameras will not be
> switched to MSXU, they will support MSXU and D4XX with the current
> patchset.

Is MSXU an extension on top of D4XX ? If not then we need to tell
the camera which metadata we want in uvc_meta_v4l2_set_format()

Currently your patch 4/4 does:

+	ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
+			     MSXU_CONTROL_METADATA, data, sizeof(*data));

in uvc_meta_detect_msxu() which runs at probe time.

So patch 4/4 breaks V4L2_META_FMT_D4XX support as it switched the
camera to MSXU metadata mode (I'm assuming the 2 metadata formats
are different and that MSXU metadata is not just a superset of D4xx).

This is why I suggest supporting only one metadata format. If we
want to support both on cameras which support both and can switch
formats with the msxu control, then this patch needs to modify
uvc_meta_v4l2_set_format() to do something like this:

+	ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
+			     MSXU_CONTROL_METADATA, data, sizeof(*data));

When switching formats, that or only support 1 metadata fmt.

I hope this explains my thinking here, if not keep asking questions ...

Regards,

Hans




> 
>>
>> So even if cameras exist which support both metadata formats, since we
>> switch to MSXU at probe() time, disabling V4L2_META_FMT_D4XX support,
>> the uvcvideo driver will only support 1 metadata fmt per camera.
>> Which is fine supporting more then 1 metadata fmt is not worth
>> the trouble IMHO.
> 
> If we only support one metadata, we have two options for D4XX cameras:
> 
> A) Switch to MSXU: apps that expect D4XX will not work. I think this
> will mean breaking uAPI.
> B) Keep D4XX and ignore MSXU: apps that work with MSXU will not work
> with D4XX cameras. I do not love this but it will not affect my
> usecase.
> 
> 
> If you are ok with B) I can start the implementation. But I still
> believe that the current option is more generic and the extra
> complexity is not too excessive.
> 
> 
>>
>> This means that Laurent's remark on [PATCH v5 4/4]:
>>
>> "I would prefer if you could instead add a metadata format field in the
>> uvc_device structure (I'd put it right after the info field, and while
>> at it you could move the quirks field to that section too). The metadata
>> format would be initialized from dev->info (when available) or set to
>> the UVC format, and overridden when the MSXU is detected."
>>
>> is still relevant, which will also make patch 3/4 cleaner.
>>
>> The idea is to (in patch 3/4):
>>
>> 1. Introduce a dev->meta_format which gets initialized from dev->info->meta_format
>> 2. Keep the quirk and if the quirk is set override dev->meta_format to
>>    V4L2_META_FMT_UVC_MSXU_1_5 thus still allowing testing for MSXU metadata on
>>    cameras which lack the MSXU_CONTROL_METADATA control.
>>
>> Doing things this way avoids the need for the complexity added to
>> uvc_meta_v4l2_try_format() / uvc_meta_v4l2_set_format() /
>> uvc_meta_v4l2_enum_format(). Instead the only changes necessary there now will
>> be replacing dev->info->meta_format with dev->meta_format.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>
>>> +
>>> +     return 0;
>>> +}
>>> +
>>>  int uvc_meta_register(struct uvc_streaming *stream)
>>>  {
>>>       struct uvc_device *dev = stream->dev;
>>>       struct video_device *vdev = &stream->meta.vdev;
>>>       struct uvc_video_queue *queue = &stream->meta.queue;
>>> +     int ret;
>>> +
>>> +     ret = uvc_meta_detect_msxu(dev);
>>> +     if (ret)
>>> +             return ret;
>>>
>>>       stream->meta.format = V4L2_META_FMT_UVC;
>>>
>>> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
>>> index bce95153e5a65613a710d7316fc17cf5462b5bce..ee19e9f915b8370c333c426dc1ee4202c7b75c5b 100644
>>> --- a/include/linux/usb/uvc.h
>>> +++ b/include/linux/usb/uvc.h
>>> @@ -29,6 +29,9 @@
>>>  #define UVC_GUID_EXT_GPIO_CONTROLLER \
>>>       {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
>>>        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
>>> +#define UVC_GUID_MSXU_1_5 \
>>> +     {0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
>>> +      0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
>>>
>>>  #define UVC_GUID_FORMAT_MJPEG \
>>>       { 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
>>>
>>
> 
> 


