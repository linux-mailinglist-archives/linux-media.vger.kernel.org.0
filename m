Return-Path: <linux-media+bounces-66486-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vuaOAMLUR2q3fwAAu9opvQ
	(envelope-from <linux-media+bounces-66486-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B419703D90
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=e2NPXC58;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66486-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66486-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9041E301A407
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325B1417345;
	Fri,  3 Jul 2026 15:26:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAC3417344
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092359; cv=none; b=ICgxC83W/MBs5WEIH3K6XAALP/Z/zGZirKCOL8yxlnyibxCIwchQiBZA9Iq4cOpSs9tEsGeD8N51uk+kXEPqx4AwglxOsU0fn5kwrmTzopSRAovvMZ9ZjWARHScI80OXGqFNmP13w70czd4GiZ+xuZMOSuFNpZQUxnjjvvw8nQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092359; c=relaxed/simple;
	bh=pk1pKZ1d6ZWONBl8ZqssJBJLe5HJE3XWqc6dAaN3NGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UstrdEErvn5ue+CQxo/AjgqemmxDw3NVHSQl7NcKdqbCt/3ce3Hz+lO1pdR94Q+MhRUPug0peVNfAMVT29RrVDfyZiIuTFDVtyiBBMXAeiSU88dZs2oHVQhgJE2fbReTjk8IyhSaj9b7IoT/fBcy08OLWu/77XDtwXr3om8j6X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2NPXC58; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092357; x=1814628357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pk1pKZ1d6ZWONBl8ZqssJBJLe5HJE3XWqc6dAaN3NGM=;
  b=e2NPXC58wiYfncJKSjN4H9YxHdZuUQsXjsd5ljXraurTiCRf7okJY9qm
   uMSHjQ2cYkilf+E41mTHwBKXKMkbkzx80GBSkcjNZSWnyo7B7oKRNBkp3
   rFYwa2khUR3uLSBjyeyw8LbagWygFvcZ1mRyZStze0LVak576/Gb9hmoS
   QPkp++wj2xkFLlmKf/tYkZPBkUdEsJlDkC5P2uZHNqlvO+DtRzT6A8fk/
   crDdumPXDUWPLCWgk7E1T/UIL1SNtOploOTVPuHcyVEzzX97QuLdg6+26
   mibxcKPIvt+VNTqaiNeNXcLnkEo4EAk+6N9l6PGMIk/VsmdToqocd7F1z
   w==;
X-CSE-ConnectionGUID: fRL7Z/Q/QKOTPlDnU8bYEQ==
X-CSE-MsgGUID: PCPaImzKQb2+bzn87ixXHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396193"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396193"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:57 -0700
X-CSE-ConnectionGUID: WoPb3ARKS1yjqBlsaBpU1g==
X-CSE-MsgGUID: /u6qtIwMROGEFwyGGbZm+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799656"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:56 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 20/41] media: ipu6: Isolate hw specific buffer handling
Date: Fri,  3 Jul 2026 18:24:30 +0300
Message-ID: <20260703152451.1743132-21-antti.laakso@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66486-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,linux.intel.com:from_mime,vger.kernel.org:from_smtp,intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,v4l2_crop.top:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B419703D90

Move ipu6 specific buffer and stream handling down to
hardware specific file, to make it possible to add ipu7
specific functionality.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   | 229 ++++++++++++++++--
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h   |  43 +++-
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  77 +-----
 .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   4 -
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 128 +---------
 5 files changed, 265 insertions(+), 216 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
index 7728f5bddef5..7bcb36e47b23 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -90,11 +90,11 @@ int ipu6_fw_isys_send_proxy_token(struct ipu6_isys *isys,
 	return ret;
 }
 
-int ipu6_fw_isys_complex_cmd(struct ipu6_isys *isys,
-			     const unsigned int stream_handle,
-			     void *cpu_mapped_buf,
-			     dma_addr_t dma_mapped_buf,
-			     size_t size, u16 send_type)
+static int ipu6_fw_isys_complex_cmd(struct ipu6_isys *isys,
+				    const unsigned int stream_handle,
+				    void *cpu_mapped_buf,
+				    dma_addr_t dma_mapped_buf,
+				    size_t size, u16 send_type)
 {
 	struct ipu6_fw_com_context *ctx = isys->fwctx;
 	struct device *dev = &isys->adev->auxdev.dev;
@@ -126,13 +126,6 @@ int ipu6_fw_isys_complex_cmd(struct ipu6_isys *isys,
 	return 0;
 }
 
-int ipu6_fw_isys_simple_cmd(struct ipu6_isys *isys,
-			    const unsigned int stream_handle, u16 send_type)
-{
-	return ipu6_fw_isys_complex_cmd(isys, stream_handle, NULL, 0, 0,
-					send_type);
-}
-
 int ipu6_fw_isys_close(struct ipu6_isys *isys)
 {
 	struct device *dev = &isys->adev->auxdev.dev;
@@ -376,11 +369,13 @@ void ipu6_fw_isys_put_resp(struct ipu6_isys *isys)
 	ipu6_recv_put_token(isys->fwctx, IPU6_BASE_MSG_RECV_QUEUES);
 }
 
-void ipu6_fw_isys_dump_stream_cfg(struct device *dev,
-				  struct ipu6_fw_isys_stream_cfg_data_abi *cfg)
+void ipu6_fw_isys_dump_stream_cfg(struct device *dev, struct isys_fw_msgs *msg)
 {
+	struct ipu6_fw_isys_stream_cfg_data_abi *cfg;
 	unsigned int i;
 
+	cfg = &msg->ipu6.stream;
+
 	dev_dbg(dev, "-----------------------------------------------------\n");
 	dev_dbg(dev, "IPU6_FW_ISYS_STREAM_CFG_DATA\n");
 
@@ -454,12 +449,14 @@ void ipu6_fw_isys_dump_stream_cfg(struct device *dev,
 }
 
 void
-ipu6_fw_isys_dump_frame_buff_set(struct device *dev,
-				 struct ipu6_fw_isys_frame_buff_set_abi *buf,
+ipu6_fw_isys_dump_frame_buff_set(struct device *dev, struct isys_fw_msgs *msg,
 				 unsigned int outputs)
 {
+	struct ipu6_fw_isys_frame_buff_set_abi *buf;
 	unsigned int i;
 
+	buf = &msg->ipu6.frame;
+
 	dev_dbg(dev, "-----------------------------------------------------\n");
 	dev_dbg(dev, "IPU6_FW_ISYS_FRAME_BUFF_SET\n");
 
@@ -751,3 +748,203 @@ irqreturn_t ipu6_isys_isr(struct ipu6_bus_device *adev)
 
 	return IRQ_HANDLED;
 }
+
+static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
+				struct ipu6_fw_isys_stream_cfg_data_abi *cfg)
+{
+	struct media_pad *src_pad = media_pad_remote_pad_first(&av->pad);
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(src_pad->entity);
+	struct v4l2_subdev_state *state = v4l2_subdev_get_locked_active_state(sd);
+	struct ipu6_fw_isys_input_pin_info_abi *input_pin;
+	struct ipu6_fw_isys_output_pin_info_abi *output_pin;
+	struct ipu6_isys_stream *stream = av->stream;
+	struct ipu6_isys_queue *aq = &av->aq;
+	struct v4l2_mbus_framefmt fmt;
+	const struct ipu6_isys_pixelformat *pfmt =
+		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
+	struct v4l2_rect v4l2_crop;
+	struct ipu6_isys *isys = av->isys;
+	int input_pins = cfg->nof_input_pins++;
+	int output_pins;
+	u32 src_stream;
+
+	src_stream = ipu6_isys_get_src_stream_by_src_pad(sd, src_pad->index);
+	fmt = *v4l2_subdev_state_get_format(state, src_pad->index, src_stream);
+	v4l2_crop = *v4l2_subdev_state_get_crop(state, src_pad->index, src_stream);
+
+	input_pin = &cfg->input_pins[input_pins];
+	input_pin->input_res.width = fmt.width;
+	input_pin->input_res.height = fmt.height;
+	input_pin->dt = av->dt;
+	input_pin->bits_per_pix = pfmt->bpp_packed;
+	input_pin->mapped_dt = 0x40; /* invalid mipi data type */
+	input_pin->mipi_decompression = 0;
+	input_pin->capture_mode = IPU6_FW_ISYS_CAPTURE_MODE_REGULAR;
+	input_pin->mipi_store_mode = pfmt->bpp == pfmt->bpp_packed ?
+		IPU6_FW_ISYS_MIPI_STORE_MODE_DISCARD_LONG_HEADER :
+		IPU6_FW_ISYS_MIPI_STORE_MODE_NORMAL;
+	input_pin->crop_first_and_last_lines = v4l2_crop.top & 1;
+
+	output_pins = cfg->nof_output_pins++;
+	aq->fw_output = output_pins;
+	stream->output_pins_queue[output_pins] = aq;
+
+	output_pin = &cfg->output_pins[output_pins];
+	output_pin->input_pin_id = input_pins;
+	output_pin->output_res.width = ipu6_isys_get_frame_width(av);
+	output_pin->output_res.height = ipu6_isys_get_frame_height(av);
+
+	output_pin->stride = ipu6_isys_get_bytes_per_line(av);
+	if (pfmt->bpp != pfmt->bpp_packed)
+		output_pin->pt = IPU6_FW_ISYS_PIN_TYPE_RAW_SOC;
+	else
+		output_pin->pt = IPU6_FW_ISYS_PIN_TYPE_MIPI;
+	output_pin->ft = pfmt->css_pixelformat;
+	output_pin->send_irq = 1;
+	memset(output_pin->ts_offsets, 0, sizeof(output_pin->ts_offsets));
+	output_pin->s2m_pixel_soc_pixel_remapping =
+		S2M_PIXEL_SOC_PIXEL_REMAPPING_FLAG_NO_REMAPPING;
+	output_pin->csi_be_soc_pixel_remapping =
+		CSI_BE_SOC_PIXEL_REMAPPING_FLAG_NO_REMAPPING;
+
+	output_pin->snoopable = true;
+	output_pin->error_handling_enable = false;
+	output_pin->sensor_type = isys->sensor_type++;
+	if (isys->sensor_type > isys->pdata->ipdata->sensor_type_end)
+		isys->sensor_type = isys->pdata->ipdata->sensor_type_start;
+
+	return 0;
+}
+
+int ipu6_fw_isys_prepare_stream_cfg(struct ipu6_isys_video *av,
+				    struct isys_fw_msgs *msg)
+{
+	struct ipu6_fw_isys_stream_cfg_data_abi *stream_cfg;
+	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct ipu6_isys_stream *stream = av->stream;
+	struct ipu6_isys_queue *aq;
+
+	stream_cfg = &msg->ipu6.stream;
+	stream_cfg->src = stream->stream_source;
+	stream_cfg->vc = stream->vc;
+	stream_cfg->isl_use = 0;
+	stream_cfg->sensor_type = IPU6_FW_ISYS_SENSOR_MODE_NORMAL;
+
+	list_for_each_entry(aq, &stream->queues, node) {
+		struct ipu6_isys_video *__av = ipu6_isys_queue_to_video(aq);
+		int ret;
+
+		ret = ipu6_isys_fw_pin_cfg(__av, stream_cfg);
+		if (ret < 0)
+			return ret;
+	}
+
+	ipu6_fw_isys_dump_stream_cfg(dev, msg);
+
+	stream->nr_output_pins = stream_cfg->nof_output_pins;
+
+	return 0;
+}
+
+int ipu6_fw_isys_stream_open(struct ipu6_isys *isys,
+			     const unsigned int stream_handle,
+			     struct isys_fw_msgs *msg)
+{
+	return ipu6_fw_isys_complex_cmd(isys, stream_handle,
+				       &msg->ipu6.stream, msg->dma_addr,
+				       sizeof(msg->ipu6.stream),
+				       IPU6_FW_ISYS_SEND_TYPE_STREAM_OPEN);
+}
+
+int ipu6_fw_isys_stream_close(struct ipu6_isys *isys,
+			      const unsigned int stream_handle)
+{
+	return ipu6_fw_isys_complex_cmd(isys, stream_handle, NULL, 0, 0,
+					IPU6_FW_ISYS_SEND_TYPE_STREAM_CLOSE);
+}
+
+int ipu6_fw_isys_stream_flush(struct ipu6_isys *isys,
+			      const unsigned int stream_handle)
+{
+	return ipu6_fw_isys_complex_cmd(isys, stream_handle, NULL, 0, 0,
+				      IPU6_FW_ISYS_SEND_TYPE_STREAM_FLUSH);
+}
+
+int ipu6_fw_isys_stream_start(struct ipu6_isys *isys,
+			      const unsigned int stream_handle,
+			      struct isys_fw_msgs *msg, bool capture)
+{
+	u16 cmd_type;
+
+	if (capture)
+		cmd_type = IPU6_FW_ISYS_SEND_TYPE_STREAM_START_AND_CAPTURE;
+	else
+		cmd_type = IPU6_FW_ISYS_SEND_TYPE_STREAM_START;
+
+	return ipu6_fw_isys_complex_cmd(isys, stream_handle,
+				       &msg->ipu6.stream, msg->dma_addr,
+				       sizeof(msg->ipu6.stream), cmd_type);
+}
+
+int ipu6_fw_isys_stream_capture(struct ipu6_isys *isys,
+				const unsigned int stream_handle,
+				struct isys_fw_msgs *msg)
+{
+	return ipu6_fw_isys_complex_cmd(isys, stream_handle,
+				       &msg->ipu6.stream, msg->dma_addr,
+				       sizeof(msg->ipu6.stream),
+				       IPU6_FW_ISYS_SEND_TYPE_STREAM_CAPTURE);
+}
+
+static void
+ipu6_isys_buf_to_fw_frame_buf_pin(struct vb2_buffer *vb,
+				  struct ipu6_fw_isys_frame_buff_set_abi *set)
+{
+	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vvb = to_vb2_v4l2_buffer(vb);
+	struct ipu6_isys_video_buffer *ivb =
+		vb2_buffer_to_ipu6_isys_video_buffer(vvb);
+
+	set->output_pins[aq->fw_output].addr = ivb->dma_addr;
+	set->output_pins[aq->fw_output].out_buf_id = vb->index + 1;
+}
+
+/*
+ * Convert a buffer list to a isys fw ABI framebuffer set. The
+ * buffer list is not modified.
+ */
+#define IPU6_ISYS_FRAME_NUM_THRESHOLD  (30)
+void
+ipu6_fw_isys_prepare_buf_set(struct isys_fw_msgs *msg,
+			     struct ipu6_isys_stream *stream,
+			     struct ipu6_isys_buffer_list *bl)
+{
+	struct ipu6_fw_isys_frame_buff_set_abi *set = &msg->ipu6.frame;
+	struct ipu6_isys_buffer *ib;
+
+	WARN_ON(!bl->nbufs);
+
+	set->send_irq_sof = 1;
+	set->send_resp_sof = 1;
+	set->send_irq_eof = 0;
+	set->send_resp_eof = 0;
+
+	if (stream->streaming)
+		set->send_irq_capture_ack = 0;
+	else
+		set->send_irq_capture_ack = 1;
+	set->send_irq_capture_done = 0;
+
+	set->send_resp_capture_ack = 1;
+	set->send_resp_capture_done = 1;
+	if (atomic_read(&stream->sequence) >= IPU6_ISYS_FRAME_NUM_THRESHOLD) {
+		set->send_resp_capture_ack = 0;
+		set->send_resp_capture_done = 0;
+	}
+
+	list_for_each_entry(ib, &bl->head, head) {
+		struct vb2_buffer *vb = ipu6_isys_buffer_to_vb2_buffer(ib);
+
+		ipu6_isys_buf_to_fw_frame_buf_pin(vb, set);
+	}
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
index f65461a4c907..6ab70d1f2c6c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
@@ -8,6 +8,10 @@
 
 struct device;
 struct ipu6_isys;
+struct ipu6_isys_video;
+struct isys_fw_msgs;
+struct ipu6_isys_stream;
+struct ipu6_isys_buffer_list;
 
 /* Max number of Input/Output Pins */
 #define IPU6_MAX_IPINS 4
@@ -555,21 +559,8 @@ struct ipu6_fw_proxy_send_queue_token {
 	u32 value;
 };
 
-void
-ipu6_fw_isys_dump_stream_cfg(struct device *dev,
-			     struct ipu6_fw_isys_stream_cfg_data_abi *cfg);
-void
-ipu6_fw_isys_dump_frame_buff_set(struct device *dev,
-				 struct ipu6_fw_isys_frame_buff_set_abi *buf,
-				 unsigned int outputs);
 int ipu6_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams);
 int ipu6_fw_isys_close(struct ipu6_isys *isys);
-int ipu6_fw_isys_simple_cmd(struct ipu6_isys *isys,
-			    const unsigned int stream_handle, u16 send_type);
-int ipu6_fw_isys_complex_cmd(struct ipu6_isys *isys,
-			     const unsigned int stream_handle,
-			     void *cpu_mapped_buf, dma_addr_t dma_mapped_buf,
-			     size_t size, u16 send_type);
 int ipu6_fw_isys_send_proxy_token(struct ipu6_isys *isys,
 				  unsigned int req_id,
 				  unsigned int index,
@@ -581,4 +572,30 @@ void ipu6_fw_isys_put_resp(struct ipu6_isys *isys);
 int ipu6_isys_isr_one(struct ipu6_bus_device *adev);
 irqreturn_t ipu6_isys_isr(struct ipu6_bus_device *adev);
 
+int ipu6_fw_isys_stream_open(struct ipu6_isys *isys,
+			     const unsigned int stream_handle,
+			     struct isys_fw_msgs *msg);
+int ipu6_fw_isys_stream_close(struct ipu6_isys *isys,
+			     const unsigned int stream_handle);
+int ipu6_fw_isys_stream_flush(struct ipu6_isys *isys,
+			      const unsigned int stream_handle);
+int ipu6_fw_isys_stream_start(struct ipu6_isys *isys,
+			     const unsigned int stream_handle,
+			     struct isys_fw_msgs *msg,
+			     bool capture);
+int ipu6_fw_isys_stream_capture(struct ipu6_isys *isys,
+				const unsigned int stream_handle,
+				struct isys_fw_msgs *msg);
+int ipu6_fw_isys_prepare_stream_cfg(struct ipu6_isys_video *av,
+				    struct isys_fw_msgs *msg);
+void
+ipu6_fw_isys_prepare_buf_set(struct isys_fw_msgs *msg,
+			     struct ipu6_isys_stream *stream,
+			     struct ipu6_isys_buffer_list *bl);
+void
+ipu6_fw_isys_dump_stream_cfg(struct device *dev, struct isys_fw_msgs *set);
+void
+ipu6_fw_isys_dump_frame_buff_set(struct device *dev, struct isys_fw_msgs *set,
+				 unsigned int outputs);
+
 #endif
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 529973860e9e..9f6f283600c8 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -233,58 +233,6 @@ static int buffer_list_get(struct ipu6_isys_stream *stream,
 	return 0;
 }
 
-static void
-ipu6_isys_buf_to_fw_frame_buf_pin(struct vb2_buffer *vb,
-				  struct ipu6_fw_isys_frame_buff_set_abi *set)
-{
-	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
-	struct vb2_v4l2_buffer *vvb = to_vb2_v4l2_buffer(vb);
-	struct ipu6_isys_video_buffer *ivb =
-		vb2_buffer_to_ipu6_isys_video_buffer(vvb);
-
-	set->output_pins[aq->fw_output].addr = ivb->dma_addr;
-	set->output_pins[aq->fw_output].out_buf_id = vb->index + 1;
-}
-
-/*
- * Convert a buffer list to a isys fw ABI framebuffer set. The
- * buffer list is not modified.
- */
-#define IPU6_ISYS_FRAME_NUM_THRESHOLD  (30)
-void
-ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
-			      struct ipu6_isys_stream *stream,
-			      struct ipu6_isys_buffer_list *bl)
-{
-	struct ipu6_isys_buffer *ib;
-
-	WARN_ON(!bl->nbufs);
-
-	set->send_irq_sof = 1;
-	set->send_resp_sof = 1;
-	set->send_irq_eof = 0;
-	set->send_resp_eof = 0;
-
-	if (stream->streaming)
-		set->send_irq_capture_ack = 0;
-	else
-		set->send_irq_capture_ack = 1;
-	set->send_irq_capture_done = 0;
-
-	set->send_resp_capture_ack = 1;
-	set->send_resp_capture_done = 1;
-	if (atomic_read(&stream->sequence) >= IPU6_ISYS_FRAME_NUM_THRESHOLD) {
-		set->send_resp_capture_ack = 0;
-		set->send_resp_capture_done = 0;
-	}
-
-	list_for_each_entry(ib, &bl->head, head) {
-		struct vb2_buffer *vb = ipu6_isys_buffer_to_vb2_buffer(ib);
-
-		ipu6_isys_buf_to_fw_frame_buf_pin(vb, set);
-	}
-}
-
 /* Start streaming for real. The buffer list must be available. */
 static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 				  struct ipu6_isys_buffer_list *bl)
@@ -304,9 +252,7 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 	bl = &__bl;
 
 	do {
-		struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
 		struct isys_fw_msgs *msg;
-		u16 send_type = IPU6_FW_ISYS_SEND_TYPE_STREAM_CAPTURE;
 
 		ret = buffer_list_get(stream, bl);
 		if (ret < 0)
@@ -316,16 +262,14 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 		if (!msg)
 			return -ENOMEM;
 
-		buf = &msg->ipu6.frame;
-		ipu6_isys_buf_to_fw_frame_buf(buf, stream, bl);
-		ipu6_fw_isys_dump_frame_buff_set(dev, buf,
+		ipu6_fw_isys_prepare_buf_set(msg, stream, bl);
+		ipu6_fw_isys_dump_frame_buff_set(dev, msg,
 						 stream->nr_output_pins);
 		ipu6_isys_buffer_list_queue(bl, IPU6_ISYS_BUFFER_LIST_FL_ACTIVE,
 					    0);
-		ret = ipu6_fw_isys_complex_cmd(stream->isys,
-					       stream->stream_handle, buf,
-					       msg->dma_addr, sizeof(*buf),
-					       send_type);
+
+		ret = ipu6_fw_isys_stream_capture(stream->isys,
+						  stream->stream_handle, msg);
 	} while (!WARN_ON(ret));
 
 	return 0;
@@ -349,7 +293,6 @@ static void buf_queue(struct vb2_buffer *vb)
 		vb2_buffer_to_ipu6_isys_video_buffer(vvb);
 	struct ipu6_isys_buffer *ib = &ivb->ib;
 	struct device *dev = &av->isys->adev->auxdev.dev;
-	struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
 	struct ipu6_isys_stream *stream = av->stream;
 	struct ipu6_isys_buffer_list bl;
 	struct isys_fw_msgs *msg;
@@ -396,9 +339,8 @@ static void buf_queue(struct vb2_buffer *vb)
 		goto out;
 	}
 
-	buf = &msg->ipu6.frame;
-	ipu6_isys_buf_to_fw_frame_buf(buf, stream, &bl);
-	ipu6_fw_isys_dump_frame_buff_set(dev, buf, stream->nr_output_pins);
+	ipu6_fw_isys_prepare_buf_set(msg, stream, &bl);
+	ipu6_fw_isys_dump_frame_buff_set(dev, msg, stream->nr_output_pins);
 
 	/*
 	 * We must queue the buffers in the buffer list to the
@@ -408,9 +350,8 @@ static void buf_queue(struct vb2_buffer *vb)
 	 */
 	ipu6_isys_buffer_list_queue(&bl, IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
 
-	ret = ipu6_fw_isys_complex_cmd(stream->isys, stream->stream_handle,
-				       buf, msg->dma_addr, sizeof(*buf),
-				       IPU6_FW_ISYS_SEND_TYPE_STREAM_CAPTURE);
+	ret = ipu6_fw_isys_stream_capture(stream->isys, stream->stream_handle,
+					  msg);
 	if (ret < 0)
 		dev_err(dev, "send stream capture failed\n");
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
index dec1fed44dd2..51de14183ccf 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
@@ -60,10 +60,6 @@ struct ipu6_isys_buffer_list {
 void ipu6_isys_buffer_list_queue(struct ipu6_isys_buffer_list *bl,
 				 unsigned long op_flags,
 				 enum vb2_buffer_state state);
-void
-ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
-			      struct ipu6_isys_stream *stream,
-			      struct ipu6_isys_buffer_list *bl);
 void ipu6_isys_queue_buf_ready(struct ipu6_isys_stream *stream,
 			       struct ipu6_fw_isys_resp_info_abi *info);
 int ipu6_isys_queue_init(struct ipu6_isys_queue *aq);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index fabea6a75d7d..f8f1d400d9f7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -450,115 +450,28 @@ static void put_stream_opened(struct ipu6_isys_video *av)
 	spin_unlock_irqrestore(&av->isys->streams_lock, flags);
 }
 
-static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
-				struct ipu6_fw_isys_stream_cfg_data_abi *cfg)
-{
-	struct media_pad *src_pad = media_pad_remote_pad_first(&av->pad);
-	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(src_pad->entity);
-	struct v4l2_subdev_state *state = v4l2_subdev_get_locked_active_state(sd);
-	struct ipu6_fw_isys_input_pin_info_abi *input_pin;
-	struct ipu6_fw_isys_output_pin_info_abi *output_pin;
-	struct ipu6_isys_stream *stream = av->stream;
-	struct ipu6_isys_queue *aq = &av->aq;
-	struct v4l2_mbus_framefmt fmt;
-	const struct ipu6_isys_pixelformat *pfmt =
-		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
-	struct v4l2_rect v4l2_crop;
-	struct ipu6_isys *isys = av->isys;
-	int input_pins = cfg->nof_input_pins++;
-	int output_pins;
-	u32 src_stream;
-
-	src_stream = ipu6_isys_get_src_stream_by_src_pad(sd, src_pad->index);
-	fmt = *v4l2_subdev_state_get_format(state, src_pad->index, src_stream);
-	v4l2_crop = *v4l2_subdev_state_get_crop(state, src_pad->index, src_stream);
-
-	input_pin = &cfg->input_pins[input_pins];
-	input_pin->input_res.width = fmt.width;
-	input_pin->input_res.height = fmt.height;
-	input_pin->dt = av->dt;
-	input_pin->bits_per_pix = pfmt->bpp_packed;
-	input_pin->mapped_dt = 0x40; /* invalid mipi data type */
-	input_pin->mipi_decompression = 0;
-	input_pin->capture_mode = IPU6_FW_ISYS_CAPTURE_MODE_REGULAR;
-	input_pin->mipi_store_mode = pfmt->bpp == pfmt->bpp_packed ?
-		IPU6_FW_ISYS_MIPI_STORE_MODE_DISCARD_LONG_HEADER :
-		IPU6_FW_ISYS_MIPI_STORE_MODE_NORMAL;
-	input_pin->crop_first_and_last_lines = v4l2_crop.top & 1;
-
-	output_pins = cfg->nof_output_pins++;
-	aq->fw_output = output_pins;
-	stream->output_pins_queue[output_pins] = aq;
-
-	output_pin = &cfg->output_pins[output_pins];
-	output_pin->input_pin_id = input_pins;
-	output_pin->output_res.width = ipu6_isys_get_frame_width(av);
-	output_pin->output_res.height = ipu6_isys_get_frame_height(av);
-
-	output_pin->stride = ipu6_isys_get_bytes_per_line(av);
-	if (pfmt->bpp != pfmt->bpp_packed)
-		output_pin->pt = IPU6_FW_ISYS_PIN_TYPE_RAW_SOC;
-	else
-		output_pin->pt = IPU6_FW_ISYS_PIN_TYPE_MIPI;
-	output_pin->ft = pfmt->css_pixelformat;
-	output_pin->send_irq = 1;
-	memset(output_pin->ts_offsets, 0, sizeof(output_pin->ts_offsets));
-	output_pin->s2m_pixel_soc_pixel_remapping =
-		S2M_PIXEL_SOC_PIXEL_REMAPPING_FLAG_NO_REMAPPING;
-	output_pin->csi_be_soc_pixel_remapping =
-		CSI_BE_SOC_PIXEL_REMAPPING_FLAG_NO_REMAPPING;
-
-	output_pin->snoopable = true;
-	output_pin->error_handling_enable = false;
-	output_pin->sensor_type = isys->sensor_type++;
-	if (isys->sensor_type > isys->pdata->ipdata->sensor_type_end)
-		isys->sensor_type = isys->pdata->ipdata->sensor_type_start;
-
-	return 0;
-}
-
 static int start_stream_firmware(struct ipu6_isys_video *av,
 				 struct ipu6_isys_buffer_list *bl)
 {
-	struct ipu6_fw_isys_stream_cfg_data_abi *stream_cfg;
-	struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
 	struct ipu6_isys_stream *stream = av->stream;
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	struct isys_fw_msgs *msg = NULL;
-	struct ipu6_isys_queue *aq;
 	int ret, retout, tout;
-	u16 send_type;
+	bool capture = bl ? true : false;
 
 	msg = ipu6_get_fw_msg_buf(stream);
 	if (!msg)
 		return -ENOMEM;
 
-	stream_cfg = &msg->ipu6.stream;
-	stream_cfg->src = stream->stream_source;
-	stream_cfg->vc = stream->vc;
-	stream_cfg->isl_use = 0;
-	stream_cfg->sensor_type = IPU6_FW_ISYS_SENSOR_MODE_NORMAL;
-
-	list_for_each_entry(aq, &stream->queues, node) {
-		struct ipu6_isys_video *__av = ipu6_isys_queue_to_video(aq);
-
-		ret = ipu6_isys_fw_pin_cfg(__av, stream_cfg);
-		if (ret < 0) {
-			ipu6_put_fw_msg_buf(av->isys, msg);
-			return ret;
-		}
+	ret = ipu6_fw_isys_prepare_stream_cfg(av, msg);
+	if (ret < 0) {
+		ipu6_put_fw_msg_buf(av->isys, msg);
+		return ret;
 	}
 
-	ipu6_fw_isys_dump_stream_cfg(dev, stream_cfg);
-
-	stream->nr_output_pins = stream_cfg->nof_output_pins;
-
 	reinit_completion(&stream->stream_open_completion);
 
-	ret = ipu6_fw_isys_complex_cmd(av->isys, stream->stream_handle,
-				       stream_cfg, msg->dma_addr,
-				       sizeof(*stream_cfg),
-				       IPU6_FW_ISYS_SEND_TYPE_STREAM_OPEN);
+	ret = ipu6_fw_isys_stream_open(av->isys, stream->stream_handle, msg);
 	if (ret < 0) {
 		dev_err(dev, "can't open stream (%d)\n", ret);
 		ipu6_put_fw_msg_buf(av->isys, msg);
@@ -590,26 +503,16 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 			ret = -ENOMEM;
 			goto out_put_stream_opened;
 		}
-		buf = &msg->ipu6.frame;
-		ipu6_isys_buf_to_fw_frame_buf(buf, stream, bl);
+
+		ipu6_fw_isys_prepare_buf_set(msg, stream, bl);
 		ipu6_isys_buffer_list_queue(bl,
 					    IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
 	}
 
 	reinit_completion(&stream->stream_start_completion);
 
-	if (bl) {
-		send_type = IPU6_FW_ISYS_SEND_TYPE_STREAM_START_AND_CAPTURE;
-		ipu6_fw_isys_dump_frame_buff_set(dev, buf,
-						 stream_cfg->nof_output_pins);
-		ret = ipu6_fw_isys_complex_cmd(av->isys, stream->stream_handle,
-					       buf, msg->dma_addr,
-					       sizeof(*buf), send_type);
-	} else {
-		send_type = IPU6_FW_ISYS_SEND_TYPE_STREAM_START;
-		ret = ipu6_fw_isys_simple_cmd(av->isys, stream->stream_handle,
-					      send_type);
-	}
+	ret = ipu6_fw_isys_stream_start(av->isys, stream->stream_handle,
+						msg, capture);
 
 	if (ret < 0) {
 		dev_err(dev, "can't start streaming (%d)\n", ret);
@@ -635,9 +538,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 out_stream_close:
 	reinit_completion(&stream->stream_close_completion);
 
-	retout = ipu6_fw_isys_simple_cmd(av->isys,
-					 stream->stream_handle,
-					 IPU6_FW_ISYS_SEND_TYPE_STREAM_CLOSE);
+	retout = ipu6_fw_isys_stream_close(av->isys, stream->stream_handle);
 	if (retout < 0) {
 		dev_dbg(dev, "can't close stream (%d)\n", retout);
 		goto out_put_stream_opened;
@@ -666,9 +567,7 @@ static void stop_streaming_firmware(struct ipu6_isys_video *av)
 
 	reinit_completion(&stream->stream_stop_completion);
 
-	ret = ipu6_fw_isys_simple_cmd(av->isys, stream->stream_handle,
-				      IPU6_FW_ISYS_SEND_TYPE_STREAM_FLUSH);
-
+	ret = ipu6_fw_isys_stream_flush(av->isys, stream->stream_handle);
 	if (ret < 0) {
 		dev_err(dev, "can't stop stream (%d)\n", ret);
 		return;
@@ -692,8 +591,7 @@ static void close_streaming_firmware(struct ipu6_isys_video *av)
 
 	reinit_completion(&stream->stream_close_completion);
 
-	ret = ipu6_fw_isys_simple_cmd(av->isys, stream->stream_handle,
-				      IPU6_FW_ISYS_SEND_TYPE_STREAM_CLOSE);
+	ret = ipu6_fw_isys_stream_close(av->isys, stream->stream_handle);
 	if (ret < 0) {
 		dev_err(dev, "can't close stream (%d)\n", ret);
 		return;
-- 
2.54.0


