Return-Path: <linux-media+bounces-50197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5415BD01ED3
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 10:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D402D33E3B54
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 08:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBFA363C61;
	Thu,  8 Jan 2026 08:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQ1bW7us"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE5B331A7A
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860243; cv=none; b=AfCA1DWVtUw9VzfZiQosdimH8FDnIwwevIubT8DtE1KB9500LNm+6YQnRkbahhymgaljFy3qrioH/+HFCFP/TnVotRy5pO6iqYg3djZQn8ocAoOBYvflxLci2tKmvT+GCAlNm02R6bjWThn8GgEWKDbpRdi9fenZNx+sfLkpyL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860243; c=relaxed/simple;
	bh=0U+WRwMcIku8TKMGPl19rhckCfREHU4LkFf0GXSAhjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgcFfOGnGWJNfVGMnPJ1wYdVSmP8GN/8lf4Jba/8c1mpe0rYYGzFMTDfSZTXFI0MP4pELHdhAWrCuqqielGH40AhRkTgOmnyUKyhlhDc2JG4xPDNmmaDi+ItJlgtBKpfhCcfZeI/UrX+2e4AvMnkMSIPUsoPDsIZgVRocipI5+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQ1bW7us; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860237; x=1799396237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0U+WRwMcIku8TKMGPl19rhckCfREHU4LkFf0GXSAhjo=;
  b=SQ1bW7usF3k0AyLc2RiV0pOeKDSnrQXINsYYudgGc9Yie/gA2HKpoq3L
   MhQ65UJqY2gluAxpg8TMLcM/Vn31ceu1II6SCljUTh8WVo0E5TBFumx9K
   ZxmGuS+X8XrlIusOxqnB/++YYlgOgT+65JlTfkhL+cj5Vtp0B7U/drVgl
   uVlgLD3cagrpEYAQXT8FQqt+HY5QCBbsvcsbzbuqUQ0ggNPUWsjexCOx0
   Vw0VNAdWyUffam07NYJphKKgT/5I1Xn2kPBllmZYspgV6WDIOxiuktDsm
   IB04RtsbHOP+PGKUWZr40dZtNrwkzBB1W2HJzDtZ2AfEtpZa/IlGqsee7
   A==;
X-CSE-ConnectionGUID: 1qTEXCbtR+aBs4+VVDx8OQ==
X-CSE-MsgGUID: 1qXxZRwwRdyZGH946MfLkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72869920"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="72869920"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:02 -0800
X-CSE-ConnectionGUID: H+8jLUrEQIuBFO9aS3v1Xw==
X-CSE-MsgGUID: 5Mt5IimNTTCcXML0O8dqUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233842950"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.211])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:01 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 63674121D7B;
	Thu, 08 Jan 2026 10:17:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vdlCi-00000002HS7-0IPL;
	Thu, 08 Jan 2026 10:17:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 01/14] media: ipu6: Ensure stream_mutex is acquired when dealing with node list
Date: Thu,  8 Jan 2026 10:16:58 +0200
Message-ID: <20260108081712.543704-2-sakari.ailus@linux.intel.com>
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


