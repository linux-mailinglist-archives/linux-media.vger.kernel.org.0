Return-Path: <linux-media+bounces-40039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3672B2940F
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 18:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BB7A7A4BAC
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 16:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11CF2FC881;
	Sun, 17 Aug 2025 16:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="gyJrorIy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4521F03EF
	for <linux-media@vger.kernel.org>; Sun, 17 Aug 2025 16:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755447542; cv=none; b=bqNo0GriOTREb6d0iYwSJYL81Qrn7Ee5wY5BFdRIMVKQPnLLDtp7FfiPBaGFduRwPNPmY/0p/EOLxZQzNvid2S0Yk0B75Z24Rf+jIIEnjXgPgz9f5Akl85NrZao31hufqOxZPieNJ7ui3Wt1HZdWYVMR/oS+3pn2pJN3j6LtjXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755447542; c=relaxed/simple;
	bh=7K1JBOlrkJAy846TJDIx/5awKgL+VQXm9kq6dy++U8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/IpZU0rW7oIB6MvsKGo61cszTlzXzZrzWEupVWGpAt3v8bZ7mhlv6SLAx7LqfTa1QZ6XnbNIVRpcr2z0mzGvyTTMd6EgO3mu+lSG2PYAgMnBdhmZvVSL2avxE898u7Y/cY/PvKd32eh2soV6T4EfVCw0LqzZ0k455tFwCxcVpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=gyJrorIy; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1755447532;
 bh=0CUhYVjW9f0TF6cCOLGbcdcZ9oH4iDwa7H4w1bk9Lv0=;
 b=gyJrorIykmGIARt1tBHrCLhlyQ3u8h5xV05VcWEO5KswAcz7dECSpOoXbXqpqi97U9jbjCSXo
 YNsKKSRyu3umFTKmeRLrJRbnu8HS8dxiMz90RKQtMIDlVe9L2Vv/TRT9SOniCYLUw4z4TOZJFPW
 9V0C6ug1n9XhAM4bQ+0zdQHz8A5G5afQ5Pvc9tyjhum2H5RERACXTJgKqWMNr1xzIb2K4Yl8N3G
 epkeYZnv3g+pAl2SpGS4O/jX6Cj1T0SaOuve9l5BawiENscWwqykSZjcgE4oE60L33ELNv3SyWm
 rOhyGZAqgyzNErhjQ/e5v2IoEO3DCQrQjHQHI6plZycw==
X-Forward-Email-ID: 68a200e89a82a81f459cf4aa
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.2.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <a45d0c97-9e31-42a9-aeed-6f874f4f7321@kwiboo.se>
Date: Sun, 17 Aug 2025 18:18:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] media: rkvdec: Disable QoS for HEVC and VP9 on
 RK3328
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Alex Bee <knaerzche@gmail.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <20250810212454.3237486-6-jonas@kwiboo.se>
 <3cf31d3b89a66b1bec57486c54c3df31393335e5.camel@collabora.com>
 <9dce97a9-92e6-4803-9e06-b2938e3c4999@kwiboo.se>
 <f2908b2d35671e70e6a8b295de623e3a3ffe2212.camel@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <f2908b2d35671e70e6a8b295de623e3a3ffe2212.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/12/2025 3:00 PM, Nicolas Dufresne wrote:
> Le mardi 12 août 2025 à 01:08 +0200, Jonas Karlman a écrit :
>> Hi Nicolas,
>>
>> Missed some comments in my last mail.
>>
>> On 8/11/2025 11:25 PM, Nicolas Dufresne wrote:
>>> Le dimanche 10 août 2025 à 21:24 +0000, Jonas Karlman a écrit :
>>>> From: Alex Bee <knaerzche@gmail.com>
>>>>
>>>> The RK3328 VDEC has a HW quirk that require QoS to be disabled when HEVC
>>>> or VP9 is decoded, otherwise the decoded picture may become corrupted.
>>>>
>>>> Add a RK3328 variant with a quirk flag to disable QoS when before
>>>> decoding is started.
>>>>
>>>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>>>> ---
>>>> Changes in v2:
>>>> - No change
>>>> ---
>>>>  drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c |  9 +++++++++
>>>>  drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h |  2 ++
>>>>  drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c  | 10 ++++++++++
>>>>  drivers/media/platform/rockchip/rkvdec/rkvdec.c      | 12 ++++++++++++
>>>>  drivers/media/platform/rockchip/rkvdec/rkvdec.h      |  4 ++++
>>>>  5 files changed, 37 insertions(+)
>>>>
>>>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>>>> b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>>>> index 1994ea24f0be..f8bb8c4264f7 100644
>>>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>>>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>>>> @@ -789,6 +789,15 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
>>>>  	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
>>>>  	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
>>>>  
>>>> +	if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS) {
>>>> +		u32 reg;
>>>> +
>>>> +		reg = readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
>>>> +		reg |= 0xFFFF;
>>>> +		reg &= ~BIT(12);
>>>
>>> I wonder if there is a better way to express that, if not, a comment for
>>> future
>>> readers would be nice. If read it will, we keep the upper 16bit, and
>>> replaced
>>> the lower bits with 0xEFFF (all bits set except 12) ? I'd rather not spend
>>> time
>>> thinking if I walk by this code again.
>>
>> Vendor kernel use following comment to describe the purpose of this [1]:
>>
>>   HW defeat workaround: VP9 and H.265 power save optimization cause
>>   decoding corruption, disable optimization here.
>>
>> From the TRM we can see following for rkvdec_swreg99_qos_ctrl:
>>
>>   27:26 sw_axi_wr_hurry_level
>>     00: hurry off 
>>     01~11: hurry level 
>>   25:24 sw_axi_rd_hurry_level
>>     00: hurry off 
>>     01~11: hurry level 
>>   23:16 sw_bus2mc_buffer_qos_level
>>     range is: 0~255
>>     the value is means that left space <=
>>     sw_bus2mc_buffer_qos_level, it will give hurry
>>   15:0 swreg_block_gating_e
>>
>> So yes this set swreg_block_gating_e to 0xEFFF. Possible this configure
>> hw to not auto gate most internal clocks?
>>
>> Could add a comment and possible use something like following:
>>
>>   reg &= GENMASK(31, 16);
>>   reg |= 0xEFFF;
> 
> Thanks for the information, I think this form is somewhat nicer indeed, and a
> little comment, its fine to say that the QOS bits are undocumented.

Sure, I will update this in a v3.

Regards,
Jonas

> 
> Nicolas
> 
>>
>> [1]
>> https://github.com/Kwiboo/linux-rockchip/blob/linux-6.1-stan-rkr6.1/drivers/video/rockchip/mpp/mpp_rkvdec.c#L857-L867
>>
>>>
>>>> +		writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
>>>> +	}
>>>> +
>>>>  	/* Start decoding! */
>>>>  	reg = (run.pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) ?
>>>>  		0 : RKVDEC_WR_DDR_ALIGN_EN;
>>>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
>>>> b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
>>>> index 540c8bdf24e4..c627b6b6f53a 100644
>>>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
>>>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
>>>> @@ -219,6 +219,8 @@
>>>>  #define RKVDEC_REG_H264_ERR_E				0x134
>>>>  #define RKVDEC_H264_ERR_EN_HIGHBITS(x)			((x) &
>>>> 0x3fffffff)
>>>>  
>>>> +#define RKVDEC_REG_QOS_CTRL				0x18C
>>>> +
>>>>  #define RKVDEC_REG_PREF_LUMA_CACHE_COMMAND		0x410
>>>>  #define RKVDEC_REG_PREF_CHR_CACHE_COMMAND		0x450
>>>>  
>>>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
>>>> b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
>>>> index 0e7e16f20eeb..cadb9d592308 100644
>>>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
>>>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
>>>> @@ -824,6 +824,16 @@ static int rkvdec_vp9_run(struct rkvdec_ctx *ctx)
>>>>  	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
>>>>  
>>>>  	writel(0xe, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
>>>> +
>>>> +	if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS) {
>>>> +		u32 reg;
>>>> +
>>>> +		reg = readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
>>>> +		reg |= 0xFFFF;
>>>> +		reg &= ~BIT(12);
>>>> +		writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
>>>
>>> Can we deduplicate that ?
>>
>> Guess so, any suggestion on how to best do that?
>>
>> One possible way that comes to mind:
>>
>>   if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS)
>> 	rkvdec_quirk_disable_qos(rkvdec);
>>
>>>
>>>> +	}
>>>> +
>>>>  	/* Start decoding! */
>>>>  	writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
>>>>  	       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E,
>>
>> [snip]


