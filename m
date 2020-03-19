Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7EB18B3DC
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 14:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbgCSND5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 09:03:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42244 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbgCSND4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 09:03:56 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B98EA53;
        Thu, 19 Mar 2020 14:03:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584623034;
        bh=D1jU5CecA8xmxcxpuPAP4tWuL8Jb5B+/4IYit8jX3O8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f/2X+PGB9yBjdoPWDUPQluoD2ZTKNIlyTlrfleMbp07PhAnFnYboOGvf4RuR5sczj
         pz3qd7BHaRLVYrTMmPRH85jd7mrnmw50+rai0pAUEjPAaD3Jr/xdWmF+kqzURJ1A5w
         BfrL2lEgZgAp36XWI89ffk9rD1B1wz9CGhDMMLsA=
Date:   Thu, 19 Mar 2020 15:03:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] media: dt-bindings: media: i2c: Switch to
 assigned-clock-rates
Message-ID: <20200319130348.GC4872@pendragon.ideasonboard.com>
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584133954-6953-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200319124452.3yfcvq754vi4q2rv@gilmour.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200319124452.3yfcvq754vi4q2rv@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On Thu, Mar 19, 2020 at 01:44:52PM +0100, Maxime Ripard wrote:
> On Fri, Mar 13, 2020 at 09:12:31PM +0000, Lad Prabhakar wrote:
> > Use assigned-clock-rates to specify the clock rate. Also mark
> > clock-frequency property as deprecated.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/media/i2c/ov5645.txt | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > index 72ad992..e62fe82 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > @@ -8,7 +8,7 @@ Required Properties:
> >  - compatible: Value should be "ovti,ov5645".
> >  - clocks: Reference to the xclk clock.
> >  - clock-names: Should be "xclk".
> > -- clock-frequency: Frequency of the xclk clock.
> > +- clock-frequency (deprecated): Frequency of the xclk clock.
> >  - enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
> >    to the hardware pin PWDNB which is physically active low.
> >  - reset-gpios: Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
> > @@ -37,7 +37,8 @@ Example:
> >
> >  			clocks = <&clks 200>;
> >  			clock-names = "xclk";
> > -			clock-frequency = <24000000>;
> > +			assigned-clocks = <&clks 200>;
> > +			assigned-clock-rates = <24000000>;
> >
> >  			vdddo-supply = <&camera_dovdd_1v8>;
> >  			vdda-supply = <&camera_avdd_2v8>;
> 
> clock-frequency is quite different from assigned-clock-rates though,
> semantically speaking. clock-frequency is only about what the clock
> frequency is, while assigned-clock-rates will change the rate as well,
> and you have no idea how long it will last.

The driver currently reads the clock-frequency property and then calls
clk_set_rate(). I agree tht assigned-clock-rates isn't a panacea, but I
think it's less of a hack than what we currently have.

As discussed on IRC, maybe the best option in this specific case is to
drop clock-frequency and assigned-clok-rates, and call clk_set_rate()
with a hardcoded frequency of 24MHz in the driver, as that's the only
frequency the driver supports.

> If you want to retrieve that through the clock framework, then just
> making clock-frequency optional is enough and falling back to
> clk_get_rate on the clocks property already provided is enough.

-- 
Regards,

Laurent Pinchart
