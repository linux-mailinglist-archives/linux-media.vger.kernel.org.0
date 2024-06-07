Return-Path: <linux-media+bounces-12729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D32900449
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 15:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B5271C21E8F
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 13:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B39193090;
	Fri,  7 Jun 2024 13:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hh49bREt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB15D13AD0D
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 13:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717765443; cv=none; b=uokjuLjURwRKdTeQQDynBxnpG4OxhRLHyRKR3GP+6js4dguyFj3z6i+Hnjptlo83PW271mAqjM00Afo3RTPRVfnjLfbeEHXd0uYdbyTyofbELTrTn0UmttEW/Duzt1uCRCY4Y2rXyWYH0LxXpUU4eJvqX9H6t10CJB5t/Vp6tws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717765443; c=relaxed/simple;
	bh=8w26ImOuhx0FZgltT2xLKvqbc8x4XYn7Q2jH5qZh04c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=js5wW1ib0B1/Je+0KYFMoEeu3jhLwRiOnrDX0lVaOwlZU5EDSbVqL2+5Nl15zNFFqTR6b7uMj/QRDQGVS4tl15VXBDmJRJ5q2DOX1qaAs4ADxTkHqD/zBfH/Go0200EgvnCoVfMDedzt93ixgMd5sS9VmVtm/5mRfgKt9VnZ2Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hh49bREt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717765441; x=1749301441;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8w26ImOuhx0FZgltT2xLKvqbc8x4XYn7Q2jH5qZh04c=;
  b=Hh49bREt+wH2gYh19036oAvoe70z8cDlaPG1aYJ4pbr090pCPUAKfZ8b
   b2LQHMoxmuuB1dM4/5kdMa/3PaI1ywBn3YMwN6wqJ+j+vRbpRodmWWeye
   gSGQ2uH2E7onvsFiZJ9MHgEDp9jMZhIdJnuSxaFfrZFPGWTzFtJE6fkNg
   sMqC3OVbQBP6FvnO7DojQctVC87s6bZECJZirB0PQg7AeYrptsbGtp/o0
   Ky5qzgL8IPDo8zoSGhvpT7+7768eYYmBkp8v3AmCCDtnRwWOf0w7x2lQd
   cSL+VpTRrf2vHopDCjvLanqrdHCMZ9C8fiEgokECUf32fEVESGxF94lyb
   g==;
X-CSE-ConnectionGUID: k54ies2GTFCWqQpO6gawbQ==
X-CSE-MsgGUID: H8Ccrfc0T/muWLGxBm0afQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="18311921"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="18311921"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 06:04:01 -0700
X-CSE-ConnectionGUID: XJKDdp+GRfWeieJ3yqUeJA==
X-CSE-MsgGUID: kC+Mo9kURISN6aM1Se06+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="42734097"
Received: from wentongw-optiplex-8070.sh.intel.com ([10.239.154.12])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jun 2024 06:04:00 -0700
From: Wentong Wu <wentong.wu@intel.com>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: hao.yao@intel.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v2 0/3] Fix privacy issue for MEI CSI
Date: Fri,  7 Jun 2024 21:25:44 +0800
Message-Id: <20240607132547.2820515-1-wentong.wu@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if starting stream goes with privacy mode on, the whole
pipeline will fail because MEI CSI counts privacy mode on as error.
In fact, the ongoing MEI command is well executed by firmware as
well even if privacy mode is turned on. The status (-1) of command
response is just to indicate current privacy on status instead of
failed to execute command by firmware. This patch set changes the
behavior to notify privacy mode on via v4l2 privacy controlinstead
of fail the ongoing MEI command.

This patch set adds one dedicated lock for v4l2 control handler to
avoid dead locking issue as well. And the useless privacy status in
struct mei_csi is removed to make code clean.

---
v1 -> v2:
 1. switch `CSI_PRIVACY_ON` to `notif.cont.cont == CSI_PRIVACY_ON`

Wentong Wu (3):
  media: ivsc: csi: don't count privacy on as error
  media: ivsc: csi: add separate lock for v4l2 control handler
  media: ivsc: csi: remove privacy status in struct mei_csi

 drivers/media/pci/intel/ivsc/mei_csi.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

-- 
2.34.1


