Return-Path: <linux-media+bounces-52716-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB1OGq/2jmnbGAEAu9opvQ
	(envelope-from <linux-media+bounces-52716-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 11:02:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9D1134CFA
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 11:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 57FD3301137E
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 10:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4574534F47C;
	Fri, 13 Feb 2026 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nqgtNc17"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE3C34DB4E;
	Fri, 13 Feb 2026 10:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770976932; cv=none; b=u5UsKfJnuoW5bLruWhG9CYAirC5mySiPgm7nVfOKHxFw95bqpwVJQgYXKrJsbhJyQLDwDGgDZ+flzpU95GcT7dIDJXA1057wIELLXGdG7af1AKw76Fp5Wmq9OZzwJ8KUEphd9QCKjJwAgBiX65Gm2z5uOS2ePwLGlw3NaZfALmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770976932; c=relaxed/simple;
	bh=ZjrFTIh7ShrKUOF4gch3jY1m5Y8XkQDW851iXHjOqiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H63p6e1Cwc+6DuZdHoR93uRmThkfXSqh1hFqSfcavTqw3EJmNt2/nSF3DqUNbrYg8ASA5EcLIATaRDNhlrt1Kplab2EFi4ArSLfKj9AJKNnilO1OYeleJ4uv1Rq1vk5SihgIAMhVhWiFA6U4a2BZj4GKBPuPWUre1n3xFczQm50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nqgtNc17; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770976929;
	bh=ZjrFTIh7ShrKUOF4gch3jY1m5Y8XkQDW851iXHjOqiA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nqgtNc17ZE531V5rPjG2iYL9agLaXHiIQuf+E4LBTxJH0WbfEqA2kdkeJIWuUAMdf
	 9CfPsDRwCcc6gLF86KT8br+YmQ/xUMuQQORvM8xHYic3k6zVbj4HR+MPWNl5+3S+0F
	 vxb1Vhw1ePb2wDo61w40IdOsitCJfFXeWMJz/ZpdEPI/dXkCOym5BTZYmgUxKuJUsG
	 zDSKtD/e6qfMbcpse9aDoU5ACAJy+CyDxymC+ITkJfrUViHT63BM+oDJrkCCiOFdYM
	 7v5cFncu83TD45F6XFTXzuq+JCpf5rKaAXkFGCygolpChjXd3DvMls7Cq++ee2ofyN
	 fXCs7eVz5YjlA==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 02C0617E01E7;
	Fri, 13 Feb 2026 11:02:08 +0100 (CET)
Message-ID: <4501f80f-c21e-4fe8-af76-93c729ae1803@collabora.com>
Date: Fri, 13 Feb 2026 11:02:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] media: synopsys: use struct dw_mipi_csi2rx_regs to
 describe register offsets
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <20260210-imx93-dw-csi2-v1-4-69667bb86bfa@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260210-imx93-dw-csi2-v1-4-69667bb86bfa@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52716-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8D9D1134CFA
X-Rspamd-Action: no action

Hi Frank,

Thanks for the patch.

Please keep the order:
 - #includes
 - #defines
 - enum and struct definitions
 - the rest

On 2/10/26 18:11, Frank Li wrote:
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
> +
> +#define dw_mipi_csi2rx_write(csi2, __name, value)		\
> +({	auto __csi2 = csi2;					\
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

Please use an

enum {
	DW_MIPI_CSI2RX_N_LANES,
	DW_MIPI_CSI2RX_RESETN,
	...,
	DW_MIPI_CSI2RX_MAX
};

a member regs[DW_MIPI_CSI2RX_MAX] in dw_mipi_csi2rx_drvdata, and adjust
the dw_mipi_csi2rx_{read,write} accordingly. This is cleaner IMHO and
integrates better with the existing code.

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

		.compatible = "rockchip,rk3568-mipi-csi2",
		.data = &rk3568_drvdata,

for minimal diff and cleanliness.

Please make sure that the last patch of this series is adjusted
accordingly and continues this formatting.


>  	},
>  	{}
>  };
> @@ -654,6 +694,8 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
>  	if (IS_ERR(csi2->base_addr))
>  		return PTR_ERR(csi2->base_addr);
>  
> +	csi2->drvdata = device_get_match_data(dev);

Check for (!csi2->drvdata)

> +
>  	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
>  	if (ret < 0)
>  		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
> 

Best regards,
Michael


