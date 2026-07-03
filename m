Return-Path: <linux-media+bounces-66484-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0+YtCbjUR2qxfwAAu9opvQ
	(envelope-from <linux-media+bounces-66484-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE02703D76
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=EL6tT9L1;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66484-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66484-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FE4F302CB70
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537CD417340;
	Fri,  3 Jul 2026 15:25:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EA641734D
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092354; cv=none; b=MXe79ZnD7S5qJqSspQetfy72rHW0dSV+Gqml3BZZNX5G3duM7vCMxoi0k5w0G98ASSOUUi/mCuZKNggjHWYYcnIr2EQXuILVcKsii/gWM2Tr8L7vZH6XJwPVscrJu+ZUBoTrF4SSkhpm/0k/ZEQLVBCedjCtjwxPVhbq7+Rnyes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092354; c=relaxed/simple;
	bh=tEh4+OhTzfUIHffUYeYlO2gd20hOQc7J3Bn2FMd4xrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AV7/n9T5eQ58MczXbTYpCtQyp91Xhv1d/9Ur7NUUWBit9xO7UCauajXFr7sfrdSl6u7xlEIrXRCwFG80JjeG/howAXOP9qlpyLBWD5TBKOtDw6QsANwx5VBVfElVbgWjlwU0pnvct4/gVDmoY5jG+nZAtfE8jyUgUa3E3HOXLu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EL6tT9L1; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092353; x=1814628353;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tEh4+OhTzfUIHffUYeYlO2gd20hOQc7J3Bn2FMd4xrg=;
  b=EL6tT9L1N58Om2hdrMZfApsNC+QAXs9hebx0MBcgLq5w6ljIA7AkUKjg
   /tTekRggrKF2RegkGxQ7K0ZBSPSHzM8MJVk83XGvpKopc86q/+ZKWwzZc
   nKPoK5k9NQOQ6BklHfUVwqtHWudhSkKTkqTtymLKpM2iwGDb0DXwvLGAh
   RlEtUilCI602u/5M6SKv7ZseLSguM8Gh91JmjpIYxdNxVgtkQ+hzpL7I0
   F3HbW98Fhe7WDQzju+n69bB2Mtb1fpgSM6O97EE/3PgqMrj1qkcU8ZckS
   gAGydMKouvNkKdXOgPsRHXUqeovLAOAT+wX/KG8fRxXXyMQWuJXuYLv2G
   g==;
X-CSE-ConnectionGUID: 6wBLmNeISR60DHBaN0tS9g==
X-CSE-MsgGUID: liko+wrSS0aFLyUw+Cp4Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396181"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396181"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:53 -0700
X-CSE-ConnectionGUID: 6LDc+Ej8TQCZG/tpPxakxA==
X-CSE-MsgGUID: djc2vmP+QNWJjz/stECGzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799607"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:51 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 18/41] media: ipu6: Move isys isr handlers down to fw file
Date: Fri,  3 Jul 2026 18:24:28 +0300
Message-ID: <20260703152451.1743132-19-antti.laakso@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-66484-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 7CE02703D76

The ipu7 will have its own isr handlers. Move ipu6 isr
code to hardware specific file.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 260 +++++++++++++++++++
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h |   3 +
 drivers/media/pci/intel/ipu6/ipu6-isys.c    | 263 +-------------------
 3 files changed, 264 insertions(+), 262 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
index fc2f24c05de7..52d752a790aa 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -487,3 +487,263 @@ ipu6_fw_isys_dump_frame_buff_set(struct device *dev,
 
 	dev_dbg(dev, "-----------------------------------------------------\n");
 }
+
+
+struct fwmsg {
+	int type;
+	char *msg;
+	bool valid_ts;
+};
+
+static const struct fwmsg fw_msg[] = {
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE, "STREAM_OPEN_DONE", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_CLOSE_ACK, "STREAM_CLOSE_ACK", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_START_ACK, "STREAM_START_ACK", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK,
+	 "STREAM_START_AND_CAPTURE_ACK", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_STOP_ACK, "STREAM_STOP_ACK", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK, "STREAM_FLUSH_ACK", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_READY, "PIN_DATA_READY", 1},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_ACK, "STREAM_CAPTURE_ACK", 0},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE,
+	 "STREAM_START_AND_CAPTURE_DONE", 1},
+	{IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE, "STREAM_CAPTURE_DONE", 1},
+	{IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF, "FRAME_SOF", 1},
+	{IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF, "FRAME_EOF", 1},
+	{IPU6_FW_ISYS_RESP_TYPE_STATS_DATA_READY, "STATS_READY", 1},
+	{-1, "UNKNOWN MESSAGE", 0}
+};
+
+static u32 resp_type_to_index(int type)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(fw_msg); i++)
+		if (fw_msg[i].type == type)
+			return i;
+
+	return  ARRAY_SIZE(fw_msg) - 1;
+}
+
+int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
+{
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	struct ipu6_fw_isys_resp_info_abi *resp;
+	struct ipu6_isys_stream *stream;
+	struct ipu6_isys_csi2 *csi2 = NULL;
+	u32 index;
+	u64 ts;
+
+	if (!isys->fwctx)
+		return 1;
+
+	resp = ipu6_fw_isys_get_resp(isys);
+	if (!resp)
+		return 1;
+
+	ts = (u64)resp->timestamp[1] << 32 | resp->timestamp[0];
+
+	index = resp_type_to_index(resp->type);
+	dev_dbg(&adev->auxdev.dev,
+		"FW resp %02d %s, stream %u, ts 0x%16.16llx, pin %d\n",
+		resp->type, fw_msg[index].msg, resp->stream_handle,
+		fw_msg[index].valid_ts ? ts : 0, resp->pin_id);
+
+	if (resp->error_info.error == IPU6_FW_ISYS_ERROR_STREAM_IN_SUSPENSION)
+		/* Suspension is kind of special case: not enough buffers */
+		dev_dbg(&adev->auxdev.dev,
+			"FW error resp SUSPENSION, details %d\n",
+			resp->error_info.error_details);
+	else if (resp->error_info.error)
+		dev_dbg(&adev->auxdev.dev,
+			"FW error resp error %d, details %d\n",
+			resp->error_info.error, resp->error_info.error_details);
+
+	if (resp->stream_handle >= IPU6_ISYS_MAX_STREAMS) {
+		dev_err(&adev->auxdev.dev, "bad stream handle %u\n",
+			resp->stream_handle);
+		goto leave;
+	}
+
+	stream = ipu6_isys_query_stream_by_handle(isys, resp->stream_handle);
+	if (!stream) {
+		dev_err(&adev->auxdev.dev, "stream of stream_handle %u is unused\n",
+			resp->stream_handle);
+		goto leave;
+	}
+	stream->error = resp->error_info.error;
+
+	csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
+
+	switch (resp->type) {
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE:
+		complete(&stream->stream_open_completion);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CLOSE_ACK:
+		complete(&stream->stream_close_completion);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_ACK:
+		complete(&stream->stream_start_completion);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK:
+		complete(&stream->stream_start_completion);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_STOP_ACK:
+		complete(&stream->stream_stop_completion);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK:
+		complete(&stream->stream_stop_completion);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_READY:
+		/*
+		 * firmware only release the capture msg until software
+		 * get pin_data_ready event
+		 */
+		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), resp->buf_id);
+		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS &&
+		    stream->output_pins_queue[resp->pin_id])
+			ipu6_isys_queue_buf_ready(stream, resp);
+		else
+			dev_warn(&adev->auxdev.dev,
+				 "%d:No queue for pin id %d\n",
+				 resp->stream_handle, resp->pin_id);
+		if (csi2)
+			ipu6_isys_csi2_error(csi2);
+
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_ACK:
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE:
+	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE:
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF:
+
+		ipu6_isys_csi2_sof_event_by_stream(stream);
+		stream->seq[stream->seq_index].sequence =
+			atomic_read(&stream->sequence) - 1;
+		stream->seq[stream->seq_index].timestamp = ts;
+		dev_dbg(&adev->auxdev.dev,
+			"sof: handle %d: (index %u), timestamp 0x%16.16llx\n",
+			resp->stream_handle,
+			stream->seq[stream->seq_index].sequence, ts);
+		stream->seq_index = (stream->seq_index + 1)
+			% IPU6_ISYS_MAX_PARALLEL_SOF;
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF:
+		ipu6_isys_csi2_eof_event_by_stream(stream);
+		dev_dbg(&adev->auxdev.dev,
+			"eof: handle %d: (index %u), timestamp 0x%16.16llx\n",
+			resp->stream_handle,
+			stream->seq[stream->seq_index].sequence, ts);
+		break;
+	case IPU6_FW_ISYS_RESP_TYPE_STATS_DATA_READY:
+		break;
+	default:
+		dev_err(&adev->auxdev.dev, "%d:unknown response type %u\n",
+			resp->stream_handle, resp->type);
+		break;
+	}
+
+	ipu6_isys_put_stream(stream);
+leave:
+	ipu6_fw_isys_put_resp(isys);
+	return 0;
+}
+
+static void ipu6_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
+{
+	struct ipu6_isys_stream *stream;
+	unsigned int i;
+	u32 status;
+	int source;
+
+	ipu6_isys_register_errors(csi2);
+
+	status = readl(csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
+		       CSI_PORT_REG_BASE_IRQ_STATUS_OFFSET);
+
+	writel(status, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
+	       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
+
+	source = csi2->asd.source;
+	for (i = 0; i < NR_OF_CSI2_VC; i++) {
+		if (status & IPU_CSI_RX_IRQ_FS_VC(i)) {
+			stream = ipu6_isys_query_stream_by_source(csi2->isys,
+								  source, i);
+			if (stream) {
+				ipu6_isys_csi2_sof_event_by_stream(stream);
+				ipu6_isys_put_stream(stream);
+			}
+		}
+
+		if (status & IPU_CSI_RX_IRQ_FE_VC(i)) {
+			stream = ipu6_isys_query_stream_by_source(csi2->isys,
+								  source, i);
+			if (stream) {
+				ipu6_isys_csi2_eof_event_by_stream(stream);
+				ipu6_isys_put_stream(stream);
+			}
+		}
+	}
+}
+
+irqreturn_t ipu6_isys_isr(struct ipu6_bus_device *adev)
+{
+	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
+	void __iomem *base = isys->pdata->base;
+	u32 status_sw, status_csi;
+	u32 ctrl0_status, ctrl0_clear;
+
+	spin_lock(&isys->power_lock);
+	if (!isys->power) {
+		spin_unlock(&isys->power_lock);
+		return IRQ_NONE;
+	}
+
+	ctrl0_status = isys->pdata->ipdata->csi2.ctrl0_irq_status;
+	ctrl0_clear = isys->pdata->ipdata->csi2.ctrl0_irq_clear;
+
+	status_csi = readl(isys->pdata->base + ctrl0_status);
+	status_sw = readl(isys->pdata->base +
+			  IPU6_REG_ISYS_UNISPART_IRQ_STATUS);
+
+	writel(ISYS_UNISPART_IRQS & ~IPU6_ISYS_UNISPART_IRQ_SW,
+	       base + IPU6_REG_ISYS_UNISPART_IRQ_MASK);
+
+	do {
+		writel(status_csi, isys->pdata->base + ctrl0_clear);
+
+		writel(status_sw, isys->pdata->base +
+		       IPU6_REG_ISYS_UNISPART_IRQ_CLEAR);
+
+		if (isys->isr_csi2_bits & status_csi) {
+			unsigned int i;
+
+			for (i = 0; i < isys->pdata->ipdata->csi2.nports; i++) {
+				/* irq from not enabled port */
+				if (!isys->csi2[i].base)
+					continue;
+				if (status_csi & IPU6_ISYS_UNISPART_IRQ_CSI2(i))
+					ipu6_isys_csi2_isr(&isys->csi2[i]);
+			}
+		}
+
+		writel(0, base + IPU6_REG_ISYS_UNISPART_SW_IRQ_REG);
+
+		if (!ipu6_isys_isr_one(adev))
+			status_sw = IPU6_ISYS_UNISPART_IRQ_SW;
+		else
+			status_sw = 0;
+
+		status_csi = readl(isys->pdata->base + ctrl0_status);
+		status_sw |= readl(isys->pdata->base +
+				   IPU6_REG_ISYS_UNISPART_IRQ_STATUS);
+	} while ((status_csi & isys->isr_csi2_bits) ||
+		 (status_sw & IPU6_ISYS_UNISPART_IRQ_SW));
+
+	writel(ISYS_UNISPART_IRQS, base + IPU6_REG_ISYS_UNISPART_IRQ_MASK);
+
+	spin_unlock(&isys->power_lock);
+
+	return IRQ_HANDLED;
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
index 15d4ae355f28..f65461a4c907 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
@@ -578,4 +578,7 @@ void ipu6_fw_isys_cleanup(struct ipu6_isys *isys);
 struct ipu6_fw_isys_resp_info_abi *
 ipu6_fw_isys_get_resp(struct ipu6_isys *isys);
 void ipu6_fw_isys_put_resp(struct ipu6_isys *isys);
+int ipu6_isys_isr_one(struct ipu6_bus_device *adev);
+irqreturn_t ipu6_isys_isr(struct ipu6_bus_device *adev);
+
 #endif
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index e71cfaf0def5..b4546d3fdd12 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -100,8 +100,6 @@ enum ltr_did_type {
 
 #define ISYS_PM_QOS_VALUE	300
 
-static int isys_isr_one(struct ipu6_bus_device *adev);
-
 static int
 isys_complete_ext_device_registration(struct ipu6_isys *isys,
 				      struct v4l2_subdev *sd,
@@ -304,104 +302,6 @@ static void isys_setup_hw(struct ipu6_isys *isys)
 		writel(thd[i], base + IPU6_REG_ISYS_CDC_THRESHOLD(i));
 }
 
-static void ipu6_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
-{
-	struct ipu6_isys_stream *stream;
-	unsigned int i;
-	u32 status;
-	int source;
-
-	ipu6_isys_register_errors(csi2);
-
-	status = readl(csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
-		       CSI_PORT_REG_BASE_IRQ_STATUS_OFFSET);
-
-	writel(status, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
-	       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
-
-	source = csi2->asd.source;
-	for (i = 0; i < NR_OF_CSI2_VC; i++) {
-		if (status & IPU_CSI_RX_IRQ_FS_VC(i)) {
-			stream = ipu6_isys_query_stream_by_source(csi2->isys,
-								  source, i);
-			if (stream) {
-				ipu6_isys_csi2_sof_event_by_stream(stream);
-				ipu6_isys_put_stream(stream);
-			}
-		}
-
-		if (status & IPU_CSI_RX_IRQ_FE_VC(i)) {
-			stream = ipu6_isys_query_stream_by_source(csi2->isys,
-								  source, i);
-			if (stream) {
-				ipu6_isys_csi2_eof_event_by_stream(stream);
-				ipu6_isys_put_stream(stream);
-			}
-		}
-	}
-}
-
-static irqreturn_t isys_isr(struct ipu6_bus_device *adev)
-{
-	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
-	void __iomem *base = isys->pdata->base;
-	u32 status_sw, status_csi;
-	u32 ctrl0_status, ctrl0_clear;
-
-	spin_lock(&isys->power_lock);
-	if (!isys->power) {
-		spin_unlock(&isys->power_lock);
-		return IRQ_NONE;
-	}
-
-	ctrl0_status = isys->pdata->ipdata->csi2.ctrl0_irq_status;
-	ctrl0_clear = isys->pdata->ipdata->csi2.ctrl0_irq_clear;
-
-	status_csi = readl(isys->pdata->base + ctrl0_status);
-	status_sw = readl(isys->pdata->base +
-			  IPU6_REG_ISYS_UNISPART_IRQ_STATUS);
-
-	writel(ISYS_UNISPART_IRQS & ~IPU6_ISYS_UNISPART_IRQ_SW,
-	       base + IPU6_REG_ISYS_UNISPART_IRQ_MASK);
-
-	do {
-		writel(status_csi, isys->pdata->base + ctrl0_clear);
-
-		writel(status_sw, isys->pdata->base +
-		       IPU6_REG_ISYS_UNISPART_IRQ_CLEAR);
-
-		if (isys->isr_csi2_bits & status_csi) {
-			unsigned int i;
-
-			for (i = 0; i < isys->pdata->ipdata->csi2.nports; i++) {
-				/* irq from not enabled port */
-				if (!isys->csi2[i].base)
-					continue;
-				if (status_csi & IPU6_ISYS_UNISPART_IRQ_CSI2(i))
-					ipu6_isys_csi2_isr(&isys->csi2[i]);
-			}
-		}
-
-		writel(0, base + IPU6_REG_ISYS_UNISPART_SW_IRQ_REG);
-
-		if (!isys_isr_one(adev))
-			status_sw = IPU6_ISYS_UNISPART_IRQ_SW;
-		else
-			status_sw = 0;
-
-		status_csi = readl(isys->pdata->base + ctrl0_status);
-		status_sw |= readl(isys->pdata->base +
-				   IPU6_REG_ISYS_UNISPART_IRQ_STATUS);
-	} while ((status_csi & isys->isr_csi2_bits) ||
-		 (status_sw & IPU6_ISYS_UNISPART_IRQ_SW));
-
-	writel(ISYS_UNISPART_IRQS, base + IPU6_REG_ISYS_UNISPART_IRQ_MASK);
-
-	spin_unlock(&isys->power_lock);
-
-	return IRQ_HANDLED;
-}
-
 static void get_lut_ltrdid(struct ipu6_isys *isys, struct ltr_did *pltr_did)
 {
 	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
@@ -1166,169 +1066,8 @@ static void isys_remove(struct auxiliary_device *auxdev)
 	mutex_destroy(&isys->mutex);
 }
 
-struct fwmsg {
-	int type;
-	char *msg;
-	bool valid_ts;
-};
-
-static const struct fwmsg fw_msg[] = {
-	{IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE, "STREAM_OPEN_DONE", 0},
-	{IPU6_FW_ISYS_RESP_TYPE_STREAM_CLOSE_ACK, "STREAM_CLOSE_ACK", 0},
-	{IPU6_FW_ISYS_RESP_TYPE_STREAM_START_ACK, "STREAM_START_ACK", 0},
-	{IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK,
-	 "STREAM_START_AND_CAPTURE_ACK", 0},
-	{IPU6_FW_ISYS_RESP_TYPE_STREAM_STOP_ACK, "STREAM_STOP_ACK", 0},
-	{IPU6_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK, "STREAM_FLUSH_ACK", 0},
-	{IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_READY, "PIN_DATA_READY", 1},
-	{IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_ACK, "STREAM_CAPTURE_ACK", 0},
-	{IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE,
-	 "STREAM_START_AND_CAPTURE_DONE", 1},
-	{IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE, "STREAM_CAPTURE_DONE", 1},
-	{IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF, "FRAME_SOF", 1},
-	{IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF, "FRAME_EOF", 1},
-	{IPU6_FW_ISYS_RESP_TYPE_STATS_DATA_READY, "STATS_READY", 1},
-	{-1, "UNKNOWN MESSAGE", 0}
-};
-
-static u32 resp_type_to_index(int type)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(fw_msg); i++)
-		if (fw_msg[i].type == type)
-			return i;
-
-	return  ARRAY_SIZE(fw_msg) - 1;
-}
-
-static int isys_isr_one(struct ipu6_bus_device *adev)
-{
-	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
-	struct ipu6_fw_isys_resp_info_abi *resp;
-	struct ipu6_isys_stream *stream;
-	struct ipu6_isys_csi2 *csi2 = NULL;
-	u32 index;
-	u64 ts;
-
-	if (!isys->fwctx)
-		return 1;
-
-	resp = ipu6_fw_isys_get_resp(isys);
-	if (!resp)
-		return 1;
-
-	ts = (u64)resp->timestamp[1] << 32 | resp->timestamp[0];
-
-	index = resp_type_to_index(resp->type);
-	dev_dbg(&adev->auxdev.dev,
-		"FW resp %02d %s, stream %u, ts 0x%16.16llx, pin %d\n",
-		resp->type, fw_msg[index].msg, resp->stream_handle,
-		fw_msg[index].valid_ts ? ts : 0, resp->pin_id);
-
-	if (resp->error_info.error == IPU6_FW_ISYS_ERROR_STREAM_IN_SUSPENSION)
-		/* Suspension is kind of special case: not enough buffers */
-		dev_dbg(&adev->auxdev.dev,
-			"FW error resp SUSPENSION, details %d\n",
-			resp->error_info.error_details);
-	else if (resp->error_info.error)
-		dev_dbg(&adev->auxdev.dev,
-			"FW error resp error %d, details %d\n",
-			resp->error_info.error, resp->error_info.error_details);
-
-	if (resp->stream_handle >= IPU6_ISYS_MAX_STREAMS) {
-		dev_err(&adev->auxdev.dev, "bad stream handle %u\n",
-			resp->stream_handle);
-		goto leave;
-	}
-
-	stream = ipu6_isys_query_stream_by_handle(isys, resp->stream_handle);
-	if (!stream) {
-		dev_err(&adev->auxdev.dev, "stream of stream_handle %u is unused\n",
-			resp->stream_handle);
-		goto leave;
-	}
-	stream->error = resp->error_info.error;
-
-	csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
-
-	switch (resp->type) {
-	case IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE:
-		complete(&stream->stream_open_completion);
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CLOSE_ACK:
-		complete(&stream->stream_close_completion);
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_ACK:
-		complete(&stream->stream_start_completion);
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK:
-		complete(&stream->stream_start_completion);
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_STREAM_STOP_ACK:
-		complete(&stream->stream_stop_completion);
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK:
-		complete(&stream->stream_stop_completion);
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_READY:
-		/*
-		 * firmware only release the capture msg until software
-		 * get pin_data_ready event
-		 */
-		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), resp->buf_id);
-		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS &&
-		    stream->output_pins_queue[resp->pin_id])
-			ipu6_isys_queue_buf_ready(stream, resp);
-		else
-			dev_warn(&adev->auxdev.dev,
-				 "%d:No queue for pin id %d\n",
-				 resp->stream_handle, resp->pin_id);
-		if (csi2)
-			ipu6_isys_csi2_error(csi2);
-
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_ACK:
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE:
-	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE:
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF:
-
-		ipu6_isys_csi2_sof_event_by_stream(stream);
-		stream->seq[stream->seq_index].sequence =
-			atomic_read(&stream->sequence) - 1;
-		stream->seq[stream->seq_index].timestamp = ts;
-		dev_dbg(&adev->auxdev.dev,
-			"sof: handle %d: (index %u), timestamp 0x%16.16llx\n",
-			resp->stream_handle,
-			stream->seq[stream->seq_index].sequence, ts);
-		stream->seq_index = (stream->seq_index + 1)
-			% IPU6_ISYS_MAX_PARALLEL_SOF;
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF:
-		ipu6_isys_csi2_eof_event_by_stream(stream);
-		dev_dbg(&adev->auxdev.dev,
-			"eof: handle %d: (index %u), timestamp 0x%16.16llx\n",
-			resp->stream_handle,
-			stream->seq[stream->seq_index].sequence, ts);
-		break;
-	case IPU6_FW_ISYS_RESP_TYPE_STATS_DATA_READY:
-		break;
-	default:
-		dev_err(&adev->auxdev.dev, "%d:unknown response type %u\n",
-			resp->stream_handle, resp->type);
-		break;
-	}
-
-	ipu6_isys_put_stream(stream);
-leave:
-	ipu6_fw_isys_put_resp(isys);
-	return 0;
-}
-
 static const struct ipu6_auxdrv_data ipu6_isys_auxdrv_data = {
-	.isr = isys_isr,
+	.isr = ipu6_isys_isr,
 	.isr_threaded = NULL,
 	.wake_isr_thread = false,
 };
-- 
2.54.0


