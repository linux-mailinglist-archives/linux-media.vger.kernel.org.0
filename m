Return-Path: <linux-media+bounces-29120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EFFA77744
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 11:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE319167FFC
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 09:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F2C1EBFE3;
	Tue,  1 Apr 2025 09:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/RnZ0XA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832B92E3398
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 09:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498599; cv=none; b=pfhTqXxynRr+We8RGCE22D1+KSi16+0r/UIGdbFVOapoXxuWg9maR3jSIrZx3Gkyp8ldfkw4kjPVwWWWO4p361DXDmp9BNF0KwCBUc4ul8EHAdRP5wmHI+5CA1nqNCIXP6uvjsbjeT53seaOT9zYUYV/WWZldPiSguEL7XQMSLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498599; c=relaxed/simple;
	bh=pi+Y11WrsNcqDJrKwCgnnDJjBjzzek9AXJOlDhTzr00=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kdPyuxqsLeM4tGONdNMq5BLkMFlIwwNVF15Z7/ZHrmmLwwE22J686Fb+Ix10iMmcc61GLAcLU4Ne5n6UtSZwbeuIeFaaaEdwOVDqziVvfTvVWg+ac/M56WRtBw8TmyQXhHUJESlwBP5o2KO+zJiJJ/0Pybb4R/6EvQQplb54IWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/RnZ0XA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743498598; x=1775034598;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pi+Y11WrsNcqDJrKwCgnnDJjBjzzek9AXJOlDhTzr00=;
  b=h/RnZ0XAkMlUodz+jPiQNNRBYcdXBaeEu+/L5DUm+slztjQpITB6FYNU
   vUiz7PWaxGti+vVroSVO99E6hFf4zbDAxBBn1EVpfI8A5hIvGxhnRrTJW
   9hDZWA8tSjqXrS0tb9AMzlALNoaG8BEbtXchIjIG7RTl174oxJT0D9Poy
   Nqtet0p3i0HNnRnv7WR74kFsm1Uljag/YjW9l8MUAAP2PNyIYsoEM/NFQ
   BxdpYeptRRkjzznGnJT8kedez+KvLSIKC+lb013sCEUI8F7OjV7DSrcRf
   yz7tUrgT+6L10zUYp4eHKd6MlxoRJSI6Q8PS2O1eeWXIWqTheIjSOx/Ly
   g==;
X-CSE-ConnectionGUID: HQIEbybwSASxLEBDcDUCDw==
X-CSE-MsgGUID: aABV6tjNSs6FwPVBLVrefA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="32409132"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="32409132"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 02:09:57 -0700
X-CSE-ConnectionGUID: X9DttY81SnStFd5Gr6tjJQ==
X-CSE-MsgGUID: 9YRmNJBEQd6y6pnUZlnU6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="126326093"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.112.43])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 02:09:55 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 0/5] media: intel/ipu6: initial ipu7 code sharing preparation
Date: Tue,  1 Apr 2025 11:09:47 +0200
Message-Id: <20250401090953.473339-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleanup and create isys.h and isys-subdev.c files that intention is
to be shared with incoming ipu7 driver.

This is on top of:
https://git.linuxtv.org/sailus/media_tree.git/log/?h=devel
plus one patch:
https://lore.kernel.org/linux-media/20250317073856.162147-1-stanislaw.gruszka@linux.intel.com/

Stanislaw Gruszka (5):
  media: intel/ipu6: Separate ipu6 subdev functions
  media: intel/ipu6: Remove ipu6_isys dependency from ipu6_isys_subdev
  media: intel/ipu6: Remove redundant ipu6_isys_subdev_to_csi2 macro
  media: intel/ipu6: Rename ipu6_isys_subdev
  media: intel/ipu6: Move isys_subdev functions to common code

 drivers/media/pci/intel/ipu6/Makefile         |   3 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  31 +--
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   7 +-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |   5 +-
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 249 +----------------
 .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  40 +--
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  27 +-
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |   4 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |   2 +-
 drivers/media/pci/intel/ipu6/isys-subdev.c    | 253 ++++++++++++++++++
 drivers/media/pci/intel/ipu6/isys.h           |  42 +++
 11 files changed, 333 insertions(+), 330 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu6/isys-subdev.c
 create mode 100644 drivers/media/pci/intel/ipu6/isys.h

-- 
2.34.1


