Return-Path: <linux-media+bounces-31440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4047DAA4A58
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 13:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1954D9C6637
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6823B2586C1;
	Wed, 30 Apr 2025 11:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VETXHV72"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03B6221557
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 11:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014044; cv=none; b=HH0VlXtViaQpcarNGawmP8G7AWpbftUb5yO8+5i4AQeQMCN4myE5kdSoatFDBnT57HMVDzfqH7Yq3IMrb+sEcuit5EbZ7+56jEv7LbHsZUHTnciRfh7qj2r2qrJpRdW+NLzTpC4ungbkvCTk8VFP5b2z8v83FqbNFGvwXc+LlXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014044; c=relaxed/simple;
	bh=DRUxhlBp8oVdMU+66E3k8oMJwnV8bCvCfN5hDeS6tqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q5ujqJ0kUvakRL7j9wRACLp+vJmVI2xb3q60HBbmeAB/UhcLdQ/0QWYJ2UJKVer9NS1t92Yj13Cic5zIsmrl+xGpJ+8PWUN8O2Yi2WpPPqdTlYBsqytC4+3aQ8NmzJC3Ou3/bycZz6m72gsMFvNoDnMIcJEwnFrbDtmr9FJD/Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VETXHV72; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746014043; x=1777550043;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DRUxhlBp8oVdMU+66E3k8oMJwnV8bCvCfN5hDeS6tqs=;
  b=VETXHV72dC8ViZM/VgHr0z0gJIHJrNBeL2b57GmJVy+zBEeMNjl9nBkr
   I+O8HIl43A5x0SW0AHBkaWkMT9K7569JpghOzrG7cR9P+GvHGnLMQaxCN
   sgkL5Awbg+WYn5/8/WuVWaSi+QYFGtIdps1uNKJg9gI96eJRtohI5H/Zf
   NJtOTpIZ1gn/64W4wkZIjuuPLZgkGrvbLySq6Fa16AnEA9sSwxNHZHiWX
   eAAEDJiXQ2Z/wBuZ5n/gBAwYxYS+64/Cn7dMFswijjkglIZ2ucTTsS/Yc
   m1CIIOMnGXX8boLH8YDweZ6dK8O7z6Qypi72rqMrRrnXtz2yOwKUZQdqa
   g==;
X-CSE-ConnectionGUID: /GZJIv2BRK6WDROzTjqiQQ==
X-CSE-MsgGUID: wtDHm8mZT5yaFXF+9Fxr/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="65205146"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="65205146"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:54:02 -0700
X-CSE-ConnectionGUID: SVYDuGFoQueDNeo4k+BBGQ==
X-CSE-MsgGUID: 9p9IXxpxRnm02aTUkJ1smw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="139279781"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.84.5])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:53:59 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH v2 1/5] media: intel/ipu6: Remove pin_ready function pointer
Date: Wed, 30 Apr 2025 13:53:46 +0200
Message-Id: <20250430115350.506460-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430115350.506460-1-stanislaw.gruszka@linux.intel.com>
References: <20250430115350.506460-1-stanislaw.gruszka@linux.intel.com>
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


