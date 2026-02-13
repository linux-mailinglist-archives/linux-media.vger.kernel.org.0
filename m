Return-Path: <linux-media+bounces-52717-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEUxHI77jmljGwEAu9opvQ
	(envelope-from <linux-media+bounces-52717-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 11:23:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA0D135030
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 11:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A4D4305023C
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 10:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6945E350A27;
	Fri, 13 Feb 2026 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="E07HSzJZ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351E5335543;
	Fri, 13 Feb 2026 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770978177; cv=none; b=GJqfHYVHGvNGGuHijsKqz6RScvKpkSkZGPs7ffS3xhnXrUoB+eZU5O9mcVdA/eIeUwtsFgu34xL5hYGtAYIrXAYGuklDYTyLD8yoJdE42k8XZPGez7QL8BPmfjPC1TzRPbxja9TW0UEBlAWXetjQA2NLSbnegEte5qDhJYXHf9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770978177; c=relaxed/simple;
	bh=Z0fTwmaTjvJNrz/Gt0ZUo6wcx97uwvHxFeAAaxaBFzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8qq1uqVS5iLjhRgzbagVtK/JLUtgiCYM9ZwLnimrkRp9wcMDGu1/Q7YVKa8hjspQFWXk8zmA/zKuPC6E9nvtBlm9+bh3j/w9WqR0qe3oHUb+YhMMtUYeiSpBXn7yiqtLEyz7byXvvRD+XU/8VcyT5t2EOQpn4LihZuphcEyovY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=E07HSzJZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770978173;
	bh=Z0fTwmaTjvJNrz/Gt0ZUo6wcx97uwvHxFeAAaxaBFzs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E07HSzJZ7yBd3MFz7f70B7cfN6CbRLT/b4jd1X1zFENR/RuYNbm7HBtp5gcQwfUYz
	 Z1pO8IJI5mi3sOFPDUWLDpM9o0p86pUHFF4fywh3AkNOFACTzjHEbm4tR4aAIdBhZQ
	 eM4CDrm4Z1iSCMkeWyfMNMjoZwzn+3HCzO61OPsThpC3fMJCYvczcQfa/poEUTSgyU
	 aFwMy+fALMbCe1rN4XHV9xtmG477Z5tn+VqP3/m/vjtoagrDd6P9pxUybfZsiphuTj
	 5uXOLwD4X6FgXmM1dTb4eiFKKNlUoiqiCSeVgorxsPcY9tDJsPECFH1G3im6ueqfXT
	 SUG+X7KnSRvzA==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB9F017E12E2;
	Fri, 13 Feb 2026 11:22:52 +0100 (CET)
Message-ID: <9e14d605-9419-441e-a554-432d435191b3@collabora.com>
Date: Fri, 13 Feb 2026 11:22:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] media: synopsys: add i.MX93 support
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <20260210-imx93-dw-csi2-v1-6-69667bb86bfa@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260210-imx93-dw-csi2-v1-6-69667bb86bfa@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52717-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CDA0D135030
X-Rspamd-Action: no action

Hi Frank,

On 2/10/26 18:11, Frank Li wrote:
> The i.MX93 uses a newer version of the DW CSI-2 controller with a changed
> register layout and an added IPI block.

What does this IPI block do? Please add a short description.

> 
> The reset flow also differs, so add the .assert_reset(), .deassert_reset(),
> and .ipi_enable() callbacks to support it.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 163 ++++++++++++++++++++++-
>  1 file changed, 156 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index 6a2966c9e3a2eac661fa1f8610c9f021d6e26cf8..5dc55b59d6aeed4b6cb207c8e2ebe0fb3c462644 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -33,10 +33,24 @@ struct dw_mipi_csi2rx_regs {
>  	u32 msk1;
>  	u32 msk2;
>  	u32 control;
> +	u32 phy_tst_ctrl0;
> +	u32 phy_tst_ctrl1;
> +	u32 dphy_rstz;
> +	u32 phy_shutdownz;
> +	u32 ipi_softrstn;
> +	u32 ipi_datatype;
> +	u32 ipi_vcid;
> +	u32 ipi_mode;
> +	u32 ipi_mem_flush;
>  };
>  
> +struct dw_mipi_csi2rx_device;
> +
>  struct dw_mipi_csi2rx_drvdata {
>  	const struct dw_mipi_csi2rx_regs *regs;
> +	void (*dphy_assert_reset)(struct dw_mipi_csi2rx_device *csi2);
> +	void (*dphy_deassert_reset)(struct dw_mipi_csi2rx_device *csi2);
> +	void (*ipi_enable)(struct dw_mipi_csi2rx_device *csi2);
>  };
>  
>  /* Help check wrong access unexisted register at difference IP version */
> @@ -54,6 +68,21 @@ static const struct dw_mipi_csi2rx_regs rk3568_regs = {
>  	.control = DW_REG(0x40),
>  };
>  
> +static const struct dw_mipi_csi2rx_regs imx93_regs = {
> +	.n_lanes = DW_REG(0x4),
> +	.resetn = DW_REG(0x8),
> +	.phy_shutdownz = DW_REG(0x40),
> +	.dphy_rstz = DW_REG(0x44),
> +	.phy_state = DW_REG(0x48),
> +	.phy_tst_ctrl0 = DW_REG(0x50),
> +	.phy_tst_ctrl1 = DW_REG(0x54),
> +	.ipi_mode = DW_REG(0x80),
> +	.ipi_vcid = DW_REG(0x84),
> +	.ipi_datatype = DW_REG(0x88),
> +	.ipi_mem_flush = DW_REG(0x8c),
> +	.ipi_softrstn = DW_REG(0xa0),
> +};
> +
>  static const struct dw_mipi_csi2rx_drvdata rk3568_drvdata = {
>  	.regs = &rk3568_regs,
>  };
> @@ -302,14 +331,30 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
>  		return -EINVAL;
>  	}
>  
> +	dw_mipi_csi2rx_write(csi2, resetn, 0);
> +
> +	if (csi2->drvdata->dphy_assert_reset)
> +		csi2->drvdata->dphy_assert_reset(csi2);
> +
>  	control |= SW_DATATYPE_FS(0x00) | SW_DATATYPE_FE(0x01) |
>  		   SW_DATATYPE_LS(0x02) | SW_DATATYPE_LE(0x03);
>  
>  	dw_mipi_csi2rx_write(csi2, n_lanes, lanes - 1);
> -	dw_mipi_csi2rx_write(csi2, control, control);
> +
> +	if (dw_reg_exist(csi2, control))

Why? The _write functions check for existance anyway, right?

> +		dw_mipi_csi2rx_write(csi2, control, control);
> +
> +	ret = phy_power_on(csi2->phy);

Does it make sense to continue if phy_power_on fails? Check the return
value and return early.

> +
> +	if (csi2->drvdata->dphy_deassert_reset)
> +		csi2->drvdata->dphy_deassert_reset(csi2);
> +
>  	dw_mipi_csi2rx_write(csi2, resetn, 1);
>  
> -	return phy_power_on(csi2->phy);
> +	if (csi2->drvdata->ipi_enable)
> +		csi2->drvdata->ipi_enable(csi2);
> +
> +	return ret;
>  }
>  
>  static void dw_mipi_csi2rx_stop(struct dw_mipi_csi2rx_device *csi2)
> @@ -317,8 +362,12 @@ static void dw_mipi_csi2rx_stop(struct dw_mipi_csi2rx_device *csi2)
>  	phy_power_off(csi2->phy);
>  
>  	dw_mipi_csi2rx_write(csi2, resetn, 0);
> -	dw_mipi_csi2rx_write(csi2, msk1, ~0);
> -	dw_mipi_csi2rx_write(csi2, msk2, ~0);
> +
> +	if (dw_reg_exist(csi2, msk1))
> +		dw_mipi_csi2rx_write(csi2, msk1, ~0);
> +
> +	if (dw_reg_exist(csi2, msk2))
> +		dw_mipi_csi2rx_write(csi2, msk2, ~0);

Again, the dw_reg_exist checks seem superfluous.

>  }
>  
>  static const struct media_entity_operations dw_mipi_csi2rx_media_ops = {
> @@ -670,10 +719,110 @@ static void dw_mipi_csi2rx_unregister(struct dw_mipi_csi2rx_device *csi2)
>  	v4l2_async_nf_cleanup(&csi2->notifier);
>  }
>  
> +#define DPHY_TEST_CTRL0_TEST_CLR	BIT(0)

All #defines at the top, as already pointed out before. Holds for all
other bit defines, too.

> +
> +static void imx93_csi2rx_dphy_assert_reset(struct dw_mipi_csi2rx_device *csi2)
> +{
> +	u32 val;
> +
> +	/* Release synopsis DPHY test codes from reset */
> +	dw_mipi_csi2rx_write(csi2, dphy_rstz, 0);
> +	dw_mipi_csi2rx_write(csi2, phy_shutdownz, 0);
> +
> +	val = dw_mipi_csi2rx_read(csi2, phy_tst_ctrl0);
> +	val &= ~DPHY_TEST_CTRL0_TEST_CLR;
> +	dw_mipi_csi2rx_write(csi2, phy_tst_ctrl0, val);
> +
> +	/*
> +	 * ndelay is not necessary have MMIO operation, need dummy read to make
> +	 * sure above write reach target.
> +	 */
> +	val = dw_mipi_csi2rx_read(csi2, phy_tst_ctrl0);
> +	/* Wait for at least 15ns */
> +	ndelay(15);
> +	val |= DPHY_TEST_CTRL0_TEST_CLR;
> +	dw_mipi_csi2rx_write(csi2, phy_tst_ctrl0, val);
> +}
> +
> +#define CSI2RX_DPHY_STOPSTATE_CLK_LANE BIT(16)
> +
> +static void imx93_csi2rx_dphy_deassert_reset(struct dw_mipi_csi2rx_device *csi2)
> +{
> +	/* Release PHY from reset */
> +	dw_mipi_csi2rx_write(csi2, phy_shutdownz, 0x1);
> +	/*
> +	 * ndelay is not necessary have MMIO operation, need dummy read to make
> +	 * sure above write reach target.
> +	 */
> +	dw_mipi_csi2rx_read(csi2, phy_shutdownz);
> +	ndelay(5);
> +	dw_mipi_csi2rx_write(csi2, dphy_rstz, 0x1);
> +
> +	dw_mipi_csi2rx_read(csi2, dphy_rstz);
> +	ndelay(5);
> +}
> +
> +#define IPI_VCID_VC(x)			FIELD_PREP(GENMASK(1, 0), (x))
> +#define IPI_VCID_VC_0_1(x)		FIELD_PREP(GENMASK(3, 2), (x))
> +#define IPI_VCID_VC_2			BIT(4)
> +
> +#define IPI_DATA_TYPE_DT(x)		FIELD_PREP(GENMASK(5, 0), (x))
> +#define IPI_DATA_TYPE_EMB_DATA_EN	BIT(8)
> +
> +#define IPI_MODE_CONTROLLER		BIT(1)
> +#define IPI_MODE_COLOR_MODE16		BIT(8)
> +#define IPI_MODE_CUT_THROUGH		BIT(16)
> +#define IPI_MODE_ENABLE			BIT(24)
> +
> +#define IPI_MEM_FLUSH_AUTO		BIT(8)
> +
> +static void imx93_csi2rx_dphy_ipi_enable(struct dw_mipi_csi2rx_device *csi2)
> +{
> +	int dt = csi2->formats->csi_dt;
> +	u32 val;
> +
> +	/* Do IPI soft reset */
> +	dw_mipi_csi2rx_write(csi2, ipi_softrstn, 0x0);
> +	dw_mipi_csi2rx_write(csi2, ipi_softrstn, 0x1);
> +
> +	/* Select virtual channel and data type to be processed by IPI */
> +	val = IPI_DATA_TYPE_DT(dt);
> +	dw_mipi_csi2rx_write(csi2, ipi_datatype, val);
> +
> +	/* Set virtual channel 0 as default */
> +	val  = IPI_VCID_VC(0);
> +	dw_mipi_csi2rx_write(csi2, ipi_vcid, val);
> +
> +	/*
> +	 * Select IPI camera timing mode and allow the pixel stream
> +	 * to be non-continuous when pixel interface FIFO is empty
> +	 */
> +	val = dw_mipi_csi2rx_read(csi2, ipi_mode);
> +	val &= ~IPI_MODE_CONTROLLER;
> +	val &= ~IPI_MODE_COLOR_MODE16;
> +	val |= IPI_MODE_CUT_THROUGH;
> +	dw_mipi_csi2rx_write(csi2, ipi_mode, val);
> +
> +	/* Memory is automatically flushed at each Frame Start */
> +	val = IPI_MEM_FLUSH_AUTO;
> +	dw_mipi_csi2rx_write(csi2, ipi_mem_flush, val);
> +
> +	/* Enable IPI */
> +	val = dw_mipi_csi2rx_read(csi2, ipi_mode);
> +	val |= IPI_MODE_ENABLE;
> +	dw_mipi_csi2rx_write(csi2, ipi_mode, val);
> +}
> +
> +static const struct dw_mipi_csi2rx_drvdata imx93_drvdata = {
> +	.regs = &imx93_regs,
> +	.dphy_assert_reset = imx93_csi2rx_dphy_assert_reset,
> +	.dphy_deassert_reset = imx93_csi2rx_dphy_deassert_reset,
> +	.ipi_enable = imx93_csi2rx_dphy_ipi_enable,
> +};
> +
>  static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
> -	{
> -		.compatible = "rockchip,rk3568-mipi-csi2", .data = &rk3568_drvdata,
> -	},
> +	{ .compatible = "fsl,imx93-mipi-csi2", .data = &imx93_drvdata, },

As pointed out before,
	{
		.compatible = "fsl,imx93-mipi-csi2",
		.data = &imx93_drvdata,
	},

Best regards,
Michael

> +	{ .compatible = "rockchip,rk3568-mipi-csi2", .data = &rk3568_drvdata, },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dw_mipi_csi2rx_of_match);
> 


