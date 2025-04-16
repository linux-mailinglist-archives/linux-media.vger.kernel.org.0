Return-Path: <linux-media+bounces-30365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C185A907A8
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 17:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3BD8447850
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 15:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88594207E0C;
	Wed, 16 Apr 2025 15:26:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420A0189BB5
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 15:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744817198; cv=none; b=f62UAn72B1F3x5fBNIhYzRNw88dIIwG13qs1HdyuPt7M0VrwAiZYv8gFXt+xBVCtRLWBtCnfEx4xnzpeor6SsR62WC5DcBwfGYHpN2qy5HauELsoLSs5qSvhpJcjHEdrJEG2CW1T2HjTWm3NUw37LlRnetiFIl1+Emy+Wfo9YKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744817198; c=relaxed/simple;
	bh=KHtSgO/TzKZZlMoL+dywjnaruMiJ//uEmODExUUP4yA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JTaInwNHiA0tJXZAGmTHEXwMYVVMJDzDAMyEhPqMpQD+vBJeL2Oc5yq/r3cxtSbLUHwJKfotnvpQyu7yj/czaK3QcJ4Uw6a7MNGfZIUObd4m4V9GRDWSatg0YAfGtVNhTsb8X/fXg1FrKJnUTQjnfxCsXALRKpu5eodltnSBJtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u54ea-0001Dd-Cb; Wed, 16 Apr 2025 17:26:20 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u54eZ-000bl3-3C;
	Wed, 16 Apr 2025 17:26:20 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u54eZ-000CSL-2v;
	Wed, 16 Apr 2025 17:26:19 +0200
Message-ID: <14f2bfcd4604c5cf8b92a7d0dfc685e1f56b768b.camel@pengutronix.de>
Subject: Re: [PATCH 1/1] dt-bindings: media: convert imx.txt to yaml format
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, "open list:MEDIA INPUT
 INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
  "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Wed, 16 Apr 2025 17:26:19 +0200
In-Reply-To: <Z//KCLUWlTMdsyd3@lizhi-Precision-Tower-5810>
References: <20250414210720.3359301-1-Frank.Li@nxp.com>
	 <20250416124226.GA2498696-robh@kernel.org>
	 <Z//KCLUWlTMdsyd3@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Mi, 2025-04-16 at 11:17 -0400, Frank Li wrote:
> On Wed, Apr 16, 2025 at 07:42:26AM -0500, Rob Herring wrote:
> > On Mon, Apr 14, 2025 at 05:07:18PM -0400, Frank Li wrote:
> > > Convert binding doc imx.txt to yaml format. Create two yaml files:
> > > fsl,imx6-mipi-csi2.yaml and fsl,imx-capture-subsystem.yaml.
> > >=20
> > > Additional changes:
> > > - add example for fsl,imx6-mipi-csi2
> > >=20
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  .../media/fsl,imx-capture-subsystem.yaml      |  38 ++++++
> > >  .../bindings/media/fsl,imx6-mipi-csi2.yaml    | 126 ++++++++++++++++=
++
> > >  .../devicetree/bindings/media/imx.txt         |  53 --------
> > >  3 files changed, 164 insertions(+), 53 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx-c=
apture-subsystem.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx6-=
mipi-csi2.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/media/imx.txt
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/media/fsl,imx-capture-=
subsystem.yaml b/Documentation/devicetree/bindings/media/fsl,imx-capture-su=
bsystem.yaml
> > > new file mode 100644
> > > index 0000000000000..77be3c1f37c5b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/fsl,imx-capture-subsyst=
em.yaml
> > > @@ -0,0 +1,38 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/fsl,imx-capture-subsystem.y=
aml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Freescale i.MX Media Video Device
> > > +
> ...
> > > +        reg =3D <0x021dc000 0x4000>;
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +        clocks =3D <&clks IMX6QDL_CLK_HSI_TX>,
> > > +                 <&clks IMX6QDL_CLK_VIDEO_27M>,
> > > +                 <&clks IMX6QDL_CLK_EIM_PODF>;
> > > +        clock-names =3D "dphy", "ref", "pix";
> > > +
> > > +        port@0 {
> > > +            reg =3D <0>;
> > > +
> > > +            endpoint {
> > > +                remote-endpoint =3D <&ov5640_to_mipi_csi2>;
> > > +                clock-lanes =3D <0>;
> > > +                data-lanes =3D <1 2>;
> > > +            };
> > > +        };
> >=20
> > I would think at least 1 output port is required?
>=20
> I checked dts file, only input port. I think old csi2 only need get data
> from camera. csi's dma should save to memory.

There are no ports in imx6qdl.dtsi, but there's a &mipi_csi with four
output ports in imx6q.dtsi and imx6dl.dtsi each, because whether data
flows through a mux or directly into the IPU CSI ports differs between
the two platforms.

regards
Philipp


