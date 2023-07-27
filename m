Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 908B77647EF
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 09:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233191AbjG0HJe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 03:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233328AbjG0HIU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 03:08:20 -0400
Received: from mgamail.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B5D4C04
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 00:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690441490; x=1721977490;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ldt/q8MYXDg0/+Wq7bm1GHoX9RJ7nIjPbhPpZiWCCu0=;
  b=A3qMbd/fxpkal/63stl7Od9+2os0ziTltNE5cQD9ILOwkTfcP8ZmDLKo
   w4ob9rL47PcgKHOYNeEP0cNoLuR/sFK8cOtp+wgsE0RtB5kIKNCxpEdDI
   ccSzP3kp3imgA4SDZZHveen7ykxO6ybcAgxmVDv1kL/2nQUh6ZkWXrn+G
   EHQBfhdFjZobkwCYDt45rU6UI7r5v9MOPvIdWf6bfnlyZeqMNPzZ6tS23
   YP5ZBEtPo9Ao0mbuOkYpCfVU2kUqdDcB6nN2adAl6H/4jCIEYZJiRVECi
   Tv1LYplDaZL10yWW15Otop+C2oQYcLOO7NNg0bPk6KUIAYbXVcymOvbb1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="370900669"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="370900669"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 00:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="704072451"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="704072451"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga006.jf.intel.com with ESMTP; 27 Jul 2023 00:03:44 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com
Cc:     ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
Date:   Thu, 27 Jul 2023 15:15:43 +0800
Message-Id: <20230727071558.1148653-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

 Documentation/admin-guide/media/ipu6-isys.rst |  138 ++
 .../admin-guide/media/ipu6_isys_graph.svg     |  338 +++++
 .../admin-guide/media/ipu6_isys_multi.svg     | 1124 ++++++++++++++
 .../admin-guide/media/v4l-drivers.rst         |    1 +
 .../driver-api/media/drivers/index.rst        |    1 +
 .../driver-api/media/drivers/ipu6.rst         |  205 +++
 MAINTAINERS                                   |   10 +
 drivers/media/pci/intel/Kconfig               |    3 +-
 drivers/media/pci/intel/Makefile              |    1 +
 drivers/media/pci/intel/ipu6/Kconfig          |   15 +
 drivers/media/pci/intel/ipu6/Makefile         |   23 +
 drivers/media/pci/intel/ipu6/ipu6-bus.c       |  164 ++
 drivers/media/pci/intel/ipu6/ipu6-bus.h       |   58 +
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  |  915 +++++++++++
 drivers/media/pci/intel/ipu6/ipu6-buttress.h  |  109 ++
 drivers/media/pci/intel/ipu6/ipu6-cpd.c       |  360 +++++
 drivers/media/pci/intel/ipu6/ipu6-cpd.h       |  102 ++
 drivers/media/pci/intel/ipu6/ipu6-dma.c       |  497 ++++++
 drivers/media/pci/intel/ipu6/ipu6-dma.h       |   19 +
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c    |  418 +++++
 drivers/media/pci/intel/ipu6/ipu6-fw-com.h    |   47 +
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   |  563 +++++++
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h   |  572 +++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  656 ++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   81 +
 .../media/pci/intel/ipu6/ipu6-isys-dwc-phy.c  |  551 +++++++
 .../media/pci/intel/ipu6/ipu6-isys-jsl-phy.c  |  246 +++
 .../media/pci/intel/ipu6/ipu6-isys-mcd-phy.c  |  736 +++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-phy.h  |   24 +
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  864 +++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   97 ++
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |  378 +++++
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |   58 +
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 1237 +++++++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  133 ++
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 1348 +++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  188 +++
 drivers/media/pci/intel/ipu6/ipu6-mmu.c       |  833 ++++++++++
 drivers/media/pci/intel/ipu6/ipu6-mmu.h       |   65 +
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |  231 +++
 .../intel/ipu6/ipu6-platform-isys-csi2-reg.h  |  187 +++
 .../media/pci/intel/ipu6/ipu6-platform-regs.h |  177 +++
 drivers/media/pci/intel/ipu6/ipu6-platform.h  |   31 +
 drivers/media/pci/intel/ipu6/ipu6.c           |  982 ++++++++++++
 drivers/media/pci/intel/ipu6/ipu6.h           |  347 +++++
 45 files changed, 15132 insertions(+), 1 deletion(-)
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
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-phy.h
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
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6.h

-- 
2.40.1

