Return-Path: <linux-media+bounces-12848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8C5901EE6
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E82E2814D2
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0A37F490;
	Mon, 10 Jun 2024 10:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2juFo+2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216AD7E774
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 10:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013962; cv=none; b=Ehd3YBOPx5OeMygaKi9tBioCvG15BzFmeR/TMeYOyIhxGghldSzDIF6bqOIVhm2692dPS2gyCyxTCViFbNponGV+axzPDajkU6vDvJmaQElBSGUTI8GASf8hYCgRHwB3D+XCAkmg3VhHFxDAc9rk4BYrxvKwc85BFjCpTgRoVBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013962; c=relaxed/simple;
	bh=+uYo2hB21oCmEHo4xRJ1wv8HQlafO89o/9xrnoBflC4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n+T52ZdaXy6Hmg5qK2eE2yohdAaPN7CIbtN7FSZl8l0NTu0j5apr9eJiNc9Z7CZ58DEYetSYPjGe/+gRJQIXJHt7KZ2vsUj1exBoV1pKJh8TGfdSeEKIRpUf3rgKFQnmIajge01IsfQs02VAIjzg4ZUyNSd/6DtnIzXaXU1tzng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h2juFo+2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013961; x=1749549961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+uYo2hB21oCmEHo4xRJ1wv8HQlafO89o/9xrnoBflC4=;
  b=h2juFo+2u2fWuI5mKmFdHU+ynLf3AhJ/kfe6WSlvUzHOV6yRPKpuaUZd
   Kl04IPkoOCAI5mA2l55favBVwu8Gi79q6euw0C4YIBkyyOZOGC0+jJp+A
   AvAGSGdfk7GDkoxatApyapdnY/Q3BBvGNfmH1CyLHqkxYx8i1LY+BBA4J
   G6ZxliSX5nfHORc9aZr0l4vu1KgTNoF9o06JCiZZACDku+RtQT4kQJcNI
   OvtHn7ZzKTHsgT9KJDyuYmpxbhvHFZHV383/mZkzazxOgxUn9/rvZLwx6
   Lanh/s5jtRVwN3esgPZI+FQjqR2ynvgunhiKG6z97XZYMlLDcfIP3Bo7i
   A==;
X-CSE-ConnectionGUID: +n3co96VSQmm0PPVB2W9iw==
X-CSE-MsgGUID: 4vGiAuLvTHuRZSRKnE0ysA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14819965"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14819965"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:53 -0700
X-CSE-ConnectionGUID: Gh/MyHb2RJqUWDRjds3d6Q==
X-CSE-MsgGUID: 2lv6jT2lQiyCR+7qdb8pXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39137369"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:05:50 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 634A2120D1D;
	Mon, 10 Jun 2024 13:05:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sGbuH-004eEK-1G;
	Mon, 10 Jun 2024 13:05:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Subject: [PATCH v4 25/26] media: mc: Enforce one-time registration
Date: Mon, 10 Jun 2024 13:05:29 +0300
Message-Id: <20240610100530.1107771-26-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
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
index 8cb4e0eec17f..758971f310c3 100644
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


