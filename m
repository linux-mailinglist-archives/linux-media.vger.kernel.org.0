Return-Path: <linux-media+bounces-66162-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZJXWGG3BRGp00QoAu9opvQ
	(envelope-from <linux-media+bounces-66162-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 09:27:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A55656EAA12
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 09:27:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="fp1/dCNA";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66162-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66162-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF444305652E
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 07:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA323B8BD8;
	Wed,  1 Jul 2026 07:25:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F45F386C24;
	Wed,  1 Jul 2026 07:25:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890717; cv=none; b=Uqcma6R4wO8CO2HjpSpdnK7qmMiLlln3HI7TeEfDqjiKl8Ik1/dp8gdSL5iMkBiAeYLOz8pJthknfzKdlDi8Y93yQs6TsAsJYuLDX1RJ7LVF1ANCqHcrXDdKbcfyLh89IzXX2RMwQc2pGVCEe1rQZmHkX5GV1d9IpUrPLadeSOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890717; c=relaxed/simple;
	bh=+ufJvxZgZDFPdQo3hb4/7dMPs1csoec+xF9tmmfpo84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g30ute2w+qGcR1RdnhBem0ovddcP+f9BAKZDvpLOYhTXDdqLsxcMOLbrk/jpbwBGDlrq0g7olp5dbtpk2NmiXnl7NWBqOiAEv6EsYJeXz6IFPAo8+byesgPERWSDn5uweYbb2tfd3Nhp8RZKVHdd6Piz9oOGCslh+DN4Io8sLIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fp1/dCNA; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (mob-5-90-48-115.net.vodafone.it [5.90.48.115])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E007E91;
	Wed,  1 Jul 2026 09:24:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782890669;
	bh=+ufJvxZgZDFPdQo3hb4/7dMPs1csoec+xF9tmmfpo84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fp1/dCNApYTJnSu7WmZCi8HAzgMvG1llURp7Gjq34XLKpPA4GJkd9+XuzOsdbw0yD
	 c9sv6B09uzTQCsW7vk7rmNyuhlyHm5Xdr9MVD8cYIQ9L47vWGJOXrBOE+p+XlU/jdv
	 aqz9qnv355LkWRxHSTj92WbD/gE1e/WneehrVVYo=
Date: Wed, 1 Jul 2026 09:25:09 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Carlier <devnexen@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Fix clock leak on reset deassert failure
Message-ID: <akTAgKuI0CvMy1t-@zed>
References: <20260609113747.39592-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609113747.39592-1-devnexen@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devnexen@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66162-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,zed:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A55656EAA12

Hi David

On Tue, Jun 09, 2026 at 12:37:47PM +0100, David Carlier wrote:
> __mali_c55_power_on() enables the clocks before deasserting the resets,
> but bails out on a deassert failure without disabling them again. Both
> callers treat a failed power-on as already cleaned up, so the clocks are
> left enabled.
>
> Disable them on the error path.
>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")

Fixes need to Cc stable

> Signed-off-by: David Carlier <devnexen@gmail.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Could you please Cc: stable@vger.kernel.org on a new version so the
patch hits the stable list as well ?

Thanks
   j

> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index ee4a42674..fb81141d1 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -699,6 +699,8 @@ static int __mali_c55_power_on(struct mali_c55 *mali_c55)
>  					  mali_c55->resets);
>  	if (ret) {
>  		dev_err(mali_c55->dev, "failed to deassert resets\n");
> +		clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks),
> +					   mali_c55->clks);
>  		return ret;
>  	}
>
> --
> 2.53.0
>
>

