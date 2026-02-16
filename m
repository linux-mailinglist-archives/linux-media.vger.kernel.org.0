Return-Path: <linux-media+bounces-52835-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAdoJ1/Rkmk1ygEAu9opvQ
	(envelope-from <linux-media+bounces-52835-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 09:12:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4DB141724
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 09:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42791300F9E8
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 08:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C29302756;
	Mon, 16 Feb 2026 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SqF8Smib"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F247A2EE617;
	Mon, 16 Feb 2026 08:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771229522; cv=none; b=T9qMhj16lPtwOtUF2xB5bwxE33cB0ISZU9uYqGCQ11mx1o966u+Fs0s/RmKuPSND/fa8JlR+e1/kQDVksmQEcvnPZa9jBpzRAvROWkmYpf5/sPQInAbG6IS7Q7QU07JJXC7a/M60SEVrRhFmb0D3NWT1t3dav/0nn4yXi7XnA/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771229522; c=relaxed/simple;
	bh=3HYqKGUDU9JGeXZAcBF46can3OoH/CCNNOhHTr/xDHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fj7yotDU3y27ASjWKAHnzDW4HwL0sfhfhvvc3S7aGWEb6DJFu1b5bTs7wNKW43fzmS/js8PA9nyI1sTnqEVBowEn+/Ytu5tx77ZsUBJx39y4U+BsPRVcApCbxarDBpjS/w4j+OOto0rEkkozaIh6Y+KPA59VheULzmXqeYCHb74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SqF8Smib; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771229518;
	bh=3HYqKGUDU9JGeXZAcBF46can3OoH/CCNNOhHTr/xDHE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SqF8Smib7nHdDc32RttjOuPwKqz4BLw1OCQwXYrdq2AGpmvo/C6HNk6IK7MGvcm+m
	 jydz1JyhssE5o8cEMkUzIBCdHluxaCRisFF5xIHoy3gQjgvD0U1UJPJ5FRTtni62lD
	 x+2CJO0rMWo42vedhE9z9llD9GcDuFVBmx21BtfVXWeM3zGo9/fLeBl+Y4I3IxX792
	 ZL2XFXFDbM5ELc/7kax9yJ4eGvyVQT4ApOl55AYMaIE41N79vT86tP8lDhLmLbMj/h
	 3rCoyOw/T5z8khP+MJEWr2kHWpLcvskOzKSmV68HvMXCt+MWp43r8XucmgwPXhEEe8
	 cwed7IEOhWRJw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A80217E1406;
	Mon, 16 Feb 2026 09:11:57 +0100 (CET)
Message-ID: <eef04746-00cf-4971-8e65-37a2a3e60672@collabora.com>
Date: Mon, 16 Feb 2026 09:11:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] media: synopsys: csi2rx: Use enum and u32 array
 for register offsets
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev
References: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
 <20260213-imx93-dw-csi2-v2-4-8be6039f44c6@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260213-imx93-dw-csi2-v2-4-8be6039f44c6@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52835-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: EB4DB141724
X-Rspamd-Action: no action

Hi Frank,

Thanks for the update.

Some minor nitpicks, but it already looks good.

On 2/13/26 21:25, Frank Li wrote:
> Use enum dw_mipi_csi2rx_regs_index together with a u32 array to describe
> register offsets. This allows supporting new IP versions with different
> register layouts in a structured way.
> 
> Add rk3568_regs matching the previous macro definitions and pass it as
> driver data during probe.
> 
> No functional change intended.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - change to use enum and u32 array method
> - use order
>  - #includes
>  - #defines
>  - enum and struct definitions
>  - the rest
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 91 ++++++++++++++++++++----
>  1 file changed, 78 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index a6d251ca5ad14c5138a6fd0202a970460e64c68f..b00ae5fb328da4cc78fe36b629d6661d438e124a 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -24,15 +24,6 @@
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
> -
>  #define SW_CPHY_EN(x)		((x) << 0)
>  #define SW_DSI_EN(x)		((x) << 4)
>  #define SW_DATATYPE_FS(x)	((x) << 8)
> @@ -40,12 +31,33 @@
>  #define SW_DATATYPE_LS(x)	((x) << 20)
>  #define SW_DATATYPE_LE(x)	((x) << 26)
>  
> +/* Help check wrong access unexisted register at difference IP version */

Maybe

/* helper for checking whether register exists */

? However, I think the naming speaks for itself and you can leave the
comment away.

> +#define DW_REG_EXIST		BIT(31)
> +#define DW_REG(x)		(DW_REG_EXIST | (x))
> +
> +enum dw_mipi_csi2rx_regs_index {
> +	DW_MIPI_CSI2RX_N_LANES,
> +	DW_MIPI_CSI2RX_RESETN,
> +	DW_MIPI_CSI2RX_PHY_STATE,
> +	DW_MIPI_CSI2RX_ERR1,
> +	DW_MIPI_CSI2RX_ERR2,
> +	DW_MIPI_CSI2RX_MSK1,
> +	DW_MIPI_CSI2RX_MSK2,
> +	DW_MIPI_CSI2RX_CONTROL,
> +
> +	DW_MIPI_CSI2RX_MAX,
> +};
> +
>  enum {
>  	DW_MIPI_CSI2RX_PAD_SINK,
>  	DW_MIPI_CSI2RX_PAD_SRC,
>  	DW_MIPI_CSI2RX_PAD_MAX,
>  };
>  
> +struct dw_mipi_csi2rx_drvdata {
> +	const u32 *regs;
> +};
> +
>  struct dw_mipi_csi2rx_format {
>  	u32 code;
>  	u8 depth;
> @@ -72,6 +84,23 @@ struct dw_mipi_csi2rx_device {
>  
>  	enum v4l2_mbus_type bus_type;
>  	u32 lanes_num;
> +
> +	const struct dw_mipi_csi2rx_drvdata *drvdata;
> +};
> +
> +static const u32 rk3568_regs[DW_MIPI_CSI2RX_MAX] = {
> +	[DW_MIPI_CSI2RX_N_LANES] = DW_REG(0x4),
> +	[DW_MIPI_CSI2RX_RESETN] = DW_REG(0x10),
> +	[DW_MIPI_CSI2RX_PHY_STATE] = DW_REG(0x14),
> +	[DW_MIPI_CSI2RX_ERR1] = DW_REG(0x20),
> +	[DW_MIPI_CSI2RX_ERR2] = DW_REG(0x24),
> +	[DW_MIPI_CSI2RX_MSK1] = DW_REG(0x28),
> +	[DW_MIPI_CSI2RX_MSK2] = DW_REG(0x2c),
> +	[DW_MIPI_CSI2RX_CONTROL] = DW_REG(0x40),
> +};
> +
> +static const struct dw_mipi_csi2rx_drvdata rk3568_drvdata = {
> +	.regs = rk3568_regs,
>  };
>  
>  static const struct v4l2_mbus_framefmt default_format = {
> @@ -186,16 +215,46 @@ static inline struct dw_mipi_csi2rx_device *to_csi2(struct v4l2_subdev *sd)
>  	return container_of(sd, struct dw_mipi_csi2rx_device, sd);
>  }
>  
> +static bool dw_mipi_csi2rx_is_exist(struct dw_mipi_csi2rx_device *csi2,

Sounds a bit weird to me, maybe "dw_mipi_csi2rx_has_reg(ister)" or
"dw_mipi_csi2rx_reg(ister)_exists?

> +				    enum dw_mipi_csi2rx_regs_index index)
> +{
> +	if (index < DW_MIPI_CSI2RX_MAX &&
> +	    (csi2->drvdata->regs[index] & DW_REG_EXIST))
> +		return true;
> +
> +	return false;
> +}
> +
> +static void __iomem *
> +dw_mipi_csi2rx_get_regaddr(struct dw_mipi_csi2rx_device *csi2,
> +			   enum dw_mipi_csi2rx_regs_index index)
> +{
> +	u32 off = (~DW_REG_EXIST) & csi2->drvdata->regs[index];
> +
> +	return csi2->base_addr + off;
> +}
> +
>  static inline void dw_mipi_csi2rx_write(struct dw_mipi_csi2rx_device *csi2,
> -					unsigned int addr, u32 val)
> +					enum dw_mipi_csi2rx_regs_index index,
> +					u32 val)
>  {
> -	writel(val, csi2->base_addr + addr);
> +	if (dw_mipi_csi2rx_is_exist(csi2, index))
> +		writel(val, dw_mipi_csi2rx_get_regaddr(csi2, index));
> +
> +	dev_err_once(csi2->dev,
> +		     "write to non-existent register index: %d\n", index);

Not sure about to control flow here, as the error message is shown in
any case. Do you mean

{
	if (!dw_mipi_csi2rx_is_exist(csi2, index)) {
		dev_err_once(csi2->dev,
			"write to non-existent register index: %d\n",
			index);
		return;
	}

	writel(val, dw_mipi_csi2rx_get_regaddr(csi2, index));
}

?

>  }
>  
>  static inline u32 dw_mipi_csi2rx_read(struct dw_mipi_csi2rx_device *csi2,
> -				      unsigned int addr)
> +				      enum dw_mipi_csi2rx_regs_index index)
>  {
> -	return readl(csi2->base_addr + addr);
> +	if (dw_mipi_csi2rx_is_exist(csi2, index))
> +		return readl(dw_mipi_csi2rx_get_regaddr(csi2, index));

Here it seems to be correct, but personally I'd prefer

{
	if (!dw_mipi_csi2rx_is_exist(csi2, index)) {
		// print error
		return 0;
	}

	return readl(...);
}
Anyway, it should match the write method.

> +
> +	dev_err_once(csi2->dev,
> +		     "read non-existent register index: %d\n", index);
> +	/* Return 0 for unexisted registers */

/* return 0 for non-existent registers */

or leave away altogether.

> +	return 0;
>  }
>  
>  static const struct dw_mipi_csi2rx_format *
> @@ -631,6 +690,7 @@ static void dw_mipi_csi2rx_unregister(struct dw_mipi_csi2rx_device *csi2)
>  static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
>  	{
>  		.compatible = "rockchip,rk3568-mipi-csi2",
> +		.data = &rk3568_drvdata,
>  	},
>  	{}
>  };
> @@ -652,6 +712,11 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
>  	if (IS_ERR(csi2->base_addr))
>  		return PTR_ERR(csi2->base_addr);
>  
> +	csi2->drvdata = device_get_match_data(dev);
> +	if (!csi2->drvdata)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "failed to get driver data\n");
> +
>  	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
>  	if (ret < 0)
>  		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
> 

With the comments above addressed,

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael


