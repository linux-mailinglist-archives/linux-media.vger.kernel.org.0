Return-Path: <linux-media+bounces-10308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A398B513F
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 08:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45E3BB2259E
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 06:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB1110A31;
	Mon, 29 Apr 2024 06:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMe/ONnT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B265F9DF
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 06:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714371594; cv=none; b=afDYRuy9xgbaOkHya7DxQKBZwJY/y0WpGUuFhevSjNVbP3on1ZQHQjVS7LlhgwKfqVLshp0H1uvW6vDIMQ+1z2vk9Lb4eaHQUVO/JjFZfuJmqyCkNqXKYnb+02DLWQ+C1VovcIWKaOmV3YXifmwgV2vtvMoejBBijhNpZEv7DhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714371594; c=relaxed/simple;
	bh=a8N+9lxo9FCMs+bvtZ0hVRv/BnUmo9ZSI2vk5zS50H0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OiuBX2FYGhRYfbnoNsdEzFrp3B3yIKP6lQQXwZfjGm5QKNcNtNlUW0NayWZeOnUYg8Su7hhYT1CyUHsxNr/biuYExjuJ+VYpmuLDNm3A4Eqry+1yjdV53oNJOTcddr+/Ocy03rte6qdrQMhe50uCIEqJgEUmJGJqqx9xLgfA0WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMe/ONnT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714371592; x=1745907592;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a8N+9lxo9FCMs+bvtZ0hVRv/BnUmo9ZSI2vk5zS50H0=;
  b=YMe/ONnTDB+Fl/JZaoGWSO200166jo3y7COo20q6Z0o0dhjqZ3mra/+9
   rlhuvIn10l7CDPxzQh90pr1+HQjaqqUqb70E7jMZIkThQiHawOmAp5qWW
   xRBH9zWwxRsgkq85RD8ynuV180t+2t03VIXRAx+pd+o6/x/hVLSwtz6SZ
   tZQ+RkmPw4AQCbgtSJFSvP0u2Jpd8En2P5e/eAAkihd6qRL5i+htA7W/P
   js/zCmhjYGkOjyKpxfqvnhM1ZoEk/fvFdDINqcy3Goq1a5vFf5gxuwuum
   meCrH4m+xkNjbb0vZmFNFvZnKBW+1NJbmSpNDgSFhmgPzg0pHgrYAT4x4
   A==;
X-CSE-ConnectionGUID: wYsQM74WSRm7jPvpouZ77g==
X-CSE-MsgGUID: 0g+200CiRoWu9zKk154/NA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13795602"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="13795602"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 23:19:39 -0700
X-CSE-ConnectionGUID: hEYNPiYARUqJKR/YVPxtxA==
X-CSE-MsgGUID: 1Fik13pzS1CfDl2EolInbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="26642948"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 23:19:35 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E5844120234;
	Mon, 29 Apr 2024 09:19:31 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v7 18/18] media: Documentation: add documentation of Intel IPU6 driver and hardware overview
Date: Mon, 29 Apr 2024 09:18:53 +0300
Message-Id: <20240429061853.983538-19-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240429061853.983538-1-sakari.ailus@linux.intel.com>
References: <20240429061853.983538-1-sakari.ailus@linux.intel.com>
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
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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
index 000000000000..6e1dd19b36fb
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
+Meteor Lake. IPU6 consists of two major systems: Input System (ISYS) and
+Processing System (PSYS). IPU6 are visible on the PCI bus as a single device, it
+can be found by ``lspci``:
+
+``0000:00:05.0 Multimedia controller: Intel Corporation Device xxxx (rev xx)``
+
+IPU6 has a 16 MB BAR in PCI configuration Space for MMIO registers which is
+visible for driver.
+
+Buttress
+=========
+
+The IPU6 is connecting to the system fabric with Buttress which is enabling host
+driver to control the IPU6, it also allows IPU6 access the system memory to
+store and load frame pixel streams and any other metadata.
+
+Buttress mainly manages several system functionalities: power management,
+interrupt handling, firmware authentication and global timer sync.
+
+ISYS and PSYS Power flow
+------------------------
+
+IPU6 driver initialize the ISYS and PSYS power up or down request by setting the
+Buttress frequency control register for ISYS and PSYS
+(``IPU6_BUTTRESS_REG_IS_FREQ_CTL`` and ``IPU6_BUTTRESS_REG_PS_FREQ_CTL``) in
+function:
+
+.. c:function:: int ipu6_buttress_power(...)
+
+Buttress forwards the request to Punit, after Punit execute the power up flow,
+Buttress indicates driver that ISYS or PSYS is powered up by updating the power
+status registers.
+
+.. Note:: ISYS power up needs take place prior to PSYS power up, ISYS power down
+	  needs take place after PSYS power down due to hardware limitation.
+
+Interrupt
+---------
+
+IPU6 interrupt can be generated as MSI or INTA, interrupt will be triggered when
+ISYS, PSYS, Buttress event or error happen, driver can get the interrupt cause
+by reading the interrupt status register ``BUTTRESS_REG_ISR_STATUS``, driver
+clears the irq status and then calls specific ISYS or PSYS irq handler.
+
+.. c:function:: irqreturn_t ipu6_buttress_isr(int irq, ...)
+
+Security and firmware authentication
+-------------------------------------
+
+To address the IPU6 firmware security concerns, the IPU6 firmware needs to
+undergo an authentication process before it is allowed to executed on the IPU6
+internal processors. The IPU6 driver will work with Converged Security Engine
+(CSE) to complete authentication process. The CSE is responsible of
+authenticating the IPU6 firmware. The authenticated firmware binary is copied
+into an isolated memory region. Firmware authentication process is implemented
+by CSE following an IPC handshake with the IPU6 driver. There are some Buttress
+registers used by the CSE and the IPU6 driver to communicate with each other via
+IPC.
+
+.. c:function:: int ipu6_buttress_authenticate(...)
+
+Global timer sync
+-----------------
+
+The IPU6 driver initiates a Hammock Harbor synchronization flow each time it
+starts camera operation. The IPU6 will synchronizes an internal counter in the
+Buttress with a copy of the SoC time, this counter maintains the up-to-date time
+until camera operation is stopped. The IPU6 driver can use this time counter to
+calibrate the timestamp based on the timestamp in response event from firmware.
+
+.. c:function:: int ipu6_buttress_start_tsc_sync(...)
+
+DMA and MMU
+============
+
+The IPU6 has its own scalar processor where the firmware run at and an internal
+32-bit virtual address space. The IPU6 has MMU address translation hardware to
+allow that scalar processors to access the internal memory and external system
+memory through IPU6 virtual address. The address translation is based on two
+levels of page lookup tables stored in system memory which are maintained by the
+IPU6 driver. The IPU6 driver sets the level-1 page table base address to MMU
+register and allows MMU to perform page table lookups.
+
+The IPU6 driver exports its own DMA operations. The IPU6 driver will update the
+page table entries for each DMA operation and invalidate the MMU TLB after each
+unmap and free.
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
+.. Note:: IPU6 MMU works behind IOMMU so for each IPU6 DMA ops, driver will call
+	  generic PCI DMA ops to ask IOMMU to do the additional mapping if VT-d
+	  enabled.
+
+Firmware file format
+====================
+
+The IPU6 firmware is in Code Partition Directory (CPD) file format. The CPD
+firmware contains a CPD header, several CPD entries and components. The CPD
+component includes 3 entries - manifest, metadata and module data. Manifest and
+metadata are defined by CSE and used by CSE for authentication. Module data is
+specific to IPU6 which holds the binary data of firmware called package
+directory. The IPU6 driver (``ipu6-cpd.c`` in particular) parses and validates
+the CPD firmware file and gets the package directory binary data of the IPU6
+firmware, copies it to specific DMA buffer and sets its base address to Buttress
+``FW_SOURCE_BASE`` register. Finally the CSE will do authentication for this
+firmware binary.
+
+
+Syscom interface
+================
+
+The IPU6 driver communicates with firmware via the Syscom ABI. Syscom is an
+inter-processor communication mechanism between the IPU scalar processors and
+the CPU. There are a number of resources shared between firmware and software.
+A system memory region where the message queues reside, firmware can access the
+memory region via the IPU MMU. The Syscom queues are FIFO fixed depth queues
+with a configurable number of tokens (messages). There are also common IPU6 MMIO
+registers where the queue read and write indices reside. Software and firmware
+function as producer and consumer of tokens in the queues and update the write
+and read indices separately when sending or receiving each message.
+
+The IPU6 driver must prepare and configure the number of input and output
+queues, configure the count of tokens per queue and the size of per token before
+initiating and starting the communication with firmware. Firmware and software
+must use same configurations. The IPU6 Buttress has a number of firmware boot
+parameter registers which can be used to store the address of configuration and
+initialise the Syscom state, then driver can request firmware to start and run via
+setting the scalar processor control status register.
+
+Input System
+============
+
+IPU6 input system consists of MIPI D-PHY and several CSI-2 receivers.  It can
+capture image pixel data from camera sensors or other MIPI CSI-2 output devices.
+
+D-PHYs and CSI-2 ports lane mapping
+-----------------------------------
+
+The IPU6 integrates different D-PHY IPs on different SoCs, on Tiger Lake and
+Alder Lake, IPU6 integrates MCD10 D-PHY, IPU6SE on Jasper Lake integrates JSL
+D-PHY and IPU6EP on Meteor Lake integrates a Synopsys DWC D-PHY. There is an
+adaptional layer between D-PHY and CSI-2 receiver controller which includes port
+configuration, PHY wrapper or private test interfaces for D-PHY. There are 3
+D-PHY drivers ``ipu6-isys-mcd-phy.c``, ``ipu6-isys-jsl-phy.c`` and
+``ipu6-isys-dwc-phy.c`` program the above 3 D-PHYs in IPU6.
+
+Different IPU6 versions have different D-PHY lanes mappings, On Tiger Lake,
+there are 12 data lanes and 8 clock lanes, IPU6 support maximum 8 CSI-2 ports,
+see the PPI mmapping in ``ipu6-isys-mcd-phy.c`` for more information. On Jasper
+Lake and Alder Lake, D-PHY has 8 data lanes and 4 clock lanes, the IPU6 supports
+maximum 4 CSI-2 ports. For Meteor Lake, D-PHY has 12 data lanes and 6 clock
+lanes so IPU6 support maximum 6 CSI-2 ports.
+
+.. Note:: Each pair of CSI-2 two ports is a single unit that can share the data
+	  lanes. For example, for CSI-2 port 0 and 1, CSI-2 port 0 support
+	  maximum 4 data lanes, CSI-2 port 1 support maximum 2 data lanes, CSI-2
+	  port 0 with 2 data lanes can work together with CSI-2 port 1 with 2
+	  data lanes. If trying to use CSI-2 port 0 with 4 lanes, CSI-2 port 1
+	  will not be available as the 4 data lanes are shared by CSI-2 port 0
+	  and 1. The same applies to CSI ports 2/3, 4/5 and 7/8.
+
+ISYS firmware ABIs
+------------------
+
+The IPU6 firmware implements a series of ABIs for software access. In general,
+software firstly prepares the stream configuration ``struct
+ipu6_fw_isys_stream_cfg_data_abi`` and sends the configuration to firmware via
+sending ``STREAM_OPEN`` command. Stream configuration includes input pins and
+output pins, input pin ``struct ipu6_fw_isys_input_pin_info_abi`` defines the
+resolution and data type of input source, output pin ``struct
+ipu6_fw_isys_output_pin_info_abi`` defines the output resolution, stride and
+frame format, etc.
+
+Once the driver gets the interrupt from firmware that indicates stream open
+successfully, the driver will send the ``STREAM_START`` and ``STREAM_CAPTURE``
+command to request firmware to start capturing image frames. ``STREAM_CAPTURE``
+command queues the buffers to firmware with ``struct
+ipu6_fw_isys_frame_buff_set``, software then waits for the interrupt and
+response from firmware, ``PIN_DATA_READY`` means a buffer is ready on a specific
+output pin and then software can return the buffer to user.
+
+.. Note:: See :ref:`Examples<ipu6_isys_capture_examples>` about how to do
+	  capture by IPU6 ISYS driver.
-- 
2.39.2


