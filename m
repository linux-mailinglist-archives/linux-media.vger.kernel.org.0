Return-Path: <linux-media+bounces-39477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44035B218F2
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 01:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39AC51A227E9
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 23:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF97023B632;
	Mon, 11 Aug 2025 23:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="zUXEY+ZF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F151F4289
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 23:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754953738; cv=none; b=uimMIbjdYjm0f0YA/YBskVu74g5pfFEDrGZZZ1mIkjC7E5qVkFDTYntTWJ7TNOVXMKrQ8U+nnV4MRqCmXHJK5wgZ/X2Q3TCHDZUdMrf6ags43aIzx+wt4uT5B4fQCyfr2L1v2wsIr5xPixo3TFfWSTdzEWrloypXM3hPkKalgyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754953738; c=relaxed/simple;
	bh=kU7IxxrdJl9R9nSh1DSGm7hKbANjSWWwLmegZb/kWBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWpvTmyJNptsNf8SituRyRIzE8AXQScA3TNsbimO/8kptgCik/GHDiXkTKD18DlRv0k5IQBun+uMZdfUORjFzidFVT9CFECO/DJSE7uPILAvfTTyblV7gnryN7zP0RfWtTjLI+0CPFydEwDc8+VGxbhZCSrRMhwf3KoNGL3dAYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=zUXEY+ZF; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1754953735;
 bh=4WOQQytnvdG+ExQxM0wRnwxWgx7TDMfbUEkljON2sWA=;
 b=zUXEY+ZFYUR2qx4RF1eElcECWM8xX2Q9sevnHk/fjgGVFYQlFKhYBJADeISQPYkSF7gamvZsG
 65Wdg0VfxHg8/mLOjrTBobKGCh2jSqqPH0mJv2Mt4IRsdWy+4sbbuQBXfZX4qRq0eP+6hMutqru
 tMC3dMhNBaA4kk3XxLd/PLC8QmT1otW/xWvMFPkSLZv/RlCSqAjtxzQXQfaavIBxkPKeeDzJamV
 bdqpSNsQ3P9rYV4pS1+tkLoiHXzWpGdR8u/NUHUjG2JMmijr5Pn9kIM8OQiFpVV5nBQLtCImBF/
 cuOGGkvE9PyGYGP0shpJM/DRMqk0CENXX1LmuDFkPk8w==
X-Forward-Email-ID: 689a77d9de615f3104e098e6
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.2.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <9dce97a9-92e6-4803-9e06-b2938e3c4999@kwiboo.se>
Date: Tue, 12 Aug 2025 01:08:04 +0200
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
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <3cf31d3b89a66b1bec57486c54c3df31393335e5.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nicolas,

Missed some comments in my last mail.

On 8/11/2025 11:25 PM, Nicolas Dufresne wrote:
> Le dimanche 10 août 2025 à 21:24 +0000, Jonas Karlman a écrit :
>> From: Alex Bee <knaerzche@gmail.com>
>>
>> The RK3328 VDEC has a HW quirk that require QoS to be disabled when HEVC
>> or VP9 is decoded, otherwise the decoded picture may become corrupted.
>>
>> Add a RK3328 variant with a quirk flag to disable QoS when before
>> decoding is started.
>>
>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>> Changes in v2:
>> - No change
>> ---
>>  drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c |  9 +++++++++
>>  drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h |  2 ++
>>  drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c  | 10 ++++++++++
>>  drivers/media/platform/rockchip/rkvdec/rkvdec.c      | 12 ++++++++++++
>>  drivers/media/platform/rockchip/rkvdec/rkvdec.h      |  4 ++++
>>  5 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>> b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>> index 1994ea24f0be..f8bb8c4264f7 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>> @@ -789,6 +789,15 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
>>  	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
>>  	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
>>  
>> +	if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS) {
>> +		u32 reg;
>> +
>> +		reg = readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
>> +		reg |= 0xFFFF;
>> +		reg &= ~BIT(12);
> 
> I wonder if there is a better way to express that, if not, a comment for future
> readers would be nice. If read it will, we keep the upper 16bit, and replaced
> the lower bits with 0xEFFF (all bits set except 12) ? I'd rather not spend time
> thinking if I walk by this code again.

Vendor kernel use following comment to describe the purpose of this [1]:

  HW defeat workaround: VP9 and H.265 power save optimization cause
  decoding corruption, disable optimization here.

From the TRM we can see following for rkvdec_swreg99_qos_ctrl:

  27:26 sw_axi_wr_hurry_level
    00: hurry off 
    01~11: hurry level 
  25:24 sw_axi_rd_hurry_level
    00: hurry off 
    01~11: hurry level 
  23:16 sw_bus2mc_buffer_qos_level
    range is: 0~255
    the value is means that left space <=
    sw_bus2mc_buffer_qos_level, it will give hurry
  15:0 swreg_block_gating_e

So yes this set swreg_block_gating_e to 0xEFFF. Possible this configure
hw to not auto gate most internal clocks?

Could add a comment and possible use something like following:

  reg &= GENMASK(31, 16);
  reg |= 0xEFFF;

[1] https://github.com/Kwiboo/linux-rockchip/blob/linux-6.1-stan-rkr6.1/drivers/video/rockchip/mpp/mpp_rkvdec.c#L857-L867

> 
>> +		writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
>> +	}
>> +
>>  	/* Start decoding! */
>>  	reg = (run.pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) ?
>>  		0 : RKVDEC_WR_DDR_ALIGN_EN;
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
>> b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
>> index 540c8bdf24e4..c627b6b6f53a 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
>> @@ -219,6 +219,8 @@
>>  #define RKVDEC_REG_H264_ERR_E				0x134
>>  #define RKVDEC_H264_ERR_EN_HIGHBITS(x)			((x) & 0x3fffffff)
>>  
>> +#define RKVDEC_REG_QOS_CTRL				0x18C
>> +
>>  #define RKVDEC_REG_PREF_LUMA_CACHE_COMMAND		0x410
>>  #define RKVDEC_REG_PREF_CHR_CACHE_COMMAND		0x450
>>  
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
>> b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
>> index 0e7e16f20eeb..cadb9d592308 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
>> @@ -824,6 +824,16 @@ static int rkvdec_vp9_run(struct rkvdec_ctx *ctx)
>>  	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
>>  
>>  	writel(0xe, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
>> +
>> +	if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS) {
>> +		u32 reg;
>> +
>> +		reg = readl(rkvdec->regs + RKVDEC_REG_QOS_CTRL);
>> +		reg |= 0xFFFF;
>> +		reg &= ~BIT(12);
>> +		writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
> 
> Can we deduplicate that ?

Guess so, any suggestion on how to best do that?

One possible way that comes to mind:

  if (rkvdec->quirks & RKVDEC_QUIRK_DISABLE_QOS)
	rkvdec_quirk_disable_qos(rkvdec);

> 
>> +	}
>> +
>>  	/* Start decoding! */
>>  	writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
>>  	       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E,

[snip]

