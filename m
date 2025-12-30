Return-Path: <linux-media+bounces-49724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A87FCE9BFD
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0DF33036CB3
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999E92135AD;
	Tue, 30 Dec 2025 13:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F35vR9Vt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4173221B9D2
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100216; cv=none; b=hnwtsDbSOwCCIu/I8nPVO2b3xN5i0JkRkskyzSoIg7GwIEWWxTCvcklmkIhLRzy60gsiaUPzArQizIjIQEZU0DLZ2ewOvfY7+gFstVvu6eSDaWgKumWLGxvEeUGzG0p/kV9B8x3Y3JiOsdrIfRwXNy+4Hh34dBcj43Io3Of2avY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100216; c=relaxed/simple;
	bh=hiXOv+a298U6PB4qaWZUNE+2c2NsLnFUImG695+hPJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AIlknYSneeMnP6fvzVNLm5K/++pZJnHTWNiTQFn0II4m/DFPhurNvaf2uPExwb31n45JAZZcrr+qPZF9vPKK9yaSnMRXp5HDPajCZ9PHkOOZ0s9IykCQc3YiDdeBUBZorxgUQY5ZRJUQP4m5xYEePlNoYpFIDvpTDTUYdo2jAi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F35vR9Vt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767100215; x=1798636215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hiXOv+a298U6PB4qaWZUNE+2c2NsLnFUImG695+hPJU=;
  b=F35vR9Vt0LJA/r1ntZ2tJCblAaF3d/LubwfWJGBdKdWA0C0NWMfW4dY1
   in7uRRwdoj2m1bP8Syv89X9tTJWo8Tji42n3BccfhPPylR8qUoW8+RilN
   2pXc2IxaFfRLiuuuOmlBk8yvSkwiDgui/ILv1txJXzJSxUu+ILkvtTdf6
   Hr2Y+5aANCVbKE8yDY13BEqcOca7Tl6BjhZtWW4jxLS5e63zltV0GKSrP
   m4kGgp5JslH8DTiYsDEpM0qIKb2lhuympqHWg/TgVRZZ5bN5Kw4/U7Pjj
   pOABzySIR6Yo1JMQZMzEyev/F332U7EZ9P4Cu8OiKxeAx1VrZ2dBvUOrH
   A==;
X-CSE-ConnectionGUID: J6jiRpGNSsa7oL3iXOZu1Q==
X-CSE-MsgGUID: USdmbcNMQEaP6l9ScH9SGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="72309255"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="72309255"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:12 -0800
X-CSE-ConnectionGUID: XH80nnKDT72FTB25frwXPQ==
X-CSE-MsgGUID: +GxPMlRnQ1Gcf7sXsnA7mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="231882143"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:10 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9A9B7121DE5;
	Tue, 30 Dec 2025 15:10:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaZUL-00000000Jc7-1Mjx;
	Tue, 30 Dec 2025 15:10:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 06/13] media: ipu6: Don't check pipeline in stream_start
Date: Tue, 30 Dec 2025 15:10:06 +0200
Message-ID: <20251230131013.75338-7-sakari.ailus@linux.intel.com>
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


