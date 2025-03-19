Return-Path: <linux-media+bounces-28483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B982AA68C78
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 13:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B3B017E5F1
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 12:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC08E255255;
	Wed, 19 Mar 2025 12:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0htUgPk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF62A255E3C
	for <linux-media@vger.kernel.org>; Wed, 19 Mar 2025 12:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742386266; cv=none; b=n/FZKi30/kG6oUpSqazQH6/dWb0ILIP4okEAnBZ514xfoRnve6CSfmWSRulp73+ayVMwMsxcFqZcETkMsPYgduk6H+WAQN8vYV1/KSpmXy7QRXnq6gGhNoo8gYNUDyMm9Koqwg6sbW15D6YUKaQAXXLRosuAqr0rAN5233ZDGTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742386266; c=relaxed/simple;
	bh=fUZM8Qx+E9sFwFA8sRDU+MoPUK99weHi3tgGUE2s1Ig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a0HGn3l8ljgdVscxDpIqU8gQtI/PTaMrh7172YIk4DxxhYvJ9ksRfhQnR/Hal972r5ZKbsiJ5wqFggt9jgD9G1h4UiyFv325N5CUTIvy60WjglWV23fVzUDtX6LLcvUYnYJw8/twhHnuV2LqAGO+QkQRp1r+tQc+VW3qUPEeLDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0htUgPk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742386265; x=1773922265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fUZM8Qx+E9sFwFA8sRDU+MoPUK99weHi3tgGUE2s1Ig=;
  b=K0htUgPkHTOX7eqQ1ty2KNFksht5PldF/q6T/lruabrS9SJNMYnuRj92
   6bd/9XTw95ehEg6uxNdPx2LKVruxceQTjSqc/jerNsmMD4FuSs4CLfCRq
   ea48+m9GRa6algWKz4oiIabKWkB+S/vxIDqQjP2RYtQ2gUyVrpHBKu1A7
   WhCTNlNxI+4e6t42MVG4tCn/+2mc4c1uW/ktSFbqEtcA14frw1to3YUfT
   wgJjMJaOsHkaG/lj7KJhvVz/rZ3EuQqdkVLU3BCg83sDwvUzhU4FudW4N
   IHM75SoTgZo6KvYAVyEcAsFPSRPcpaF10QoVAdyBWf7yOA2pYuXTvk1a+
   w==;
X-CSE-ConnectionGUID: ES1KMtRUQj+fPhNdqmkfHQ==
X-CSE-MsgGUID: uSqSYC94TQK3TkJe8RRJ9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="61100276"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="61100276"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 05:11:04 -0700
X-CSE-ConnectionGUID: EAZ2sDyPRNS7KdGCfbnGNw==
X-CSE-MsgGUID: ZUxqcLyHTta/Ae5ulYRcDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="122598967"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.81.118])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 05:11:03 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 4/5] media: intel/ipu6: Abstract buf ready function
Date: Wed, 19 Mar 2025 13:10:43 +0100
Message-Id: <20250319121044.113705-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250319121044.113705-1-stanislaw.gruszka@linux.intel.com>
References: <20250319121044.113705-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extract values needed by ipu6_queue_buf_ready() function from fw abi
structure. This will allow to reuse same buf ready code when fw abi
change.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 22 +++++++++++++------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index c68dc577daf0..55d45d2d8768 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -734,10 +734,11 @@ static void ipu6_isys_queue_buf_done(struct ipu6_isys_buffer *ib)
 	}
 }
 
-void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
-			       struct ipu6_fw_isys_resp_info_abi *info)
+static void
+ipu6_stream_buf_ready(struct ipu6_isys_stream *stream, u8 pin_id, u32 pin_addr,
+		      u64 time, bool error_check)
 {
-	struct ipu6_isys_queue *aq = stream->output_pins[info->pin_id].aq;
+	struct ipu6_isys_queue *aq = stream->output_pins[pin_id].aq;
 	struct ipu6_isys *isys = stream->isys;
 	struct device *dev = &isys->adev->auxdev.dev;
 	struct ipu6_isys_buffer *ib;
@@ -745,7 +746,6 @@ void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
 	unsigned long flags;
 	bool first = true;
 	struct vb2_v4l2_buffer *buf;
-	u64 time = (u64)info->timestamp[1] << 32 | info->timestamp[0];
 
 	spin_lock_irqsave(&aq->lock, flags);
 	if (list_empty(&aq->active)) {
@@ -764,7 +764,7 @@ void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
 		ivb = vb2_buffer_to_ipu6_isys_video_buffer(vvb);
 		addr = ivb->dma_addr;
 
-		if (info->pin.addr != addr) {
+		if (pin_addr != addr) {
 			if (first)
 				dev_err(dev, "Unexpected buffer address %pad\n",
 					&addr);
@@ -772,8 +772,7 @@ void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
 			continue;
 		}
 
-		if (info->error_info.error ==
-		    IPU6_FW_ISYS_ERROR_HW_REPORTED_STR2MMIO) {
+		if (error_check) {
 			/*
 			 * Check for error message:
 			 * 'IPU6_FW_ISYS_ERROR_HW_REPORTED_STR2MMIO'
@@ -800,6 +799,15 @@ void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
 	spin_unlock_irqrestore(&aq->lock, flags);
 }
 
+void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
+			       struct ipu6_fw_isys_resp_info_abi *info)
+{
+	u64 time = (u64)info->timestamp[1] << 32 | info->timestamp[0];
+	bool err = info->error_info.error == IPU6_FW_ISYS_ERROR_HW_REPORTED_STR2MMIO;
+
+	ipu6_stream_buf_ready(stream, info->pin_id, info->pin.addr, time, err);
+}
+
 static const struct vb2_ops ipu6_isys_queue_ops = {
 	.queue_setup = ipu6_isys_queue_setup,
 	.buf_init = ipu6_isys_buf_init,
-- 
2.34.1


