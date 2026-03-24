Return-Path: <linux-media+bounces-56821-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F7TDP1LwmnvbAQAu9opvQ
	(envelope-from <linux-media+bounces-56821-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:31:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C727A304ABD
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD3AA3174C87
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 08:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F943644C2;
	Tue, 24 Mar 2026 08:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="TgcYZ0ZX"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581873659FC;
	Tue, 24 Mar 2026 08:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774340220; cv=pass; b=KKF/av0Yb9LXo6CD6KKJSm4qBCVKGQltWxfC7mXBGBMddZMpN49Hplqixv3/Y8ZTg14jYyJqFBYtkkSXoeuGeLD4BcWrSvG+HA5Hy0Aq8vXmExFUQIHwqhh03bZPs0n+QcUv+xdTjT84I9qLiPq2sV6y9aXTmkLeRgKmxughKcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774340220; c=relaxed/simple;
	bh=0wpkbe4F/Ok3Y7mzcoXIPKIA8hpL2Akszp9yhi98BRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFd/6ED/IoolyxS13qCW0Dt1LowoPd5i07PC09V+i1rOaCFj1W+LESVxBYzegDOslvHPFsf8Lt7ZqcrnY0PXFH3x7ktwP13DvpFVRfcoyhBYV2fXbK2fHeYgA/L4E6+b9QTq/JVAnlJyyyOy1bVJrCuw2Y+8QQ24t8bO+5C8Mfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=TgcYZ0ZX; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4fg2v32Nrbz49Q4j;
	Tue, 24 Mar 2026 10:16:47 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1774340208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VIRFr+vTpbz+Bqzxl07zXOH5KY7QuZAdEr+yCdmlHbU=;
	b=TgcYZ0ZXw3h6MLj2WcJ6Hfu5eh5gD/Fi1orEgGCkCwkRjZwOHtfQIv2SvUvLIMiVbokkIA
	A2pVSC7dfQkQ2c8cNRn4DI6gQt3PmrreqC5+dD5dJCkEsirL44vnR/xgEfXLcyGf4UKi5e
	oGxZ3Q3s0T81FYfFahmRabACiWRRy/dkhBdGktAK6lzzcXnwSquapbUswOfJHTZCiFhc+Y
	50JXpwe10kHyAzMwAeG6zch5RorXOHlQ/SXf0H60BoFHUF0f7P+UE9FwYfef0LuJCdSfug
	jgpijiuz/AG0LtE/btoaUqGIeakMYQ5bHiVNpVQzMrRGn5XaQOS2ILQZDBG1uA==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1774340208;
	b=D6LEbkeVJYw1cBKR8+mTzHjdw3FM3apl2w2BHODVxEYWQuCxmw6sa3DWGm0FxD4pDXQheR
	6KBtDrbxhScpHh/QGReYpuPkz+0WuhAo/ripVEwuUkTQkTSKdeWh2VyruKcCaT6munw30c
	uaBiM2hJQgYt3HUnt8j67jfTgfnGGrz9EgzJY6ApCEzcfB5MjYP4+5I2l5gBj3CkCvcBuz
	5GzIaNKKJ3pCidvjYxL73b9p+7z321mhDEIiD9T9EorqIuljRM5fnrmXqjBgXQtOBV+MIV
	oDF5Y0nN8+8OMrqWh5fKThgY9C5F1BuYpI14RgFBlXb3XP229YSS+h1GTuSoug==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1774340208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VIRFr+vTpbz+Bqzxl07zXOH5KY7QuZAdEr+yCdmlHbU=;
	b=FC2FR84W50DqmnVdifULU5w8cNSruG+U48ilxjw+UkdDmqevvz+lUoeylCJic5YeV3LD34
	6cO9JvPEOfhiktZjz9oNTw60kBmyeHLmTL6gxqJoQq7zXxVEyrr7dCVxBwi3BYI0w2OMq8
	aOGGNy382Vq2AN3/3BuXSIo7ncbWp9jQksfGe7RwqUPU207bumq2TScT1+Og7avGd0lF18
	VrSC6eq3915oPUNp4sw6bOGOrGho6NR0AQEJQXZ0f2R74vaqHyBVouWmz0BsYzivc10/Ci
	PBue0TvkHOvH2VuhjTjEDiTpHS7Uhl1uF0JTD1igLvw7IzAD2CiiAah6CgCreQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 91F4C634C51;
	Tue, 24 Mar 2026 10:16:46 +0200 (EET)
Date: Tue, 24 Mar 2026 10:16:46 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.Li@nxp.com>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	imx@lists.linux.dev
Subject: Re: [PATCH 4/6] media: synopsys: use struct dw_mipi_csi2rx_regs to
 describe register offsets
Message-ID: <acJIbvVpmDS__EEg@valkosipuli.retiisi.eu>
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <20260210-imx93-dw-csi2-v1-4-69667bb86bfa@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210-imx93-dw-csi2-v1-4-69667bb86bfa@nxp.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56821-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[iki.fi:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iki.fi:dkim,valkosipuli.retiisi.eu:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: C727A304ABD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Frank,

On Tue, Feb 10, 2026 at 12:11:11PM -0500, Frank Li wrote:
> Use struct dw_mipi_csi2rx_regs to describe register offsets and support
> new IP versions with differing register layouts.
> 
> Add rk3568_regs, matching the previous macro definitions, and pass it as
> driver data retrieved during probe.
> 
> No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 96 +++++++++++++++++-------
>  1 file changed, 69 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 4ad4e3b23448affeeaa932a706653818ba4019ba..6a2966c9e3a2eac661fa1f8610c9f021d6e26cf8 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -24,14 +24,39 @@
>  #include <media/v4l2-mc.h>
>  #include <media/v4l2-subdev.h>
>  
> -#define DW_MIPI_CSI2RX_N_LANES		0x04
> -#define DW_MIPI_CSI2RX_RESETN		0x10
> -#define DW_MIPI_CSI2RX_PHY_STATE	0x14
> -#define DW_MIPI_CSI2RX_ERR1		0x20
> -#define DW_MIPI_CSI2RX_ERR2		0x24
> -#define DW_MIPI_CSI2RX_MSK1		0x28
> -#define DW_MIPI_CSI2RX_MSK2		0x2c
> -#define DW_MIPI_CSI2RX_CONTROL		0x40
> +struct dw_mipi_csi2rx_regs {
> +	u32 n_lanes;
> +	u32 resetn;
> +	u32 phy_state;
> +	u32 err1;
> +	u32 err2;
> +	u32 msk1;
> +	u32 msk2;
> +	u32 control;
> +};
> +
> +struct dw_mipi_csi2rx_drvdata {
> +	const struct dw_mipi_csi2rx_regs *regs;
> +};
> +
> +/* Help check wrong access unexisted register at difference IP version */
> +#define DW_REG_EXIST	BIT(31)
> +#define DW_REG(x)	(DW_REG_EXIST | (x))
> +
> +static const struct dw_mipi_csi2rx_regs rk3568_regs = {
> +	.n_lanes = DW_REG(0x4),
> +	.resetn = DW_REG(0x10),
> +	.phy_state = DW_REG(0x14),
> +	.err1 = DW_REG(0x20),
> +	.err2 = DW_REG(0x24),
> +	.msk1 = DW_REG(0x28),
> +	.msk2 = DW_REG(0x2c),
> +	.control = DW_REG(0x40),
> +};
> +
> +static const struct dw_mipi_csi2rx_drvdata rk3568_drvdata = {

"drvdata" is typically used of driver's context struct related to a given
device. This is something else. How about calling it rk3568_devinfo for
instance?

> +	.regs = &rk3568_regs,
> +};
>  
>  #define SW_CPHY_EN(x)		((x) << 0)
>  #define SW_DSI_EN(x)		((x) << 4)
> @@ -74,8 +99,35 @@ struct dw_mipi_csi2rx_device {
>  
>  	enum v4l2_mbus_type bus_type;
>  	u32 lanes_num;
> +
> +	const struct dw_mipi_csi2rx_drvdata *drvdata;
>  };
>  
> +static int
> +dw_mipi_csi2rx_reg_err(struct dw_mipi_csi2rx_device *csi2, const char *name)
> +{
> +	dev_err_once(csi2->dev, "access to non-existent register: %s\n", name);
> +	return 0;
> +}
> +
> +#define __dw_reg_exist(offset) ((offset) & DW_REG_EXIST)
> +
> +#define dw_reg_exist(csi2, __name) __dw_reg_exist((csi2)->drvdata->regs->__name)

Can you use the same dw_mipi_csi2rx prefix here?

> +
> +#define dw_mipi_csi2rx_write(csi2, __name, value)		\
> +({	auto __csi2 = csi2;					\

Are there different types being used for csi2? As this there's a single
driver here I'd suppose no?

> +	u32 offset = __csi2->drvdata->regs->__name;		\
> +	__dw_reg_exist(offset) ?					\
> +		writel(value, __csi2->base_addr + (offset & ~DW_REG_EXIST)) : \
> +		dw_mipi_csi2rx_reg_err(__csi2, #__name); })
> +
> +#define dw_mipi_csi2rx_read(csi2, __name)			\
> +({	auto __csi2 = csi2;					\
> +	u32 offset = __csi2->drvdata->regs->__name;		\
> +	__dw_reg_exist(offset) ?					\
> +		readl(__csi2->base_addr + (offset & ~DW_REG_EXIST)) : \
> +		dw_mipi_csi2rx_reg_err(__csi2, #__name); })
> +
>  static const struct v4l2_mbus_framefmt default_format = {
>  	.width = 3840,
>  	.height = 2160,
> @@ -188,18 +240,6 @@ static inline struct dw_mipi_csi2rx_device *to_csi2(struct v4l2_subdev *sd)
>  	return container_of(sd, struct dw_mipi_csi2rx_device, sd);
>  }
>  
> -static inline void dw_mipi_csi2rx_write(struct dw_mipi_csi2rx_device *csi2,
> -					unsigned int addr, u32 val)
> -{
> -	writel(val, csi2->base_addr + addr);
> -}
> -
> -static inline u32 dw_mipi_csi2rx_read(struct dw_mipi_csi2rx_device *csi2,
> -				      unsigned int addr)
> -{
> -	return readl(csi2->base_addr + addr);
> -}
> -
>  static const struct dw_mipi_csi2rx_format *
>  dw_mipi_csi2rx_find_format(struct dw_mipi_csi2rx_device *csi2, u32 mbus_code)
>  {
> @@ -265,9 +305,9 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
>  	control |= SW_DATATYPE_FS(0x00) | SW_DATATYPE_FE(0x01) |
>  		   SW_DATATYPE_LS(0x02) | SW_DATATYPE_LE(0x03);
>  
> -	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_N_LANES, lanes - 1);
> -	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_CONTROL, control);
> -	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 1);
> +	dw_mipi_csi2rx_write(csi2, n_lanes, lanes - 1);
> +	dw_mipi_csi2rx_write(csi2, control, control);
> +	dw_mipi_csi2rx_write(csi2, resetn, 1);
>  
>  	return phy_power_on(csi2->phy);
>  }
> @@ -276,9 +316,9 @@ static void dw_mipi_csi2rx_stop(struct dw_mipi_csi2rx_device *csi2)
>  {
>  	phy_power_off(csi2->phy);
>  
> -	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 0);
> -	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK1, ~0);
> -	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK2, ~0);
> +	dw_mipi_csi2rx_write(csi2, resetn, 0);
> +	dw_mipi_csi2rx_write(csi2, msk1, ~0);
> +	dw_mipi_csi2rx_write(csi2, msk2, ~0);
>  }
>  
>  static const struct media_entity_operations dw_mipi_csi2rx_media_ops = {
> @@ -632,7 +672,7 @@ static void dw_mipi_csi2rx_unregister(struct dw_mipi_csi2rx_device *csi2)
>  
>  static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
>  	{
> -		.compatible = "rockchip,rk3568-mipi-csi2",
> +		.compatible = "rockchip,rk3568-mipi-csi2", .data = &rk3568_drvdata,
>  	},
>  	{}
>  };
> @@ -654,6 +694,8 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
>  	if (IS_ERR(csi2->base_addr))
>  		return PTR_ERR(csi2->base_addr);
>  
> +	csi2->drvdata = device_get_match_data(dev);
> +
>  	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
>  	if (ret < 0)
>  		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
> 

-- 
Regards,

Sakari Ailus

