Return-Path: <linux-media+bounces-29296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C756A79DC9
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 10:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FF207A6642
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 08:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE171242906;
	Thu,  3 Apr 2025 08:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uSuzEmO7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84687241CBA;
	Thu,  3 Apr 2025 08:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743668111; cv=none; b=s/d7mpd6j9VX70FaZXjhxuqgnRGMVX6xTMofDErBTcQdV+IPH1uw1o87fv+ui101a/EXmookllNyyuevxfQ1apKTMZdzlOsJjgvUdyyr2vBMSbJdDJH8jDoWh39lktUJwHZvpYIQSqME86K5LZhwQ16ttsSlQpEnpFrQH4G7w1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743668111; c=relaxed/simple;
	bh=ICN54ZvU91J/SfI9DgZT4PwZfQ2vgRqWzhU29u8932M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxgHmJgfn7Hx2DZGb/GKOrkSEhhgHqWsQmq76DNBk4NdMq27a8JzPIcU2nH/9jsJ/1Q4LmOMmrBa8J/zZbfVCLNFxSjFm8I+FNgLmfBLH4arEWBX36/2uOd/0AshWdwITPgW337AnQ3J4ZNlhq4YrZfOPq4NnEbWiD3An09CdUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uSuzEmO7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2647F105D;
	Thu,  3 Apr 2025 10:13:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743667994;
	bh=ICN54ZvU91J/SfI9DgZT4PwZfQ2vgRqWzhU29u8932M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uSuzEmO7E/+sntwX5cwD2gORtgdy66VZcNtMOfX9LWE66vxOk4aAzVw5wGtvQg4Tv
	 EofNXBRVR/Xyx2vNv0bz4S3AWjQYvX1i4dFuS4u4LuGHlwU9EXJHc05Hc9Uy7xwmxv
	 aGnjj9qIKylkHDXXrup/JOPbEZRqayDVz2pITxQY=
Message-ID: <5ebccf6a-3860-4643-9f92-735163552b7e@ideasonboard.com>
Date: Thu, 3 Apr 2025 11:15:04 +0300
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

Why is that? What is VNMC_INF_RAW8 overlapping with?

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


