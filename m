Return-Path: <linux-media+bounces-49717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F32E0CE9BE8
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 030023028DAD
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626312135D7;
	Tue, 30 Dec 2025 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfyeAqrr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCC8214813
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 13:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100210; cv=none; b=mTwrFG7h5MRnetSLa6eqW1f1g43COGa1+ZqjRTP/cuStWFXdsicM8v9su6FEySz86VTcK+gq3PoZKH4jIcijFN3poFIqcG03FEK/j6SthtHVHR1oFiIvBUNkSI111uJdHGpOnHvws1eDRwuXM6l+kowzzS5KG9egPsLJ26QgiOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100210; c=relaxed/simple;
	bh=0U+WRwMcIku8TKMGPl19rhckCfREHU4LkFf0GXSAhjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TmpbCbMEDhzlcou+et4J03Y8Lj1Pe7kpxO9dDAoNrNszwELhdPJTOjJKdh0ricTWIY/oD/xNH5mW+Nfr6V4VdYA53IEigCakE7dgji27RDkS+LLVbaw9oc+TTSwul/wXeTZHtAUgOCPlNMhE7tJ+UhvdXUvzkV13eMcaeT1wU4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfyeAqrr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767100208; x=1798636208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0U+WRwMcIku8TKMGPl19rhckCfREHU4LkFf0GXSAhjo=;
  b=XfyeAqrrGVt408d6QYQyvOW4qBLHfTslbXz7HuUhuX3qUQEmEm+gKqQ9
   AYr/ARiHMiL7DibsxvGKKUFN6K26Lg7vST4pZoFCPzUImiUf4cPWjdWmC
   u6SkC21BchHIePzXeEieEf1iTHnPVIZxAIpndEgXQGebOqb1ABpcstcEx
   7ZqSQr8YuU7OwnvzmYsn3kzMMh/iK0jDehrSlAKflyscooVmFC/NXV8pm
   n/Tlv4xMv4PV6C9KofJREe9MfBWR2Jj2iNElvHLBBIiL5BbcBKWs5NBof
   Y+JP1DvfsPEGw1b4jEP3sS3hT/pySHu70SPA0RFe4victishd1PK+QRFP
   w==;
X-CSE-ConnectionGUID: tkPZppfrQ5WI0HJupQNu3w==
X-CSE-MsgGUID: ZRAwz2kxQ6e1e2yk/9Nhcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79808036"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="79808036"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:07 -0800
X-CSE-ConnectionGUID: nouw31KHQPKAbXg9jfgYrQ==
X-CSE-MsgGUID: RA2u3iNXQwmMAyIOQ7NCAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="224710697"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:06 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 94AD4121D87;
	Tue, 30 Dec 2025 15:10:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaZUL-00000000Jbn-13Ss;
	Tue, 30 Dec 2025 15:10:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 01/13] media: ipu6: Ensure stream_mutex is acquired when dealing with node list
Date: Tue, 30 Dec 2025 15:10:01 +0200
Message-ID: <20251230131013.75338-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
References: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ipu6 isys driver maintains the list of video buffer queues related to
a stream (in ipu6 context streams on the same CSI-2 virtual channel) and
this list is modified through VIDIOC_STREAMON and VIDIOC_STREAMOFF IOCTLs.
Ensure the common mutex is acquired when accessing the linked list, i.e.
the isys device context's stream_mutex.

Add a lockdep assert to ipu6_isys_get_buffer_list() and switch to guard()
while at it as the error handling becomes more simple this way.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index aa2cf7287477..8f05987cdb4e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2013--2024 Intel Corporation
  */
 #include <linux/atomic.h>
+#include <linux/cleanup.h>
 #include <linux/bug.h>
 #include <linux/device.h>
 #include <linux/list.h>
@@ -201,6 +202,8 @@ static int buffer_list_get(struct ipu6_isys_stream *stream,
 	unsigned long flags;
 	unsigned long buf_flag = IPU6_ISYS_BUFFER_LIST_FL_INCOMING;
 
+	lockdep_assert_held(&stream->mutex);
+
 	bl->nbufs = 0;
 	INIT_LIST_HEAD(&bl->head);
 
@@ -294,9 +297,8 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 	struct ipu6_isys_buffer_list __bl;
 	int ret;
 
-	mutex_lock(&stream->isys->stream_mutex);
+	guard(mutex)(&stream->isys->stream_mutex);
 	ret = ipu6_isys_video_set_streaming(av, 1, bl);
-	mutex_unlock(&stream->isys->stream_mutex);
 	if (ret)
 		goto out_requeue;
 
@@ -637,10 +639,10 @@ static void stop_streaming(struct vb2_queue *q)
 	mutex_lock(&av->isys->stream_mutex);
 	if (stream->nr_streaming == stream->nr_queues && stream->streaming)
 		ipu6_isys_video_set_streaming(av, 0, NULL);
+	list_del(&aq->node);
 	mutex_unlock(&av->isys->stream_mutex);
 
 	stream->nr_streaming--;
-	list_del(&aq->node);
 	stream->streaming = 0;
 	mutex_unlock(&stream->mutex);
 
-- 
2.47.3


