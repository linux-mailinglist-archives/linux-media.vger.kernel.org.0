Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E51F2EAE45
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbhAEPaU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:30:20 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37660 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbhAEPaU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:30:20 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4C823D7;
        Tue,  5 Jan 2021 16:29:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860577;
        bh=cz+n/zqI5LNrCtR0oA1iQqtcACeJu3Lh+FQJytAca7U=;
        h=From:To:Cc:Subject:Date:From;
        b=TKyqQNJ/YN0C8Sr27gt8jrMSsLLp6Nun7HBqDNCejE0ocuXDn2l1Ta9Wia4HV8e+n
         t4BpLxW2QZq+qXEtogFVUg013rm77BBhRIR9NSH1o6DBZ2yQw0ig6gbwfkmyBGosAV
         kpvX3aspt62mgAJt0s8+7OvXZ79Dgl29Bdau4UdM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 00/75] media: imx: Miscellaneous fixes and cleanups for i.MX7
Date:   Tue,  5 Jan 2021 17:27:37 +0200
Message-Id: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This large patch series has been sitting in my tree for way too long. I
haven't posted it yet as I'm running into an issue on my test hardware
that I can't prove is not a regression from this series, but the
pressure has grown and the patches are better on the list for review.

There's really not much to detail in the cover letter as there are
"just" fixes and cleanups I developed while bringing up camera support
for an i.MX7D platform, and later on an i.MX8MM that shares the same
MIPI-CSI2 and CSI IP cores (with some differences).

The issue I've noticed is that the CSI writes two images consecutively
to the same buffer, overwritting memory after the end of the buffer. I
believe this bug to already be present in mainline, but I can't prove it
as my sensor won't work without some of the patches in this series. The
problem could also be sensor-specific.

Rui, would you be able to test this on your i.MX7 hardware to make sure
there's no regression ?

Laurent Pinchart (75):
  media: imx: Drop dependency on I2C
  media: imx: Move dependency on VIDEO_DEV to common Kconfig symbol
  media: imx: Drop manual dependency on VIDEO_IMX_MEDIA
  media: imx: Move IMX_IPUV3_CORE dependency to VIDEO_IMX_CSI
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
  dt-bindings: media: Convert i.MX7 MIPI CSI-2 receiver binding to YAML
  dt-bindings: media: fsl,imx7-mipi-csi2: Drop the reset-names property
  dt-bindings: media: fsl,imx7-mipi-csi2: Drop fsl,csis-hs-settle
    property
  media: imx: imx7_mipi_csis: Acquire reset control without naming it
  media: imx: imx7_mipi_csis: Fix input size alignment
  media: imx: imx7_mipi_csis: Make source .s_power() optional
  media: imx: imx7_mipi_csis: Avoid double get of wrap clock
  media: imx: imx7_mipi_csis: Drop 10-bit YUV support
  media: imx: imx7_mipi_csis: Fix UYVY8 media bus format
  media: imx: imx7_mipi_csis: Inline mipi_csis_set_hsync_settle()
  media: imx: imx7_mipi_csis: Move link setup check out of locked
    section
  media: imx: imx7_mipi_csis: Calculate Ths_settle from source pixel
    rate
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

 .../bindings/media/fsl,imx7-mipi-csi2.yaml    |  194 ++++
 .../bindings/media/imx7-mipi-csi2.txt         |   90 --
 MAINTAINERS                                   |    2 +-
 drivers/media/v4l2-core/v4l2-mc.c             |    6 +-
 drivers/staging/media/imx/Kconfig             |   12 +-
 drivers/staging/media/imx/Makefile            |    8 +-
 drivers/staging/media/imx/TODO                |    9 +-
 drivers/staging/media/imx/imx-ic-prp.c        |    4 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |   24 +-
 drivers/staging/media/imx/imx-media-capture.c |  685 ++++++-----
 .../staging/media/imx/imx-media-csc-scaler.c  |    2 +-
 drivers/staging/media/imx/imx-media-csi.c     |   33 +-
 .../staging/media/imx/imx-media-dev-common.c  |    4 +
 drivers/staging/media/imx/imx-media-utils.c   |   23 +-
 drivers/staging/media/imx/imx-media-vdic.c    |    7 +-
 drivers/staging/media/imx/imx-media.h         |   12 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |    6 +-
 drivers/staging/media/imx/imx7-media-csi.c    | 1016 ++++++++---------
 drivers/staging/media/imx/imx7-mipi-csis.c    |  412 ++++---
 include/media/v4l2-mc.h                       |    8 +-
 20 files changed, 1422 insertions(+), 1135 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx7-mipi-csi2.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt

-- 
Regards,

Laurent Pinchart

