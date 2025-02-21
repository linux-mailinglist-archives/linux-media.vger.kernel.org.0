Return-Path: <linux-media+bounces-26541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B470A3EDA5
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 08:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 023377A8902
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 07:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805071FF7C2;
	Fri, 21 Feb 2025 07:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SeJ3lTbP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65D41FF1D1
	for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740124387; cv=none; b=U4E222fI3ONaA6VgkNH+C5KUKlGvk1YTk29Syn64V4q/D+jDFK46N1fze0KceNBN/EY+provUCJOhKaz9gztmHHBYhwLUtTF4+njhrE9PNiduQSuHlZDatQ5IZrPJpm3Xd/Gy8cDjTt3cub25Bs8r7qufZRcSakEpvl2AbYHoEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740124387; c=relaxed/simple;
	bh=BZjL444ik8YtlMRVfwNuOSOcfdIu09I41DjNePhWHAo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q3cX/5eGF/ye8YHyF4I+payK1PD4WmHVRNwpSxNfiuS+wkCe1D52CSZihmQwUujskoI0yBWanOXX0E5JMwaoG4aHp91YGCoPqxXWpZIIL6BUW7KqrEy/3jzbmmIfAdVhtF9pjhIBtriPYCNo2MpSMi8fJWJLid75o+1MjMWXYgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SeJ3lTbP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740124386; x=1771660386;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BZjL444ik8YtlMRVfwNuOSOcfdIu09I41DjNePhWHAo=;
  b=SeJ3lTbPfbNhL8+SD0+M7vHkHnDaMFoJFl7G4TjjsfpBU02Q3uTHl9n9
   neb4uWX8DN6R1EQwJR/YZypK6520yV1R4tG5qRoEFBBFWuKEud7Vs9z5W
   OB6f3iV2zeCajz45Vs+N8CxlsFLwlOGGBjFRrdk+HE9+kC7vdNDV4DKhS
   wjHGWfouJnFs2n/COlWbWpl5hmNdaFLBH85auUSTwWOTvGnd5VJIBVPAg
   Y53Jlgm8TI/yaETs4FOGQTjoZvG/luMnLDYptfxrGeSYThDcYK4bagStA
   C0/i0BHzAmlC5u4hQ9wXD1ePE+u/SY+TuLWpsKcxhX+uOUWPBwmmXbHdj
   w==;
X-CSE-ConnectionGUID: FScXcLW5Qw+VVoBInYlrCQ==
X-CSE-MsgGUID: bgKWHoMuSDWAIZDNG4dy5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51552508"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="51552508"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 23:52:58 -0800
X-CSE-ConnectionGUID: rQeC0+37Rz6R4TPg7aNIfg==
X-CSE-MsgGUID: pjr3E7ZUSZGIKXJBdjOFvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="115829624"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2025 23:52:53 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hdegoede@redhat.com
Cc: hans@hansg.org,
	stanislaw.gruszka@linux.intel.com,
	jerry.w.hu@intel.com,
	tian.shu.qiu@intel.com,
	daxing.li@intel.com,
	hao.yao@intel.com,
	bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [RFC PATCH 0/7] Intel IPU7 PCI and input system device drivers
Date: Fri, 21 Feb 2025 15:52:45 +0800
Message-Id: <20250221075252.3347582-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

This patch series adds a driver for Intel IPU7 input system.
IPU7 is the seventh generation of Imaging Processing Unit, it is a
PCI device which can be found in some Intel Client Platforms such as
Intel Lunar Lake and Panther Lake, etc.
User can use IPU7 to capture images from MIPI camera sensors, support
both MIPI CSI DPHY and CPHY.

IPU7 input system driver uses MC and V4L2 sub-device APIs besides V4L2.

 - ipu7.c: the IPU7 PCI device driver probe, basic hardware
   configuration and initialization
 - ipu7-bus: Initialise and register the auxiliary device for IS
 - ipu7-buttress: Hardware buttress interfaces to allow driver to
   program to enable the power, firmware authentication and interrupt
   handling.
 - ipu7-mmu and ipu7-dma: IPU MMU table setup and IPU DMA mapping APIs
 - ipu7-cpd and ipu7-boot: firmware format parse and firmware boot flow
 - abi: a series of ABI headers used by driver and firmware
 - ipu7-syscom: syscom communication interfaces used by driver to queue
   commands to firmware
 - ipu7-isys: main IPU7 input system driver, it registers CSI2 as v4l2
   sub-devices and the capture as video devices.


TODO list:
 1. ABI headers cleanup (currently a copy from firmware as it is
    still in development and updating regularly, need cleanup to unifiy
    the headers)
 2. add metadata capture support
 3. add multiple virtual-channels capture support
 4. remove unsecure mode code as secure mode is force to enabled in
    product

Bingbu Cao (7):
  media: Rename the IPU PCI device table header and add IPU7 PCI IDs
  media: ipu7: add Intel IPU7 PCI device driver
  media: ipu7: add IPU7 DMA APIs and MMU mapping
  media: ipu7: add firmware parse, syscom interface and boot sequence
  media: ipu7: add IPU7 firmware ABI headers
  media: ipu7: add IPU7 input system device driver
  media: ipu7: add Makefile and Kconfig for IPU7

 drivers/media/pci/intel/Kconfig               |    1 +
 drivers/media/pci/intel/Makefile              |    1 +
 drivers/media/pci/intel/ipu6/ipu6.c           |    2 +-
 drivers/media/pci/intel/ipu7/Kconfig          |   18 +
 drivers/media/pci/intel/ipu7/Makefile         |   23 +
 .../pci/intel/ipu7/abi/ipu7_fw_boot_abi.h     |  164 +
 .../pci/intel/ipu7/abi/ipu7_fw_common_abi.h   |  243 ++
 .../pci/intel/ipu7/abi/ipu7_fw_config_abi.h   |   19 +
 .../intel/ipu7/abi/ipu7_fw_insys_config_abi.h |   19 +
 .../pci/intel/ipu7/abi/ipu7_fw_isys_abi.h     |  495 +++
 .../pci/intel/ipu7/abi/ipu7_fw_msg_abi.h      |  509 +++
 .../intel/ipu7/abi/ipu7_fw_psys_config_abi.h  |   22 +
 .../pci/intel/ipu7/abi/ipu7_fw_syscom_abi.h   |   60 +
 drivers/media/pci/intel/ipu7/ipu7-boot.c      |  434 +++
 drivers/media/pci/intel/ipu7/ipu7-boot.h      |   21 +
 drivers/media/pci/intel/ipu7/ipu7-bus.c       |  158 +
 drivers/media/pci/intel/ipu7/ipu7-bus.h       |   69 +
 .../media/pci/intel/ipu7/ipu7-buttress-regs.h |  465 +++
 drivers/media/pci/intel/ipu7/ipu7-buttress.c  | 1187 +++++++
 drivers/media/pci/intel/ipu7/ipu7-buttress.h  |   84 +
 drivers/media/pci/intel/ipu7/ipu7-cpd.c       |  230 ++
 drivers/media/pci/intel/ipu7/ipu7-cpd.h       |   62 +
 drivers/media/pci/intel/ipu7/ipu7-dma.c       |  509 +++
 drivers/media/pci/intel/ipu7/ipu7-dma.h       |   50 +
 drivers/media/pci/intel/ipu7/ipu7-fw-isys.c   |  300 ++
 drivers/media/pci/intel/ipu7/ipu7-fw-isys.h   |   39 +
 .../media/pci/intel/ipu7/ipu7-isys-csi-phy.c  | 1051 +++++++
 .../media/pci/intel/ipu7/ipu7-isys-csi-phy.h  |   16 +
 .../pci/intel/ipu7/ipu7-isys-csi2-regs.h      | 1197 +++++++
 drivers/media/pci/intel/ipu7/ipu7-isys-csi2.c |  565 ++++
 drivers/media/pci/intel/ipu7/ipu7-isys-csi2.h |   73 +
 .../media/pci/intel/ipu7/ipu7-isys-queue.c    |  836 +++++
 .../media/pci/intel/ipu7/ipu7-isys-queue.h    |   79 +
 .../media/pci/intel/ipu7/ipu7-isys-subdev.c   |  381 +++
 .../media/pci/intel/ipu7/ipu7-isys-subdev.h   |   55 +
 .../media/pci/intel/ipu7/ipu7-isys-video.c    | 1130 +++++++
 .../media/pci/intel/ipu7/ipu7-isys-video.h    |  117 +
 drivers/media/pci/intel/ipu7/ipu7-isys.c      | 1170 +++++++
 drivers/media/pci/intel/ipu7/ipu7-isys.h      |  150 +
 drivers/media/pci/intel/ipu7/ipu7-mmu.c       |  853 +++++
 drivers/media/pci/intel/ipu7/ipu7-mmu.h       |  414 +++
 .../media/pci/intel/ipu7/ipu7-platform-regs.h |  146 +
 drivers/media/pci/intel/ipu7/ipu7-syscom.c    |   79 +
 drivers/media/pci/intel/ipu7/ipu7-syscom.h    |   36 +
 drivers/media/pci/intel/ipu7/ipu7.c           | 2791 +++++++++++++++++
 drivers/media/pci/intel/ipu7/ipu7.h           |  244 ++
 drivers/media/pci/intel/ivsc/mei_csi.c        |    2 +-
 .../{ipu6-pci-table.h => ipu-pci-table.h}     |   14 +-
 48 files changed, 16578 insertions(+), 5 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu7/Kconfig
 create mode 100644 drivers/media/pci/intel/ipu7/Makefile
 create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_boot_abi.h
 create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_common_abi.h
 create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_config_abi.h
 create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_insys_config_abi.h
 create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_isys_abi.h
 create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_msg_abi.h
 create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_psys_config_abi.h
 create mode 100644 drivers/media/pci/intel/ipu7/abi/ipu7_fw_syscom_abi.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-boot.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-boot.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-bus.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-bus.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-buttress-regs.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-buttress.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-buttress.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-cpd.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-cpd.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-dma.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-dma.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-fw-isys.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-fw-isys.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi-phy.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi-phy.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi2-regs.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi2.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-csi2.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-queue.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-queue.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-subdev.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-subdev.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-video.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys-video.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-isys.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-mmu.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-mmu.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-platform-regs.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-syscom.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7-syscom.h
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7.c
 create mode 100644 drivers/media/pci/intel/ipu7/ipu7.h
 rename include/media/{ipu6-pci-table.h => ipu-pci-table.h} (68%)

-- 
2.34.1


