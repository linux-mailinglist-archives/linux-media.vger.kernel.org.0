Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C090C690B37
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 15:02:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbjBIOCe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 09:02:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbjBIOCa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 09:02:30 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE53E5241
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 06:02:28 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pQ7VL-000108-2X; Thu, 09 Feb 2023 15:02:27 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pQ7VJ-0001XR-Se; Thu, 09 Feb 2023 15:02:25 +0100
Date:   Thu, 9 Feb 2023 15:02:25 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 08/16] ARM: dts: imx7d: add node for PXP
Message-ID: <20230209140225.GC30549@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org
References: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
 <20230112-imx-pxp-v2-8-e2281da1db55@pengutronix.de>
 <Y8V6yU8bZoVt32wN@pendragon.ideasonboard.com>
 <20230120090609.GB13264@pengutronix.de>
 <Y8pc2IZl09iNaUiR@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8pc2IZl09iNaUiR@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shawn,

On Fri, 20 Jan 2023 11:20:24 +0200, Laurent Pinchart wrote:
> On Fri, Jan 20, 2023 at 10:06:09AM +0100, Michael Tretter wrote:
> > On Mon, 16 Jan 2023 18:26:49 +0200, Laurent Pinchart wrote:
> > > On Fri, Jan 13, 2023 at 10:54:14AM +0100, Michael Tretter wrote:
> > > > The i.MX7d contains a Pixel Pipeline in version 3.0. Add the device tree
> > > > node to make it available.
> > > > 
> > > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > 
> > > Should this go through Shawn's tree ? If so, how would you like to
> > > handle the dependency on the DT bindings in patch 01/16 ?
> > 
> > There is no actual dependency. The binding was already specified as a txt,
> > just not as a yaml, and the added node matches both.
> 
> Good point. I'll send a pull request for the series then, without this
> patch, which can be picked by Shawn separately.

Can you pick this patch or should I resend it as a separate series?

Michael

> 
> > > > ---
> > > > Changelog
> > > > 
> > > > v2:
> > > > 
> > > > - fix alignment
> > > > ---
> > > >  arch/arm/boot/dts/imx7d.dtsi | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > > 
> > > > diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
> > > > index 7ceb7c09f7ad..4b94b8afb55d 100644
> > > > --- a/arch/arm/boot/dts/imx7d.dtsi
> > > > +++ b/arch/arm/boot/dts/imx7d.dtsi
> > > > @@ -165,6 +165,15 @@ pcie_phy: pcie-phy@306d0000 {
> > > >  		  reg = <0x306d0000 0x10000>;
> > > >  		  status = "disabled";
> > > >  	};
> > > > +
> > > > +	pxp: pxp@30700000 {
> > > > +		compatible = "fsl,imx7d-pxp";
> > > > +		reg = <0x30700000 0x10000>;
> > > > +		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> > > > +			     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> > > > +		clocks = <&clks IMX7D_PXP_CLK>;
> > > > +		clock-names = "axi";
> > > > +	};
> > > >  };
> > > >  
> > > >  &aips3 {
