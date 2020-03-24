Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E06321915CF
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 17:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbgCXQMi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 12:12:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45828 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728910AbgCXQM0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 12:12:26 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CB43308;
        Tue, 24 Mar 2020 17:12:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585066344;
        bh=h9AU8lIpV7OHn82ip0Jw12bYSRW82NU8UY8yuWnDD/A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jhEyVSolpqtVGQVGQ7ZsK5akEab88MiGhWEvbC4a6HAJothOGvP7rBw4+LTm2kv0x
         y1e8bNcrGWMkklZyBCMKRgPkxOhFV4YXN0t5YMPn8WIZ9z+KUQsjYmK/kUnZKeJZNw
         oyuI3ypKkx8sJze7gPlnVR/a+roJIFn2QjyRGBCw=
Date:   Tue, 24 Mar 2020 18:12:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        LAK <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH v3 1/4] media: dt-bindings: media: i2c: Switch to
 assigned-clock-rates
Message-ID: <20200324161221.GA27805@pendragon.ideasonboard.com>
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584133954-6953-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200319124452.3yfcvq754vi4q2rv@gilmour.lan>
 <20200319130348.GC4872@pendragon.ideasonboard.com>
 <CA+V-a8s-GZsYuBLyGnzURZfGD42f0c+QEan6FSwb2ew1=7Gj3g@mail.gmail.com>
 <20200324154045.whiy6uvlg2mrjv5a@gilmour.lan>
 <CA+V-a8tMVoJOdgM_S0sJ0WEGhwBirCC4mi-TtxLCn1SKVXXiBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+V-a8tMVoJOdgM_S0sJ0WEGhwBirCC4mi-TtxLCn1SKVXXiBQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Tue, Mar 24, 2020 at 04:04:43PM +0000, Lad, Prabhakar wrote:
> On Tue, Mar 24, 2020 at 3:40 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Thu, Mar 19, 2020 at 01:17:51PM +0000, Lad, Prabhakar wrote:
> > > On Thu, Mar 19, 2020 at 1:04 PM Laurent Pinchart wrote:
> > > > On Thu, Mar 19, 2020 at 01:44:52PM +0100, Maxime Ripard wrote:
> > > > > On Fri, Mar 13, 2020 at 09:12:31PM +0000, Lad Prabhakar wrote:
> > > > > > Use assigned-clock-rates to specify the clock rate. Also mark
> > > > > > clock-frequency property as deprecated.
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > ---
> > > > > >  Documentation/devicetree/bindings/media/i2c/ov5645.txt | 5 +++--
> > > > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > > > > > index 72ad992..e62fe82 100644
> > > > > > --- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > > > > > @@ -8,7 +8,7 @@ Required Properties:
> > > > > >  - compatible: Value should be "ovti,ov5645".
> > > > > >  - clocks: Reference to the xclk clock.
> > > > > >  - clock-names: Should be "xclk".
> > > > > > -- clock-frequency: Frequency of the xclk clock.
> > > > > > +- clock-frequency (deprecated): Frequency of the xclk clock.
> > > > > >  - enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
> > > > > >    to the hardware pin PWDNB which is physically active low.
> > > > > >  - reset-gpios: Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
> > > > > > @@ -37,7 +37,8 @@ Example:
> > > > > >
> > > > > >                     clocks = <&clks 200>;
> > > > > >                     clock-names = "xclk";
> > > > > > -                   clock-frequency = <24000000>;
> > > > > > +                   assigned-clocks = <&clks 200>;
> > > > > > +                   assigned-clock-rates = <24000000>;
> > > > > >
> > > > > >                     vdddo-supply = <&camera_dovdd_1v8>;
> > > > > >                     vdda-supply = <&camera_avdd_2v8>;
> > > > >
> > > > > clock-frequency is quite different from assigned-clock-rates though,
> > > > > semantically speaking. clock-frequency is only about what the clock
> > > > > frequency is, while assigned-clock-rates will change the rate as well,
> > > > > and you have no idea how long it will last.
> > > >
> > > > The driver currently reads the clock-frequency property and then calls
> > > > clk_set_rate(). I agree tht assigned-clock-rates isn't a panacea, but I
> > > > think it's less of a hack than what we currently have.
> > > >
> > > > As discussed on IRC, maybe the best option in this specific case is to
> > > > drop clock-frequency and assigned-clok-rates, and call clk_set_rate()
> > > > with a hardcoded frequency of 24MHz in the driver, as that's the only
> > > > frequency the driver supports.
> > > >
> > > Does this mean any driver which has a fixed clock requirement shouldn't be a
> > > DT property and should be just handled by the drivers internally ?
> >
> > It's hard to give a generic policy, but here, the hardware is pretty
> > flexible since it can deal with anything between 6MHz to 50-something
> > MHz, it's the driver that chooses to enforce a 24MHz and be pedantic
> > about it, so it's up to the driver to enforce that policy, not to the
> > DT since it's essentially a software limitation, not a hardware one.
>
> Thank you for the clarification, Ill drop patches 1-4 from this series.

That's the whole series... :-) I think you should keep patch 1/4 but
just remove the clock-frequency from the bindings, then remove it from
the DT files, and patch the driver to set the clock rate to 24MHz
unconditionally in patch 4/4.

-- 
Regards,

Laurent Pinchart
