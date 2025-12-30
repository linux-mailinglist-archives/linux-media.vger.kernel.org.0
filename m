Return-Path: <linux-media+bounces-49727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16304CE9BE5
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F0D5301DE11
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF508212FB3;
	Tue, 30 Dec 2025 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCnQZxte"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C002986331
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100219; cv=none; b=P4Cwa1y/6mKIAH7aOmDQyOP+P6/9prhgJMh0dYUYozChVb55TWksGeyd/pf1SD/sMqyABG3dUeI6v6uTcAAqfBWapo/jynFIT73hSqgeZyVKubsIebeFuD+n5cbP49ghV0PrevxNpQNcaa9cNu4cjvprbCkIVXVj4EqLljtH+2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100219; c=relaxed/simple;
	bh=i6OUsUFi94IuGe68nYjWGdTrnfuI3/W6fMUDJUZyA4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CiqY6Ruu2tsBfXNJTzpWiU2KHbkJclbuV2j3AZov5heAU5RluG1lUjxbSfH0gskA0Rv/TaY2aEyaN3pPc6x7lVST/6lRg9p4BugFVPdNFHNYoPLGjyw4jTtEqAQLyOprnhBIZ47TYUFEVjbEWbM7Q2WyLw74B/YWLUn/kPoNFIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCnQZxte; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767100217; x=1798636217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i6OUsUFi94IuGe68nYjWGdTrnfuI3/W6fMUDJUZyA4k=;
  b=KCnQZxter+UR3nT9ZqhGxRT7UfX/4xJTPHoioaegUWmEhBvtYA5uu2tb
   qRZJd8hZwFr44gHbRQbvPbPYjjr+trGsj09pVv2ZjCrcHu9IyW9DBz2wu
   Hf0O+ywTy0wfTd9xvT2kHAavyIEGz4t/rcig4KN4OWOuAUoy03no2vkxI
   it5bUlV/dgcCCN6x0xgjnmhoVhyQ7SvTHNmvD2kFyrJeLkKLWlMPM8iC/
   Td/Y2hdGzCNDm6ZRTpMS5raSQo13m4MaPm/IXp2sRlMbGz68TRUhBg/9u
   Oz+Swct3FbLQBQki74WKrwtQJGUM/g7eI7o8HbVnDGy/843X1Y0mV42gr
   w==;
X-CSE-ConnectionGUID: 2yjLAs0XTFepBeer5n9hBg==
X-CSE-MsgGUID: t+OKsE3KS0W9MG1ibYjzTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="72309260"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="72309260"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:12 -0800
X-CSE-ConnectionGUID: zWycdR3URI2BLil7T+w7oA==
X-CSE-MsgGUID: ycvoXZdWSIibA4RJg7fHyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="231882154"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:10 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A00EB121E47;
	Tue, 30 Dec 2025 15:10:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaZUL-00000000JcF-1Tob;
	Tue, 30 Dec 2025 15:10:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 08/13] media: ipu6: Drop error argument from ipu6_isys_stream_start()
Date: Tue, 30 Dec 2025 15:10:08 +0200
Message-ID: <20251230131013.75338-9-sakari.ailus@linux.intel.com>
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

error argument for ipu6_isys_stream_start() is always false, remove the
argument. The IPU6_ISYS_BUFFER_LIST_FL_SET_STATE buffer flag also becomes
redundant as a result, remove it as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 12 +++---------
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h |  1 -
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index dcad6aafee29..0e9f0025aeb3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -132,9 +132,6 @@ void ipu6_isys_buffer_list_queue(struct ipu6_isys_buffer_list *bl,
 			list_add_tail(&ib->head, &aq->incoming);
 		spin_unlock_irqrestore(&aq->lock, flags);
 
-		if (op_flags & IPU6_ISYS_BUFFER_LIST_FL_SET_STATE)
-			vb2_buffer_done(vb, state);
-
 		if (first) {
 			dev_dbg(dev,
 				"queue buf list %p flags %lx, s %d, %d bufs\n",
@@ -290,7 +287,7 @@ ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
 
 /* Start streaming for real. The buffer list must be available. */
 static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
-				  struct ipu6_isys_buffer_list *bl, bool error)
+				  struct ipu6_isys_buffer_list *bl)
 {
 	struct ipu6_isys_stream *stream = av->stream;
 	struct device *dev = &stream->isys->adev->auxdev.dev;
@@ -336,10 +333,7 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 out_requeue:
 	if (bl && bl->nbufs)
 		ipu6_isys_buffer_list_queue(bl,
-					    IPU6_ISYS_BUFFER_LIST_FL_INCOMING |
-					    (error ?
-					    IPU6_ISYS_BUFFER_LIST_FL_SET_STATE :
-					     0), error ? VB2_BUF_STATE_ERROR :
+					    IPU6_ISYS_BUFFER_LIST_FL_INCOMING,
 					    VB2_BUF_STATE_QUEUED);
 	flush_firmware_streamon_fail(stream);
 
@@ -590,7 +584,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 		goto out;
 	}
 
-	ret = ipu6_isys_stream_start(av, bl, false);
+	ret = ipu6_isys_stream_start(av, bl);
 	if (ret)
 		goto out_stream_start;
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
index 844dfda15ab6..dec1fed44dd2 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
@@ -39,7 +39,6 @@ struct ipu6_isys_video_buffer {
 
 #define IPU6_ISYS_BUFFER_LIST_FL_INCOMING	BIT(0)
 #define IPU6_ISYS_BUFFER_LIST_FL_ACTIVE	BIT(1)
-#define IPU6_ISYS_BUFFER_LIST_FL_SET_STATE	BIT(2)
 
 struct ipu6_isys_buffer_list {
 	struct list_head head;
-- 
2.47.3


