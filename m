Return-Path: <linux-media+bounces-31244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A72A1AA008B
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 05:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 387DC4827F3
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 03:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79CF270EB3;
	Tue, 29 Apr 2025 03:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3XH3quw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4FE270542
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 03:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745897328; cv=none; b=Q7Tc5O7TMNrhGXO+hZw4b8RJi87E07jtcBaj1x++gFkScIOhWAYvcqGlqWNR5XJgal1q8XcxvVa1gTVBvyQEC2gTQMQi2q/GsXUY+uvPi+EsOfaqV/mufUOpwWEo9yJsGjGyeLcwkfJ4LeR0KWM/7mtoqX95O/3DRUyBQSWbO6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745897328; c=relaxed/simple;
	bh=gQF7yyJ1sa+/TzYQEKOipFzNTkdMyh3MegrO5F4ePr8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r/yvaoYGyqUR94BAnhyIVRgo+4ujn5fCRjGEwaOKzs+cxX4rVzsIGyui8IX2rj+II/Hdkz/WqRabRsW8mtsOnbyUAKWlCPTL2p/zydEYBYQrgyet0OnByzG6qOilsvONdO1oMff5bTLngSDCqnvgU76uZJzfDC8BZu0skuYKSRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3XH3quw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745897326; x=1777433326;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gQF7yyJ1sa+/TzYQEKOipFzNTkdMyh3MegrO5F4ePr8=;
  b=j3XH3quw8T0p6osf1gq+rW88haprh9ujalh1gWTmAbuN8ASOXqu3TA6f
   Zv1f9G29JA0l95gK9ew5VQrjPDbUZYw0LvjdM9qfNQlu1UlwB3UHzSfYN
   SMjMBAODUteHfMiLsUl6x8HAppSojoHhIczRH5u76xQjr5IS9qdFCbFhE
   qdE5OkzUhgIeBnahHc0dd5K/apJYGAReH9sj6mXKKZtz1x/yocnZdJJ/S
   Hs+RfvuWSyzWX+CSMrI9SCwgBq65h1nXgzJzRSaMujcdQVdYCO+vD4VgE
   ZSEwn7TlRqohXfqJbsWgpzRNcj+Vk6x7x2rBOBsdbCCmpf3Dm1f1rMux3
   g==;
X-CSE-ConnectionGUID: dc4Weyj7TkCuLB/I+RNbbQ==
X-CSE-MsgGUID: YW0BAqTZSqqxlVMiafNgNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58158580"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="58158580"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 20:28:45 -0700
X-CSE-ConnectionGUID: NG82DLTNQXqUnS5nKj+Rlg==
X-CSE-MsgGUID: BA6sgkZUTZ2H+r0Lxuzq1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="138791555"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa004.fm.intel.com with ESMTP; 28 Apr 2025 20:28:42 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	stanislaw.gruszka@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com,
	phasta@mailbox.org,
	helgaas@kernel.org,
	jerry.w.hu@intel.com,
	hao.yao@intel.com,
	tian.shu.qiu@intel.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH 0/8] Intel IPU7 PCI and input system device drivers
Date: Tue, 29 Apr 2025 11:28:33 +0800
Message-Id: <20250429032841.115107-1-bingbu.cao@intel.com>
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

Sakari suggest during RFC patch review it is better to separate
the common code between IPU6 and IPU7 into a standalone module.
So it is expected to move this driver out of staging tree in future
once the common code separation complete for IPU6.

Bingbu Cao (8):
  media: Rename the IPU PCI device table header and add IPU7 PCI IDs
  media: staging/ipu7: add Intel IPU7 PCI device driver
  media: staging/ipu7: add IPU7 DMA APIs and MMU mapping
  media: staging/ipu7: add firmware parse, syscom interface and boot
    sequence
  media: staging/ipu7: add IPU7 firmware ABI headers
  media: staging/ipu7: add IPU7 input system device driver
  media: staging/ipu7: add Makefile and Kconfig for IPU7
  MAINTAINERS: add maintainers for Intel IPU7 input system driver

 MAINTAINERS                                   |    9 +
 drivers/media/pci/intel/ipu6/ipu6.c           |    2 +-
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/ipu7/Kconfig            |   18 +
 drivers/staging/media/ipu7/Makefile           |   23 +
 drivers/staging/media/ipu7/TODO               |   13 +
 .../staging/media/ipu7/abi/ipu7_fw_boot_abi.h |  164 +
 .../media/ipu7/abi/ipu7_fw_common_abi.h       |  243 ++
 .../media/ipu7/abi/ipu7_fw_config_abi.h       |   19 +
 .../media/ipu7/abi/ipu7_fw_insys_config_abi.h |   19 +
 .../staging/media/ipu7/abi/ipu7_fw_isys_abi.h |  495 +++
 .../staging/media/ipu7/abi/ipu7_fw_msg_abi.h  |  509 +++
 .../media/ipu7/abi/ipu7_fw_psys_config_abi.h  |   22 +
 .../media/ipu7/abi/ipu7_fw_syscom_abi.h       |   60 +
 drivers/staging/media/ipu7/ipu7-boot.c        |  431 +++
 drivers/staging/media/ipu7/ipu7-boot.h        |   25 +
 drivers/staging/media/ipu7/ipu7-bus.c         |  158 +
 drivers/staging/media/ipu7/ipu7-bus.h         |   69 +
 .../staging/media/ipu7/ipu7-buttress-regs.h   |  463 +++
 drivers/staging/media/ipu7/ipu7-buttress.c    | 1192 +++++++
 drivers/staging/media/ipu7/ipu7-buttress.h    |   77 +
 drivers/staging/media/ipu7/ipu7-cpd.c         |  276 ++
 drivers/staging/media/ipu7/ipu7-cpd.h         |   16 +
 drivers/staging/media/ipu7/ipu7-dma.c         |  477 +++
 drivers/staging/media/ipu7/ipu7-dma.h         |   46 +
 drivers/staging/media/ipu7/ipu7-fw-isys.c     |  301 ++
 drivers/staging/media/ipu7/ipu7-fw-isys.h     |   39 +
 .../staging/media/ipu7/ipu7-isys-csi-phy.c    | 1028 ++++++
 .../staging/media/ipu7/ipu7-isys-csi-phy.h    |   16 +
 .../staging/media/ipu7/ipu7-isys-csi2-regs.h  | 1197 +++++++
 drivers/staging/media/ipu7/ipu7-isys-csi2.c   |  542 ++++
 drivers/staging/media/ipu7/ipu7-isys-csi2.h   |   73 +
 drivers/staging/media/ipu7/ipu7-isys-queue.c  |  838 +++++
 drivers/staging/media/ipu7/ipu7-isys-queue.h  |   72 +
 drivers/staging/media/ipu7/ipu7-isys-subdev.c |  381 +++
 drivers/staging/media/ipu7/ipu7-isys-subdev.h |   55 +
 drivers/staging/media/ipu7/ipu7-isys-video.c  | 1127 +++++++
 drivers/staging/media/ipu7/ipu7-isys-video.h  |  117 +
 drivers/staging/media/ipu7/ipu7-isys.c        | 1170 +++++++
 drivers/staging/media/ipu7/ipu7-isys.h        |  142 +
 drivers/staging/media/ipu7/ipu7-mmu.c         |  853 +++++
 drivers/staging/media/ipu7/ipu7-mmu.h         |  414 +++
 .../staging/media/ipu7/ipu7-platform-regs.h   |  146 +
 drivers/staging/media/ipu7/ipu7-syscom.c      |   78 +
 drivers/staging/media/ipu7/ipu7-syscom.h      |   35 +
 drivers/staging/media/ipu7/ipu7.c             | 2786 +++++++++++++++++
 drivers/staging/media/ipu7/ipu7.h             |  242 ++
 .../{ipu6-pci-table.h => ipu-pci-table.h}     |   14 +-
 49 files changed, 16491 insertions(+), 4 deletions(-)
 create mode 100644 drivers/staging/media/ipu7/Kconfig
 create mode 100644 drivers/staging/media/ipu7/Makefile
 create mode 100644 drivers/staging/media/ipu7/TODO
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_config_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_insys_config_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_psys_config_abi.h
 create mode 100644 drivers/staging/media/ipu7/abi/ipu7_fw_syscom_abi.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-boot.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-boot.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-bus.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-bus.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-buttress-regs.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-buttress.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-buttress.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-cpd.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-cpd.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-dma.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-dma.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-fw-isys.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-fw-isys.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-csi-phy.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-csi2-regs.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-csi2.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-csi2.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-queue.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-queue.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-subdev.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-subdev.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-video.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys-video.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-isys.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-mmu.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-mmu.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-platform-regs.h
 create mode 100644 drivers/staging/media/ipu7/ipu7-syscom.c
 create mode 100644 drivers/staging/media/ipu7/ipu7-syscom.h
 create mode 100644 drivers/staging/media/ipu7/ipu7.c
 create mode 100644 drivers/staging/media/ipu7/ipu7.h
 rename include/media/{ipu6-pci-table.h => ipu-pci-table.h} (68%)

-- 
2.34.1


