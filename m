Return-Path: <linux-media+bounces-62456-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MI9kO0PzDmqmDQYAu9opvQ
	(envelope-from <linux-media+bounces-62456-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 13:57:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 521ED5A455C
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 13:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86BA43063572
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CDB3C8719;
	Thu, 21 May 2026 11:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="VkKHzQmz"
X-Original-To: linux-media@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314B13ACEE0;
	Thu, 21 May 2026 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364361; cv=none; b=m4Dy9ZH13547hbAgduyVNXR6smOjxiCr+YVL0HaiAzGDN8BJIKf7sBlXG1mGeMNjtvlFTsnMHAarCBTCkYoHW4LbRtGlqoiMa0MnBMhNTHws3keMB+S05oYttEtMkLbasJzlhIsDxphzrxjb8+BJtJgKZkLr40WlLLcUqrdeo0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364361; c=relaxed/simple;
	bh=vbHdOinYV8YgqEE1iYXkqGIFlq0m5mJvmk6QW/IwU8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oz6T6yK9k+fHVngP4MfymOlNDu+M6w0W3FiFS8IcJG737ZvcVeQrfc6Cw1CQy8kiATBXsLkG2RMj/Zc3EWQHzwTdo2Au2TWcxP9G4enQljBDpo7BYeCl8ksxuO8Ao+26inXj39EYIOmw6afMktiYkJ2A/kE9t3I5CVvshyrCLjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=VkKHzQmz; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=amM9eiEA/pvK+ydwPeVpWCIxUjk/OZPSWjNRu2oMb5w=; b=VkKHzQmzuj8K5qIXEc3DMSVof8
	/nFs80YrUTxE9QGf2d33GryU1qcU2ADtGgBrf/Jmu1VEW/LlZomuBYf0G+fndUD3+NbCpfh1hltw3
	giFs5ExG849OROQ2r5GngCS5jciOy/ZT88eEqlZZaFENXyx40SvTyT6KTpt0Ini/lbgxIxvJNJ+6c
	v6e4Zhy+CZh2JgbIZE0N8Xe8TAF5p9UzCdJ28ExKuwpNXHb5W/TJ6ols5aZLV6UvVecE3iCMjM48O
	E9KZ637KM2Qn1CslIhUx1QW2jIzxBj0bwtKoijfsbG6D2bx2uUkgUZ04VRflDKxzKqz1O52W+v96N
	8wYTXDFg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wQ1x3-000588-1X;
	Thu, 21 May 2026 13:52:33 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wQ1x2-0009UY-1F;
	Thu, 21 May 2026 13:52:33 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Michael Riesch <michael.riesch@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Frank Li <frank.li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
 "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Subject: Re: [PATCH v4 4/6] media: synopsys: Add PHY stopstate wait for i.MX93
Date: Thu, 21 May 2026 13:52:31 +0200
Message-ID: <3606153.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <AS8PR04MB9080D3B1A6B522F3F9342E23FA0E2@AS8PR04MB9080.eurprd04.prod.outlook.com>
References:
 <20260519-csi2_imx95-v4-0-84ea4bb78a88@oss.nxp.com>
 <10853728.nUPlyArG6x@steina-w>
 <AS8PR04MB9080D3B1A6B522F3F9342E23FA0E2@AS8PR04MB9080.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28007/Thu May 21 08:26:28 2026)
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-62456-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 521ED5A455C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

thanks for the replay.

Am Donnerstag, 21. Mai 2026, 11:29:39 CEST schrieb G.N. Zhou (OSS):
> Hi Alexander,
>=20
> > -----Original Message-----
> > From: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Sent: Wednesday, May 20, 2026 7:12 PM
> > To: Michael Riesch <michael.riesch@collabora.com>; Mauro Carvalho Chehab
> > <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Heiko Stuebner
> > <heiko@sntech.de>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>;
> > Frank Li <frank.li@nxp.com>; Sakari Ailus <sakari.ailus@linux.intel.com=
>; Bryan
> > O'Donoghue <bryan.odonoghue@linaro.org>; Mehdi Djait
> > <mehdi.djait@linux.intel.com>; Hans Verkuil <hverkuil+cisco@kernel.org>;
> > G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> > devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; linux-rockchip@lists.infradead.org; G.N. Zh=
ou (OSS)
> > <guoniu.zhou@oss.nxp.com>
> > Subject: Re: [PATCH v4 4/6] media: synopsys: Add PHY stopstate wait for
> > i.MX93
> >=20
> > Hi,
> >=20
> > Am Dienstag, 19. Mai 2026, 04:07:41 CEST schrieb Guoniu Zhou:
> > > Implement waiting for D-PHY lanes to enter stop state on i.MX93. This
> > > ensures proper PHY initialization by verifying that the clock lane and
> > > all active data lanes have entered the stop state before proceeding
> > > with further operations.
> > >
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> > > ---
> > > Changes in v2:
> > > - Removes redundant register availability check
> > > - Uses read_poll_timeout() with dw_mipi_csi2rx_read() instead of
> > >   readl_poll_timeout() with direct register address
> > > - Fixes stopstate condition logic
> > > - Check PHY stopstate after sensor enable instead of before to ensure
> > >   correct timing.
> > > - Optimize PHY stopstate polling parameters (1000us->10us, 2s->1ms) to
> > >   balance performance and responsiveness.
> > > ---
> > >  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 36
> > > ++++++++++++++++++++++++
> > >  1 file changed, 36 insertions(+)
> > >
> > > diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> > > b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> > > index 92178a3dec5d..8a34aec550ad 100644
> > > --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> > > +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> > > @@ -11,6 +11,7 @@
> > >  #include <linux/clk.h>
> > >  #include <linux/delay.h>
> > >  #include <linux/io.h>
> > > +#include <linux/iopoll.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of.h>
> > >  #include <linux/phy/phy.h>
> > > @@ -35,6 +36,8 @@
> > >  #define DW_REG_EXIST		BIT(31)
> > >  #define DW_REG(x)		(DW_REG_EXIST | (x))
> > >
> > > +#define DPHY_STOPSTATE_CLK_LANE		BIT(16)
> > > +
> > >  #define DPHY_TEST_CTRL0_TEST_CLR	BIT(0)
> > >
> > >  #define IPI_VCID_VC(x)			FIELD_PREP(GENMASK(1, 0),
> > (x))
> > > @@ -65,6 +68,7 @@ enum dw_mipi_csi2rx_regs_index {
> > >  	DW_MIPI_CSI2RX_PHY_TST_CTRL0,
> > >  	DW_MIPI_CSI2RX_PHY_TST_CTRL1,
> > >  	DW_MIPI_CSI2RX_PHY_SHUTDOWNZ,
> > > +	DW_MIPI_CSI2RX_PHY_STOPSTATE,
> > >  	DW_MIPI_CSI2RX_IPI_DATATYPE,
> > >  	DW_MIPI_CSI2RX_IPI_MEM_FLUSH,
> > >  	DW_MIPI_CSI2RX_IPI_MODE,
> > > @@ -87,6 +91,7 @@ struct dw_mipi_csi2rx_drvdata {
> > >  	void (*dphy_assert_reset)(struct dw_mipi_csi2rx_device *csi2);
> > >  	void (*dphy_deassert_reset)(struct dw_mipi_csi2rx_device *csi2);
> > >  	void (*ipi_enable)(struct dw_mipi_csi2rx_device *csi2);
> > > +	int (*wait_for_phy_stopstate)(struct dw_mipi_csi2rx_device *csi2);
> > >  };
> > >
> > >  struct dw_mipi_csi2rx_format {
> > > @@ -139,6 +144,7 @@ static const u32 imx93_regs[DW_MIPI_CSI2RX_MAX]
> > =3D {
> > >  	[DW_MIPI_CSI2RX_PHY_SHUTDOWNZ] =3D DW_REG(0x40),
> > >  	[DW_MIPI_CSI2RX_DPHY_RSTZ] =3D DW_REG(0x44),
> > >  	[DW_MIPI_CSI2RX_PHY_STATE] =3D DW_REG(0x48),
> > > +	[DW_MIPI_CSI2RX_PHY_STOPSTATE] =3D DW_REG(0x4c),
> > >  	[DW_MIPI_CSI2RX_PHY_TST_CTRL0] =3D DW_REG(0x50),
> > >  	[DW_MIPI_CSI2RX_PHY_TST_CTRL1] =3D DW_REG(0x54),
> > >  	[DW_MIPI_CSI2RX_IPI_MODE] =3D DW_REG(0x80), @@ -556,10 +562,19
> > @@
> > > static int dw_mipi_csi2rx_enable_streams(struct v4l2_subdev *sd,
> > >  	if (ret)
> > >  		goto err_csi_stop;
> > >
> > > +	if (!csi2->enabled_streams &&
> > > +	    csi2->drvdata->wait_for_phy_stopstate) {
> > > +		ret =3D csi2->drvdata->wait_for_phy_stopstate(csi2);
> > > +		if (ret)
> > > +			goto err_disable_streams;
> > > +	}
> > > +
> > >  	csi2->enabled_streams |=3D streams_mask;
> > >
> > >  	return 0;
> > >
> > > +err_disable_streams:
> > > +	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
> > >  err_csi_stop:
> > >  	/* Stop CSI hardware if no streams are enabled */
> > >  	if (!csi2->enabled_streams)
> > > @@ -871,11 +886,32 @@ static void imx93_csi2rx_dphy_ipi_enable(struct
> > dw_mipi_csi2rx_device *csi2)
> > >  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_MODE, val);  }
> > >
> > > +static int imx93_csi2rx_wait_for_phy_stopstate(struct
> > > +dw_mipi_csi2rx_device *csi2) {
> > > +	struct device *dev =3D csi2->dev;
> > > +	u32 stopstate_mask;
> > > +	u32 val;
> > > +	int ret;
> > > +
> > > +	stopstate_mask =3D DPHY_STOPSTATE_CLK_LANE | GENMASK(csi2-
> > >lanes_num -
> > > +1, 0);
> > > +
> > > +	ret =3D read_poll_timeout(dw_mipi_csi2rx_read, val,
> > > +				(val & stopstate_mask) =3D=3D stopstate_mask,
> > > +				 10, 1000, true,
> > > +				 csi2, DW_MIPI_CSI2RX_PHY_STOPSTATE);
> > > +	if (ret)
> > > +		dev_err(dev, "lanes are not in stop state: %#x,
> > expected %#x\n",
> > > +			val, stopstate_mask);
> >=20
> > Did you actually test this on imx93? I'm trying to get my imx327 sensor=
 to run,
> > but only run into this error message:
> > dw-mipi-csi2rx 4ae00000.mipi-csi: lanes are not in stop state: 0x0, exp=
ected
> > 0x10003
>=20
> Thanks for testing. Regarding the lane stop state error on i.MX93 with im=
x327:
>=20
> This error indicates the CSI-2 lanes are not in LP-11 (stop) state when=20
> expected. Please check:
>=20
> 1) Verify the sensor PHY is in LP-11 state before returning from the sens=
or's=20
>    s_stream(1) call. The CSI-2 receiver expects lanes to be in stop state=
=20
>    initially.

Well, this might be tricky as I don't have D-PHY capable scopes.
I can successfully use this sensor on a imx8mp, so I am expecting this to be
okay.

> 2) Check if the imx327 driver has a delay between starting the stream and=
=20
>    returning from s_stream(). If the sensor transitions PHY out of LP-11=
=20
>    state during this delay, the CSI driver's lane state check will fail=20
>    when it runs later. The sensor should remain in LP-11 until the CSI=20
>    controller completes its initialization.

In imx290_set_stream() and subsequently imx290_start_streaming() setting
IMX290_XMSTA starts the stream. I expect this is the point when the sensors
switches from LP-11 to HS. But again, I can't verify.

With enabling debug
> echo "module videodev +p" > /sys/kernel/debug/dynamic_debug/control
> echo 0xff > /sys/class/video4linux/video0/dev_debug

After I setup the media pipeline, running the command
> v4l2-ctl -z "platform:4ae40000.isi" -d "mxc_isi.0.capture" --stream-mmap =
=2D-stream-count=3D1 --stream-to=3Dimx93.raw
I get the following debug output:

=2D-8<--
plane 0: bytesperline=3D3840 sizeimage=3D4147200
mxc-isi 4ae40000.isi: validating link "crossbar":2 -> "mxc_isi.0":0
mxc-isi 4ae40000.isi: validating stream "crossbar":2:0 -> "mxc_isi.0":0:0
mxc-isi 4ae40000.isi: validating link "dw-mipi-csi2rx 4ae00000.mipi-csi":1 =
=2D> "crossbar":0
mxc-isi 4ae40000.isi: validating stream "dw-mipi-csi2rx 4ae00000.mipi-csi":=
1:0 -> "crossbar":0:0
mxc-isi 4ae40000.isi: validating link "imx327 4-001a":0 -> "dw-mipi-csi2rx =
4ae00000.mipi-csi":0
mxc-isi 4ae40000.isi: validating stream "imx327 4-001a":0:0 -> "dw-mipi-csi=
2rx 4ae00000.mipi-csi":0:0
mxc-isi 4ae40000.isi: enable streams "crossbar":2/0x1
mxc-isi 4ae40000.isi: collect_streams: "crossbar":2: found 0x1 enabled 0x0
imx290 4-001a: Frame descriptor on pad 0, type CSI-2
imx290 4-001a:   stream 0, code 0x300f, length 0, flags 0x0000, vc 0, dt 0x=
2b
dw-mipi-csi2rx 4ae00000.mipi-csi: Frame descriptor on pad 1, type CSI-2
dw-mipi-csi2rx 4ae00000.mipi-csi:        stream 0, code 0x300f, length 0, f=
lags 0x0000, vc 0, dt 0x2b
mxc-isi 4ae40000.isi: enable streams "dw-mipi-csi2rx 4ae00000.mipi-csi":1/0=
x1
dw-mipi-csi2rx 4ae00000.mipi-csi: collect_streams: "dw-mipi-csi2rx 4ae00000=
=2Emipi-csi":1: found 0x1 enabled 0x0
mxc-isi 4ae40000.isi: enable streams "imx327 4-001a":0/0x1
imx290 4-001a: collect_streams: sub-device "imx327 4-001a" does not support=
 streams
dw-mipi-csi2rx 4ae00000.mipi-csi: lanes are not in stop state: 0x0, expecte=
d 0x10003
mxc-isi 4ae40000.isi: disable streams "imx327 4-001a":0/0x1
imx290 4-001a: collect_streams: sub-device "imx327 4-001a" does not support=
 streams
mxc-isi 4ae40000.isi: enable streams 1:0x1 failed: -110
mxc-isi 4ae40000.isi: failed to enable streams 0x1 on 'dw-mipi-csi2rx 4ae00=
000.mipi-csi':1: -110
mxc-isi 4ae40000.isi: enable streams 2:0x1 failed: -110
mxc-isi 4ae40000.isi: Failed to enable pipe 0
video0: VIDIOC_STREAMON: error -110: type=3Dvid-cap-mplane
videodev: v4l2_release: video0: release
=2D-8<--

=46or completeness this is my media device config
=2D-8<--
# media-ctl  -p
Media controller API version 7.1.0

Media device information
=2D-----------------------
driver          mxc-isi
model           FSL Capture Media Device
serial         =20
bus info        platform:4ae40000.isi
hw revision     0x0
driver version  7.1.0

Device topology
=2D entity 1: crossbar (3 pads, 2 links, 1 route)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        routes:
                0/0 -> 2/0 [ACTIVE]
        pad0: SINK,MUST_CONNECT
                [stream:0 fmt:SRGGB10_1X10/1920x1080 field:none colorspace:=
raw]
                <- "dw-mipi-csi2rx 4ae00000.mipi-cs":1 [ENABLED,IMMUTABLE]
        pad1: SINK,MUST_CONNECT
        pad2: SOURCE
                [stream:0 fmt:SRGGB10_1X10/1920x1080 field:none colorspace:=
raw]
                -> "mxc_isi.0":0 [ENABLED,IMMUTABLE]

=2D entity 5: mxc_isi.0 (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev1
        pad0: SINK
                [stream:0 fmt:SRGGB10_1X10/1920x1080 field:none colorspace:=
raw
                 compose.bounds:(0,0)/1920x1080
                 compose:(0,0)/1920x1080]
                <- "crossbar":2 [ENABLED,IMMUTABLE]
        pad1: SOURCE
                [stream:0 fmt:SRGGB10_1X10/1920x1080 field:none colorspace:=
jpeg xfer:srgb ycbcr:601 quantization:full-range
                 crop.bounds:(0,0)/1920x1080
                 crop:(0,0)/1920x1080]
                -> "mxc_isi.0.capture":0 [ENABLED,IMMUTABLE]

=2D entity 8: mxc_isi.0.capture (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video0
        pad0: SINK
                <- "mxc_isi.0":1 [ENABLED,IMMUTABLE]

=2D entity 16: dw-mipi-csi2rx 4ae00000.mipi-cs (2 pads, 2 links, 1 route)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev2
        routes:
                0/0 -> 1/0 [ACTIVE]
        pad0: SINK,MUST_CONNECT
                [stream:0 fmt:SRGGB10_1X10/1920x1080 field:none colorspace:=
raw xfer:none ycbcr:601 quantization:full-range]
                <- "imx327 4-001a":0 [ENABLED]
        pad1: SOURCE
                [stream:0 fmt:SRGGB10_1X10/1920x1080 field:none colorspace:=
raw xfer:none ycbcr:601 quantization:full-range]
                -> "crossbar":0 [ENABLED,IMMUTABLE]

=2D entity 21: imx327 4-001a (1 pad, 1 link, 0 routes)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev3
        pad0: SOURCE
                [stream:0 fmt:SRGGB10_1X10/1920x1080 field:none colorspace:=
raw xfer:none ycbcr:601 quantization:full-range
                 crop.bounds:(0,0)/1945x1097
                 crop:(12,8)/1920x1080]
                -> "dw-mipi-csi2rx 4ae00000.mipi-cs":0 [ENABLED]
=2D-8<--

Anything odd here?

> You may need to remove any delays in the imx327 s_stream implementation, =
or=20
> ensure the sensor stays in LP-11 state until the CSI receiver is ready.
>=20
> If possible, could you share the imx327 driver code or check its s_stream=
 implementation?

It's essentially upstream in drivers/media/i2c/imx290.c.
I only have a dummy implementation for get_frame_desc and a small adjusteme=
nt
for my camera module regarding i2c access.

=2D-8<--
static int imx290_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
				 struct v4l2_mbus_frame_desc *fd)
{
	const struct v4l2_mbus_framefmt *format;
	struct v4l2_subdev_state *state;

	state =3D v4l2_subdev_lock_and_get_active_state(sd);
	format =3D v4l2_subdev_state_get_format(state, pad);
	v4l2_subdev_unlock_state(state);

	fd->type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
	fd->num_entries =3D 1;
	fd->entry[0].pixelcode =3D format->code;
	fd->entry[0].stream =3D 0;
	fd->entry[0].bus.csi2.vc =3D 0;
	fd->entry[0].bus.csi2.dt =3D MIPI_CSI2_DT_RAW10; //TODO: get_data_type_by_=
code(format->code);

	return 0;
}
=2D-8<--

Another thing. I use https://lore.kernel.org/imx/20250701-95_cam-v1-2-c5172=
bab387b@nxp.com/
for the D-PHY. Is there any update/progress on that driver?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



