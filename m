Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5399D363787
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 22:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbhDRUWV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 16:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhDRUWU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 16:22:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6492AC06174A;
        Sun, 18 Apr 2021 13:21:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B56AD4AB;
        Sun, 18 Apr 2021 22:21:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618777309;
        bh=yGbNsJSDxKqUqG2Vn3Xu0MrqD7YQurG+qLvKs76d2mk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XdE6H1cyNzcY4tH13TTWTnulCVYnko+pYVon8aaZxtEULmYHiY7dRTPDgxYm4et7D
         vjo6oN6bYvAt3vMhzXccoKQaAe0HS7nIszSEYa8HwymobwBLUUd2Tj6C3lR/YelI7m
         SkOq68IaIIFRMQiaBiZD6C83oMEx/qF+cPv4Vgec=
Date:   Sun, 18 Apr 2021 23:21:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 00/23] media: imx: imx7-mipi-csis: Add i.MX8MM support
Message-ID: <YHyU2n6cRdpNvvJP@pendragon.ideasonboard.com>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
 <20210415092755.oev3s3kzetgap452@arch-thunder.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210415092755.oev3s3kzetgap452@arch-thunder.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rui,

On Thu, Apr 15, 2021 at 10:27:55AM +0100, Rui Miguel Silva wrote:
> On Tue, Apr 13, 2021 at 05:29:51AM +0300, Laurent Pinchart wrote:
> > Hello,
> > 
> > This patch series adds support for the CSIS found in the NXP i.MX8MM SoC
> > to the imx7-mipi-csis driver.
> > 
> > The CSIS is an IP core from Samsung, integrated in different NXP SoCs.
> > The driver currently supports v3.3 of the CSIS, found in SoCs from the
> > i.MX6 and i.MX7 families. This series extends the driver to support
> > v3.6.3 of the IP, found in i.MX8MM and other members of the i.MX8
> > family.
> > 
> > The first 21 patches are miscellaneous cleanups and improvements. Please
> > see individual patches for details.
> > 
> > Patch 22/23 extends the imx7-mipi-csis DT bindings with i.MX8MM support.
> > Support for other members of the i.MX8 family will come later, and for
> > SoCs including an ISI IP core (such as the i.MX8MP) this will require
> > more work to handle additional glue logic.
> > 
> > Patch 23/23 finaly extends the imx7-mipi-csis driver accordingly.
> > 
> > The changes in the integration of the CSIS between i.MX7 and i.MX8, as
> > described in the DT bindings, have been found through reading of
> > reference manuals and BSP source code, with different sources of
> > information contradicting each other. A confirmation from NXP would be
> > nice (in particular regarding the clocks).
> 
> Thanks a lot for this series, looks all very good to me.
> 
> Will only ask you, as we already talked, to add your name in
> the bindings file as maintainer and extend also the MAINTAINERS file
> entry with your details.
> 
> You have a lot more hw/code working with this driver and also
> time/expertise.

Not sure about time, or even expertise, I'm trying my best :-) Thank you
for all your reviews. These drivers still need lots of love, and without
you patches wouldn't receive any tag.

> It can be in a follow patch no need to spin a new series for this.

Done, posted as v1.1 of 22/23, and a new 24/23. I'll send a pull request
after receiving an ack on 24/23.

> For all patches in this series:
> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

Thank you.

> > Laurent Pinchart (23):
> >   media: imx: imx7_mipi_csis: Fix logging of only error event counters
> >   media: imx: imx7_mipi_csis: Count the CSI-2 debug interrupts
> >   media: imx: imx7_mipi_csis: Update ISP_CONFIG macros for quad pixel
> >     mode
> >   media: imx: imx7_mipi_csis: Move static data to top of
> >     mipi_csis_dump_regs()
> >   media: imx: imx7_mipi_csis: Minimize locking in get/set format
> >   media: imx: imx7_mipi_csis: Don't set subdev data
> >   media: imx: imx7-mipi-csis: Reorganize code in sections
> >   media: imx: imx7_mipi_csis: Set the CLKSETTLE register field
> >   media: imx: imx7_mipi_csis: Drop unused csis_hw_reset structure
> >   media: imx: imx7_mipi_csis: Store CSI-2 data type in format structure
> >   media: imx: imx7_mipi_csis: Drop csi_state phy field
> >   media: imx: imx7_mipi_csis: Rename mipi_sd to sd
> >   media: imx: imx7_mipi_csis: Rename csi_state flag field to state
> >   media: imx: imx7_mipi_csis: Turn csi_state irq field into local
> >     variable
> >   media: imx: imx7_mipi_csis: Don't pass pdev to mipi_csis_parse_dt()
> >   media: imx: imx7_mipi_csis: Pass csi_state to mipi_csis_subdev_init()
> >   media: imx: imx7_mipi_csis: Drop csi_state pdev field
> >   media: imx: imx7_mipi_csis: Make csi_state num_clocks field unsigned
> >   media: imx: imx7_mipi_csis: Reorganize csi_state structure
> >   media: imx: imx7_mipi_csis: Reorganize mipi_csis_probe()
> >   media: imx: imx7_mipi_csis: Reject invalid data-lanes settings
> >   dt-bindings: media: nxp,imx7-mipi-csi2: Add i.MX8MM support
> >   media: imx: imx7_mipi_csis: Add i.MX8MM support
> > 
> >  .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 108 +-
> >  drivers/staging/media/imx/imx7-mipi-csis.c    | 943 ++++++++++--------
> >  2 files changed, 622 insertions(+), 429 deletions(-)

-- 
Regards,

Laurent Pinchart
