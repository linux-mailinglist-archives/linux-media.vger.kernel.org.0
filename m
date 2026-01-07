Return-Path: <linux-media+bounces-50159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F98CFEAB2
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 16:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ECEF304E16B
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 15:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A61E34E769;
	Wed,  7 Jan 2026 14:52:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23C231AA8D
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 14:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767797539; cv=none; b=Ji9FmyYWk94iSr1U8A0NgbIMufrsyq1+BZ7SiK6mG7o5h9Prmqm57Uykz9Cba9z5pjFUQ5ubhcWRR0xZORB9kBpMoI4bfw1DkFhFSdJyhbmnaG+8VuXU9V6o6jU7Dv18oyTpT5BNCX5grWbLwOj/Jp/MAw5/2PHZTxf9QUgLkbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767797539; c=relaxed/simple;
	bh=rEI4N32RTUkp6hm6LhzSfgzxDUsDYJqv7mwhnacev+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRJke2jYZFWuFXnIQDBo1mTEURHorsdcaakrxAUFxpi7683Nx35gdtbVFx7Rw3bgAtUDsH69OZhmvAi5Yld9S448KRfJB7yl7TrPAdPXyyiHmlh9XZn48mI+EgHKpI0Qz0d0pbSDR5sz2/UTVi0kppOnOHQhI+Gch85KzSZ1Aws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vdUtK-0002O9-IV; Wed, 07 Jan 2026 15:52:06 +0100
Message-ID: <1f4720ea-fa9c-41b7-9a6c-24abffa4bd77@pengutronix.de>
Date: Wed, 7 Jan 2026 15:52:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/22] media: rockchip: rga: move rga_fmt to rga-hw.h
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
 <20251203-spu-rga3-v2-18-989a67947f71@pengutronix.de>
 <de09023e7bdb1698c0bcdeb8d625101cbf647595.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <de09023e7bdb1698c0bcdeb8d625101cbf647595.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi,

On 12/24/25 4:59 PM, Nicolas Dufresne wrote:
> Le mercredi 03 décembre 2025 à 16:52 +0100, Sven Püschel a écrit :
>> Move rga_fmt to rga-hw in preparation of the RGA3 addition, as the struct
>> contains many RGA2 specific values. They are used to write the correct
>> register values quickly based on the chosen format. Therefore the
>> pointer to the rga_fmt struct is kept but changed to an opaque void
>> pointer outside of the rga-hw.h.
[...]
>> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
>> index fffcab0131225..3bc4b1f5acba2 100644
>> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
>> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
>> @@ -6,6 +6,8 @@
>>   #ifndef __RGA_HW_H__
>>   #define __RGA_HW_H__
>>   
>> +#include <linux/types.h>
>> +
>>   #define RGA_CMDBUF_SIZE 0x20
>>   
>>   /* Hardware limits */
>> @@ -431,4 +433,14 @@ union rga_pat_con {
>>   	} data;
>>   };
>>   
>> +struct rga_fmt {
>> +	u32 fourcc;
>> +	int depth;
>> +	u8 uv_factor;
>> +	u8 y_div;
>> +	u8 x_div;
>> +	u8 color_swap;
>> +	u8 hw_format;
>> +};

[...]

>>   
>> -struct rga_fmt {
>> -	u32 fourcc;
>> -	int depth;
>> -	u8 uv_factor;
>> -	u8 y_div;
>> -	u8 x_div;
>> -	u8 color_swap;
>> -	u8 hw_format;
>> -};
> Ah! here's the removal of the unused variable. Not review friendly, but at last
> removed.

I've just moved it, so your review comments are still right. x_div/y_div 
is still used at one place in rga_hw.c, but I'll remove it too in my v3 
(and have these removals in the other commits to keep this reviewed-by).

Sincerely
     Sven

>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
>> -
>>   struct rga_frame {
>>   	/* Crop */
>>   	struct v4l2_rect crop;
>>   
>>   	/* Image format */
>> -	struct rga_fmt *fmt;
>> +	void *fmt;
>>   	struct v4l2_pix_format_mplane pix;
>>   };
>>   
>> @@ -145,8 +135,6 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
>>   struct rga_hw {
>>   	const char *card_type;
>>   	bool has_internal_iommu;
>> -	struct rga_fmt *formats;
>> -	u32 num_formats;
>>   	size_t cmdbuf_size;
>>   	u32 min_width, min_height;
>>   	u32 max_width, max_height;
>> @@ -158,6 +146,9 @@ struct rga_hw {
>>   		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
>>   	bool (*handle_irq)(struct rockchip_rga *rga);
>>   	void (*get_version)(struct rockchip_rga *rga);
>> +	void *(*adjust_and_map_format)(struct v4l2_pix_format_mplane *format,
>> +				       bool is_output);
>> +	int (*enum_format)(struct v4l2_fmtdesc *f);
>>   };
>>   
>>   static inline bool rga_has_internal_iommu(const struct rockchip_rga *rga)

