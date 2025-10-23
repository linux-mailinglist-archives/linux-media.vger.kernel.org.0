Return-Path: <linux-media+bounces-45424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1F7C0330F
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 21:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43FE21A65B4A
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 19:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B4234D4C1;
	Thu, 23 Oct 2025 19:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="eInEvmGE"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EE62BEC55;
	Thu, 23 Oct 2025 19:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761248154; cv=pass; b=bjnwmitJwev76oNJ3Iulm0IoWE4XWLPihF5iPpVqGXPAqXMqEwMtkX8I36yJIzR0QL1nLu6F2LdwG0vvLuUpXQuDenNBGUGRMbr3wre+Ng44XMGagh8+BfYN8rySVVVYFa21MsNoaVAaMcFpfcRaMjr0qesOxVaAKtJUWgvpu/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761248154; c=relaxed/simple;
	bh=uSQVyvdleg5fr4zC5A8uwSNPqiNT5XtQaYMzEGn4c0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Re4rDh2I1gywogsN1pB1dw0kY2OiTONHn0+3s5G5UOZ6WrwKkAB/ycZbBLNLN8T7Ls4MUjrUr8wcv/GJyWvxyWNw8+8b+c2sXmgKyxNIr30VHVhERJTpLEQkPZVPPI4nAYTPUMm5zSSyf77yHcpLt9zbWKBs/9jNPnSENGz6QJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=eInEvmGE; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1761248119; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nv18uc+SyKl+K8SnLLTWpAq0fbUpluuoZJju1MeUj+H/X9bt51/ldBG63PC0/4u4BK/AzaRiCVKegxqnTYGFW6sgeQcO1qcz6nhGgc6/R2rg2MbmYPWuHPDHOjh7RHokXe5zoZF+wi84/s/4JuRd/ojvFfJ82tSfefflm5xe3C8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761248119; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DoBeKc7k0tI/KT6rIVYw1QPBdWN+Yb/dqCkvda7xnq8=; 
	b=lIKNEcyDva8gdJAeAtbnSr/3vdRnFgxZVz6Fxl5YVBbwLbulKabzGV8LWLUs0pEl64356H4Si+9zoI0J/j5KTR9ke9eCcQd+2lW4Pqy7FRMiUVc1JsfF4P+GMVwzq0oTQcAnflvVagNQggc4e/QbKq3UDPHmVJ10B4w8sUgcwd8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761248119;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=DoBeKc7k0tI/KT6rIVYw1QPBdWN+Yb/dqCkvda7xnq8=;
	b=eInEvmGEiPpCIw5+BSGE1S4LGFduLUjAMMsmQ9bPV9BCl8tZTEOEpuqUYqFl882L
	okc8uQUclwD6wSqoR3A36tguk0pR/Owy6MJITrvJBgDWM7nl3k6Gd7aGURHkscaBiqM
	FxT3cyYl3kxs/z2kGWsxqmU1+78vg8YhA3f+HIHI=
Received: by mx.zohomail.com with SMTPS id 1761248113921586.062025324594;
	Thu, 23 Oct 2025 12:35:13 -0700 (PDT)
Message-ID: <174217e1-2ec5-42fe-bdc8-57b8a5f943c1@collabora.com>
Date: Thu, 23 Oct 2025 15:35:11 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/15] media: rkvdec: Add generic configuration for
 variants
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Yunke Cao <yunkec@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 James Cowgill <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>, linux-kernel@vger.kernel.org
References: <20251022174508.284929-1-detlev.casanova@collabora.com>
 <20251022174508.284929-9-detlev.casanova@collabora.com>
 <5d2f3b9c-3d1a-47a5-93f1-1a6d6ce540f3@kwiboo.se>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <5d2f3b9c-3d1a-47a5-93f1-1a6d6ce540f3@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Jonas,

On 10/22/25 16:57, Jonas Karlman wrote:
> Hi Detlev,
>
> On 10/22/2025 7:45 PM, Detlev Casanova wrote:
>> This is to prepare for adding new versions of the decoder and
>> support specific formats and ops per version.
>>
>> Different rkvdec_variant instances will be able to share generic
>> decoder configs.
>>
>> Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>> ---
>>   .../media/platform/rockchip/rkvdec/rkvdec.c   | 37 ++++++++++++-------
>>   .../media/platform/rockchip/rkvdec/rkvdec.h   |  6 +++
>>   2 files changed, 30 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> index 776149f871b0..a7af1e3fdebd 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> @@ -373,15 +373,16 @@ static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int capability)
>>   static const struct rkvdec_coded_fmt_desc *
>>   rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
>>   {
>> +	const struct rkvdec_config *cfg = ctx->dev->variant->config;
>>   	int fmt_idx = -1;
>>   	unsigned int i;
>>   
>> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
>> -		if (!rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
>> +	for (i = 0; i < cfg->coded_fmts_num; i++) {
>> +		if (!rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability))
>>   			continue;
>>   		fmt_idx++;
>>   		if (index == fmt_idx)
>> -			return &rkvdec_coded_fmts[i];
>> +			return &cfg->coded_fmts[i];
>>   	}
>>   
>>   	return NULL;
>> @@ -390,12 +391,13 @@ rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
>>   static const struct rkvdec_coded_fmt_desc *
>>   rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
>>   {
>> +	const struct rkvdec_config *cfg = ctx->dev->variant->config;
>>   	unsigned int i;
>>   
>> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
>> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability) &&
>> -		    rkvdec_coded_fmts[i].fourcc == fourcc)
>> -			return &rkvdec_coded_fmts[i];
>> +	for (i = 0; i < cfg->coded_fmts_num; i++) {
>> +		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability) &&
>> +		    cfg->coded_fmts[i].fourcc == fourcc)
>> +			return &cfg->coded_fmts[i];
>>   	}
>>   
>>   	return NULL;
>> @@ -1014,18 +1016,19 @@ static int rkvdec_add_ctrls(struct rkvdec_ctx *ctx,
>>   
>>   static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
>>   {
>> +	const struct rkvdec_config *cfg = ctx->dev->variant->config;
>>   	unsigned int i, nctrls = 0;
>>   	int ret;
>>   
>> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
>> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
>> -			nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
>> +	for (i = 0; i < cfg->coded_fmts_num; i++)
>> +		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability))
>> +			nctrls += cfg->coded_fmts[i].ctrls->num_ctrls;
>>   
>>   	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
>>   
>> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
>> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability)) {
>> -			ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
>> +	for (i = 0; i < cfg->coded_fmts_num; i++) {
>> +		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability)) {
>> +			ret = rkvdec_add_ctrls(ctx, cfg->coded_fmts[i].ctrls);
>>   			if (ret)
>>   				goto err_free_handler;
>>   		}
>> @@ -1240,13 +1243,20 @@ static void rkvdec_watchdog_func(struct work_struct *work)
>>   	}
>>   }
>>   
>> +static const struct rkvdec_config config_rkvdec = {
>> +	.coded_fmts = rkvdec_coded_fmts,
>> +	.coded_fmts_num = ARRAY_SIZE(rkvdec_coded_fmts),
>> +};
>> +
>>   static const struct rkvdec_variant rk3288_rkvdec_variant = {
>>   	.num_regs = 68,
>> +	.config = &config_rkvdec,
>>   	.capabilities = RKVDEC_CAPABILITY_HEVC,
>>   };
>>   
>>   static const struct rkvdec_variant rk3328_rkvdec_variant = {
>>   	.num_regs = 109,
>> +	.config = &config_rkvdec,
>>   	.capabilities = RKVDEC_CAPABILITY_HEVC |
>>   			RKVDEC_CAPABILITY_H264 |
>>   			RKVDEC_CAPABILITY_VP9,
>> @@ -1255,6 +1265,7 @@ static const struct rkvdec_variant rk3328_rkvdec_variant = {
>>   
>>   static const struct rkvdec_variant rk3399_rkvdec_variant = {
>>   	.num_regs = 78,
>> +	.config = &config_rkvdec,
>>   	.capabilities = RKVDEC_CAPABILITY_HEVC |
>>   			RKVDEC_CAPABILITY_H264 |
>>   			RKVDEC_CAPABILITY_VP9,
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> index f35f6e80ea2e..3b1cc511412e 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> @@ -71,6 +71,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
>>   
>>   struct rkvdec_variant {
>>   	unsigned int num_regs;
>> +	const struct rkvdec_config *config;
>>   	unsigned int capabilities;
>>   	unsigned int quirks;
>>   };
>> @@ -113,6 +114,11 @@ struct rkvdec_coded_fmt_desc {
>>   	unsigned int capability;
>>   };
>>   
>> +struct rkvdec_config {
>> +	const struct rkvdec_coded_fmt_desc *coded_fmts;
>> +	size_t coded_fmts_num;
>> +};
> Do we really need a separate config struct? This chould/should me merged
> with the variant struct.
>
> Using a two layer variant/config mostly seem to complicate things based
> on an initial review.

I've been wondering about that and decided to go this way because 
multiple variants could use a common config and this makes less copy/paste.

But I think you are right, it does complicate things unnecessarily, I'd 
rather see all variants with all their parameters directly. I'll change 
that :)

> Regards,
> Jonas
>
>> +
>>   struct rkvdec_dev {
>>   	struct v4l2_device v4l2_dev;
>>   	struct media_device mdev;
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

