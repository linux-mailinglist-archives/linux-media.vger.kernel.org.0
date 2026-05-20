Return-Path: <linux-media+bounces-62242-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCYcODOYDWoMzwUAu9opvQ
	(envelope-from <linux-media+bounces-62242-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:17:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6287A58C327
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A46FD30665A3
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 11:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86B03DB30C;
	Wed, 20 May 2026 11:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="COltNvxS"
X-Original-To: linux-media@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370643D1CA2;
	Wed, 20 May 2026 11:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275550; cv=none; b=aPk2Hzjn9b4adYPbK35qmQ6EGoCo2OeisFYNt21cO+GcPbOlZeOMJk5OYR4uezJoxjQ0S1aZ33eYf/OCT8LKiUw3ZbiNphvQM46NQWp5J1+sUFPPaksjiLityErLvv8xfkFJUDdcswqTc2tyVIoDRlgBsIII50u8vYuKZcqOPAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275550; c=relaxed/simple;
	bh=FBkXh2DAt3yR5Q+EdWlUaLDmI+m3OYCBiIvZuMcVWHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k1+OG/o0n8/x0Km44/MQL0rpDNiu5Dtg3YHsDma/1rK1jLs9jkA6VOog7+S6zK8yve6touQis8Gv63slB7z/bW6jO5o25Dd+sSNpQPrDp8djmA5WaDdl5LmEb6AfTG6x2RgOEt713DAYiN5FVsUAB6exG1eziKAA8MSiZ9qDK/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=COltNvxS; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DvDE/I3kIC9czXIH3YDGbEAbi1K+WHiThr0tZnRFv0A=; b=COltNvxSD5z1NoIbqfBPogFhg1
	P88gRrYk1nrFrCD+hIFYlFdhPiIhZwhK1hPtYvacl+SYssTgKEAL5OLYbxBWGs9v2C85JEgo58jIu
	kcHw41JFdGUME51MglSbdh/12VIMxgu1JhTe8aNqvn4ItcwuNnTBAIRTThFS8llkddSE3ObHm0TVg
	dJD+wWiqT8iHtnMmumi7J8EXhRm2kUiXjil9alnTHlrKrlBlspMSnneQYWuezqkrT6nTerTYEST9T
	krTTxAXhhxOxHLqJ2UtVXiX07mcTKhgp76pPqqlwKmR9NZoNn+KyWZhj8Ab9Jkr+bQFNcqcqfZYG3
	jloVPwfQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wPeqc-000Hff-1t;
	Wed, 20 May 2026 13:12:22 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wPeqc-000C6O-26;
	Wed, 20 May 2026 13:12:22 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Michael Riesch <michael.riesch@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: Re: [PATCH v4 4/6] media: synopsys: Add PHY stopstate wait for i.MX93
Date: Wed, 20 May 2026 13:12:20 +0200
Message-ID: <10853728.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260519-csi2_imx95-v4-4-84ea4bb78a88@oss.nxp.com>
References:
 <20260519-csi2_imx95-v4-0-84ea4bb78a88@oss.nxp.com>
 <20260519-csi2_imx95-v4-4-84ea4bb78a88@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28006/Wed May 20 08:25:19 2026)
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62242-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4ae00000:email,0.0.0.0:email,tq-group.com:url,nxp.com:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 6287A58C327
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Am Dienstag, 19. Mai 2026, 04:07:41 CEST schrieb Guoniu Zhou:
> Implement waiting for D-PHY lanes to enter stop state on i.MX93. This
> ensures proper PHY initialization by verifying that the clock lane and
> all active data lanes have entered the stop state before proceeding with
> further operations.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v2:
> - Removes redundant register availability check
> - Uses read_poll_timeout() with dw_mipi_csi2rx_read() instead of
>   readl_poll_timeout() with direct register address
> - Fixes stopstate condition logic
> - Check PHY stopstate after sensor enable instead of before to ensure
>   correct timing.
> - Optimize PHY stopstate polling parameters (1000us->10us, 2s->1ms) to
>   balance performance and responsiveness.
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 36 ++++++++++++++++++=
++++++
>  1 file changed, 36 insertions(+)
>=20
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/m=
edia/platform/synopsys/dw-mipi-csi2rx.c
> index 92178a3dec5d..8a34aec550ad 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -11,6 +11,7 @@
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
> @@ -35,6 +36,8 @@
>  #define DW_REG_EXIST		BIT(31)
>  #define DW_REG(x)		(DW_REG_EXIST | (x))
> =20
> +#define DPHY_STOPSTATE_CLK_LANE		BIT(16)
> +
>  #define DPHY_TEST_CTRL0_TEST_CLR	BIT(0)
> =20
>  #define IPI_VCID_VC(x)			FIELD_PREP(GENMASK(1, 0), (x))
> @@ -65,6 +68,7 @@ enum dw_mipi_csi2rx_regs_index {
>  	DW_MIPI_CSI2RX_PHY_TST_CTRL0,
>  	DW_MIPI_CSI2RX_PHY_TST_CTRL1,
>  	DW_MIPI_CSI2RX_PHY_SHUTDOWNZ,
> +	DW_MIPI_CSI2RX_PHY_STOPSTATE,
>  	DW_MIPI_CSI2RX_IPI_DATATYPE,
>  	DW_MIPI_CSI2RX_IPI_MEM_FLUSH,
>  	DW_MIPI_CSI2RX_IPI_MODE,
> @@ -87,6 +91,7 @@ struct dw_mipi_csi2rx_drvdata {
>  	void (*dphy_assert_reset)(struct dw_mipi_csi2rx_device *csi2);
>  	void (*dphy_deassert_reset)(struct dw_mipi_csi2rx_device *csi2);
>  	void (*ipi_enable)(struct dw_mipi_csi2rx_device *csi2);
> +	int (*wait_for_phy_stopstate)(struct dw_mipi_csi2rx_device *csi2);
>  };
> =20
>  struct dw_mipi_csi2rx_format {
> @@ -139,6 +144,7 @@ static const u32 imx93_regs[DW_MIPI_CSI2RX_MAX] =3D {
>  	[DW_MIPI_CSI2RX_PHY_SHUTDOWNZ] =3D DW_REG(0x40),
>  	[DW_MIPI_CSI2RX_DPHY_RSTZ] =3D DW_REG(0x44),
>  	[DW_MIPI_CSI2RX_PHY_STATE] =3D DW_REG(0x48),
> +	[DW_MIPI_CSI2RX_PHY_STOPSTATE] =3D DW_REG(0x4c),
>  	[DW_MIPI_CSI2RX_PHY_TST_CTRL0] =3D DW_REG(0x50),
>  	[DW_MIPI_CSI2RX_PHY_TST_CTRL1] =3D DW_REG(0x54),
>  	[DW_MIPI_CSI2RX_IPI_MODE] =3D DW_REG(0x80),
> @@ -556,10 +562,19 @@ static int dw_mipi_csi2rx_enable_streams(struct v4l=
2_subdev *sd,
>  	if (ret)
>  		goto err_csi_stop;
> =20
> +	if (!csi2->enabled_streams &&
> +	    csi2->drvdata->wait_for_phy_stopstate) {
> +		ret =3D csi2->drvdata->wait_for_phy_stopstate(csi2);
> +		if (ret)
> +			goto err_disable_streams;
> +	}
> +
>  	csi2->enabled_streams |=3D streams_mask;
> =20
>  	return 0;
> =20
> +err_disable_streams:
> +	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
>  err_csi_stop:
>  	/* Stop CSI hardware if no streams are enabled */
>  	if (!csi2->enabled_streams)
> @@ -871,11 +886,32 @@ static void imx93_csi2rx_dphy_ipi_enable(struct dw_=
mipi_csi2rx_device *csi2)
>  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_MODE, val);
>  }
> =20
> +static int imx93_csi2rx_wait_for_phy_stopstate(struct dw_mipi_csi2rx_dev=
ice *csi2)
> +{
> +	struct device *dev =3D csi2->dev;
> +	u32 stopstate_mask;
> +	u32 val;
> +	int ret;
> +
> +	stopstate_mask =3D DPHY_STOPSTATE_CLK_LANE | GENMASK(csi2->lanes_num - =
1, 0);
> +
> +	ret =3D read_poll_timeout(dw_mipi_csi2rx_read, val,
> +				(val & stopstate_mask) =3D=3D stopstate_mask,
> +				 10, 1000, true,
> +				 csi2, DW_MIPI_CSI2RX_PHY_STOPSTATE);
> +	if (ret)
> +		dev_err(dev, "lanes are not in stop state: %#x, expected %#x\n",
> +			val, stopstate_mask);

Did you actually test this on imx93? I'm trying to get my imx327 sensor to
run, but only run into this error message:
dw-mipi-csi2rx 4ae00000.mipi-csi: lanes are not in stop state: 0x0, expecte=
d 0x10003

Currently I'm using this DT node:
=2D-8<--
mipi_csi: mipi-csi@4ae00000 {
	compatible =3D "fsl,imx93-mipi-csi2";
	reg =3D <0x4ae00000 0x10000>;
	interrupts =3D <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
	clocks =3D <&clk IMX93_CLK_MIPI_CSI_GATE>,
			<&clk IMX93_CLK_CAM_PIX>;
	clock-names =3D "per", "pixel";
	assigned-clocks =3D <&clk IMX93_CLK_CAM_PIX>;
	assigned-clock-parents =3D <&clk IMX93_CLK_VIDEO_PLL>;
	assigned-clock-rates =3D <140000000>;
	power-domains =3D <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_CSI>;
	phys =3D <&dphy_rx>;
	phy-names =3D "dphy-rx";
	status =3D "disabled";

	ports {
		#address-cells =3D <1>;
		#size-cells =3D <0>;

		port@0 {
			reg =3D <0>;

			mipi_from_sensor: endpoint {
				data-lanes =3D <1 2>;
				bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
			};
		};

		port@1 {
			reg =3D <1>;

			mipi_to_isi: endpoint {
				remote-endpoint =3D <&isi_in>;
			};
		};
	};
};
=2D-8<--

Am I'm missing something?

best regards,
Alexander

> +
> +	return ret;
> +}
> +
>  static const struct dw_mipi_csi2rx_drvdata imx93_drvdata =3D {
>  	.regs =3D imx93_regs,
>  	.dphy_assert_reset =3D imx93_csi2rx_dphy_assert_reset,
>  	.dphy_deassert_reset =3D imx93_csi2rx_dphy_deassert_reset,
>  	.ipi_enable =3D imx93_csi2rx_dphy_ipi_enable,
> +	.wait_for_phy_stopstate =3D imx93_csi2rx_wait_for_phy_stopstate,
>  };
> =20
>  static const struct of_device_id dw_mipi_csi2rx_of_match[] =3D {
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



