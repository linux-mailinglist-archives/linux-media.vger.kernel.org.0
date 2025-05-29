Return-Path: <linux-media+bounces-33564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C40AC7703
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 06:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E1BD4E4AFB
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 04:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E51124C060;
	Thu, 29 May 2025 04:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgJWDPub"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873D210785
	for <linux-media@vger.kernel.org>; Thu, 29 May 2025 04:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748492009; cv=none; b=Cs3CF8YfKhzpR/Jg5+W0OSy1mt3BMoVRjViDlEreMneY8HeELWz/TWPpSomtcFwppe+OY/BsqWFm2DABYTPF0M3NIC4qRZbJA4xo2D1YVwSvgg5Enr97XTrAbGEfqF3M3erct0nHzgU3oAaJJP47u4NXVPWVgzZJmb9ZiTYCMfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748492009; c=relaxed/simple;
	bh=nUmp5HVX6DGnpFJOE6OQtIG0Rpvhtaji+hqD/e8CGGI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P4ujbga50OVipCM6vswo04QLrXlztbL74OTCkFNhLA/hzjL/5eprZGD1LF0Hrev1rKgDl254B/bhbd5lcAityLG3u7rXXprrj0ivRu7mnFuGMJ5r/j1y65BAfMYimZwxAjcJhwqw/vzaok9NJNHoZfH4P32aq2MCyb5T8oZ6hH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgJWDPub; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748492008; x=1780028008;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nUmp5HVX6DGnpFJOE6OQtIG0Rpvhtaji+hqD/e8CGGI=;
  b=EgJWDPubIOUBM+UwCWq33QeqiGXECh9AmLemnq8SrO4mAIlBF80UjXOh
   VW8XUk8TcdoApc8m5MrYbNHEDWRwvuqO09CPXtUYKBqu7PBSwb2YLs75H
   L4Fj8gpbfcCaibOwLOepCq+Y15jWhSo1fk2SeJvcYo5IUzhbIMPtkeXg5
   7pbZme/O10Lw745lbxyFaAEBXGN12KVfMvXu/+HMh8KkybURbEi1vU9jt
   k0dojlq1r9jK89zpbsGSCyGaqivDc/WnPEzWgZqUcRrho2XSF9Pav2dc7
   7bsq7/hTUOua3y1Jdn9v0ZcZgRkpL4BX9U4agDxYnmFM5NLw+eOuT3q5+
   A==;
X-CSE-ConnectionGUID: fbJV7QIvTHy5j6rArR9Ftg==
X-CSE-MsgGUID: 6gfzkJDEQNer2+GFrXWbYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="75928554"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="75928554"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 21:13:27 -0700
X-CSE-ConnectionGUID: UJ+6csK4RGuemoRkrHHNzg==
X-CSE-MsgGUID: cjNwqqnhQjaNjUT8QgOX8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="148211520"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa003.jf.intel.com with ESMTP; 28 May 2025 21:13:24 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	stanislaw.gruszka@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com,
	jerry.w.hu@intel.com,
	hao.yao@intel.com,
	tian.shu.qiu@intel.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v3 0/7] Intel IPU7 PCI and input system device drivers
Date: Thu, 29 May 2025 12:13:16 +0800
Message-Id: <20250529041323.3026998-1-bingbu.cao@intel.com>
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

Changes since v2:
- Remove IPU7 PCI table from UAPI header

Changes since v1:
- Some coding style fix
- Update firmware ABI header and remove some unused code
- Remove unnecessary need_reset logic
- Remove some 'U' suffixes

Bingbu Cao (7):
  media: staging/ipu7: add Intel IPU7 PCI device driver
  media: staging/ipu7: add IPU7 DMA APIs and MMU mapping
  media: staging/ipu7: add firmware parse, syscom interface and boot
  media: staging/ipu7: add IPU7 firmware ABI headers
  media: staging/ipu7: add IPU7 input system device driver
  MAINTAINERS: add maintainers for Intel IPU7 input system driver
  media: staging/ipu7: add Makefile, Kconfig and to-do file for IPU7

 MAINTAINERS                                   |    9 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/ipu7/Kconfig            |   18 +
 drivers/staging/media/ipu7/Makefile           |   23 +
 drivers/staging/media/ipu7/TODO               |   19 +
 .../staging/media/ipu7/abi/ipu7_fw_boot_abi.h |  163 +
 .../media/ipu7/abi/ipu7_fw_common_abi.h       |  175 ++
 .../media/ipu7/abi/ipu7_fw_config_abi.h       |   19 +
 .../media/ipu7/abi/ipu7_fw_insys_config_abi.h |   19 +
 .../staging/media/ipu7/abi/ipu7_fw_isys_abi.h |  412 +++
 .../staging/media/ipu7/abi/ipu7_fw_msg_abi.h  |  465 +++
 .../media/ipu7/abi/ipu7_fw_psys_config_abi.h  |   24 +
 .../media/ipu7/abi/ipu7_fw_syscom_abi.h       |   49 +
 drivers/staging/media/ipu7/ipu7-boot.c        |  431 +++
 drivers/staging/media/ipu7/ipu7-boot.h        |   25 +
 drivers/staging/media/ipu7/ipu7-bus.c         |  158 +
 drivers/staging/media/ipu7/ipu7-bus.h         |   69 +
 .../staging/media/ipu7/ipu7-buttress-regs.h   |  461 +++
 drivers/staging/media/ipu7/ipu7-buttress.c    | 1192 +++++++
 drivers/staging/media/ipu7/ipu7-buttress.h    |   77 +
 drivers/staging/media/ipu7/ipu7-cpd.c         |  276 ++
 drivers/staging/media/ipu7/ipu7-cpd.h         |   16 +
 drivers/staging/media/ipu7/ipu7-dma.c         |  477 +++
 drivers/staging/media/ipu7/ipu7-dma.h         |   46 +
 drivers/staging/media/ipu7/ipu7-fw-isys.c     |  301 ++
 drivers/staging/media/ipu7/ipu7-fw-isys.h     |   39 +
 .../staging/media/ipu7/ipu7-isys-csi-phy.c    | 1034 ++++++
 .../staging/media/ipu7/ipu7-isys-csi-phy.h    |   16 +
 .../staging/media/ipu7/ipu7-isys-csi2-regs.h  | 1197 +++++++
 drivers/staging/media/ipu7/ipu7-isys-csi2.c   |  543 ++++
 drivers/staging/media/ipu7/ipu7-isys-csi2.h   |   64 +
 drivers/staging/media/ipu7/ipu7-isys-queue.c  |  829 +++++
 drivers/staging/media/ipu7/ipu7-isys-queue.h  |   72 +
 drivers/staging/media/ipu7/ipu7-isys-subdev.c |  348 ++
 drivers/staging/media/ipu7/ipu7-isys-subdev.h |   53 +
 drivers/staging/media/ipu7/ipu7-isys-video.c  | 1112 +++++++
 drivers/staging/media/ipu7/ipu7-isys-video.h  |  117 +
 drivers/staging/media/ipu7/ipu7-isys.c        | 1166 +++++++
 drivers/staging/media/ipu7/ipu7-isys.h        |  140 +
 drivers/staging/media/ipu7/ipu7-mmu.c         |  853 +++++
 drivers/staging/media/ipu7/ipu7-mmu.h         |  414 +++
 .../staging/media/ipu7/ipu7-platform-regs.h   |   82 +
 drivers/staging/media/ipu7/ipu7-syscom.c      |   78 +
 drivers/staging/media/ipu7/ipu7-syscom.h      |   35 +
 drivers/staging/media/ipu7/ipu7.c             | 2786 +++++++++++++++++
 drivers/staging/media/ipu7/ipu7.h             |  242 ++
 47 files changed, 16147 insertions(+)
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

-- 
2.34.1


