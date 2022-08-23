Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B26F59E7FD
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 18:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245526AbiHWQuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 12:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343633AbiHWQtw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 12:49:52 -0400
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8E994DFB52
        for <linux-media@vger.kernel.org>; Tue, 23 Aug 2022 06:17:40 -0700 (PDT)
Received: from mgb4.digiteq.red (unknown [62.77.71.229])
        by mx.gpxsee.org (Postfix) with ESMTPSA id 16860310A1;
        Tue, 23 Aug 2022 15:17:38 +0200 (CEST)
From:   martin.tuma@digiteqautomotive.com
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH 0/3] Digiteq Automotive MGB4 driver (fixed)
Date:   Tue, 23 Aug 2022 17:18:02 +0200
Message-Id: <20220823151805.1313-1-martin.tuma@digiteqautomotive.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Hi,
This series of patches adds a driver for the Digiteq Automotive MGB4 grabber
card. MGB4 is a modular frame grabber PCIe card for automotive video interfaces
(FPD-Link and GMSL for now). It is based on a Xilinx FPGA and uses their
XDMA IP core for DMA transfers. Additionally, Xilinx I2C and SPI IP cores
which already have drivers in linux are used in the design.

Except of the required xiic driver alias, the patches are split into two parts:
the XDMA driver and a "standard" v4l2 device driver. The XDMA driver is based
on Xilinx's sample code (https://github.com/Xilinx/dma_ip_drivers) with minor
modifications making it usable for further FPGA-based PCIe cards. The driver
was put under DMA clients in the tree, but I'm really not sure here, if that
is ok and if the driver is "good enaugh" as it is...

The rest is a quite standard v4l2 driver, with one exception - there are
a lot of sysfs options that may/must be set before opening the v4l2 device
to adapt the card on a specific signal (see mgb4-sysfs.rst for details)
as the card must be able to work with various signal sources (or displays)
that can not be auto-detected.

I have run the driver through the v4l2-compliance test suite for both the
input and the output and the results look fine to me (I can provide the
output if required).

This version fixes the compile warnings detected by the kernel test robot.

Martin Tůma, Digiteq Automotive

Martin Tůma (3):
  Added platform module alias for the xiic I2C driver
  Added Xilinx PCIe DMA IP core driver
  Added Digiteq Automotive MGB4 driver

 Documentation/admin-guide/media/mgb4-iio.rst  |   30 +
 Documentation/admin-guide/media/mgb4-mtd.rst  |   16 +
 .../admin-guide/media/mgb4-sysfs.rst          |  297 ++
 drivers/dma/Kconfig                           |    7 +
 drivers/dma/xilinx/Makefile                   |    2 +
 drivers/dma/xilinx/xdma_core.c                | 3840 +++++++++++++++++
 drivers/dma/xilinx/xdma_core.h                |  588 +++
 drivers/dma/xilinx/xdma_thread.c              |  309 ++
 drivers/dma/xilinx/xdma_thread.h              |  134 +
 drivers/dma/xilinx/xdma_version.h             |   23 +
 drivers/i2c/busses/i2c-xiic.c                 |    1 +
 drivers/media/pci/Kconfig                     |    1 +
 drivers/media/pci/Makefile                    |    1 +
 drivers/media/pci/mgb4/Kconfig                |   17 +
 drivers/media/pci/mgb4/Makefile               |    6 +
 drivers/media/pci/mgb4/mgb4_cmt.c             |  243 ++
 drivers/media/pci/mgb4/mgb4_cmt.h             |   16 +
 drivers/media/pci/mgb4/mgb4_core.c            |  512 +++
 drivers/media/pci/mgb4/mgb4_core.h            |   49 +
 drivers/media/pci/mgb4/mgb4_i2c.c             |  139 +
 drivers/media/pci/mgb4/mgb4_i2c.h             |   35 +
 drivers/media/pci/mgb4/mgb4_io.h              |   36 +
 drivers/media/pci/mgb4/mgb4_regs.c            |   30 +
 drivers/media/pci/mgb4/mgb4_regs.h            |   35 +
 drivers/media/pci/mgb4/mgb4_sysfs.h           |   18 +
 drivers/media/pci/mgb4/mgb4_sysfs_in.c        |  750 ++++
 drivers/media/pci/mgb4/mgb4_sysfs_out.c       |  734 ++++
 drivers/media/pci/mgb4/mgb4_sysfs_pci.c       |   83 +
 drivers/media/pci/mgb4/mgb4_trigger.c         |  200 +
 drivers/media/pci/mgb4/mgb4_trigger.h         |    8 +
 drivers/media/pci/mgb4/mgb4_vin.c             |  649 +++
 drivers/media/pci/mgb4/mgb4_vin.h             |   64 +
 drivers/media/pci/mgb4/mgb4_vout.c            |  496 +++
 drivers/media/pci/mgb4/mgb4_vout.h            |   58 +
 include/linux/dma/xilinx_xdma.h               |   91 +
 35 files changed, 9518 insertions(+)
 create mode 100644 Documentation/admin-guide/media/mgb4-iio.rst
 create mode 100644 Documentation/admin-guide/media/mgb4-mtd.rst
 create mode 100644 Documentation/admin-guide/media/mgb4-sysfs.rst
 create mode 100644 drivers/dma/xilinx/xdma_core.c
 create mode 100644 drivers/dma/xilinx/xdma_core.h
 create mode 100644 drivers/dma/xilinx/xdma_thread.c
 create mode 100644 drivers/dma/xilinx/xdma_thread.h
 create mode 100644 drivers/dma/xilinx/xdma_version.h
 create mode 100644 drivers/media/pci/mgb4/Kconfig
 create mode 100644 drivers/media/pci/mgb4/Makefile
 create mode 100644 drivers/media/pci/mgb4/mgb4_cmt.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_cmt.h
 create mode 100644 drivers/media/pci/mgb4/mgb4_core.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_core.h
 create mode 100644 drivers/media/pci/mgb4/mgb4_i2c.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_i2c.h
 create mode 100644 drivers/media/pci/mgb4/mgb4_io.h
 create mode 100644 drivers/media/pci/mgb4/mgb4_regs.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_regs.h
 create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs.h
 create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_in.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_out.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_sysfs_pci.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_trigger.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_trigger.h
 create mode 100644 drivers/media/pci/mgb4/mgb4_vin.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_vin.h
 create mode 100644 drivers/media/pci/mgb4/mgb4_vout.c
 create mode 100644 drivers/media/pci/mgb4/mgb4_vout.h
 create mode 100644 include/linux/dma/xilinx_xdma.h

-- 
2.37.2

