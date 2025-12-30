Return-Path: <linux-media+bounces-49763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E84CEA581
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12B38302049A
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A9E32B98D;
	Tue, 30 Dec 2025 17:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3jtFa0x"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848DF284684
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767116447; cv=none; b=OvbsFPp6aRTi6Sqv70ksdAowdZCH5p5InN6oNNGy9MU1DWd5S13nCmiSMAyjfM70AQrIVqs011UM0MnOjorLXILdyo/ugN5D7ci+HX7Wl86WdAjGLWwLxN7b4oP4RSn9ylX0/yjqoZQk+KniyGUP8+ZnymLExeXXJuWkDij5JkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767116447; c=relaxed/simple;
	bh=pqT3jodIyKHMb3/2+mzEon+L5+AcySFFt8Wq7bW3ryo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=n+DRgMG7tNAsMSZe5NLjg5e7wQepB5GTlpPIaz1hzoFXQebtbxIyL7VOtH8z/+Qc6E5sMZQ+9bs8/bYLLhEmku2ARVKFTDrfmJI9Ex2JQogcIU1XRy6owY1JM5LhhQag4Ws3nUEmMiaWH3V6kf5iHcD1gMBYPz4HVT/ZZqanQBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3jtFa0x; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767116445; x=1798652445;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pqT3jodIyKHMb3/2+mzEon+L5+AcySFFt8Wq7bW3ryo=;
  b=M3jtFa0x5n8ZVXAEUmncYW8Ac9Q94oM6E/OsrqSMuXRoT9ODdrSox+ol
   DbzlxtXWkp4jmta889GxPR0EQVlv6W+utdhTTcB8DLwkA5s8T566yH3gb
   8Hc+NegaATFwCykX8RygOqd2b7iV93G9QND0cxXXyuZwSckl9V9WHyCi9
   IuAaL2AYIR8+s4K7IVG0biUU/Fe/mmtVJ1RnzZcT67hcigL5fCr8qA/Xy
   98X+0kTCTMXLAw/2X8bus7bH+OYzG/SdKLt1H/S60Iyj+bEwUj9yO/38Z
   kR9CajS6gZu7PXGs+rrYrbaVirqcQtO30yGfED0HsL8nJ5xRxVZ3jtuUO
   g==;
X-CSE-ConnectionGUID: uOYu2OjRQemZIWEaZbAu3Q==
X-CSE-MsgGUID: YXC1UdUvTACljEiwUaeycQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="72559949"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="72559949"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 09:40:45 -0800
X-CSE-ConnectionGUID: LUuvh7aCSWaiM//OUHD2EA==
X-CSE-MsgGUID: K6Eph/BySIGzSqkQeVs1vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="206309982"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 09:40:44 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 691D0121D83
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 19:40:51 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vadiE-00000000tyg-0OvL
	for linux-media@vger.kernel.org;
	Tue, 30 Dec 2025 19:40:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 0/3] CCS patches for streams support preparation
Date: Tue, 30 Dec 2025 19:40:47 +0200
Message-ID: <20251230174050.215164-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This small set of CCS patches is split off the big streaming series. I'm
posting it separately and intend to merge the patches soon.

Sakari Ailus (3):
  media: ccs: Use {enable,disable}_streams operations
  media: ccs: Track streaming state
  media: ccs: Support frame descriptors

 drivers/media/i2c/ccs/ccs-core.c | 158 +++++++++++++++++++++----------
 drivers/media/i2c/ccs/ccs.h      |   6 +-
 2 files changed, 115 insertions(+), 49 deletions(-)

-- 
2.47.3


