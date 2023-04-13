Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54D606E0AAE
	for <lists+linux-media@lfdr.de>; Thu, 13 Apr 2023 11:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbjDMJyb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Apr 2023 05:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjDMJya (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Apr 2023 05:54:30 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D9A8695
        for <linux-media@vger.kernel.org>; Thu, 13 Apr 2023 02:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681379667; x=1712915667;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9ZEMSJW+fcs79apjtWXTrLrCIPLTzfrlfZCys2rlK30=;
  b=I5ysBYo/70zsgcphq782fzANvf2NhuP1SYSWxJnIwFx+7sQtigrkEwyP
   OrZXotLy4pj3yx+VZhdPfFDwZP2hgAdcHj5gpSxJvF4EWMrc9aBJhTEDX
   l6ZI8AzI1491g5hGbjL5dZFZJK6gEWggFNrHItYI/iTsiIvrY5QIthuNL
   8IlHSi6j9mWlJBn2bw90RS4ZdoLOIPknwZFDKP6ozB1tvo5G5h4//8yBV
   jM483TQ/0Awdwywnm8BUJHiwR2sIXBaIYuryGa4FwxCtqp5N1FvNbpgQY
   zjTHAeEZK0ELHK27vWSB0VmGuqwht1frqln2oaUpy+ZoQGqhoscCo3QZK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="371992891"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="371992891"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 02:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="639599984"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="639599984"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga003.jf.intel.com with ESMTP; 13 Apr 2023 02:54:22 -0700
From:   bingbu.cao@intel.com
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, ilpo.jarvinen@linux.intel.com
Cc:     tfiga@chromium.org, senozhatsky@chromium.org, hdegoede@redhat.com,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com,
        daniel.h.kang@intel.com
Subject: [RFC PATCH 00/14] Intel IPU6 and IPU6 input system drivers
Date:   Thu, 13 Apr 2023 18:04:15 +0800
Message-Id: <20230413100429.919622-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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
TODOs:
  - Add support for multiplexed streams
  - Add firmware CSI2 lanes configuration verification and documentation

---

Bingbu Cao (13):
  media: intel/ipu6: add Intel IPU6 PCI device driver
  media: intel/ipu6: add IPU virtual bus driver
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

 MAINTAINERS                                   |   10 +
 drivers/media/pci/Kconfig                     |    1 +
 drivers/media/pci/intel/Makefile              |    3 +-
 drivers/media/pci/intel/ipu6/Kconfig          |   15 +
 drivers/media/pci/intel/ipu6/Makefile         |   23 +
 drivers/media/pci/intel/ipu6/ipu6-bus.c       |  263 ++++
 drivers/media/pci/intel/ipu6/ipu6-bus.h       |   69 +
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  |  916 ++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-buttress.h  |  109 ++
 drivers/media/pci/intel/ipu6/ipu6-cpd.c       |  359 +++++
 drivers/media/pci/intel/ipu6/ipu6-cpd.h       |  107 ++
 drivers/media/pci/intel/ipu6/ipu6-dma.c       |  497 ++++++
 drivers/media/pci/intel/ipu6/ipu6-dma.h       |   19 +
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c    |  417 ++++++
 drivers/media/pci/intel/ipu6/ipu6-fw-com.h    |   47 +
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   |  566 +++++++
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h   |  574 +++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  575 +++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   75 +
 .../media/pci/intel/ipu6/ipu6-isys-dwc-phy.c  |  549 +++++++
 .../media/pci/intel/ipu6/ipu6-isys-jsl-phy.c  |  245 +++
 .../media/pci/intel/ipu6/ipu6-isys-mcd-phy.c  |  735 +++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-phy.h  |   24 +
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  869 +++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   97 ++
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |  309 ++++
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |   70 +
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 1132 ++++++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  120 ++
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 1326 +++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  190 +++
 drivers/media/pci/intel/ipu6/ipu6-mmu.c       |  833 +++++++++++
 drivers/media/pci/intel/ipu6/ipu6-mmu.h       |   65 +
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |  231 +++
 .../intel/ipu6/ipu6-platform-isys-csi2-reg.h  |  187 +++
 .../media/pci/intel/ipu6/ipu6-platform-regs.h |  177 +++
 drivers/media/pci/intel/ipu6/ipu6-platform.h  |   31 +
 drivers/media/pci/intel/ipu6/ipu6.c           |  969 ++++++++++++
 drivers/media/pci/intel/ipu6/ipu6.h           |  344 +++++
 39 files changed, 13147 insertions(+), 1 deletion(-)
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
2.39.1

