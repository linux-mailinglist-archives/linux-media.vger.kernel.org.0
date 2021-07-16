Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C54A3CB652
	for <lists+linux-media@lfdr.de>; Fri, 16 Jul 2021 12:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239481AbhGPKu3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jul 2021 06:50:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43100 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232622AbhGPKu2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jul 2021 06:50:28 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38F5C3F0;
        Fri, 16 Jul 2021 12:47:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1626432452;
        bh=2tjLHZKhFqJxgwfQBVt4w49XJ5K8O2XiNKVyDLxSTgU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sR3rprPSuZDws4TWW+RjKCth2sIwIz1jbmkohQrnb8hRz7y3P0LVnqqwBuST/pI+c
         aiQlx3VNH816uipUgHsdIL9upoDEV1K5knzeaA2+7EaJ/NEmRV7QbCdARzgDrlf/Vk
         rvTl0lcNoN7RGsDYB5/Akt33oVeTvk2phe9/Xu78=
Date:   Fri, 16 Jul 2021 13:47:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     festevam@gmail.com, krzk@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, kernel@puri.sm,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, m.felsch@pengutronix.de,
        mchehab@kernel.org, phone-devel@vger.kernel.org, robh@kernel.org,
        shawnguo@kernel.org, slongerbeam@gmail.com
Subject: Re: [PATCH v6 2/3] media: imx: add a driver for i.MX8MQ mipi csi rx
 phy and controller
Message-ID: <YPFjwvjSCuvC1915@pendragon.ideasonboard.com>
References: <20210714111931.324485-1-martin.kepplinger@puri.sm>
 <20210714111931.324485-3-martin.kepplinger@puri.sm>
 <YO8r6pZAduu1ZMK4@pendragon.ideasonboard.com>
 <ce71a71a358247eca3b72ddcddd703206c90f284.camel@puri.sm>
 <YPCuFA+utjudv11H@pendragon.ideasonboard.com>
 <e88d99abbdcbd6a1b2c27849f08721e79f237adc.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e88d99abbdcbd6a1b2c27849f08721e79f237adc.camel@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Fri, Jul 16, 2021 at 10:47:14AM +0200, Martin Kepplinger wrote:
> Am Freitag, dem 16.07.2021 um 00:52 +0300 schrieb Laurent Pinchart:
> > On Thu, Jul 15, 2021 at 09:37:24AM +0200, Martin Kepplinger wrote:
> > > Am Mittwoch, dem 14.07.2021 um 21:24 +0300 schrieb Laurent Pinchart:
> > > > On Wed, Jul 14, 2021 at 01:19:30PM +0200, Martin Kepplinger wrote:
> > > > > Add a driver to support the i.MX8MQ MIPI CSI receiver. The hardware side
> > > > > is based on
> > > > > https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/imx8/mxc-mipi-csi2_yav.c?h=imx_5.4.70_2.3.0
> > > > > 
> > > > > It's built as part of VIDEO_IMX7_CSI because that's documented to support
> > > > > i.MX8M platforms. This driver adds i.MX8MQ support where currently only the
> > > > > i.MX8MM platform has been supported.
> > > > > 
> > > > > Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> > > > > ---
> > > > >  drivers/staging/media/imx/Makefile           |   1 +
> > > > >  drivers/staging/media/imx/imx8mq-mipi-csi2.c | 949 +++++++++++++++++++
> > > > >  2 files changed, 950 insertions(+)
> > > > >  create mode 100644 drivers/staging/media/imx/imx8mq-mipi-csi2.c
> > > > > 
> > > > > diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
> > > > > index 6ac33275cc97..19c2fc54d424 100644
> > > > > --- a/drivers/staging/media/imx/Makefile
> > > > > +++ b/drivers/staging/media/imx/Makefile
> > > > > @@ -16,3 +16,4 @@ obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
> > 
> > [snip]
> > 
> > > > > +static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state)
> > > > > +{
> > > > > +       u32 width = state->format_mbus[MIPI_CSI2_PAD_SINK].width;
> > > > > +       u32 height = state->format_mbus[MIPI_CSI2_PAD_SINK].height;
> > > > > +       s64 link_freq;
> > > > > +       u32 lane_rate;
> > > > > +
> > > > > +       /* Calculate the line rate from the pixel rate. */
> > > > > +       link_freq = v4l2_get_link_freq(state->src_sd->ctrl_handler,
> > > > > +                                      state->csi2_fmt->width,
> > > > > +                                      state->bus.num_data_lanes * 2);
> > > > > +       if (link_freq < 0) {
> > > > > +               dev_err(state->dev, "Unable to obtain link frequency: %d\n",
> > > > > +                       (int)link_freq);
> > > > > +               return link_freq;
> > > > > +       }
> > > > > +
> > > > > +       lane_rate = link_freq * 2;
> > > > > +       if (lane_rate < 80000000 || lane_rate > 1500000000) {
> > > > > +               dev_dbg(state->dev, "Out-of-bound lane rate %u\n", lane_rate);
> > > > > +               return -EINVAL;
> > > > > +       }
> > > > > +
> > > > > +       /* https://community.nxp.com/t5/i-MX-Processors/Explenation-for-HS-SETTLE-parameter-in-MIPI-CSI-D-PHY-registers/m-p/764275/highlight/true#M118744 */
> > > > > +       if (lane_rate < 250000000)
> > > > > +               state->hs_settle = 0xb;
> > > > > +       else if (lane_rate < 500000000)
> > > > > +               state->hs_settle = 0x8;
> > > > > +       else
> > > > > +               state->hs_settle = 0x6;
> > > > 
> > > > We could possibly compute this value based on the formula from the table
> > > > in that page, but maybe that's overkill ? If you want to give it a try,
> > > > it would be along those lines.
> > > > 
> > > >         /*
> > > >          * The D-PHY specification requires Ths-settle to be in the range
> > > >          * 85ns + 6*UI to 140ns + 10*UI, with the unit interval UI being half
> > > >          * the clock period.
> > > >          *
> > > >          * The Ths-settle value is expressed in the hardware as a multiple of
> > > >          * the Esc clock period:
> > > >          *
> > > >          * Ths-settle = (PRG_RXHS_SETTLE + 1) * Tperiod of RxClkInEsc
> > > >          *
> > > >          * Due to the one cycle inaccuracy introduced by rounding, the
> > > >          * documentation recommends picking a value away from the boundaries.
> > > >          * Let's pick the average.
> > > >          */
> > > >         esc_clk_rate = clk_get_rate(...);
> > > > 
> > > >         min_ths_settle = 85 + 6 * 1000000 / (lane_rate / 1000);
> > > >         max_ths_settle = 140 + 10 * 1000000 / (lane_rate / 1000);
> > > >         ths_settle = (min_ths_settle + max_ths_settle) / 2;
> > > > 
> > > >         state->hs_settle = ths_settle * esc_clk_rate / 1000000000 - 1;
> > > 
> > > I experimented a bit but would like to leave this as a task for later
> > > if that's ok. it's correct and simple now. also, using clks[i].clk
> > > based on the name string would feel better to submit seperately
> > > later.
> > 
> > That's OK with me, but I may then submit a patch on top fairly soon :-)
> > Have you been able to test if this code works on your device ? The main
> > reason why I think it's better is that it doesn't hardcode a specific
> > escape clock frequency assumption, so it should be able to accommodate a
> > wider range of use cases. If we change it later, there's always a risk
> > of regressions, while if we do this from the start, we'll figure out
> > quickly if it doesn't work in some cases.
> 
> taking your code basically as-is doesn't yet work, but it helps a bit.

Thanks for testing.

> tbh I don't even know how to correctly read that table / calculation:
> what is the exact relation of the calculated Ths_settle time inverval
> to the hs_settle register bits?

The PRG_RXHS_SETTLE field stores a number of timer ticks to cover the
Ths-settle internal. The D-PHY arms the timer when it detects the
transition to LP-00, and ignores transitions on the lane until the timer
expires. The timer is clocked by the escape clock.

What hs_settle value do you currently use, and what value does my code
produce ?

> if the 2 of us can't quickly figure it out I can ask NXP via that
> community forum issue and I created
> https://source.puri.sm/Librem5/linux-next/-/issues/340 so I won't
> forget about it.

-- 
Regards,

Laurent Pinchart
