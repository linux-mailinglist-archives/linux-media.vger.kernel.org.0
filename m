Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FAB031B488
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:29:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbhBOE24 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:28:56 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45278 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhBOE2y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:28:54 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32D8C743;
        Mon, 15 Feb 2021 05:28:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363291;
        bh=KSVZKTN7s5fd2rP6+aNcO84juPwPbD0PaKNbkfN99fs=;
        h=From:To:Cc:Subject:Date:From;
        b=fue1suABGRRU6MKjSYx/Y0R8juP+UoFyxy7tJyb5D0Z5FwYmWNNSvtC5/jQbD5ANj
         uNfvaJGEgTPZfybZ2C502ZRWWlfr0ER9WM1ITVz63B2pO3sUy6ehOFSUEj8tJM1Tv3
         /wKexl69XlSPCso38/MvunPKtJI7KDqnoQCm6IhQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 00/77] media: imx: Miscellaneous fixes and cleanups for i.MX7
Date:   Mon, 15 Feb 2021 06:26:24 +0200
Message-Id: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This large patch series is a collection of miscellaneous fixes, cleanups
and enhancements for the i.MX7 camera support. Most notably, it
implements support for the Media Controller API in the driver.

Compared to v1, review comments have been taken into account, and the
patches have been rebased on top of the DT bindings and latest imx
changes as present in the linux-media tree. Patches 38/77, 39/77, 60/77
and 61/77 are new. For additional information, please see individual
patches.

I have successfully tested the code on an i.MX6ULL board (with an
MT9M114 sensor), an I.MX7D board (with an IMX296 sensor), and an i.MX8MM
board (with an OV5640 sensor, and additional patches for i.MX8MM
support).

Laurent Pinchart (77):
  media: imx: Drop dependency on I2C
  media: imx: Move dependency on VIDEO_DEV to common Kconfig symbol
  media: imx: Drop manual dependency on VIDEO_IMX_MEDIA
  media: imx: Compile imx6-media-objs only for CONFIG_VIDEO_IMX_CSI
  media: imx: Set default sizes through macros in all drivers
  media: imx: utils: Add ability to filter pixel formats by mbus code
  media: imx: capture: Use dev_* instead of v4l2_* to log messages
  media: imx: capture: Use device name to construct bus_info
  media: imx: capture: Remove forward declaration of capture_qops
  media: imx: capture: Handle errors from v4l2_fh_open()
  media: imx: capture: Clean up capture_priv structure
  media: imx: capture: Remove capture_priv stop field
  media: imx: capture: Move queue and ctrl handler init to init function
  media: imx: capture: Initialize video_device programmatically
  media: imx: capture: Register the video device after completing init
  media: imx: capture: Store v4l2_pix_format in imx_media_video_dev
  media: imx: capture: Move default format init to a separate function
  media: imx: capture: Rename querycap handler to capture_querycap
  media: imx: capture: Rename ioctl operations with legacy prefix
  media: imx: capture: Add a mechanism to disable control inheritance
  media: imx: capture: Remove unneeded variable in
    __capture_legacy_try_fmt
  media: imx: capture: Pass v4l2_pix_format to
    __capture_legacy_try_fmt()
  media: imx: capture: Return -EPIPE from __capture_legacy_try_fmt()
  media: imx: capture: Extract format lookup from
    __capture_legacy_try_fmt
  media: imx: capture: Simplify capture_validate_fmt() implementation
  media: imx: capture: Simplify __capture_legacy_try_fmt()
  media: imx: capture: Decouple video node from source with MC-centric
    API
  media: imx: capture: Expose V4L2_CAP_IO_MC for the MC-centric API
  media: imx: imx7-media-csi: Disable legacy video node API
  media: imx: capture: Support creating immutable link to capture device
  media: imx: imx7-media-csi: Remove control handler
  media: imx: imx7-media-csi: Move (de)init from link setup to
    .s_stream()
  media: imx: imx7-media-csi: Create immutable link to capture device
  media: imx: imx7-media-csi: Replace CSICR*_RESET_VAL with values
  media: imx: imx7-media-csi: Tidy up register fields macros
  media: imx: imx7-media-csi: Reorganize code in sections
  media: imx: imx7-media-csi: Validate capture format in
    .link_validate()
  media: imx: imx7-media-csi: Fix source type identification
  media: imx: imx7-media-csi: Don't lock access to is_csi2
  media: imx: imx7-media-csi: Rename imx7_csi_dma_start() to *_setup()
  media: imx: imx7-media-csi: Split imx7_csi_dma_stop()
  media: imx: imx7-media-csi: Move CSI configuration before source start
  media: imx: imx7-media-csi: Merge streaming_start() with csi_enable()
  media: imx: imx7-media-csi: Merge hw_reset() with init_interface()
  media: imx: imx7-media-csi: Set the MIPI data type based on the bus
    code
  media: imx: imx7-media-csi: Don't set the buffer stride when disabling
  media: imx: imx7-media-csi: Merge all config in imx7_csi_configure()
  media: imx: imx7-media-csi: Clear all configurable CSICR18 fields
  media: imx: imx7-media-csi: Set RFF burst type in imx7_csi_configure()
  media: imx: imx7-media-csi: Simplify imx7_csi_rx_fifo_clear()
  media: imx: imx7-media-csi: Don't double-enable the CSI
  media: imx: imx7-media-csi: Don't double-enable the RxFIFO
  media: imx: imx7-media-csi: Remove double reflash of DMA controller
  media: imx: imx7-media-csi: Don't enable SOF and EOF interrupts
  media: imx: imx7_media-csi: Add support for additional Bayer patterns
  media: v4l2-mc: Add link flags to v4l2_create_fwnode_links_to_pad()
  media: imx: imx7_media-csi: Create immutable link to source device
  dt-bindings: media: nxp,imx7-mipi-csi2: Drop the reset-names property
  dt-bindings: media: nxp,imx7-mipi-csi2: Drop fsl,csis-hs-settle
    property
  dt-bindings: media: nxp,imx7-mipi-csi2: Indent example with 4 spaces
  dt-bindings: media: nxp,imx7-mipi-csi2: Expand descriptions
  media: imx: imx7_mipi_csis: Acquire reset control without naming it
  media: imx: imx7_mipi_csis: Fix input size alignment
  media: imx: imx7_mipi_csis: Make source .s_power() optional
  media: imx: imx7_mipi_csis: Avoid double get of wrap clock
  media: imx: imx7_mipi_csis: Drop 10-bit YUV support
  media: imx: imx7_mipi_csis: Fix UYVY8 media bus format
  media: imx: imx7_mipi_csis: Inline mipi_csis_set_hsync_settle()
  media: imx: imx7_mipi_csis: Move link setup check out of locked
    section
  media: imx: imx7_mipi_csis: Calculate Ths_settle from source lane rate
  media: imx: imx7_mipi_csis: Turn register access macros into functions
  media: imx: imx7_mipi_csis: Fully initialize MIPI_CSIS_DPHYCTRL
    register
  media: imx: imx7_mipi_csis: Define macros for DPHY_BCTRL_L fields
  media: imx: imx7_mipi_csis: Make ISP registers macros take channel ID
  media: imx: imx7_mipi_csis: Rename register macros to match datasheet
  media: imx: imx7_mipi_csis: Use register macros in
    mipi_csis_dump_regs()
  media: imx: imx7_mipi_csis: Print shadow registers in
    mipi_csis_dump_regs()

 .../bindings/media/nxp,imx7-mipi-csi2.yaml    |   94 +-
 drivers/media/v4l2-core/v4l2-mc.c             |    6 +-
 drivers/staging/media/imx/Kconfig             |    9 +-
 drivers/staging/media/imx/Makefile            |    6 +-
 drivers/staging/media/imx/TODO                |    9 +-
 drivers/staging/media/imx/imx-ic-prp.c        |    4 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |   24 +-
 drivers/staging/media/imx/imx-media-capture.c |  685 +++++++----
 .../staging/media/imx/imx-media-csc-scaler.c  |    2 +-
 drivers/staging/media/imx/imx-media-csi.c     |   33 +-
 .../staging/media/imx/imx-media-dev-common.c  |    4 +
 drivers/staging/media/imx/imx-media-utils.c   |   23 +-
 drivers/staging/media/imx/imx-media-vdic.c    |    7 +-
 drivers/staging/media/imx/imx-media.h         |   12 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |    6 +-
 drivers/staging/media/imx/imx7-media-csi.c    | 1042 ++++++++---------
 drivers/staging/media/imx/imx7-mipi-csis.c    |  399 ++++---
 include/media/v4l2-mc.h                       |    8 +-
 18 files changed, 1275 insertions(+), 1098 deletions(-)

-- 
Regards,

Laurent Pinchart

