Return-Path: <linux-media+bounces-31439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A8CAA4A57
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 13:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A39A176CDB
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159B925333E;
	Wed, 30 Apr 2025 11:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1oY1URD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B0D22173C
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 11:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014038; cv=none; b=Vb5si2w+ARNH3ijWbQEwHL16fbLiZerOBrZKbmv1ATqqfDDSZZ/uEQ5BZzlybhCDCgSRd2VNb5YsdYKKsEHYvJl7rqTZ2SRBYFP+MFXkHw5iULNLeTW7fjnlNcFfeHPnqoT6KUH6/I0MjEBRlDccuU45JBZWBtXCChc3FNPwasg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014038; c=relaxed/simple;
	bh=xv5wZAdL7lFMONrSjjcmPdQbO3wm7UImIWBpFIbFYxk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q0O0x2i6cn2ua/CRWcQevKlA7IfgKD840tvvm8lZPei3v8pADDS3X1opFuQ23+rAXTJeiVX7rDjcWy2X7QFSeSrEv/XrVRUaKRQ3gLkHNUB3ZwD9ccTzku6u2RWL+q76gpuBXBwQsgq21970LroEV3TuaXjCh5VYCr6A2s+7dMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1oY1URD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746014037; x=1777550037;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xv5wZAdL7lFMONrSjjcmPdQbO3wm7UImIWBpFIbFYxk=;
  b=l1oY1URDDkTlXw23O9oZ6td7B/CiP2QJ+rcnmwWmEINaA/gsBlgb3tQO
   FC2rz9gNIQUhkaqb1OzYJzZzLiSbqrPX+tQmcft/kgE1X8dHdJQunOgAJ
   wnVFBBgmjFWj06hR4bGLdWpglLN2jUfYOAzsEGtRgaIKfjAoKjhDBEy+i
   ZBLusRP5otp/Rl1scpMyTJja82ud9GOXjWWNc+Pckdlfsnp4selXJ/8fs
   IvRpvD7BrNL61RqAquRrNJEhw63Cia5tHjQlHe7xLerj4ttl3QI+IbgGc
   Gd7fzh/mp3pfgVVrUsdWgXT9pSugk6dlkbKIf3ckqUxZk5GRo3MKdM6oI
   w==;
X-CSE-ConnectionGUID: 7H0rxjf6SHaHdoMUnIBktw==
X-CSE-MsgGUID: UT/oHywpTwCnP534yzfwLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="50326375"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="50326375"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:53:56 -0700
X-CSE-ConnectionGUID: QZvV5eYDRtWRYXxVR3Zc7Q==
X-CSE-MsgGUID: +fIHc3VyRwO8vbu4ySwupw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="134612828"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.84.5])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:53:54 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 0/5] media: intel/ipu6: continue on ipu7 code sharing preparation
Date: Wed, 30 Apr 2025 13:53:45 +0200
Message-Id: <20250430115350.506460-1-stanislaw.gruszka@linux.intel.com>
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

v1 -> v2:
 - use ipu_isys_ prefix
 - new patch: remove pin_ready function pointer
 - drop accessor macros for now

Stanislaw Gruszka (5):
  media: intel/ipu6: Remove pin_ready function pointer
  media: intel/ipu6: Remove line_align
  media: intel/ipu6: Remove deprecated lock comment
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


