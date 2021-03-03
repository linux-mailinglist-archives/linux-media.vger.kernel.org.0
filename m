Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A86A32C725
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347902AbhCDAbF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:31:05 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:46799 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349671AbhCCOEb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Mar 2021 09:04:31 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id HS6GlaZ2uqY4WHS6JlTNya; Wed, 03 Mar 2021 15:03:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614780223; bh=8de4+Pr5vVeHpTXYKSaucN/NlwkbHCaTtAo6t+wq3BE=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pXqBe9zW4i1mHJM1EbsURcC8Mt17K//6mlPFCiaWGxaDbkGdFfRQFiFNkcqCmm0Tf
         FkHylfO0T7Ib648jIKABAHeztEMBTb6jT00mQZLfrygw5uuHBOseIIDsfAvaO3uS3Y
         V/Mk2IOKHkLBZilIsIknkdMKjwSa4/PP8p1+vL8BiIXGaaKFX8ZCDA4Isd3Uqo7d8m
         DA04plOJDIJNd5PrFyMbJNAtNdbw/W5v6KXyC663BYQ3zw+EfGzpsVT4ECSkqhGGBs
         z3Ro4U81lmyWUudfXFeWm4EH1m5AgTSMTy/obvaaWOmFMWBozkrOOEtZ6yvV0PkeL9
         12rTKEsiFEROw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] imx: Miscellaneous fixes and cleanups for i.MX7
Message-ID: <f8ae9455-7a70-1e84-462e-50fafb6aa73a@xs4all.nl>
Date:   Wed, 3 Mar 2021 15:03:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKMeJnjDlYsFfccYwMNPMoKot6fa+24nBAkk0aGqwRWiiU6/F+ya0nQ7vJBH0DBWNb6cRpEMr+CSt6rGLVBXT+S6OQAQdL4CLDe/iLQmCNuM1Nb4LdSv
 zKm2TucyPdETLIweL6bXJfg8y/cAFN1/ng14cwqxZOFqw4tOmJpaCiBHugL+Sj0V0EvxNBoE5LQenNb1HllkeCB7k4Vo2JDYf/ofEmLQvRT82UqnYXHopDbi
 CDt243wur+mKEoQEQ+ddZwmwBfERcsgE7QBXA/R5Qgk=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See the cover letter here for more info:

https://patchwork.linuxtv.org/project/linux-media/cover/20210215042741.28850-1-laurent.pinchart@ideasonboard.com/

The bindings patches 58-61 are not included in this PR since those have not
yet been Acked. But they are independent of all other patches, so those four
can be added to a future PR.

Regards,

	Hans

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13b

for you to fetch changes up to 65a3ad07804780fc015db876a6a8924091b05ac2:

  media: imx: imx7_mipi_csis: Print shadow registers in mipi_csis_dump_regs() (2021-03-03 14:47:12 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Laurent Pinchart (73):
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
      media: imx: capture: Remove unneeded variable in __capture_legacy_try_fmt
      media: imx: capture: Pass v4l2_pix_format to __capture_legacy_try_fmt()
      media: imx: capture: Return -EPIPE from __capture_legacy_try_fmt()
      media: imx: capture: Extract format lookup from __capture_legacy_try_fmt
      media: imx: capture: Simplify capture_validate_fmt() implementation
      media: imx: capture: Simplify __capture_legacy_try_fmt()
      media: imx: capture: Decouple video node from source with MC-centric API
      media: imx: capture: Expose V4L2_CAP_IO_MC for the MC-centric API
      media: imx: imx7-media-csi: Disable legacy video node API
      media: imx: capture: Support creating immutable link to capture device
      media: imx: imx7-media-csi: Remove control handler
      media: imx: imx7-media-csi: Move (de)init from link setup to .s_stream()
      media: imx: imx7-media-csi: Create immutable link to capture device
      media: imx: imx7-media-csi: Replace CSICR*_RESET_VAL with values
      media: imx: imx7-media-csi: Tidy up register fields macros
      media: imx: imx7-media-csi: Reorganize code in sections
      media: imx: imx7-media-csi: Validate capture format in .link_validate()
      media: imx: imx7-media-csi: Fix source type identification
      media: imx: imx7-media-csi: Don't lock access to is_csi2
      media: imx: imx7-media-csi: Rename imx7_csi_dma_start() to *_setup()
      media: imx: imx7-media-csi: Split imx7_csi_dma_stop()
      media: imx: imx7-media-csi: Move CSI configuration before source start
      media: imx: imx7-media-csi: Merge streaming_start() with csi_enable()
      media: imx: imx7-media-csi: Merge hw_reset() with init_interface()
      media: imx: imx7-media-csi: Set the MIPI data type based on the bus code
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
      media: imx: imx7_mipi_csis: Acquire reset control without naming it
      media: imx: imx7_mipi_csis: Fix input size alignment
      media: imx: imx7_mipi_csis: Make source .s_power() optional
      media: imx: imx7_mipi_csis: Avoid double get of wrap clock
      media: imx: imx7_mipi_csis: Drop 10-bit YUV support
      media: imx: imx7_mipi_csis: Fix UYVY8 media bus format
      media: imx: imx7_mipi_csis: Inline mipi_csis_set_hsync_settle()
      media: imx: imx7_mipi_csis: Move link setup check out of locked section
      media: imx: imx7_mipi_csis: Calculate Ths_settle from source lane rate
      media: imx: imx7_mipi_csis: Turn register access macros into functions
      media: imx: imx7_mipi_csis: Fully initialize MIPI_CSIS_DPHYCTRL register
      media: imx: imx7_mipi_csis: Define macros for DPHY_BCTRL_L fields
      media: imx: imx7_mipi_csis: Make ISP registers macros take channel ID
      media: imx: imx7_mipi_csis: Rename register macros to match datasheet
      media: imx: imx7_mipi_csis: Use register macros in mipi_csis_dump_regs()
      media: imx: imx7_mipi_csis: Print shadow registers in mipi_csis_dump_regs()

 drivers/media/v4l2-core/v4l2-mc.c                |    6 +-
 drivers/staging/media/imx/Kconfig                |    9 +-
 drivers/staging/media/imx/Makefile               |    6 +-
 drivers/staging/media/imx/TODO                   |    9 +-
 drivers/staging/media/imx/imx-ic-prp.c           |    4 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c      |   24 +-
 drivers/staging/media/imx/imx-media-capture.c    |  687 +++++++++++++++++++++-------------
 drivers/staging/media/imx/imx-media-csc-scaler.c |    2 +-
 drivers/staging/media/imx/imx-media-csi.c        |   33 +-
 drivers/staging/media/imx/imx-media-dev-common.c |    4 +
 drivers/staging/media/imx/imx-media-utils.c      |   23 +-
 drivers/staging/media/imx/imx-media-vdic.c       |    7 +-
 drivers/staging/media/imx/imx-media.h            |   12 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c       |    6 +-
 drivers/staging/media/imx/imx7-media-csi.c       | 1014 +++++++++++++++++++++++---------------------------
 drivers/staging/media/imx/imx7-mipi-csis.c       |  400 ++++++++++++--------
 include/media/v4l2-mc.h                          |    8 +-
 17 files changed, 1218 insertions(+), 1036 deletions(-)
