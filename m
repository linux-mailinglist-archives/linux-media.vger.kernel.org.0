Return-Path: <linux-media+bounces-50204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C73BCD01AB6
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 09:54:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 793F632A0299
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 08:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F4537FF6E;
	Thu,  8 Jan 2026 08:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9vfHnhR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC8A18787A
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860263; cv=none; b=dCljIsWDIBScut6il7IAFtK02tpuSDAFtoyC5nL8aCNWgmgAdKbl/HE03S3YRi3IW8t5S+rwFYl7NTHTr1Z9O1a+fu8WpEfQNGy2L4ne47N98NVo2zPf0kdGtvkiQGtOs91/9BdyRPgtM+T46XxKR5adEK7TtnRCuTQQzAzMECg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860263; c=relaxed/simple;
	bh=i6OUsUFi94IuGe68nYjWGdTrnfuI3/W6fMUDJUZyA4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DTvod4BAtRL2fk5TDFk0uT8mvivPGUuHjWOHb5YG4LpC147WtOw0XMsEJE11MfdlFDXqdTB74hgaaGggWmqK8eF7zVfpbXKMrHFnAnP8QR9JQPamMfPpwE4FhqWtjt4OIFwRnAV6w3mXr7IB/SP+auIQBSnm21yTyC/lVT9TSAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9vfHnhR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860255; x=1799396255;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i6OUsUFi94IuGe68nYjWGdTrnfuI3/W6fMUDJUZyA4k=;
  b=F9vfHnhR88LpmcCbemTs2tFGKwiTpUumBPYOY1z6RJ8mZTgMVq1GFDfx
   x+D1TQSOiphGT4SR0y2M9tbStlqis1Cnimn/ZBIcN8FHhJF2VzIqnxOKG
   QuT+HpecL48IaCXdhExG2eEpbIaAeyTsI2bHiC94WDLMqdCDNhbJQF+Lv
   pJeDNNQIi0pGE7dTccScSnFrqHVnWDujhF7s8WyESFLUNDsjlxnbMM/Ez
   yd5y4/8NNPz7x2pqYMZIzOUb5PgoFKUufEyXXfFmwDcn7xQMybrgS8i0Z
   gKl8YLCt0UbVF33bj0gNNuAo6+qL4RzQCE2OXOL+JK33gOjquC3AGtCBy
   g==;
X-CSE-ConnectionGUID: Vp6LRHWZT8KiXviAjIAVnA==
X-CSE-MsgGUID: vPDn4nBRRCeSNtXV+IN/Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72869935"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="72869935"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:06 -0800
X-CSE-ConnectionGUID: h04jhawvTfGa8gFByXbwiA==
X-CSE-MsgGUID: 6UWIQ2uxS4uTz31eod9Kzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233842982"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.211])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:05 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7AA5C121E93;
	Thu, 08 Jan 2026 10:17:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vdlCi-00000002HSi-0qNe;
	Thu, 08 Jan 2026 10:17:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 09/14] media: ipu6: Drop error argument from ipu6_isys_stream_start()
Date: Thu,  8 Jan 2026 10:17:06 +0200
Message-ID: <20260108081712.543704-10-sakari.ailus@linux.intel.com>
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


