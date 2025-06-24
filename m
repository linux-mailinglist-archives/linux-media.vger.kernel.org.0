Return-Path: <linux-media+bounces-35776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DBBAE653E
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 14:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCF284A7BC6
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0E7290D85;
	Tue, 24 Jun 2025 12:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VAwVcBmf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4B826A1BE
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 12:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768830; cv=none; b=uUKDLqk0BXamzrwHT34KUpxuAMGMv1iUfXuwdz5P92nWVYJ3EjW0DbF38GTwm11vqIecY2tMBYZsyCpeTxGsq4+F1RBotAV5BNuVB1hkUj3wK1akX1KixV8js8NiUn64PXo4XGmE2+lnGrGhzHoUn0+7mcgSktncleTVNF93xdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768830; c=relaxed/simple;
	bh=wtv37Ytrrp76Jr3LBWHx8SuKAq8NBSgXe808xCfL8ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NfyJ0sQAb9Ja4lI+KTBvlnOg7D4V8nkEgaY9WUKI74HgjH9Z27wrihIofN0lSXzoZlNFGr3Q3sYbZ10bzts38pX6lxnZ95p+vKO8/OyYyMbSMWzIpnkPar0HX4C57SMkAzYKcq61qZM9JtsCrGghmhmfIGhEZNEKYv+wUhUefP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VAwVcBmf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0692DC72;
	Tue, 24 Jun 2025 14:40:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750768809;
	bh=wtv37Ytrrp76Jr3LBWHx8SuKAq8NBSgXe808xCfL8ps=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VAwVcBmfEUomfdnIck2hNjrJfYT/PiSy50C2mdW8Vt700Ojmg13qbHkz/9Xr5E7Ka
	 vuHQls84i3tWJxTxJrEHX6KBr0dm1eurGyeouS9qS42KMhEHXD5iSJQ4GLJrtciQ0l
	 M+7hlC3duwSlrs4u/r/FjbbG5luH2vF9y/wDT64Y=
Message-ID: <4c5317a2-75cf-49d6-bb26-30bbaa7d9424@ideasonboard.com>
Date: Tue, 24 Jun 2025 13:40:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] media: v4l2: Add Renesas Camera Receiver Unit
 pixel formats
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, jacopo.mondi@ideasonboard.com,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com>
 <20250623-rzg2l-cru-v5-1-1663a8c6719a@ideasonboard.com>
 <aFp9D-Ii43yNTOSx@kekkonen.localdomain>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <aFp9D-Ii43yNTOSx@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari

On 24/06/2025 11:25, Sakari Ailus wrote:
> Hi Daniel,
>
> Thanks for the set.
>
> On Mon, Jun 23, 2025 at 03:43:18PM +0100, Daniel Scally wrote:
>> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>>
>> The Renesas Camera Receiver Unit in the RZ/V2H SoC can output RAW
>> data captured from an image sensor without conversion to an RGB/YUV
>> format. In that case the data are packed into 64-bit blocks, with a
>> variable amount of padding in the most significant bits depending on
>> the bitdepth of the data. Add new V4L2 pixel format codes for the new
>> formats, along with documentation to describe them.
>>
>> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>> ---
>> Changes in v5:
>>
>> 	- None
>>
>> Changes in v4:
>>
>> 	- Removed references to "Bayer" or "srgb"
>>
>> Changes in v3:
>>
>> 	- Switched from bayer-order specific formats to generic RAWnn
>>
>> Changes in v2:
>>
>> 	- Added labels to the new formats in the documentation file
>> 	- Added 20-bit formats
>> ---
>>   .../userspace-api/media/v4l/pixfmt-bayer.rst       |   1 +
>>   .../userspace-api/media/v4l/pixfmt-rawnn-cru.rst   | 143 +++++++++++++++++++++
>>   drivers/media/v4l2-core/v4l2-common.c              |   6 +
>>   drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
>>   include/uapi/linux/videodev2.h                     |   6 +
>>   5 files changed, 160 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
>> index ed3eb432967d9845d3d65150831d8a7f62dec994..20a8aa04330479ed4d44c8e4fc3d57db8c2e6933 100644
>> --- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
>> @@ -31,3 +31,4 @@ orders. See also `the Wikipedia article on Bayer filter
>>       pixfmt-srggb14
>>       pixfmt-srggb14p
>>       pixfmt-srggb16
>> +    pixfmt-rawnn-cru
>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..d786833d0cf355b3955fe63d85c8a211a7a4fb23
>> --- /dev/null
>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
>> @@ -0,0 +1,143 @@
>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
>> +
>> +.. _v4l2-pix-fmt-cru-raw10:
>> +.. _v4l2-pix-fmt-cru-raw12:
>> +.. _v4l2-pix-fmt-cru-raw14:
>> +.. _v4l2-pix-fmt-cru-raw20:
>> +
>> +**********************************************************************************************************************************
>> +V4L2_PIX_FMT_CRU_RAW10 ('CR10'), V4L2_PIX_FMT_CRU_RAW12 ('CR12'), V4L2_PIX_FMT_CRU_RAW14 ('CR14'), V4L2_PIX_FMT_CRU_RAW20 ('CR20')
>> +**********************************************************************************************************************************
> Regarding naming, could these be called V4L2_PIX_FMT_RAW_CRUxx, to align
> the naming with the new raw formats?
> <URL:https://www.retiisi.eu/~sailus/v4l2/tmp/common-raw/userspace-api/media/v4l/pixfmt-raw-generic.html>
>
> If you rebase on the metadata series, I can pick this patch in the set. My
> objective is to get this merged in this cycle, which of course also depends
> on review feedback.


Sounds good - I'm happy to rename them sure.


Thanks

Dan

>

