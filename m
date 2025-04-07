Return-Path: <linux-media+bounces-29551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D1AA7E5B6
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 18:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B9D0442F91
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 16:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7A62066DA;
	Mon,  7 Apr 2025 15:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U87Tcvkn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95F21ADC86;
	Mon,  7 Apr 2025 15:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041558; cv=none; b=D3mn5Ch0oKV+0yCFB6udtgMKwbLR7rcS3Pq6pv9MtmaWllRSVKE+SX50MlKCuHo+E3Su2UoXi8ntuXqt/3vWNiIBrA4T+NMtF0rqiViEi9hC1n0jL6XSE0BtOM7FwGKtCjEQKWoNxDvfa/rOjhO+u25FGSHRx+GbXEuj0egRWv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041558; c=relaxed/simple;
	bh=1GyAjSDlG1wgBYRaQ8zf6o0fLwSnmGQPgHb92Y351kE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AdOHh8PjRD6c2YefU2p7I8Bwu+1eEjFKHoKaU6U9IsSq1TLWUN5V33BfjmhPmE0/8R0PkCVCQ2Lnxp5mxxHHIFbrDCQuuaTvhgL7s+DsHhmkQna+xg4LkEPrfbLCkT919rIQym0Xw35bv3/4PHQFgT+RBmu66RojFSuxKCHLe5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U87Tcvkn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1337C4CEE7;
	Mon,  7 Apr 2025 15:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744041558;
	bh=1GyAjSDlG1wgBYRaQ8zf6o0fLwSnmGQPgHb92Y351kE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U87TcvknweLw8WVHBDI8tFeDHzDGjFfL/7YNpQa4B0ILtFjdBE6LbOff6Qw8up2KU
	 Tv5W+RAl6B7U87U1zp4eUA+ubLjgQ3cN7kxBfCpAwaj3BztjSDw3UYswmoz+yOHZ68
	 uNF6E1JAVZus23iUGq47KGXJil5OYH4qC0iR74ErWqPlxwfpPiTaM/6J1T78thq5oZ
	 IXqcKRivw5nEvxZfxdogQUUeF9Ej0X4Wh9zNkhFXpFMTzOkim2DFLTWixI1+n51n60
	 TJaZHG/PMGgTxOnIyDvGt5r/b01cgh2Tp+IUG9gwlWm4RKGzYqkDneZnLGOE3Dwu/e
	 bEaafTh9m3jpQ==
Message-ID: <c3284c33-4a8e-4150-b40a-05cd3af39def@kernel.org>
Date: Mon, 7 Apr 2025 16:59:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] media: camss: Increase the maximum frame size
To: Luca Weiss <luca.weiss@fairphone.com>, Jordan Crouse
 <jorcrous@amazon.com>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240802152435.35796-1-jorcrous@amazon.com>
 <20240802152435.35796-2-jorcrous@amazon.com>
 <D64PAIXELZ6A.37ZSFBIRPE6MT@fairphone.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <D64PAIXELZ6A.37ZSFBIRPE6MT@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2024 14:51, Luca Weiss wrote:
> On Fri Aug 2, 2024 at 5:24 PM CEST, Jordan Crouse wrote:
>> Commit 35493d653a2d
>> ("media: camss: add support for vidioc_enum_framesizes ioctl") added a
>> maximum frame width and height but the values selected seemed to have
>> been arbitrary. In reality the cam hardware doesn't seem to have a maximum
>> size restriction so double up the maximum reported width and height to
>> allow for larger frames.
>>
>> Also increase the maximum size checks at each point in the pipeline so
>> the increased sizes are allowed all the way down to the sensor.
> 
> Hi Jordan,
> 
> Looks like this hasn't landed yet, do you plan on resending this?
> 
> Just wanted to try a 8192x6144 format but csid limiting the size to 8191
> is a bit in the way.
> 
> Regards
> Luca
> 
>>
>> Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
>> ---
>>
>>   drivers/media/platform/qcom/camss/camss-csid.c   | 8 ++++----
>>   drivers/media/platform/qcom/camss/camss-csiphy.c | 4 ++--
>>   drivers/media/platform/qcom/camss/camss-ispif.c  | 4 ++--
>>   drivers/media/platform/qcom/camss/camss-vfe.c    | 4 ++--
>>   drivers/media/platform/qcom/camss/camss-video.c  | 6 +++---
>>   5 files changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
>> index 858db5d4ca75..886c42c82612 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>> @@ -752,8 +752,8 @@ static void csid_try_format(struct csid_device *csid,
>>   		if (i >= csid->res->formats->nformats)
>>   			fmt->code = MEDIA_BUS_FMT_UYVY8_1X16;
>>   
>> -		fmt->width = clamp_t(u32, fmt->width, 1, 8191);
>> -		fmt->height = clamp_t(u32, fmt->height, 1, 8191);
>> +		fmt->width = clamp_t(u32, fmt->width, 1, 16383);
>> +		fmt->height = clamp_t(u32, fmt->height, 1, 16383);
>>   
>>   		fmt->field = V4L2_FIELD_NONE;
>>   		fmt->colorspace = V4L2_COLORSPACE_SRGB;
>> @@ -781,8 +781,8 @@ static void csid_try_format(struct csid_device *csid,
>>   			if (i >= csid->res->formats->nformats)
>>   				fmt->code = MEDIA_BUS_FMT_UYVY8_1X16;
>>   
>> -			fmt->width = clamp_t(u32, fmt->width, 1, 8191);
>> -			fmt->height = clamp_t(u32, fmt->height, 1, 8191);
>> +			fmt->width = clamp_t(u32, fmt->width, 1, 16383);
>> +			fmt->height = clamp_t(u32, fmt->height, 1, 16383);
>>   
>>   			fmt->field = V4L2_FIELD_NONE;
>>   		}
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
>> index 2f7361dfd461..43c35ad6ac84 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
>> @@ -368,8 +368,8 @@ static void csiphy_try_format(struct csiphy_device *csiphy,
>>   		if (i >= csiphy->res->formats->nformats)
>>   			fmt->code = MEDIA_BUS_FMT_UYVY8_1X16;
>>   
>> -		fmt->width = clamp_t(u32, fmt->width, 1, 8191);
>> -		fmt->height = clamp_t(u32, fmt->height, 1, 8191);
>> +		fmt->width = clamp_t(u32, fmt->width, 1, 16383);
>> +		fmt->height = clamp_t(u32, fmt->height, 1, 16383);
>>   
>>   		fmt->field = V4L2_FIELD_NONE;
>>   		fmt->colorspace = V4L2_COLORSPACE_SRGB;
>> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
>> index a12dcc7ff438..01e2ded8da0b 100644
>> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
>> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
>> @@ -912,8 +912,8 @@ static void ispif_try_format(struct ispif_line *line,
>>   		if (i >= line->nformats)
>>   			fmt->code = MEDIA_BUS_FMT_UYVY8_1X16;
>>   
>> -		fmt->width = clamp_t(u32, fmt->width, 1, 8191);
>> -		fmt->height = clamp_t(u32, fmt->height, 1, 8191);
>> +		fmt->width = clamp_t(u32, fmt->width, 1, 16383);
>> +		fmt->height = clamp_t(u32, fmt->height, 1, 16383);
>>   
>>   		fmt->field = V4L2_FIELD_NONE;
>>   		fmt->colorspace = V4L2_COLORSPACE_SRGB;
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 83c5a36d071f..826c0fb31785 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -1049,8 +1049,8 @@ static void vfe_try_format(struct vfe_line *line,
>>   		if (i >= line->nformats)
>>   			fmt->code = MEDIA_BUS_FMT_UYVY8_1X16;
>>   
>> -		fmt->width = clamp_t(u32, fmt->width, 1, 8191);
>> -		fmt->height = clamp_t(u32, fmt->height, 1, 8191);
>> +		fmt->width = clamp_t(u32, fmt->width, 1, 16383);
>> +		fmt->height = clamp_t(u32, fmt->height, 1, 16383);
>>   
>>   		fmt->field = V4L2_FIELD_NONE;
>>   		fmt->colorspace = V4L2_COLORSPACE_SRGB;
>> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
>> index cd72feca618c..5fee3733da8e 100644
>> --- a/drivers/media/platform/qcom/camss/camss-video.c
>> +++ b/drivers/media/platform/qcom/camss/camss-video.c
>> @@ -19,10 +19,10 @@
>>   #include "camss.h"
>>   
>>   #define CAMSS_FRAME_MIN_WIDTH		1
>> -#define CAMSS_FRAME_MAX_WIDTH		8191
>> +#define CAMSS_FRAME_MAX_WIDTH		16833
>>   #define CAMSS_FRAME_MIN_HEIGHT		1
>> -#define CAMSS_FRAME_MAX_HEIGHT_RDI	8191
>> -#define CAMSS_FRAME_MAX_HEIGHT_PIX	4096
>> +#define CAMSS_FRAME_MAX_HEIGHT_RDI	16833
>> +#define CAMSS_FRAME_MAX_HEIGHT_PIX	8192
>>   
>>   /* -----------------------------------------------------------------------------
>>    * Helper functions
> 

Ping Jordan !

Will buy you beer for a v2 of this series.

---
bod

