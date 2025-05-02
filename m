Return-Path: <linux-media+bounces-31622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27566AA7656
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 17:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 304AA7B67D6
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08A32586FE;
	Fri,  2 May 2025 15:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8VZFhhS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A972580F4
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200695; cv=none; b=GBlDRAjHpC/ac9mBhq40ZGlM0JsIIqslt848JNS1GMQYrSV4KPWsjjK/+W3gtcwjGvT0w5XlG+4VrGHLG9Tyrzop9b4/OdlwBgtawswEc5e0uV7l96PXx0C8Gar7IyQs31RqToyFNK2GLzpsKGKr8DQWWmjySG/YVKqlPhaScTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200695; c=relaxed/simple;
	bh=DRUxhlBp8oVdMU+66E3k8oMJwnV8bCvCfN5hDeS6tqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RmK0bU85bzp73yQS/WT1QW5z8WYnLMC8aD1Xw2aNL/ZsXWbf8EumjZgNrYyhPMthJOsTngYQidj54ChzWfzg5Sne9BqKAgyXPjVAXkR879sJCez1hz6uBOhiFLktp+noM4+oIkA8xYwef1uB9m6UZcWMD5EAMhtnH6yiK9FwFwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8VZFhhS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746200693; x=1777736693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DRUxhlBp8oVdMU+66E3k8oMJwnV8bCvCfN5hDeS6tqs=;
  b=b8VZFhhSuGfUE63HLrQUC8br5cWDvuRaDXxKnSr0mmGDv/EDHcpxmIC6
   v2uFD8cmiY29CEqqe982gndHYXcNY7PNFfxGyF8YZ+qhcG0D2aY3ECzbA
   jGCzYAsITqNgR21wSrjqXd1LvmvmA5MhqtRJVuWt59r6sWwDhmA5IEHQS
   XafDDnB2i4hQhnxgQU6TjMLOH3u98xuW9i+hO80M6MqcVhh0BJ0cvNKex
   MfUy+CafRj+4Egs8fGXkY8ZW52EFVK2Qg7IZpIRQrm1KZE4nyWv6HM46k
   r0cNKKOgJCQBJrcZCER8YNWXzWuckLBhqmMnVs19zXd3Zt1PP7/ezpgTT
   A==;
X-CSE-ConnectionGUID: Un6f36jBQvOrLD/GsWN+Mw==
X-CSE-MsgGUID: sEojFeUoQXK4OZnV/oV3/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58551565"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="58551565"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 08:44:53 -0700
X-CSE-ConnectionGUID: VR37C8g8RLiEv9G6xe53Rw==
X-CSE-MsgGUID: 3VuHx+QLQx+6mKuehHih2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="134626220"
Received: from csteflea-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.252.84])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 08:44:52 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v3 1/5] media: intel/ipu6: Remove pin_ready function pointer
Date: Fri,  2 May 2025 17:44:42 +0200
Message-Id: <20250502154446.88965-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502154446.88965-1-stanislaw.gruszka@linux.intel.com>
References: <20250502154446.88965-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We can call ipu6_isys_queue_buf_ready() directly. The only current
usage is pin_ready pointer is to check if pin was prepared before
IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_READY interrupt, we can use queue
pointer for that purpose.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 3 +--
 drivers/media/pci/intel/ipu6/ipu6-isys-video.h | 8 +-------
 drivers/media/pci/intel/ipu6/ipu6-isys.c       | 7 +++----
 4 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 12b42b46ebab..3998b0087da3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -738,7 +738,7 @@ static void
 ipu6_stream_buf_ready(struct ipu6_isys_stream *stream, u8 pin_id, u32 pin_addr,
 		      u64 time, bool error_check)
 {
-	struct ipu6_isys_queue *aq = stream->output_pins[pin_id].aq;
+	struct ipu6_isys_queue *aq = stream->output_pins_queue[pin_id];
 	struct ipu6_isys *isys = stream->isys;
 	struct device *dev = &isys->adev->auxdev.dev;
 	struct ipu6_isys_buffer *ib;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index e9705bb077b6..46b76cdae408 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -485,8 +485,7 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 
 	output_pins = cfg->nof_output_pins++;
 	aq->fw_output = output_pins;
-	stream->output_pins[output_pins].pin_ready = ipu6_isys_queue_buf_ready;
-	stream->output_pins[output_pins].aq = aq;
+	stream->output_pins_queue[output_pins] = aq;
 
 	output_pin = &cfg->output_pins[output_pins];
 	output_pin->input_pin_id = input_pins;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index 78cf6b8d5211..7b347c99d907 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -37,12 +37,6 @@ struct sequence_info {
 	u64 timestamp;
 };
 
-struct output_pin_data {
-	void (*pin_ready)(struct ipu6_isys_stream *stream,
-			  struct ipu6_fw_isys_resp_info_abi *info);
-	struct ipu6_isys_queue *aq;
-};
-
 /*
  * Align with firmware stream. Each stream represents a CSI virtual channel.
  * May map to multiple video devices
@@ -68,7 +62,7 @@ struct ipu6_isys_stream {
 	struct completion stream_stop_completion;
 	struct ipu6_isys *isys;
 
-	struct output_pin_data output_pins[IPU6_ISYS_OUTPUT_PINS];
+	struct ipu6_isys_queue *output_pins_queue[IPU6_ISYS_OUTPUT_PINS];
 	int error;
 	u8 vc;
 };
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 9b7ff5c440de..4d2ca6aae328 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1294,12 +1294,11 @@ static int isys_isr_one(struct ipu6_bus_device *adev)
 		 */
 		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), resp->buf_id);
 		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS &&
-		    stream->output_pins[resp->pin_id].pin_ready)
-			stream->output_pins[resp->pin_id].pin_ready(stream,
-								    resp);
+		    stream->output_pins_queue[resp->pin_id])
+			ipu6_isys_queue_buf_ready(stream, resp);
 		else
 			dev_warn(&adev->auxdev.dev,
-				 "%d:No data pin ready handler for pin id %d\n",
+				 "%d:No queue for pin id %d\n",
 				 resp->stream_handle, resp->pin_id);
 		if (csi2)
 			ipu6_isys_csi2_error(csi2);
-- 
2.34.1


