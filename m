Return-Path: <linux-media+bounces-28130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86102A5F0D5
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 11:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89C583B46CF
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 10:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64522661BB;
	Thu, 13 Mar 2025 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXY2x3Jz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7897265606
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 10:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861494; cv=none; b=kMAAuJr9IjcyWR9Pq22jpOVMjlXD4rmQsfRdPzfnpw5IisjLji8QPSxnXgjJa2uf9sMQwhshaOP3kuB9Gua4ETHWwgau4ic9oFrphOmM0ToYeLeX1odxingHJfuuPmer52NUz7/U+gUma/jOuGWNhvAa/FnafiKPUUJj9KtkalU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861494; c=relaxed/simple;
	bh=/7vN4d6GutSLJJq/39M4xTD9gQjtz1Htfe/q2+Lkf/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eqWS+P0blMX80k6KEeyAfbHkSLfbb+HG8FqjfjKlf4p+HNt8AfmVoAchfQA3SoloecgCGHwLpIlub+qqTHHJGtSoKgsY9pN0vFRNCBZc7LvQgyTREBx2EmQvpMkL7BmgRcSpA0LXrdrnuaLp/dUz6TbWQ7Kk08B9RSOB1K8uZVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXY2x3Jz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741861493; x=1773397493;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/7vN4d6GutSLJJq/39M4xTD9gQjtz1Htfe/q2+Lkf/w=;
  b=eXY2x3JzhsctAhPWlHus7UM2tgq6lLdWfyXzsfhDi9WiKk3JrdTSnFua
   vYTmgJcCPFtXTU5zBvxbWnAvoip3OWnrKSJE/wayUh1IfWrOTwrlWciwA
   WSTj/uSBYnGPrsGtYiS6N6pRumuYAi3q0G+6L6kdbA4DaZAaEwk6QYKnT
   UecAYAXucCGgzcx7fCVCiEdnhZgwkORfijgE0KV2YVYvIeaXg1qHETipF
   adIjjGxje27Q3Wq9HYws0tKFu1ldPERgc5sxQR03GVNjW+o39tDe9xwFU
   anNrRsHqghgzmnAMu3y1tvEO3Wz4F5m4O6BQfGEXlD1awwUzfyJBQB+RW
   A==;
X-CSE-ConnectionGUID: FV0V53WjQLu6NCrrwUNYzQ==
X-CSE-MsgGUID: 2nR3UAHgR6amyKKqST8s5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43102680"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="43102680"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:24:52 -0700
X-CSE-ConnectionGUID: L+QoqlcDTL+cd0FaLAiN4A==
X-CSE-MsgGUID: Rq8dMcsaTSm3XYUPQT2G/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="121413926"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.81.114])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:24:50 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 4/5] media: intel/ipu6: Abstart buf ready function
Date: Thu, 13 Mar 2025 11:24:26 +0100
Message-Id: <20250313102427.131832-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313102427.131832-1-stanislaw.gruszka@linux.intel.com>
References: <20250313102427.131832-1-stanislaw.gruszka@linux.intel.com>
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
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 28 ++++++++++++-------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index c68dc577daf0..c7f302df2dcc 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -734,10 +734,11 @@ static void ipu6_isys_queue_buf_done(struct ipu6_isys_buffer *ib)
 	}
 }
 
-void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
-			       struct ipu6_fw_isys_resp_info_abi *info)
+static void
+ipu6_stream_buf_ready(struct ipu6_isys_stream *stream, u8 pin_id, u32 addr,
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
@@ -757,23 +757,22 @@ void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
 	list_for_each_entry_reverse(ib, &aq->active, head) {
 		struct ipu6_isys_video_buffer *ivb;
 		struct vb2_v4l2_buffer *vvb;
-		dma_addr_t addr;
+		dma_addr_t dma_addr;
 
 		vb = ipu6_isys_buffer_to_vb2_buffer(ib);
 		vvb = to_vb2_v4l2_buffer(vb);
 		ivb = vb2_buffer_to_ipu6_isys_video_buffer(vvb);
-		addr = ivb->dma_addr;
+		dma_addr = ivb->dma_addr;
 
-		if (info->pin.addr != addr) {
+		if (addr != dma_addr) {
 			if (first)
 				dev_err(dev, "Unexpected buffer address %pad\n",
-					&addr);
+					&dma_addr);
 			first = false;
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
+	bool err = (info->error_info.error == IPU6_FW_ISYS_ERROR_HW_REPORTED_STR2MMIO);
+
+	ipu6_stream_buf_ready(stream, info->pin_id, info->pin.addr, time, err);
+}
+
 static const struct vb2_ops ipu6_isys_queue_ops = {
 	.queue_setup = ipu6_isys_queue_setup,
 	.buf_init = ipu6_isys_buf_init,
-- 
2.34.1


