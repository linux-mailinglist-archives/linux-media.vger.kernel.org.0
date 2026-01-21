Return-Path: <linux-media+bounces-51178-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAirD4s1cGl9XAAAu9opvQ
	(envelope-from <linux-media+bounces-51178-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 03:10:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E60554F8B2
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 03:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 72AC9A25D06
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 02:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AE230C61D;
	Wed, 21 Jan 2026 02:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JCf/KKFb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895113112DB;
	Wed, 21 Jan 2026 02:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768961297; cv=none; b=ZGuCLjVAHqH4EhISzeMWqNei8ryma3nh9/blJQDzH/9z9zeOmLJ3HcVsw+Fhr035ERD+4yJVCbT8M60eJ5D05GLknW1TUrvNU3Zfd5hSrKPr2/0Kb4Bf09JH+dh9HT9+2rpiUfxkI2nEGuULf345CZXLI/pYXr5zJGb9KMVRF/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768961297; c=relaxed/simple;
	bh=9c/Vyx5uG8NjX9q2/14qV8q/mnJjh/fI6PuZbTidzmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhVFDmZGjjUYtmgp6pPnJRAWHg3regL4OIk/qkPuVmu0l+C/1mCkplgMDiTQCGtLZCon42Jtw+0u3bFSq0DzGa0G/t9PZKcJ4bWh3ndCCrQqvQkPCc0Z2MGUaPUlgVbQlnDvlVmopL6jLIvw5ER6fqKi8qLJIs/1WDm1eQW9rGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JCf/KKFb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F067E2D7;
	Wed, 21 Jan 2026 03:07:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768961259;
	bh=9c/Vyx5uG8NjX9q2/14qV8q/mnJjh/fI6PuZbTidzmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JCf/KKFbao+idj7P0iGL05QQZgAsf1ct1/3HWhGXgrFaeRiK1vDIBDR5oMba8jpBN
	 GqCpRmSpWLjx5MJSfmF3OMiTAtK8G75skCftCGyegj9vGgpi6dagsGtWHh3ABj1DPO
	 Mc3dUzZLZE3G62hVpUi/1wTIg7BgK13XWve7S22g=
Date: Wed, 21 Jan 2026 04:08:08 +0200
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
Subject: Re: [PATCH RESEND v2 3/5] media: staging: media: imx6-mipi-csi2: use
 devm_clk_bulk_get_all() to fetch clocks
Message-ID: <20260121020808.GG403250@killaraus>
References: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
 <20260116-stage-csi2-cleanup-v2-3-a56e9cb25196@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116-stage-csi2-cleanup-v2-3-a56e9cb25196@nxp.com>
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
	TAGGED_FROM(0.00)[bounces-51178-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: E60554F8B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Jan 16, 2026 at 11:17:58AM -0500, Frank Li wrote:
> Use devm_clk_bulk_get_all_enabled() helper to simplify clock handling.
> 
> Defer all clock prepare and enable to csi2_start(), which previous only
> enable pix clock here.
> 
> Add clk_enable at log_status().
> 
> Do that safely because there are not register access before csi2_start().
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> changes in v2
> - add clk_bulk_prepare_enable() get at csi2_log_status()
> ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 57 +++++++++---------------------
>  1 file changed, 16 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index 4f740170d2bbf586ac0a58b5d25f8f8432e9e6a3..e1b4b7fb53131ce9515b9441d8fc420e85d3e993 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -39,9 +39,8 @@ struct csi2_dev {
>  	struct v4l2_subdev sd;
>  	struct v4l2_async_notifier notifier;
>  	struct media_pad pad[CSI2_NUM_PADS];
> -	struct clk *dphy_clk;
> -	struct clk *pllref_clk;
> -	struct clk *pix_clk; /* what is this? */
> +	struct clk_bulk_data *clks;
> +	int num_clks;
>  	void __iomem *base;
>  
>  	struct v4l2_subdev *remote;
> @@ -343,7 +342,7 @@ static int csi2_start(struct csi2_dev *csi2)
>  	unsigned int lanes;
>  	int ret;
>  
> -	ret = clk_prepare_enable(csi2->pix_clk);
> +	ret = clk_bulk_prepare_enable(csi2->num_clks, csi2->clks);
>  	if (ret)
>  		return ret;
>  
> @@ -390,7 +389,7 @@ static int csi2_start(struct csi2_dev *csi2)
>  err_assert_reset:
>  	csi2_enable(csi2, false);
>  err_disable_clk:
> -	clk_disable_unprepare(csi2->pix_clk);
> +	clk_bulk_disable_unprepare(csi2->num_clks, csi2->clks);
>  	return ret;
>  }
>  
> @@ -401,7 +400,7 @@ static void csi2_stop(struct csi2_dev *csi2)
>  	v4l2_subdev_call(csi2->src_sd, video, post_streamoff);
>  
>  	csi2_enable(csi2, false);
> -	clk_disable_unprepare(csi2->pix_clk);
> +	clk_bulk_disable_unprepare(csi2->num_clks, csi2->clks);
>  }
>  
>  /*
> @@ -570,6 +569,11 @@ static int csi2_registered(struct v4l2_subdev *sd)
>  static int csi2_log_status(struct v4l2_subdev *sd)
>  {
>  	struct csi2_dev *csi2 = sd_to_dev(sd);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(csi2->num_clks, csi2->clks);
> +	if (ret)
> +		return ret;
>  
>  	v4l2_info(sd, "-----MIPI CSI status-----\n");
>  	v4l2_info(sd, "VERSION: 0x%x\n",
> @@ -601,6 +605,8 @@ static int csi2_log_status(struct v4l2_subdev *sd)
>  	v4l2_info(sd, "PHY_TST_CTRL1: 0x%x\n",
>  		  readl(csi2->base + CSI2_PHY_TST_CTRL1));
>  
> +	clk_bulk_disable_unprepare(csi2->num_clks, csi2->clks);
> +
>  	return 0;
>  }
>  
> @@ -749,24 +755,6 @@ static int csi2_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	csi2->pllref_clk = devm_clk_get(&pdev->dev, "ref");
> -	if (IS_ERR(csi2->pllref_clk)) {
> -		v4l2_err(&csi2->sd, "failed to get pll reference clock\n");
> -		return PTR_ERR(csi2->pllref_clk);
> -	}
> -
> -	csi2->dphy_clk = devm_clk_get(&pdev->dev, "dphy");
> -	if (IS_ERR(csi2->dphy_clk)) {
> -		v4l2_err(&csi2->sd, "failed to get dphy clock\n");
> -		return PTR_ERR(csi2->dphy_clk);
> -	}
> -
> -	csi2->pix_clk = devm_clk_get(&pdev->dev, "pix");
> -	if (IS_ERR(csi2->pix_clk)) {
> -		v4l2_err(&csi2->sd, "failed to get pixel clock\n");
> -		return PTR_ERR(csi2->pix_clk);
> -	}
> -
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!res) {
>  		v4l2_err(&csi2->sd, "failed to get platform resources\n");
> @@ -781,20 +769,12 @@ static int csi2_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = clk_prepare_enable(csi2->pllref_clk);
> -	if (ret) {
> -		v4l2_err(&csi2->sd, "failed to enable pllref_clk\n");
> -		return ret;
> -	}
> -
> -	ret = clk_prepare_enable(csi2->dphy_clk);
> -	if (ret) {
> -		v4l2_err(&csi2->sd, "failed to enable dphy_clk\n");
> -		goto pllref_off;
> -	}
> -
>  	platform_set_drvdata(pdev, &csi2->sd);
>  
> +	csi2->num_clks = devm_clk_bulk_get_all(&pdev->dev, &csi2->clks);
> +	if (csi2->num_clks < 0)
> +		return dev_err_probe(&pdev->dev, csi2->num_clks, "Failed to get clocks\n");

I'm still really not a fan of devm_clk_bulk_get_all(). I would prefer
using clk_bulk_get(). The rest looks fine, although I would have split
this patch in two, one to switch to the bulk API, and one to move
enabling/disabling of the clocks.

Ah, no, there's one clock that's already enabled at start time, so a
single patch is fine.

> +
>  	ret = csi2_async_register(csi2);
>  	if (ret)
>  		goto clean_notifier;
> @@ -804,9 +784,6 @@ static int csi2_probe(struct platform_device *pdev)
>  clean_notifier:
>  	v4l2_async_nf_unregister(&csi2->notifier);
>  	v4l2_async_nf_cleanup(&csi2->notifier);
> -	clk_disable_unprepare(csi2->dphy_clk);
> -pllref_off:
> -	clk_disable_unprepare(csi2->pllref_clk);
>  	return ret;
>  }
>  
> @@ -818,8 +795,6 @@ static void csi2_remove(struct platform_device *pdev)
>  	v4l2_async_nf_unregister(&csi2->notifier);
>  	v4l2_async_nf_cleanup(&csi2->notifier);
>  	v4l2_async_unregister_subdev(sd);
> -	clk_disable_unprepare(csi2->dphy_clk);
> -	clk_disable_unprepare(csi2->pllref_clk);
>  	media_entity_cleanup(&sd->entity);
>  }
>  

-- 
Regards,

Laurent Pinchart

