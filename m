Return-Path: <linux-media+bounces-62494-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAZnD6sBD2pfEAYAu9opvQ
	(envelope-from <linux-media+bounces-62494-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:59:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CD15A546C
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9DE5306F1C6
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 12:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816243D9022;
	Thu, 21 May 2026 12:49:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D454D352015
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 12:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367746; cv=none; b=tV1pC64O8/RjC/e67gUNcbUZTqEiCEnd6u/QT7JjfFD/T4HM0LHHDTtwhBYp4mW90uNsOJgVIu9wBxQctzcTPmnfDPoiJrPyRHN3bH6OBDb8Cj6UyZjsWsvB1lxy95USBCu0U739W3vWn4eGLcRd0Bc9MIABUKNtMEemSouHYik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367746; c=relaxed/simple;
	bh=BpmN9LMHKgP2OPqTXmAJ2fGr4E0OIOJKF7KhB8JeM34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdwcO5AFGih/Ja5yx1GcokAMp2IUxSV9WmQCSuFJMgIEnxGSty4lhw1M8z+FQlXdzZdvk5tiJFokdlYhoUwNGbP9kQ9IvZYbklZM9FWHAry/3PSxPT1bEAOgfvcJbPqvmOyD3b2P7nh/rHwREaNofm9EjjW65urNA/sMk2tcVSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ2pZ-0001I8-Dh; Thu, 21 May 2026 14:48:53 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ2pY-0016dZ-1K;
	Thu, 21 May 2026 14:48:52 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ2pY-00000004ViT-3Xge;
	Thu, 21 May 2026 14:48:52 +0200
Date: Thu, 21 May 2026 14:48:52 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>
Cc: Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	nicolas@ndufresne.ca, sebastian.reichel@collabora.com,
	p.zabel@pengutronix.de,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v7 07/28] media: rockchip: rga: use clk_bulk api
Message-ID: <ag7_NEcMObnGz-ml@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	nicolas@ndufresne.ca, sebastian.reichel@collabora.com,
	p.zabel@pengutronix.de,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
 <20260521-spu-rga3-v7-7-3f33e8c7145f@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521-spu-rga3-v7-7-3f33e8c7145f@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-62494-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.tretter@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Queue-Id: F0CD15A546C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 00:44:12 +0200, Sven Püschel wrote:
> Use the clk_bulk API to avoid code duplication for each of the three
> clocks.
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 65 ++++---------------------------
>  drivers/media/platform/rockchip/rga/rga.h |  6 +--
>  2 files changed, 11 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index fea63b94c5f3d..4e710a050cb7c 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -698,48 +698,10 @@ static const struct video_device rga_videodev = {
>  	.device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
>  };
>  
> -static int rga_enable_clocks(struct rockchip_rga *rga)
> -{
> -	int ret;
> -
> -	ret = clk_prepare_enable(rga->sclk);
> -	if (ret) {
> -		dev_err(rga->dev, "Cannot enable rga sclk: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = clk_prepare_enable(rga->aclk);
> -	if (ret) {
> -		dev_err(rga->dev, "Cannot enable rga aclk: %d\n", ret);
> -		goto err_disable_sclk;
> -	}
> -
> -	ret = clk_prepare_enable(rga->hclk);
> -	if (ret) {
> -		dev_err(rga->dev, "Cannot enable rga hclk: %d\n", ret);
> -		goto err_disable_aclk;
> -	}
> -
> -	return 0;
> -
> -err_disable_aclk:
> -	clk_disable_unprepare(rga->aclk);
> -err_disable_sclk:
> -	clk_disable_unprepare(rga->sclk);
> -
> -	return ret;
> -}
> -
> -static void rga_disable_clocks(struct rockchip_rga *rga)
> -{
> -	clk_disable_unprepare(rga->sclk);
> -	clk_disable_unprepare(rga->hclk);
> -	clk_disable_unprepare(rga->aclk);
> -}
> -
>  static int rga_parse_dt(struct rockchip_rga *rga)
>  {
>  	struct reset_control *core_rst, *axi_rst, *ahb_rst;
> +	int ret;
>  
>  	core_rst = devm_reset_control_get(rga->dev, "core");
>  	if (IS_ERR(core_rst)) {
> @@ -771,23 +733,12 @@ static int rga_parse_dt(struct rockchip_rga *rga)
>  	udelay(1);
>  	reset_control_deassert(ahb_rst);
>  
> -	rga->sclk = devm_clk_get(rga->dev, "sclk");
> -	if (IS_ERR(rga->sclk)) {
> -		dev_err(rga->dev, "failed to get sclk clock\n");
> -		return PTR_ERR(rga->sclk);
> -	}
> -
> -	rga->aclk = devm_clk_get(rga->dev, "aclk");
> -	if (IS_ERR(rga->aclk)) {
> -		dev_err(rga->dev, "failed to get aclk clock\n");
> -		return PTR_ERR(rga->aclk);
> -	}
> -
> -	rga->hclk = devm_clk_get(rga->dev, "hclk");
> -	if (IS_ERR(rga->hclk)) {
> -		dev_err(rga->dev, "failed to get hclk clock\n");
> -		return PTR_ERR(rga->hclk);
> +	ret = devm_clk_bulk_get_all(rga->dev, &rga->clks);
> +	if (ret < 0) {

This changes the behavior since the call is now successful if there are
no clocks specified in the device tree. Is this an intended change?

Michael

> +		dev_err(rga->dev, "failed to get clocks\n");
> +		return ret;
>  	}
> +	rga->num_clks = ret;
>  
>  	return 0;
>  }
> @@ -935,7 +886,7 @@ static int __maybe_unused rga_runtime_suspend(struct device *dev)
>  {
>  	struct rockchip_rga *rga = dev_get_drvdata(dev);
>  
> -	rga_disable_clocks(rga);
> +	clk_bulk_disable_unprepare(rga->num_clks, rga->clks);
>  
>  	return 0;
>  }
> @@ -944,7 +895,7 @@ static int __maybe_unused rga_runtime_resume(struct device *dev)
>  {
>  	struct rockchip_rga *rga = dev_get_drvdata(dev);
>  
> -	return rga_enable_clocks(rga);
> +	return clk_bulk_prepare_enable(rga->num_clks, rga->clks);
>  }
>  
>  static const struct dev_pm_ops rga_pm = {
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
> index 72a28b120fabf..2db10acecb405 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -6,6 +6,7 @@
>  #ifndef __RGA_H__
>  #define __RGA_H__
>  
> +#include <linux/clk.h>
>  #include <linux/platform_device.h>
>  #include <media/videobuf2-v4l2.h>
>  #include <media/v4l2-ctrls.h>
> @@ -81,9 +82,8 @@ struct rockchip_rga {
>  	struct device *dev;
>  	struct regmap *grf;
>  	void __iomem *regs;
> -	struct clk *sclk;
> -	struct clk *aclk;
> -	struct clk *hclk;
> +	struct clk_bulk_data *clks;
> +	int num_clks;
>  	struct rockchip_rga_version version;
>  
>  	/* vfd lock */
> 
> -- 
> 2.54.0
> 
> 

