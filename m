Return-Path: <linux-media+bounces-66491-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +TsZCurUR2rGfwAAu9opvQ
	(envelope-from <linux-media+bounces-66491-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:27:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CE3703DAD
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:27:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=nLn1s0bO;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66491-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66491-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B68D304B8B9
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1557A416CE7;
	Fri,  3 Jul 2026 15:26:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C870403E87
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092372; cv=none; b=O8Dikj8wKAnwHtt2eDs0dHgcq0HGXyO77x1w+YmfeAS2oP1VNmyZohUre2wWil6TtXd5C2vZxPzT8cwHr8OiLMXXYTnrfek5/ru9gVhedZEflIX8NVDd6+mXQEVMeeILcz+IpMFzelrgXHQM6j0K3JW8u9sJBMg6CphIUxQsFGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092372; c=relaxed/simple;
	bh=GQnbMklsoKp5iEewEYmTVZLrliJTPtAybpBWutRCITI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RwXDBD8rIQg8HTAv05jrqoyGYP825q4K7e8TZWUWkSLRY/7sFs8zUaTulkRl+frTn6O7ibSvotuf3sni0yEzNaUb8WqCPqrQ9gG6nC1C5O968Pz4exomHjJKr0nW3oTij0eGDLtYUQ+CzCRKhIie0tRZ2L8S3gC+YJdohVgvJgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLn1s0bO; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092369; x=1814628369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GQnbMklsoKp5iEewEYmTVZLrliJTPtAybpBWutRCITI=;
  b=nLn1s0bORXl37DUm1J0EKNoABfIR7XCjfEsRNxoJlHqAjcHh0kkg2dm1
   uApowo5fY+DE4dTCC8zaPPIhc84kMZouh1LH04YhNa6JV6t+KwKzW5RFB
   +fdNSucfTvmH4V3CNF7PlOCXwu3OvuIDqi3ALa25EmoaTJ/SXMlwjPFoM
   x+IXk1h2NES2wbI1IXPik707ljeG8GobaVAqPNcAUDFQ1NU6yHxdBsUwe
   /ISPaU11W5ShXjjY8xRkS9HOUcl4GH26YX2F+Zxsl7XuH17xcyNS6U9XW
   Ynzg3MkJ82SN5HaicFllokJ/61lxgk9YDL8JpN53sIO4OFLo0iHjaNiuO
   A==;
X-CSE-ConnectionGUID: PPz8cKwfQ/O6CxRHqm+6HA==
X-CSE-MsgGUID: gXchXTjCTyy2b0oxsxYtig==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396217"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396217"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:09 -0700
X-CSE-ConnectionGUID: ucoaNw18R5iYY9AZ+DbNqg==
X-CSE-MsgGUID: Omy63538QoK09ClFuFg5EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799723"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:07 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 25/41] media: ipu6: Add ipu7 isr handler
Date: Fri,  3 Jul 2026 18:24:35 +0300
Message-ID: <20260703152451.1743132-26-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
References: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66491-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime,intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9CE3703DAD

Add ipu7 interrupt handler for software and CSI events.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   1 +
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |   2 +-
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c   | 331 +++++++++++++++++-
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.h   |  38 ++
 .../media/pci/intel/ipu6/ipu7-platform-regs.h |  20 ++
 5 files changed, 386 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
index ce8eed91065c..ef367c7dc0fa 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
@@ -43,6 +43,7 @@ struct ipu6_isys_csi2 {
 	u32 receiver_errors;
 	unsigned int nlanes;
 	unsigned int port;
+	u32 legacy_irq_mask;
 };
 
 struct ipu6_isys_csi2_timing {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index e18bd923afee..9dd75e8a6ef6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1074,7 +1074,7 @@ static const struct ipu6_auxdrv_data ipu6_isys_auxdrv_data = {
 };
 
 static const struct ipu6_auxdrv_data ipu7_isys_auxdrv_data = {
-	.isr = ipu6_isys_isr,
+	.isr = ipu7_isys_isr,
 	.isr_threaded = NULL,
 	.wake_isr_thread = false,
 	.fw_ops = &ipu7_fw_isys_ops,
diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
index 155ce63822d8..79dda61dc512 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
@@ -3,12 +3,17 @@
  * Copyright (C) 2026 Intel Corporation
  */
 
+#include <linux/cleanup.h>
+
 #include "ipu6-bus.h"
 #include "ipu6-dma.h"
 #include "ipu6-isys.h"
+#include "ipu6-platform-regs.h"
 #include "ipu7-boot.h"
 #include "ipu7-fw-com.h"
 #include "ipu7-fw-isys.h"
+#include "ipu7-isys-csi2-regs.h"
+#include "ipu7-platform-regs.h"
 
 static void ipu7_fw_isys_cleanup(struct ipu6_isys *isys)
 {
@@ -48,7 +53,6 @@ static int ipu7_fw_isys_close(struct ipu6_isys *isys)
 	return ret;
 }
 
-
 static int ipu7_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 {
 	struct ipu7_fw_com_queue_config *queue_configs;
@@ -57,7 +61,7 @@ static int ipu7_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 	struct ipu7_insys_config *fw_config;
 	struct ipu7_fw_com_context *fwctx;
 	dma_addr_t fw_config_dma_addr;
-	unsigned int i, num_queues;
+	unsigned int num_queues;
 	u32 freq;
 	int ret;
 
@@ -95,7 +99,7 @@ static int ipu7_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 	queue_configs[IPU7_INSYS_INPUT_DEV_QUEUE].token_size_in_bytes =
 		sizeof(struct ipu7_insys_send_queue_token);
 
-	for (i = IPU7_INSYS_INPUT_MSG_QUEUE; i < num_queues; i++) {
+	for (unsigned int i = IPU7_INSYS_INPUT_MSG_QUEUE; i < num_queues; i++) {
 		queue_configs[i].max_capacity = IPU7_ISYS_SIZE_SEND_QUEUE;
 		queue_configs[i].token_size_in_bytes =
 			sizeof(struct ipu7_insys_send_queue_token);
@@ -322,7 +326,6 @@ static void ipu7_fw_isys_dump_frame_buf_set(struct device *dev,
 					    unsigned int outputs)
 {
 	struct ipu7_fw_isys_frame_buff_set *buf = &msg->ipu7.frame;
-	unsigned int i;
 
 	dev_dbg(dev, "--------------------------\n");
 	dev_dbg(dev, "IPU_ISYS_BUFF_SET\n");
@@ -330,7 +333,7 @@ static void ipu7_fw_isys_dump_frame_buf_set(struct device *dev,
 	dev_dbg(dev, ".frame_id = %d\n", buf->frame_id);
 	dev_dbg(dev, ".skip_frame = %d\n", buf->skip_frame);
 
-	for (i = 0; i < outputs; i++) {
+	for (unsigned int i = 0; i < outputs; i++) {
 		dev_dbg(dev, ".output_pin[%d]:\n", i);
 		dev_dbg(dev, "\t.user_token = %llx\n",
 			buf->output_pins[i].user_token);
@@ -465,3 +468,321 @@ const struct ipu6_fw_isys_ops ipu7_fw_isys_ops = {
 	.dump_stream_cfg = ipu7_fw_isys_dump_stream_cfg,
 	.dump_frame_buf_set = ipu7_fw_isys_dump_frame_buf_set,
 };
+
+static const struct ipu7_csi2_error {
+	const char *error_string;
+	bool is_info_only;
+} dphy_rx_errors[] = {
+	{ "Error handler FIFO full", false },
+	{ "Reserved Short Packet encoding detected", true },
+	{ "Reserved Long Packet encoding detected", true },
+	{ "Received packet is too short", false},
+	{ "Received packet is too long", false},
+	{ "Short packet discarded due to errors", false },
+	{ "Long packet discarded due to errors", false },
+	{ "CSI Combo Rx interrupt", false },
+	{ "IDI CDC FIFO overflow(remaining bits are reserved as 0)", false },
+	{ "Received NULL packet", true },
+	{ "Received blanking packet", true },
+	{ "Tie to 0", true },
+};
+
+static void ipu7_isys_register_errors(struct ipu6_isys_csi2 *csi2)
+{
+	u32 offset = IPU7_IS_IO_CSI2_ERR_LEGACY_IRQ_CTL_BASE(csi2->port);
+	u32 status = readl(csi2->base + offset + IPU7_IRQ_CTL_STATUS);
+	u32 mask = IPU7_CSI_RX_ERROR_IRQ_MASK;
+
+	if (!status)
+		return;
+
+	dev_dbg(&csi2->isys->adev->auxdev.dev, "csi2-%u error status 0x%08x\n",
+		csi2->port, status);
+
+	writel(status & mask, csi2->base + offset + IPU7_IRQ_CTL_CLEAR);
+	csi2->receiver_errors |= status & mask;
+}
+
+static void ipu7_isys_csi2_error(struct ipu6_isys_csi2 *csi2)
+{
+	u32 status;
+
+	/* Register errors once more in case of error interrupts are disabled */
+	ipu7_isys_register_errors(csi2);
+	status = csi2->receiver_errors;
+	csi2->receiver_errors = 0;
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(dphy_rx_errors); i++) {
+		if (status & BIT(i))
+			dev_err_ratelimited(&csi2->isys->adev->auxdev.dev,
+					    "csi2-%i error: %s\n",
+					    csi2->port,
+					    dphy_rx_errors[i].error_string);
+	}
+}
+
+static const struct resp_to_msg {
+	enum ipu7_insys_resp_type type;
+	const char *msg;
+} is_fw_msg[] = {
+	{ IPU7_INSYS_RESP_TYPE_STREAM_OPEN_DONE, "STREAM_OPEN_DONE" },
+	{ IPU7_INSYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK,
+	 "STREAM_START_AND_CAPTURE_ACK" },
+	{ IPU7_INSYS_RESP_TYPE_STREAM_CAPTURE_ACK, "STREAM_CAPTURE_ACK" },
+	{ IPU7_INSYS_RESP_TYPE_STREAM_ABORT_ACK, "STREAM_ABORT_ACK" },
+	{ IPU7_INSYS_RESP_TYPE_STREAM_FLUSH_ACK, "STREAM_FLUSH_ACK" },
+	{ IPU7_INSYS_RESP_TYPE_STREAM_CLOSE_ACK, "STREAM_CLOSE_ACK" },
+	{ IPU7_INSYS_RESP_TYPE_PIN_DATA_READY, "PIN_DATA_READY" },
+	{ IPU7_INSYS_RESP_TYPE_FRAME_SOF, "FRAME_SOF" },
+	{ IPU7_INSYS_RESP_TYPE_FRAME_EOF, "FRAME_EOF" },
+	{ IPU7_INSYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE,
+	 "STREAM_START_AND_CAPTURE_DONE" },
+	{ IPU7_INSYS_RESP_TYPE_STREAM_CAPTURE_DONE, "STREAM_CAPTURE_DONE" },
+	{ N_IPU7_INSYS_RESP_TYPE, "N_IPU7_INSYS_RESP_TYPE" },
+};
+
+static int ipu7_isys_isr_one(struct ipu6_bus_device *adev)
+{
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	struct ipu6_isys_stream *stream = NULL;
+	struct device *dev = &adev->auxdev.dev;
+	struct ipu6_isys_csi2 *csi2 = NULL;
+	struct ipu7_fw_isys_msg_err err_info;
+	struct ipu7_insys_resp *resp;
+	u64 ts;
+
+	if (!isys->fwctx)
+		return 1;
+
+	resp = ipu7_fw_isys_get_resp(isys);
+	if (!resp)
+		return 1;
+
+	if (resp->type >= N_IPU7_INSYS_RESP_TYPE) {
+		dev_err(dev, "Unknown response type %u stream %u\n",
+			resp->type, resp->stream_id);
+		ipu7_fw_isys_put_resp(isys);
+		return 1;
+	}
+
+	err_info = resp->error_info;
+	ts = ((u64)resp->timestamp[1] << 32) | resp->timestamp[0];
+
+	if (err_info.err_group == INSYS_MSG_ERR_GROUP_CAPTURE &&
+	    err_info.err_code == INSYS_MSG_ERR_CAPTURE_SYNC_FRAME_DROP) {
+		/* receive a sp w/o command, firmware drop it */
+		dev_dbg(dev, "FRAME DROP: %02u %s stream %u\n",
+			resp->type, is_fw_msg[resp->type].msg,
+			resp->stream_id);
+		dev_dbg(dev, "\tpin %u buf_id %llx frame %u\n",
+			resp->pin_id, resp->buf_id, resp->frame_id);
+		dev_dbg(dev, "\terror group %u code %u details [%u %u]\n",
+			err_info.err_group, err_info.err_code,
+			err_info.err_detail[0], err_info.err_detail[1]);
+	} else if (err_info.err_code) {
+		dev_err(dev, "%02u %s stream %u pin %u buf_id %llx frame %u\n",
+			resp->type, is_fw_msg[resp->type].msg, resp->stream_id,
+			resp->pin_id, resp->buf_id, resp->frame_id);
+		dev_err(dev, "\terror group %u code %u details [%u %u]\n",
+			err_info.err_group, err_info.err_code,
+			err_info.err_detail[0], err_info.err_detail[1]);
+	} else {
+		dev_dbg(dev, "%02u %s stream %u pin %u buf_id %llx frame %u\n",
+			resp->type, is_fw_msg[resp->type].msg, resp->stream_id,
+			resp->pin_id, resp->buf_id, resp->frame_id);
+		dev_dbg(dev, "\tts %llu\n", ts);
+	}
+
+	if (resp->stream_id >= IPU7_ISYS_MAX_STREAMS) {
+		dev_err(dev, "bad stream handle %u\n",
+			resp->stream_id);
+		goto leave;
+	}
+
+	stream = ipu6_isys_query_stream_by_handle(isys, resp->stream_id);
+	if (!stream) {
+		dev_err(dev, "stream of stream_handle %u is unused\n",
+			resp->stream_id);
+		goto leave;
+	}
+
+	stream->error = err_info.err_code;
+
+	if (stream->asd)
+		csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
+
+	switch (resp->type) {
+	case IPU7_INSYS_RESP_TYPE_STREAM_OPEN_DONE:
+		complete(&stream->stream_open_completion);
+		break;
+	case IPU7_INSYS_RESP_TYPE_STREAM_CLOSE_ACK:
+		complete(&stream->stream_close_completion);
+		break;
+	case IPU7_INSYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK:
+		complete(&stream->stream_start_completion);
+		break;
+	case IPU7_INSYS_RESP_TYPE_STREAM_ABORT_ACK:
+		complete(&stream->stream_stop_completion);
+		break;
+	case IPU7_INSYS_RESP_TYPE_STREAM_FLUSH_ACK:
+		complete(&stream->stream_stop_completion);
+		break;
+	case IPU7_INSYS_RESP_TYPE_PIN_DATA_READY:
+		/*
+		 * firmware only release the capture msg until software
+		 * get pin_data_ready event
+		 */
+		struct isys_fw_msgs *msg =
+			container_of((void *)resp->buf_id, struct isys_fw_msgs,
+				     dummy);
+
+		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), msg);
+		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS)
+			ipu6_stream_buf_ready(stream, resp->pin_id,
+					      resp->pin.addr, ts, 0);
+		else
+			dev_err(dev, "No handler for pin %u ready\n",
+				resp->pin_id);
+		if (csi2)
+			ipu7_isys_csi2_error(csi2);
+
+		break;
+	case IPU7_INSYS_RESP_TYPE_STREAM_CAPTURE_ACK:
+		break;
+	case IPU7_INSYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE:
+	case IPU7_INSYS_RESP_TYPE_STREAM_CAPTURE_DONE:
+		break;
+	case IPU7_INSYS_RESP_TYPE_FRAME_SOF:
+		if (csi2)
+			ipu6_isys_csi2_sof_event_by_stream(stream);
+
+		stream->seq[stream->seq_index].sequence =
+			atomic_read(&stream->sequence) - 1U;
+		stream->seq[stream->seq_index].timestamp = ts;
+		dev_dbg(dev,
+			"SOF: stream %u frame %u (index %u), ts 0x%16.16llx\n",
+			resp->stream_id, resp->frame_id,
+			stream->seq[stream->seq_index].sequence, ts);
+		stream->seq_index = (stream->seq_index + 1U)
+			% IPU6_ISYS_MAX_PARALLEL_SOF;
+		break;
+	case IPU7_INSYS_RESP_TYPE_FRAME_EOF:
+		if (csi2)
+			ipu6_isys_csi2_eof_event_by_stream(stream);
+
+		dev_dbg(dev, "eof: stream %d(index %u) ts 0x%16.16llx\n",
+			resp->stream_id,
+			stream->seq[stream->seq_index].sequence, ts);
+		break;
+	default:
+		dev_err(dev, "Unknown response type %u stream %u\n",
+			resp->type, resp->stream_id);
+		break;
+	}
+
+	ipu6_isys_put_stream(stream);
+leave:
+	ipu7_fw_isys_put_resp(isys);
+
+	return 0;
+}
+
+#define IPU7_NR_OF_CSI2_VC		16U
+static void ipu7_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
+{
+	struct device *dev = &csi2->isys->adev->auxdev.dev;
+	struct ipu6_device *isp = csi2->isys->adev->isp;
+	struct ipu6_isys_stream *s;
+	u32 sync, offset;
+	u32 fe = 0;
+	u8 vc;
+
+	ipu7_isys_register_errors(csi2);
+
+	offset = IPU7_IS_IO_CSI2_SYNC_LEGACY_IRQ_CTL_BASE(csi2->port);
+	sync = readl(csi2->base + offset + IPU7_IRQ_CTL_STATUS);
+	writel(sync, csi2->base + offset + IPU7_IRQ_CTL_CLEAR);
+	dev_dbg(dev, "csi2-%u sync status 0x%08x\n", csi2->port, sync);
+
+	if (!pci_match_id(ipu7_ids, isp->pdev)) {
+		fe = readl(csi2->base + offset + IPU7_IRQ1_CTL_STATUS);
+		writel(fe, csi2->base + offset + IPU7_IRQ1_CTL_CLEAR);
+		dev_dbg(dev, "csi2-%u FE status 0x%08x\n", csi2->port, fe);
+	}
+
+	for (vc = 0; vc < IPU7_NR_OF_CSI2_VC && (sync || fe); vc++) {
+		s = ipu6_isys_query_stream_by_source(csi2->isys,
+						     csi2->asd.source, vc);
+		if (!s)
+			continue;
+
+		if (!pci_match_id(ipu7_ids, isp->pdev)) {
+			if (sync & IPU7P5_CSI_RX_SYNC_FS_VC & (1U << vc))
+				ipu6_isys_csi2_sof_event_by_stream(s);
+
+			if (fe & IPU7P5_CSI_RX_SYNC_FE_VC & (1U << vc))
+				ipu6_isys_csi2_eof_event_by_stream(s);
+		} else {
+			if (sync & IPU7_CSI_RX_SYNC_FS_VC & (1U << (vc * 2)))
+				ipu6_isys_csi2_sof_event_by_stream(s);
+
+			if (sync & IPU7_CSI_RX_SYNC_FE_VC & (2U << (vc * 2)))
+				ipu6_isys_csi2_eof_event_by_stream(s);
+		}
+	}
+}
+
+static void ipu7_dispatch_csi2_isr(struct ipu6_isys *isys, u32 status)
+{
+	for (unsigned int i = 0; i < isys->pdata->ipdata->csi2.nports; i++) {
+		if (!isys->csi2[i].base)
+			continue;
+		if (status & isys->csi2[i].legacy_irq_mask)
+			ipu7_isys_csi2_isr(&isys->csi2[i]);
+	}
+}
+
+irqreturn_t ipu7_isys_isr(struct ipu6_bus_device *adev)
+{
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	void __iomem *base = isys->pdata->base;
+	u32 status_sw, status_csi;
+	u32 csi_offset, sw_offset;
+
+	guard(spinlock)(&isys->power_lock);
+
+	if (!isys->power)
+		return IRQ_NONE;
+
+	csi_offset = IPU7_IS_IO_CSI2_LEGACY_IRQ_CTRL_BASE;
+	sw_offset = IPU7_IS_UC_CTRL_BASE;
+
+	status_csi = readl(base + csi_offset + IPU7_IRQ_CTL_STATUS);
+	status_sw = readl(base + sw_offset + IPU7_TO_SW_IRQ_CNTL_STATUS);
+
+	if (!status_csi && !status_sw)
+		return IRQ_NONE;
+
+	do {
+		writel(status_sw, base + sw_offset + IPU7_TO_SW_IRQ_CNTL_CLEAR);
+		writel(status_csi, base + csi_offset + IPU7_IRQ_CTL_CLEAR);
+
+		if (isys->isr_csi2_bits & status_csi)
+			ipu7_dispatch_csi2_isr(isys, status_csi);
+
+		if (!ipu7_isys_isr_one(adev))
+			status_sw = IPU7_TO_SW_IRQ_FW;
+		else
+			status_sw = 0;
+
+		status_csi = readl(base + csi_offset + IPU7_IRQ_CTL_STATUS);
+		status_sw |= readl(base + sw_offset +
+				   IPU7_TO_SW_IRQ_CNTL_STATUS);
+	} while ((status_csi & isys->isr_csi2_bits) ||
+		 (status_sw & IPU7_TO_SW_IRQ_FW));
+
+	writel(IPU7_IS_UC_TO_SW_IRQ_MASK,
+	       base + sw_offset + IPU7_TO_SW_IRQ_CNTL_MASK_N);
+
+	return IRQ_HANDLED;
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
index 122531065362..d5289f6add8c 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
@@ -117,6 +117,43 @@ enum ipu7_insys_mipi_dt_rename_mode {
 	N_IPU7_INSYS_MIPI_DT_MODE
 };
 
+enum insys_msg_err_capture {
+	INSYS_MSG_ERR_CAPTURE_OK = 0,
+	INSYS_MSG_ERR_CAPTURE_STREAM_ID = 1,
+	INSYS_MSG_ERR_CAPTURE_PAYLOAD_PTR = 2,
+	INSYS_MSG_ERR_CAPTURE_MEM_SLOT = 3,
+	INSYS_MSG_ERR_CAPTURE_STREAMING_MODE = 4,
+	INSYS_MSG_ERR_CAPTURE_AVAILABLE_CMD_SLOT = 5,
+	INSYS_MSG_ERR_CAPTURE_CONSUMED_CMD_SLOT = 6,
+	INSYS_MSG_ERR_CAPTURE_CMD_SLOT_PAYLOAD_PTR = 7,
+	INSYS_MSG_ERR_CAPTURE_CMD_PREPARE = 8,
+	INSYS_MSG_ERR_CAPTURE_OUTPUT_PIN = 9,
+	INSYS_MSG_ERR_CAPTURE_SYNC_FRAME_DROP = 10,
+	INSYS_MSG_ERR_CAPTURE_FRAME_MESSAGES_MAP = 11,
+	INSYS_MSG_ERR_CAPTURE_TIMEOUT = 12,
+	INSYS_MSG_ERR_CAPTURE_INVALID_STREAM_STATE = 13,
+	INSYS_MSG_ERR_CAPTURE_HW_ERR_MULTIBIT_PH_ERROR_DETECTED = 14,
+	INSYS_MSG_ERR_CAPTURE_HW_ERR_PAYLOAD_CRC_ERROR = 15,
+	INSYS_MSG_ERR_CAPTURE_HW_ERR_INPUT_DATA_LOSS_ELASTIC_FIFO_OVFL  = 16,
+	INSYS_MSG_ERR_CAPTURE_HW_ERR_PIXEL_BUFFER_OVERFLOW = 17,
+	INSYS_MSG_ERR_CAPTURE_HW_ERR_BAD_FRAME_DIM = 18,
+	INSYS_MSG_ERR_CAPTURE_HW_ERR_PHY_SYNC_ERR = 19,
+	INSYS_MSG_ERR_CAPTURE_HW_ERR_SECURE_TOUCH = 20,
+	INSYS_MSG_ERR_CAPTURE_HW_ERR_MASTER_SLAVE_SYNC_ERR = 21,
+	INSYS_MSG_ERR_CAPTURE_FRAME_SKIP_ERR = 22,
+	INSYS_MSG_ERR_CAPTURE_FE_INPUT_FIFO_OVERFLOW_ERR = 23,
+	INSYS_MSG_ERR_CAPTURE_CMD_SUBMIT_TO_HW = 24,
+	INSYS_MSG_ERR_CAPTURE_N
+};
+
+enum insys_msg_err_groups {
+	INSYS_MSG_ERR_GROUP_RESERVED = 0,
+	INSYS_MSG_ERR_GROUP_GENERAL = 1,
+	INSYS_MSG_ERR_GROUP_STREAM = 2,
+	INSYS_MSG_ERR_GROUP_CAPTURE = 3,
+	INSYS_MSG_ERR_GROUP_N,
+};
+
 struct ipu7_fw_isys_logger_config {
 	u8 use_source_severity;
 	u8 source_severity[IPU7_FWLOG_MAX_LOGGER_SOURCES];
@@ -254,5 +291,6 @@ struct ipu7_fw_isys_frame_buff_set {
 } __packed;
 
 struct ipu6_fw_isys_ops *ipu7_fw_isys_get_ops(void);
+irqreturn_t ipu7_isys_isr(struct ipu6_bus_device *adev);
 
 #endif
diff --git a/drivers/media/pci/intel/ipu6/ipu7-platform-regs.h b/drivers/media/pci/intel/ipu6/ipu7-platform-regs.h
index 3ca9d65e58b9..39cd5c0890e5 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-platform-regs.h
+++ b/drivers/media/pci/intel/ipu6/ipu7-platform-regs.h
@@ -9,4 +9,24 @@
 #define IPU7_PS_UC_CTRL_BASE                   0x130000
 #define IPU7_PSYS_DMEM_OFFSET                  0x100000
 
+#define IPU7_IS_IO_BASE				0x280000
+#define IPU7_IS_IO_CSI2_GPREGS_BASE		(IPU7_IS_IO_BASE + 0x53400)
+
+#define IPU7_IS_IO_CSI2_LEGACY_IRQ_CTRL_BASE	(IPU7_IS_IO_BASE + 0x49000)
+#define IPU7_IRQ_CTL_EDGE			0x0
+#define IPU7_IRQ_CTL_MASK			0x4
+#define IPU7_IRQ_CTL_STATUS			0x8
+#define IPU7_IRQ_CTL_CLEAR			0xc
+#define IPU7_IRQ_CTL_ENABLE			0x10
+#define IPU7_CSI_RX_LEGACY_IRQ_MASK		0x1ff
+
+#define IPU7_TO_SW_IRQ_CNTL_EDGE		0x4000
+#define IPU7_TO_SW_IRQ_CNTL_MASK_N		0x4004
+#define IPU7_TO_SW_IRQ_CNTL_STATUS		0x4008
+#define IPU7_TO_SW_IRQ_CNTL_CLEAR		0x400c
+#define IPU7_TO_SW_IRQ_CNTL_ENABLE		0x4010
+#define IPU7_IS_UC_TO_SW_IRQ_MASK		0xf
+#define IPU7_TO_SW_IRQ_FW			BIT(0)
+#define IPU7_REG_PRINTF_AXI_CNTL		0x301c
+
 #endif
-- 
2.54.0


