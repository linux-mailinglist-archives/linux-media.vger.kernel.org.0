Return-Path: <linux-media+bounces-3509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4302F82A7D6
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 07:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC7071F22655
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 06:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B7B53B8;
	Thu, 11 Jan 2024 06:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmBsN8FV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A4053A0
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 06:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704955630; x=1736491630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3L7EwJXalm/aM76dBmSjPkmNOdb4XwV87Yt+LWVKnzY=;
  b=KmBsN8FVjSGJx8Xctd9+YJ473cQYskXit5ZAHP72e/NBzW9KEkf2QwLG
   II49Lpb/VHGJY+E3ptFEFvD74OVmSvKnK2g3ocvhZVg5lWepKSU6wKLG2
   mUG90+ItoJ/DBFZdsULYO+JQUWPAe6A3FzKCZfCi5yRwfibFWIwebNuj+
   Jn52Yk37IwkIbUT2MZqEZkKFSOpQFTXw4h2yGgk8bWu/MqRovon8YWscR
   9izbpgpC0CW7xQrHua++/zwZZYWJws8JEPt8jyorWTFmbC6yaoMOT9Rve
   xL12O/gSE+Zc8X0o6JJGVlb5zWfUIlhmZ0tBCZ22KzdOh8B6jQtjBdzEv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="397629227"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="397629227"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 22:47:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="775515741"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="775515741"
Received: from icg-kernel3.bj.intel.com ([172.16.126.107])
  by orsmga007.jf.intel.com with ESMTP; 10 Jan 2024 22:47:05 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com
Cc: ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v3 15/17] Documentation: add documentation of Intel IPU6 driver and hardware overview
Date: Thu, 11 Jan 2024 14:55:29 +0800
Message-ID: <20240111065531.2418836-16-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240111065531.2418836-1-bingbu.cao@intel.com>
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Add a documentation for an overview of IPU6 hardware and describe the main
the components of IPU6 driver.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 .../driver-api/media/drivers/index.rst        |   1 +
 .../driver-api/media/drivers/ipu6.rst         | 205 ++++++++++++++++++
 2 files changed, 206 insertions(+)
 create mode 100644 Documentation/driver-api/media/drivers/ipu6.rst

diff --git a/Documentation/driver-api/media/drivers/index.rst b/Documentation/driver-api/media/drivers/index.rst
index c4123a16b5f9..7f6f3dcd5c90 100644
--- a/Documentation/driver-api/media/drivers/index.rst
+++ b/Documentation/driver-api/media/drivers/index.rst
@@ -26,6 +26,7 @@ Video4Linux (V4L) drivers
 	vimc-devel
 	zoran
 	ccs/ccs
+	ipu6
 
 
 Digital TV drivers
diff --git a/Documentation/driver-api/media/drivers/ipu6.rst b/Documentation/driver-api/media/drivers/ipu6.rst
new file mode 100644
index 000000000000..b6357155c13b
--- /dev/null
+++ b/Documentation/driver-api/media/drivers/ipu6.rst
@@ -0,0 +1,205 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==================
+Intel IPU6 Driver
+==================
+
+Author: Bingbu Cao <bingbu.cao@intel.com>
+
+Overview
+=========
+
+Intel IPU6 is the sixth generation of Intel Image Processing Unit used in some
+Intel Chipsets such as Tiger Lake, Jasper Lake, Alder Lake, Raptor Lake and
+Meteor Lake. IPU6 consists of two major systems: Input System (IS) and
+Processing System (PS). IPU6 are visible on the PCI bus as a single device,
+it can be found by ``lspci``:
+
+``0000:00:05.0 Multimedia controller: Intel Corporation Device xxxx (rev xx)``
+
+IPU6 has a 16 MB BAR in PCI configuration Space for MMIO registers which is
+visible for driver.
+
+Buttress
+=========
+
+The IPU6 is connecting to the system fabric with ``Buttress`` which is enabling
+host driver to control the IPU6, it also allows IPU6 access the system memory to
+store and load frame pixel streams and any other metadata.
+
+``Buttress`` mainly manages several system functionalities - power management,
+interrupt handling, firmware authentication and global timer sync.
+
+IS and PS Power flow
+---------------------------
+
+IPU6 driver initialize the IS and PS power up or down request by setting the
+Buttress frequency control register for IS and PS -
+``IPU6_BUTTRESS_REG_IS_FREQ_CTL`` and ``IPU6_BUTTRESS_REG_PS_FREQ_CTL`` in
+function:
+
+.. c:function:: int ipu6_buttress_power(..., bool on)
+
+Buttress forwards the request to Punit, after Punit execute the power up flow,
+buttress indicates driver that IS or PS is powered up by updating the power
+status registers.
+
+.. Note:: IS power up needs take place prior to PS power up, IS power down needs
+	  take place after PS power down due to hardware limitation.
+
+
+Interrupt
+------------
+
+IPU6 interrupt can be generated as MSI or INTA, interrupt will be triggered
+when IS, PS, Buttress event or error happen, driver can get the interrupt
+cause by reading the interrupt status register ``BUTTRESS_REG_ISR_STATUS``,
+driver firstly clear the irq status and then call specific IS or PS irq handler.
+
+.. c:function:: irqreturn_t ipu6_buttress_isr(int irq, ...)
+
+Security and firmware authentication
+-------------------------------------
+To address the IPU6 firmware security concerns, the IPU6 firmware needs to
+undergo an authentication process before it is allowed to executed on the IPU6
+internal processors. Driver will work with Converged Security Engine (CSE) to
+complete authentication process. CSE is responsible of authenticating the
+IPU6 firmware, the authenticated firmware binary is copied into an isolated
+memory region. Firmware authentication process is implemented by CSE following
+an IPC handshake with driver. There are some Buttress registers used by CSE and
+driver to communicate with each other as IPC messages.
+
+.. c:function:: int ipu6_buttress_authenticate(...)
+
+Global timer sync
+------------------
+IPU driver initiates a Hammock Harbor synchronization flow each time it starts
+camera operation. IPU will synchronizes an internal counter in the Buttress
+with a copy of SoC time, this counter keeps the updated time until camera
+operation is stopped. Driver can use this time counter to calibrate the
+timestamp based on the timestamp in response event from firmware.
+
+.. c:function:: int ipu6_buttress_start_tsc_sync(...)
+
+
+DMA and MMU
+============
+
+IPU6 has its own scalar processor where the firmware run at, it has
+an internal 32-bits virtual address space. IPU6 has MMU address translation
+hardware to allow that scalar process access the internal memory and external
+system memory through IPU6 virtual address. The address translation is
+based on two levels of page lookup tables stored in system memory which are
+maintained by IPU6 driver. IPU6 driver sets the level-1 page table base address
+to MMU register and allow MMU to lookup the page table.
+
+IPU6 driver exports its own DMA operations. Driver will update the page table
+entries for each DMA operation and invalidate the MMU TLB after each unmap and
+free.
+
+.. code-block:: none
+
+    const struct dma_map_ops ipu6_dma_ops = {
+	   .alloc = ipu6_dma_alloc,
+	   .free = ipu6_dma_free,
+	   .mmap = ipu6_dma_mmap,
+	   .map_sg = ipu6_dma_map_sg,
+	   .unmap_sg = ipu6_dma_unmap_sg,
+	   ...
+    };
+
+.. Note:: IPU6 MMU works behind IOMMU, so for each IPU6 DMA ops, driver will
+	  call generic PCI DMA ops to ask IOMMU to do the additional mapping
+	  if VT-d enabled.
+
+
+Firmware file format
+=====================
+
+IPU6 release the firmware in Code Partition Directory (CPD) file format. The
+CPD firmware contains a CPD header, several CPD entries and CPD components.
+CPD component includes 3 entries - manifest, metadata and module data. Manifest
+and metadata are defined by CSE and used by CSE for authentication. Module data
+is defined by IPU6 which holds the binary data of firmware called package
+directory. IPU6 driver (``ipu6-cpd.c``) parses and validates the CPD firmware
+file and get the package directory binary data of IPU6 firmware, copy it to
+specific DMA buffer and sets its base address to Buttress ``FW_SOURCE_BASE``
+register, CSE will do authentication for this firmware binary.
+
+
+Syscom interface
+================
+
+IPU6 driver communicates with firmware via syscom ABI. Syscom is an
+inter-processor communication mechanism between IPU scalar processor and CPU.
+There are a number of resources shared between firmware and software.
+A system memory region where the message queues reside, firmware can access the
+memory region via IPU MMU. Syscom queues are FIFO fixed depth queues with
+configurable elements ``token`` (message). There is also a common IPU MMIO
+registers where the queue read and write indices reside. Software and firmware
+work as producer and consumer of tokens in queue, and update the write and read
+indices separately when sending or receiving each message.
+
+IPU6 driver must prepare and configure the number of input and output queues,
+configure the count of tokens per queue and the size of per token before
+initiate and start the communication with firmware, firmware and software must
+use same configurations. IPU6 Buttress has a number of firmware boot parameter
+registers which can be used to store the address of configuration and initiate
+the Syscom state, then driver can request firmware to start and run via setting
+the scalar processor control status register.
+
+
+Input System
+==============
+
+IPU6 input system consists of MIPI D-PHY and several CSI receiver controllers,
+it can capture image pixel data from camera sensors or other MIPI CSI output
+devices.
+
+D-PHYs and CSI-2 ports lane mapping
+-----------------------------------
+
+IPU6 integrates different D-PHY IPs on different SoCs, on Tiger Lake and Alder
+Lake, IPU6 integrates MCD10 D-PHY, IPU6SE on Jasper Lake integrates JSL D-PHY
+and IPU6EP on Meteor Lake integrates a Synopsys DWC D-PHY. There is an adaption
+layer between D-PHY and CSI receiver controller which includes port
+configuration, PHY wrapper or private test interfaces for D-PHY. There are 3
+D-PHY drivers ``ipu6-isys-mcd-phy.c``, ``ipu6-isys-jsl-phy.c`` and
+``ipu6-isys-dwc-phy.c`` program the above 3 D-PHYs in IPU6.
+
+Different IPU6 version has different D-PHY lanes mappings, On Tiger Lake, there
+are 12 data lanes and 8 clock lanes, IPU6 support maximum 8 CSI-2 ports, see
+the ppi mmapping in ``ipu6-isys-mcd-phy.c`` for more information. On Jasper Lake
+and Alder Lake, D-PHY has 8 data lanes and 4 clock lanes, IPU6 support maximum 4
+CSI-2 ports. For Meteor Lake, D-PHY has 12 data lanes and 6 clock lanes, IPU6
+support maximum 6 CSI-2 ports.
+
+.. Note:: Each adjacent CSI ports work as a pair and share the data lanes.
+	  For example, for CSI port 0 and 1, CSI port 0 support maximum 4
+	  data lanes, CSI port 1 support maximum 2 data lanes, CSI port 0
+	  with 2 data lanes can work together with CSI port 1 with 2 data lanes.
+	  If trying to use CSI port 0 with 4 lanes, CSI port 1 will not be
+	  available as the 4 data lanes are shared by CSI port 0 and 1. Same
+	  scenario is also applied for CSI port 2/3, 4/5 and 7/8.
+
+IS firmware ABIs
+----------------
+
+IPU6 firmware define a series of ABIs to software. In general, software firstly
+prepare the stream configuration ``struct ipu6_fw_isys_stream_cfg_data_abi``
+and send the configuration to firmware via sending ``STREAM_OPEN`` command.
+Stream configuration includes input pins and output pins, input pin
+``struct ipu6_fw_isys_input_pin_info_abi`` defines the resolution and data type
+of input source, output pin ``struct ipu6_fw_isys_output_pin_info_abi``
+defines the output resolution, stride and frame format, etc. Once driver get the
+interrupt from firmware that indicates stream open successfully, driver will
+send the ``STREAM_START`` and ``STREAM_CAPTURE`` command to request firmware to
+start capturing image frames. ``STREAM_CAPTURE`` command queues the buffers to
+firmware with ``struct ipu6_fw_isys_frame_buff_set``, software then wait the
+interrupt and response from firmware, ``PIN_DATA_READY`` means data ready
+on specific output pin and then software return the buffers to user.
+
+.. Note:: See :ref:`Examples<ipu6_isys_capture_examples>` about how to do
+	  capture by IPU6 IS driver.
+
+
-- 
2.42.0


