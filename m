Return-Path: <linux-media+bounces-49032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0604CC9D04
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 00:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF4783015002
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 23:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18578330646;
	Wed, 17 Dec 2025 23:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="j2YNT+ks"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C6115B971
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 23:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766014655; cv=none; b=Y6b/WpGoofmabcpiqXusX/MJdKu3BmFxKB3QoEnF4CIGOf60hyp9yBKE6nCdC5nUG86ImOFScqHobo6xznulEvocFZ1wYVbuFf06d7wCORieoLeg9QSCF74f3rZs81l8ZB4UdoVz3VmrTX3hhnDeHf1zfjDAUTxDEZVKWgH6yh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766014655; c=relaxed/simple;
	bh=cNYBM8bnzuIwDFecD2aH/TQtDyTWHlZc9ZRMqAPJni8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSr8wFRgxNOfbBkFM26h40MV7eGVUIaozrW4Oklb8GHzopM0NLN5D3fh4JMW4YW2qEG9gPDILWOL+VPTB6VuURRYq9fRLGJTSgwDKWn0LZx4CdFZiWJW8nKXi0wSme64LwN13MzW2l9mz4JX957T8XpvJEectOgZeYKPD9k3r8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=j2YNT+ks; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1766014653;
 bh=9V+YJ4gG6ljXsDx4ZRidny7LTj0Q5gQ27k2c7thZUTw=;
 b=j2YNT+ksGXr7QpEPr6ryFKPDfrGyaAog/Lx9yRWcCNGetBzvFR/0d5/Y8CoQWsbAeRKWewwqy
 Kj3dSR39u2gbWEsUImAZQaGYNQxFlUA64vWwxbrvYIvWD/aJInPvLNBqKF5q7kR1TQEbpYqZx1B
 4avKasrnGyojDMT6Aovy07WJa4uQaVMZwswfsWtUX+iQQg51sJl+7XxQcPQbJaLT3D7ezsiwl7+
 qJPTIiTpsvBZyV23BCXIRIjeCJDdJPPF8EzlAAZl7cq4KIEfhRPcgXbzti4UYh7BRg470u0xVw+
 0jSOH5OMnDorhEq4MGGeCpZ2j9MRv4oYlgsc8ClgzHew==
X-Forward-Email-ID: 69433eb547898a7fd2fef4db
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.0.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <47729359-6eb4-494d-9e21-4a3c34cba324@kwiboo.se>
Date: Thu, 18 Dec 2025 00:37:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/17] media: rkvdec: Add variant specific coded
 formats list
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>,
 Hans de Goede <hansg@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Pavan Bobba <opensource206@gmail.com>,
 James Cowgill <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Diederik de Haas <didi.debian@cknow.org>,
 linux-kernel@vger.kernel.org
References: <20251217174059.1341784-1-detlev.casanova@collabora.com>
 <20251217174059.1341784-10-detlev.casanova@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20251217174059.1341784-10-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Detlev,

On 12/17/2025 6:40 PM, Detlev Casanova wrote:
> Prepare for adding new variants of the decoder and support specific
> formats and format ops per variant.
> 
> Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 35 ++++++++++++-------
>  .../media/platform/rockchip/rkvdec/rkvdec.h   |  2 ++
>  2 files changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index 776149f871b0..968982f6e62c 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -373,15 +373,16 @@ static bool rkvdec_is_capable(struct rkvdec_ctx *ctx, unsigned int capability)
>  static const struct rkvdec_coded_fmt_desc *
>  rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
>  {
> +	const struct rkvdec_variant *variant = ctx->dev->variant;
>  	int fmt_idx = -1;
>  	unsigned int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (!rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
> +	for (i = 0; i < variant->num_coded_fmts; i++) {
> +		if (!rkvdec_is_capable(ctx, variant->coded_fmts[i].capability))
>  			continue;
>  		fmt_idx++;
>  		if (index == fmt_idx)
> -			return &rkvdec_coded_fmts[i];
> +			return &variant->coded_fmts[i];
>  	}
>  
>  	return NULL;
> @@ -390,12 +391,13 @@ rkvdec_enum_coded_fmt_desc(struct rkvdec_ctx *ctx, int index)
>  static const struct rkvdec_coded_fmt_desc *
>  rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
>  {
> +	const struct rkvdec_variant *variant = ctx->dev->variant;
>  	unsigned int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability) &&
> -		    rkvdec_coded_fmts[i].fourcc == fourcc)
> -			return &rkvdec_coded_fmts[i];
> +	for (i = 0; i < variant->num_coded_fmts; i++) {
> +		if (rkvdec_is_capable(ctx, variant->coded_fmts[i].capability) &&
> +		    variant->coded_fmts[i].fourcc == fourcc)
> +			return &variant->coded_fmts[i];
>  	}
>  
>  	return NULL;
> @@ -1014,18 +1016,19 @@ static int rkvdec_add_ctrls(struct rkvdec_ctx *ctx,
>  
>  static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
>  {
> +	const struct rkvdec_variant *variant = ctx->dev->variant;
>  	unsigned int i, nctrls = 0;
>  	int ret;
>  
> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability))
> -			nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
> +	for (i = 0; i < variant->num_coded_fmts; i++)
> +		if (rkvdec_is_capable(ctx, variant->coded_fmts[i].capability))
> +			nctrls += variant->coded_fmts[i].ctrls->num_ctrls;
>  
>  	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
>  
> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		if (rkvdec_is_capable(ctx, rkvdec_coded_fmts[i].capability)) {
> -			ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
> +	for (i = 0; i < variant->num_coded_fmts; i++) {
> +		if (rkvdec_is_capable(ctx, variant->coded_fmts[i].capability)) {
> +			ret = rkvdec_add_ctrls(ctx, variant->coded_fmts[i].ctrls);
>  			if (ret)
>  				goto err_free_handler;
>  		}
> @@ -1242,11 +1245,15 @@ static void rkvdec_watchdog_func(struct work_struct *work)
>  
>  static const struct rkvdec_variant rk3288_rkvdec_variant = {
>  	.num_regs = 68,
> +	.coded_fmts = rkvdec_coded_fmts,
> +	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
>  	.capabilities = RKVDEC_CAPABILITY_HEVC,

Looks like we could drop the capabilities flags handling now that we
use a per variant coded_fmts ?

Maybe a rk3288_coded_fmts should be added and used here, or in a cleanup
patch that drops the capabilities flag handling.

Regards,
Jonas

>  };
>  
>  static const struct rkvdec_variant rk3328_rkvdec_variant = {
>  	.num_regs = 109,
> +	.coded_fmts = rkvdec_coded_fmts,
> +	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
>  	.capabilities = RKVDEC_CAPABILITY_HEVC |
>  			RKVDEC_CAPABILITY_H264 |
>  			RKVDEC_CAPABILITY_VP9,
> @@ -1255,6 +1262,8 @@ static const struct rkvdec_variant rk3328_rkvdec_variant = {
>  
>  static const struct rkvdec_variant rk3399_rkvdec_variant = {
>  	.num_regs = 78,
> +	.coded_fmts = rkvdec_coded_fmts,
> +	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
>  	.capabilities = RKVDEC_CAPABILITY_HEVC |
>  			RKVDEC_CAPABILITY_H264 |
>  			RKVDEC_CAPABILITY_VP9,
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> index f35f6e80ea2e..aac6cba4c623 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -71,6 +71,8 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
>  
>  struct rkvdec_variant {
>  	unsigned int num_regs;
> +	const struct rkvdec_coded_fmt_desc *coded_fmts;
> +	size_t num_coded_fmts;
>  	unsigned int capabilities;
>  	unsigned int quirks;
>  };


