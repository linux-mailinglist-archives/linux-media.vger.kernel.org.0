Return-Path: <linux-media+bounces-45319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB77BFE3C4
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 22:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64E3B3A2D69
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 20:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7AE29405;
	Wed, 22 Oct 2025 20:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="g5HhySgO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967C915E8B
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 20:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761166661; cv=none; b=Q5jBVW6SglFGCCktdFpKZ0ZD/HuMQZno/fIHQgCpEVtMOt1QFkbXUM+qqAcP8dqPI63MHZFCseBDXDy107FsEBwrdKhZ8+gf9wKH77+Byfj6d8S6FiZIB27ntlNRu6IpqfeRYmiye2l+al7lzKBnhkr7Mig8Bo8UVonnpWbhH/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761166661; c=relaxed/simple;
	bh=s5zHL3JeW8tjYv9ZHT4cVhmdFxP9v5iEn7jJE/tWsl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMaKuyyMmIbQK7J9X7W7RPV/nm/Yh6dVP6YJoaWJQFRy4sL2s/EcadmrucweAY3/l7YzAJULOYT4i4g6kw9DtL3gRODGQIyw8ladE9NM7Z52Lm0so9s/Xg0JxC+H46vTeSAsqYrLlc1sBq4S0Q61jjxvcnlbbDpIr919pgKB9YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=g5HhySgO; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1761166653;
 bh=S0wz2Pp5BKXToP4WWrNmtTLcJUcbxzUiav7sBmIskes=;
 b=g5HhySgOMIRIQQ+gf8ng3KwLd8Hnbq5lJKl8omwtsClBZEWES/zKYr3ZJlElu66QVQtwnKgb+
 fboug6CMUHLJTHiD60b8p4DXEt7Xr3h9h3hiGtFkesWWaGJRt/LYzAH00TYoHVNw9D2xGdrivpN
 yrYp9JSkGEXphaC+Jx644Y5KuRpi/xQ+P3hIy8Cg2RoKa55KSVpAtVqP8u84h41f4UwXS4kg+cF
 /1+GuGmJ0wtbWX5dKCFQ1FA5WOdzOB2PCAZTJ/rfXZwJ8AlHgHgToh1GMqqet9qX1AnkJGJ6Cxf
 3JbeaVxEnSlRz7OIWS0m8HND6b7ruXf3TS5CSeGj8WLA==
X-Forward-Email-ID: 68f945387ffe5c5c38c08363
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.3.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <5d2f3b9c-3d1a-47a5-93f1-1a6d6ce540f3@kwiboo.se>
Date: Wed, 22 Oct 2025 22:57:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/15] media: rkvdec: Add generic configuration for
 variants
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
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20251022174508.284929-9-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Detlev,

On 10/22/2025 7:45 PM, Detlev Casanova wrote:
> This is to prepare for adding new versions of the decoder and
> support specific formats and ops per version.
> 
> Different rkvdec_variant instances will be able to share generic
> decoder configs.
> 
> Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 37 ++++++++++++-------
>  .../media/platform/rockchip/rkvdec/rkvdec.h   |  6 +++
>  2 files changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index 776149f871b0..a7af1e3fdebd 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -373,15 +373,16 @@ static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int capability)
>  static const struct rkvdec_coded_fmt_desc *
>  rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
>  {
> +	const struct rkvdec_config *cfg = ctx->dev->variant->config;
>  	int fmt_idx = -1;
>  	unsigned int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (!rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
> +	for (i = 0; i < cfg->coded_fmts_num; i++) {
> +		if (!rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability))
>  			continue;
>  		fmt_idx++;
>  		if (index == fmt_idx)
> -			return &rkvdec_coded_fmts[i];
> +			return &cfg->coded_fmts[i];
>  	}
>  
>  	return NULL;
> @@ -390,12 +391,13 @@ rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
>  static const struct rkvdec_coded_fmt_desc *
>  rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
>  {
> +	const struct rkvdec_config *cfg = ctx->dev->variant->config;
>  	unsigned int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability) &&
> -		    rkvdec_coded_fmts[i].fourcc == fourcc)
> -			return &rkvdec_coded_fmts[i];
> +	for (i = 0; i < cfg->coded_fmts_num; i++) {
> +		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability) &&
> +		    cfg->coded_fmts[i].fourcc == fourcc)
> +			return &cfg->coded_fmts[i];
>  	}
>  
>  	return NULL;
> @@ -1014,18 +1016,19 @@ static int rkvdec_add_ctrls(struct rkvdec_ctx *ctx,
>  
>  static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
>  {
> +	const struct rkvdec_config *cfg = ctx->dev->variant->config;
>  	unsigned int i, nctrls = 0;
>  	int ret;
>  
> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
> -			nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
> +	for (i = 0; i < cfg->coded_fmts_num; i++)
> +		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability))
> +			nctrls += cfg->coded_fmts[i].ctrls->num_ctrls;
>  
>  	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
>  
> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability)) {
> -			ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
> +	for (i = 0; i < cfg->coded_fmts_num; i++) {
> +		if (rkvdec_is_capable(ctx, cfg->coded_fmts[i].capability)) {
> +			ret = rkvdec_add_ctrls(ctx, cfg->coded_fmts[i].ctrls);
>  			if (ret)
>  				goto err_free_handler;
>  		}
> @@ -1240,13 +1243,20 @@ static void rkvdec_watchdog_func(struct work_struct *work)
>  	}
>  }
>  
> +static const struct rkvdec_config config_rkvdec = {
> +	.coded_fmts = rkvdec_coded_fmts,
> +	.coded_fmts_num = ARRAY_SIZE(rkvdec_coded_fmts),
> +};
> +
>  static const struct rkvdec_variant rk3288_rkvdec_variant = {
>  	.num_regs = 68,
> +	.config = &config_rkvdec,
>  	.capabilities = RKVDEC_CAPABILITY_HEVC,
>  };
>  
>  static const struct rkvdec_variant rk3328_rkvdec_variant = {
>  	.num_regs = 109,
> +	.config = &config_rkvdec,
>  	.capabilities = RKVDEC_CAPABILITY_HEVC |
>  			RKVDEC_CAPABILITY_H264 |
>  			RKVDEC_CAPABILITY_VP9,
> @@ -1255,6 +1265,7 @@ static const struct rkvdec_variant rk3328_rkvdec_variant = {
>  
>  static const struct rkvdec_variant rk3399_rkvdec_variant = {
>  	.num_regs = 78,
> +	.config = &config_rkvdec,
>  	.capabilities = RKVDEC_CAPABILITY_HEVC |
>  			RKVDEC_CAPABILITY_H264 |
>  			RKVDEC_CAPABILITY_VP9,
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> index f35f6e80ea2e..3b1cc511412e 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -71,6 +71,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
>  
>  struct rkvdec_variant {
>  	unsigned int num_regs;
> +	const struct rkvdec_config *config;
>  	unsigned int capabilities;
>  	unsigned int quirks;
>  };
> @@ -113,6 +114,11 @@ struct rkvdec_coded_fmt_desc {
>  	unsigned int capability;
>  };
>  
> +struct rkvdec_config {
> +	const struct rkvdec_coded_fmt_desc *coded_fmts;
> +	size_t coded_fmts_num;
> +};

Do we really need a separate config struct? This chould/should me merged
with the variant struct.

Using a two layer variant/config mostly seem to complicate things based
on an initial review.

Regards,
Jonas

> +
>  struct rkvdec_dev {
>  	struct v4l2_device v4l2_dev;
>  	struct media_device mdev;


