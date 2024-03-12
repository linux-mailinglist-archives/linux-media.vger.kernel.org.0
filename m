Return-Path: <linux-media+bounces-6894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45981879233
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0103B282568
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 10:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A5458AD4;
	Tue, 12 Mar 2024 10:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8RYpnuZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D22A79DDD
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710239685; cv=none; b=HOz+nGi52Wgd4pWbZOrUaRJsN/CIaxrCGaJ///UWr4eF0Cg3TlCkP8KCgPL8exZVE9ddOYBfu6vnyVrPXlLGnq0IehhKiRYgppVcOETNP+TQKtti8OVq6tqK2GGO4d+QDze/YipBgLKiYasVqFdyzVAldUeo5zFk0kqZxJ8tYpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710239685; c=relaxed/simple;
	bh=GnXZ+uykzjm2yeKEIqJ8UlgN7XyR0uSitA/90So7sNo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k482UfG4ROZx2Qm73Qp2f+MKZnrLITPeiOC1GPugeFA/+plf1GqVyoiveC3Dz2c1FzQwDER5aNOCLkaupYL3u5wj4BG8sw2kByGfTDJws7D/z2xjQ7dSm+TQKFcT/yAt20bCxHzqwmCz/lGoHDErUn8vULIv8Fn3GOs7Xc21j5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8RYpnuZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710239684; x=1741775684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GnXZ+uykzjm2yeKEIqJ8UlgN7XyR0uSitA/90So7sNo=;
  b=F8RYpnuZqBgb7/2AY7cQodIrBEY3i8Kjl4knWBmJ9OfpdBBr0oaNPYN2
   bZ90vhXTitVytaHajSoCl6j+JQPnN3QWSJGrpbE/ltZ/x/WXakt2I0SrY
   PBMmpjHYR6BKP3o1rtUkIAh9ZrQNRPYb5noxcf8ZydbB+fBaADhEwwdCS
   KUUWXbNtkfHRMJFisyQQnvVBFgsHz8BH8APUlm3ba/0DAbMwbEpa8AOK8
   RvmQhm6Ca69Hg9DTVr9LQW68rkt2eDqO5ocBar/avJUf55iZ1ATS16GLw
   x1q5VCeaykvlgaGvozIV2X2y+FhCqmMQakemPB+GycCJIDC82IxuAE8AX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4794346"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4794346"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16194119"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:34:43 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D0A8A11F819;
	Tue, 12 Mar 2024 12:34:39 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v3 25/26] media: mc: Enforce one-time registration
Date: Tue, 12 Mar 2024 12:34:21 +0200
Message-Id: <20240312103422.216484-26-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312103422.216484-1-sakari.ailus@linux.intel.com>
References: <20240312103422.216484-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A media devnode may be registered only once. Enforce this by setting the
minor to -1 in init.

Registration initialises the character device and sets up the device name.
These should take place only once during the lifetime of the media device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/mc/mc-devnode.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
index e2a30b21e6c8..8742bd7a3521 100644
--- a/drivers/media/mc/mc-devnode.c
+++ b/drivers/media/mc/mc-devnode.c
@@ -240,6 +240,7 @@ void media_devnode_init(struct media_devnode *devnode)
 {
 	device_initialize(&devnode->dev);
 	devnode->dev.release = media_devnode_release;
+	devnode->minor = -1;
 }
 
 int __must_check media_devnode_register(struct media_devnode *devnode,
@@ -251,6 +252,9 @@ int __must_check media_devnode_register(struct media_devnode *devnode,
 	int minor;
 	int ret;
 
+	if (devnode->minor != -1)
+		return -EINVAL;
+
 	/* Part 1: Find a free minor number */
 	mutex_lock(&media_devnode_lock);
 	minor = find_first_zero_bit(media_devnode_nums, MEDIA_NUM_DEVICES);
-- 
2.39.2


