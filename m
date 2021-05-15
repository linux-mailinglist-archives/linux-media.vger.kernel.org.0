Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91326381B8E
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 00:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbhEOWs1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 18:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbhEOWsX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 18:48:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0459C061573;
        Sat, 15 May 2021 15:47:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 380CE2BA;
        Sun, 16 May 2021 00:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621118828;
        bh=FIztvDWezmW1RAgLWGdwuIedfXROBYYLV0EGZDzPKJs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dFkP09yfnqvQrqVMNBLp6VqIAs757l9Fpuml5ZhkgnBkXr7btq41WLZ5jeNfBO+Dj
         zIGzta0cAcoynRL/ITgIf5A3zGV5JFTk5Y4XiokvbagowWIriLt8PJVeoTezLi+NMY
         dKK0rPaePnuz9JwXy/GD1ms7V2OCfXLW9+gKNLW4=
Date:   Sun, 16 May 2021 01:46:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Marek Vasut <marex@denx.de>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: [PATCH 00/23] media: imx: imx7-mipi-csis: Add i.MX8MM support
Message-ID: <YKBPYm9cnaA6X0XN@pendragon.ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
 <CAJ+vNU1bnR+L-QkHAN_Yar0MUTjF+QoxgTHV9ZxQW+VWpM6cpg@mail.gmail.com>
 <e0ac6633-498d-ae9e-5eea-7d7d59742cab@kontron.de>
 <20210427110045.4cl3w7ij3w6x7rtg@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210427110045.4cl3w7ij3w6x7rtg@pengutronix.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Sorry for the late reply.

On Tue, Apr 27, 2021 at 01:00:45PM +0200, Marco Felsch wrote:
> On 21-04-26 12:35, Frieder Schrempf wrote:
> > On 21.04.21 17:27, Tim Harvey wrote:
> > > On Mon, Apr 12, 2021 at 7:31 PM Laurent Pinchart wrote:
> > > > 
> > > > Hello,
> > > > 
> > > > This patch series adds support for the CSIS found in the NXP i.MX8MM SoC
> > > > to the imx7-mipi-csis driver.
> > > > 
> > > > The CSIS is an IP core from Samsung, integrated in different NXP SoCs.
> > > > The driver currently supports v3.3 of the CSIS, found in SoCs from the
> > > > i.MX6 and i.MX7 families. This series extends the driver to support
> > > > v3.6.3 of the IP, found in i.MX8MM and other members of the i.MX8
> > > > family.
> > > > 
> > > > The first 21 patches are miscellaneous cleanups and improvements. Please
> > > > see individual patches for details.
> > > > 
> > > > Patch 22/23 extends the imx7-mipi-csis DT bindings with i.MX8MM support.
> > > > Support for other members of the i.MX8 family will come later, and for
> > > > SoCs including an ISI IP core (such as the i.MX8MP) this will require
> > > > more work to handle additional glue logic.
> > > > 
> > > > Patch 23/23 finaly extends the imx7-mipi-csis driver accordingly.
> > > > 
> > > > The changes in the integration of the CSIS between i.MX7 and i.MX8, as
> > > > described in the DT bindings, have been found through reading of
> > > > reference manuals and BSP source code, with different sources of
> > > > information contradicting each other. A confirmation from NXP would be
> > > > nice (in particular regarding the clocks).
> > > > 
> > > > Laurent Pinchart (23):
> > > >    media: imx: imx7_mipi_csis: Fix logging of only error event counters
> > > >    media: imx: imx7_mipi_csis: Count the CSI-2 debug interrupts
> > > >    media: imx: imx7_mipi_csis: Update ISP_CONFIG macros for quad pixel
> > > >      mode
> > > >    media: imx: imx7_mipi_csis: Move static data to top of
> > > >      mipi_csis_dump_regs()
> > > >    media: imx: imx7_mipi_csis: Minimize locking in get/set format
> > > >    media: imx: imx7_mipi_csis: Don't set subdev data
> > > >    media: imx: imx7-mipi-csis: Reorganize code in sections
> > > >    media: imx: imx7_mipi_csis: Set the CLKSETTLE register field
> > > >    media: imx: imx7_mipi_csis: Drop unused csis_hw_reset structure
> > > >    media: imx: imx7_mipi_csis: Store CSI-2 data type in format structure
> > > >    media: imx: imx7_mipi_csis: Drop csi_state phy field
> > > >    media: imx: imx7_mipi_csis: Rename mipi_sd to sd
> > > >    media: imx: imx7_mipi_csis: Rename csi_state flag field to state
> > > >    media: imx: imx7_mipi_csis: Turn csi_state irq field into local
> > > >      variable
> > > >    media: imx: imx7_mipi_csis: Don't pass pdev to mipi_csis_parse_dt()
> > > >    media: imx: imx7_mipi_csis: Pass csi_state to mipi_csis_subdev_init()
> > > >    media: imx: imx7_mipi_csis: Drop csi_state pdev field
> > > >    media: imx: imx7_mipi_csis: Make csi_state num_clocks field unsigned
> > > >    media: imx: imx7_mipi_csis: Reorganize csi_state structure
> > > >    media: imx: imx7_mipi_csis: Reorganize mipi_csis_probe()
> > > >    media: imx: imx7_mipi_csis: Reject invalid data-lanes settings
> > > >    dt-bindings: media: nxp,imx7-mipi-csi2: Add i.MX8MM support
> > > >    media: imx: imx7_mipi_csis: Add i.MX8MM support
> > > > 
> > > >   .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 108 +-
> > > >   drivers/staging/media/imx/imx7-mipi-csis.c    | 943 ++++++++++--------
> > > >   2 files changed, 622 insertions(+), 429 deletions(-)
> > > 
> > > Laurent,
> > > 
> > > Thank you for your work on this!
> > > 
> > > I have an IMX8MM board supporting CSI and a couple of devices to test with:
> > > - Sony IMX477 12.3MP sensor (do not see any mainline support but there
> > > are some hits on the net as this is a RPi camera)
> > > - Sony IMX219 8MP sensor (should be supported by drivers/media/i2c/imx219.c)
> > > - Auvidea B10x HDMI to CSI-2 bridge (Toshiba TC358743XBG HDMI to CSI-2
> > > (MIPI)- 2D+C) (should be supported by drivers/media/i2c/tc358743.c)
> > > 
> > > Can you summarize the state of IMX8MM CSI capture in mainline? I
> > > suppose the MIPI power domain is still an issue? Anything else that
> > > would keep me from testing the above devices?
> > 
> > Just in case it might help you: I tested the previous version of Laurent's
> > patches (not on the mailing list) against mainline v5.10 with Lucas'
> > power-domain patches.
> > 
> > It should work fine in general. Here are some notes about the problems I
> > encountered: https://patchwork.kernel.org/project/linux-media/cover/20210215042741.28850-1-laurent.pinchart@ideasonboard.com/
> 
> Is there also any ongoing work for the DPHY driver?

I'm still working on the CSI bridge side. Aside from power domains,
there's no big blocker. I managed to get it working fine with a few
different sensors. It still fails with an MT9M114 for a reason I don't
understand at this point, but I don't think that's an upstreaming
blocker.

I'll try to post patches in the not too distant future.

-- 
Regards,

Laurent Pinchart
