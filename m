Return-Path: <linux-media+bounces-29297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E371A79DDC
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 10:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C8711891571
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 08:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D15A2417E6;
	Thu,  3 Apr 2025 08:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k+D95KDv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEEC241691;
	Thu,  3 Apr 2025 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743668332; cv=none; b=nDZcHnAVs13OTJsIM/QGvAUYfAvM7yPAC6FXDONHuapUpiRnBoUvd+nosltQVhWSYiBpj3phlZ+j8yijV+Yoq+p2YGbNcQ8NbaDPxx9lxBVlkG+tMevriT7ORkSL7yM0HKaKpbcImRZ8e5vPApSeaaCN+S3dLslZGFOfYHFSaJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743668332; c=relaxed/simple;
	bh=s6j21HcEMBF6v4lEmeuyhKZT66Img10/Z2kkgWSa1t4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PBEE5jQE8JVanco7HDgyKonD1mi1NFoK+ggh3mrtdQcaO0ThkkGYFlaGZQ53t1uP1S0v3zRBa/8sG8g7VpsgjOrDkCtyZtLL2HYHE0Y8hMmULkrzLa2x8cFZwg1CbNxXSdXPqFsAmOaYkRYBg5AFY43eBrCb2Gpv6Ows29KUA58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k+D95KDv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D80A0105D;
	Thu,  3 Apr 2025 10:16:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743668216;
	bh=s6j21HcEMBF6v4lEmeuyhKZT66Img10/Z2kkgWSa1t4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k+D95KDvLSkKCZA4UaXYyl7nmOv5qByQQ/KO7BL0dMLZaREJg0h04VIXpJKRDgZ88
	 HeBaVBzNzRB1hmDJN7xmIz8i39Ur++kXZNkgygcnfHR1r+Sgmehq15P5aXREBbFp1U
	 lF6TXKNLCT7AEmfM8QGrxkuoWNoW2PT2dmb7pAcM=
Message-ID: <c037c38d-1056-4ced-b411-c3b8f04162f2@ideasonboard.com>
Date: Thu, 3 Apr 2025 11:18:46 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: rcar-vin: Fix RAW10
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20250324-rcar-fix-raw-v1-0-ae56c1c7a2f6@ideasonboard.com>
 <20250324-rcar-fix-raw-v1-3-ae56c1c7a2f6@ideasonboard.com>
 <20250331211122.GA1240431@ragnatech.se>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250331211122.GA1240431@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 01/04/2025 00:11, Niklas Söderlund wrote:
> Hi Tomi,
> 
> Thanks for your work.
> 
> On 2025-03-24 13:48:54 +0200, Tomi Valkeinen wrote:
>> Fix the following to get RAW10 formats working:
>>
>> In rvin_formats, the bpp is set to 4 for RAW10. As VIN unpacks RAW10 to
>> 16-bit containers, the bpp should be 2.
>>
>> Don't set VNDMR_YC_THR to the VNDMR register. The YC_THR is "YC Data
>> Through Mode", used for YUV formats and should not be set for RAW10.
>>
>> Fix the check related to the RGB666 format and CSI-2 mode. The
>> VNMC_INF_RGB666 define is the same as used for RAW10 on Gen4, and RAW10
>> is allowed on CSI-2 (whereas RGB666 is not allowed on Gen3 on CSI-2).
>> This feels a bit hacky, though, and the formats should really have been
>> verified already earlier.
> 
> I agree, it feels hacky. I would rather just remove the while switch
> then try to "fix" it by extending it more. When testing this series I
> needed a similar fix for VNMC_INF_RAW8 check below to get it to work on
> Gen4.

Also, I think it's fine to be a bit hacky to have a small fix for a 
feature already in upstream, instead of doing a bigger restructuring to 
fix it.

All this should be cleaned up, but in my opinion it's better to do that 
on top of a working upstream.

  Tomi

>>
>> Fixes: 1b7e7240eaf3 ("media: rcar-vin: Add support for RAW10")
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/media/platform/renesas/rcar-vin/rcar-dma.c  | 9 +++++++--
>>   drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c | 8 ++++----
>>   2 files changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
>> index 53046614f7a1..f8394be8a922 100644
>> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
>> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
>> @@ -811,12 +811,17 @@ static int rvin_setup(struct rvin_dev *vin)
>>   		case VNMC_INF_YUV8_BT656:
>>   		case VNMC_INF_YUV10_BT656:
>>   		case VNMC_INF_YUV16:
>> -		case VNMC_INF_RGB666:
>>   			if (vin->is_csi) {
>>   				vin_err(vin, "Invalid setting in MIPI CSI2\n");
>>   				return -EINVAL;
>>   			}
>>   			break;
>> +		case VNMC_INF_RGB666:
>> +			if (vin->info->model == RCAR_GEN3 && vin->is_csi) {
>> +				vin_err(vin, "Invalid setting in MIPI CSI2\n");
>> +				return -EINVAL;
>> +			}
>> +			break;
>>   		case VNMC_INF_RAW8:
>>   			if (!vin->is_csi) {
>>   				vin_err(vin, "Invalid setting in Digital Pins\n");
>> @@ -913,7 +918,7 @@ static int rvin_setup(struct rvin_dev *vin)
>>   	case V4L2_PIX_FMT_SGBRG10:
>>   	case V4L2_PIX_FMT_SGRBG10:
>>   	case V4L2_PIX_FMT_SRGGB10:
>> -		dmr = VNDMR_RMODE_RAW10 | VNDMR_YC_THR;
>> +		dmr = VNDMR_RMODE_RAW10;
>>   		break;
>>   	default:
>>   		vin_err(vin, "Invalid pixelformat (0x%x)\n",
>> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
>> index 756fdfdbce61..65da8d513b52 100644
>> --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
>> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
>> @@ -88,19 +88,19 @@ static const struct rvin_video_format rvin_formats[] = {
>>   	},
>>   	{
>>   		.fourcc			= V4L2_PIX_FMT_SBGGR10,
>> -		.bpp			= 4,
>> +		.bpp			= 2,
>>   	},
>>   	{
>>   		.fourcc			= V4L2_PIX_FMT_SGBRG10,
>> -		.bpp			= 4,
>> +		.bpp			= 2,
>>   	},
>>   	{
>>   		.fourcc			= V4L2_PIX_FMT_SGRBG10,
>> -		.bpp			= 4,
>> +		.bpp			= 2,
>>   	},
>>   	{
>>   		.fourcc			= V4L2_PIX_FMT_SRGGB10,
>> -		.bpp			= 4,
>> +		.bpp			= 2,
>>   	},
>>   };
>>   
>>
>> -- 
>> 2.43.0
>>
> 


