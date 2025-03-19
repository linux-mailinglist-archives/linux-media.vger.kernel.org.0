Return-Path: <linux-media+bounces-28482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C232A68C73
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 13:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 690327A8247
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 12:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5804B2561AB;
	Wed, 19 Mar 2025 12:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWAoW+gA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3473B255241
	for <linux-media@vger.kernel.org>; Wed, 19 Mar 2025 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742386261; cv=none; b=RmsK3A28s/ZgQ72uqBxoMogDVon1vCrXvg9/LnwTGomku5M3DU+ZmVV5+bMRFPLl1StiyCFr3ORxEVT2yw77gWCxaGqDXL05zbefMo1ZhNMk3c3XCo83ne9d9K7Rz5jo42oYm1taN2BQo0kwC6d/k5uCzlL3meVTpNct3gdkLyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742386261; c=relaxed/simple;
	bh=RZ5b/AXSyS1/UHSTuZZXOdXuinogRB+HyfTLhilwR/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bSjLl+Wo0F/jLLAlXbxD9+vdjOXSKfz1ha1Nr5LBDe+sRALe2unJZe9PqaFvXmgnCeLBPgtRUp+5Qt6JH1/NzWxmjqf2rj6jLeQqrfSaEHV8y6+lkxdKrsNrH1yPqpaovDKKizSQVXvKC5XyXXPRnrteFQwseIldOJC+lNwChDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWAoW+gA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742386260; x=1773922260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RZ5b/AXSyS1/UHSTuZZXOdXuinogRB+HyfTLhilwR/I=;
  b=QWAoW+gAemT8jwfRUa48Peuht+jgt4hVGnOk6y9EM3P7czth2JGws7aw
   dR0ijNM0hlbHevyj31m4M0szDGUBXE4k6lI4Y5kQTY9tEPQccbZmfW29Y
   og/b+GmvI/CepRNUHLlqGqHG7HKE4lGgRo6OiOtL9DMx4GaM7sLBbrXPE
   wm9aLVlYiE15Y3sL5tzhRFuwlOpfUm+kM3wonWhgazs6bVfSPXk6mAR3v
   3u9Ra86WhxZua/BMmQys2dHt8fXkF+9plhuZmo4JVdeimiCs6pUGgihNk
   sCJURl09GGzK2tiHBpSbFjRky2x3sBjVNhyzYzd7urapbDK7Bu7oNChlX
   g==;
X-CSE-ConnectionGUID: mXzllPk7SgKIf/cy5VCUzg==
X-CSE-MsgGUID: 9ASEogG4R5yjpB9lQI85gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="53785890"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="53785890"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 05:11:00 -0700
X-CSE-ConnectionGUID: PnwOnI64RWeYDswSNxdVug==
X-CSE-MsgGUID: zau1CFO9TEyRR5YVLic+Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="123086726"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.81.118])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 05:10:59 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 3/5] media: intel/ipu6: Use timestamp value directly
Date: Wed, 19 Mar 2025 13:10:42 +0100
Message-Id: <20250319121044.113705-4-stanislaw.gruszka@linux.intel.com>
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

Remove pointer for fw abi structure when setting frame sequence and
time, use timestamp value from the structure directly.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 3984b9d43919..c68dc577daf0 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -652,10 +652,8 @@ static void stop_streaming(struct vb2_queue *q)
 }
 
 static unsigned int
-get_sof_sequence_by_timestamp(struct ipu6_isys_stream *stream,
-			      struct ipu6_fw_isys_resp_info_abi *info)
+get_sof_sequence_by_timestamp(struct ipu6_isys_stream *stream, u64 time)
 {
-	u64 time = (u64)info->timestamp[1] << 32 | info->timestamp[0];
 	struct ipu6_isys *isys = stream->isys;
 	struct device *dev = &isys->adev->auxdev.dev;
 	unsigned int i;
@@ -681,8 +679,7 @@ get_sof_sequence_by_timestamp(struct ipu6_isys_stream *stream,
 	return 0;
 }
 
-static u64 get_sof_ns_delta(struct ipu6_isys_video *av,
-			    struct ipu6_fw_isys_resp_info_abi *info)
+static u64 get_sof_ns_delta(struct ipu6_isys_video *av, u64 timestamp)
 {
 	struct ipu6_bus_device *adev = av->isys->adev;
 	struct ipu6_device *isp = adev->isp;
@@ -692,14 +689,13 @@ static u64 get_sof_ns_delta(struct ipu6_isys_video *av,
 	if (!tsc_now)
 		return 0;
 
-	delta = tsc_now - ((u64)info->timestamp[1] << 32 | info->timestamp[0]);
+	delta = tsc_now - timestamp;
 
 	return ipu6_buttress_tsc_ticks_to_ns(delta, isp);
 }
 
 static void
-ipu6_isys_buf_calc_sequence_time(struct ipu6_isys_buffer *ib,
-				 struct ipu6_fw_isys_resp_info_abi *info)
+ipu6_isys_buf_calc_sequence_time(struct ipu6_isys_buffer *ib, u64 time)
 {
 	struct vb2_buffer *vb = ipu6_isys_buffer_to_vb2_buffer(ib);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -710,8 +706,8 @@ ipu6_isys_buf_calc_sequence_time(struct ipu6_isys_buffer *ib,
 	u64 ns;
 	u32 sequence;
 
-	ns = ktime_get_ns() - get_sof_ns_delta(av, info);
-	sequence = get_sof_sequence_by_timestamp(stream, info);
+	ns = ktime_get_ns() - get_sof_ns_delta(av, time);
+	sequence = get_sof_sequence_by_timestamp(stream, time);
 
 	vbuf->vb2_buf.timestamp = ns;
 	vbuf->sequence = sequence;
@@ -749,6 +745,7 @@ void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
 	unsigned long flags;
 	bool first = true;
 	struct vb2_v4l2_buffer *buf;
+	u64 time = (u64)info->timestamp[1] << 32 | info->timestamp[0];
 
 	spin_lock_irqsave(&aq->lock, flags);
 	if (list_empty(&aq->active)) {
@@ -791,7 +788,7 @@ void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
 		list_del(&ib->head);
 		spin_unlock_irqrestore(&aq->lock, flags);
 
-		ipu6_isys_buf_calc_sequence_time(ib, info);
+		ipu6_isys_buf_calc_sequence_time(ib, time);
 
 		ipu6_isys_queue_buf_done(ib);
 
-- 
2.34.1


