Return-Path: <linux-media+bounces-18767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD97989C2C
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 10:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2A58B22914
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 08:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D4B15D5D9;
	Mon, 30 Sep 2024 08:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VgE8AoXS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED3840862
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 08:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727683533; cv=none; b=b5uZYvjcRYfU8z4Ox4G83RQvmiV6WE8nsDfYaAj77bQ3jf0iY0a20p3y4kuN+eFUf392Bs+G1wvfRH1NOmJSnDtLhg9PuDvgmf2un50COTjaNu1J+/hhRMC0ezHpTipF5p8IfsM5JnJLGvmMnL7ywQzRVvCm7u5RhyAhtCysOBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727683533; c=relaxed/simple;
	bh=91+kmbwioIVhFtUnf946hn52Xx1QWfSzR23pbpqkfB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u+m8Pxrex6S82dnZpVTkAAjiQtmrqXkPJgZUpeGT+L7QJM5Yjx/QAtig15C+/YIyLpNbJGXj3I75degOyA88+A+8ZcrYO6iHvcWui3LlwsPISd2HYmpxaxIMqOxtsksAhRUCKE/0JMQMkZ0xdC9YdO6fgn13GTBNaghJVM7wHhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VgE8AoXS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 327CB39F;
	Mon, 30 Sep 2024 10:03:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727683438;
	bh=91+kmbwioIVhFtUnf946hn52Xx1QWfSzR23pbpqkfB4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VgE8AoXS8+ZmohOeNF+3caMtqOKq/r6XrQqBcRZ3G1DrVN5bD9TUmWhyqDVloRgIy
	 crkxceAra8qp7BYrH43u2Zj/Tyc4ryvuBcEl6pWtQaVnx1klmC4C3dkD8sUJmXHJtK
	 3KFYqPGFypBQPYRVTdhvOTAfjefzjKtUo2727o/M=
Message-ID: <684a8564-23aa-45d5-bed2-3026743dddd2@ideasonboard.com>
Date: Mon, 30 Sep 2024 09:05:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: v4l2: Add Renesas Camera Receiver Unit pixel
 formats
To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc: "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
 <20240920124115.375748-2-dan.scally@ideasonboard.com>
 <OSZPR01MB701939FF3C646166076B7AD8AA6B2@OSZPR01MB7019.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <OSZPR01MB701939FF3C646166076B7AD8AA6B2@OSZPR01MB7019.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Morning Prabhakar

On 27/09/2024 12:29, Prabhakar Mahadev Lad wrote:
> Hi Daniel,
>
> Thank you for the patch.
>
>> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>>
>> The Renesas Camera Receiver Unit in the RZ/G2L and RZ/V2H SoCs can output
>> RAW data captured from an image sensor without conversion to an RGB/YUV
>> format. In that case the data are packed into 64-bit blocks, with a
>> variable amount of padding in the most significant bits depending on the
>> bitdepth of the data. Add new V4L2 pixel format codes for the new formats,
>> along with documentation to describe them.
>>
> Which path are you referring here?
>
> In the full bypass mode, the data will be stored according to MIPI standard so 32bit.
>
> In (non)-Image Processing case the data is packed into 256-bits.
>
> I maybe misunderstanding here can you please clarify.


It's not the full bypass mode, but the formats labelled RAW10/12/14 in Table 9.1-14 of the RZ/G2L 
documentation. The table describes up to 256-bits, but the packing for the RAW formats seems to be 
in 64-bit units that are repeated 4 times. As I understand it it's the same path as for the RAW8 
output enabled in your recent series.


Thanks

Dan

>
>> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>> ---
>>   .../userspace-api/media/v4l/pixfmt-bayer.rst  |   1 +
>>   .../media/v4l/pixfmt-srggbnn-cru.rst          | 143 ++++++++++++++++++
>>   drivers/media/v4l2-core/v4l2-common.c         |  12 ++
>>   drivers/media/v4l2-core/v4l2-ioctl.c          |  12 ++
>>   include/uapi/linux/videodev2.h                |  16 ++
>>   5 files changed, 184 insertions(+)
>>   create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggbnn-
>> cru.rst
>>
>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
>> b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
>> index ed3eb432967d..658068364ea1 100644
>> --- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
>> @@ -31,3 +31,4 @@ orders. See also `the Wikipedia article on Bayer filter
>>       pixfmt-srggb14
>>       pixfmt-srggb14p
>>       pixfmt-srggb16
>> +    pixfmt-srggbnn-cru
>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggbnn-cru.rst
>> b/Documentation/userspace-api/media/v4l/pixfmt-srggbnn-cru.rst
>> new file mode 100644
>> index 000000000000..a169b7bbef79
>> --- /dev/null
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-srggbnn-cru.rst
>> @@ -0,0 +1,143 @@
>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
>> +
>> +***********************************************************************
>> +*******************************************************************
>> +V4L2_PIX_FMT_CRU_SBGGRnn ('CnnB'), V4L2_PIX_FMT_CRU_SGBRGnn ('CnnG'),
>> +V4L2_PIX_FMT_CRU_SGRBGnn ('Cnng'), V4L2_PIX_FMT_CRU_SRGGBnn ('CnnR')
>> +***********************************************************************
>> +*******************************************************************
>> +
>> +========================================================
>> +Renesas Camera Receiver Unit 64-bit packed pixel formats
>> +========================================================
>> +
>> +| V4L2_PIX_FMT_CRU_SBGGR10 (C10B)
>> +| V4L2_PIX_FMT_CRU_SGBRG10 (C10G)
>> +| V4L2_PIX_FMT_CRU_SGRBG10 (C10g)
>> +| V4L2_PIX_FMT_CRU_SRGGB10 (C10R)
>> +| V4L2_PIX_FMT_CRU_SBGGR12 (C12B)
>> +| V4L2_PIX_FMT_CRU_SGBRG12 (C12G)
>> +| V4L2_PIX_FMT_CRU_SGRBG12 (C12g)
>> +| V4L2_PIX_FMT_CRU_SRGGB12 (C12R)
>> +| V4L2_PIX_FMT_CRU_SBGGR14 (C14B)
>> +| V4L2_PIX_FMT_CRU_SGBRG14 (C14G)
>> +| V4L2_PIX_FMT_CRU_SGRBG14 (C14g)
>> +| V4L2_PIX_FMT_CRU_SRGGB14 (C14R)
>> +
>> +Description
>> +===========
>> +
>> +These pixel formats are some of the available output formats for the
>> +Camera Receiver Unit in the Renesas RZ/G2L and V2H SoCs. They are raw
>> +sRGB / Bayer formats which pack pixels contiguously into 64-bit units,
>> +with the 4 or 8 most significant bits padded.
>> +
>> +The packing format is similar to the IPU3 packing formats defined in
>> +:ref:`v4l2-pix-fmt-ipu3-sbggr10`, albeit with the packing performed
>> +over a much shorter window.
>> +
>> +**Byte Order**
>> +
>> +.. flat-table:: RGB formats
>> +    :header-rows:  2
>> +    :stub-columns: 0
>> +    :widths: 36 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
>> 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
>> +    :fill-cells:
>> +
>> +    * - :rspan:`1` Pixel Format Code
>> +      - :cspan:`63` Data organization
>> +    * - 63
>> +      - 62
>> +      - 61
>> +      - 60
>> +      - 59
>> +      - 58
>> +      - 57
>> +      - 56
>> +      - 55
>> +      - 54
>> +      - 53
>> +      - 52
>> +      - 51
>> +      - 50
>> +      - 49
>> +      - 48
>> +      - 47
>> +      - 46
>> +      - 45
>> +      - 44
>> +      - 43
>> +      - 42
>> +      - 41
>> +      - 40
>> +      - 39
>> +      - 38
>> +      - 37
>> +      - 36
>> +      - 35
>> +      - 34
>> +      - 33
>> +      - 32
>> +      - 31
>> +      - 30
>> +      - 29
>> +      - 28
>> +      - 27
>> +      - 26
>> +      - 25
>> +      - 24
>> +      - 23
>> +      - 22
>> +      - 21
>> +      - 20
>> +      - 19
>> +      - 18
>> +      - 17
>> +      - 16
>> +      - 15
>> +      - 14
>> +      - 13
>> +      - 12
>> +      - 11
>> +      - 10
>> +      - 9
>> +      - 8
>> +      - 7
>> +      - 6
>> +      - 5
>> +      - 4
>> +      - 3
>> +      - 2
>> +      - 1
>> +      - 0
>> +    * - V4L2_PIX_FMT_CRU_SBGGR10
>> +      - 0
>> +      - 0
>> +      - 0
>> +      - 0
>> +      - :cspan:`9` P5
>> +      - :cspan:`9` P4
>> +      - :cspan:`9` P3
>> +      - :cspan:`9` P2
>> +      - :cspan:`9` P1
>> +      - :cspan:`9` P0
>> +    * - V4L2_PIX_FMT_CRU_SBGGR12
>> +      - 0
>> +      - 0
>> +      - 0
>> +      - 0
>> +      - :cspan:`11` P4
>> +      - :cspan:`11` P3
>> +      - :cspan:`11` P2
>> +      - :cspan:`11` P1
>> +      - :cspan:`11` P0
>> +    * - V4L2_PIX_FMT_CRU_SBGGR14
>> +      - 0
>> +      - 0
>> +      - 0
>> +      - 0
>> +      - 0
>> +      - 0
>> +      - 0
>> +      - 0
>> +      - :cspan:`13` P3
>> +      - :cspan:`13` P2
>> +      - :cspan:`13` P1
>> +      - :cspan:`13` P0
>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-
>> core/v4l2-common.c
>> index 0a2f4f0d0a07..ca78d26071c7 100644
>> --- a/drivers/media/v4l2-core/v4l2-common.c
>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>> @@ -329,10 +329,22 @@ const struct v4l2_format_info *v4l2_format_info(u32
>> format)
>>   		{ .format = V4L2_PIX_FMT_SGBRG10DPCM8,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0,
>> 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_SGRBG10DPCM8,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0,
>> 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_SRGGB10DPCM8,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0,
>> 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>> +		{ .format = V4L2_PIX_FMT_CRU_SBGGR10,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0,
>> 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>> +		{ .format = V4L2_PIX_FMT_CRU_SGBRG10,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0,
>> 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>> +		{ .format = V4L2_PIX_FMT_CRU_SGRBG10,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0,
>> 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>> +		{ .format = V4L2_PIX_FMT_CRU_SRGGB10,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0,
>> 0 }, .bpp_div = { 6, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_SBGGR12,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0,
>> 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_SGBRG12,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0,
>> 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_SGRBG12,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0,
>> 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_SRGGB12,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0,
>> 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>> +		{ .format = V4L2_PIX_FMT_CRU_SBGGR12,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0,
>> 0 }, .bpp_div = { 5, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>> +		{ .format = V4L2_PIX_FMT_CRU_SGBRG12,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0,
>> 0 }, .bpp_div = { 5, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>> +		{ .format = V4L2_PIX_FMT_CRU_SGRBG12,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0,
>> 0 }, .bpp_div = { 5, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>> +		{ .format = V4L2_PIX_FMT_CRU_SRGGB12,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0,
>> 0 }, .bpp_div = { 5, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>> +		{ .format = V4L2_PIX_FMT_CRU_SBGGR14,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0,
>> 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>> +		{ .format = V4L2_PIX_FMT_CRU_SGBRG14,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0,
>> 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>> +		{ .format = V4L2_PIX_FMT_CRU_SGRBG14,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0,
>> 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>> +		{ .format = V4L2_PIX_FMT_CRU_SRGGB14,	.pixel_enc =
>> V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 8, 0, 0,
>> 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>>   	};
>>   	unsigned int i;
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-
>> core/v4l2-ioctl.c
>> index e14db67be97c..9db0ec4a5d77 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1408,6 +1408,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc
>> *fmt)
>>   	case V4L2_PIX_FMT_SGBRG10DPCM8:	descr = "8-bit Bayer GBGB/RGRG
>> (DPCM)"; break;
>>   	case V4L2_PIX_FMT_SGRBG10DPCM8:	descr = "8-bit Bayer GRGR/BGBG
>> (DPCM)"; break;
>>   	case V4L2_PIX_FMT_SRGGB10DPCM8:	descr = "8-bit Bayer RGRG/GBGB
>> (DPCM)"; break;
>> +	case V4L2_PIX_FMT_CRU_SBGGR10:	descr = "10-bit Bayer BGGR CRU
>> Packed"; break;
>> +	case V4L2_PIX_FMT_CRU_SGBRG10:	descr = "10-bit Bayer GBRG CRU
>> Packed"; break;
>> +	case V4L2_PIX_FMT_CRU_SGRBG10:	descr = "10-bit Bayer GRBG CRU
>> Packed"; break;
>> +	case V4L2_PIX_FMT_CRU_SRGGB10:	descr = "10-bit Bayer RGGB CRU
>> Packed"; break;
>>   	case V4L2_PIX_FMT_SBGGR12:	descr = "12-bit Bayer BGBG/GRGR";
>> break;
>>   	case V4L2_PIX_FMT_SGBRG12:	descr = "12-bit Bayer GBGB/RGRG";
>> break;
>>   	case V4L2_PIX_FMT_SGRBG12:	descr = "12-bit Bayer GRGR/BGBG";
>> break;
>> @@ -1416,6 +1420,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc
>> *fmt)
>>   	case V4L2_PIX_FMT_SGBRG12P:	descr = "12-bit Bayer GBGB/RGRG
>> Packed"; break;
>>   	case V4L2_PIX_FMT_SGRBG12P:	descr = "12-bit Bayer GRGR/BGBG
>> Packed"; break;
>>   	case V4L2_PIX_FMT_SRGGB12P:	descr = "12-bit Bayer RGRG/GBGB
>> Packed"; break;
>> +	case V4L2_PIX_FMT_CRU_SBGGR12:	descr = "12-bit Bayer BGGR CRU
>> Packed"; break;
>> +	case V4L2_PIX_FMT_CRU_SGBRG12:	descr = "12-bit Bayer GBRG CRU
>> Packed"; break;
>> +	case V4L2_PIX_FMT_CRU_SGRBG12:	descr = "12-bit Bayer GRBG CRU
>> Packed"; break;
>> +	case V4L2_PIX_FMT_CRU_SRGGB12:	descr = "12-bit Bayer RGGB CRU
>> Packed"; break;
>>   	case V4L2_PIX_FMT_SBGGR14:	descr = "14-bit Bayer BGBG/GRGR";
>> break;
>>   	case V4L2_PIX_FMT_SGBRG14:	descr = "14-bit Bayer GBGB/RGRG";
>> break;
>>   	case V4L2_PIX_FMT_SGRBG14:	descr = "14-bit Bayer GRGR/BGBG";
>> break;
>> @@ -1424,6 +1432,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc
>> *fmt)
>>   	case V4L2_PIX_FMT_SGBRG14P:	descr = "14-bit Bayer GBGB/RGRG
>> Packed"; break;
>>   	case V4L2_PIX_FMT_SGRBG14P:	descr = "14-bit Bayer GRGR/BGBG
>> Packed"; break;
>>   	case V4L2_PIX_FMT_SRGGB14P:	descr = "14-bit Bayer RGRG/GBGB
>> Packed"; break;
>> +	case V4L2_PIX_FMT_CRU_SBGGR14:	descr = "14-bit Bayer BGGR CRU
>> Packed"; break;
>> +	case V4L2_PIX_FMT_CRU_SGBRG14:	descr = "14-bit Bayer GBRG CRU
>> Packed"; break;
>> +	case V4L2_PIX_FMT_CRU_SGRBG14:	descr = "14-bit Bayer GRBG CRU
>> Packed"; break;
>> +	case V4L2_PIX_FMT_CRU_SRGGB14:	descr = "14-bit Bayer RGGB CRU
>> Packed"; break;
>>   	case V4L2_PIX_FMT_SBGGR16:	descr = "16-bit Bayer BGBG/GRGR";
>> break;
>>   	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG";
>> break;
>>   	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG";
>> break;
>> diff --git a/include/uapi/linux/videodev2.h
>> b/include/uapi/linux/videodev2.h index 725e86c4bbbd..8f0e3d8215ab 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -828,6 +828,22 @@ struct v4l2_pix_format {
>>   #define V4L2_PIX_FMT_PISP_COMP2_BGGR	v4l2_fourcc('P', 'C', '2', 'B')
>> /* PiSP 8-bit mode 2 compressed BGGR bayer */
>>   #define V4L2_PIX_FMT_PISP_COMP2_MONO	v4l2_fourcc('P', 'C', '2', 'M')
>> /* PiSP 8-bit mode 2 compressed monochrome */
>>
>> +/* Renesas RZ/V2H CRU packed formats. 64-bit units with contiguous pixels
>> */
>> +#define V4L2_PIX_FMT_CRU_SBGGR10	v4l2_fourcc('C', '1', '0', 'B')
>> +#define V4L2_PIX_FMT_CRU_SGBRG10	v4l2_fourcc('C', '1', '0', 'G')
>> +#define V4L2_PIX_FMT_CRU_SGRBG10	v4l2_fourcc('C', '1', '0', 'g')
>> +#define V4L2_PIX_FMT_CRU_SRGGB10	v4l2_fourcc('C', '1', '0', 'R')
>> +
>> +#define V4L2_PIX_FMT_CRU_SBGGR12	v4l2_fourcc('C', '1', '2', 'B')
>> +#define V4L2_PIX_FMT_CRU_SGBRG12	v4l2_fourcc('C', '1', '2', 'G')
>> +#define V4L2_PIX_FMT_CRU_SGRBG12	v4l2_fourcc('C', '1', '2', 'g')
>> +#define V4L2_PIX_FMT_CRU_SRGGB12	v4l2_fourcc('C', '1', '2', 'R')
>> +
>> +#define V4L2_PIX_FMT_CRU_SBGGR14	v4l2_fourcc('C', '1', '4', 'B')
>> +#define V4L2_PIX_FMT_CRU_SGBRG14	v4l2_fourcc('C', '1', '4', 'G')
>> +#define V4L2_PIX_FMT_CRU_SGRBG14	v4l2_fourcc('C', '1', '4', 'g')
>> +#define V4L2_PIX_FMT_CRU_SRGGB14	v4l2_fourcc('C', '1', '4', 'R')
>> +
>>   /* SDR formats - used only for Software Defined Radio devices */
>>   #define V4L2_SDR_FMT_CU8          v4l2_fourcc('C', 'U', '0', '8') /* IQ
>> u8 */
>>   #define V4L2_SDR_FMT_CU16LE       v4l2_fourcc('C', 'U', '1', '6') /* IQ
>> u16le */
>> --
>> 2.34.1
> Cheers,
> Prabhakar

