Return-Path: <linux-media+bounces-29511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D6EA7DFC9
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66F0318993AD
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 13:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9B216F841;
	Mon,  7 Apr 2025 13:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1Tq9Aw6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDFF6088F
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 13:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033243; cv=none; b=gmAbUZpDUheS3xT+I9Vjn1rNi8LB4KVXuKGdvSqDgaVs1RMc33s+lJs6YpdNixWDMtUz/jFGvUc0t00Uju+tm+z7Jvtm9VKwgA+YhrkMv9GSKjFS/ckfHJs4nyPfFBA2+MdgC0R+O2WDOteVAR5e3/GayCuwij1o7HgaEjMkknA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033243; c=relaxed/simple;
	bh=2G05+eOtpMNTEvZEhziqmCLMmnpJ5N5TWTyMmkvnAzo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AXZT6TROQ0bCsvbKLG5xmTGL28DLYz3KCSC4PW2/3So/WqO1XCQD9oojNDbarzZBnX8MB57J369ti3Sdw76JQjyxHf3rKz4X1F5D37Jma4gf8KqDawXeVEtMAZZ1pTUR4OcOu7LeJWxYOPcF0FEL3AeYYdWZP+KAbX78gPggSAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1Tq9Aw6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033242; x=1775569242;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2G05+eOtpMNTEvZEhziqmCLMmnpJ5N5TWTyMmkvnAzo=;
  b=m1Tq9Aw6eiNU3n2Df4MJEOf1vlNx7k49y8nYkxN0PlXP37lltKbRRzsm
   cpKL/jmVsXpU0okiLJLa+8s33OhCfENS1EMBqIxJ27nbdzG9MjlN9RzTV
   YN14Qi5TnFDu8/GhLmSlmAzhNgENOGbDvrTfS0xTy5n2iNlbT8q7mPDXI
   vc7sboNFSb/G5TrSQWJ3cYd4UkJICn1o+EU2SgQgzmKKZitDLGIKsnl1C
   2FkUKLOBWmng9V+cUHIGN4lnq6ZxegKs/9/uwOcKS5Q+0fIuAhWd+sBrA
   05CVrxicGNj0nYBBgVQZg2G75Aw8n0nJ0J5sP5odiULRGPVAfwQKBxAKt
   A==;
X-CSE-ConnectionGUID: RAVV0APvSlCrCBcf04+z5g==
X-CSE-MsgGUID: XUE5B0oMQguDMb05XF0iGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="55607442"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="55607442"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:40:41 -0700
X-CSE-ConnectionGUID: I9XydhIuTPW3kGu+048jlw==
X-CSE-MsgGUID: KBxVZ6WyRwuE0tijZwozUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128293052"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.80.153])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:40:40 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 0/7] media: intel/ipu6: continue on ipu7 code sharing preparation
Date: Mon,  7 Apr 2025 15:40:30 +0200
Message-Id: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move and rename more structures to isys.h. Add accessors to make 
further transformation easier.

This is on top of:
https://git.linuxtv.org/sailus/media_tree.git/log/?h=devel
plus:
https://lore.kernel.org/linux-media/20250317073856.162147-1-stanislaw.gruszka@linux.intel.com/
https://lore.kernel.org/linux-media/20250401090953.473339-1-stanislaw.gruszka@linux.intel.com/

Stanislaw Gruszka (7):
  media: intel/ipu6: Use isd name in isys.h
  media: intel/ipu6: Remove line_align
  media: intel/ipu6: Move common structures definitions to isys.h
  media: intel/ipu6: Rename common structures
  media: intel/ipu6: Remove deprecated lock comment
  media: intel/ipu6: Introduce isys and dev accessors macros
  media: intel/ipu6: Start using accessors to get dev pointer

 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   |  14 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  20 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   6 +-
 .../media/pci/intel/ipu6/ipu6-isys-dwc-phy.c  |  16 +-
 .../media/pci/intel/ipu6/ipu6-isys-jsl-phy.c  |   8 +-
 .../media/pci/intel/ipu6/ipu6-isys-mcd-phy.c  |  10 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 180 +++++++++---------
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |  66 +------
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  84 ++++----
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  77 +-------
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  35 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  35 +++-
 drivers/media/pci/intel/ipu6/isys.h           | 103 +++++++++-
 13 files changed, 332 insertions(+), 322 deletions(-)

-- 
2.34.1


