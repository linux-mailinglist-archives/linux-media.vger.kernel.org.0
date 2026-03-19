Return-Path: <linux-media+bounces-56392-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +D5IKxB0vGmZywIAu9opvQ
	(envelope-from <linux-media+bounces-56392-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 23:09:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B28BD2D2E02
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 23:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F44E3013C73
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 22:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C88407104;
	Thu, 19 Mar 2026 22:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V+4rAm9/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31907407105;
	Thu, 19 Mar 2026 22:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773958145; cv=none; b=Rb4HBPoS0lI+RtnL7ghi7O3OPhq33YDrGEUtBpZl2FE557YWrNd8MN+gfW5WKpt8qcKkVKy6MtW/G/87TyVvQv0SoZffj1qKU1bI2UqqV2MOfttTNJl6xLVHImCuEmsp2xjbp9lTJ0/rQuELI7sw+GTvnaMBfLtdGlhTO0E364o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773958145; c=relaxed/simple;
	bh=jq8yNxg7Yiz2NU+7p28rjZpnAu9NVY9En1FhSO5xowI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLucmu/1RmW4KvbOafqtTjH5V2UfVdbYhqB5jO3XRXxTQb6X1lEH/YLDtPKlGiGEOg3mxEJeJgOpu0p6nNfBfFjf/6b6TuSnhmT8sF/RD1ptUxZb9gTeq6vhARPoWGfpYGMrEUP9LNraRe+oEySYivQOMu18GE3NpHr4wBjp/sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V+4rAm9/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 94ACF9A6;
	Thu, 19 Mar 2026 23:07:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773958068;
	bh=jq8yNxg7Yiz2NU+7p28rjZpnAu9NVY9En1FhSO5xowI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+4rAm9/Wks6PNphwB6BAf/x2uMc5Gn6fwowKQ3v6ucXZ8ZbYpIa+AcP2i7QGdT6P
	 KNk8LvgfQDM/BMlTGOidKV+r907R5GXkiE+TXd/iZnNN8PiExVkGeuir62Eq/ETF0A
	 LVitmz37wqxKpQIf9cEq8oGko1SBUA5eLl1lkYVw=
Date: Fri, 20 Mar 2026 00:09:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-media@vger.kernel.org, linux-hardening@vger.kernel.org,
	gustavoars@kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
Message-ID: <20260319220901.GD950375@killaraus.ideasonboard.com>
References: <20260306044536.149204-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306044536.149204-1-rosenp@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56392-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,nxp.com,pengutronix.de,gmail.com,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: B28BD2D2E02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 05, 2026 at 08:45:36PM -0800, Rosen Penev wrote:
> Use a flexible arraay member to combine allocations.
> 
> It looks like pipes never gets freed anywhere. Meaning this effectively
> fixes a memory leak.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 11 ++++-------
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 16392420903a..657ffecc4d7e 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -459,25 +459,21 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
>  
>  static int mxc_isi_probe(struct platform_device *pdev)
>  {
> +	const struct mxc_isi_plat_data *pdata;
>  	struct device *dev = &pdev->dev;
>  	struct mxc_isi_dev *isi;
>  	unsigned int dma_size;
>  	unsigned int i;
>  	int ret = 0;
>  
> -	isi = devm_kzalloc(dev, sizeof(*isi), GFP_KERNEL);
> +	pdata = of_device_get_match_data(dev);
> +	isi = devm_kzalloc(dev, struct_size(isi, pipes, pdata->num_channels), GFP_KERNEL);
>  	if (!isi)
>  		return -ENOMEM;
>  
>  	isi->dev = dev;
>  	platform_set_drvdata(pdev, isi);
>  
> -	isi->pdata = of_device_get_match_data(dev);

I'd keep

	isi->pdata = pdata;

here and not below.

> -
> -	isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);

Wouldn't it be simpler to just replace this with devm_kcalloc() ?

	isi->pipes = devm_kcalloc(dev, isi->pdata->num_channels,
				  sizeof(isi->pipes[0]), GFP_KERNEL);

No other change would be needed.

> -	if (!isi->pipes)
> -		return -ENOMEM;
> -
>  	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
>  	if (isi->num_clks < 0)
>  		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
> @@ -487,6 +483,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(isi->regs),
>  				     "Failed to get ISI register map\n");
>  
> +	isi->pdata = pdata;
>  	if (isi->pdata->gasket_ops) {
>  		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
>  							      "fsl,blk-ctrl");
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 3cbd35305af0..99532efa4e41 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -286,7 +286,6 @@ struct mxc_isi_dev {
>  	struct regmap			*gasket;
>  
>  	struct mxc_isi_crossbar		crossbar;
> -	struct mxc_isi_pipe		*pipes;
>  	struct mxc_isi_m2m		m2m;
>  
>  	struct media_device		media_dev;
> @@ -294,6 +293,8 @@ struct mxc_isi_dev {
>  	struct v4l2_async_notifier	notifier;
>  
>  	struct dentry			*debugfs_root;
> +
> +	struct mxc_isi_pipe		pipes[];
>  };
>  
>  extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;

-- 
Regards,

Laurent Pinchart

