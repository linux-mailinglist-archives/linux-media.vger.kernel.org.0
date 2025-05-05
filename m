Return-Path: <linux-media+bounces-31683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7823AA8CD5
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 09:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E643171B6B
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 07:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2317C1D8E10;
	Mon,  5 May 2025 07:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hnehQkTh"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168332F22;
	Mon,  5 May 2025 07:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746428849; cv=none; b=bIjrDqT7HfoK6M9bMd+jDpNv17J+UraLRX03L0f6qeSt25WjDVEzOP7dcoBdcBMHnDTKOctCdYBJw4lSzmMjPOu+rnk0xbgbwxzgFkI3r10yNWJ/4ZH0wNnL78C3P6gpI2goWEY3dacEIzxjfuH7XCht9SgTMC5Kjd9bIsD7jLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746428849; c=relaxed/simple;
	bh=RkCKem2ilcaRlQrvBAQ1A0ircFTfTmD0DZFuyTNRC24=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=koJixPVfzpAXy13hBvlMOaqCVxyv7neIxkD9PDqpXxGzLGyYt1CuvKuZoB3oQknNjp+FvQTsghoCs8x6sLVbPObyTg3VYf1jOcF4Ud1gU3psQjp1MP71MUtE2W9vc24lXCMfnNS/mGtiTZQkKsWBMXSLrHTt09aZ6icbCmsk7vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hnehQkTh; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54576ceh882866
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 02:06:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746428798;
	bh=CjMQjxbI4MVkcYVy6hFeJm3Q9c2cTiQFbTSz3mMbm8g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hnehQkThiz8l+CaJyoKa489nowKLIpNWxhsd1AsDwYKoT38YDiJ9szQLsshvw2Lck
	 g030p5BPFEXVZsjjNGWcxrL89YVMZOdsyMbYAK/62nOKgWa0tAISBHOs4ONZBu6FpF
	 NDovo1ZG5f87f/bk6BJoWqiw9auIHRjZiHZC7RMI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54576cHI010010
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 02:06:38 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 02:06:37 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 02:06:37 -0500
Received: from [10.24.69.232] (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54576VRR040260;
	Mon, 5 May 2025 02:06:32 -0500
Message-ID: <6da2f444-443e-403b-9def-f66f0cf65010@ti.com>
Date: Mon, 5 May 2025 12:36:30 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/13] media: ti: j721e-csi2rx: add support for
 processing virtual channels
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: <jai.luthra@linux.dev>, <mripard@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <s-jain1@ti.com>, <vigneshr@ti.com>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>
References: <20250417065554.437541-1-r-donadkar@ti.com>
 <20250417065554.437541-9-r-donadkar@ti.com>
 <20250421133418.GI29483@pendragon.ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <20250421133418.GI29483@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 21/04/25 19:04, Laurent Pinchart wrote:
> Hi Rishikesh,
>
> Thank you for the patch.


Hi Laurent,

Thanks you for the review.


>
> On Thu, Apr 17, 2025 at 12:25:49PM +0530, Rishikesh Donadkar wrote:
>> From: Jai Luthra <j-luthra@ti.com>
>>
>> Use get_frame_desc() to get the frame desc from the connected source,
>> and use the provided virtual channel instead of hardcoded one.
>>
>> get_frame_desc() works per stream, but as we don't support multiple
>> streams yet, we will just always use stream 0. If the source doesn't
>> support get_frame_desc(), fall back to the previous method of always
>> capturing virtual channel 0.
>>
>> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 39 +++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index e85d04d7c2ff9..3e2a0517a9096 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -29,6 +29,7 @@
>>   #define SHIM_DMACNTX_EN			BIT(31)
>>   #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
>>   #define SHIM_DMACNTX_SIZE		GENMASK(21, 20)
>> +#define SHIM_DMACNTX_VC			GENMASK(9, 6)
>>   #define SHIM_DMACNTX_FMT		GENMASK(5, 0)
>>   #define SHIM_DMACNTX_YUV422_MODE_11	3
>>   #define SHIM_DMACNTX_SIZE_8		0
>> @@ -105,6 +106,8 @@ struct ti_csi2rx_ctx {
>>   	struct media_pad		pad;
>>   	u32				sequence;
>>   	u32				idx;
>> +	u32				vc;
>> +	u32				stream;
>>   };
>>   
>>   struct ti_csi2rx_dev {
>> @@ -573,6 +576,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>>   	}
>>   
>>   	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
>> +	reg |= FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
>>   
>>   	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
>>   
>> @@ -846,6 +850,33 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>>   	}
>>   }
>>   
>> +static int ti_csi2rx_get_vc(struct ti_csi2rx_ctx *ctx)
>> +{
>> +	struct ti_csi2rx_dev *csi = ctx->csi;
>> +	struct v4l2_mbus_frame_desc fd;
>> +	struct media_pad *pad;
>> +	int ret, i;
> i can never be negative, you can make it an unsigned int.


Will fix.


>
>> +
>> +	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
>> +	if (!pad)
>> +		return -ENODEV;
>> +
>> +	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index,
>> +			       &fd);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < fd.num_entries; i++) {
>> +		if (ctx->stream == fd.entry[i].stream)
>> +			return fd.entry[i].bus.csi2.vc;
>> +	}
>> +
>> +	return -ENODEV;
>> +}
>> +
>>   static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   {
>>   	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
>> @@ -866,6 +897,14 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   	if (ret)
>>   		goto err;
>>   
>> +	ret = ti_csi2rx_get_vc(ctx);
>> +	if (ret == -ENOIOCTLCMD)
>> +		ctx->vc = 0;
>> +	else if (ret < 0)
>> +		goto err;
>> +	else
>> +		ctx->vc = ret;
>> +
> When you'll add support for multiple streams in patch 11/13, you will
> end up calling .get_frame_desc() once per stream. All calls will return
> the same information, so it's a bit wasteful. Would it be possible to
> call this function once only at start time, and cache and use the
> results for all video devices ?


Yes, Right. I will make these changes in 11/13 when adding

muti-stream support.


>
>>   	ti_csi2rx_setup_shim(ctx);
>>   
>>   	ctx->sequence = 0;
Regards,
Rishikesh

