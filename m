Return-Path: <linux-media+bounces-66468-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6fm+MPXVR2pMgAAAu9opvQ
	(envelope-from <linux-media+bounces-66468-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:32:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BED7703E72
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:32:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=d7TtHuzM;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66468-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66468-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB45E303FDC0
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58174414DE5;
	Fri,  3 Jul 2026 15:25:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638543DB305
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092316; cv=none; b=a0rsEjvdAkvAcZT+/ByqieYcPCgY/zTjJokN5VsMBcORlZH9vc2RPK50aYp1SqMbqrVsbqS6+kmnM/owJlTS5cJcHPOm+4X5WQx0TsIOEHzBOanvRlAhiCICdrlDzo3O9hwEmAq4ZjfVkSacjxwoSZ+OXxfkkDqpGutsFfjwtLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092316; c=relaxed/simple;
	bh=E5YPL2h4XaD7AM9b+f4A9NN8TgEd462R1MFdVz6I4Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y745nqbPcCYOpjVsU4hT3dc4WX1DI1zFQbT1vEvzIWS5x9ZcqTYrXjylKUMATjYVblZrLFBFd52AmmX99g3KR6sNXL4RKI06scobAI4WjzTcE2/buWSz8bEMB/JvXHrHiB+mALNPlOU6vr/4K+DgAcelJlHnNp4kik+zUL/UXFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7TtHuzM; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092315; x=1814628315;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E5YPL2h4XaD7AM9b+f4A9NN8TgEd462R1MFdVz6I4Wo=;
  b=d7TtHuzM5weKg73M9OaRlgFNhrfbae7GveqllFyC3P8AxM4z1uzpOCX+
   NtAON13Xh39DTW4BJzzzEd18+khIlKd31g11a2LZdobBoc8PsFFHH00Ln
   04gruFL5SWbO2XhHQaS8LCQsVcSs3R9PE6BWmHIVgqjPuGjbG6YrhZEmK
   KfbCNV+Jv5K7TId8sIESXqHCN4krkUd2F1Sr8H0mgWjGz3aUDQME26AHK
   3nOKZ6JHKVNrrFzKYR4SlS9XhzBjHLNMR5t+r6IoO7FFlt9+1+MkTU56i
   yU1n7N/IognMdkBSCYwG8wdK8Cjyk8ZrIVKZM+/XFceeBTC3ii/v7DMEs
   w==;
X-CSE-ConnectionGUID: A9pmTDtZT7uNJNlgL6Bs6Q==
X-CSE-MsgGUID: S3Ep/0AkQrCftlZ3bS2z0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396114"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396114"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:15 -0700
X-CSE-ConnectionGUID: i4aL0EP+ScqtS82dt+B+ng==
X-CSE-MsgGUID: f7J08Iz8Te+jeGfJPh5pjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799466"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:13 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 02/41] media: ipu6: Rename pointer to firmware context
Date: Fri,  3 Jul 2026 18:24:12 +0300
Message-ID: <20260703152451.1743132-3-antti.laakso@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66468-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:mid,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BED7703E72

The name fwcom is used to refer firmware communication context
and firmware communication configuration. Try to avoid confusion
and rename context variable.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   | 56 ++++++++++---------
 .../media/pci/intel/ipu6/ipu6-isys-video.c    |  4 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  6 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  5 +-
 4 files changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
index 62ed92ff1d30..a65e9f1aa104 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -32,7 +32,7 @@ static int handle_proxy_response(struct ipu6_isys *isys, unsigned int req_id)
 	struct ipu6_fw_isys_proxy_resp_info_abi *resp;
 	int ret;
 
-	resp = ipu6_recv_get_token(isys->fwcom, IPU6_BASE_PROXY_RECV_QUEUES);
+	resp = ipu6_recv_get_token(isys->fwctx, IPU6_BASE_PROXY_RECV_QUEUES);
 	if (!resp)
 		return 1;
 
@@ -42,7 +42,7 @@ static int handle_proxy_response(struct ipu6_isys *isys, unsigned int req_id)
 
 	ret = req_id == resp->request_id ? 0 : -EIO;
 
-	ipu6_recv_put_token(isys->fwcom, IPU6_BASE_PROXY_RECV_QUEUES);
+	ipu6_recv_put_token(isys->fwctx, IPU6_BASE_PROXY_RECV_QUEUES);
 
 	return ret;
 }
@@ -52,7 +52,7 @@ int ipu6_fw_isys_send_proxy_token(struct ipu6_isys *isys,
 				  unsigned int index,
 				  unsigned int offset, u32 value)
 {
-	struct ipu6_fw_com_context *ctx = isys->fwcom;
+	struct ipu6_fw_com_context *ctx = isys->fwctx;
 	struct device *dev = &isys->adev->auxdev.dev;
 	struct ipu6_fw_proxy_send_queue_token *token;
 	unsigned int timeout = 1000;
@@ -96,7 +96,7 @@ int ipu6_fw_isys_complex_cmd(struct ipu6_isys *isys,
 			     dma_addr_t dma_mapped_buf,
 			     size_t size, u16 send_type)
 {
-	struct ipu6_fw_com_context *ctx = isys->fwcom;
+	struct ipu6_fw_com_context *ctx = isys->fwctx;
 	struct device *dev = &isys->adev->auxdev.dev;
 	struct ipu6_fw_send_queue_token *token;
 
@@ -138,7 +138,7 @@ int ipu6_fw_isys_close(struct ipu6_isys *isys)
 	struct device *dev = &isys->adev->auxdev.dev;
 	int retry = IPU6_ISYS_CLOSE_RETRY;
 	unsigned long flags;
-	void *fwcom;
+	void *fwctx;
 	int ret;
 
 	/*
@@ -148,9 +148,9 @@ int ipu6_fw_isys_close(struct ipu6_isys *isys)
 	 * spinlock to wait the interrupt handler to be finished
 	 */
 	spin_lock_irqsave(&isys->power_lock, flags);
-	ret = ipu6_fw_com_close(isys->fwcom);
-	fwcom = isys->fwcom;
-	isys->fwcom = NULL;
+	ret = ipu6_fw_com_close(isys->fwctx);
+	fwctx = isys->fwctx;
+	isys->fwctx = NULL;
 	spin_unlock_irqrestore(&isys->power_lock, flags);
 	if (ret)
 		dev_err(dev, "Device close failure: %d\n", ret);
@@ -158,14 +158,14 @@ int ipu6_fw_isys_close(struct ipu6_isys *isys)
 	/* release probably fails if the close failed. Let's try still */
 	do {
 		usleep_range(400, 500);
-		ret = ipu6_fw_com_release(fwcom, 0);
+		ret = ipu6_fw_com_release(fwctx, 0);
 		retry--;
 	} while (ret && retry);
 
 	if (ret) {
 		dev_err(dev, "Device release time out %d\n", ret);
 		spin_lock_irqsave(&isys->power_lock, flags);
-		isys->fwcom = fwcom;
+		isys->fwctx = fwctx;
 		spin_unlock_irqrestore(&isys->power_lock, flags);
 	}
 
@@ -176,11 +176,11 @@ void ipu6_fw_isys_cleanup(struct ipu6_isys *isys)
 {
 	int ret;
 
-	ret = ipu6_fw_com_release(isys->fwcom, 1);
+	ret = ipu6_fw_com_release(isys->fwctx, 1);
 	if (ret < 0)
 		dev_warn(&isys->adev->auxdev.dev,
 			 "Device busy, fw_com release failed.");
-	isys->fwcom = NULL;
+	isys->fwctx = NULL;
 }
 
 static void start_sp(struct ipu6_bus_device *adev)
@@ -212,7 +212,7 @@ static int query_sp(struct ipu6_bus_device *adev)
 }
 
 static int ipu6_isys_fwcom_cfg_init(struct ipu6_isys *isys,
-				    struct ipu6_fw_com_cfg *fwcom,
+				    struct ipu6_fw_com_cfg *fwcom_cfg,
 				    unsigned int num_streams)
 {
 	unsigned int max_send_queues, max_sram_blocks, max_devq_size;
@@ -258,14 +258,16 @@ static int ipu6_isys_fwcom_cfg_init(struct ipu6_isys *isys,
 	if (!output_queue_cfg)
 		return -ENOMEM;
 
-	fwcom->input = input_queue_cfg;
-	fwcom->output = output_queue_cfg;
+	fwcom_cfg->input = input_queue_cfg;
+	fwcom_cfg->output = output_queue_cfg;
 
-	fwcom->num_input_queues = isys_fw_cfg->num_send_queues[type_proxy] +
+	fwcom_cfg->num_input_queues =
+		isys_fw_cfg->num_send_queues[type_proxy] +
 		isys_fw_cfg->num_send_queues[type_dev] +
 		isys_fw_cfg->num_send_queues[type_msg];
 
-	fwcom->num_output_queues = isys_fw_cfg->num_recv_queues[type_proxy] +
+	fwcom_cfg->num_output_queues =
+		isys_fw_cfg->num_recv_queues[type_proxy] +
 		isys_fw_cfg->num_recv_queues[type_dev] +
 		isys_fw_cfg->num_recv_queues[type_msg];
 
@@ -280,7 +282,7 @@ static int ipu6_isys_fwcom_cfg_init(struct ipu6_isys *isys,
 			isys_fw_cfg->buffer_partition.num_gda_pages[i] = 0;
 	}
 
-	/* FW assumes proxy interface at fwcom queue 0 */
+	/* FW assumes proxy interface at fwcom_cfg queue 0 */
 	for (i = 0; i < isys_fw_cfg->num_send_queues[type_proxy]; i++) {
 		input_queue_cfg[i].token_size =
 			sizeof(struct ipu6_fw_proxy_send_queue_token);
@@ -314,9 +316,9 @@ static int ipu6_isys_fwcom_cfg_init(struct ipu6_isys *isys,
 			IPU6_ISYS_SIZE_RECV_QUEUE;
 	}
 
-	fwcom->dmem_addr = isys->pdata->ipdata->hw_variant.dmem_offset;
-	fwcom->specific_addr = isys_fw_cfg;
-	fwcom->specific_size = sizeof(*isys_fw_cfg);
+	fwcom_cfg->dmem_addr = isys->pdata->ipdata->hw_variant.dmem_offset;
+	fwcom_cfg->specific_addr = isys_fw_cfg;
+	fwcom_cfg->specific_size = sizeof(*isys_fw_cfg);
 
 	return 0;
 }
@@ -325,23 +327,23 @@ int ipu6_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 {
 	struct device *dev = &isys->adev->auxdev.dev;
 	int retry = IPU6_ISYS_OPEN_RETRY;
-	struct ipu6_fw_com_cfg fwcom = {
+	struct ipu6_fw_com_cfg fwcom_cfg = {
 		.cell_start = start_sp,
 		.cell_ready = query_sp,
 		.buttress_boot_offset = SYSCOM_BUTTRESS_FW_PARAMS_ISYS_OFFSET,
 	};
 	int ret;
 
-	ipu6_isys_fwcom_cfg_init(isys, &fwcom, num_streams);
+	ipu6_isys_fwcom_cfg_init(isys, &fwcom_cfg, num_streams);
 
-	isys->fwcom = ipu6_fw_com_prepare(&fwcom, isys->adev,
+	isys->fwctx = ipu6_fw_com_prepare(&fwcom_cfg, isys->adev,
 					  isys->pdata->base);
-	if (!isys->fwcom) {
+	if (!isys->fwctx) {
 		dev_err(dev, "isys fw com prepare failed\n");
 		return -EIO;
 	}
 
-	ret = ipu6_fw_com_open(isys->fwcom);
+	ret = ipu6_fw_com_open(isys->fwctx);
 	if (ret) {
 		dev_err(dev, "isys fw com open failed %d\n", ret);
 		return ret;
@@ -349,7 +351,7 @@ int ipu6_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 
 	do {
 		usleep_range(400, 500);
-		if (ipu6_fw_com_ready(isys->fwcom))
+		if (ipu6_fw_com_ready(isys->fwctx))
 			break;
 		retry--;
 	} while (retry > 0);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 3ac48d2076da..89eb265737d7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -1114,7 +1114,7 @@ int ipu6_isys_fw_open(struct ipu6_isys *isys)
 	 */
 	ipu6_cleanup_fw_msg_bufs(isys);
 
-	if (isys->fwcom) {
+	if (isys->fwctx) {
 		/*
 		 * Something went wrong in previous shutdown. As we are now
 		 * restarting isys we can safely delete old context.
@@ -1147,7 +1147,7 @@ void ipu6_isys_fw_close(struct ipu6_isys *isys)
 	isys->ref_count--;
 	if (!isys->ref_count) {
 		ipu6_fw_isys_close(isys);
-		if (isys->fwcom) {
+		if (isys->fwctx) {
 			isys->need_reset = true;
 			dev_warn(&isys->adev->auxdev.dev,
 				 "failed to close fw isys\n");
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 0789f5d6a581..06b0a950499c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1211,10 +1211,10 @@ static int isys_isr_one(struct ipu6_bus_device *adev)
 	u32 index;
 	u64 ts;
 
-	if (!isys->fwcom)
+	if (!isys->fwctx)
 		return 1;
 
-	resp = ipu6_fw_isys_get_resp(isys->fwcom, IPU6_BASE_MSG_RECV_QUEUES);
+	resp = ipu6_fw_isys_get_resp(isys->fwctx, IPU6_BASE_MSG_RECV_QUEUES);
 	if (!resp)
 		return 1;
 
@@ -1323,7 +1323,7 @@ static int isys_isr_one(struct ipu6_bus_device *adev)
 
 	ipu6_isys_put_stream(stream);
 leave:
-	ipu6_fw_isys_put_resp(isys->fwcom, IPU6_BASE_MSG_RECV_QUEUES);
+	ipu6_fw_isys_put_resp(isys->fwctx, IPU6_BASE_MSG_RECV_QUEUES);
 	return 0;
 }
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index 7fb8cb820912..0b139ab24431 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -114,8 +114,7 @@ struct sensor_async_sd {
  * @csi2_rx_ctrl_cached: cached shared value between all CSI2 receivers
  * @streams_lock: serialise access to streams
  * @streams: streams per firmware stream ID
- * @fwcom: fw communication layer private pointer
- *         or optional external library private pointer
+ * @fwctx: fw communication layer context pointer
  * @phy_termcal_val: the termination calibration value, only used for DWC PHY
  * @need_reset: Isys requires d0i0->i3 transition
  * @ref_count: total number of callers fw open
@@ -136,7 +135,7 @@ struct ipu6_isys {
 	spinlock_t streams_lock;
 	struct ipu6_isys_stream streams[IPU6_ISYS_MAX_STREAMS];
 	int streams_ref_count[IPU6_ISYS_MAX_STREAMS];
-	void *fwcom;
+	void *fwctx;
 	u32 phy_termcal_val;
 	bool need_reset;
 	bool icache_prefetch;
-- 
2.54.0


