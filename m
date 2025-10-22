Return-Path: <linux-media+bounces-45321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2538EBFE430
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 23:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D941E3A3019
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 21:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B4F2FE560;
	Wed, 22 Oct 2025 21:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="h9ZvkPT1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA982274B2E
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 21:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761167579; cv=none; b=WrE70DEUGQJ5+OfBrDdLj3r4V42m5XLy4PlcFgN9/5pRamPfg/4krZYHTavK/IxNDGbReUyk30ZdWo54P7EfVNNgRVglVKu4icDm1DPFzoT3fDLaG8Ebk0+DN8yk6aM6mwexffhglXMxHNrE2GxCylBu9ZBiGKxl/tvPAOA4FMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761167579; c=relaxed/simple;
	bh=6zEyVc9TfxOl9vAhdx2esCYfiz2GfNKs2eJ71b1d7hk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=iq897Wi96hT95wTDyjUya9P4Dfa+uk8mtZHkIuQTfE/U+1MPWNWOJ3U7idQuz2s06BfNHdIgm5q7UhhPOMvnQcsGZx+RPi4Z//Y4rhE+1F7FssbxECrnaKsdp5RRpi93Vmnmbny3P8yj0d9qFM/XQvSQm/VvMrSWEoSFFjF5DV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=h9ZvkPT1; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: References: Cc:
 To: From: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1761167577;
 bh=6nSMEfl8EbUvS5OuwNVhVKmJc0pWnQ52k0qn0aUqwwU=;
 b=h9ZvkPT1YAgkVAeOHHjEAPYBTp2RBYV9n+137ofuwM/h7TLpMhIE+/oqdWjuNIpxRmIITUQOc
 nd5XWkQNE2IuNyoY6CLbqZ+axvqHmIlU2rpmjY8D8dDy6DX5o5AwrQE+oaz/KXgjH0EPlYAXtOV
 oQWzG3v/BCeV+xAI3ijTmMYtgtWoVb/UPLOEkB4/dfNK5mbPAi+3Q4xVBzLJ3MNJAYEUv2Dflyy
 fl/CO5ej/gYcbLb2QhSGfqU04EC7vCX2aKbKsMYW01sArQ7Mc1rygjQaRE7rv4zqpAVTH65sErN
 3qapOw+fhiB5yQqePqMm81O4NMug21FMOslTSBmYpUfQ==
X-Forward-Email-ID: 68f948d47ffe5c5c38c09150
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.3.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <0b492eb9-e9f7-4b4b-b29c-57cebd42e27d@kwiboo.se>
Date: Wed, 22 Oct 2025 23:12:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/15] media: rkvdec: Add generic configuration for
 variants
From: Jonas Karlman <jonas@kwiboo.se>
To: Detlev Casanova <detlev.casanova@collabora.com>
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
In-Reply-To: <5d2f3b9c-3d1a-47a5-93f1-1a6d6ce540f3@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/22/2025 10:57 PM, Jonas Karlman wrote:
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
>>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 37 ++++++++++++-------
>>  .../media/platform/rockchip/rkvdec/rkvdec.h   |  6 +++
>>  2 files changed, 30 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> index 776149f871b0..a7af1e3fdebd 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> @@ -373,15 +373,16 @@ static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int capability)
>>  static const struct rkvdec_coded_fmt_desc *
>>  rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
>>  {
>> +	const struct rkvdec_config *cfg = ctx->dev->variant->config;
>>  	int fmt_idx = -1;
>>  	unsigned int i;
>>  
>> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
>> -		if (!rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
>> +	for (i = 0; i < cfg->coded_fmts_num; i++) {
>> +		if (!rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability))
>>  			continue;
>>  		fmt_idx++;
>>  		if (index == fmt_idx)
>> -			return &rkvdec_coded_fmts[i];
>> +			return &cfg->coded_fmts[i];
>>  	}
>>  
>>  	return NULL;
>> @@ -390,12 +391,13 @@ rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
>>  static const struct rkvdec_coded_fmt_desc *
>>  rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
>>  {
>> +	const struct rkvdec_config *cfg = ctx->dev->variant->config;
>>  	unsigned int i;
>>  
>> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
>> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability) &&
>> -		    rkvdec_coded_fmts[i].fourcc == fourcc)
>> -			return &rkvdec_coded_fmts[i];
>> +	for (i = 0; i < cfg->coded_fmts_num; i++) {
>> +		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability) &&
>> +		    cfg->coded_fmts[i].fourcc == fourcc)
>> +			return &cfg->coded_fmts[i];
>>  	}
>>  
>>  	return NULL;
>> @@ -1014,18 +1016,19 @@ static int rkvdec_add_ctrls(struct rkvdec_ctx *ctx,
>>  
>>  static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
>>  {
>> +	const struct rkvdec_config *cfg = ctx->dev->variant->config;
>>  	unsigned int i, nctrls = 0;
>>  	int ret;
>>  
>> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
>> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
>> -			nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
>> +	for (i = 0; i < cfg->coded_fmts_num; i++)
>> +		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability))
>> +			nctrls += cfg->coded_fmts[i].ctrls->num_ctrls;
>>  
>>  	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
>>  
>> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
>> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability)) {
>> -			ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
>> +	for (i = 0; i < cfg->coded_fmts_num; i++) {
>> +		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability)) {
>> +			ret = rkvdec_add_ctrls(ctx, cfg->coded_fmts[i].ctrls);
>>  			if (ret)
>>  				goto err_free_handler;
>>  		}
>> @@ -1240,13 +1243,20 @@ static void rkvdec_watchdog_func(struct work_struct *work)
>>  	}
>>  }
>>  
>> +static const struct rkvdec_config config_rkvdec = {
>> +	.coded_fmts = rkvdec_coded_fmts,
>> +	.coded_fmts_num = ARRAY_SIZE(rkvdec_coded_fmts),
>> +};
>> +
>>  static const struct rkvdec_variant rk3288_rkvdec_variant = {
>>  	.num_regs = 68,
>> +	.config = &config_rkvdec,
>>  	.capabilities = RKVDEC_CAPABILITY_HEVC,
>>  };
>>  
>>  static const struct rkvdec_variant rk3328_rkvdec_variant = {
>>  	.num_regs = 109,
>> +	.config = &config_rkvdec,
>>  	.capabilities = RKVDEC_CAPABILITY_HEVC |
>>  			RKVDEC_CAPABILITY_H264 |
>>  			RKVDEC_CAPABILITY_VP9,
>> @@ -1255,6 +1265,7 @@ static const struct rkvdec_variant rk3328_rkvdec_variant = {
>>  
>>  static const struct rkvdec_variant rk3399_rkvdec_variant = {
>>  	.num_regs = 78,
>> +	.config = &config_rkvdec,
>>  	.capabilities = RKVDEC_CAPABILITY_HEVC |
>>  			RKVDEC_CAPABILITY_H264 |
>>  			RKVDEC_CAPABILITY_VP9,
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> index f35f6e80ea2e..3b1cc511412e 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
>> @@ -71,6 +71,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
>>  
>>  struct rkvdec_variant {
>>  	unsigned int num_regs;
>> +	const struct rkvdec_config *config;
>>  	unsigned int capabilities;
>>  	unsigned int quirks;
>>  };
>> @@ -113,6 +114,11 @@ struct rkvdec_coded_fmt_desc {
>>  	unsigned int capability;
>>  };
>>  
>> +struct rkvdec_config {
>> +	const struct rkvdec_coded_fmt_desc *coded_fmts;
>> +	size_t coded_fmts_num;

Please name this num_coded_fmts to match similar count/num variables
used by this driver and v4l2 core.

Regards,
Jonas

>> +};
> 
> Do we really need a separate config struct? This chould/should me merged
> with the variant struct.
> 
> Using a two layer variant/config mostly seem to complicate things based
> on an initial review.
> 
> Regards,
> Jonas
> 
>> +
>>  struct rkvdec_dev {
>>  	struct v4l2_device v4l2_dev;
>>  	struct media_device mdev;
> 


