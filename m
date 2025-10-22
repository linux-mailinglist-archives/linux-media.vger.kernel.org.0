Return-Path: <linux-media+bounces-45236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFCABFBFAE
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 14:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5D09420DF2
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 12:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16067343D87;
	Wed, 22 Oct 2025 12:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2KVUbGd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EECA344046
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 12:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761137413; cv=none; b=k5TU5/L3UfqaK8la4HTtKCi3UjA3fArD29UPUxG9/8gJioZeqFQb6N3RefK3R9Ryc3LyYheCTSSdrJV+Sx2m1+FnXrh9eI6drlJIFjHb+g27UNrg1DVScVQQF/7s7nL/f0/e5q8P+u5omnTkwB04X5Byaw2S3Ry2Vxsb2o9AoJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761137413; c=relaxed/simple;
	bh=d+E1tz1juGaCDt6viSUVY2x3/1O080/pAx8WbrXe2X4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BGomCnfslaYelVU2t+LVNQ53JQCw13Ah0w9VGcKFQKcVBOB++HXDkRAiDL00j06R0tl461Ey7I6NnSGJZdBqQ+JBmenpI+R1BTe6WG5Wbqgg9iqCmDH2DfxXSjuIWt92VfdSgA399wdrqCylFjvyHDu8SGgz1S72A2TYjWcgmRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2KVUbGd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3180CC4CEFF;
	Wed, 22 Oct 2025 12:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761137412;
	bh=d+E1tz1juGaCDt6viSUVY2x3/1O080/pAx8WbrXe2X4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S2KVUbGdBwDF8VJKmXP2Ntf5qYG6wG2XFAOCy90md+gG00AYqgdHnWZL4rqeeOk6t
	 yzA0/G/+9Pem3JDs4tBDBTOD7wYNhxe5T23hhgtSWmPntrS7AwcJOyErjFXApT8Clw
	 hDZkWAVqQVzoN+pOZDW4VI3qiBoG/p1pX0At8n383HabBsx5tj1JsFPHwnDBaaqEMX
	 Ito9l0vdP7bIaACxOPhXMdgRDq+gxaGdOkjcY2B3IKC+ZX3iY8GJ34wpIhJ3IUVysE
	 w5rtm73DVhI59tSB/EIt6fc/7Wfpz6bIJI9Ss7PLaF9CRDA6VHHliH2p6N4X4qAcud
	 NGAtwgaboyvyA==
Message-ID: <fe4dd180-a925-44bd-8d10-02a6c80989ef@kernel.org>
Date: Wed, 22 Oct 2025 14:50:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ipu6: isys: Add support for monochrome media bus
 formats
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 linux-media@vger.kernel.org
References: <20251020153741.55404-1-hansg@kernel.org>
 <0d13a805-fc50-b8dc-4f5f-b4c9d24ea77a@linux.intel.com>
 <aPeQMFCNEniNjC5_@kekkonen.localdomain>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aPeQMFCNEniNjC5_@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bingbu, Sakari,

On 21-Oct-25 3:52 PM, Sakari Ailus wrote:
> Hi Bingbu, Hans,
> 
> On Tue, Oct 21, 2025 at 04:10:19PM +0800, Bingbu Cao wrote:
>>
>> Hans,
>>
>> Thanks for the patch.
>>
>> On 10/20/25 11:37 PM, Hans de Goede wrote:
>>> Add support for monochrome media bus formats, for use with monochrome/IR
>>> camera sensors.
>>>
>>> This has been tested on a Dell XPS 13 9320 with OV1A1B IR sensor.
>>>
>>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>>> ---
>>>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  4 +++
>>>  .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 34 ++++++++++++++-----
>>>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 14 ++++++++
>>>  3 files changed, 43 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
>>> index d1fece6210ab..daec6b865bda 100644
>>> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
>>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
>>> @@ -42,6 +42,10 @@ static const u32 csi2_supported_codes[] = {
>>>  	MEDIA_BUS_FMT_SGBRG8_1X8,
>>>  	MEDIA_BUS_FMT_SGRBG8_1X8,
>>>  	MEDIA_BUS_FMT_SRGGB8_1X8,
>>> +	MEDIA_BUS_FMT_Y8_1X8,
>>> +	MEDIA_BUS_FMT_Y10_1X10,
>>> +	MEDIA_BUS_FMT_Y12_1X12,
>>> +	MEDIA_BUS_FMT_Y16_1X16,
>>>  	MEDIA_BUS_FMT_META_8,
>>>  	MEDIA_BUS_FMT_META_10,
>>>  	MEDIA_BUS_FMT_META_12,
>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
>>> index 463a0adf9e13..869e7d4ba572 100644
>>> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
>>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
>>> @@ -25,24 +25,28 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
>>>  	case MEDIA_BUS_FMT_RGB565_1X16:
>>>  	case MEDIA_BUS_FMT_UYVY8_1X16:
>>>  	case MEDIA_BUS_FMT_YUYV8_1X16:
>>> +	case MEDIA_BUS_FMT_Y16_1X16:
>>>  	case MEDIA_BUS_FMT_META_16:
>>>  		return 16;
>>>  	case MEDIA_BUS_FMT_SBGGR12_1X12:
>>>  	case MEDIA_BUS_FMT_SGBRG12_1X12:
>>>  	case MEDIA_BUS_FMT_SGRBG12_1X12:
>>>  	case MEDIA_BUS_FMT_SRGGB12_1X12:
>>> +	case MEDIA_BUS_FMT_Y12_1X12:
>>>  	case MEDIA_BUS_FMT_META_12:
>>>  		return 12;
>>>  	case MEDIA_BUS_FMT_SBGGR10_1X10:
>>>  	case MEDIA_BUS_FMT_SGBRG10_1X10:
>>>  	case MEDIA_BUS_FMT_SGRBG10_1X10:
>>>  	case MEDIA_BUS_FMT_SRGGB10_1X10:
>>> +	case MEDIA_BUS_FMT_Y10_1X10:
>>>  	case MEDIA_BUS_FMT_META_10:
>>>  		return 10;
>>>  	case MEDIA_BUS_FMT_SBGGR8_1X8:
>>>  	case MEDIA_BUS_FMT_SGBRG8_1X8:
>>>  	case MEDIA_BUS_FMT_SGRBG8_1X8:
>>>  	case MEDIA_BUS_FMT_SRGGB8_1X8:
>>> +	case MEDIA_BUS_FMT_Y8_1X8:
>>>  	case MEDIA_BUS_FMT_META_8:
>>>  		return 8;
>>>  	default:
>>> @@ -65,21 +69,25 @@ unsigned int ipu6_isys_mbus_code_to_mipi(u32 code)
>>>  	case MEDIA_BUS_FMT_SGBRG16_1X16:
>>>  	case MEDIA_BUS_FMT_SGRBG16_1X16:
>>>  	case MEDIA_BUS_FMT_SRGGB16_1X16:
>>> +	case MEDIA_BUS_FMT_Y16_1X16:
>>>  		return MIPI_CSI2_DT_RAW16;
>>>  	case MEDIA_BUS_FMT_SBGGR12_1X12:
>>>  	case MEDIA_BUS_FMT_SGBRG12_1X12:
>>>  	case MEDIA_BUS_FMT_SGRBG12_1X12:
>>>  	case MEDIA_BUS_FMT_SRGGB12_1X12:
>>> +	case MEDIA_BUS_FMT_Y12_1X12:
>>>  		return MIPI_CSI2_DT_RAW12;
>>>  	case MEDIA_BUS_FMT_SBGGR10_1X10:
>>>  	case MEDIA_BUS_FMT_SGBRG10_1X10:
>>>  	case MEDIA_BUS_FMT_SGRBG10_1X10:
>>>  	case MEDIA_BUS_FMT_SRGGB10_1X10:
>>> +	case MEDIA_BUS_FMT_Y10_1X10:
>>>  		return MIPI_CSI2_DT_RAW10;
>>>  	case MEDIA_BUS_FMT_SBGGR8_1X8:
>>>  	case MEDIA_BUS_FMT_SGBRG8_1X8:
>>>  	case MEDIA_BUS_FMT_SGRBG8_1X8:
>>>  	case MEDIA_BUS_FMT_SRGGB8_1X8:
>>> +	case MEDIA_BUS_FMT_Y8_1X8:
>>>  		return MIPI_CSI2_DT_RAW8;
>>>  	case MEDIA_BUS_FMT_META_8:
>>>  	case MEDIA_BUS_FMT_META_10:
>>> @@ -96,15 +104,23 @@ unsigned int ipu6_isys_mbus_code_to_mipi(u32 code)
>>>  
>>>  bool ipu6_isys_is_bayer_format(u32 code)
>>>  {
>>> -	switch (ipu6_isys_mbus_code_to_mipi(code)) {
>>> -	case MIPI_CSI2_DT_RAW8:
>>> -	case MIPI_CSI2_DT_RAW10:
>>> -	case MIPI_CSI2_DT_RAW12:
>>> -	case MIPI_CSI2_DT_RAW14:
>>> -	case MIPI_CSI2_DT_RAW16:
>>> -	case MIPI_CSI2_DT_RAW20:
>>> -	case MIPI_CSI2_DT_RAW24:
>>> -	case MIPI_CSI2_DT_RAW28:
>>> +	switch (code) {
>>> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
>>> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
>>> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
>>> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
>>> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
>>> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
>>> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
>>> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
>>> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
>>> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
>>> +	case MEDIA_BUS_FMT_SGRBG12_1X12:
>>> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
>>> +	case MEDIA_BUS_FMT_SRGGB16_1X16:
>>> +	case MEDIA_BUS_FMT_SGRBG16_1X16:
>>> +	case MEDIA_BUS_FMT_SGBRG16_1X16:
>>> +	case MEDIA_BUS_FMT_SBGGR16_1X16:
>>>  		return true;
>>>  	default:
>>>  		return false;
>>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>> index f3f3bc0615e5..dec8f5ffcfa5 100644
>>> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>>> @@ -77,6 +77,20 @@ const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
>>>  	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
>>>  	{ V4L2_PIX_FMT_SRGGB10P, 10, 10, MEDIA_BUS_FMT_SRGGB10_1X10,
>>>  	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
>>> +
>>> +	{ V4L2_PIX_FMT_GREY, 8, 8, MEDIA_BUS_FMT_Y8_1X8,
>>> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8 },
>>> +	{ V4L2_PIX_FMT_Y10, 16, 10, MEDIA_BUS_FMT_Y10_1X10,
>>> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
>>> +	{ V4L2_PIX_FMT_Y12, 16, 12, MEDIA_BUS_FMT_Y12_1X12,
>>> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
>>> +	{ V4L2_PIX_FMT_Y16, 16, 16, MEDIA_BUS_FMT_Y16_1X16,
>>> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
>>> +	{ V4L2_PIX_FMT_Y10P, 10, 10, MEDIA_BUS_FMT_Y10_1X10,
>>> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
>>> +	{ V4L2_PIX_FMT_Y12P, 12, 12, MEDIA_BUS_FMT_Y12_1X12,
>>> +	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12 },
>>
>> The code looks fine for me. I am wondering which sensor to test these
>> packed format for IPU6.
> 
> Such packed formats appear to be defined for Bayer formats, too, so I'd
> expect them to work as the Bayer equivalents that are already supported.

Right, on the CSI side this is e.g. always 10 bits / pixel but
then the isys can be configured to either store this in the in
memory framebuffer either sparse using 16 bits / pixel or packed
with std mipi packing.

Both paths (sparse + packed) have been tested with bayer patterns
since the softISP supports both memory buffer formats.

For the monochrome support I've tested with the libcamera "cam" app
using 16 bpp sparse + imagemagick to convert the raw Y buffers to
png-s to look at the result:

magick -depth 16 -size 1312x816 gray:XXXXXXXX.bin -auto-level result.png

Note the 1312 is necessary because the stride for 1296x816 is 1312
bytes/line.

Regards,

Hans



