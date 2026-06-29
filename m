Return-Path: <linux-media+bounces-65888-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uamBMnNDQmof3AkAu9opvQ
	(envelope-from <linux-media+bounces-65888-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:05:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C276D8A3C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:05:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=svUErhWe;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65888-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65888-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34C28303EC20
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B95A3B8BA5;
	Mon, 29 Jun 2026 09:57:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96F23B7765;
	Mon, 29 Jun 2026 09:57:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727057; cv=none; b=uc/BlbXTHJA7z8ovSN3gdvFFoAV7lAuMewsvgRuYlZJ5DhfziAw2eA/GJYwm6Bv8QrIWqAjmLYO93Qrhg3OSFDrJL7CgceUJ6mVSfgTiSjq76dlOhuukeSC8ieOktfD0SdlvNzYvqs4KVNDevA7CAp07yE9wf1rqHs7R5W2XOaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727057; c=relaxed/simple;
	bh=IoJH0/1yFzEehaIEL7iQg5e0KZMX75B6+nv40qSzahk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJfQtpp/x8hthMZA/76Qs1G47I7WhCG9JN+2fMCTlU/+lrXV7NMtw0Thw+zz4yuWsFfWsFURgBdQmMf6c9vhZD2SmcKq21KumEB2W2aiBWNm5xxDUI+wkQbl5nKP6X2RTkFKLip8HzlxSNCdlhQRn3+w4t32iu6CBhK0Ae1DZOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=svUErhWe; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B38B434;
	Mon, 29 Jun 2026 11:56:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782727010;
	bh=IoJH0/1yFzEehaIEL7iQg5e0KZMX75B6+nv40qSzahk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=svUErhWekOHxAvMKz4xuzY8hXVDApOEmMhSI4QKBvGyhmEZcJSVNRny4JE9yGFdWI
	 ingwCZpAQi22KrxYBdIyzhmcsemp/b0m8IDrZAoeswxJldK/KojKueeSFn2/fR1ymP
	 tFJbFWVHOhdLobbkBVHerwEZdF2IwIY3xBtKugTo=
Date: Mon, 29 Jun 2026 12:57:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nayden.Kanchev@arm.com, Konstantin Babin <Konstantin.Babin@arm.com>,
	Anthony McGivern <anthony.mcgivern@arm.com>,
	vincenzo.frascino@arm.com, linus.walleij@arm.com,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 2/4] media: mali-c55: Implement CCM block validation
Message-ID: <20260629095732.GC3054459@killaraus.ideasonboard.com>
References: <20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com>
 <20260627-mali-c55-ccm-gamma-v3-2-113584c05174@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260627-mali-c55-ccm-gamma-v3-2-113584c05174@ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65888-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:vincenzo.frascino@arm.com,m:linus.walleij@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27C276D8A3C

Hi Jacopo,

Thank you for the patch.

On Sat, Jun 27, 2026 at 04:29:14PM +0200, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> Implement validation of CCM block parameters.
> 
> CCM coefficients are expressed as 13 bits signed Q4.8 format and their
> raw value cannot be higher than 8191 (BIT(13) - 1).
> 
> CCM gains are expressed as unsigned 12 bits Q4.8 format and their raw
> value cannot be higher than 4095 (BIT(12) - 1).
> 
> CCM offsets are 12 bits unsigned integers and their value cannot be
> higher than 4095 (BIT(12) - 1).
> 
> Validate the parameters provided by userspace using the .block_validate
> callback of struct v4l2_isp_params_block_type_info.

I don't think this is needed.

We need to validate parameters that can cause the ISP to malfunction in
ways that requires a system reset, or in ways that cause malfunction of
other system components (e.g. buffer overflows, memory bus lock ups,
...). The rest doesn't need to be validated.

If you want to be cautious, you can just mask the value when writing to
registers, which I think you're doing in patch 1/4.

> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> ---
> v3:
> - new patch
> ---
>  .../media/platform/arm/mali-c55/mali-c55-params.c  | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> index 0da5215c52c3..333e66ee3923 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> @@ -477,6 +477,41 @@ static const mali_c55_params_handler mali_c55_params_handlers[] = {
>  	[MALI_C55_PARAM_BLOCK_CCM] = &mali_c55_params_ccm,
>  };
>  
> +static int mali_c55_ccm_validate(struct device *dev,
> +				 const struct v4l2_isp_block_header *block)
> +{
> +	const struct mali_c55_params_ccm *ccm =
> +		(const struct mali_c55_params_ccm *)(block);
> +
> +	for (unsigned int i = 0; i < 3; i++) {
> +
> +		for (unsigned int j = 0; j < 3; j++) {
> +			/* Coefficients are 13 bits signed Q4.8. */
> +			if (ccm->coeffs[i][j] > 8191) {
> +				dev_dbg(dev, "Invalid ccm coefficient %u\n",
> +					ccm->coeffs[i][j]);
> +				return -EINVAL;
> +			}
> +		}
> +
> +		/* Gains are 12 bits unsigned Q4.8. */
> +		if (ccm->gains[i] > 4095) {
> +			dev_dbg(dev, "Invalid ccm gain %u\n",
> +				ccm->gains[i]);
> +			return -EINVAL;
> +		}
> +
> +		/* Offsets are 12 bits unsigned integers. */
> +		if (ccm->offs[i] > 4095) {
> +			dev_dbg(dev, "Invalid ccm offset %u\n",
> +				ccm->offs[i]);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_isp_params_block_type_info
>  mali_c55_params_block_types_info[] = {
>  	[MALI_C55_PARAM_BLOCK_SENSOR_OFFS] = {
> @@ -514,6 +549,7 @@ mali_c55_params_block_types_info[] = {
>  	},
>  	[MALI_C55_PARAM_BLOCK_CCM] = {
>  		.size = sizeof(struct mali_c55_params_ccm),
> +		.block_validate = mali_c55_ccm_validate,
>  	},
>  };
>  

-- 
Regards,

Laurent Pinchart

