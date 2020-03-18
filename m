Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74E8318A91F
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 00:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbgCRXTG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 19:19:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41564 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgCRXTF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 19:19:05 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6269B5F;
        Thu, 19 Mar 2020 00:19:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584573542;
        bh=/zedXgBTnib8ZFBNicYJfz7d9YDzUXZrVfIpem0oI00=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X3wMKCohj+Eri0noSK4cxXv2J+Tdk+etLcebTplD2XwAu0mnpUCJBz9JoBTVtgKyB
         BuYND21PycYFWMRG2CDc0GZ8rvrsDLqV+vZKMIO3R3FRv4+AgQPZ59Gq234fNiH5Z5
         CrBG+MYpU8w1RzkF6O4stmkROcCdhibfo+U67x8I=
Date:   Thu, 19 Mar 2020 01:18:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
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
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 3/4] media: i2c: ov5645: Set maximum leverage of
 external clock frequency to 24480000
Message-ID: <20200318231856.GI24538@pendragon.ideasonboard.com>
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584133954-6953-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200313212345.GM4751@pendragon.ideasonboard.com>
 <OSBPR01MB359079EAA32E0DCBF63C6886AAFA0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OSBPR01MB359079EAA32E0DCBF63C6886AAFA0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Fri, Mar 13, 2020 at 09:31:25PM +0000, Prabhakar Mahadev Lad wrote:
> On 13 March 2020 21:24, Laurent Pinchart wrote:
> > On Fri, Mar 13, 2020 at 09:12:33PM +0000, Lad Prabhakar wrote:
> > > While testing on Renesas RZ/G2E platform, noticed the clock frequency
> > > to be 24242424 as a result the probe failed. However increasing the
> > > maximum leverage of external clock frequency to 24480000 fixes this
> > > issue. Since this difference is small enough and is insignificant set
> > > the same in the driver.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  drivers/media/i2c/ov5645.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > > index 4fbabf3..b49359b 100644
> > > --- a/drivers/media/i2c/ov5645.c
> > > +++ b/drivers/media/i2c/ov5645.c
> > > @@ -1107,8 +1107,10 @@ static int ov5645_probe(struct i2c_client *client)
> > >  }
> > >
> > >  xclk_freq = clk_get_rate(ov5645->xclk);
> > > -/* external clock must be 24MHz, allow 1% tolerance */
> > > -if (xclk_freq < 23760000 || xclk_freq > 24240000) {
> > > +/* external clock must be 24MHz, allow a minimum 1% and a maximum of 2%
> > > + * tolerance
> >
> > So where do these numbers come from ? I understand that 2% is what you
> > need to make your clock fit in the range, but why -1%/+2% instead of -
> > 2%/+2% ? And why not 2.5 or 3% ? The sensor datasheet documents the
> > range of supported xvclk frequencies to be 6MHz to 54MHz. I understand
> > that PLL parameters depend on the clock frequency, but could they be
> > calculated instead of hardcoded, to avoid requiring an exact 24MHz input
> > frequency ?
>
> To be honest I don't have the datasheet for ov5645, the flyer says 6-54Mhz but the
> logs/comment says 24Mhz.

The OV5645 clock topology is fairly complex, with two PLLs and different
set of output dividers. It however shouldn't be impossible to calculate
the PLL configuration in the driver, but would require some dedication,
and is probably not worth it.

I've discussed the matter with Sakari, and we concluded that this is
just a sanity check. We advise increasing the tolerance by a bigger
amount to avoid patching this for every new board (completely
arbitrarily, +/- 5%), and turning the fatal error into a dev_warn,
dropping the return -EINVAL statement.

> > > + */
> > > +if (xclk_freq < 23760000 || xclk_freq > 24480000) {
> > >  dev_err(dev, "external clock frequency %u is not supported\n",
> > >  xclk_freq);
> > >  return -EINVAL;

-- 
Regards,

Laurent Pinchart
