Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D71022762
	for <lists+linux-media@lfdr.de>; Sun, 19 May 2019 18:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfESQ72 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 May 2019 12:59:28 -0400
Received: from vps.xff.cz ([195.181.215.36]:43092 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726545AbfESQ72 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 May 2019 12:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1558274063; bh=lXTBePQTd66A2iS+g6VRPcxOuAD2+KiPtXMZZvonC7Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=neK8JtgsXP3XLtC81Zyx6VE8nBcKHll5MldQfBfDf7T2/nzOZo+FNT3sptDKnPgmE
         Tt9Ugu3Y18OSBH3bCGeTdfE5HCGy/zLHCqWsBwzWotZHkiMyMJLnxvgwh7af1zsLbg
         P0RKVp9/xpl+lcEUJIMHU/qO5UIlr2qwLZsQPHUU=
Date:   Sun, 19 May 2019 15:54:22 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH 4/6] ARM: dts: sun8i: a83t: Add device node for CSI
 (Camera Sensor Interface)
Message-ID: <20190519135422.l2bnumyjr3dxehhx@core.my.home>
Mail-Followup-To: Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20190408165744.11672-1-wens@kernel.org>
 <20190408165744.11672-5-wens@kernel.org>
 <20190409075804.4zrwjil7ie2gjigu@flea>
 <CAGb2v64CYV68Q0a7x5p-XabS74vaQWP3paPopodmqQPTOrq2gQ@mail.gmail.com>
 <20190409082818.z33mq2qrxethldzf@flea>
 <CAGb2v67pX+7ccihmGEWPKrXg8mMhht-vh37p2auWYgt=qGDA6A@mail.gmail.com>
 <20190409145225.2ltluiyqa5xha4zd@flea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190409145225.2ltluiyqa5xha4zd@flea>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On Tue, Apr 09, 2019 at 04:52:25PM +0200, Maxime Ripard wrote:
> On Tue, Apr 09, 2019 at 04:40:40PM +0800, Chen-Yu Tsai wrote:
> > On Tue, Apr 9, 2019 at 4:28 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > >
> > > On Tue, Apr 09, 2019 at 04:07:34PM +0800, Chen-Yu Tsai wrote:
> > > > On Tue, Apr 9, 2019 at 3:58 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > > > On Tue, Apr 09, 2019 at 12:57:42AM +0800, Chen-Yu Tsai wrote:
> > > > > > From: Chen-Yu Tsai <wens@csie.org>
> > > > > >
> > > > > > The A83T SoC has a camera sensor interface (known as CSI in Allwinner
> > > > > > lingo), which is similar to the one found on the A64 and H3. The only
> > > > > > difference seems to be that support of MIPI CSI through a connected
> > > > > > MIPI CSI-2 bridge.
> > > > > >
> > > > > > Add a device node for it, and pinctrl nodes for the commonly used MCLK
> > > > > > and 8-bit parallel interface. The property /omit-if-no-ref/ is added to
> > > > > > the pinctrl nodes to keep the device tree blob size down if they are
> > > > > > unused.
> > > > > >
> > > > > > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > > > > > ---
> > > > > >  arch/arm/boot/dts/sun8i-a83t.dtsi | 31 +++++++++++++++++++++++++++++++
> > > > > >  1 file changed, 31 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> > > > > > index f739b88efb53..0c52f945fd5f 100644
> > > > > > --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> > > > > > +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> > > > > > @@ -682,6 +682,20 @@
> > > > > >                       #interrupt-cells = <3>;
> > > > > >                       #gpio-cells = <3>;
> > > > > >
> > > > > > +                     /omit-if-no-ref/
> > > > > > +                     csi_8bit_parallel_pins: csi-8bit-parallel-pins {
> > > > > > +                             pins = "PE0", "PE2", "PE3", "PE6", "PE7",
> > > > > > +                                    "PE8", "PE9", "PE10", "PE11",
> > > > > > +                                    "PE12", "PE13";
> > > > > > +                             function = "csi";
> > > > > > +                     };
> > > > > > +
> > > > > > +                     /omit-if-no-ref/
> > > > > > +                     csi_mclk_pin: csi-mclk-pin {
> > > > > > +                             pins = "PE1";
> > > > > > +                             function = "csi";
> > > > > > +                     };
> > > > > > +
> > > > > >                       emac_rgmii_pins: emac-rgmii-pins {
> > > > > >                               pins = "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
> > > > > >                                      "PD11", "PD12", "PD13", "PD14", "PD18",
> > > > > > @@ -994,6 +1008,23 @@
> > > > > >                       interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
> > > > > >               };
> > > > > >
> > > > > > +             csi: camera@1cb0000 {
> > > > > > +                     compatible = "allwinner,sun8i-a83t-csi";
> > > > > > +                     reg = <0x01cb0000 0x1000>;
> > > > > > +                     interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> > > > > > +                     clocks = <&ccu CLK_BUS_CSI>,
> > > > > > +                              <&ccu CLK_CSI_SCLK>,
> > > > > > +                              <&ccu CLK_DRAM_CSI>;
> > > > > > +                     clock-names = "bus", "mod", "ram";
> > > > > > +                     resets = <&ccu RST_BUS_CSI>;
> > > > > > +                     status = "disabled";
> > > > > > +
> > > > > > +                     csi_in: port {
> > > > > > +                             #address-cells = <1>;
> > > > > > +                             #size-cells = <0>;
> > > > >
> > > > > If we expect a single enpoint, then we don't need the address-cells
> > > > > and size-cells properties.
> > > >
> > > > I wouldn't bet on anything. The way the Q8 tablets did front/back cameras
> > > > is kind of genius if not very hacky. They have two "identical" sensors
> > > > on the same I2C bus and CSI bus, with shared reset line but separate
> > > > shutdown lines. Since they are identical, they also have the same I2C
> > > > address. I haven't figured out how to model this in the device tree.
> > > >
> > > > The point is, it's perfectly possible to have two or more sensors use
> > > > the same controller, provided only one be active at a time.
> > >
> > > Right, but I guess the common case would be to have a single sensor,
> > > where that wouldn't be needed.
> > >
> > > In odd cases, we can always specify it in the DTS, and if it becomes
> > > common enough, we can move it to the DTSI.
> >
> > Makes sense. Do you want me to re-spin?
> 
> If there's no other comment, we'll fix it when applying.

This patch series seems to have been forgotten. It doesn't seem there are any
blockers. Can you please apply it now? I have some further series (camera module
support for TBS-A711) that depend on this.

thank you and regards,
	Ondrej

> Maxime
> 
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

