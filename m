Return-Path: <linux-media+bounces-50199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A0179D01AA7
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 09:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86799377AE64
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 08:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBF433C1A2;
	Thu,  8 Jan 2026 08:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QeEuY5Tg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2446B3B2AA
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860248; cv=none; b=JR2IrihjPUnfgMXxd1CKil5iNOfypu37zpwDjj4A3zoYOUT79jcMoUf8tT5gN+znBhgNg2EAxWQxrsIj6MQiMKdl6gZ1xIkuQGIn7QOlPu200b+l8i3QJjqX2sOPbNyD4KO4ur1MdatBJ6/Y41XBHeiV9VRZgm5uxHTKNLRgWjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860248; c=relaxed/simple;
	bh=0KKMlihr1ZxnwthgOBOM+DHZ6Sawp6K7L21rg9DIBvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJAvMxwBfK/mWgjZSGc5TZqxkmzd++ipAe7qvkixqBDC2jPDrE2T+0yezOeVJEZRhcAxZm9ow5kI3PNZTKVw5uXd45CufoFecHRVhq5sSA78OZCLbekYc2eNzH8MrAaMcyvL5oDixcGEp1IFxJBzX7nSmmp+9zEGgUliAM9CWM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QeEuY5Tg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860245; x=1799396245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0KKMlihr1ZxnwthgOBOM+DHZ6Sawp6K7L21rg9DIBvg=;
  b=QeEuY5TgX2AOofTELhJaowx8MuU9QkP9fOjN9gVN2yu/11H1aYvpkPAL
   WykRcGxOLHOY1//mPStz19ps1rjjl2EjF+k1Cr7Y0E3KFCNqoI1t3mkU8
   QtGi6hfVBJg73bGhMIhVxZ83kIDBLAOhdni2i1aFSls9afqGxM+0C848X
   3eTuDpMcdEeygBdUooW/BPSR+O7lAEIFUlds5qSawY+JLiRk7OQI25tyV
   iE6SlrAiUPu90o8zM+lSDbYgxaW+ZcCiaFkplYU5mhWNQxH9W3faXU1Xj
   jaiBXDyFvU8/xKW3p/YjfAF1DckrZMRQYm3ddJMZ7m7zT3P9zj7WJpaOQ
   w==;
X-CSE-ConnectionGUID: F+cUN0szQxS90J4n+Rga/w==
X-CSE-MsgGUID: BNToj91UR3qgLYZmwd9DlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72869931"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="72869931"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:06 -0800
X-CSE-ConnectionGUID: eDqRyMucTc6RWU1LjogmUQ==
X-CSE-MsgGUID: Wv5wwIVrTkmBr1BFuaD/nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233842974"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.211])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:05 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 77C64121E52;
	Thu, 08 Jan 2026 10:17:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vdlCi-00000002HSe-0nPh;
	Thu, 08 Jan 2026 10:17:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 08/14] media: ipu6: Always close firmware stream
Date: Thu,  8 Jan 2026 10:17:05 +0200
Message-ID: <20260108081712.543704-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Close the firmware stream even when disabling a stream on an upstream
sub-device fails. This allows the firmware to release resources related to
a stream that is stopped in any case.

Suggested-by: Bingbu Cao <bingbu.cao@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 919b77107cef..54d861aca008 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -1036,11 +1036,10 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 			sd->name, r_pad->index, stream_mask);
 		ret = v4l2_subdev_disable_streams(sd, r_pad->index,
 						  stream_mask);
-		if (ret) {
+		if (ret)
 			dev_err(dev, "stream off %s failed with %d\n", sd->name,
 				ret);
-			return ret;
-		}
+
 		close_streaming_firmware(av);
 	} else {
 		ret = start_stream_firmware(av, bl);
-- 
2.47.3


