Return-Path: <linux-media+bounces-38182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FD9B0C7B1
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 17:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 046704E69DC
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 15:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F1F2D3ED1;
	Mon, 21 Jul 2025 15:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kr1K8HZd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929FB1FDE33
	for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 15:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753112151; cv=none; b=fPn76Wwm6UQ1XPoNzYGfu1TgE0K1RRjOYflGPmCYc8AV2p6yP3kruSwFDR1msoQfjhGQ0SqqbcibuQ9OlDXjdj6faTgMyc0ztPjRVRvmscMKytFKcDGVHFbNXVoFIuX82RdhVA8KqmWmoEO/0x7vCw81kSBrmv/yYUOj8JVjBGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753112151; c=relaxed/simple;
	bh=WOGazgdXC9JlwpdUzteiTBWL7UEUZcUCwsS7PrSXpHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zc4EPRjbn7n7ZcSHQ6VHZ8mIrXNTxCdrvxYzM5oqz+21qFogC+bZK/7yxVagTXawp+uxw3WGF9h3Y8J6hF3G19VuTqxeqI3UVY8TTtqbF0b3tTzjwmngJT1hIVa8A3GUnJsuYUm5kUuLcKxQlCD28tepVhO1nfaMlmVoLtzDm9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kr1K8HZd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762C6C4CEED;
	Mon, 21 Jul 2025 15:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753112151;
	bh=WOGazgdXC9JlwpdUzteiTBWL7UEUZcUCwsS7PrSXpHg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kr1K8HZdBcp4W4ltKw8JI3QeuJzHZMAqDh4tdYYRewCw8d2dq3U3vfR/Le2DXvhYD
	 6vJxWo8gedFyO1pYusyJXegA7mS0ufAylW83SS9LUz0Ml4ygRPk4jBCHsjTt7jMeF3
	 UzQGeKaTVLVjGhLqmUxaAdRWXQUirb4/axSKiLlJsIhQLLZtRfJ4p2wOieMZn689PZ
	 CjQaMjGcrvYBeAFa5j8mAn3fcaO6SI8FVRsNtyhxJnmkJZ4ob9Q+RsnSRByEI2bJK9
	 p/+ZtwmH6SdvIuJKfixBMV0uNlKel8JjZZpP23dDWuBOYPXsN+b2wxt0o3W2IERrer
	 4VvUDLlEbo1XA==
Message-ID: <bb543415-566a-4adf-ba41-1c4b563c445c@kernel.org>
Date: Mon, 21 Jul 2025 17:35:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: uvcvideo: Move MSXU_CONTROL_METADATA
 definition to header
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
References: <20250715185254.6592-1-laurent.pinchart@ideasonboard.com>
 <20250715185254.6592-4-laurent.pinchart@ideasonboard.com>
 <CANiDSCu6gCK5kM_88DvDurxoR7v6pvkCjY84fMNmed4FzQZm7w@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <CANiDSCu6gCK5kM_88DvDurxoR7v6pvkCjY84fMNmed4FzQZm7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 16-Jul-25 12:46 PM, Ricardo Ribalda wrote:
> Hi Laurent
> 
> On Tue, 15 Jul 2025 at 20:53, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> Move the MSXU_CONTROL_METADATA control definitino to the
>> include/linux/usb/uvc.h header, alongside the corresponding XU GUID. Add
>> a UVC_ prefix to avoid namespace clashes.
>>
>> While at it, add the definition for the other controls for that
>> extension unit, as defined in
>> https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#222-extension-unit-controls.
>>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>  drivers/media/usb/uvc/uvc_metadata.c |  9 ++++-----
>>  include/linux/usb/uvc.h              | 16 ++++++++++++++++
>>  2 files changed, 20 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
>> index 386b04a3a102..57f5455a726c 100644
>> --- a/drivers/media/usb/uvc/uvc_metadata.c
>> +++ b/drivers/media/usb/uvc/uvc_metadata.c
>> @@ -171,7 +171,6 @@ static struct uvc_entity *uvc_meta_find_msxu(struct uvc_device *dev)
>>         return NULL;
>>  }
>>
>> -#define MSXU_CONTROL_METADATA 0x9
>>  static int uvc_meta_detect_msxu(struct uvc_device *dev)
>>  {
>>         u32 *data __free(kfree) = NULL;
>> @@ -192,7 +191,7 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
>>
>>         /* Check if the metadata is already enabled. */
>>         ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
>> -                            MSXU_CONTROL_METADATA, data, sizeof(*data));
>> +                            UVC_MSXU_CONTROL_METADATA, data, sizeof(*data));
>>         if (ret)
>>                 return 0;
>>
>> @@ -207,16 +206,16 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
>>          * us, the value from GET_MAX seems to work all the time.
>>          */
>>         ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
>> -                            MSXU_CONTROL_METADATA, data, sizeof(*data));
>> +                            UVC_MSXU_CONTROL_METADATA, data, sizeof(*data));
>>         if (ret || !*data)
>>                 return 0;
>>
>>         /*
>> -        * If we can set MSXU_CONTROL_METADATA, the device will report
>> +        * If we can set UVC_MSXU_CONTROL_METADATA, the device will report
>>          * metadata.
>>          */
>>         ret = uvc_query_ctrl(dev, UVC_SET_CUR, entity->id, dev->intfnum,
>> -                            MSXU_CONTROL_METADATA, data, sizeof(*data));
>> +                            UVC_MSXU_CONTROL_METADATA, data, sizeof(*data));
>>         if (!ret)
>>                 dev->quirks |= UVC_QUIRK_MSXU_META;
>>
>> diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
>> index ee19e9f915b8..72fff9463c88 100644
>> --- a/include/linux/usb/uvc.h
>> +++ b/include/linux/usb/uvc.h
>> @@ -33,6 +33,22 @@
>>         {0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
>>          0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
>>
> 
> Maybe you want to add a link to MS doc here?
> https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#222-extension-unit-controls.

I've added this while merging. I'm afraid the link will likely go
404 over time, but until it goes 404 it will be useful to have.

Regards,

Hans



>> +#define UVC_MSXU_CONTROL_FOCUS                 0x01
>> +#define UVC_MSXU_CONTROL_EXPOSURE              0x02
>> +#define UVC_MSXU_CONTROL_EVCOMPENSATION                0x03
>> +#define UVC_MSXU_CONTROL_WHITEBALANCE          0x04
>> +#define UVC_MSXU_CONTROL_FACE_AUTHENTICATION   0x06
>> +#define UVC_MSXU_CONTROL_CAMERA_EXTRINSICS     0x07
>> +#define UVC_MSXU_CONTROL_CAMERA_INTRINSICS     0x08
>> +#define UVC_MSXU_CONTROL_METADATA              0x09
>> +#define UVC_MSXU_CONTROL_IR_TORCH              0x0a
>> +#define UVC_MSXU_CONTROL_DIGITALWINDOW         0x0b
>> +#define UVC_MSXU_CONTROL_DIGITALWINDOW_CONFIG  0x0c
>> +#define UVC_MSXU_CONTROL_VIDEO_HDR             0x0d
>> +#define UVC_MSXU_CONTROL_FRAMERATE_THROTTLE    0x0e
>> +#define UVC_MSXU_CONTROL_FIELDOFVIEW2_CONFIG   0x0f
>> +#define UVC_MSXU_CONTROL_FIELDOFVIEW2          0x10
>> +
>>  #define UVC_GUID_FORMAT_MJPEG \
>>         { 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
>>          0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>> --
>> Regards,
>>
>> Laurent Pinchart
>>
> 
> 


