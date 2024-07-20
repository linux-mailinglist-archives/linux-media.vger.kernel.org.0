Return-Path: <linux-media+bounces-15194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C88D6938007
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 10:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FAA4B2190A
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 08:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355A53BBED;
	Sat, 20 Jul 2024 08:40:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD24826AF2;
	Sat, 20 Jul 2024 08:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721464820; cv=none; b=fje2+lI1o9YFu6/RbDt5GD0dubaYwzKKQR+bA4vF0fF4vCaSh1aM97Xt7LW3K0FZZUXBrIDSZsnUO8Zyiz6lFWNDwWWbIwA+0AEK4RaKrIXh8dhTXvl1qs+YBU0/x609Qqxdp4hHq/RknQrb90oYKkjKIUao0/ltA3RI7nOQDTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721464820; c=relaxed/simple;
	bh=SkHeVrlpBhe/z0qNNjbd3iHC/OINv6iy4e3QV7yGN1c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=raXguqyMF/85LyKO9z+nTcrqqEek3YKjmjjtuGEl00zwpSB5SjW8YSvXCRXwkcCH3YUIHJxa8+OaeLB/mmqFYrwaqnOpDYJf0k6g6XxZf2EjB+hAiT/fD2lpMjoUyLbJ/6jOhxzSSFoUUmAalLA/4EFbOHK8YgrvvnHEuukOwmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E07C2BD10;
	Sat, 20 Jul 2024 08:40:18 +0000 (UTC)
Message-ID: <d48f71b4-327c-4fe0-99b4-a48f48f3f1e2@xs4all.nl>
Date: Sat, 20 Jul 2024 10:40:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] media: videodev2: Add flags to unconditionnaly
 enumerate pixels formats
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
 <20240717131430.159727-2-benjamin.gaignard@collabora.com>
 <91c2843f-b8e9-42cb-b4e9-fe7b13df9f53@xs4all.nl>
Content-Language: en-US, nl
In-Reply-To: <91c2843f-b8e9-42cb-b4e9-fe7b13df9f53@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/07/2024 15:15, Hans Verkuil wrote:
> On 17/07/2024 15:14, Benjamin Gaignard wrote:
>> Add new flags to enumerate all pixels formats when calling VIDIOC_ENUM_FMT ioctl.
>> When this V4L2_FMT_FLAG_ENUM_ALL_FORMATS flag is set drivers must
>> ignore the configuration and return the hardware supported pixel
>> formats for the specified queue.
>> To distinguish this particular enumeration case V4L2_FMT_FLAG_ALL_FORMATS
>> flag must be set by the drivers to highlight support of this feature
>> to user space applications.
>> This will permit to discover which pixel formats are supported
>> without setting codec-specific information so userland can more easily
>> know if the driver suits its needs well.
>> The main target are stateless decoders so update the documentation
>> about how to use this flag.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> changes in version 4:
>> - Explicitly document that the new flags are targeting mem2mem devices.
>>
>>  .../userspace-api/media/v4l/dev-stateless-decoder.rst |  6 ++++++
>>  .../userspace-api/media/v4l/vidioc-enum-fmt.rst       | 11 +++++++++++
>>  .../userspace-api/media/videodev2.h.rst.exceptions    |  2 ++
>>  drivers/media/v4l2-core/v4l2-ioctl.c                  |  3 +++
>>  include/uapi/linux/videodev2.h                        |  2 ++
>>  5 files changed, 24 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
>> index 35ed05f2695e..b0b657de910d 100644
>> --- a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
>> +++ b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
>> @@ -58,6 +58,12 @@ Querying capabilities
>>       default values for these controls being used, and a returned set of formats
>>       that may not be usable for the media the client is trying to decode.
>>  
>> +   * If the ``V4L2_FMT_FLAG_ENUM_ALL_FORMATS`` flag is set the driver must enumerate
>> +     all the supported formats without taking care of codec-dependent controls
>> +     set on the ``OUTPUT`` queue. To indicate that the driver has take care of this
>> +     flag it must set ``V4L2_FMT_FLAG_ALL_FORMATS`` flag for each format while
>> +     enumerating.
>> +
>>  3. The client may use :c:func:`VIDIOC_ENUM_FRAMESIZES` to detect supported
>>     resolutions for a given format, passing desired pixel format in
>>     :c:type:`v4l2_frmsizeenum`'s ``pixel_format``.
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> index 3adb3d205531..15bc2f59c05a 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
>> @@ -234,6 +234,17 @@ the ``mbus_code`` field is handled differently:
>>  	valid. The buffer consists of ``height`` lines, each having ``width``
>>  	Data Units of data and the offset (in bytes) between the beginning of
>>  	each two consecutive lines is ``bytesperline``.
>> +    * - ``V4L2_FMT_FLAG_ENUM_ALL_FORMATS``
>> +      - 0x0400
>> +      - Set by userland applications to enumerate all possible pixel formats
>> +        without taking care of any OUTPUT or CAPTURE queue configuration.
>> +        This flag is relevant only for mem2mem devices.
>> +    * - ``V4L2_FMT_FLAG_ALL_FORMATS``
>> +      - 0x0800
>> +      - Set by the driver to indicated that format have been enumerated because
>> +        :ref:`V4L2_FMT_FLAG_ENUM_ALL_FORMATS <v4l2-pix-fmt-flag-set-csc>` has
>> +        been set by the userland application.
>> +        This flag is relevant only for mem2mem devices.
>>  
>>  Return Value
>>  ============
>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> index bdc628e8c1d6..7a3a1e9dc055 100644
>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
>> @@ -216,6 +216,8 @@ replace define V4L2_FMT_FLAG_CSC_YCBCR_ENC fmtdesc-flags
>>  replace define V4L2_FMT_FLAG_CSC_HSV_ENC fmtdesc-flags
>>  replace define V4L2_FMT_FLAG_CSC_QUANTIZATION fmtdesc-flags
>>  replace define V4L2_FMT_FLAG_META_LINE_BASED fmtdesc-flags
>> +replace define V4L2_FMT_FLAG_ENUM_ALL_FORMATS fmtdesc-flags
>> +replace define V4L2_FMT_FLAG_ALL_FORMATS fmtdesc-flags
>>  
>>  # V4L2 timecode types
>>  replace define V4L2_TC_TYPE_24FPS timecode-type
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 4c76d17b4629..5785a98b6ba2 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1569,6 +1569,7 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>>  	int ret = check_fmt(file, p->type);
>>  	u32 mbus_code;
>>  	u32 cap_mask;
>> +	u32 flags;
>>  
>>  	if (ret)
>>  		return ret;
>> @@ -1578,8 +1579,10 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>>  		p->mbus_code = 0;
>>  
>>  	mbus_code = p->mbus_code;
>> +	flags = p->flags & V4L2_FMT_FLAG_ENUM_ALL_FORMATS;
>>  	memset_after(p, 0, type);
>>  	p->mbus_code = mbus_code;
>> +	p->flags = flags;
>>  
>>  	switch (p->type) {
>>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index fe6b67e83751..b6a5da79ba21 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -886,6 +886,8 @@ struct v4l2_fmtdesc {
>>  #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
>>  #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
>>  #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
>> +#define V4L2_FMT_FLAG_ENUM_ALL_FORMATS		0x0400
>> +#define V4L2_FMT_FLAG_ALL_FORMATS		0x0800
> 
> For reasons mentioned earlier, you cannot make the flags field an input to the
> driver, that will almost certainly break some applications that do not zero
> the flags field today, since they expect it to be set by the driver.
> 
> What probably will work is to add a flag to the index field: this would be
> similar to what I do in VIDIOC_QUERYCTRL where you can OR the id field with
> V4L2_CTRL_FLAG_NEXT_CTRL to modify the behavior.
> 
> It is perfectly fine to use the top bits of the index for this.
> 
> Drivers that do not support this will just fail with EINVAL, and drivers that
> do support this will return a proper format.
> 
> Applications can easily test support for this by just calling ENUM_FMT with 0
> ORed with the new flag: if it is supported, then it will return 0, otherwise
> -EINVAL.
> 
> With this scheme I think you can also drop the proposed V4L2_FMT_FLAG_ALL_FORMATS
> flag.

Please note that this is an addition to the uAPI, so this also implies that
there should be patches for v4l-utils (v4l2-ctl and v4l2-compliance) and
ideally patches for one or more of the media test-drivers to implement this
flag. Together with v4l2-compliance that will ensure that the new flag is
actually tested by the regression tests.

Regards,

	Hans

> 
> But as I mentioned in my reply to the cover letter of this series, I am not
> convinced we really need this, and if we do, then I am not convinced about
> the name of the flag.
> 
> And I would also like to know if such a feature can be used by m2m drivers
> that are not codecs (e.g. scalers, csc converters), and if that would impact
> the name/description of the flag.
> 
> It is currently very specific for decoders, but I prefer to see a more general
> solution, not just for one specific corner case.
> 
> Regards,
> 
> 	Hans
> 
>>  
>>  	/* Frame Size and frame rate enumeration */
>>  /*
> 
> 


