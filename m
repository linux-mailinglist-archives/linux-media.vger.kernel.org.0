Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5376E4487
	for <lists+linux-media@lfdr.de>; Mon, 17 Apr 2023 12:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjDQKBU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Apr 2023 06:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjDQKBT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Apr 2023 06:01:19 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E852D62;
        Mon, 17 Apr 2023 03:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681725635; x=1713261635;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b/8P0WGhAa/Cc5Bb3QAKq9k0biS4kx5qfPVA+BMlmjs=;
  b=YVc7MD3hExk/dZeu7xbCKZpBsk/cevgu2StUj1ub+TDD1IfHk7q6U3/o
   1Q8lXPKpYlaAXvdyaK6pdCz++rtSTL/GshvxK8XodOhQW8b57l324YxMP
   cyNKyFjCRRAvtoAkRbqfjqC6oLzoSpgazP2INyoDc3nm3mzGM7+wQNV+H
   dX5SGcHOIcbrpWJ6BH1KkTvHOslyB7s8iwju7LIAuervGdYYy9CtUl41X
   ZF5iQP3bGsNpeN2Npcm8ZeL/lMB4pzCvbiZm9jI7AmfxGoNyZz6ngTlW6
   IFuPWGZZOeK7LMCZkVwlh0cKYvVtPtF+VU7CDF2ZukfNE6wiUaIfGmIfQ
   g==;
X-IronPort-AV: E=Sophos;i="5.99,203,1677538800"; 
   d="scan'208";a="30364744"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 17 Apr 2023 11:59:27 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 17 Apr 2023 11:59:27 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 17 Apr 2023 11:59:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681725567; x=1713261567;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b/8P0WGhAa/Cc5Bb3QAKq9k0biS4kx5qfPVA+BMlmjs=;
  b=L7vK7M+27Zq5hO2gFV99eTmlGC2x9BS7e7jaQWJt5xzWltqJZimF5seS
   P12V568buhFVCcepDb1oAFFqI9Izl/u2W0kPMPEIa4c0GT/CJ9eMpdJK+
   XkAStRwbQGZTC0wRvQLz+UsO0uKzsxK0GruKV/J0d9z5iIT5Z06xspfRC
   zpru3ItHvCtF61SB0hiVGtqbVAZqsKIMvuYbo8aMA34lKLQOTKZkX9J0g
   bKhobu/FGIYzYdy6oLoY8dEankUZM+/CjLfToIweppvm2aEe11f/+cqN3
   XVT/6aYtSM7x8e5L7WOCRC+xy6okZ0HMoI0mVihZRyJUoS4TqIdR8kaZe
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,203,1677538800"; 
   d="scan'208";a="30364743"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Apr 2023 11:59:27 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id ECF37280072;
        Mon, 17 Apr 2023 11:59:26 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Shawn Guo <shawnguo@kernel.org>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mp: Add CSIS DT nodes
Date:   Mon, 17 Apr 2023 11:59:25 +0200
Message-ID: <3232774.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230417081510.GA19964@pendragon.ideasonboard.com>
References: <20230417055627.16482-1-laurent.pinchart@ideasonboard.com> <20230417080117.jiqpynebq2we2hh4@pengutronix.de> <20230417081510.GA19964@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Montag, 17. April 2023, 10:15:10 CEST schrieb Laurent Pinchart:
> Hi Marco,
>=20
> On Mon, Apr 17, 2023 at 10:01:17AM +0200, Marco Felsch wrote:
> > On 23-04-17, Laurent Pinchart wrote:
> > > On Mon, Apr 17, 2023 at 08:50:59AM +0200, Marco Felsch wrote:
> > > > Hi Laurent,
> > > >=20
> > > > your patch LGTM just one nit/idea, please see below.
> > > >=20
> > > > On 23-04-17, Laurent Pinchart wrote:
> > > > > Add DT nodes for the two CSI-2 receivers of the i.MX8MP.
> > > > >=20
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.co=
m>
> > > > > ---
> > > > >=20
> > > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 60
> > > > >  +++++++++++++++++++++++
> > > > >  1 file changed, 60 insertions(+)
> > > > >=20
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > b/arch/arm64/boot/dts/freescale/imx8mp.dtsi index
> > > > > 2dd60e3252f3..2a374a4c14a2 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > @@ -1239,6 +1239,66 @@ ldb_lvds_ch1: endpoint {
> > > > >=20
> > > > >  				};
> > > > >  		=09
> > > > >  			};
> > > > >=20
> > > > > +			mipi_csi_0: csi@32e40000 {
> > > > > +				compatible =3D "fsl,imx8mp-
mipi-csi2", "fsl,imx8mm-mipi-csi2";
> > > > > +				reg =3D <0x32e40000 0x10000>;
> > > > > +				interrupts =3D <GIC_SPI 17=20
IRQ_TYPE_LEVEL_HIGH>;
> > > > > +				clock-frequency =3D=20
<500000000>;
> > > > > +				clocks =3D <&clk=20
IMX8MP_CLK_MEDIA_APB_ROOT>,
> > > > > +					 <&clk=20
IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT>,
> > > > > +					 <&clk=20
IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT>,
> > > > > +					 <&clk=20
IMX8MP_CLK_MEDIA_AXI_ROOT>;
> > > > > +				clock-names =3D "pclk",=20
"wrap", "phy", "axi";
> > > > > +				assigned-clocks =3D <&clk=20
IMX8MP_CLK_MEDIA_CAM1_PIX>;
> > > > > +				assigned-clock-parents =3D=20
<&clk IMX8MP_SYS_PLL2_1000M>;
> > > > > +				assigned-clock-rates =3D=20
<500000000>;
> > > > > +				power-domains =3D=20
<&media_blk_ctrl
> > > > > IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
> > > > > +				status =3D "disabled";
> > > > > +
> > > > > +				ports {
> > > > > +					#address-cells =3D=20
<1>;
> > > > > +					#size-cells =3D <0>;
> > > > > +
> > > > > +					port@0 {
> > > > > +						reg =3D=20
<0>;
> > > >=20
> > > > If we would add:
> > > > 						mipi_csi_0_in:=20
endpoint {};
> > > >=20
> > > > here we could refernce it from overlays/board dts files more easily.
> > >=20
> > > Isn't there an unwritten rule (or consensus) that an endpoint should
> > > always have a remote-endpoint property ?
> >=20
> > I don't know if there is one.
> >=20
> > > While ports describe hardware properties of a device and should always
> > > be there regardless of connections, endpoints describe connections and
> > > I don't think they should be instantiated with a valid
> > > remote-endpoint.
> >=20
> > I know, therefore I mentioned it as idea to make it 'easier' to add
> > camera nodes.
>=20
> As a middleground, would it be useful to have a label for the port ?
> Something like
>=20
> 	mipi_csi_0: csi@32e40000 {
> 		ports {
> 			mipi_csi_0_port_0: port@0 {
> 			};
> 		};
> 	};
>=20
> An overlay could then reference that and create the endpoint. I'm not
> entirely sure how useful that would be though, as the overlay would need
> to enable the CSI node anyway. Compare
>=20
> --------
> &mipi_csi_0 {
> 	status =3D "okay";
> };
>=20
> &mipi_csi_0_port_0 {
> 	mipi_csi_0_in: endpoint {
> 		remote-endpoint =3D <&imx327_out>;
> 	};
> };
> --------
>=20
> with
>=20
> --------
> &mipi_csi_0 {
> 	status =3D "okay";
>=20
> 	ports {
> 		port@0 {
> 			mipi_csi_0_in: endpoint {
> 				remote-endpoint =3D <&imx327_out>;
> 			};
> 		};
> 	};
> };
> --------
>=20
> I have a slight preference for the latter as it groups all the CSI0 data
> in a single overlay target, but if the former is generally preferred,
> I'm fine with that too.

The former is more compact, but also raises the following dtc warnings whil=
e=20
creating the .dtbo:
Warning (graph_endpoint): /fragment@4/__overlay__: graph endpoint node name=
=20
should be 'endpoint'
Warning (graph_endpoint): /fragment@4/__overlay__: graph connection to node=
 '/
fragment@1/__overlay__/ports/port@1/endpoint' is not bidirectional

for the following snippet:

&mipi_csi_0_out {
	remote-endpoint =3D <&isp1_in>;
};

I'm not sure if there is a chance to fix at all.

Best regards,
Alexander

>=20
> > > > > +					};
> > > > > +
> > > > > +					port@1 {
> > > > > +						reg =3D=20
<1>;
> > > > > +					};
> > > > > +				};
> > > > > +			};
> > > > > +
> > > > > +			mipi_csi_1: csi@32e50000 {
> > > > > +				compatible =3D "fsl,imx8mp-
mipi-csi2", "fsl,imx8mm-mipi-csi2";
> > > > > +				reg =3D <0x32e50000 0x10000>;
> > > > > +				interrupts =3D <GIC_SPI 80=20
IRQ_TYPE_LEVEL_HIGH>;
> > > > > +				clock-frequency =3D=20
<266000000>;
> > > > > +				clocks =3D <&clk=20
IMX8MP_CLK_MEDIA_APB_ROOT>,
> > > > > +					 <&clk=20
IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT>,
> > > > > +					 <&clk=20
IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT>,
> > > > > +					 <&clk=20
IMX8MP_CLK_MEDIA_AXI_ROOT>;
> > > > > +				clock-names =3D "pclk",=20
"wrap", "phy", "axi";
> > > > > +				assigned-clocks =3D <&clk=20
IMX8MP_CLK_MEDIA_CAM2_PIX>;
> > > > > +				assigned-clock-parents =3D=20
<&clk IMX8MP_SYS_PLL2_1000M>;
> > > > > +				assigned-clock-rates =3D=20
<266000000>;
> > > > > +				power-domains =3D=20
<&media_blk_ctrl
> > > > > IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
> > > > > +				status =3D "disabled";
> > > > > +
> > > > > +				ports {
> > > > > +					#address-cells =3D=20
<1>;
> > > > > +					#size-cells =3D <0>;
> > > > > +
> > > > > +					port@0 {
> > > > > +						reg =3D=20
<0>;
> > > > > +					};
> > > > > +
> > > > > +					port@1 {
> > > > > +						reg =3D=20
<1>;
> > > > > +					};
> > > > > +				};
> > > > > +			};
> > > > > +
> > > > >=20
> > > > >  			pcie_phy: pcie-phy@32f00000 {
> > > > >  		=09
> > > > >  				compatible =3D "fsl,imx8mp-
pcie-phy";
> > > > >  				reg =3D <0x32f00000 0x10000>;


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


