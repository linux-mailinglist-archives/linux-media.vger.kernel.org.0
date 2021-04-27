Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B66136C48D
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 13:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235268AbhD0LBf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 07:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235351AbhD0LBd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 07:01:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C2DC061756
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 04:00:50 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1lbLSP-00071d-Qw; Tue, 27 Apr 2021 13:00:45 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1lbLSP-0007iP-1Z; Tue, 27 Apr 2021 13:00:45 +0200
Date:   Tue, 27 Apr 2021 13:00:45 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <20210427110045.4cl3w7ij3w6x7rtg@pengutronix.de>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
 <CAJ+vNU1bnR+L-QkHAN_Yar0MUTjF+QoxgTHV9ZxQW+VWpM6cpg@mail.gmail.com>
 <e0ac6633-498d-ae9e-5eea-7d7d59742cab@kontron.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0ac6633-498d-ae9e-5eea-7d7d59742cab@kontron.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:59:56 up 146 days,  1:06, 47 users,  load average: 0.08, 0.10,
 0.09
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 21-04-26 12:35, Frieder Schrempf wrote:
> Hi Tim,
> 
> On 21.04.21 17:27, Tim Harvey wrote:
> > On Mon, Apr 12, 2021 at 7:31 PM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > > 
> > > Hello,
> > > 
> > > This patch series adds support for the CSIS found in the NXP i.MX8MM SoC
> > > to the imx7-mipi-csis driver.
> > > 
> > > The CSIS is an IP core from Samsung, integrated in different NXP SoCs.
> > > The driver currently supports v3.3 of the CSIS, found in SoCs from the
> > > i.MX6 and i.MX7 families. This series extends the driver to support
> > > v3.6.3 of the IP, found in i.MX8MM and other members of the i.MX8
> > > family.
> > > 
> > > The first 21 patches are miscellaneous cleanups and improvements. Please
> > > see individual patches for details.
> > > 
> > > Patch 22/23 extends the imx7-mipi-csis DT bindings with i.MX8MM support.
> > > Support for other members of the i.MX8 family will come later, and for
> > > SoCs including an ISI IP core (such as the i.MX8MP) this will require
> > > more work to handle additional glue logic.
> > > 
> > > Patch 23/23 finaly extends the imx7-mipi-csis driver accordingly.
> > > 
> > > The changes in the integration of the CSIS between i.MX7 and i.MX8, as
> > > described in the DT bindings, have been found through reading of
> > > reference manuals and BSP source code, with different sources of
> > > information contradicting each other. A confirmation from NXP would be
> > > nice (in particular regarding the clocks).
> > > 
> > > Laurent Pinchart (23):
> > >    media: imx: imx7_mipi_csis: Fix logging of only error event counters
> > >    media: imx: imx7_mipi_csis: Count the CSI-2 debug interrupts
> > >    media: imx: imx7_mipi_csis: Update ISP_CONFIG macros for quad pixel
> > >      mode
> > >    media: imx: imx7_mipi_csis: Move static data to top of
> > >      mipi_csis_dump_regs()
> > >    media: imx: imx7_mipi_csis: Minimize locking in get/set format
> > >    media: imx: imx7_mipi_csis: Don't set subdev data
> > >    media: imx: imx7-mipi-csis: Reorganize code in sections
> > >    media: imx: imx7_mipi_csis: Set the CLKSETTLE register field
> > >    media: imx: imx7_mipi_csis: Drop unused csis_hw_reset structure
> > >    media: imx: imx7_mipi_csis: Store CSI-2 data type in format structure
> > >    media: imx: imx7_mipi_csis: Drop csi_state phy field
> > >    media: imx: imx7_mipi_csis: Rename mipi_sd to sd
> > >    media: imx: imx7_mipi_csis: Rename csi_state flag field to state
> > >    media: imx: imx7_mipi_csis: Turn csi_state irq field into local
> > >      variable
> > >    media: imx: imx7_mipi_csis: Don't pass pdev to mipi_csis_parse_dt()
> > >    media: imx: imx7_mipi_csis: Pass csi_state to mipi_csis_subdev_init()
> > >    media: imx: imx7_mipi_csis: Drop csi_state pdev field
> > >    media: imx: imx7_mipi_csis: Make csi_state num_clocks field unsigned
> > >    media: imx: imx7_mipi_csis: Reorganize csi_state structure
> > >    media: imx: imx7_mipi_csis: Reorganize mipi_csis_probe()
> > >    media: imx: imx7_mipi_csis: Reject invalid data-lanes settings
> > >    dt-bindings: media: nxp,imx7-mipi-csi2: Add i.MX8MM support
> > >    media: imx: imx7_mipi_csis: Add i.MX8MM support
> > > 
> > >   .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 108 +-
> > >   drivers/staging/media/imx/imx7-mipi-csis.c    | 943 ++++++++++--------
> > >   2 files changed, 622 insertions(+), 429 deletions(-)
> > > 
> > > --
> > > Regards,
> > > 
> > > Laurent Pinchart
> > > 
> > 
> > Laurent,
> > 
> > Thank you for your work on this!
> > 
> > I have an IMX8MM board supporting CSI and a couple of devices to test with:
> > - Sony IMX477 12.3MP sensor (do not see any mainline support but there
> > are some hits on the net as this is a RPi camera)
> > - Sony IMX219 8MP sensor (should be supported by drivers/media/i2c/imx219.c)
> > - Auvidea B10x HDMI to CSI-2 bridge (Toshiba TC358743XBG HDMI to CSI-2
> > (MIPI)- 2D+C) (should be supported by drivers/media/i2c/tc358743.c)
> > 
> > Can you summarize the state of IMX8MM CSI capture in mainline? I
> > suppose the MIPI power domain is still an issue? Anything else that
> > would keep me from testing the above devices?
> > 
> 
> Just in case it might help you: I tested the previous version of Laurent's
> patches (not on the mailing list) against mainline v5.10 with Lucas'
> power-domain patches.
> 
> It should work fine in general. Here are some notes about the problems I
> encountered: https://patchwork.kernel.org/project/linux-media/cover/20210215042741.28850-1-laurent.pinchart@ideasonboard.com/

Is there also any ongoing work for the DPHY driver?

Regards,
  Marco
