Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 092A2381C1A
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 04:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232336AbhEPC0O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 May 2021 22:26:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35680 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbhEPC0O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 May 2021 22:26:14 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DBCA2BA;
        Sun, 16 May 2021 04:24:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621131899;
        bh=CBKcY9YN4eTO6mOe09FY7qhnuSt0sbTgQ6EQT7Rg0RQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U+RVDSS6A4bv8bUUV+rwWqM8dzCi1ZJwMlDESjUfg0Bh12Lm+2ZyIujMRDCOr7QnS
         q9aNbN1/6lNNM/qdBiVdjh8+EIqg0KRT5846xv5x1G4zysIqotIT+jDVcgSMwm1WpP
         HyBL3MupSYh4dwIsD/41T7hih20dLkSHlhQ+ehM4=
Date:   Sun, 16 May 2021 05:24:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Tim Harvey <tharvey@gateworks.com>
Subject: Re: [PATCH v2 00/25] media: imx: imx7-mipi-csis: Add i.MX8MM support
Message-ID: <YKCCcZBL1mvkDH8p@pendragon.ideasonboard.com>
References: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210516014441.5508-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, May 16, 2021 at 04:44:16AM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series adds support for the CSIS found in the NXP i.MX8MM SoC
> to the imx7-mipi-csis driver.
> 
> The CSIS is an IP core from Samsung, integrated in different NXP SoCs.
> The driver currently supports v3.3 of the CSIS, found in SoCs from the
> i.MX6 and i.MX7 families. This series extends the driver to support
> v3.6.3 of the IP, found in i.MX8MM and other members of the i.MX8
> family.
> 
> The first 22 patches are miscellaneous cleanups and improvements. Please
> see individual patches for details.
> 
> Patch 23/25 extends the imx7-mipi-csis DT bindings with i.MX8MM support.
> Support for other members of the i.MX8 family will come later, and for
> SoCs including an ISI IP core (such as the i.MX8MP) this will require
> more work to handle additional glue logic.
> 
> Patch 24/25 then extends the imx7-mipi-csis driver accordingly.
> 
> Finally, patch 25/25 updates MAINTAINERS per popular request from people
> who believe I have too much free time :-)
> 
> The series has been tested on an i.MX6ULL (for the CSIS v3.3) and

I meant an i.MX7D, sorry.

> i.MX8MM (for the CSIS v3.6.3).
> 
> The changes in the integration of the CSIS between i.MX7 and i.MX8, as
> described in the DT bindings, have been found through reading of
> reference manuals and BSP source code, with different sources of
> information contradicting each other. A confirmation from NXP would be
> nice (in particular regarding the clocks).
> 
> Laurent Pinchart (25):
>   media: imx: imx7_mipi_csis: Fix logging of only error event counters
>   media: imx: imx7_mipi_csis: Count the CSI-2 debug interrupts
>   media: imx: imx7_mipi_csis: Update ISP_CONFIG macros for quad pixel
>     mode
>   media: imx: imx7_mipi_csis: Move static data to top of
>     mipi_csis_dump_regs()
>   media: imx: imx7_mipi_csis: Minimize locking in get/set format
>   media: imx: imx7_mipi_csis: Don't set subdev data
>   media: imx: imx7_mipi_csis: Reorganize code in sections
>   media: imx: imx7_mipi_csis: Set the CLKSETTLE register field
>   media: imx: imx7_mipi_csis: Drop unused csis_hw_reset structure
>   media: imx: imx7_mipi_csis: Store CSI-2 data type in format structure
>   media: imx: imx7_mipi_csis: Drop csi_state phy field
>   media: imx: imx7_mipi_csis: Rename mipi_sd to sd
>   media: imx: imx7_mipi_csis: Rename csi_state flag field to state
>   media: imx: imx7_mipi_csis: Turn csi_state irq field into local
>     variable
>   media: imx: imx7_mipi_csis: Don't pass pdev to mipi_csis_parse_dt()
>   media: imx: imx7_mipi_csis: Pass csi_state to mipi_csis_subdev_init()
>   media: imx: imx7_mipi_csis: Drop csi_state pdev field
>   media: imx: imx7_mipi_csis: Make csi_state num_clocks field unsigned
>   media: imx: imx7_mipi_csis: Reorganize csi_state structure
>   media: imx: imx7_mipi_csis: Reorganize mipi_csis_probe()
>   media: imx: imx7_mipi_csis: Reject invalid data-lanes settings
>   media: imx: imx7_mipi_csis: Move PHY control to dedicated functions
>   dt-bindings: media: nxp,imx7-mipi-csi2: Add i.MX8MM support
>   media: imx: imx7_mipi_csis: Add i.MX8MM support
>   media: imx: imx7_mipi_csis: Update MAINTAINERS
> 
>  .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 109 +-
>  MAINTAINERS                                   |   1 +
>  drivers/staging/media/imx/imx7-mipi-csis.c    | 994 ++++++++++--------
>  3 files changed, 658 insertions(+), 446 deletions(-)

-- 
Regards,

Laurent Pinchart
