Return-Path: <linux-media+bounces-29124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6795A77748
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 11:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A54B816862D
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 09:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABC51EBFF8;
	Tue,  1 Apr 2025 09:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/7nLmvk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201C12E3398
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498614; cv=none; b=F/EuJkRbUsElDDMRzmunweEV8F+nAmudMbUpRNmrKgUqoFY9rqr0VlRnTlxsQDINIbFUUbiICY9JNQDdIDvmfm9xfTvlpfwpWJ8yUABH57G+MSQr7CRwK8NF9lPJDjsA8iAbl+zU48YXkowTM9Lwowk3bNmC9DrbDqFA3/WKwds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498614; c=relaxed/simple;
	bh=EQUG8we1aAEk0s581t0crUPC292NpNDuATkzbo3iT8M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IAQdelUTGBpzT4bti5Z/90HGghIxFtbHt9wnRnCsxojYxFfLOe5kAP5IVd0TNYUdlMJ8AfG/t7EPg28tD1JpE9G8xlDcD01+w2vdGGhQb9TcWBjHcpw3BisGvgxfbXOIa2mwXJ27D7biQNcZ9m6jXtgIs9PlNkSvPKVcwmz1rKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/7nLmvk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743498613; x=1775034613;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EQUG8we1aAEk0s581t0crUPC292NpNDuATkzbo3iT8M=;
  b=H/7nLmvkfhcs9irGfNWPyc4GyBzLObt7Yk+xw9e1c7mYP6ZfiygZZZhW
   tK0o2C2iEHYe06rUYk6AspfAnAmX3fURuLoCLKPx8WCOy3gkCDx3+yq3Z
   XOuFgIv2EhkCKWcKgO7Gc+SUuMs9VJBqmlN6JIt9BtkajBXP+c5UB2fcp
   Lr/+fp7hwbky2SKl6jvR6yfpzJijP0XXH+uQ9jup1gXEQol5SbAyr+MDy
   DbsEZb95w7CkpJjBXWhr8YG/dfvN2RfKB49272aGoQFhlOOj9SvJ8WOPU
   vsMyT9GNBPjiZA8GysMvC0uU1D0wsUslFf406ObU12+3K2CFyvLkakjFG
   w==;
X-CSE-ConnectionGUID: jq0eORshRWS4QQuUVRkNPA==
X-CSE-MsgGUID: +tBuX6/yS4SPIe6cAXLu+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="47532616"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="47532616"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 02:10:12 -0700
X-CSE-ConnectionGUID: P/kj8eQyQS6s6Ki5K2AInA==
X-CSE-MsgGUID: DunFwdxJQKakE3wZVP4o1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="126301162"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.112.43])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 02:10:11 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 3/5] media: intel/ipu6: Remove redundant ipu6_isys_subdev_to_csi2 macro
Date: Tue,  1 Apr 2025 11:09:51 +0200
Message-Id: <20250401090953.473339-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401090953.473339-1-stanislaw.gruszka@linux.intel.com>
References: <20250401090953.473339-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

to_ipu6_isys_csi2 and ipu6_isys_subdev_to_csi2 are the same macros
with different name, use the former one consequently.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c  | 4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h  | 3 ---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys.c       | 2 +-
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 531de32419c6..a59231d81f80 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -560,7 +560,7 @@ void ipu6_isys_csi2_sof_event_by_stream(struct ipu6_isys_stream *stream)
 {
 	struct video_device *vdev = stream->asd->sd.devnode;
 	struct device *dev = &stream->isys->adev->auxdev.dev;
-	struct ipu6_isys_csi2 *csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
+	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(stream->asd);
 	struct v4l2_event ev = {
 		.type = V4L2_EVENT_FRAME_SYNC,
 	};
@@ -575,7 +575,7 @@ void ipu6_isys_csi2_sof_event_by_stream(struct ipu6_isys_stream *stream)
 void ipu6_isys_csi2_eof_event_by_stream(struct ipu6_isys_stream *stream)
 {
 	struct device *dev = &stream->isys->adev->auxdev.dev;
-	struct ipu6_isys_csi2 *csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
+	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(stream->asd);
 	u32 frame_sequence = atomic_read(&stream->sequence);
 
 	dev_dbg(dev, "eof_event::csi2-%i sequence: %i\n",
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index ce8eed91065c..24ed13b4a63f 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -57,9 +57,6 @@ struct ipu6_csi2_error {
 	bool is_info_only;
 };
 
-#define ipu6_isys_subdev_to_csi2(__sd) \
-	container_of(__sd, struct ipu6_isys_csi2, asd)
-
 #define to_ipu6_isys_csi2(__asd) container_of(__asd, struct ipu6_isys_csi2, asd)
 
 s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 2d3506d84922..17ae8bb55234 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -729,7 +729,7 @@ int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
 		return -EINVAL;
 
 	stream->stream_source = stream->asd->source;
-	csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
+	csi2 = to_ipu6_isys_csi2(stream->asd);
 	csi2->receiver_errors = 0;
 	stream->source_entity = source_entity;
 
@@ -771,7 +771,7 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 	else
 		av->watermark.hblank = 0;
 
-	csi2 = ipu6_isys_subdev_to_csi2(av->stream->asd);
+	csi2 = to_ipu6_isys_csi2(av->stream->asd);
 	link_freq = ipu6_isys_csi2_get_link_freq(csi2);
 	if (link_freq > 0) {
 		lanes = csi2->nlanes;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 8df1d83a74b5..9b7ff5c440de 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1266,7 +1266,7 @@ static int isys_isr_one(struct ipu6_bus_device *adev)
 	}
 	stream->error = resp->error_info.error;
 
-	csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
+	csi2 = to_ipu6_isys_csi2(stream->asd);
 
 	switch (resp->type) {
 	case IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE:
-- 
2.34.1


