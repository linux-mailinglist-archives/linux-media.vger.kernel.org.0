Return-Path: <linux-media+bounces-1418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD917FF3A0
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 16:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5A09B20BE5
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 15:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2CA524D4;
	Thu, 30 Nov 2023 15:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="oLpueGYD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B2D1B3;
	Thu, 30 Nov 2023 07:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1701358454; x=1732894454;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p4r8DqCKtUKU9Qhg/FMxYaHj1gTRi3Rjjn7C+3DYYlw=;
  b=oLpueGYDoT567i3Z1GqI7LvLHr/6p53tF93dqZkb23/4dI2ouYiOelwd
   6sav2gcTwvEwnQ50m0LNfprfXJQyJdIhZP4giY7oZyufzw0vrXzvgPG4N
   Xvayqju8Tj1iU2stlFDa41Vcscww2GjvM1YtZSFD1JjbqgIn+9ixtlQOu
   MUvNDSiBGFDVB8ag9oUiJpQInjZ4608ep/4/bDkSxBQcpaao+6aFL5BFg
   2XOJeI3AqTZnOCS148ACxm5xMFZk2Ox5O16/8bQFMRh9SQBLz+rjW+NeF
   KlV8r6JTQw+5zJAZrLqB0sRca2ZQMG0xwi3cFDXjtTb6vIGwMMlAL9dAC
   Q==;
X-IronPort-AV: E=Sophos;i="6.04,239,1695679200"; 
   d="scan'208";a="34265862"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 30 Nov 2023 16:34:12 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D9705280075;
	Thu, 30 Nov 2023 16:34:11 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>, kieran.bingham@ideasonboard.com, tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Tim Harvey <tharvey@gateworks.com>, Philippe Schenker <philippe.schenker@toradex.com>, Marek Vasut <marex@denx.de>, Gregor Herburger <gregor.herburger@ew.tq-group.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mp: Add overlays for ISP instances
Date: Thu, 30 Nov 2023 16:34:11 +0100
Message-ID: <1874751.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231130142048.GR8402@pendragon.ideasonboard.com>
References: <20231129093113.255161-1-paul.elder@ideasonboard.com> <5734628.DvuYhMxLoT@steina-w> <20231130142048.GR8402@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Laurent,

Am Donnerstag, 30. November 2023, 15:20:48 CET schrieb Laurent Pinchart:
> Hi Alexander,
>=20
> On Thu, Nov 30, 2023 at 10:51:22AM +0100, Alexander Stein wrote:
> > Am Mittwoch, 29. November 2023, 16:16:37 CET schrieb Laurent Pinchart:
> > > On Wed, Nov 29, 2023 at 11:20:07AM +0100, Alexander Stein wrote:
> > > > Am Mittwoch, 29. November 2023, 10:31:13 CET schrieb Paul Elder:
> > > > > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > >=20
> > > > > Add two overlay to enable each ISP instance. The ISP is wired
> > > > > directly
> > > > > to the CSIS for now, bypassing the ISI completely.
> > > >=20
> > > > I'm not sure if this is worth adding in a separate overlay.
> > >=20
> > > The trouble is that, at this point, selection between the ISP and the
> > > ISI can only be performed through DT :-S That's why this is implement=
ed
> > > as an overlay.
> >=20
> > I feel a better place would be the overlay which actually adds the sens=
or.
> > This knows best whether ISI or ISP should be used.
>=20
> Any sensor could be used with either the ISI or the ISP, so I don't
> think the camera module overlay would be the best place for this. Unless
> you want to duplicate all camera module overlays, with an ISI version
> and an ISP version :-)

True, that's a really good argument for having these small overlays.
But how to deal with dtc warnings?
> imx8mp-isp1.dtbo: Warning (graph_port): /fragment@2: graph port node name=
=20
should be 'port'
> imx8mp-isp1.dtso:34.17-36.3: Warning (graph_endpoint): /fragment@2/
__overlay__: graph endpoint node name should be 'endpoint'
> imx8mp-isp1.dtso:34.17-36.3: Warning (graph_endpoint): /fragment@2/
__overlay__: graph connection to node '/fragment@1/__overlay__/ports/port@1/
endpoint' is not bidirectional

But for the small overlay itself:
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.co=
m>
> > > > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > > > ---
> > > > >=20
> > > > >  arch/arm64/boot/dts/freescale/Makefile        |  2 ++
> > > > >  .../arm64/boot/dts/freescale/imx8mp-isp1.dtso | 36
> > > > >  +++++++++++++++++++
> > > > >  .../arm64/boot/dts/freescale/imx8mp-isp2.dtso | 36
> > > > >  +++++++++++++++++++
> > > > >  3 files changed, 74 insertions(+)
> > > > >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-isp1.dtso
> > > > >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-isp2.dtso
> > > > >=20
> > > > > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > > > > b/arch/arm64/boot/dts/freescale/Makefile index
> > > > > 300049037eb0..f97dfac11189
> > > > > 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/Makefile
> > > > > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > > > > @@ -113,6 +113,8 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-dhcom-pdk2=
=2Edtb
> > > > >=20
> > > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-dhcom-pdk3.dtb
> > > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-evk.dtb
> > > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-icore-mx8mp-edimm2.2.dtb
> > > > >=20
> > > > > +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-isp1.dtbo
> > > > > +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-isp2.dtbo
> > > > >=20
> > > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-msc-sm2s-ep1.dtb
> > > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-phyboard-pollux-rdk.dtb
> > > > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mpxl.dtb
> > > > >=20
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-isp1.dtso
> > > > > b/arch/arm64/boot/dts/freescale/imx8mp-isp1.dtso new file mode
> > > > > 100644
> > > > > index 000000000000..cf394ed224ab
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-isp1.dtso
> > > > > @@ -0,0 +1,36 @@
> > > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > > +/*
> > > > > + * Copyright 2022 Ideas on Board Oy
> > > > > + */
> > > > > +
> > > > > +/dts-v1/;
> > > > > +/plugin/;
> > > > > +
> > > > > +#include <dt-bindings/media/video-interfaces.h>
> > > > > +
> > > > > +&isi_0 {
> > > > > +	status =3D "disabled";
> > > >=20
> > > > ISI is disabled by default. What is your intention here?
> > >=20
> > > It could be enabled by an overlay for a camera module. Ideally we want
> > > to be able to enable both the ISI and ISP at runtime, but that's not
> > > possible yet and will require a very large amount of work.
> >=20
> > Again IMHO this is part of sensor setup, in a very specific overlay. To
> > put it into different words: I barely see the gain of this small overla=
y.
> >=20
> > Runtime switching would require a combined media controller including b=
oth
> > ISI and ISP, no?
>=20
> Correct, that's the hard part.
>=20
> > > > > +
> > > > > +	ports {
> > > > > +		port@0 {
> > > > > +			/delete-node/ endpoint;
> > > >=20
> > > > This doesn't work in overlays. See [1]. Otherwise the OF graph
> > > > connections
> > > > look fine to me. I'm using the same in my local overlay.
> > >=20
> > > Interesting, I wasn't aware of that. Maybe we should fix it :-)
> > >=20
> > > > [1]
> > > > https://lore.kernel.org/all/CAMuHMdWu4KZbBkvEofUV2wuA1g2S=3DXHHM3RU=
N1cN
> > > > rcZBkhsPZA@mail.gmail.com/> > >=20
> > > > > +		};
> > > > > +	};
> > > > > +};
> > > > > +
> > > > > +&isp_0 {
> > > > > +	status =3D "okay";
> > > > > +
> > > > > +	ports {
> > > > > +		port@1 {
> > > > > +			isp0_in: endpoint {
> > > > > +				bus-type =3D=20
<MEDIA_BUS_TYPE_PARALLEL>;
> > > > > +				remote-endpoint =3D=20
<&mipi_csi_0_out>;
> > > > > +			};
> > > > > +		};
> > > > > +	};
> > > > > +};
> > > > > +
> > > > > +&mipi_csi_0_out {
> > > > > +	remote-endpoint =3D <&isp0_in>;
> > > > > +};
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-isp2.dtso
> > > > > b/arch/arm64/boot/dts/freescale/imx8mp-isp2.dtso new file mode
> > > > > 100644
> > > > > index 000000000000..14e2e7b2617f
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-isp2.dtso
> > > > > @@ -0,0 +1,36 @@
> > > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > > +/*
> > > > > + * Copyright 2022 Ideas on Board Oy
> > > > > + */
> > > > > +
> > > > > +/dts-v1/;
> > > > > +/plugin/;
> > > > > +
> > > > > +#include <dt-bindings/media/video-interfaces.h>
> > > > > +
> > > > > +&isi_0 {
> > > > > +	status =3D "disabled";
> > > > > +
> > > > > +	ports {
> > > > > +		port@1 {
> > > > > +			/delete-node/ endpoint;
> > > > > +		};
> > > > > +	};
> > > > > +};
> > > > > +
> > > > > +&isp_1 {
> > > > > +	status =3D "okay";
> > > > > +
> > > > > +	ports {
> > > > > +		port@1 {
> > > > > +			isp1_in: endpoint {
> > > > > +				bus-type =3D=20
<MEDIA_BUS_TYPE_PARALLEL>;
> > > > > +				remote-endpoint =3D=20
<&mipi_csi_1_out>;
> > > > > +			};
> > > > > +		};
> > > > > +	};
> > > > > +};
> > > > > +
> > > > > +&mipi_csi_1_out {
> > > > > +	remote-endpoint =3D <&isp1_in>;
> > > > > +};


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



