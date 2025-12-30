Return-Path: <linux-media+bounces-49762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46924CEA533
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 18:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 937BB301F8F5
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 17:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D240F31ED70;
	Tue, 30 Dec 2025 17:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkBf64MF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3A2CA52
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 17:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767116168; cv=none; b=MZjFKeDdJz0ZcSDeTdWd4k7tw3Ev1ZByZc65g/M1WcwW47TChPVndPEoTO9UiPC9ljbmoGJvw+SAuR36v+7zk7QWAnbH2qYuKW9YYL6E0nYlnDjtwF1hq0ihQ4IDjLNmdOqyfW8RRzW3bOQtClfXgew4uhTlA6VCGpGFO02bWwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767116168; c=relaxed/simple;
	bh=lXZjk0oxu9pQpeJbDyY/OZdLcx6pHfZe3pFDrEW8Jfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lmIg1BIwWCzxUT0DW35pJ8IxXL7KJ+iroSpJXLdZoZQS9fjjAccY/X44hoKyffDuNFOaHuEwmu7faJWwfN3QPqfk4h/k7jzS1NHAFxD7ch7S3oGMlrO/2w/rT3GHt3iuMEzPBMn9w0jjSRx8wW9msnwEVlcbUJIbdqRUBEbkGDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkBf64MF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767116164; x=1798652164;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lXZjk0oxu9pQpeJbDyY/OZdLcx6pHfZe3pFDrEW8Jfo=;
  b=IkBf64MFNJSIJ6z1ZtO6XQho7FHaVm5zZvfmGzzogQnkXhbIfiswHrgX
   /vrvgzQhu8OVWkL+c6BXIYYQGoy+7PA5dNJ7GbzNerMwNKV+Du7HemjIk
   vwNsfFoU1WkMBVTggHlzZYo92pwmgh0wbcSrZMdf1vc1qo5RB7GGlbDmJ
   uSTSOwgwDvxckB+vYcIE29rPwVJbSy3+fa/o0tybN7t4hDzQQZgyIpjhS
   8hiIbBFLfqa4SRPYmeR0sckbLjeYnAPxGSqPC8FdOdUxzRbpb9wgQrndS
   UZzwGpvEQE3u+WF/P/zHJlGJ7EgAVi5B2jFHIpsAT8yyrmkbPXHIE+WzM
   A==;
X-CSE-ConnectionGUID: WOEsHRf+TueYUnRuSaR9gw==
X-CSE-MsgGUID: UN+UX5DbSuSbnxP7pcfTRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68646762"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68646762"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 09:35:59 -0800
X-CSE-ConnectionGUID: jPihj+bUTKq4sD1Cgts7CQ==
X-CSE-MsgGUID: X+ZB831wSx64KA5RjSU8oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="224760452"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 09:35:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A0C3F11F8A6;
	Tue, 30 Dec 2025 19:36:05 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaddc-00000000twr-11XK;
	Tue, 30 Dec 2025 19:36:04 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/1] media: ccs: Fix setting initial sub-device state
Date: Tue, 30 Dec 2025 19:36:04 +0200
Message-ID: <20251230173604.215057-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix setting sub-device state for non-source sub-devices.

Fixes: 5755be5f15d9 ("media: v4l2-subdev: Rename .init_cfg() operation to .init_state()")
Cc: stable@vger.kernel.org # for v6.8 and later
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index c7b46d0fba49..3fd9ceaead21 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2940,6 +2940,8 @@ static void ccs_cleanup(struct ccs_sensor *sensor)
 	ccs_free_controls(sensor);
 }
 
+static const struct v4l2_subdev_internal_ops ccs_internal_ops;
+
 static int ccs_init_subdev(struct ccs_sensor *sensor,
 			   struct ccs_subdev *ssd, const char *name,
 			   unsigned short num_pads, u32 function,
@@ -2952,8 +2954,10 @@ static int ccs_init_subdev(struct ccs_sensor *sensor,
 	if (!ssd)
 		return 0;
 
-	if (ssd != sensor->src)
+	if (ssd != sensor->src) {
 		v4l2_subdev_init(&ssd->sd, &ccs_ops);
+		ssd->sd.internal_ops = &ccs_internal_ops;
+	}
 
 	ssd->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	ssd->sd.entity.function = function;
@@ -3062,6 +3066,10 @@ static const struct media_entity_operations ccs_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
+static const struct v4l2_subdev_internal_ops ccs_internal_ops = {
+	.init_state = ccs_init_state,
+};
+
 static const struct v4l2_subdev_internal_ops ccs_internal_src_ops = {
 	.init_state = ccs_init_state,
 	.registered = ccs_registered,
-- 
2.47.3


