Return-Path: <linux-media+bounces-3494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DFC82A7C7
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 07:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01782286CCC
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 06:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB23611E;
	Thu, 11 Jan 2024 06:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIEF8GHt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980415695
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 06:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704955559; x=1736491559;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wNUx11bxm6tT8Uv6oHmh9HcOrE5BKUtJ9JdPDJ9yaRw=;
  b=gIEF8GHt1pBbYV8H0UwAQyR9y6g34wXbcyX7yqKrKd8EqDAO+eYZ1q60
   Wt8JywZP0dJSmvQ6iUzur9RTFKIN66LcLXdm24DUajSF4n362oh/7sh81
   cqy4nP4DxBOeCkQLpD50vpEgVUEf/EFGljxkbs6PdTQdOEOqS7XnLesRS
   TyI4fGqbCissa4KGcnML+QKTp16D6p1y38ALDzrMJ/1O1Z9Qa8ohJCHSX
   DintTwVtZbRfNPevxRDCKMz9fUFna1/OW+kgX8b64wlVeUxU7Ov5eMdHn
   q8PNLbkGekD2OJh8NvTBVKPO3JHuB/Oz4Vlp4Aygup8gckDfFEeOvzZDG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="397628995"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="397628995"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 22:45:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="775515468"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="775515468"
Received: from icg-kernel3.bj.intel.com ([172.16.126.107])
  by orsmga007.jf.intel.com with ESMTP; 10 Jan 2024 22:45:52 -0800
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
Subject: [PATCH v3 00/15] Intel IPU6 and IPU6 input system drivers
Date: Thu, 11 Jan 2024 14:55:14 +0800
Message-ID: <20240111065531.2418836-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Bingbu Cao (17):
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
  media: ipu6/isys: support line-based metadata capture support
  media: ipu6/isys: support new v4l2 subdev state APIs

 Documentation/admin-guide/media/ipu6-isys.rst |  158 ++
 .../admin-guide/media/ipu6_isys_graph.svg     |  174 ++
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
 drivers/media/pci/intel/ipu6/ipu6-buttress.h  |  102 ++
 drivers/media/pci/intel/ipu6/ipu6-cpd.c       |  362 +++++
 drivers/media/pci/intel/ipu6/ipu6-cpd.h       |  105 ++
 drivers/media/pci/intel/ipu6/ipu6-dma.c       |  502 ++++++
 drivers/media/pci/intel/ipu6/ipu6-dma.h       |   19 +
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c    |  413 +++++
 drivers/media/pci/intel/ipu6/ipu6-fw-com.h    |   47 +
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   |  487 ++++++
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h   |  573 +++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  669 ++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   81 +
 .../media/pci/intel/ipu6/ipu6-isys-dwc-phy.c  |  536 +++++++
 .../media/pci/intel/ipu6/ipu6-isys-jsl-phy.c  |  242 +++
 .../media/pci/intel/ipu6/ipu6-isys-mcd-phy.c  |  720 +++++++++
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  833 ++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   76 +
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |  389 +++++
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |   59 +
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 1399 +++++++++++++++++
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  141 ++
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 1353 ++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  207 +++
 drivers/media/pci/intel/ipu6/ipu6-mmu.c       |  845 ++++++++++
 drivers/media/pci/intel/ipu6/ipu6-mmu.h       |   73 +
 .../intel/ipu6/ipu6-platform-buttress-regs.h  |  232 +++
 .../intel/ipu6/ipu6-platform-isys-csi2-reg.h  |  189 +++
 .../media/pci/intel/ipu6/ipu6-platform-regs.h |  179 +++
 drivers/media/pci/intel/ipu6/ipu6.c           |  966 ++++++++++++
 drivers/media/pci/intel/ipu6/ipu6.h           |  356 +++++
 42 files changed, 13881 insertions(+)
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

-- 
2.42.0


