Return-Path: <linux-media+bounces-15139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1332F9375A1
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 11:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 360E81C219AC
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 09:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B53080C07;
	Fri, 19 Jul 2024 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="thvWKqw7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A5AB647;
	Fri, 19 Jul 2024 09:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721380868; cv=none; b=QKiiW7/aPK4j9gitmO1eBSoS32HNHIi90Uq+54w1xgHzVRmJsR+aOE1CP2TrUHWi+7M0zmcflcyXft7gG04+MsO2P7lrccIJu77yYQevsqnzgtg/ltn8rZ0xi2smWOac4v0+PM5YFOEAbXo75HKZylU/dvv1/sSlQLOo+f4215c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721380868; c=relaxed/simple;
	bh=TUwtBaovB0ctc/SyjPjs3WD9TA9YUejACXEuL0jp3kM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qHb9lZyed7nAoO9FCH2XxXQIadhLdiDZwoVSg6eNmJgBdrCAaBWuX8d9MhKWDlhmRZFDOKsNUH2oIipOmhKp/dFfXZ2Ft022SCp0bQtK0YoMXOwxCuyCJWUUPpw98d6Mp46FK9Ies+QgMi9NBi47mR2vQmOzIGyuwUvp1czM0gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=thvWKqw7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-149-128.elisa-laajakaista.fi [91.157.149.128])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B75AB471;
	Fri, 19 Jul 2024 11:20:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721380825;
	bh=TUwtBaovB0ctc/SyjPjs3WD9TA9YUejACXEuL0jp3kM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=thvWKqw7M7qso28L4sePgqM0MHkqjaR3Away+d8J0YuiPVMUrKbVQbwvRrIG0qwMl
	 a1GFEGq6cPjQhBmepwzsWMb16vpKug89nbs3aujg9vEBCsOjXVRKytCebOFHE349CT
	 eLnRxN0SBd5GJcbI/NHm/oKz8ENnAFpnzo+Pc3KY=
Message-ID: <eec51b7a-1ffa-44f5-a28a-9d4bd0dfabdd@ideasonboard.com>
Date: Fri, 19 Jul 2024 12:21:01 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] media: ti: j721e-csi2rx: add support for
 processing virtual channels
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Jai Luthra <j-luthra@ti.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Vaishnav Achath
 <vaishnav.a@ti.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 Julien Massot <julien.massot@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-9-6ae96c54c1c3@ti.com>
 <gn4p7imootxlidam6uddits5i7zwo5azzzb3h3wcobxquqpczs@2msb66c5hs4y>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <gn4p7imootxlidam6uddits5i7zwo5azzzb3h3wcobxquqpczs@2msb66c5hs4y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/07/2024 18:01, Jacopo Mondi wrote:
> Hi Jai
> 
> On Thu, Jun 27, 2024 at 06:40:04PM GMT, Jai Luthra wrote:
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
>> ---
>>   .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 39 ++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index b4b4bb69c88a..c0916ca1a6f8 100644
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
>> @@ -571,6 +574,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>>   	}
>>
>>   	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
>> +	reg |= FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
>>
>>   	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
>>
>> @@ -844,6 +848,33 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>>   	}
>>   }
>>
>> +static int ti_csi2rx_get_vc(struct ti_csi2rx_ctx *ctx)
>> +{
>> +	struct ti_csi2rx_dev *csi = ctx->csi;
>> +	struct v4l2_mbus_frame_desc fd;
>> +	struct media_pad *pad;
>> +	int ret, i;
>> +
>> +	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
>> +	if (!pad)
>> +		return -ENODEV;
>> +
>> +	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index,
>> +			       &fd);
>> +	if (ret)
>> +		return ret;
> 
> Would it be better to fail at bound() time if the remote subdev
> doesn't support get_frame_desc ? you can use
> 
>          if (!v4l2_subdev_has_op(subdev, pad, get_frame_desc)) {
> 
>> +
>> +	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < fd.num_entries; i++) {
> 
>          for (unsigned int i
> 
> should num_entries be validated ?
> 
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
>> @@ -864,6 +895,14 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   	if (ret)
>>   		goto err;
>>
>> +	ret = ti_csi2rx_get_vc(ctx);
>> +	if (ret == -ENOIOCTLCMD)
>> +		ctx->vc = 0;
> 
> Ah, so you fallback to 0 in case the subdev doesn't support
> get_frame_desc. I'm not sure what would be better here maybe wait for
> other's opinions as well.
> 
> Personally I would fail earlier to make sure subdev drivers are forced
> to impement get_frame_desc

As this driver is already in upstream, with single-stream support, I 
think requiring frame_desc could break currently working setups.

I do a similar thing as above in CAL and RPi CFE drivers.

  Tomi


