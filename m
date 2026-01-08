Return-Path: <linux-media+bounces-50200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 748D0D01EDC
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 10:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61D9738A13E0
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 08:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC98637FF66;
	Thu,  8 Jan 2026 08:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fU7/Akiv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7459E1DED40
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860252; cv=none; b=MZKd/n/+njEs0v6OXws0A79ElLnPn6j98upXxwz4MEoen9K6OBkxMYs19k4JzuXiXxxqTRnp6GwOkBnvWA9HaOfgCv2/rHCfJ0o6rRNUkwwRkwwmZSXbTRrPUGMQ6uCqqvoAn0ieRMoWe/ObCN1/rc8zeM6jwegG0RLVtV/SbiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860252; c=relaxed/simple;
	bh=hiXOv+a298U6PB4qaWZUNE+2c2NsLnFUImG695+hPJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IOznFTEFTICyEL5pMw9jerBuA6wRnNc8vKRyG4/ZI78T6ysuec8ChHo2/qPXDBQobQktzKC1gTy+Bc6gGK4sAvS2+ayUBikS+ecdZrylCM+LC5xOmmVLwIOvbE/QBYWPYAkLxgmel1vwZ9/tZ8ayGuG0qErIL2bXtcMz2XBl3Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fU7/Akiv; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860241; x=1799396241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hiXOv+a298U6PB4qaWZUNE+2c2NsLnFUImG695+hPJU=;
  b=fU7/AkivnKZCN2IfaCWnXrW5Btm28yVmjUTURYMFQHw0RPgHRoNDHis/
   bm0oywDv8pqC9bl34YnRM+IZGVo9V1KurTrIYnb/txFZEVMvKHenmOwj7
   6kDiS0PkUF9xO3gpAkmTwJCuWNeMnmd6LaeTGHKCCmedIXGxMfHESs8Jz
   PoBCbyGuTaGZcpdiSuYVQ/Mkkkj2u2H466MQjCNeX4V595Mn3UYym15N+
   VFbZ69EXYQX6S99kesYzqe0WA2b38IWxlE7HkSGfrpTTtz1A5rMX/5WiO
   fLrJ1y61Z4NO+hJbR3mNlE/h0yi1pbLJ5WzL73AiCscKrnikMwptpfLwe
   Q==;
X-CSE-ConnectionGUID: ICp3oDbnTd6w6lF5bPYMyg==
X-CSE-MsgGUID: sSe21AfHQoiwutGpc0uFDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72869930"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="72869930"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:06 -0800
X-CSE-ConnectionGUID: uUUFunubSRynuQ8adUjQ0w==
X-CSE-MsgGUID: OMtciwX+RJG1gYawAxVdJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233842972"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.211])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:05 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 71727121E33;
	Thu, 08 Jan 2026 10:17:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vdlCi-00000002HST-0g0i;
	Thu, 08 Jan 2026 10:17:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 06/14] media: ipu6: Don't check pipeline in stream_start
Date: Thu,  8 Jan 2026 10:17:03 +0200
Message-ID: <20260108081712.543704-7-sakari.ailus@linux.intel.com>
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

A pipeline exists when start_streaming has returned so the check for
start_streaming_called is equivalent to having media_pipeline. Use
vb2_start_streaming_called() to perform the check.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index fdf41b3cf60e..dcad6aafee29 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -355,8 +355,6 @@ static void buf_queue(struct vb2_buffer *vb)
 		vb2_buffer_to_ipu6_isys_video_buffer(vvb);
 	struct ipu6_isys_buffer *ib = &ivb->ib;
 	struct device *dev = &av->isys->adev->auxdev.dev;
-	struct media_pipeline *media_pipe =
-		media_entity_pipeline(&av->vdev.entity);
 	struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
 	struct ipu6_isys_stream *stream = av->stream;
 	struct ipu6_isys_buffer_list bl;
@@ -374,8 +372,8 @@ static void buf_queue(struct vb2_buffer *vb)
 	list_add(&ib->head, &aq->incoming);
 	spin_unlock_irqrestore(&aq->lock, flags);
 
-	if (!media_pipe || !vb->vb2_queue->start_streaming_called) {
-		dev_dbg(dev, "media pipeline is not ready for %s\n",
+	if (!vb2_start_streaming_called(vb->vb2_queue)) {
+		dev_dbg(dev, "start_streaming hasn't been called yet on %s\n",
 			av->vdev.name);
 		return;
 	}
-- 
2.47.3


