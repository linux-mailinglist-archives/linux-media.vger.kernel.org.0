Return-Path: <linux-media+bounces-56424-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BtwG2aFvGkC0AIAu9opvQ
	(envelope-from <linux-media+bounces-56424-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 00:23:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FE32D4080
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 00:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 693C8300C31A
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 23:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48DD53F87E7;
	Thu, 19 Mar 2026 23:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JwUnumPq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D14237268E;
	Thu, 19 Mar 2026 23:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773962590; cv=none; b=sgXTGklJX/DvkcPKTTkpXzIFalXy4w98nVnb6lmAy5MJmbKoD1JqnNVK3DGfY/kY5tDmJ9C2tdn2bJIzlZhZlvNd0V0BsjtxdQIjIF99UMwUF8KW7ZCkIK2tbmlHhehDeQzLeUlCb+OSa9peRd4ONO+cxXRokPQNrjAX1+Z2h74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773962590; c=relaxed/simple;
	bh=O1yGe/x9bPDoJuw8MAlkhNqRUV1/8GInglDR04iBELc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGA3FjAd6wSXfu7g/hL3mCelAfhNAfYOJJcUp4bnZYAEK8+fhnqPSeI2ezuYQHWUCqD8Yr/Ublhirk5TZ/nMmtW92nAft2EOgeW18N1i5Spl1+XwGgFckUInErtb2YtyybJ9qo7T5whVbItMNY5nIdc1XQTvYURontu+tBmtWHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JwUnumPq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5CFEA2D5;
	Fri, 20 Mar 2026 00:21:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773962513;
	bh=O1yGe/x9bPDoJuw8MAlkhNqRUV1/8GInglDR04iBELc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JwUnumPqh3rA/7TrbDGF0mIB6W4NUe9XMLh8sb4leVTJaEzcWsPh5EaM00kmUEdc2
	 yDVcaD1p9XUpHYjMyruS7uybEUSlGMIrL1EPKqd9dGVruqpoxCadzJRRc94zVqWAMt
	 XoRZ8qlmuFMuCkU8reiNa8vtF3LBpS7sM4xwS/NY=
Date: Fri, 20 Mar 2026 01:23:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/5] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Message-ID: <20260319232305.GA967713@killaraus.ideasonboard.com>
References: <20251205-csi2_imx8ulp-v10-0-190cdadb20a3@nxp.com>
 <20251205-csi2_imx8ulp-v10-2-190cdadb20a3@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251205-csi2_imx8ulp-v10-2-190cdadb20a3@nxp.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56424-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,posteo.de,puri.sm,kernel.org,pengutronix.de,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.958];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 13FE32D4080
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Guoniu,

Thank you for the patch.

On Fri, Dec 05, 2025 at 05:07:44PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> Use devm_clk_bulk_get_all() helper to simplify clock handle code.
> 
> No functional changes intended.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 55 ++++++++++-----------------
>  1 file changed, 20 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index 371b4e81328c107269f89da23818ab0abd0179da..0e3a41cd35edfefc51b5631e2c36fd76e3e14d83 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -71,21 +71,6 @@ enum {
>  	ST_SUSPENDED	= 4,
>  };
>  
> -enum imx8mq_mipi_csi_clk {
> -	CSI2_CLK_CORE,
> -	CSI2_CLK_ESC,
> -	CSI2_CLK_UI,
> -	CSI2_NUM_CLKS,
> -};
> -
> -static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
> -	[CSI2_CLK_CORE] = "core",
> -	[CSI2_CLK_ESC] = "esc",
> -	[CSI2_CLK_UI] = "ui",
> -};
> -
> -#define CSI2_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
> -
>  struct imx8mq_plat_data {
>  	int (*enable)(struct csi_state *state, u32 hs_settle);
>  	void (*disable)(struct csi_state *state);
> @@ -111,7 +96,9 @@ struct csi_state {
>  	struct device *dev;
>  	const struct imx8mq_plat_data *pdata;
>  	void __iomem *regs;
> -	struct clk_bulk_data clks[CSI2_NUM_CLKS];
> +	struct clk_bulk_data *clks;
> +	struct clk *esc_clk;
> +	u32 num_clks;
>  	struct reset_control *rst;
>  	struct regulator *mipi_phy_regulator;
>  
> @@ -384,24 +371,16 @@ static void imx8mq_mipi_csi_set_params(struct csi_state *state)
>  			      CSI2RX_SEND_LEVEL);
>  }
>  
> -static int imx8mq_mipi_csi_clk_enable(struct csi_state *state)
> -{
> -	return clk_bulk_prepare_enable(CSI2_NUM_CLKS, state->clks);
> -}
> -
> -static void imx8mq_mipi_csi_clk_disable(struct csi_state *state)
> -{
> -	clk_bulk_disable_unprepare(CSI2_NUM_CLKS, state->clks);
> -}
> -
> -static int imx8mq_mipi_csi_clk_get(struct csi_state *state)
> +static struct clk *find_esc_clk(struct csi_state *state)

imx8mq_mipi_csi_find_esc_clk().

>  {
>  	unsigned int i;
>  
> -	for (i = 0; i < CSI2_NUM_CLKS; i++)
> -		state->clks[i].id = imx8mq_mipi_csi_clk_id[i];
> +	for (i = 0; i < state->num_clks; i++) {
> +		if (!strcmp(state->clks[i].id, "esc"))
> +			return state->clks[i].clk;
> +	}
>  
> -	return devm_clk_bulk_get(state->dev, CSI2_NUM_CLKS, state->clks);
> +	return ERR_PTR(-ENODEV);
>  }
>  
>  static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
> @@ -456,7 +435,7 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
>  	 * documentation recommends picking a value away from the boundaries.
>  	 * Let's pick the average.
>  	 */
> -	esc_clk_rate = clk_get_rate(state->clks[CSI2_CLK_ESC].clk);
> +	esc_clk_rate = clk_get_rate(state->esc_clk);
>  	if (!esc_clk_rate) {
>  		dev_err(state->dev, "Could not get esc clock rate.\n");
>  		return -EINVAL;
> @@ -783,7 +762,7 @@ static void imx8mq_mipi_csi_pm_suspend(struct device *dev)
>  
>  	if (state->state & ST_POWERED) {
>  		imx8mq_mipi_csi_stop_stream(state);
> -		imx8mq_mipi_csi_clk_disable(state);
> +		clk_bulk_disable_unprepare(state->num_clks, state->clks);
>  		state->state &= ~ST_POWERED;
>  	}
>  
> @@ -801,7 +780,7 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
>  
>  	if (!(state->state & ST_POWERED)) {
>  		state->state |= ST_POWERED;
> -		ret = imx8mq_mipi_csi_clk_enable(state);
> +		ret = clk_bulk_prepare_enable(state->num_clks, state->clks);
>  	}
>  	if (state->state & ST_STREAMING) {
>  		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
> @@ -1027,9 +1006,15 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
>  	if (IS_ERR(state->regs))
>  		return PTR_ERR(state->regs);
>  
> -	ret = imx8mq_mipi_csi_clk_get(state);
> +	ret = devm_clk_bulk_get_all(dev, &state->clks);
>  	if (ret < 0)
> -		return ret;
> +		return dev_err_probe(dev, ret, "Failed to get clocks\n");
> +
> +	state->num_clks = ret;
> +
> +	state->esc_clk = find_esc_clk(state);
> +	if (IS_ERR(state->esc_clk))
> +		return dev_err_probe(dev, PTR_ERR(state->esc_clk), "Couldn't find esc clock\n");

This could be line-wrapped.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I can make those small changes when applying if there's no other need to
submit a new version.

>  
>  	platform_set_drvdata(pdev, &state->sd);
>  
> 

-- 
Regards,

Laurent Pinchart

