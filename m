Return-Path: <linux-media+bounces-50203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EF8D01AB3
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 09:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E8C03791F77
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 08:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE9E37F8DA;
	Thu,  8 Jan 2026 08:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nz77OSHJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7554A37E306
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860257; cv=none; b=r32TJb5p/LpQf+PJ+/G8VmC4vy/FAoyS+Vm6a61wNa3CWAC1NSYyhuAfATNwtPjnDl1rxepJmVuX/MYg3GPK//wpJh6kJj/ryBt2zARYAk/u08D2xSYt4GwIxLEempznPASM6HDgCLXl1iETvJSz1xWcJCGLCsLRynxG/4OcrgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860257; c=relaxed/simple;
	bh=8AKOXXwezlVvdEyrc6eapqBRZqZU9JetLIIGx0xT3UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DBk4TE7EfRh14PhdKMay6G3PidWvhn71t/sNptfiCC6Ftpwqze6lgWnROGmXhJUSu7X6hFEu0+Yr8RMV5qJ7RsJ3QPk41NTuAxKf1busK1NL3SjCKUalJQrGfsr9y69hwCwPiuD1TVxKme6wGlKqOJuwrrsg8uD3DwppOvVMmrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nz77OSHJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860253; x=1799396253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8AKOXXwezlVvdEyrc6eapqBRZqZU9JetLIIGx0xT3UA=;
  b=Nz77OSHJsE+nZt6nUL4eG60LdqvOq4FA+qFu2eblBTVs3ErLE7z5w2d/
   sQHw25ydchRpSlHKrAqRDSGNlYQ/NnIn2ZzHaZbt+QmiLxK3HbwDGjH7j
   EdEQwQl0jLrQyb9qQ4FKa2Omn3900CNO1CMG/wlT4QEedH+69Y21h4Rky
   sjmwz1CKXHsNGxfp8+QhRrEy1GYd+z6nh28h4SK7kLB4Yk8sFpJVd3pKD
   2zz3EHuJugEmTF2Kmi5YuWzYjfYhGh7IY6FbxJwsg89xodGyF5nu6SrS7
   PmITLPrjxH5ZQiDuLIOCftKp1IausxZqUE/gYx+PdxlfYkL45YaKsu9mG
   w==;
X-CSE-ConnectionGUID: 3tn/yMNMSROL/ZRawrkqQQ==
X-CSE-MsgGUID: p0lb+ZtWQlCO1Zer2Ca4CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72869934"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="72869934"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:06 -0800
X-CSE-ConnectionGUID: 8aRO2LUYSuSb2HwMFSHMJg==
X-CSE-MsgGUID: oTl7wWBCTlitsguU1bxVGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233842980"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.211])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:05 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6FD72121E10;
	Thu, 08 Jan 2026 10:17:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vdlCi-00000002HSO-0c99;
	Thu, 08 Jan 2026 10:17:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 05/14] media: ipu6: Remove redundant streaming start via buffer queueing
Date: Thu,  8 Jan 2026 10:17:02 +0200
Message-ID: <20260108081712.543704-6-sakari.ailus@linux.intel.com>
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

The videobuf2 framework will ensure buffers are queued before streaming is
started. Remove support for starting streaming via the buf_queue()
callback.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 8f05987cdb4e..fdf41b3cf60e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -408,13 +408,6 @@ static void buf_queue(struct vb2_buffer *vb)
 	ipu6_isys_buf_to_fw_frame_buf(buf, stream, &bl);
 	ipu6_fw_isys_dump_frame_buff_set(dev, buf, stream->nr_output_pins);
 
-	if (!stream->streaming) {
-		ret = ipu6_isys_stream_start(av, &bl, true);
-		if (ret)
-			dev_err(dev, "stream start failed.\n");
-		goto out;
-	}
-
 	/*
 	 * We must queue the buffers in the buffer list to the
 	 * appropriate video buffer queues BEFORE passing them to the
-- 
2.47.3


