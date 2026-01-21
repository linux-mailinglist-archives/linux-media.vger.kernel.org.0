Return-Path: <linux-media+bounces-51177-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBgVEKgzcGkSXAAAu9opvQ
	(envelope-from <linux-media+bounces-51177-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 03:02:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9503A4F737
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 03:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 92599B6CBE3
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 02:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C480130F7E3;
	Wed, 21 Jan 2026 02:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lbHTctrR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2E9220F2A;
	Wed, 21 Jan 2026 02:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768960829; cv=none; b=O4CZkvSUHs48kxtkBVT4e1yhf9/7pCe+xkRnsx05j2M6AglHB3uHNzYYzqWE+IUPKgQiDziabtZBlpSXWO/NeszGs8ANTy0NwmXHhsu8OziVV0z5upt42Dh71seY7mvPUXEZLnQwN0jY+3HySzo+guJKOMbW1HyLAL/qsu3RO0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768960829; c=relaxed/simple;
	bh=68MvO/CIzKJobttG0puN9bf9GvmXdMKv8aVGVlIIvvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCKgi3TgsoUkPaCWLtLoF831I0y9slqQ6yfiTeXW+YTTWs6HIcShzf2RKCJS8miPVD9aozp9588nArs2qNa+BwzpV6NHpBWF1+TKN4A4NxsGDtyK6z4ySSx0H7C9ub11Ce6s6CFpbMgAZU5dgNPFPaEt0xXBgC45tNjAI5+zLgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lbHTctrR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 533952D7;
	Wed, 21 Jan 2026 02:59:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768960791;
	bh=68MvO/CIzKJobttG0puN9bf9GvmXdMKv8aVGVlIIvvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lbHTctrRRnAh9VTEcZG/+Llnux+4ZuXWcxeW8KWnsHu26Fst/tDo2rnSOUnqbkrEv
	 GDEUH/JzuIH4+Aw8SQ4M3MT8Hfj2cO7c+fb/VDRG+EiXEyFIqRbXzabADBfrYMsjLY
	 XrWFka9VVRu0nmXPN2ir+FGznhynt0ConQuurRiY=
Date: Wed, 21 Jan 2026 04:00:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 2/5] media: staging: media: imx6-mipi-csi2: use
 devm_mutex_init() to simplify code
Message-ID: <20260121020021.GF403250@killaraus>
References: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
 <20260116-stage-csi2-cleanup-v2-2-a56e9cb25196@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116-stage-csi2-cleanup-v2-2-a56e9cb25196@nxp.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51177-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,pengutronix.de,kernel.org,linuxfoundation.org,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,pengutronix.de:email,ideasonboard.com:email,ideasonboard.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 9503A4F737
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Jan 16, 2026 at 11:17:57AM -0500, Frank Li wrote:
> Use devm_mutex_init() to simplify the code. No functional change.
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index 1113ea2a37f03753423164069b95c049968cc0af..4f740170d2bbf586ac0a58b5d25f8f8432e9e6a3 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -777,12 +777,14 @@ static int csi2_probe(struct platform_device *pdev)
>  	if (!csi2->base)
>  		return -ENOMEM;
>  
> -	mutex_init(&csi2->lock);
> +	ret = devm_mutex_init(&pdev->dev, &csi2->lock);
> +	if (ret)
> +		return ret;
>  
>  	ret = clk_prepare_enable(csi2->pllref_clk);
>  	if (ret) {
>  		v4l2_err(&csi2->sd, "failed to enable pllref_clk\n");
> -		goto rmmutex;
> +		return ret;
>  	}
>  
>  	ret = clk_prepare_enable(csi2->dphy_clk);
> @@ -805,8 +807,6 @@ static int csi2_probe(struct platform_device *pdev)
>  	clk_disable_unprepare(csi2->dphy_clk);
>  pllref_off:
>  	clk_disable_unprepare(csi2->pllref_clk);
> -rmmutex:
> -	mutex_destroy(&csi2->lock);
>  	return ret;
>  }
>  
> @@ -820,7 +820,6 @@ static void csi2_remove(struct platform_device *pdev)
>  	v4l2_async_unregister_subdev(sd);
>  	clk_disable_unprepare(csi2->dphy_clk);
>  	clk_disable_unprepare(csi2->pllref_clk);
> -	mutex_destroy(&csi2->lock);
>  	media_entity_cleanup(&sd->entity);
>  }
>  

-- 
Regards,

Laurent Pinchart

