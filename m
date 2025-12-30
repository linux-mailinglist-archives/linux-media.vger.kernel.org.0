Return-Path: <linux-media+bounces-49703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBC9CE977C
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 11:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 400353006705
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 10:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3CB2D9EFF;
	Tue, 30 Dec 2025 10:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/kMu5ZR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003CB2DC33F
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 10:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091943; cv=none; b=N/+SSxvcBP0FGPO5RMtqowDODCr9hWqD5aAfl2rRKgrCaBDWkouGZV7bkFOfySGJ5P5N93uN4MAFpfgIx1edlQxk9HInIhzRXlGzIxvNoY3XONPxJRq007A5G8oiYXSQ4hTJS3iyyON72B4IFpjpQHqXcZcEqL4MvImHH+w02oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091943; c=relaxed/simple;
	bh=pD1g9JInowwJf/6NrkvPezo4SgC1xn46O+yQKgqfBuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VzV+A/6x772A4IxcTjSxh4EX1c2sAf+9ZuyLIpHNptKYJg5lJsTDJjv/k0Iz+opRx2Z6lI9cvTzEg0XrZ7+wByyFDkBDO+f9uHQCwRTIe3gDPOVFT6Z0FrA6Moixr/Ib8eA/748kkDEqyKNJiUtmiGVDShAJ9uFzX1+x6znaRvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/kMu5ZR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767091942; x=1798627942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pD1g9JInowwJf/6NrkvPezo4SgC1xn46O+yQKgqfBuo=;
  b=d/kMu5ZRjDWkdwXxMEIXoa+VeOX4gvDOkJAvQ3w8ZpHL0u9EYKhcfGGh
   eBW5SE2pqWjxGpw/iDabv0shmRI8mktsE9JccNvxGmG6g5m54l7AsLEN+
   s+lSC3y8ZFMC4/NnH9WAA/EVqknR9NSYNub8bfu5nasoWx1wBw1IKbG9i
   sJeO09SNDgSva5RiXSQf/Q2QMo1HvY+51BjNaFQKN+xMZiMNXzVyY33aY
   2mRJrS04ULr1Cmn6/c5DJmkbSyFkfVEH31vnpVoziruwWtMAka+H3gL04
   kLqSm288eTSloBw5uo6hZIJ8gR9hcPC0uGuttrLzB/FuOLGlta9V2meZ/
   A==;
X-CSE-ConnectionGUID: fx/Orc7uTZ+ARrvuhOyA9g==
X-CSE-MsgGUID: 7s0tABJLRgOP6nLYqNFzDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="94148725"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="94148725"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:20 -0800
X-CSE-ConnectionGUID: 6C2CKJFFTQumchOx1Ij4bg==
X-CSE-MsgGUID: ToaLBLZHQG2gdcBUsa2CGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201186913"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:52:19 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8EEB6121E47;
	Tue, 30 Dec 2025 12:52:23 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaXKw-0000000FQYU-1Bgo;
	Tue, 30 Dec 2025 12:52:22 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v2 08/13] media: ipu6: Drop error argument from ipu6_isys_stream_start()
Date: Tue, 30 Dec 2025 12:52:17 +0200
Message-ID: <20251230105222.3676928-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230105222.3676928-1-sakari.ailus@linux.intel.com>
References: <20251230105222.3676928-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

error argument for ipu6_isys_stream_start() is always false, remove the
argument.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index dcad6aafee29..db533d45d994 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -290,7 +290,7 @@ ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
 
 /* Start streaming for real. The buffer list must be available. */
 static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
-				  struct ipu6_isys_buffer_list *bl, bool error)
+				  struct ipu6_isys_buffer_list *bl)
 {
 	struct ipu6_isys_stream *stream = av->stream;
 	struct device *dev = &stream->isys->adev->auxdev.dev;
@@ -336,10 +336,7 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
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
 
@@ -590,7 +587,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 		goto out;
 	}
 
-	ret = ipu6_isys_stream_start(av, bl, false);
+	ret = ipu6_isys_stream_start(av, bl);
 	if (ret)
 		goto out_stream_start;
 
-- 
2.47.3


