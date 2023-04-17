Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05A296E481E
	for <lists+linux-media@lfdr.de>; Mon, 17 Apr 2023 14:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbjDQMpb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Apr 2023 08:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbjDQMp3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Apr 2023 08:45:29 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B1A3C3;
        Mon, 17 Apr 2023 05:45:27 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id x8-20020a17090a6b4800b002474c5d3367so7810210pjl.2;
        Mon, 17 Apr 2023 05:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681735527; x=1684327527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMk9exMYjjdDJNTuBhM7AS0L6trr20lU8gX0Q2FmNlk=;
        b=rT9OuqM5jAiZuKGtjjeHOPszw76Yf3bdpSxCE9Uqi+uyJX8nFIKm8MW+Y1m2rSIJrR
         TgRKhqGtdAtEMluk4c6NGyNvI488hx7VpLmerifF1fy36MsG+zYffb5xg89d9km25zjZ
         2/gMPAvJh4RKa3KbiPlpmUpJApWNOfqtcf1zdllEpJ/XGR7NpswEdzySImStgeG0ahN2
         /X3vc8B8Y3JgeMhbU4ccqz/ZaNolQHLpQxarOCqP4zkxAMXk97mS8qWWFrzQG7trTlEW
         JK9bdCbbLaEIjIOIWUCUvFCdwWFahWGFSfgaJRGNNkf/gsZkAHb3+/3msPl5ejMAjp57
         l8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681735527; x=1684327527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMk9exMYjjdDJNTuBhM7AS0L6trr20lU8gX0Q2FmNlk=;
        b=RLVyDTpIZx5wmuC+IJ83GoDgipcjEL92D350MjYOXJKHsbNF+ln9ZfMK170DurXL1q
         ruvFD3CJoSVjpBlRI2uaY7q+5ws2TqybiwlPz69d/rQCWLZR9nMgQHLTAQnYUe6YpqMU
         dq3ET2k/9yNEeXag430Lsga/CMCA2P9z16dp7Qumbxl0jr0IEOMk7ou+wc2SQxLvouVa
         v3WzXwrkUGH/IoIUDP3Xh7pqKNJdJziMH5K4+KJxgDmgHsBtLOdhzV38l3GnCvbWKoOf
         QxLZxrQbsLontF1xn75kFACf/J002tI+hhKbGApVNqGCaA1Tcs7ICamMyaMypLIIiv/u
         QdnQ==
X-Gm-Message-State: AAQBX9ceZtkImosFD44Ahk0nY0QPxwowVGgeYrBLP4jxBILkSCUTyx//
        7k0Fk1E5DQy+ICAit505wS4pCVzU/fyVZSZWZtU=
X-Google-Smtp-Source: AKy350aPosra5Yx+M7BndBTj1NAnYWm72uxji2y0kobZst1HLL0OQDnupJCD43UNlBJEDCnqQKtGPT5EbLvlKy40V0I=
X-Received: by 2002:a17:903:18f:b0:1a6:8d3b:85e7 with SMTP id
 z15-20020a170903018f00b001a68d3b85e7mr3778458plg.3.1681735526873; Mon, 17 Apr
 2023 05:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230417055627.16482-1-laurent.pinchart@ideasonboard.com>
 <20230417080117.jiqpynebq2we2hh4@pengutronix.de> <20230417081510.GA19964@pendragon.ideasonboard.com>
 <3232774.44csPzL39Z@steina-w>
In-Reply-To: <3232774.44csPzL39Z@steina-w>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 17 Apr 2023 07:45:15 -0500
Message-ID: <CAHCN7xJ26TMD4U_5wTtGcGFHZBTTewVRd+mnKa5Ff5cRxBdHPA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mp: Add CSIS DT nodes
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Shawn Guo <shawnguo@kernel.org>, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 17, 2023 at 5:11=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Montag, 17. April 2023, 10:15:10 CEST schrieb Laurent Pinchart:
> > Hi Marco,
> >
> > On Mon, Apr 17, 2023 at 10:01:17AM +0200, Marco Felsch wrote:
> > > On 23-04-17, Laurent Pinchart wrote:
> > > > On Mon, Apr 17, 2023 at 08:50:59AM +0200, Marco Felsch wrote:
> > > > > Hi Laurent,
> > > > >
> > > > > your patch LGTM just one nit/idea, please see below.
> > > > >
> > > > > On 23-04-17, Laurent Pinchart wrote:
> > > > > > Add DT nodes for the two CSI-2 receivers of the i.MX8MP.
> > > > > >
> > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.=
com>
> > > > > > ---
> > > > > >
> > > > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 60
> > > > > >  +++++++++++++++++++++++
> > > > > >  1 file changed, 60 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > > b/arch/arm64/boot/dts/freescale/imx8mp.dtsi index
> > > > > > 2dd60e3252f3..2a374a4c14a2 100644
> > > > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > > @@ -1239,6 +1239,66 @@ ldb_lvds_ch1: endpoint {
> > > > > >
> > > > > >                               };
> > > > > >
> > > > > >                       };
> > > > > >
> > > > > > +                     mipi_csi_0: csi@32e40000 {
> > > > > > +                             compatible =3D "fsl,imx8mp-
> mipi-csi2", "fsl,imx8mm-mipi-csi2";
> > > > > > +                             reg =3D <0x32e40000 0x10000>;
> > > > > > +                             interrupts =3D <GIC_SPI 17
> IRQ_TYPE_LEVEL_HIGH>;
> > > > > > +                             clock-frequency =3D
> <500000000>;
> > > > > > +                             clocks =3D <&clk
> IMX8MP_CLK_MEDIA_APB_ROOT>,
> > > > > > +                                      <&clk
> IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT>,
> > > > > > +                                      <&clk
> IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT>,
> > > > > > +                                      <&clk
> IMX8MP_CLK_MEDIA_AXI_ROOT>;
> > > > > > +                             clock-names =3D "pclk",
> "wrap", "phy", "axi";
> > > > > > +                             assigned-clocks =3D <&clk
> IMX8MP_CLK_MEDIA_CAM1_PIX>;
> > > > > > +                             assigned-clock-parents =3D
> <&clk IMX8MP_SYS_PLL2_1000M>;
> > > > > > +                             assigned-clock-rates =3D
> <500000000>;
> > > > > > +                             power-domains =3D
> <&media_blk_ctrl
> > > > > > IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
> > > > > > +                             status =3D "disabled";
> > > > > > +
> > > > > > +                             ports {
> > > > > > +                                     #address-cells =3D
> <1>;
> > > > > > +                                     #size-cells =3D <0>;
> > > > > > +
> > > > > > +                                     port@0 {
> > > > > > +                                             reg =3D
> <0>;
> > > > >
> > > > > If we would add:
> > > > >                                                 mipi_csi_0_in:
> endpoint {};
> > > > >
> > > > > here we could refernce it from overlays/board dts files more easi=
ly.
> > > >
> > > > Isn't there an unwritten rule (or consensus) that an endpoint shoul=
d
> > > > always have a remote-endpoint property ?
> > >
> > > I don't know if there is one.
> > >
> > > > While ports describe hardware properties of a device and should alw=
ays
> > > > be there regardless of connections, endpoints describe connections =
and
> > > > I don't think they should be instantiated with a valid
> > > > remote-endpoint.
> > >
> > > I know, therefore I mentioned it as idea to make it 'easier' to add
> > > camera nodes.
> >
> > As a middleground, would it be useful to have a label for the port ?
> > Something like
> >
> >       mipi_csi_0: csi@32e40000 {
> >               ports {
> >                       mipi_csi_0_port_0: port@0 {
> >                       };
> >               };
> >       };
> >
> > An overlay could then reference that and create the endpoint. I'm not
> > entirely sure how useful that would be though, as the overlay would nee=
d
> > to enable the CSI node anyway. Compare
> >
> > --------
> > &mipi_csi_0 {
> >       status =3D "okay";
> > };
> >
> > &mipi_csi_0_port_0 {
> >       mipi_csi_0_in: endpoint {
> >               remote-endpoint =3D <&imx327_out>;
> >       };
> > };
> > --------
> >
> > with
> >
> > --------
> > &mipi_csi_0 {
> >       status =3D "okay";
> >
> >       ports {
> >               port@0 {
> >                       mipi_csi_0_in: endpoint {
> >                               remote-endpoint =3D <&imx327_out>;
> >                       };
> >               };
> >       };
> > };
> > --------
> >
> > I have a slight preference for the latter as it groups all the CSI0 dat=
a
> > in a single overlay target, but if the former is generally preferred,
> > I'm fine with that too.
>
> The former is more compact, but also raises the following dtc warnings wh=
ile
> creating the .dtbo:
> Warning (graph_endpoint): /fragment@4/__overlay__: graph endpoint node na=
me
> should be 'endpoint'
> Warning (graph_endpoint): /fragment@4/__overlay__: graph connection to no=
de '/
> fragment@1/__overlay__/ports/port@1/endpoint' is not bidirectional
>
> for the following snippet:
>
> &mipi_csi_0_out {
>         remote-endpoint =3D <&isp1_in>;
> };
>
> I'm not sure if there is a chance to fix at all.

Once there is consensus on how this should be generically plumbed,
please keep me in the loop, so I can add the corresponding imx8m Nano
trees as well.  I've tested Laurent's work for a while on the Nano
that I have.  I was going to push DT updates for Nano, then I saw this
conversation, so I decided to hold off for now.

adam
>
> Best regards,
> Alexander
>
> >
> > > > > > +                                     };
> > > > > > +
> > > > > > +                                     port@1 {
> > > > > > +                                             reg =3D
> <1>;
> > > > > > +                                     };
> > > > > > +                             };
> > > > > > +                     };
> > > > > > +
> > > > > > +                     mipi_csi_1: csi@32e50000 {
> > > > > > +                             compatible =3D "fsl,imx8mp-
> mipi-csi2", "fsl,imx8mm-mipi-csi2";
> > > > > > +                             reg =3D <0x32e50000 0x10000>;
> > > > > > +                             interrupts =3D <GIC_SPI 80
> IRQ_TYPE_LEVEL_HIGH>;
> > > > > > +                             clock-frequency =3D
> <266000000>;
> > > > > > +                             clocks =3D <&clk
> IMX8MP_CLK_MEDIA_APB_ROOT>,
> > > > > > +                                      <&clk
> IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT>,
> > > > > > +                                      <&clk
> IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT>,
> > > > > > +                                      <&clk
> IMX8MP_CLK_MEDIA_AXI_ROOT>;
> > > > > > +                             clock-names =3D "pclk",
> "wrap", "phy", "axi";
> > > > > > +                             assigned-clocks =3D <&clk
> IMX8MP_CLK_MEDIA_CAM2_PIX>;
> > > > > > +                             assigned-clock-parents =3D
> <&clk IMX8MP_SYS_PLL2_1000M>;
> > > > > > +                             assigned-clock-rates =3D
> <266000000>;
> > > > > > +                             power-domains =3D
> <&media_blk_ctrl
> > > > > > IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
> > > > > > +                             status =3D "disabled";
> > > > > > +
> > > > > > +                             ports {
> > > > > > +                                     #address-cells =3D
> <1>;
> > > > > > +                                     #size-cells =3D <0>;
> > > > > > +
> > > > > > +                                     port@0 {
> > > > > > +                                             reg =3D
> <0>;
> > > > > > +                                     };
> > > > > > +
> > > > > > +                                     port@1 {
> > > > > > +                                             reg =3D
> <1>;
> > > > > > +                                     };
> > > > > > +                             };
> > > > > > +                     };
> > > > > > +
> > > > > >
> > > > > >                       pcie_phy: pcie-phy@32f00000 {
> > > > > >
> > > > > >                               compatible =3D "fsl,imx8mp-
> pcie-phy";
> > > > > >                               reg =3D <0x32f00000 0x10000>;
>
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> http://www.tq-group.com/
>
>
