Return-Path: <linux-media+bounces-29303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD94AA79FC1
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 11:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52DF33AB371
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 09:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E2C242914;
	Thu,  3 Apr 2025 09:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YabtVy9F"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDA51E5B8B;
	Thu,  3 Apr 2025 09:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743671534; cv=none; b=fdvJ0EGoKSdLrL17jg7cvS903QorcgNzxixoVCDafVWP6Ye5K5cwV4iRsi5w7dDp1nUA4E37ory0tye+Ybnomo3WjmF3UQqKJFqu25zbxQG4l/L9MDFvi7JP5v7DXhVW2BgjlWqFUq9LvRNOCRaIjAYj8wOJVyWRksQNntxpfiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743671534; c=relaxed/simple;
	bh=qN5NuKW9bCITUNwlVwxSeZIuSUwLmASsSCtiWs2SMMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k9YhNNOSxlrVDYwRVoPD906Yf2BLB5xGq6628nvu186MvSndCoNw2N0PNDQdpGzbJC0Rw3RMkaheH8oQ48d92RifrV2fBJwb3Yq+SfLkgmXT998BHGYHmS0YofmND0O3vpWW2eSZLrJWh3bO0hoQkXivGNJgM7ctDUmojeqUf6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YabtVy9F; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53CA18FA;
	Thu,  3 Apr 2025 11:10:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743671416;
	bh=qN5NuKW9bCITUNwlVwxSeZIuSUwLmASsSCtiWs2SMMA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YabtVy9FlnjEB8aHB64uccNPUWVi6/SOh5caS23k3TI0Ynf9BWETg+Ix1R8jL8GCa
	 0wOqXzDfqk781S+Y1xqOqZQMttnLs17SdTYBnSpkffSxDsN5v3kEU+yqauizoFXTZW
	 f2LoeACo8Ad8R9uaJBatK0Xz5fY7iC0AFiROrKY0=
Message-ID: <e1a770cb-8767-4251-9d96-599240d0efa8@ideasonboard.com>
Date: Thu, 3 Apr 2025 12:12:06 +0300
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
 <5ebccf6a-3860-4643-9f92-735163552b7e@ideasonboard.com>
 <20250403085700.GU1240431@ragnatech.se>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250403085700.GU1240431@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 03/04/2025 11:57, Niklas Söderlund wrote:
> Hi Tomi,
> 
> On 2025-04-03 11:15:04 +0300, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 01/04/2025 00:11, Niklas Söderlund wrote:
>>> Hi Tomi,
>>>
>>> Thanks for your work.
>>>
>>> On 2025-03-24 13:48:54 +0200, Tomi Valkeinen wrote:
>>>> Fix the following to get RAW10 formats working:
>>>>
>>>> In rvin_formats, the bpp is set to 4 for RAW10. As VIN unpacks RAW10 to
>>>> 16-bit containers, the bpp should be 2.
>>>>
>>>> Don't set VNDMR_YC_THR to the VNDMR register. The YC_THR is "YC Data
>>>> Through Mode", used for YUV formats and should not be set for RAW10.
>>>>
>>>> Fix the check related to the RGB666 format and CSI-2 mode. The
>>>> VNMC_INF_RGB666 define is the same as used for RAW10 on Gen4, and RAW10
>>>> is allowed on CSI-2 (whereas RGB666 is not allowed on Gen3 on CSI-2).
>>>> This feels a bit hacky, though, and the formats should really have been
>>>> verified already earlier.
>>>
>>> I agree, it feels hacky. I would rather just remove the while switch
>>> then try to "fix" it by extending it more. When testing this series I
>>> needed a similar fix for VNMC_INF_RAW8 check below to get it to work on
>>> Gen4.
>>
>> Why is that? What is VNMC_INF_RAW8 overlapping with?
> 
> VNMC_INF_RAW8 is not overlapping the issue is the "if (!vin->is_csi)"
> check. On Gen3 RAW8 was supposedly only supported on the CSI-2 input,
> and not on the parallel bus available on some VIN instances.
> 
> On Gen4 the checks around vin->is_csi becomes skewed and as you point
> out should be cloned up. The effect at the moment however is that o Gen4
> when trying to capture RAW8 is_csi is not set (as this is a gen3 thing)
> and the "Invalid setting in Digital Pins" error path is hit.

Ok. I was wondering why it worked for me. But maybe the reason it worked 
for me was the extra series from you, which also changed these checks to 
rvin_remote_is_parallel(). And perhaps that function works fine, while 
the older vin->is_csi didn't.

> Locally I have now removed this whole swtich, as you point out the
> formats should already be checked, and as far as I can tell they are.
> This check is a relic from early Gen3 support. And really proves after
> the Gen2 media graph clenups are done we should split rcar-dma.c ->
> rcar-dma-gen{2,3,4}.c to get rid of this mess ;-)
> 
> I would change this patch to just remove the whole switch. If you want
> to keep this fix as is I'm ok with that. I can submit a patch removing
> the switch if you like on top.

Ok, if you think removing the switch is fine, we can do that. I wasn't 
sure of the flow in the driver so I wasn't confident I could just drop 
it (especially considering pre-gen4, with which I have no experience). 
Thus this patch.

  Tomi

> 
>>
>>   Tomi
>>
>>>>
>>>> Fixes: 1b7e7240eaf3 ("media: rcar-vin: Add support for RAW10")
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>> ---
>>>>    drivers/media/platform/renesas/rcar-vin/rcar-dma.c  | 9 +++++++--
>>>>    drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c | 8 ++++----
>>>>    2 files changed, 11 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
>>>> index 53046614f7a1..f8394be8a922 100644
>>>> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
>>>> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
>>>> @@ -811,12 +811,17 @@ static int rvin_setup(struct rvin_dev *vin)
>>>>    		case VNMC_INF_YUV8_BT656:
>>>>    		case VNMC_INF_YUV10_BT656:
>>>>    		case VNMC_INF_YUV16:
>>>> -		case VNMC_INF_RGB666:
>>>>    			if (vin->is_csi) {
>>>>    				vin_err(vin, "Invalid setting in MIPI CSI2\n");
>>>>    				return -EINVAL;
>>>>    			}
>>>>    			break;
>>>> +		case VNMC_INF_RGB666:
>>>> +			if (vin->info->model == RCAR_GEN3 && vin->is_csi) {
>>>> +				vin_err(vin, "Invalid setting in MIPI CSI2\n");
>>>> +				return -EINVAL;
>>>> +			}
>>>> +			break;
>>>>    		case VNMC_INF_RAW8:
>>>>    			if (!vin->is_csi) {
>>>>    				vin_err(vin, "Invalid setting in Digital Pins\n");
>>>> @@ -913,7 +918,7 @@ static int rvin_setup(struct rvin_dev *vin)
>>>>    	case V4L2_PIX_FMT_SGBRG10:
>>>>    	case V4L2_PIX_FMT_SGRBG10:
>>>>    	case V4L2_PIX_FMT_SRGGB10:
>>>> -		dmr = VNDMR_RMODE_RAW10 | VNDMR_YC_THR;
>>>> +		dmr = VNDMR_RMODE_RAW10;
>>>>    		break;
>>>>    	default:
>>>>    		vin_err(vin, "Invalid pixelformat (0x%x)\n",
>>>> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
>>>> index 756fdfdbce61..65da8d513b52 100644
>>>> --- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
>>>> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
>>>> @@ -88,19 +88,19 @@ static const struct rvin_video_format rvin_formats[] = {
>>>>    	},
>>>>    	{
>>>>    		.fourcc			= V4L2_PIX_FMT_SBGGR10,
>>>> -		.bpp			= 4,
>>>> +		.bpp			= 2,
>>>>    	},
>>>>    	{
>>>>    		.fourcc			= V4L2_PIX_FMT_SGBRG10,
>>>> -		.bpp			= 4,
>>>> +		.bpp			= 2,
>>>>    	},
>>>>    	{
>>>>    		.fourcc			= V4L2_PIX_FMT_SGRBG10,
>>>> -		.bpp			= 4,
>>>> +		.bpp			= 2,
>>>>    	},
>>>>    	{
>>>>    		.fourcc			= V4L2_PIX_FMT_SRGGB10,
>>>> -		.bpp			= 4,
>>>> +		.bpp			= 2,
>>>>    	},
>>>>    };
>>>>
>>>> -- 
>>>> 2.43.0
>>>>
>>>
>>
> 


