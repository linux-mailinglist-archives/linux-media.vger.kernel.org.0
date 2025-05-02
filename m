Return-Path: <linux-media+bounces-31621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0804AA7654
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 17:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 788FC1C0133A
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55510257AFD;
	Fri,  2 May 2025 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ml9Ld7t5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97A723B0
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200692; cv=none; b=jjJKJgYTj+ixnxaKXJM1TP83TWxP4nT6cT+qP0uWAjfRHhsg8bmoaNeMNelJSr6VisopfQ8RAORaEPh1D8FpseWO9wUfBnrzssbCgqor3N0LJwSOKpg3uVzu1YgwtR4YSYivSETIGjiyMzlT5GngFhS7Wh0jbB1OE4rp/7ELDSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200692; c=relaxed/simple;
	bh=WTXOGsY0/BjzzGg9uCz2K+3p8x/1rg4mLu9UM5W4l7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fz+d6/GcOWvCcuqLSm+9Pp6lXFSykyhZNBtLR+Fc4SgiIbb3vlu2V+QTCVSN3pY5Qhr5Ev8xpblQGckIl38eeuiL+netZECYIqeCsCs217TrV7uYJ44hKJhpdbeYW2Vdt5MlGBvzYBC27SdFdKlN0lP/4gekZPsEZaXmjFrDhZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ml9Ld7t5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746200691; x=1777736691;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WTXOGsY0/BjzzGg9uCz2K+3p8x/1rg4mLu9UM5W4l7Y=;
  b=Ml9Ld7t5iao1ubp5IjLb4xjkkFfl3OiW7kkYeNxQZAqDjv4ataiCEuxb
   ZJvNesZA+DBPOolzxB/iwwvKoeSxPPDgvi5SOIiMYAHXxRWBRoa8yA7xX
   0akQH2nqufdapPGlIIct77IHtbylTV+l0tZyp7z1+Sb7g3noChOk+f8n8
   7TwZVcCmCVy4ZdumX1RWIk+MFzTLHmTS2aEXvcK8MmLYSpg5Jf88VvI/3
   Kojq/vaZQaAX8Q+RJ9y0UIbaw1ac+D2ESIWeVAoXaV3TeqbthnpgkR1aR
   vLGA4TetwSW1o6QxqjPWGAOlOjQyugNGu2l1UJ0LDnIwnejty3vW0+8/0
   g==;
X-CSE-ConnectionGUID: wjJ/1kWtTmOKdEfoW2pl2g==
X-CSE-MsgGUID: SAL4hg30Ry6L6de+v7TMQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58551561"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="58551561"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 08:44:50 -0700
X-CSE-ConnectionGUID: NeBfFjQMT9ih1FFMboRP9g==
X-CSE-MsgGUID: dKUd6ZbqQhOuuPR4HgdirA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="134626212"
Received: from csteflea-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.252.84])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 08:44:48 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v3 0/5] media: intel/ipu6: continue on ipu7 code sharing preparation
Date: Fri,  2 May 2025 17:44:41 +0200
Message-Id: <20250502154446.88965-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleanups and code sharing preparation with ipu7 driver.

This is on top of:
https://git.linuxtv.org/sailus/media_tree.git/log/?h=devel
Plus:
https://lore.kernel.org/linux-media/20250317073856.162147-1-stanislaw.gruszka@linux.intel.com/
https://lore.kernel.org/linux-media/20250428161643.321617-1-stanislaw.gruszka@linux.intel.com/#t

v2 -> v3:
 - Change comment instead of remove it

v1 -> v2:
 - use ipu_isys_ prefix
 - new patch: remove pin_ready function pointer
 - drop accessor macros for now
Stanislaw Gruszka (5):
  media: intel/ipu6: Remove pin_ready function pointer
  media: intel/ipu6: Remove line_align
  media: intel/ipu6: Change deprecated lock comment
  media: intel/ipu6: Move common structures definitions to ipu-isys.h
  media: intel/ipu6: Rename common structures

 drivers/media/pci/intel/ipu6/ipu-isys.h       |  92 +++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |   4 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   6 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 178 +++++++++---------
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |  69 +------
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  58 +++---
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  78 +-------
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  23 ++-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |   8 +-
 9 files changed, 242 insertions(+), 274 deletions(-)

-- 
2.34.1


