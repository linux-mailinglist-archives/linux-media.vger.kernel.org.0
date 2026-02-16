Return-Path: <linux-media+bounces-52837-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJh4GnjVkmlMywEAu9opvQ
	(envelope-from <linux-media+bounces-52837-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 09:29:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC8E141911
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 09:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 81DCC30058DC
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 08:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C093090DD;
	Mon, 16 Feb 2026 08:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RtWHVrZd"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAAE3033F9;
	Mon, 16 Feb 2026 08:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230578; cv=none; b=Vq3jYRME7QgL0+YGr87d+IHATsRtDk9/c+PnyNOaU3YScz/cYHVvZHE3EE5Nex25GICyVaFor97mgXGnXgiz2C9Di+/5+u0wiVF+XIVxNGVOeGiy0PNCes7r2iBvTs+Hoz/fPDZKB7smNZQGF8Ok7OGhht9v3sZnj+VPjKB0HPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230578; c=relaxed/simple;
	bh=aNdNJwsBi7HLicoOA5R3/iM476r6CjPzn0ksu8G7ON8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uAOQvsrJKbBByQ3HrZkCJntQcPGbf1NpEs+8DY945XtsugdUkTWkA3+Nm75XuaRTgfMTpp325cC7dmcQtFmmU29Df236b0W5eIH/5BiY+rQlTnxdCjqZfP5UyzHDKM6eZoKcsL6hJEBliQWU6khs1KFIO4PNtC4i1DbCmtx7WHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RtWHVrZd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771230574;
	bh=aNdNJwsBi7HLicoOA5R3/iM476r6CjPzn0ksu8G7ON8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RtWHVrZdNkX7ZzsjUDe7HId6/GAfmW45yVY438DnH65a8Ef4FgZ+va5/2qChR1Jbt
	 g6TyXV/uqFju83WRvVeTEznnU5Xo9s860r6an0sNeiXtGSXLHiFNMBZaCk+0FMZqK9
	 /gOUyUh109mFsfxXyppQDeZ8vYHb2w63eApz8c5g4KlI3sS+siKIK+DJFm8R13h9NT
	 0eG526e95TpDzb2yK+13JwPO92hqYGM5qT8ohvjEwcRpSNmIS9qy3Ob40UkCBL36mO
	 agtW/Uho/uiBtjHVQSFkVEJqMVC8PInuiXS/ZU2502coCoHfjRM60IAjzizBnjPAjd
	 dDukQb6S3Vz6Q==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 37E5417E150E;
	Mon, 16 Feb 2026 09:29:34 +0100 (CET)
Message-ID: <bfb98074-b256-4ed8-bca1-22a4dd4bf474@collabora.com>
Date: Mon, 16 Feb 2026 09:29:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] media: synopsys: csi2rx: add i.MX93 support
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev
References: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
 <20260213-imx93-dw-csi2-v2-6-8be6039f44c6@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260213-imx93-dw-csi2-v2-6-8be6039f44c6@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52837-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 2DC8E141911
X-Rspamd-Action: no action

Hi Frank,

Thanks for the update.

On 2/13/26 21:25, Frank Li wrote:
> The i.MX93 uses a newer version of the DW CSI-2 controller with a changed
> register layout and included an Image Pixel Interface (IPI), which convert

and an integrated Image Pixel Interface (IPI), which converts

> the received CSI-2 packets, from byte to pixel format, and  produces a

remove both ","
remove extra space between "and" and "produces"

> pixel data bus containing vertical and horizontal synchronism information.

synchronization information?

> 
> The reset flow also differs, so add the .assert_reset(), .deassert_reset(),
> and .idi_enable() callbacks to support it.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - move macro define to header
> - use new register access method
> - Keep check register exist to avoid print error message. keep slicence to
> access unexisting register may hide problem.
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 163 ++++++++++++++++++++++-
>  1 file changed, 159 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index b00ae5fb328da4cc78fe36b629d6661d438e124a..ff617a38e8e9ffed4701c15f59aebeca8e4c5553 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -35,6 +35,22 @@
>  #define DW_REG_EXIST		BIT(31)
>  #define DW_REG(x)		(DW_REG_EXIST | (x))
>  
> +#define DPHY_TEST_CTRL0_TEST_CLR	BIT(0)
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
>  enum dw_mipi_csi2rx_regs_index {
>  	DW_MIPI_CSI2RX_N_LANES,
>  	DW_MIPI_CSI2RX_RESETN,
> @@ -44,6 +60,16 @@ enum dw_mipi_csi2rx_regs_index {
>  	DW_MIPI_CSI2RX_MSK1,
>  	DW_MIPI_CSI2RX_MSK2,
>  	DW_MIPI_CSI2RX_CONTROL,
> +	/* imx93 (v150) new register */
> +	DW_MIPI_CSI2RX_DPHY_RSTZ,
> +	DW_MIPI_CSI2RX_PHY_TST_CTRL0,
> +	DW_MIPI_CSI2RX_PHY_TST_CTRL1,
> +	DW_MIPI_CSI2RX_PHY_SHUTDOWNZ,
> +	DW_MIPI_CSI2RX_IPI_DATATYPE,
> +	DW_MIPI_CSI2RX_IPI_MEM_FLUSH,
> +	DW_MIPI_CSI2RX_IPI_MODE,
> +	DW_MIPI_CSI2RX_IPI_SOFTRSTN,
> +	DW_MIPI_CSI2RX_IPI_VCID,
>  
>  	DW_MIPI_CSI2RX_MAX,
>  };
> @@ -54,8 +80,13 @@ enum {
>  	DW_MIPI_CSI2RX_PAD_MAX,
>  };
>  
> +struct dw_mipi_csi2rx_device;
> +
>  struct dw_mipi_csi2rx_drvdata {
>  	const u32 *regs;
> +	void (*dphy_assert_reset)(struct dw_mipi_csi2rx_device *csi2);
> +	void (*dphy_deassert_reset)(struct dw_mipi_csi2rx_device *csi2);
> +	void (*ipi_enable)(struct dw_mipi_csi2rx_device *csi2);
>  };
>  
>  struct dw_mipi_csi2rx_format {
> @@ -103,6 +134,21 @@ static const struct dw_mipi_csi2rx_drvdata rk3568_drvdata = {
>  	.regs = rk3568_regs,
>  };
>  
> +static const u32 imx93_regs[DW_MIPI_CSI2RX_MAX] = {
> +	[DW_MIPI_CSI2RX_N_LANES] = DW_REG(0x4),
> +	[DW_MIPI_CSI2RX_RESETN] = DW_REG(0x8),
> +	[DW_MIPI_CSI2RX_PHY_SHUTDOWNZ] = DW_REG(0x40),
> +	[DW_MIPI_CSI2RX_DPHY_RSTZ] = DW_REG(0x44),
> +	[DW_MIPI_CSI2RX_PHY_STATE] = DW_REG(0x48),
> +	[DW_MIPI_CSI2RX_PHY_TST_CTRL0] = DW_REG(0x50),
> +	[DW_MIPI_CSI2RX_PHY_TST_CTRL1] = DW_REG(0x54),
> +	[DW_MIPI_CSI2RX_IPI_MODE] = DW_REG(0x80),
> +	[DW_MIPI_CSI2RX_IPI_VCID] = DW_REG(0x84),
> +	[DW_MIPI_CSI2RX_IPI_DATATYPE] = DW_REG(0x88),
> +	[DW_MIPI_CSI2RX_IPI_MEM_FLUSH] = DW_REG(0x8c),
> +	[DW_MIPI_CSI2RX_IPI_SOFTRSTN] = DW_REG(0xa0),
> +};
> +
>  static const struct v4l2_mbus_framefmt default_format = {
>  	.width = 3840,
>  	.height = 2160,
> @@ -319,14 +365,32 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
>  		return -EINVAL;
>  	}
>  
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 0);
> +
> +	if (csi2->drvdata->dphy_assert_reset)
> +		csi2->drvdata->dphy_assert_reset(csi2);
> +
>  	control |= SW_DATATYPE_FS(0x00) | SW_DATATYPE_FE(0x01) |
>  		   SW_DATATYPE_LS(0x02) | SW_DATATYPE_LE(0x03);
>  
>  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_N_LANES, lanes - 1);
> -	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_CONTROL, control);
> +
> +	if (dw_mipi_csi2rx_is_exist(csi2, DW_MIPI_CSI2RX_CONTROL))
> +		dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_CONTROL, control);
> +
> +	ret = phy_power_on(csi2->phy);
> +	if (ret)
> +		return ret;
> +
> +	if (csi2->drvdata->dphy_deassert_reset)
> +		csi2->drvdata->dphy_deassert_reset(csi2);
> +
>  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 1);
>  
> -	return phy_power_on(csi2->phy);
> +	if (csi2->drvdata->ipi_enable)
> +		csi2->drvdata->ipi_enable(csi2);
> +
> +	return 0;
>  }
>  
>  static void dw_mipi_csi2rx_stop(struct dw_mipi_csi2rx_device *csi2)
> @@ -334,8 +398,12 @@ static void dw_mipi_csi2rx_stop(struct dw_mipi_csi2rx_device *csi2)
>  	phy_power_off(csi2->phy);
>  
>  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 0);
> -	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK1, ~0);
> -	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK2, ~0);
> +
> +	if (dw_mipi_csi2rx_is_exist(csi2, DW_MIPI_CSI2RX_MSK1))
> +		dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK1, ~0);
> +
> +	if (dw_mipi_csi2rx_is_exist(csi2, DW_MIPI_CSI2RX_MSK2))
> +		dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK2, ~0);
>  }
>  
>  static const struct media_entity_operations dw_mipi_csi2rx_media_ops = {
> @@ -687,7 +755,94 @@ static void dw_mipi_csi2rx_unregister(struct dw_mipi_csi2rx_device *csi2)
>  	v4l2_async_nf_cleanup(&csi2->notifier);
>  }
>  
> +static void imx93_csi2rx_dphy_assert_reset(struct dw_mipi_csi2rx_device *csi2)
> +{
> +	u32 val;
> +
> +	/* Release synopsis DPHY test codes from reset */

Synopsys

> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_DPHY_RSTZ, 0);
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ, 0);
> +
> +	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
> +	val &= ~DPHY_TEST_CTRL0_TEST_CLR;
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0, val);
> +
> +	/*
> +	 * ndelay is not necessary have MMIO operation, need dummy read to make
> +	 * sure above write reach target.

/* use read to ensure that the write operation above reaches its target */
?

(Technically it's not a dummy read, as you use the result after the ndelay)

> +	 */
> +	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
> +	/* Wait for at least 15ns */
> +	ndelay(15);
> +	val |= DPHY_TEST_CTRL0_TEST_CLR;
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0, val);
> +}
> +
> +static void imx93_csi2rx_dphy_deassert_reset(struct dw_mipi_csi2rx_device *csi2)
> +{
> +	/* Release PHY from reset */
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ, 0x1);
> +	/*
> +	 * ndelay is not necessary have MMIO operation, need dummy read to make
> +	 * sure above write reach target.
> +	 */

Adjust comment accordingly.

> +	dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ);
> +	ndelay(5);
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_DPHY_RSTZ, 0x1);
> +
> +	dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_DPHY_RSTZ);
> +	ndelay(5);
> +}
> +
> +static void imx93_csi2rx_dphy_ipi_enable(struct dw_mipi_csi2rx_device *csi2)
> +{
> +	int dt = csi2->formats->csi_dt;
> +	u32 val;
> +
> +	/* Do IPI soft reset */
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_SOFTRSTN, 0x0);
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_SOFTRSTN, 0x1);
> +
> +	/* Select virtual channel and data type to be processed by IPI */
> +	val = IPI_DATA_TYPE_DT(dt);
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_DATATYPE, val);
> +
> +	/* Set virtual channel 0 as default */
> +	val  = IPI_VCID_VC(0);
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_VCID, val);
> +
> +	/*
> +	 * Select IPI camera timing mode and allow the pixel stream
> +	 * to be non-continuous when pixel interface FIFO is empty
> +	 */
> +	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_IPI_MODE);
> +	val &= ~IPI_MODE_CONTROLLER;
> +	val &= ~IPI_MODE_COLOR_MODE16;
> +	val |= IPI_MODE_CUT_THROUGH;
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_MODE, val);
> +
> +	/* Memory is automatically flushed at each Frame Start */
> +	val = IPI_MEM_FLUSH_AUTO;
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_MEM_FLUSH, val);
> +
> +	/* Enable IPI */
> +	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_IPI_MODE);
> +	val |= IPI_MODE_ENABLE;
> +	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_MODE, val);
> +}
> +
> +static const struct dw_mipi_csi2rx_drvdata imx93_drvdata = {
> +	.regs = imx93_regs,
> +	.dphy_assert_reset = imx93_csi2rx_dphy_assert_reset,
> +	.dphy_deassert_reset = imx93_csi2rx_dphy_deassert_reset,
> +	.ipi_enable = imx93_csi2rx_dphy_ipi_enable,
> +};
> +
>  static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
> +	{
> +		.compatible = "fsl,imx93-mipi-csi2",
> +		.data = &imx93_drvdata,
> +	},
>  	{
>  		.compatible = "rockchip,rk3568-mipi-csi2",
>  		.data = &rk3568_drvdata,
> 

With the nitpicks addressed,

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael


