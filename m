Return-Path: <linux-media+bounces-31224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D03A9F56D
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 18:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B910F3B1BCF
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 16:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9B326E16A;
	Mon, 28 Apr 2025 16:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMFCyTwP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D55D7082D
	for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857008; cv=none; b=RFKPLKjoRwXQwmFtytWlcGQx7jEiJctahEQHU1jJcv8a1NIzt0i2pVOmlpXDt9bUdi04N2istUCvOb6wxWBUj1trwKUWtSw37jD3OAt34HU1iu1w5vjXEnoSRvVELMWLymOJ+R7MlGlM21osFfVga7iezxzhX0RZsXWoGU9vPK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857008; c=relaxed/simple;
	bh=YruapwkVV/wYRPNSbz7YD7BqkM2kysJOdO8tVyKHTAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Akhj48hEpp64bmSJBnf6Hav8NQ7kVyn4QtbUS4+dzcc+dRF0tYDf6ZtNaiEukWtJqYAdU/R3yl/MW/Hooy9Fq1t+2p4vLXZqjESLENPE2xPcXQtXnGif8FJOrP/1SDpkKDOnppHGWzvFIXRnaIByWTT5LHbi+FWZax4Qq58uJQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HMFCyTwP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745857007; x=1777393007;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YruapwkVV/wYRPNSbz7YD7BqkM2kysJOdO8tVyKHTAQ=;
  b=HMFCyTwPlWkOn5VtKcUw6UGhHk5WY+cnSdQveWC1Caj0a4zL+8sV0gPW
   421WRrsbMpsISnySdBbm6MbFuEfauW1bQGoS6RsgBl9wSjJUQjbTwWQ5h
   QV8WK0PlbPU7uTkRTWqhua5vb+2/U9MRvxtfNdelWn1b0gNfv2J8cbi3d
   dwnAVSZBVkKZHSxtGJc2jS0SLGd1AaM8G7wnW2Ar23+keBLNPXfVsy8os
   Fo3c7Neep1QhvK3bcXTlBLA0ZvgqbndkK9Pdk1yb3lol9xTFGdwKMroin
   aa4vY98KfV7maNVk6Uayn/0bJBm4jHzcYHqhyCh/lj8wt9EP2Tl1+GA6t
   A==;
X-CSE-ConnectionGUID: t84PAGSsTvalnDiMmO+7sw==
X-CSE-MsgGUID: PjfQtUQpRAWJxbbN/fDYDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47547133"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="47547133"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 09:16:47 -0700
X-CSE-ConnectionGUID: dPrJmoyNS+eTSpbqb8L3Pw==
X-CSE-MsgGUID: z96yBROYT/a3dIpjjdQwyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="164522838"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.253.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 09:16:46 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 0/5] media: intel/ipu6: initial ipu7 code sharing preparation
Date: Mon, 28 Apr 2025 18:16:38 +0200
Message-Id: <20250428161643.321617-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create ipu-isys.h and ipu-isys-subdev.c files that intention is to be
shared with incoming ipu7 driver. Do some cleanups on the way.

This is on top of:
https://git.linuxtv.org/sailus/media_tree.git/log/?h=devel
plus one patch:
https://lore.kernel.org/linux-media/20250317073856.162147-1-stanislaw.gruszka@linux.intel.com/

v1 -> v2:
  use ipu_isys_ prefix for common ipuX code


Stanislaw Gruszka (5):
  media: intel/ipu6: Separate ipu6 subdev functions
  media: intel/ipu6: Remove ipu6_isys dependency from ipu6_isys_subdev
  media: intel/ipu6: Remove redundant ipu6_isys_subdev_to_csi2 macro
  media: intel/ipu6: Rename ipu6_isys_subdev
  media: intel/ipu6: Move ipu_isys_subdev functions to common code

 drivers/media/pci/intel/ipu6/Makefile         |   3 +-
 .../media/pci/intel/ipu6/ipu-isys-subdev.c    | 255 ++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu-isys.h       |  44 +++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  31 +--
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   7 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |   6 +-
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 249 +----------------
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  40 +--
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  27 +-
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |   4 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |   2 +-
 11 files changed, 338 insertions(+), 330 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu-isys-subdev.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu-isys.h

-- 
2.34.1


