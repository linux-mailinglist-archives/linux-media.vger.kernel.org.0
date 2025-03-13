Return-Path: <linux-media+bounces-28129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19814A5F0BD
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 11:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D1531764E6
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 10:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49EA6265CDA;
	Thu, 13 Mar 2025 10:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dzejEluA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7071D54FE
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 10:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861490; cv=none; b=aXIi8mYDbBcxKPam5cI+2s/ubQ7EAyTWGK7es5QKvTARk2vF98wU2jwqoKXXIu9zg9fb34SdsxPkUhtkau4rSZgWadnFKD065ANOzQvJB9IJ80PZ2aAH6e5g9EtKkYI3f4dezz0cgw9vX3lxDy1W9dcUKBUldiazvzun6+GV/hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861490; c=relaxed/simple;
	bh=RZ5b/AXSyS1/UHSTuZZXOdXuinogRB+HyfTLhilwR/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vg/z/fkkB7sCUzdk7ATDvki33GfUeW4U8GYsHGhPP2wlDOL5po+EgqKQF90lO9Fhoa/tAk6VOS48aC3CCdFC7oOS6Y6vMmlehjS2aRevkYK0f4DrIYxOWl/WvDWM8W8nH6HT1oX5FX3xvD5sRQmEev1YnqtSBTghN5LAvaMjX5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dzejEluA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741861489; x=1773397489;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RZ5b/AXSyS1/UHSTuZZXOdXuinogRB+HyfTLhilwR/I=;
  b=dzejEluAIh0MHA8nKEJxq7OOEk5Ts7HnXjbNBEk545nM04ORu9RFGUrM
   C4C+rgkx+HxaSeFi1GaSRactfxb7fHgH3aZDrYNuXDKE8v6RxKgDMnUDw
   uMcpdYuLuuIhOT6k7zywuMqOwAZWzZhFGPkBZX6Vff2h/hDxcDd9+aWDh
   smMTPZy4rweseaPGaRvCLWg2UE5Tm8Yb3hMVrSPZeh36oDk7t+4EoDz5C
   hHxP/jnrRdX8MQTYQ303IcsqJx1bOZuK1gNZNq/jCYzgTQbD/kBbK1dHP
   Za99KJzPtT8QorezmOs0bD4wVqllVWyjvxDYB/f7IHphytYlirizxr8yO
   w==;
X-CSE-ConnectionGUID: aVnJ11oiRNasR14J8HdXxA==
X-CSE-MsgGUID: relKzZrcRK+EeJ81E2W/ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="68325139"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="68325139"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:24:49 -0700
X-CSE-ConnectionGUID: fkbFB1z3RZ6iBSE2Arthgw==
X-CSE-MsgGUID: /eGLal16Tqe79H1mY7eOiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="126099985"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.81.114])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:24:47 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 3/5] media: intel/ipu6: Use timestamp value directly
Date: Thu, 13 Mar 2025 11:24:25 +0100
Message-Id: <20250313102427.131832-4-stanislaw.gruszka@linux.intel.com>
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


