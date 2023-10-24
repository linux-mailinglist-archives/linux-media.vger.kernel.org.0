Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54CE57D4EB1
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 13:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbjJXLUL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 07:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjJXLUK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 07:20:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F053EFE
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 04:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698146408; x=1729682408;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BNwS3Cdjfo3FOMWUugS63ru6ODG5ofOfRnOg/Bq0X8Y=;
  b=ZE4E4y+eYFkZyD7TEQTnyM4K8hu8VfZbCIwU/Dx4VunXpbkKKGcgLJ6G
   m4ARaPcVVPY+OR1ZQ1XLO4gziTd0Da3/u3jXcy+uezNxeyxUh9F1dfeQG
   63iqw8ZA8Ru+AXj2LrQzQE5gMXGaZncR5YClgBeXKt5rY5ykKwLJ/IF0l
   wmnhzb+Qs0GuUy7NkgVoiJ7as1ccfdmta6kSwxWYS6hi1pK+C16FQC7XV
   WD17b8WwePYIoSFNyy3naTfVScoROgMrNt10tP8g5yuS3tX0BT3ift9Og
   Au7H/FyVyMRzQPrAP8yMxupmQ6MPdcY1O0lSGk4YD2nUMJEal8tkpnKq/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="473258665"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="473258665"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 04:20:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="762069803"
X-IronPort-AV: E=Sophos;i="6.03,247,1694761200"; 
   d="scan'208";a="762069803"
Received: from icg-kernel3.bj.intel.com ([172.16.126.174])
  by fmsmga007.fm.intel.com with ESMTP; 24 Oct 2023 04:20:03 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: [PATCH v2 00/15] Intel IPU6 and IPU6 input system drivers
Date:   Tue, 24 Oct 2023 19:29:09 +0800
Message-ID: <20231024112924.3934228-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

This patch series adds a driver for Intel IPU6 input system.
IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
device which can be found in some Intel Client Platforms. User can use
IPU6 to capture images from MIPI camera sensors.

IPU6 has its own firmware which exposes ABIs to driver, and communicates
with CSE to do firmware authentication. IPU6 has its MMU hardware, so
the driver sets up a page table to allow IPU6 DMA to access the system
memory.

IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
---

v1 -> v2:
  - Add support with latest v4l2 async API
  - Add support for latest bridge and Intel ivsc driver
  - Fix lots of coding style issues not covered by checkpatch.pl
  - Fix several bugs
  - Fix several code issues found by Sparse and cppcheck

RFC -> v1:
  - Add multiplexed streams support
  - Use auxiliary bus to register IPU6 devices
  - Add IPU6 hardware and driver overview documentation
  - Updata IPU6 admin-guide documentation
  - Update number of source pads and video nodes to support
    multiplexed streams

Bingbu Cao (15):
  media: intel/ipu6: add Intel IPU6 PCI device driver
  media: intel/ipu6: add IPU auxiliary devices
  media: intel/ipu6: add IPU6 buttress interface driver
  media: intel/ipu6: CPD parsing for get firmware components
  media: intel/ipu6: add IPU6 DMA mapping API and MMU table
  media: intel/ipu6: add syscom interfaces between firmware and driver
  media: intel/ipu6: input system ABI between firmware and driver
  media: intel/ipu6: add IPU6 CSI2 receiver v4l2 sub-device
  media: intel/ipu6: add the CSI2 DPHY implementation
  media: intel/ipu6: add input system driver
  media: intel/ipu6: input system video capture nodes
  media: add Kconfig and Makefile for IPU6
  MAINTAINERS: add maintainers for Intel IPU6 input system driver
  Documentation: add Intel IPU6 ISYS driver admin-guide doc
  Documentation: add documentation of Intel IPU6 driver and hardware
    overview

 Documentation/admin-guide/media/ipu6-isys.rst |  159 ++
 .../admin-guide/media/ipu6_isys_graph.svg     |  338 +++++
 .../admin-guide/media/ipu6_isys_multi.svg     | 1124 ++++++++++++++
 .../admin-guide/media/v4l-drivers.rst         |    1 +
 .../driver-api/media/drivers/index.rst        |    1 +
 .../driver-api/media/drivers/ipu6.rst         |  205 +++
 MAINTAINERS                                   |   10 +
 drivers/media/pci/intel/Kconfig               |    1 +
 drivers/media/pci/intel/Makefile              |    1 +
 drivers/media/pci/intel/ipu6/Kconfig          |   17 +
 drivers/media/pci/intel/ipu6/Makefile         |   23 +
 drivers/media/pci/intel/ipu6/ipu6-bus.c       |  157 ++
 drivers/media/pci/intel/ipu6/ipu6-bus.h       |   50 +
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  |  900 +++++++++++
 drivers/media/pci/intel/ipu6/ipu6-buttress.h  |  107 ++
 drivers/media/pci/intel/ipu6/ipu6-cpd.c       |  355 +++++
 drivers/media/pci/intel/ipu6/ipu6-cpd.h       |  104 ++
 drivers/media/pci/intel/ipu6/ipu6-dma.c       |  491 ++++++
 drivers/media/pci/intel/ipu6/ipu6-dma.h       |   20 +
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c    |  411 +++++
 drivers/media/pci/intel/ipu6/ipu6-fw-com.h    |   47 +
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   |  484 ++++++
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h   |  570 +++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  654 ++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   81 +
 .../media/pci/intel/ipu6/ipu6-isys-dwc-phy.c  |  533 +++++++
 .../media/pci/intel/ipu6/ipu6-isys-jsl-phy.c  |  237 +++
 .../media/pci/intel/ipu6/ipu6-isys-mcd-phy.c  |  712 +++++++++
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  846 +++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   94 ++
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |  379 +++++
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |   58 +
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 1239 +++++++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  129 ++
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 1345 +++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  201 +++
 drivers/media/pci/intel/ipu6/ipu6-mmu.c       |  828 ++++++++++
 drivers/media/pci/intel/ipu6/ipu6-mmu.h       |   67 +
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |  230 +++
 .../intel/ipu6/ipu6-platform-isys-csi2-reg.h  |  187 +++
 .../media/pci/intel/ipu6/ipu6-platform-regs.h |  179 +++
 drivers/media/pci/intel/ipu6/ipu6.c           |  955 ++++++++++++
 drivers/media/pci/intel/ipu6/ipu6.h           |  352 +++++
 43 files changed, 14882 insertions(+)
 create mode 100644 Documentation/admin-guide/media/ipu6-isys.rst
 create mode 100644 Documentation/admin-guide/media/ipu6_isys_graph.svg
 create mode 100644 Documentation/admin-guide/media/ipu6_isys_multi.svg
 create mode 100644 Documentation/driver-api/media/drivers/ipu6.rst
 create mode 100644 drivers/media/pci/intel/ipu6/Kconfig
 create mode 100644 drivers/media/pci/intel/ipu6/Makefile
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-buttress.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-buttress.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-cpd.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-cpd.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-dma.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-dma.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6.h

-- 
2.42.0

