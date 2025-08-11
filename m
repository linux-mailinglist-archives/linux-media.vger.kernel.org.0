Return-Path: <linux-media+bounces-39476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 367FDB21850
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 00:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A1A146313E
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 22:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4787B2DC32B;
	Mon, 11 Aug 2025 22:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Qwu8/6nc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA8A22425B
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 22:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754951015; cv=none; b=izTLJHKnZ2Uog4bwtFN+06XiF6cec3uk00OrQYes61vePVXTuc7kkURa7fFGzagIciy3rjbBhkI7gEsg+I28vjMWGplCUcHj+N/o32310as/UEDugk7g1M1YE29zuW4qFWn6vYR7iPkmvfP/0dreJbuMa3d6hge7fVCYLVOM3F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754951015; c=relaxed/simple;
	bh=1zNdvvcHZP6R5JJ23etj6t+b+hZpTABX3/TkZ7lxdJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O3B8FxnDt9HY/cHW+u66R3YvYqpJsf9vKHYNiVw+I7vlhQoi1OJK5MBqKw+q1JussUj/AIMjW+lQeX21AJ/AJuA4nBqL16b1u23tsBBGqwv8ldnX/KNZHsjHLtJfao0exXoVmOPLyBelDNRToF+SMy9KeUCWhkHxWimsMryJz7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Qwu8/6nc; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1754951008;
 bh=g2RgxYyMc9YCrvR3tGO7/rfnt+jgDsWOgP4l8MdW5ZM=;
 b=Qwu8/6ncUS0+jpQiWzXuU7AHFbDBlunBv8DQ7G/BKN/1xsDf44SQaes0cAjdiARMMAhqMtE48
 bpF7QKSCi9Y78Rsrca+kiTU4dUzr4bl0gr2x6BYVFKMuCXDIhmyafNig1f2O5HhL63rTWzBym/8
 kbgWWWB//Gb0NB39foz/5zQksxXZ3deqTH9MkSP5JB7/qyBdbrsTR65/YtXUmIcYBQfm4w0Skdi
 jttA7LsliIv2ysyx5vzFdYTMly8aa0fUvnSiJUs0/zigyyIu2W0cCukbd/EbfvjHzz+7ywTB7At
 pxYfvwfZHf7P3T33bujqw3qaisgrKykgoTGGY08YC/xA==
X-Forward-Email-ID: 689a6d18de615f3104e089a6
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.2.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <16b67aec-8675-45a2-b6df-380bd5f3bf4c@kwiboo.se>
Date: Tue, 12 Aug 2025 00:22:11 +0200
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
> 
>> +	}
>> +
>>  	/* Start decoding! */
>>  	writel(RKVDEC_INTERRUPT_DEC_E | RKVDEC_CONFIG_DEC_CLK_GATE_E |
>>  	       RKVDEC_TIMEOUT_E | RKVDEC_BUF_EMPTY_E,
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> index c20e046205fe..d61d4c419992 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> @@ -1226,6 +1226,13 @@ static const struct rkvdec_variant
>> rk3288_rkvdec_variant = {
>>  	.capabilities = RKVDEC_CAPABILITY_HEVC,
>>  };
>>  
>> +static const struct rkvdec_variant rk3328_rkvdec_variant = {
>> +	.capabilities = RKVDEC_CAPABILITY_HEVC |
>> +			RKVDEC_CAPABILITY_H264 |
>> +			RKVDEC_CAPABILITY_VP9,
>> +	.quirks = RKVDEC_QUIRK_DISABLE_QOS,
>> +};
>> +
>>  static const struct rkvdec_variant rk3399_rkvdec_variant = {
>>  	.capabilities = RKVDEC_CAPABILITY_HEVC |
>>  			RKVDEC_CAPABILITY_H264 |
>> @@ -1237,6 +1244,10 @@ static const struct of_device_id of_rkvdec_match[] = {
>>  		.compatible = "rockchip,rk3288-vdec",
>>  		.data = &rk3288_rkvdec_variant,
>>  	},
>> +	{
>> +		.compatible = "rockchip,rk3328-vdec",
>> +		.data = &rk3328_rkvdec_variant,
>> +	},
>>  	{
>>  		.compatible = "rockchip,rk3399-vdec",
>>  		.data = &rk3399_rkvdec_variant,
>> @@ -1267,6 +1278,7 @@ static int rkvdec_probe(struct platform_device *pdev)
>>  	platform_set_drvdata(pdev, rkvdec);
>>  	rkvdec->dev = &pdev->dev;
>>  	rkvdec->capabilities = variant->capabilities;
>> +	rkvdec->quirks = variant->quirks;
>>  	mutex_init(&rkvdec->vdev_lock);
>>  	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
>>  
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> index 8e1f8548eae4..e633a879e9bf 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> @@ -26,6 +26,8 @@
>>  #define RKVDEC_CAPABILITY_H264		BIT(1)
>>  #define RKVDEC_CAPABILITY_VP9		BIT(2)
>>  
>> +#define RKVDEC_QUIRK_DISABLE_QOS	BIT(0)
> 
> Can you go back in the series, get H264 into bit 0, VP9 into bit 1, and set
> quirks from bit 16 ? Just worried the whole finding can becomes a mess in many
> years from now.

The reason for HEVC in bit 0 is mainly because the first generation was
HEVC only, this also matches the mode reg values (0=hevc, 1=h264, 2=vp9).

I can start quirk at bit 16 if you like, not really sure I understand
why? Do you want to combine capabilities and quirks into one?

Regards,
Jonas

> 
>> +
>>  struct rkvdec_ctx;
>>  
>>  struct rkvdec_ctrl_desc {
>> @@ -69,6 +71,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
>>  
>>  struct rkvdec_variant {
>>  	unsigned int capabilities;
>> +	unsigned int quirks;
>>  };
>>  
>>  struct rkvdec_coded_fmt_ops {
>> @@ -121,6 +124,7 @@ struct rkvdec_dev {
>>  	struct delayed_work watchdog_work;
>>  	struct iommu_domain *empty_domain;
>>  	unsigned int capabilities;
>> +	unsigned int quirks;
>>  };
>>  
>>  struct rkvdec_ctx {


