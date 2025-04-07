Return-Path: <linux-media+bounces-29517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BB2A7DFAA
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1B147A2FE6
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 13:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79B51940A2;
	Mon,  7 Apr 2025 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qn3S6RPw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAEA18C907
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 13:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033271; cv=none; b=E5RzWrFcKNrQiNDuzMMqH9jh3IoydQZUbGIXXwIIg6UtYgsh0uPapNhdtotwx/AClAJGRi4dV0ScJq0ayF+O+boDziaYa7YzxYLKnw2thdykqLnJ+wCt8a6Vt/hBz+6rnn32/TAAEppq81jpYY4+iUfTU+3OEYNAwJXFD+WwoWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033271; c=relaxed/simple;
	bh=0ERl17NnTMtaiFWtOw1jQJqKEUa0npzn+Kst9H4n5Ck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GOeu8OpNmo+hZPDLcPrNRsIqFdwYF9WgM+RRDb63J2NDA/rc1BCwR0OFl1dudFyUztL+YoPfbM5KZHWOFvUHOUvs8yBczHnEWAChQYWtQT2GvXV0QsC1R6r9YJJcYbFFAafZ7MvVU8YVzoYDnt0TA98wCTF3zYNZYE8PyjfxNT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qn3S6RPw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033269; x=1775569269;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0ERl17NnTMtaiFWtOw1jQJqKEUa0npzn+Kst9H4n5Ck=;
  b=Qn3S6RPwExhVp79mnUCcU7BUBcSCuMZfpYQhvri18p1+WAglzJw7BVGl
   omRaXpxn+i6o/JRqnzJqfV4QD/ITpESKLg0JJKJ6F6SKIUQECb9ZRvV5b
   1rt8wMHBHPXOvKp66rnTiSlsTSwLI9e7XNNdmOHo8KK1cE2j7lmr+r6pk
   zo+7uqU/YE8irVOO1h2k7WjzYBLHQhncYyXKH0+RCa2zO/RyMaVWP+AlZ
   mjdMnbo/0lqy3fLXscRRKiTr80VC5lrtkJqkifxv52I3j9dtafpQI/344
   Aawj2vjgAbKiKIvefh7e66uZvxAo/I6jDDmyJx/2rQ06FIntylvv41h0W
   Q==;
X-CSE-ConnectionGUID: KNM7+IWpTuuNjVMwYLhbfw==
X-CSE-MsgGUID: iOyYpNsoSaiKYew16Txqjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45322448"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45322448"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:41:09 -0700
X-CSE-ConnectionGUID: ewGJct9QTt+hjSN4iXsdBA==
X-CSE-MsgGUID: 3MTGneblR3O4ZSLw29LbKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127713291"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.80.153])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:41:08 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 6/7] media: intel/ipu6: Introduce isys and dev accessors macros
Date: Mon,  7 Apr 2025 15:40:36 +0200
Message-Id: <20250407134037.808367-7-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
References: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add macro and inline function to get access ipu6_isys and device back
pointer. Using the helpers will allow to transformation to common
structures.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
Note: this gives checkpatch error about space around ":" , but 
the same error is already in include/media/v4l2-common.h and
include/media/v4l2-subdev.h , so ignore it.

 drivers/media/pci/intel/ipu6/ipu6-isys.h | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index bf6008bfe539..c753656b04f4 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -16,6 +16,7 @@
 #include <media/v4l2-device.h>
 
 #include "ipu6.h"
+#include "ipu6-bus.h"
 #include "ipu6-fw-isys.h"
 #include "ipu6-isys-csi2.h"
 #include "ipu6-isys-video.h"
@@ -165,6 +166,32 @@ struct ipu6_isys {
 	struct isys_iwake_watermark iwake_watermark;
 };
 
+static inline struct ipu6_isys *stream_to_isys6(struct isys_stream *stream)
+{
+	return stream->isys;
+}
+
+static inline struct ipu6_isys *video_to_isys6(struct ipu6_isys_video *video)
+{
+	return video->isys;
+}
+
+static inline struct ipu6_isys *csi2_to_isys6(struct ipu6_isys_csi2 *csi2)
+{
+	return csi2->isys;
+}
+
+#define to_isys(p)                                      \
+	_Generic(p,                                     \
+		struct isys_stream *: stream_to_isys6,  \
+		struct ipu6_isys_csi2 *: csi2_to_isys6, \
+		struct ipu6_isys_video *: video_to_isys6)(p)
+
+static inline struct device *isys_to_dev(struct ipu6_isys *isys)
+{
+	return &isys->adev->auxdev.dev;
+}
+
 struct isys_fw_msgs {
 	union {
 		u64 dummy;
-- 
2.34.1


