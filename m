Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20F0E23BA8
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 17:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388307AbfETPHS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 11:07:18 -0400
Received: from vps.xff.cz ([195.181.215.36]:54862 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731505AbfETPHS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 11:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1558364835; bh=TEr7i31yNx24HM5cWJqgaJZtfhPyh6xdxVF9Qq8QrB8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HnaRjJ3KC9vtsRLMjH40GJAQFZtQMiki01p2lAI6c+0A/ZgxPryJQlZeGV/WnPNlB
         X713wATpHj2aOsFTjPK+0AwXuE5JCSE+A7/DUckBwZYWVpSc0sBirvBRSGDWNzYQ7J
         sUbuR0EylqAHq8jyZG/ntcnbmM7o6R/tvbFCUUls=
Date:   Mon, 20 May 2019 17:07:15 +0200
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
Message-ID: <20190520150715.revitoh3edeps7du@core.my.home>
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
References: <20190408165744.11672-5-wens@kernel.org>
 <20190409075804.4zrwjil7ie2gjigu@flea>
 <CAGb2v64CYV68Q0a7x5p-XabS74vaQWP3paPopodmqQPTOrq2gQ@mail.gmail.com>
 <20190409082818.z33mq2qrxethldzf@flea>
 <CAGb2v67pX+7ccihmGEWPKrXg8mMhht-vh37p2auWYgt=qGDA6A@mail.gmail.com>
 <20190409145225.2ltluiyqa5xha4zd@flea>
 <20190519135422.l2bnumyjr3dxehhx@core.my.home>
 <20190520111048.cnh435fnmz7esyks@flea>
 <20190520113854.ngyaw4mgki77gdbn@core.my.home>
 <20190520140550.hgywrzgmaswmguev@flea>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190520140550.hgywrzgmaswmguev@flea>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 20, 2019 at 04:05:50PM +0200, Maxime Ripard wrote:
> On Mon, May 20, 2019 at 01:38:54PM +0200, Ondřej Jirman wrote:
> > Hi Maxime,
> >
> > On Mon, May 20, 2019 at 01:10:49PM +0200, Maxime Ripard wrote:
> > > Hi Ondřej,
> > >
> > > On Sun, May 19, 2019 at 03:54:22PM +0200, Ondřej Jirman wrote:
> > > > On Tue, Apr 09, 2019 at 04:52:25PM +0200, Maxime Ripard wrote:
> > > > > On Tue, Apr 09, 2019 at 04:40:40PM +0800, Chen-Yu Tsai wrote:
> > > > > > On Tue, Apr 9, 2019 at 4:28 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > > > > >
> > > > > > > On Tue, Apr 09, 2019 at 04:07:34PM +0800, Chen-Yu Tsai wrote:
> > > > > > > > On Tue, Apr 9, 2019 at 3:58 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > > > > > > > On Tue, Apr 09, 2019 at 12:57:42AM +0800, Chen-Yu Tsai wrote:
> > > > > > > > > > From: Chen-Yu Tsai <wens@csie.org>
> > > > > > > > > >
> > > > > > > > > > The A83T SoC has a camera sensor interface (known as CSI in Allwinner
> > > > > > > > > > lingo), which is similar to the one found on the A64 and H3. The only
> > > > > > > > > > difference seems to be that support of MIPI CSI through a connected
> > > > > > > > > > MIPI CSI-2 bridge.
> > > > > > > > > >
> > > > > > > > > > Add a device node for it, and pinctrl nodes for the commonly used MCLK
> > > > > > > > > > and 8-bit parallel interface. The property /omit-if-no-ref/ is added to
> > > > > > > > > > the pinctrl nodes to keep the device tree blob size down if they are
> > > > > > > > > > unused.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > > > > > > > > > ---
> > > > > > > > > >  arch/arm/boot/dts/sun8i-a83t.dtsi | 31 +++++++++++++++++++++++++++++++
> > > > > > > > > >  1 file changed, 31 insertions(+)
> > > > > > > > > >
> > > > > > > > > > diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> > > > > > > > > > index f739b88efb53..0c52f945fd5f 100644
> > > > > > > > > > --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> > > > > > > > > > +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> > > > > > > > > > @@ -682,6 +682,20 @@
> > > > > > > > > >                       #interrupt-cells = <3>;
> > > > > > > > > >                       #gpio-cells = <3>;
> > > > > > > > > >
> > > > > > > > > > +                     /omit-if-no-ref/
> > > > > > > > > > +                     csi_8bit_parallel_pins: csi-8bit-parallel-pins {
> > > > > > > > > > +                             pins = "PE0", "PE2", "PE3", "PE6", "PE7",
> > > > > > > > > > +                                    "PE8", "PE9", "PE10", "PE11",
> > > > > > > > > > +                                    "PE12", "PE13";
> > > > > > > > > > +                             function = "csi";
> > > > > > > > > > +                     };
> > > > > > > > > > +
> > > > > > > > > > +                     /omit-if-no-ref/
> > > > > > > > > > +                     csi_mclk_pin: csi-mclk-pin {
> > > > > > > > > > +                             pins = "PE1";
> > > > > > > > > > +                             function = "csi";
> > > > > > > > > > +                     };
> > > > > > > > > > +
> > > > > > > > > >                       emac_rgmii_pins: emac-rgmii-pins {
> > > > > > > > > >                               pins = "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
> > > > > > > > > >                                      "PD11", "PD12", "PD13", "PD14", "PD18",
> > > > > > > > > > @@ -994,6 +1008,23 @@
> > > > > > > > > >                       interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
> > > > > > > > > >               };
> > > > > > > > > >
> > > > > > > > > > +             csi: camera@1cb0000 {
> > > > > > > > > > +                     compatible = "allwinner,sun8i-a83t-csi";
> > > > > > > > > > +                     reg = <0x01cb0000 0x1000>;
> > > > > > > > > > +                     interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > > > +                     clocks = <&ccu CLK_BUS_CSI>,
> > > > > > > > > > +                              <&ccu CLK_CSI_SCLK>,
> > > > > > > > > > +                              <&ccu CLK_DRAM_CSI>;
> > > > > > > > > > +                     clock-names = "bus", "mod", "ram";
> > > > > > > > > > +                     resets = <&ccu RST_BUS_CSI>;
> > > > > > > > > > +                     status = "disabled";
> > > > > > > > > > +
> > > > > > > > > > +                     csi_in: port {
> > > > > > > > > > +                             #address-cells = <1>;
> > > > > > > > > > +                             #size-cells = <0>;
> > > > > > > > >
> > > > > > > > > If we expect a single enpoint, then we don't need the address-cells
> > > > > > > > > and size-cells properties.
> > > > > > > >
> > > > > > > > I wouldn't bet on anything. The way the Q8 tablets did front/back cameras
> > > > > > > > is kind of genius if not very hacky. They have two "identical" sensors
> > > > > > > > on the same I2C bus and CSI bus, with shared reset line but separate
> > > > > > > > shutdown lines. Since they are identical, they also have the same I2C
> > > > > > > > address. I haven't figured out how to model this in the device tree.
> > > > > > > >
> > > > > > > > The point is, it's perfectly possible to have two or more sensors use
> > > > > > > > the same controller, provided only one be active at a time.
> > > > > > >
> > > > > > > Right, but I guess the common case would be to have a single sensor,
> > > > > > > where that wouldn't be needed.
> > > > > > >
> > > > > > > In odd cases, we can always specify it in the DTS, and if it becomes
> > > > > > > common enough, we can move it to the DTSI.
> > > > > >
> > > > > > Makes sense. Do you want me to re-spin?
> > > > >
> > > > > If there's no other comment, we'll fix it when applying.
> > > >
> > > > This patch series seems to have been forgotten. It doesn't seem there are any
> > > > blockers.
> > >
> > > Sorry about that :/
> > >
> > > > Can you please apply it now? I have some further series (camera module
> > > > support for TBS-A711) that depend on this.
> > >
> > > Some parts of it will have to be merged through v4l2, and I can't
> > > apply those patches.
> > >
> > > Can you resend that series, and ping on a regular basis (like once a
> > > week) if you don't get any feedback?
> >
> > You mean this series for A83t CSI?
> 
> Yes

Ok, done. :)

regards,
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

