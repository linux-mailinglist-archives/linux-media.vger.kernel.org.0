Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80F623883D6
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 02:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234612AbhESAkY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 20:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234097AbhESAkX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 20:40:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E13C06175F
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 17:39:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE13045E
        for <linux-media@vger.kernel.org>; Wed, 19 May 2021 02:39:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621384743;
        bh=/lT/f5RQbZ4lIpVLUISg1OhPS/1UaNyILcRds5ykg5o=;
        h=Date:From:To:Subject:From;
        b=g66y6t+aPrJ2FYYH3fuaTKyXRMqvPHR7rgWJ6afS9eDId74pDS/Hq0iuMqRmlxXSH
         uvAxB+VjosxwCK4XtViPnlYfrG/vftfCcwB9f3b1mRyhtASx/RwTQKG6n+m46RK/hv
         GCarqX5uQuS2i//mkRoyxezkGJLHYRurJoIHsvoM=
Date:   Wed, 19 May 2021 03:39:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.14] imx7-mipi-csis driver improvements
Message-ID: <YKReJdBSV9yIXfxt@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/imx-20210519

for you to fetch changes up to 702077f1dd8ea4c0b6a91543b8d8946c77420ce8:

  media: imx: imx7_mipi_csis: Update MAINTAINERS (2021-05-19 03:36:26 +0300)

----------------------------------------------------------------
- Miscellaneous imx7-mipi-csis cleanups and fixes
- i.MX8MM support in the imx7-mipi-csis driver

----------------------------------------------------------------
Laurent Pinchart (25):
      media: imx: imx7_mipi_csis: Fix logging of only error event counters
      media: imx: imx7_mipi_csis: Count the CSI-2 debug interrupts
      media: imx: imx7_mipi_csis: Update ISP_CONFIG macros for quad pixel mode
      media: imx: imx7_mipi_csis: Move static data to top of mipi_csis_dump_regs()
      media: imx: imx7_mipi_csis: Minimize locking in get/set format
      media: imx: imx7_mipi_csis: Don't set subdev data
      media: imx: imx7_mipi_csis: Reorganize code in sections
      media: imx: imx7_mipi_csis: Set the CLKSETTLE register field
      media: imx: imx7_mipi_csis: Drop unused csis_hw_reset structure
      media: imx: imx7_mipi_csis: Store CSI-2 data type in format structure
      media: imx: imx7_mipi_csis: Drop csi_state phy field
      media: imx: imx7_mipi_csis: Rename mipi_sd to sd
      media: imx: imx7_mipi_csis: Rename csi_state flag field to state
      media: imx: imx7_mipi_csis: Turn csi_state irq field into local variable
      media: imx: imx7_mipi_csis: Don't pass pdev to mipi_csis_parse_dt()
      media: imx: imx7_mipi_csis: Pass csi_state to mipi_csis_subdev_init()
      media: imx: imx7_mipi_csis: Drop csi_state pdev field
      media: imx: imx7_mipi_csis: Make csi_state num_clocks field unsigned
      media: imx: imx7_mipi_csis: Reorganize csi_state structure
      media: imx: imx7_mipi_csis: Reorganize mipi_csis_probe()
      media: imx: imx7_mipi_csis: Reject invalid data-lanes settings
      media: imx: imx7_mipi_csis: Move PHY control to dedicated functions
      dt-bindings: media: nxp,imx7-mipi-csi2: Add i.MX8MM support
      media: imx: imx7_mipi_csis: Add i.MX8MM support
      media: imx: imx7_mipi_csis: Update MAINTAINERS

 .../devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml      | 109 ++-
 MAINTAINERS                                                |   1 +
 drivers/staging/media/imx/imx7-mipi-csis.c                 | 994 ++++++++++++++-----------
 3 files changed, 658 insertions(+), 446 deletions(-)

-- 
Regards,

Laurent Pinchart
