Return-Path: <linux-media+bounces-11235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F0C8C14CB
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 20:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A230C1C20F43
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 18:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454F073535;
	Thu,  9 May 2024 18:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cVFmwDd4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D15C2ED
	for <linux-media@vger.kernel.org>; Thu,  9 May 2024 18:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715279638; cv=none; b=Ld8yWwRya98ZypENBZ7Ss2v93qdYfC+TZ01MOWgz4YlBQme3H1mFiaQlSHcSxbUxDnL0SurMu6w/+PYaNaL0EUG1ElZdRjxh3b3KOWrySX0uLDs5Bo3CVODSny+h5KxIeLfOYhmDpDGB5ZHzSlpiSXRTIE1hEPlckyw+euTHzrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715279638; c=relaxed/simple;
	bh=GBIngwQnBwInOu3pKMgdJPg7gzgsSk0bro3PQaaz/JM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MWTAH+r5pv8YIsxBaEuyKAHdxenIMLjahLd42GdTur3XWBxnyzqZ2j/wO70SnBzd8hRtsEhXSKIRvwJh+OsJACHjCAZMpl9AJtHS2MjIPKeG3cEsvtXCslE2sRhsE95nKnt5fcezxJ3kay3FjvMtmFqWBEu6MZwq6b1vp50AtEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cVFmwDd4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715279637; x=1746815637;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GBIngwQnBwInOu3pKMgdJPg7gzgsSk0bro3PQaaz/JM=;
  b=cVFmwDd4mZdcdk1DhfvcfyDjH/RWCl9KG1D9eXcNFy+rH5203nvGhdUe
   6ZNMQ9rq7MaA1ygaT+ONo0Z29JxUMIiLK4AYHgUbLwVCt/tl9mBscOhlw
   S1cpZb3eOaGlxF7G0w7eqSbpCAs7kk2bBfNvK4ZRw/F4GXD1ZZPQfb8jv
   1viyg1ZtbBB7ZzJv+9GHCks9e/KO6wTlAnPSwLysr11sRd3h9Qsnx7sny
   KKGoLOAESqblta/h56cvG2HZVSLAdq836nB57PLJZarI/F8DICd8MFNd7
   AggbHaxwZkuTKClS1TtszluX0lzrET3ryzotndLAeexZPK1Pv0o0YPX8c
   A==;
X-CSE-ConnectionGUID: rTMYcWChS+mFX8XhOMlqVw==
X-CSE-MsgGUID: ax2fNHAgRO6HaHuLAe+r6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15054709"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15054709"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 11:33:56 -0700
X-CSE-ConnectionGUID: 1lflmClqQsirNbG3IBuZkQ==
X-CSE-MsgGUID: lyGCoOSPTcijxN2my1qgWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="29294262"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 11:33:55 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0EB4E11F9C0;
	Thu,  9 May 2024 21:33:52 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1s58aV-003vLI-39;
	Thu, 09 May 2024 21:33:51 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH 1/1] media: intel/ipu6: Don't print user-triggerable errors to kernel log
Date: Thu,  9 May 2024 21:33:41 +0300
Message-Id: <20240509183341.935400-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dev_dbg() for printing messages on user-triggerable coditions that
have no relation to driver or hardware issues.

Fixes: 3c1dfb5a69cf ("media: intel/ipu6: input system video nodes and buffer queues")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 11cd2c977abe..40a8ebfcfce2 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -34,7 +34,7 @@ static int queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
 	if (!*num_planes) {
 		sizes[0] = size;
 	} else if (sizes[0] < size) {
-		dev_err(dev, "%s: queue setup: size %u < %u\n",
+		dev_dbg(dev, "%s: queue setup: size %u < %u\n",
 			av->vdev.name, sizes[0], size);
 		return -EINVAL;
 	}
@@ -359,7 +359,7 @@ static void buf_queue(struct vb2_buffer *vb)
 	 */
 	ret = buffer_list_get(stream, &bl);
 	if (ret < 0) {
-		dev_warn(dev, "No buffers available\n");
+		dev_dbg(dev, "No buffers available\n");
 		goto out;
 	}
 
@@ -426,7 +426,7 @@ static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
 
 	if (format.width != ipu6_isys_get_frame_width(av) ||
 	    format.height != ipu6_isys_get_frame_height(av)) {
-		dev_err(dev, "wrong width or height %ux%u (%ux%u expected)\n",
+		dev_dbg(dev, "wrong width or height %ux%u (%ux%u expected)\n",
 			ipu6_isys_get_frame_width(av),
 			ipu6_isys_get_frame_height(av), format.width,
 			format.height);
@@ -521,13 +521,13 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 
 	ret = ipu6_isys_setup_video(av, &source_entity, &nr_queues);
 	if (ret < 0) {
-		dev_err(dev, "failed to setup video\n");
+		dev_dbg(dev, "failed to setup video\n");
 		goto out_return_buffers;
 	}
 
 	ret = ipu6_isys_link_fmt_validate(aq);
 	if (ret) {
-		dev_err(dev,
+		dev_dbg(dev,
 			"%s: link format validation failed (%d)\n",
 			av->vdev.name, ret);
 		goto out_pipeline_stop;
-- 
2.39.2


