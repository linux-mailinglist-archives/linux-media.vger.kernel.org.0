Return-Path: <linux-media+bounces-9599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7478F8A753A
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 22:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C46672838D8
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 20:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82DB5139CF3;
	Tue, 16 Apr 2024 20:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAPU4lFy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BEC13441F
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 20:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713298278; cv=none; b=TV/OaJvx3v+sRedtKn8+11AjqUT7UzD92EvM8f6XHgEx+wSyfxZTpKAk5K2KfcsgKFut0ni5vo9WsoHZlbYjHBDC3ZwAvnmcGVKzQ+kxjL/gfU2gKaU4gpn790+wUnXx2i4KZ5ggFT/c7zG/QlLqtIwXIEICtpb8vjtW5gmUOp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713298278; c=relaxed/simple;
	bh=j1NEuKunc5mzJV0acxYo/IomCqlr4e4rUocw7HLC96s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AZ21jg+qgq+ttQQc58gFB5uqg5K3+J92li0apar28IzsqwXTg50yMzvR70Td3vGdcUcWWjxzsLe3AbItJEI5+ZryCPYfussgd/VzyHWiRJTxXtBe0Q3dtfjzCSyBaT7hw1c2fGrCZxnLJUiOyldv5xQ/qVEWT+rXgXY0IgZme/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAPU4lFy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713298278; x=1744834278;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j1NEuKunc5mzJV0acxYo/IomCqlr4e4rUocw7HLC96s=;
  b=dAPU4lFyfxxhfOwavhfT+9FyNBpaFrYIYq28gYt0Otwqpnjdavyd2vao
   pbOTmqnwcdEoGhIXC+jSiqDglpuo0z1VaHHRsF0JO6XXcRd9chUwJNJnO
   wyvTp7FBNoHPvUjOtTR2IqiJ9CFrey9k77r6/YIz4sVTE5+xSxQTwJFpH
   T848I5yZBVMtSEojcdlBm8ylhSzpUNhhBHKSzBC2Tn3Xzb6u8zT4F8C5l
   hbO6Qh7MrZkx5UrFwSo3rS5ObpecHJPK6r1xv2pObCOeOSwiEkLBvFjif
   ghacx2scz1DPQB403ydM0jOIJiI57q3544zbHzaWB/uvUmoxKPkrheQHZ
   w==;
X-CSE-ConnectionGUID: irPWdkd0R9OhFpqpHUB5zg==
X-CSE-MsgGUID: EbrWXpmMRG+qJVHivYVbyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8626621"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="8626621"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:16 -0700
X-CSE-ConnectionGUID: 1tmbNSoATB6qrOvofUvjDA==
X-CSE-MsgGUID: a44teNP1RRKjPerDqyTeIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="27172253"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:12 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 156C111F879;
	Tue, 16 Apr 2024 23:11:07 +0300 (EEST)
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
Subject: [PATCH v4 00/19] Intel IPU6 and IPU6 input system drivers
Date: Tue, 16 Apr 2024 23:10:46 +0300
Message-Id: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello everyone,

This patch series adds a driver for Intel IPU6 input system.
IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
device which can be found in some Intel Client Platforms. User can use
IPU6 to capture images from MIPI camera sensors.

IPU6 has its own firmware which exposes ABIs to driver, and communicates
with CSE to do firmware authentication. IPU6 has its MMU hardware, so
the driver sets up a page table to allow IPU6 DMA to access the system
memory.

IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.

I can now capture images from ov01a10 and ov2740 sensors (including
metadata from the latter).

The series applies on top of the metadata patchset
<URL:https://lore.kernel.org/linux-media/20240416193319.778192-1-sakari.ailus@linux.intel.com/T/#t>.

---
since v3:

- Prepend the series with IPU bridge changes for more reliable
  IPU bridge initialisation.

- Split off the IPU6 PCI device ID table (due to the former change).

- Documentation improvements (mostly non-technical).

- Update copyright year.

- Remove unused struct ipu6_buttress_constraint and a few other unused
  definitions.

- Miscellaneous cleanups.

- Make functions static if they can be so.

- Merge watermark setup error handling bugfix from Hongju.

- Use media_pad_remote_pad_unique() instead of
  media_pad_remote_pad_first() in figuring out the remote sub-device.

- Determine the number of queues by counting the video nodes in the graph.

- Make the links from the external sub-devices to CSI-2 receivers enabled
  and immutable.

- Simplify determining CSI-2 port control base port offset.

- Create only as many links as needed between CSI-2 receivers and video
  nodes (one per video node).

v2 -> v3:
  - Add line-based metadata capture support
  - Fix header files inclusion issues
  - Fix the CSI2 timing calculation
  - Fix crash when remove module during streaming
  - Remove some unused code
  - Use cross-referencing links in documentation
  - Update Makefile to use ":=" for objects
  - Fix several bugs and coding style issues

v1 -> v2:
  - Add multiplexed streams support
  - Use auxiliary bus to register IPU6 devices
  - Add IPU6 hardware and driver overview documentation
  - Updata IPU6 admin-guide documentation
  - Update number of source pads and video nodes to support
    multiplexed streams

TODOs:
  - Add firmware CSI2 lanes configuration verification

Bingbu Cao (16):
  media: intel/ipu6: add Intel IPU6 PCI device driver
  media: intel/ipu6: add IPU auxiliary devices
  media: intel/ipu6: add IPU6 buttress interface driver
  media: intel/ipu6: CPD parsing for get firmware components
  media: intel/ipu6: add IPU6 DMA mapping API and MMU table
  media: intel/ipu6: add syscom interfaces between firmware and driver
  media: intel/ipu6: input system ABI between firmware and driver
  media: intel/ipu6: add IPU6 CSI2 receiver v4l2 sub-device
  media: intel/ipu6: add the CSI2 DPHY implementation
  media: intel/ipu6: input system video nodes and buffer queues
  media: intel/ipu6: add the main input system driver
  media: intel/ipu6: add Kconfig and Makefile
  MAINTAINERS: add maintainers for Intel IPU6 input system driver
  media: intel/ipu6: support line-based metadata capture support
  Documentation: add Intel IPU6 ISYS driver admin-guide doc
  Documentation: add documentation of Intel IPU6 driver and hardware
    overview

Sakari Ailus (3):
  media: ipu6: Add PCI device table header
  media: ivsc: csi: Use IPU bridge
  media: Kconfig: Select MEDIA_CONTROLLER for VIDEO_V4L2_SUBDEV_API

 Documentation/admin-guide/media/ipu6-isys.rst |  161 ++
 .../admin-guide/media/ipu6_isys_graph.svg     |  548 +++++++
 .../admin-guide/media/v4l-drivers.rst         |    1 +
 .../driver-api/media/drivers/index.rst        |    1 +
 .../driver-api/media/drivers/ipu6.rst         |  205 +++
 MAINTAINERS                                   |   10 +
 drivers/media/pci/intel/Kconfig               |    1 +
 drivers/media/pci/intel/Makefile              |    1 +
 drivers/media/pci/intel/ipu6/Kconfig          |   17 +
 drivers/media/pci/intel/ipu6/Makefile         |   23 +
 drivers/media/pci/intel/ipu6/ipu6-bus.c       |  165 ++
 drivers/media/pci/intel/ipu6/ipu6-bus.h       |   58 +
 drivers/media/pci/intel/ipu6/ipu6-buttress.c  |  912 +++++++++++
 drivers/media/pci/intel/ipu6/ipu6-buttress.h  |   92 ++
 drivers/media/pci/intel/ipu6/ipu6-cpd.c       |  362 +++++
 drivers/media/pci/intel/ipu6/ipu6-cpd.h       |  105 ++
 drivers/media/pci/intel/ipu6/ipu6-dma.c       |  502 ++++++
 drivers/media/pci/intel/ipu6/ipu6-dma.h       |   19 +
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c    |  413 +++++
 drivers/media/pci/intel/ipu6/ipu6-fw-com.h    |   47 +
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   |  487 ++++++
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h   |  568 +++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  667 ++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   82 +
 .../media/pci/intel/ipu6/ipu6-isys-dwc-phy.c  |  536 +++++++
 .../media/pci/intel/ipu6/ipu6-isys-jsl-phy.c  |  242 +++
 .../media/pci/intel/ipu6/ipu6-isys-mcd-phy.c  |  720 +++++++++
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  824 ++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   78 +
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |  408 +++++
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |   59 +
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 1401 +++++++++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  137 ++
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 1368 ++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  206 +++
 drivers/media/pci/intel/ipu6/ipu6-mmu.c       |  845 ++++++++++
 drivers/media/pci/intel/ipu6/ipu6-mmu.h       |   73 +
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |  226 +++
 .../intel/ipu6/ipu6-platform-isys-csi2-reg.h  |  172 ++
 .../media/pci/intel/ipu6/ipu6-platform-regs.h |  179 +++
 drivers/media/pci/intel/ipu6/ipu6.c           |  895 +++++++++++
 drivers/media/pci/intel/ipu6/ipu6.h           |  342 ++++
 drivers/media/pci/intel/ivsc/mei_csi.c        |   20 +-
 drivers/media/v4l2-core/Kconfig               |    3 +-
 include/media/ipu6-pci-table.h                |   28 +
 45 files changed, 14206 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/admin-guide/media/ipu6-isys.rst
 create mode 100644 Documentation/admin-guide/media/ipu6_isys_graph.svg
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
 create mode 100644 include/media/ipu6-pci-table.h

-- 
2.39.2


