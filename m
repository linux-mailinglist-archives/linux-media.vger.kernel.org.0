Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCB9183CFA
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 00:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgCLXDA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 19:03:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33784 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbgCLXDA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 19:03:00 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2B7F5F;
        Fri, 13 Mar 2020 00:02:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584054177;
        bh=n1RmDaPINq/9UEwuYap1gQ4IHXGw18k1yY1Z161d2l8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j0RzlUpFWNePXY9BtYpu/R2uq3jNPUKgnQGwJF0K3Nz0EG3g4AuRS/fbjYO2/3ImW
         e8f0pYaoq5lQdcGdl0VaHfek8/F/HWkmijLUyU6rU0ujXnseBFkZ/CmAFDXCHGhcTh
         TF7GLUK33rMLlZhRKGreLMqV66Gg2tzb9p+WKG5E=
Date:   Fri, 13 Mar 2020 01:02:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
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
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] media: i2c: ov5645: Switch to assigned-clock-rates
Message-ID: <20200312230253.GB30932@pendragon.ideasonboard.com>
References: <1584047552-20166-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584047552-20166-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUgMHjU_ZANzJbxQji6K7Pdc-jD4C7JatQc-OtN=jJt_w@mail.gmail.com>
 <OSBPR01MB3590906C6121D1DFFF4ABF0DAAFD0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OSBPR01MB3590906C6121D1DFFF4ABF0DAAFD0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Thu, Mar 12, 2020 at 09:52:38PM +0000, Prabhakar Mahadev Lad wrote:
> On 12 March 2020 21:42, Geert Uytterhoeven wrote:
> > On Thu, Mar 12, 2020 at 10:13 PM Lad Prabhakar wrote:
> > > This patch switches to assigned-clock-rates for specifying the clock rate.
> > > The clk-conf.c internally handles setting the clock rate when
> > > assigned-clock-rates is passed.
> > >
> > > The driver now sets the clock frequency only if the deprecated
> > > property clock-frequency is defined instead assigned-clock-rates, this
> > > is to avoid breakage with existing DT binaries.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/media/i2c/ov5645.c
> > > +++ b/drivers/media/i2c/ov5645.c
> > > @@ -1055,6 +1055,7 @@ static int ov5645_probe(struct i2c_client *client)
> > >         struct device_node *endpoint;
> > >         struct ov5645 *ov5645;
> > >         u8 chip_id_high, chip_id_low;
> > > +       bool set_clk = false;
> > >         unsigned int i;
> > >         u32 xclk_freq;
> > >         int ret;
> > > @@ -1094,10 +1095,17 @@ static int ov5645_probe(struct i2c_client
> > *client)
> > >                 return PTR_ERR(ov5645->xclk);
> > >         }
> > >
> > > -       ret = of_property_read_u32(dev->of_node, "clock-frequency",
> > &xclk_freq);
> > > +       ret = of_property_read_u32(dev->of_node, "assigned-clock-rates",
> > > +                                  &xclk_freq);
> > >         if (ret) {
> >
> > I think you can just leave out the above check...
> >
> > > -               dev_err(dev, "could not get xclk frequency\n");
> > > -               return ret;
> > > +               /* check if deprecated property clock-frequency is defined */
> > > +               ret = of_property_read_u32(dev->of_node, "clock-frequency",
> > > +                                          &xclk_freq);
> > > +               if (ret) {
> >
> > ... and ignore the absence of the deprecated property.
> >
> > > +                       dev_err(dev, "could not get xclk frequency\n");
> > > +                       return ret;
> > > +               }
> > > +               set_clk = true;
> >
> > I.e. just
> >
> >         /* check if deprecated property clock-frequency is defined */
> >         xclk_freq = 0;
> >         of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
> >         if (xclk_freq) {
> >                 ret = clk_set_rate(ov5645->xclk, xclk_freq);
> >                 if (ret) {
> >                         dev_err(dev, "could not set xclk frequency\n");
> >                         return ret;
> >                 }
> >         } else {
> >                 xclk_freq = clk_get_rate(ov5645->xclk, xclk_freq);
> >         }
> >
> I did think about it initially, but realized the clk_get_rate may vary platform to platform
> for example in G2E clk_get_rate() returns a frequency of 24242424 with
> assigned-clock-rates set to  24000000 and probe would fail due to a check for
> external clock must be 24MHz, with 1% tolerance.

Then you need to handle the tolerance in this driver :-)

> > >         }
> > >
> > >         /* external clock must be 24MHz, allow 1% tolerance */ @@
> > > -1107,10 +1115,12 @@ static int ov5645_probe(struct i2c_client *client)
> > >                 return -EINVAL;
> > >         }
> > >
> > > -       ret = clk_set_rate(ov5645->xclk, xclk_freq);
> > > -       if (ret) {
> > > -               dev_err(dev, "could not set xclk frequency\n");
> > > -               return ret;
> > > +       if (set_clk) {
> > > +               ret = clk_set_rate(ov5645->xclk, xclk_freq);
> > > +               if (ret) {
> > > +                       dev_err(dev, "could not set xclk frequency\n");
> > > +                       return ret;
> > > +               }
> > >
> > >         }
> > >
> > >         for (i = 0; i < OV5645_NUM_SUPPLIES; i++)

-- 
Regards,

Laurent Pinchart
