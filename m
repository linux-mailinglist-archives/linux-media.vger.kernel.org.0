Return-Path: <linux-media+bounces-58935-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF12ElwO4WnoogAAu9opvQ
	(envelope-from <linux-media+bounces-58935-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 18:29:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0241411B4C
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 18:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33C2B305D4F7
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C0C3A0B3D;
	Thu, 16 Apr 2026 16:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I1T62by5"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCF93845A3;
	Thu, 16 Apr 2026 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776356949; cv=none; b=sNH2+NErJXnRinGQh4XG5HGkN9PLfFA4KGwZCEQGdhjgxyQEsiNe7Jfa++liCpwAToZt8iY5YsyZ2LQRB1ReO9T/eFEP5GYBBp6F6aokDG520hT/NhZK/t931gnBq75HspFknSMiZM0T8Yvhi3GcbU8lQ4dSUyejJiFX6eNzcWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776356949; c=relaxed/simple;
	bh=cI7oghsBOVa2cK0VJA7EsEiORXn0z8aYMgV++TNAhws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WWISjlKe8AsHmoSvVh0dWhxnqlsRLHspEJNj2PwPiqOuMr0HxJaVfKrymY50Dw9o1SPMhBvSn6maQYf+7I3S8XjLhZ8f19/ri62A/+M9dqHaNqrAm9yq7w6r02N0geJbSRCZRZuSqt835luOOyCI/2XaEs4X+TVrWvv/OmraeV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I1T62by5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776356946;
	bh=cI7oghsBOVa2cK0VJA7EsEiORXn0z8aYMgV++TNAhws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I1T62by5DWIs0l1zheG4QygeZhtPiGccAPTHLP8utuBKsKPOvxcHxkmnfF5Ep8mY6
	 am897OJ4rjkRIQ41369dzcXWW3tRSJY6EaKHW6iZmiI3XeQaoZsx7UTCTcwJdqAvzy
	 VbsF5SNZMgkSNoMNa4fbSvuFZdFS1pD47OYO/waXWBuTSY46cnei6qPzauZYmBc1fx
	 I4M5cMTpv5KFj+tpYzRazYRnpSBY8fbzCskn6p+nYM3i1Euc+6ZtMFjVAffC6ZO1y9
	 z60eS2mHz6QqTysMvRQ34GInOx/78ZijdbW81+5i21q625FOsLQs4U6kXGxn/u1Hbu
	 RI103OtFHyPOw==
Received: from [100.64.1.43] (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE94D17E10A4;
	Thu, 16 Apr 2026 18:29:05 +0200 (CEST)
Message-ID: <a108f9f2-e274-4d81-8101-900fa629b4fb@collabora.com>
Date: Thu, 16 Apr 2026 18:29:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] media: Add AFBC pixel formats
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 corbet@lwn.net, hverkuil+cisco@kernel.org,
 laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20260416124143.128412-1-benjamin.gaignard@collabora.com>
 <0407249c6dcceec5419af3870c7bb4defb230e5a.camel@ndufresne.ca>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <0407249c6dcceec5419af3870c7bb4defb230e5a.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58935-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,siliconimaging.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B0241411B4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Le 16/04/2026 à 17:23, Nicolas Dufresne a écrit :
> Le jeudi 16 avril 2026 à 14:41 +0200, Benjamin Gaignard a écrit :
>> Add 8-bit and 10-bit YUV420 Arm Frame Buffer Compression (AFBC)
>> pixel formats.
>>
>> AFBC stride and image size computation needed to be done by
>> specific helpers functions which are also exported to be used
>> by drivers.
>>
>> Add documentation for each of the formats.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>>   .../userspace-api/media/v4l/pixfmt-afbc.rst   |  64 +++++++++++
>>   .../userspace-api/media/v4l/pixfmt.rst        |   1 +
>>   drivers/media/v4l2-core/v4l2-common.c         | 104 ++++++++++++++++++
>>   drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +
>>   include/media/v4l2-common.h                   |   4 +
>>   include/uapi/linux/videodev2.h                |   6 +
>>   6 files changed, 183 insertions(+)
>>   create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-afbc.rst
>>
>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-afbc.rst b/Documentation/userspace-api/media/v4l/pixfmt-afbc.rst
>> new file mode 100644
>> index 000000000000..2867e5d45810
>> --- /dev/null
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-afbc.rst
>> @@ -0,0 +1,64 @@
>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
>> +
>> +.. afbc:
>> +
>> +*******************************************
>> +ARM Frame Buffer Compression formats (AFBC)
>> +*******************************************
>> +
>> +The AFBC format is a lossless compression format which can support
>> +up to four components. It could compress 8 bits to 64 bits per pixel.
>> +The internal superblock size could be:
>> +
>> +- 16x16 pixels
>> +
>> +- 32x8 pixels
>> +
>> +- 64x4 pixels.
>> +
>> +The memory layout is composed of a header block followed by payload data.
> Because these format are so tied with the Graphics, I would avoid past mistakes
> with QC formats, and up-front document their matching DRM format and modifiers.

sure, I can add a column with the matching DRM format + modifier

>
> While its documented in ./Documentation/userspace-api/dma-buf-alloc-exchange.rst
> I would still document a bit the way we calculate a stride for this formats, or
> cross-reference that documentation, but being explicit for this specific format
> may avoid a lot of issues.

I don't see that in dma-buf-alloc-exchange.rst if you a place where it is
documented I can add a link to it.

>> +AFBC Formats
>> +============
>> +
>> +.. tabularcolumns:: |p{5.2cm}|p{1.0cm}|p{1.5cm}|p{1.9cm}|p{1.2cm}|p{1.8cm}|
>> +
>> +.. flat-table:: Overview of AFBC formats
>> +    :header-rows:  1
>> +    :stub-columns: 0
>> +
>> +    * - Identifier
>> +      - Code
>> +      - Colorspace
>> +      - Bits per component
>> +      - Superblock size
>> +      - Compression parameters
>> +    * - V4L2_PIX_FMT_AFBC_YUV420_16x16
>> +      - 'A168'
>> +      - YUV420
>> +      - 8 bits
>> +      - 16x16
>> +      - Sparse, Split
>  From my accumulate knowledge, RK35xx RKVDEC produce non-split, and this one is
> split. To make it easy for naming in the future, I'd rename this one.
>
> 	V4L2_PIX_FMT_AFBC_YUV420_16x16_SPLIT
>
> Or
>
> 	V4L2_PIX_FMT_AFBC_YUV420_16x16_S
> 	V4L2_PIX_FMT_AFBC_YUV420_16x16S
>
> Other ideas, but it would be really hard to come up with a name for "not slip".
> While non-sparse is very special, and not commonly used.

Let's go for SPLIT it is more readable.

>
>> +    * - V4L2_PIX_FMT_AFBC_YUV420_32x8
>> +      - 'A328'
>> +      - YUV420
>> +      - 8 bits
>> +      - 32x8
>> +      - Sparse
>> +    * - V4L2_PIX_FMT_AFBC_YUV420_16x16_10
>> +      - 'A16a'
>> +      - YUV420
>> +      - 10 bits
>> +      - 16x16
>> +      - Sparse, Split
>> +    * - V4L2_PIX_FMT_AFBC_YUV420_32x8_10
>> +      - 'A32a'
>> +      - YUV420
>> +      - 10 bits
>> +      - 32x8
>> +      - Sparse
>> +
>> +.. _V4L2-PIX-FMT-AFBC-YUV420-16x16:
>> +.. _V4L2-PIX-FMT-AFBC-YUV420-32x8:
>> +.. _V4L2-PIX-FMT-AFBC-YUV420-16x16-10:
>> +.. _V4L2-PIX-FMT-AFBC-YUV420-32x8-10:
>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Documentation/userspace-api/media/v4l/pixfmt.rst
>> index 71b29267488f..c6728b91b74f 100644
>> --- a/Documentation/userspace-api/media/v4l/pixfmt.rst
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
>> @@ -26,6 +26,7 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
>>       pixfmt-indexed
>>       pixfmt-rgb
>>       pixfmt-bayer
>> +    pixfmt-afbc
>>       yuv-formats
>>       hsv-formats
>>       depth-formats
>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>> index 554c591e1113..9187cb18a4ef 100644
>> --- a/drivers/media/v4l2-core/v4l2-common.c
>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>> @@ -332,6 +332,16 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>>   		{ .format = V4L2_PIX_FMT_NV12MT_16X16,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2,
>>   		  .block_w = { 16,  8, 0, 0 },	.block_h = { 16,  8, 0, 0 }},
>>   
>> +		/* AFBC formats */
>> +		{ .format = V4L2_PIX_FMT_AFBC_YUV420_16x16, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1,
>> +		  .block_w = { 16, 0, 0, 0 },	.block_h = { 16, 0, 0, 0 }},
>> +		{ .format = V4L2_PIX_FMT_AFBC_YUV420_32x8, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 4, 1, 1, 1 }, .hdiv = 1, .vdiv = 1,
>> +		  .block_w = { 32, 0, 0, 0 },	.block_h = { 8, 0, 0, 0 }},
>> +		{ .format = V4L2_PIX_FMT_AFBC_YUV420_16x16_10, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 15, 0, 0, 0 }, .bpp_div = { 8, 1, 1, 1 }, .hdiv = 1, .vdiv = 1,
>> +		   .block_w = { 16, 0, 0, 0 },	.block_h = { 16, 0, 0, 0 }},
>> +		{ .format = V4L2_PIX_FMT_AFBC_YUV420_32x8_10, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 15, 0, 0, 0 }, .bpp_div = { 8, 1, 1, 1 }, .hdiv = 1, .vdiv = 1,
>> +		   .block_w = { 32, 0, 0, 0 },	.block_h = { 8, 0, 0, 0 }},
>> +
>>   		/* Bayer RGB formats */
>>   		{ .format = V4L2_PIX_FMT_SBGGR8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_SGBRG8,	.pixel_enc = V4L2_PIXEL_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
>> @@ -448,6 +458,97 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_apply_frmsize_constraints);
>>   
>> +size_t v4l2_pixfmt_afbc_header_size(int fourcc, int width, int height)
>> +{
>> +	int width_in_block, height_in_block;
>> +
>> +	if (!v4l2_is_format_afbc(fourcc))
>> +		return 0;
>> +
>> +	switch (fourcc) {
>> +	case V4L2_PIX_FMT_AFBC_YUV420_16x16:
>> +	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10:
>> +		width_in_block = ALIGN(width, 16) >> 4;
>> +		height_in_block = ALIGN(height, 16) >> 4;
>> +		break;
>> +	case V4L2_PIX_FMT_AFBC_YUV420_32x8:
>> +	case V4L2_PIX_FMT_AFBC_YUV420_32x8_10:
>> +		width_in_block = ALIGN(width, 32) >> 5;
>> +		height_in_block = ALIGN(height, 8) >> 3;
>> +		break;
>> +	}
>> +
>> +	return ALIGN(width_in_block * 16 * height_in_block, 128);
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_pixfmt_afbc_header_size);
>> +
>> +size_t v4l2_pixfmt_afbc_payload_size(int fourcc, int width, int height)
>> +{
>> +	int width_in_block, height_in_block, block_payload_size;
>> +
>> +	if (!v4l2_is_format_afbc(fourcc))
>> +		return 0;
>> +
>> +	switch (fourcc) {
>> +	case V4L2_PIX_FMT_AFBC_YUV420_16x16:
>> +	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10:
>> +		width_in_block = ALIGN(width, 16) >> 4;
>> +		height_in_block = ALIGN(height, 16) >> 4;
>> +		break;
>> +	case V4L2_PIX_FMT_AFBC_YUV420_32x8:
>> +	case V4L2_PIX_FMT_AFBC_YUV420_32x8_10:
>> +		width_in_block = ALIGN(width, 32) >> 5;
>> +		height_in_block = ALIGN(height, 8) >> 3;
>> +		break;
>> +	}
>> +
>> +	switch (fourcc) {
>> +	case V4L2_PIX_FMT_AFBC_YUV420_16x16:
>> +	case V4L2_PIX_FMT_AFBC_YUV420_32x8:
>> +		block_payload_size = 384;
>> +		break;
>> +	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10:
>> +	case V4L2_PIX_FMT_AFBC_YUV420_32x8_10:
>> +		block_payload_size = 512;
>> +		break;
>> +	}
>> +
>> +	return ALIGN(block_payload_size * width_in_block * height_in_block, 128);
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_pixfmt_afbc_payload_size);
>> +
>> +static int v4l2_fill_pixfmt_afbc(struct v4l2_pix_format_mplane *pixfmt,
>> +				 const struct v4l2_format_info *info)
>> +{
>> +	struct v4l2_plane_pix_format *plane = &pixfmt->plane_fmt[0];
>> +	unsigned int width = pixfmt->width;
>> +	unsigned int height = pixfmt->height;
>> +	unsigned int aligned_width = ALIGN(width, v4l2_format_block_width(info, 0));
>> +	unsigned int stride = DIV_ROUND_UP(aligned_width, info->hdiv) *
>> +			      info->bpp[0] / info->bpp_div[0];
>> +	size_t header_size = v4l2_pixfmt_afbc_header_size(info->format, width, height);
>> +	size_t payload_size = v4l2_pixfmt_afbc_payload_size(info->format, width, height);
>> +
>> +	plane->bytesperline = stride;
>> +	plane->sizeimage = header_size + payload_size;
> I want to give some more thought on this, its literally by-pass
> v4l2_apply_frmsize_constraints(), and that I don't like much.
>
>> +
>> +	return 0;
>> +}
>> +
>> +bool v4l2_is_format_afbc(int fourcc)
>> +{
>> +	switch (fourcc) {
>> +	case V4L2_PIX_FMT_AFBC_YUV420_16x16:
>> +	case V4L2_PIX_FMT_AFBC_YUV420_32x8:
>> +	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10:
>> +	case V4L2_PIX_FMT_AFBC_YUV420_32x8_10:
>> +		return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +EXPORT_SYMBOL_GPL(v4l2_is_format_afbc);
> Does that really need to be exported ?

Yes it is useful to not duplicate it in all drivers.

>
>> +
>>   int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
>>   			u32 pixelformat, u32 width, u32 height)
>>   {
>> @@ -464,6 +565,9 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
>>   	pixfmt->pixelformat = pixelformat;
>>   	pixfmt->num_planes = info->mem_planes;
>>   
>> +	if (v4l2_is_format_afbc(info->format))
>> +		return v4l2_fill_pixfmt_afbc(pixfmt, info);
>> +
>>   	if (info->mem_planes == 1) {
>>   		plane = &pixfmt->plane_fmt[0];
>>   		plane->bytesperline = v4l2_format_plane_stride(info, 0, width);
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index a2b650f4ec3c..016d4244c9ee 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -1387,6 +1387,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>   	case V4L2_PIX_FMT_YVU422M:	descr = "Planar YVU 4:2:2 (N-C)"; break;
>>   	case V4L2_PIX_FMT_YUV444M:	descr = "Planar YUV 4:4:4 (N-C)"; break;
>>   	case V4L2_PIX_FMT_YVU444M:	descr = "Planar YVU 4:4:4 (N-C)"; break;
>> +	case V4L2_PIX_FMT_AFBC_YUV420_16x16: descr = "AFBC 8-bit YUV420 16x16"; break;
> Missing "split" in the descr, which will cause confusion in the future.

Ok, just keep in mind that description field is limited to 32 bytes.

Benjamin

>
> Nicolas
>
>> +	case V4L2_PIX_FMT_AFBC_YUV420_32x8: descr = "AFBC 8-bit YUV420 32x8"; break;
>> +	case V4L2_PIX_FMT_AFBC_YUV420_16x16_10: descr = "AFBC 10-bit YUV420 16x16"; break;
>> +	case V4L2_PIX_FMT_AFBC_YUV420_32x8_10: descr = "AFBC 10-bit YUV420 32x8"; break;
>>   	case V4L2_PIX_FMT_SBGGR8:	descr = "8-bit Bayer BGBG/GRGR"; break;
>>   	case V4L2_PIX_FMT_SGBRG8:	descr = "8-bit Bayer GBGB/RGRG"; break;
>>   	case V4L2_PIX_FMT_SGRBG8:	descr = "8-bit Bayer GRGR/BGBG"; break;
>> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
>> index f8b1faced79c..d1a75e6a7d4c 100644
>> --- a/include/media/v4l2-common.h
>> +++ b/include/media/v4l2-common.h
>> @@ -549,6 +549,10 @@ static inline bool v4l2_is_format_bayer(const struct v4l2_format_info *f)
>>   	return f && f->pixel_enc == V4L2_PIXEL_ENC_BAYER;
>>   }
>>   
>> +bool v4l2_is_format_afbc(int fourcc);
>> +size_t v4l2_pixfmt_afbc_header_size(int fourcc, int width, int height);
>> +size_t v4l2_pixfmt_afbc_payload_size(int fourcc, int width, int height);
>> +
>>   const struct v4l2_format_info *v4l2_format_info(u32 format);
>>   void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
>>   				    const struct v4l2_frmsize_stepwise *frmsize);
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index eda4492e40dc..88fafadbe13c 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -698,6 +698,12 @@ struct v4l2_pix_format {
>>   #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
>>   #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
>>   
>> +/* AFBC formats */
>> +#define V4L2_PIX_FMT_AFBC_YUV420_16x16    v4l2_fourcc('A', '1', '6', '8') /* AFBC containing 8-bit YUV420 in 16x16 blocks, sparse, split */
>> +#define V4L2_PIX_FMT_AFBC_YUV420_32x8     v4l2_fourcc('A', '3', '2', '8') /* AFBC containing 8-bit YUV420 in 32x8 blocks, sparse */
>> +#define V4L2_PIX_FMT_AFBC_YUV420_16x16_10 v4l2_fourcc('A', '1', '6', 'a') /* AFBC containing 10-bit YUV420 in 16x16 blocks, sparse, split */
>> +#define V4L2_PIX_FMT_AFBC_YUV420_32x8_10  v4l2_fourcc('A', '3', '2', 'a') /* AFBC containing 10-bit YUV420 in 32x8 blocks, sparse */
>> +
>>   /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
>>   #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
>>   #define V4L2_PIX_FMT_SGBRG8  v4l2_fourcc('G', 'B', 'R', 'G') /*  8  GBGB.. RGRG.. */

