Return-Path: <linux-media+bounces-27710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAFAA54B7C
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 14:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D35E4174BC5
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE0A20C46D;
	Thu,  6 Mar 2025 13:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VfDrB35c"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D60320C02E
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266400; cv=none; b=SEEKQZLtfFb+FGAxa76KR59yWrYgGq6Gxgf+BV21F3z0fQar7HofSmroRip+TV2++Ju5lNcfFXO29zIYPRdaA9wo0bK39DfjohD5EGVouL0h/a2SbaLgVMj83xRtP2RHA4DTQTPsZDC6QHaY/YNMd9x/3JkBcQsO9msTCIMn5fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266400; c=relaxed/simple;
	bh=8DBmofhqZfvHYDpKojEOqm24aw4PKbnPjtC/PtdEPfg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XKr1zU8JU3t58BGfTG4eid/MdxZmy07V7iy/acmSu0qmq0OXflQMuQPmjwrWGDb0wU64a28PAa9+gcGiWey49pLtmp9/VYxjpsD3pbTGAm8slZ/AJUyNaeyzlRC+eUXPwE/c7kTRdlgGXVFJqRTQTi2RrYKuyz7Hm3NQQb+DlfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VfDrB35c; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741266399; x=1772802399;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8DBmofhqZfvHYDpKojEOqm24aw4PKbnPjtC/PtdEPfg=;
  b=VfDrB35cOLzcVIqcwNJ401n1x1FsvD37ufXLK4TN51VT80vhBfstwTJe
   LL0fvdNf7lp0oxGEX2Pg6ZJUN2Ck0OwMSzHzTDxP3NafOjZXXHLnpYsOu
   Z2qy9hMvsVBe8tAeTDhxr/Y/gyh0IAlB9bhkmZ4eKR5GgSx17cNtTxS4P
   o16LW/PjK7dIkOTbPZA5O2rzeCOGT0itFFWXTo5RthvL1WnsZLyciMgAi
   kktrDVsExN/FDVc19i7NKQtXZFQlEHIxvM2TfgPso+LB8t8WfJYYynFiX
   00eqiAdvGOA1SH3Mjxor733/lTgK7sEPD6N5UNAwhB0gBILwBqaezbWBT
   A==;
X-CSE-ConnectionGUID: k7ufb4lLQWy9n2UE0OVltw==
X-CSE-MsgGUID: EmKaeFIdT9yd/9iyywfegg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41447439"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="41447439"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 05:06:38 -0800
X-CSE-ConnectionGUID: 8rheClbsTdO7oDNTSjBYpA==
X-CSE-MsgGUID: dc4TZp3hQNGHF/mWpHXCQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="149800819"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.246.21.136])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 05:06:37 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: [PATCH v1 0/3] media: intel/ipu6: minor cleanups
Date: Thu,  6 Mar 2025 14:06:26 +0100
Message-Id: <20250306130629.885163-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Few small cleanups

Stanislaw Gruszka (3):
  media: intel/ipu6: Remove unused IPU6_BUS_NAM
  media: intel/ipu6: Remove ipu6_buttress_ctrl started field
  media: intel/ipu6: Constify ipu6_buttress_ctrl structure

 drivers/media/pci/intel/ipu6/ipu6-bus.c      | 2 +-
 drivers/media/pci/intel/ipu6/ipu6-bus.h      | 6 ++----
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 4 +---
 drivers/media/pci/intel/ipu6/ipu6-buttress.h | 4 ++--
 4 files changed, 6 insertions(+), 10 deletions(-)

-- 
2.34.1


