Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1955235D539
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 04:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241083AbhDMCba (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 22:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238190AbhDMCb3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 22:31:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85EEAC061756;
        Mon, 12 Apr 2021 19:31:10 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFB526F2;
        Tue, 13 Apr 2021 04:31:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618281067;
        bh=EJWv+LrcF5BPgrj9AUKkZAG2YyjWDmuKWGE1suNm+Ks=;
        h=From:To:Cc:Subject:Date:From;
        b=PdfaaXce29RDaKZHhB4uzjLeogU6G3uDi/gWXPyJLOAWCgT7c66C+ijxzE+5nhpc9
         qR0dcz2HvjWbDP5ERFr+9pIOf6ir4Z509o6XEYTRYFb6swOnC+QusopGh1TOA2Jr8S
         H5f6OSOnmcbrTBojCVDYabK2hD17LSIuiGjwqwb0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 00/23] media: imx: imx7-mipi-csis: Add i.MX8MM support
Date:   Tue, 13 Apr 2021 05:29:51 +0300
Message-Id: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series adds support for the CSIS found in the NXP i.MX8MM SoC
to the imx7-mipi-csis driver.

The CSIS is an IP core from Samsung, integrated in different NXP SoCs.
The driver currently supports v3.3 of the CSIS, found in SoCs from the
i.MX6 and i.MX7 families. This series extends the driver to support
v3.6.3 of the IP, found in i.MX8MM and other members of the i.MX8
family.

The first 21 patches are miscellaneous cleanups and improvements. Please
see individual patches for details.

Patch 22/23 extends the imx7-mipi-csis DT bindings with i.MX8MM support.
Support for other members of the i.MX8 family will come later, and for
SoCs including an ISI IP core (such as the i.MX8MP) this will require
more work to handle additional glue logic.

Patch 23/23 finaly extends the imx7-mipi-csis driver accordingly.

The changes in the integration of the CSIS between i.MX7 and i.MX8, as
described in the DT bindings, have been found through reading of
reference manuals and BSP source code, with different sources of
information contradicting each other. A confirmation from NXP would be
nice (in particular regarding the clocks).

Laurent Pinchart (23):
  media: imx: imx7_mipi_csis: Fix logging of only error event counters
  media: imx: imx7_mipi_csis: Count the CSI-2 debug interrupts
  media: imx: imx7_mipi_csis: Update ISP_CONFIG macros for quad pixel
    mode
  media: imx: imx7_mipi_csis: Move static data to top of
    mipi_csis_dump_regs()
  media: imx: imx7_mipi_csis: Minimize locking in get/set format
  media: imx: imx7_mipi_csis: Don't set subdev data
  media: imx: imx7-mipi-csis: Reorganize code in sections
  media: imx: imx7_mipi_csis: Set the CLKSETTLE register field
  media: imx: imx7_mipi_csis: Drop unused csis_hw_reset structure
  media: imx: imx7_mipi_csis: Store CSI-2 data type in format structure
  media: imx: imx7_mipi_csis: Drop csi_state phy field
  media: imx: imx7_mipi_csis: Rename mipi_sd to sd
  media: imx: imx7_mipi_csis: Rename csi_state flag field to state
  media: imx: imx7_mipi_csis: Turn csi_state irq field into local
    variable
  media: imx: imx7_mipi_csis: Don't pass pdev to mipi_csis_parse_dt()
  media: imx: imx7_mipi_csis: Pass csi_state to mipi_csis_subdev_init()
  media: imx: imx7_mipi_csis: Drop csi_state pdev field
  media: imx: imx7_mipi_csis: Make csi_state num_clocks field unsigned
  media: imx: imx7_mipi_csis: Reorganize csi_state structure
  media: imx: imx7_mipi_csis: Reorganize mipi_csis_probe()
  media: imx: imx7_mipi_csis: Reject invalid data-lanes settings
  dt-bindings: media: nxp,imx7-mipi-csi2: Add i.MX8MM support
  media: imx: imx7_mipi_csis: Add i.MX8MM support

 .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 108 +-
 drivers/staging/media/imx/imx7-mipi-csis.c    | 943 ++++++++++--------
 2 files changed, 622 insertions(+), 429 deletions(-)

-- 
Regards,

Laurent Pinchart

