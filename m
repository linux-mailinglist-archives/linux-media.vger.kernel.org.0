Return-Path: <linux-media+bounces-66487-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dtxPD5bUR2qhfwAAu9opvQ
	(envelope-from <linux-media+bounces-66487-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6565B703D52
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=mK5jRkIW;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66487-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66487-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 084AB3035EEE
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63977417340;
	Fri,  3 Jul 2026 15:26:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7303416D13
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092361; cv=none; b=A/zsAwecc9VQlW4yLsyaqIvrVTO4+89wGT5jqL//XUeaFeC2ZmmeiERiJWSuUpgQ5reqEZxxxNhpFlB36gHa2lo2CMJzE/rQ6cn4yLwjp321cwfUwakHXYEkNZ3+WKRlSzHx+4b7hMdd1H4o0Aw0Q21TMrn8fe9dFJFE8RjWB38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092361; c=relaxed/simple;
	bh=tKbU3k09O9/my5Sri8IIphmncQx9G6pxNHuJCeNczC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EVy7OJlZU0h7BFRY8XVbpy6bfeAcIPjkpTrp2uQb/kg/vyK+bDPlxqdsoQYjz5vAk66bPGjbMI6CnUsAuWwpi8+QFB/Kku79HprWn6+9aoes93NqyuQsLilD2nb2eEAZRTKzzsp8Mi4EJsDuKwDFjNayBsB7E9iu7yshkwHXTz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mK5jRkIW; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092360; x=1814628360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tKbU3k09O9/my5Sri8IIphmncQx9G6pxNHuJCeNczC4=;
  b=mK5jRkIWlf/CyfC1OpFCRVD7KDaqqkARDl82fqrChLCOVVv6wYogQHzY
   s24sSk5Wq+O0TJb7f0l+qEkPd5iTIjQ8EdHe86IxtdChkJLRyu/C7R9eF
   x+B5y7WIupc+YR3uIm1vVZWM5BOEEAYgz+BTLd+Ifs1ENGyj/u33YJoxo
   OI5qY4g1E3Bwldg4Dsa/6b/SVlV9oLCGl4TFdJFDkOMDTkJfOQsqL+mFu
   +5w0Mpwjo8jCKAo00NtY54OUEjTRHJ+Uv3DooBwW2HNH3lhPSRyOlv7XD
   koPbfWYg/WBaMNiqcQ293sLrYcD1QtJ3Imp+KEFRVkTb9VdFC18yyqBIy
   g==;
X-CSE-ConnectionGUID: D32Rwq3jSZyfE5SUJvKZfg==
X-CSE-MsgGUID: 5wl+8ZyxQFK4EXif9scdJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396196"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396196"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:59 -0700
X-CSE-ConnectionGUID: Ahqh5xifQlOcMt9KPosBQA==
X-CSE-MsgGUID: vnM0sXMeRP+83BNSqaEk+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799679"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:58 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 21/41] media: ipu6: Add isys firmware ops
Date: Fri,  3 Jul 2026 18:24:31 +0300
Message-ID: <20260703152451.1743132-22-antti.laakso@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66487-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime,intel.com:email,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6565B703D52

Add struct for ipu6 firmware ops. This is a preparation to
add support for ipu7 firmware communication.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-bus.h       |  3 +
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   | 72 +++++++++++--------
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h   | 39 +---------
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 24 ++++---
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 35 +++++----
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  1 +
 drivers/media/pci/intel/ipu6/ipu6-isys.h      | 32 +++++++++
 7 files changed, 116 insertions(+), 90 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-bus.h b/drivers/media/pci/intel/ipu6/ipu6-bus.h
index a08c5468d536..62aa2b090699 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-bus.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-bus.h
@@ -37,6 +37,7 @@ struct ipu6_auxdrv_data {
 	irqreturn_t (*isr)(struct ipu6_bus_device *adev);
 	irqreturn_t (*isr_threaded)(struct ipu6_bus_device *adev);
 	bool wake_isr_thread;
+	const struct ipu6_fw_isys_ops *fw_ops;
 };
 
 #define to_ipu6_bus_device(_dev) \
@@ -45,6 +46,8 @@ struct ipu6_auxdrv_data {
 	container_of(_auxdev, struct ipu6_bus_device, auxdev)
 #define ipu6_bus_get_drvdata(adev) dev_get_drvdata(&(adev)->auxdev.dev)
 
+extern const struct ipu6_fw_isys_ops ipu6_fw_isys_ops;
+
 struct ipu6_bus_device *
 ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
 			   void *pdata, const struct ipu6_buttress_ctrl *ctrl,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
index 7bcb36e47b23..06075fa0a90a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -126,7 +126,7 @@ static int ipu6_fw_isys_complex_cmd(struct ipu6_isys *isys,
 	return 0;
 }
 
-int ipu6_fw_isys_close(struct ipu6_isys *isys)
+static int ipu6_fw_isys_close(struct ipu6_isys *isys)
 {
 	struct device *dev = &isys->adev->auxdev.dev;
 	int retry = IPU6_ISYS_CLOSE_RETRY;
@@ -165,7 +165,7 @@ int ipu6_fw_isys_close(struct ipu6_isys *isys)
 	return ret;
 }
 
-void ipu6_fw_isys_cleanup(struct ipu6_isys *isys)
+static void ipu6_fw_isys_cleanup(struct ipu6_isys *isys)
 {
 	int ret;
 
@@ -316,7 +316,7 @@ static int ipu6_isys_fwcom_cfg_init(struct ipu6_isys *isys,
 	return 0;
 }
 
-int ipu6_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
+static int ipu6_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 {
 	struct device *dev = &isys->adev->auxdev.dev;
 	int retry = IPU6_ISYS_OPEN_RETRY;
@@ -358,18 +358,19 @@ int ipu6_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 	return ret;
 }
 
-struct ipu6_fw_isys_resp_info_abi *
+static struct ipu6_fw_isys_resp_info_abi *
 ipu6_fw_isys_get_resp(struct ipu6_isys *isys)
 {
 	return ipu6_recv_get_token(isys->fwctx, IPU6_BASE_MSG_RECV_QUEUES);
 }
 
-void ipu6_fw_isys_put_resp(struct ipu6_isys *isys)
+static void ipu6_fw_isys_put_resp(struct ipu6_isys *isys)
 {
 	ipu6_recv_put_token(isys->fwctx, IPU6_BASE_MSG_RECV_QUEUES);
 }
 
-void ipu6_fw_isys_dump_stream_cfg(struct device *dev, struct isys_fw_msgs *msg)
+static void ipu6_fw_isys_dump_stream_cfg(struct device *dev,
+				    struct isys_fw_msgs *msg)
 {
 	struct ipu6_fw_isys_stream_cfg_data_abi *cfg;
 	unsigned int i;
@@ -448,9 +449,9 @@ void ipu6_fw_isys_dump_stream_cfg(struct device *dev, struct isys_fw_msgs *msg)
 	dev_dbg(dev, "-----------------------------------------------------\n");
 }
 
-void
-ipu6_fw_isys_dump_frame_buff_set(struct device *dev, struct isys_fw_msgs *msg,
-				 unsigned int outputs)
+static void
+ipu6_fw_isys_dump_frame_buf_set(struct device *dev, struct isys_fw_msgs *msg,
+				unsigned int outputs)
 {
 	struct ipu6_fw_isys_frame_buff_set_abi *buf;
 	unsigned int i;
@@ -485,7 +486,6 @@ ipu6_fw_isys_dump_frame_buff_set(struct device *dev, struct isys_fw_msgs *msg,
 	dev_dbg(dev, "-----------------------------------------------------\n");
 }
 
-
 struct fwmsg {
 	int type;
 	char *msg;
@@ -816,8 +816,8 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 	return 0;
 }
 
-int ipu6_fw_isys_prepare_stream_cfg(struct ipu6_isys_video *av,
-				    struct isys_fw_msgs *msg)
+static int ipu6_fw_isys_prepare_stream_cfg(struct ipu6_isys_video *av,
+					     struct isys_fw_msgs *msg)
 {
 	struct ipu6_fw_isys_stream_cfg_data_abi *stream_cfg;
 	struct device *dev = &av->isys->adev->auxdev.dev;
@@ -846,9 +846,9 @@ int ipu6_fw_isys_prepare_stream_cfg(struct ipu6_isys_video *av,
 	return 0;
 }
 
-int ipu6_fw_isys_stream_open(struct ipu6_isys *isys,
-			     const unsigned int stream_handle,
-			     struct isys_fw_msgs *msg)
+static int ipu6_fw_isys_stream_open(struct ipu6_isys *isys,
+				      const unsigned int stream_handle,
+				      struct isys_fw_msgs *msg)
 {
 	return ipu6_fw_isys_complex_cmd(isys, stream_handle,
 				       &msg->ipu6.stream, msg->dma_addr,
@@ -856,23 +856,23 @@ int ipu6_fw_isys_stream_open(struct ipu6_isys *isys,
 				       IPU6_FW_ISYS_SEND_TYPE_STREAM_OPEN);
 }
 
-int ipu6_fw_isys_stream_close(struct ipu6_isys *isys,
-			      const unsigned int stream_handle)
+static int ipu6_fw_isys_stream_close(struct ipu6_isys *isys,
+				     const unsigned int stream_handle)
 {
 	return ipu6_fw_isys_complex_cmd(isys, stream_handle, NULL, 0, 0,
 					IPU6_FW_ISYS_SEND_TYPE_STREAM_CLOSE);
 }
 
-int ipu6_fw_isys_stream_flush(struct ipu6_isys *isys,
-			      const unsigned int stream_handle)
+static int ipu6_fw_isys_stream_flush(struct ipu6_isys *isys,
+				     const unsigned int stream_handle)
 {
 	return ipu6_fw_isys_complex_cmd(isys, stream_handle, NULL, 0, 0,
 				      IPU6_FW_ISYS_SEND_TYPE_STREAM_FLUSH);
 }
 
-int ipu6_fw_isys_stream_start(struct ipu6_isys *isys,
-			      const unsigned int stream_handle,
-			      struct isys_fw_msgs *msg, bool capture)
+static int ipu6_fw_isys_stream_start(struct ipu6_isys *isys,
+				     const unsigned int stream_handle,
+				     struct isys_fw_msgs *msg, bool capture)
 {
 	u16 cmd_type;
 
@@ -886,9 +886,9 @@ int ipu6_fw_isys_stream_start(struct ipu6_isys *isys,
 				       sizeof(msg->ipu6.stream), cmd_type);
 }
 
-int ipu6_fw_isys_stream_capture(struct ipu6_isys *isys,
-				const unsigned int stream_handle,
-				struct isys_fw_msgs *msg)
+static int ipu6_fw_isys_stream_capture(struct ipu6_isys *isys,
+					 const unsigned int stream_handle,
+					 struct isys_fw_msgs *msg)
 {
 	return ipu6_fw_isys_complex_cmd(isys, stream_handle,
 				       &msg->ipu6.stream, msg->dma_addr,
@@ -914,10 +914,9 @@ ipu6_isys_buf_to_fw_frame_buf_pin(struct vb2_buffer *vb,
  * buffer list is not modified.
  */
 #define IPU6_ISYS_FRAME_NUM_THRESHOLD  (30)
-void
-ipu6_fw_isys_prepare_buf_set(struct isys_fw_msgs *msg,
-			     struct ipu6_isys_stream *stream,
-			     struct ipu6_isys_buffer_list *bl)
+static void ipu6_fw_isys_prepare_buf_set(struct isys_fw_msgs *msg,
+					 struct ipu6_isys_stream *stream,
+					 struct ipu6_isys_buffer_list *bl)
 {
 	struct ipu6_fw_isys_frame_buff_set_abi *set = &msg->ipu6.frame;
 	struct ipu6_isys_buffer *ib;
@@ -948,3 +947,18 @@ ipu6_fw_isys_prepare_buf_set(struct isys_fw_msgs *msg,
 		ipu6_isys_buf_to_fw_frame_buf_pin(vb, set);
 	}
 }
+
+const struct ipu6_fw_isys_ops ipu6_fw_isys_ops = {
+	.init = ipu6_fw_isys_init,
+	.close = ipu6_fw_isys_close,
+	.cleanup = ipu6_fw_isys_cleanup,
+	.prepare_stream_cfg = ipu6_fw_isys_prepare_stream_cfg,
+	.prepare_buf_set = ipu6_fw_isys_prepare_buf_set,
+	.stream_open = ipu6_fw_isys_stream_open,
+	.stream_start = ipu6_fw_isys_stream_start,
+	.stream_capture = ipu6_fw_isys_stream_capture,
+	.stream_flush = ipu6_fw_isys_stream_flush,
+	.stream_close = ipu6_fw_isys_stream_close,
+	.dump_stream_cfg = ipu6_fw_isys_dump_stream_cfg,
+	.dump_frame_buf_set = ipu6_fw_isys_dump_frame_buf_set,
+};
diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
index 6ab70d1f2c6c..2a679d995961 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
@@ -559,43 +559,10 @@ struct ipu6_fw_proxy_send_queue_token {
 	u32 value;
 };
 
-int ipu6_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams);
-int ipu6_fw_isys_close(struct ipu6_isys *isys);
-int ipu6_fw_isys_send_proxy_token(struct ipu6_isys *isys,
-				  unsigned int req_id,
-				  unsigned int index,
-				  unsigned int offset, u32 value);
-void ipu6_fw_isys_cleanup(struct ipu6_isys *isys);
-struct ipu6_fw_isys_resp_info_abi *
-ipu6_fw_isys_get_resp(struct ipu6_isys *isys);
-void ipu6_fw_isys_put_resp(struct ipu6_isys *isys);
+int ipu6_fw_isys_send_proxy_token(struct ipu6_isys *isys, unsigned int req_id,
+				  unsigned int index, unsigned int offset,
+				  u32 value);
 int ipu6_isys_isr_one(struct ipu6_bus_device *adev);
 irqreturn_t ipu6_isys_isr(struct ipu6_bus_device *adev);
 
-int ipu6_fw_isys_stream_open(struct ipu6_isys *isys,
-			     const unsigned int stream_handle,
-			     struct isys_fw_msgs *msg);
-int ipu6_fw_isys_stream_close(struct ipu6_isys *isys,
-			     const unsigned int stream_handle);
-int ipu6_fw_isys_stream_flush(struct ipu6_isys *isys,
-			      const unsigned int stream_handle);
-int ipu6_fw_isys_stream_start(struct ipu6_isys *isys,
-			     const unsigned int stream_handle,
-			     struct isys_fw_msgs *msg,
-			     bool capture);
-int ipu6_fw_isys_stream_capture(struct ipu6_isys *isys,
-				const unsigned int stream_handle,
-				struct isys_fw_msgs *msg);
-int ipu6_fw_isys_prepare_stream_cfg(struct ipu6_isys_video *av,
-				    struct isys_fw_msgs *msg);
-void
-ipu6_fw_isys_prepare_buf_set(struct isys_fw_msgs *msg,
-			     struct ipu6_isys_stream *stream,
-			     struct ipu6_isys_buffer_list *bl);
-void
-ipu6_fw_isys_dump_stream_cfg(struct device *dev, struct isys_fw_msgs *set);
-void
-ipu6_fw_isys_dump_frame_buff_set(struct device *dev, struct isys_fw_msgs *set,
-				 unsigned int outputs);
-
 #endif
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 9f6f283600c8..4cb1741445c6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -237,8 +237,10 @@ static int buffer_list_get(struct ipu6_isys_stream *stream,
 static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 				  struct ipu6_isys_buffer_list *bl)
 {
+	struct ipu6_bus_device *adev = av->isys->adev;
+	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
 	struct ipu6_isys_stream *stream = av->stream;
-	struct device *dev = &stream->isys->adev->auxdev.dev;
+	struct device *dev = &adev->auxdev.dev;
 	struct ipu6_isys_buffer_list __bl;
 	int ret;
 
@@ -262,14 +264,13 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 		if (!msg)
 			return -ENOMEM;
 
-		ipu6_fw_isys_prepare_buf_set(msg, stream, bl);
-		ipu6_fw_isys_dump_frame_buff_set(dev, msg,
-						 stream->nr_output_pins);
+		fw_ops->prepare_buf_set(msg, stream, bl);
+		fw_ops->dump_frame_buf_set(dev, msg, stream->nr_output_pins);
 		ipu6_isys_buffer_list_queue(bl, IPU6_ISYS_BUFFER_LIST_FL_ACTIVE,
 					    0);
 
-		ret = ipu6_fw_isys_stream_capture(stream->isys,
-						  stream->stream_handle, msg);
+		ret = fw_ops->stream_capture(stream->isys,
+					     stream->stream_handle, msg);
 	} while (!WARN_ON(ret));
 
 	return 0;
@@ -288,11 +289,13 @@ static void buf_queue(struct vb2_buffer *vb)
 {
 	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
+	struct ipu6_bus_device *adev = av->isys->adev;
+	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
 	struct vb2_v4l2_buffer *vvb = to_vb2_v4l2_buffer(vb);
 	struct ipu6_isys_video_buffer *ivb =
 		vb2_buffer_to_ipu6_isys_video_buffer(vvb);
 	struct ipu6_isys_buffer *ib = &ivb->ib;
-	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct device *dev = &adev->auxdev.dev;
 	struct ipu6_isys_stream *stream = av->stream;
 	struct ipu6_isys_buffer_list bl;
 	struct isys_fw_msgs *msg;
@@ -339,8 +342,8 @@ static void buf_queue(struct vb2_buffer *vb)
 		goto out;
 	}
 
-	ipu6_fw_isys_prepare_buf_set(msg, stream, &bl);
-	ipu6_fw_isys_dump_frame_buff_set(dev, msg, stream->nr_output_pins);
+	fw_ops->prepare_buf_set(msg, stream, &bl);
+	fw_ops->dump_frame_buf_set(dev, msg, stream->nr_output_pins);
 
 	/*
 	 * We must queue the buffers in the buffer list to the
@@ -350,8 +353,7 @@ static void buf_queue(struct vb2_buffer *vb)
 	 */
 	ipu6_isys_buffer_list_queue(&bl, IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
 
-	ret = ipu6_fw_isys_stream_capture(stream->isys, stream->stream_handle,
-					  msg);
+	ret = fw_ops->stream_capture(stream->isys, stream->stream_handle, msg);
 	if (ret < 0)
 		dev_err(dev, "send stream capture failed\n");
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index f8f1d400d9f7..803450b0156e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -453,8 +453,10 @@ static void put_stream_opened(struct ipu6_isys_video *av)
 static int start_stream_firmware(struct ipu6_isys_video *av,
 				 struct ipu6_isys_buffer_list *bl)
 {
+	struct ipu6_bus_device *adev = av->isys->adev;
+	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
 	struct ipu6_isys_stream *stream = av->stream;
-	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct device *dev = &adev->auxdev.dev;
 	struct isys_fw_msgs *msg = NULL;
 	int ret, retout, tout;
 	bool capture = bl ? true : false;
@@ -463,7 +465,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 	if (!msg)
 		return -ENOMEM;
 
-	ret = ipu6_fw_isys_prepare_stream_cfg(av, msg);
+	ret = fw_ops->prepare_stream_cfg(av, msg);
 	if (ret < 0) {
 		ipu6_put_fw_msg_buf(av->isys, msg);
 		return ret;
@@ -471,7 +473,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 
 	reinit_completion(&stream->stream_open_completion);
 
-	ret = ipu6_fw_isys_stream_open(av->isys, stream->stream_handle, msg);
+	ret = fw_ops->stream_open(av->isys, stream->stream_handle, msg);
 	if (ret < 0) {
 		dev_err(dev, "can't open stream (%d)\n", ret);
 		ipu6_put_fw_msg_buf(av->isys, msg);
@@ -504,15 +506,15 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 			goto out_put_stream_opened;
 		}
 
-		ipu6_fw_isys_prepare_buf_set(msg, stream, bl);
+		fw_ops->prepare_buf_set(msg, stream, bl);
 		ipu6_isys_buffer_list_queue(bl,
 					    IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
 	}
 
 	reinit_completion(&stream->stream_start_completion);
 
-	ret = ipu6_fw_isys_stream_start(av->isys, stream->stream_handle,
-						msg, capture);
+	ret = fw_ops->stream_start(av->isys, stream->stream_handle, msg,
+				   capture);
 
 	if (ret < 0) {
 		dev_err(dev, "can't start streaming (%d)\n", ret);
@@ -538,7 +540,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 out_stream_close:
 	reinit_completion(&stream->stream_close_completion);
 
-	retout = ipu6_fw_isys_stream_close(av->isys, stream->stream_handle);
+	retout = fw_ops->stream_close(av->isys, stream->stream_handle);
 	if (retout < 0) {
 		dev_dbg(dev, "can't close stream (%d)\n", retout);
 		goto out_put_stream_opened;
@@ -561,13 +563,15 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 
 static void stop_streaming_firmware(struct ipu6_isys_video *av)
 {
-	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct ipu6_bus_device *adev = av->isys->adev;
+	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
+	struct device *dev = &adev->auxdev.dev;
 	struct ipu6_isys_stream *stream = av->stream;
 	int ret, tout;
 
 	reinit_completion(&stream->stream_stop_completion);
 
-	ret = ipu6_fw_isys_stream_flush(av->isys, stream->stream_handle);
+	ret = fw_ops->stream_flush(av->isys, stream->stream_handle);
 	if (ret < 0) {
 		dev_err(dev, "can't stop stream (%d)\n", ret);
 		return;
@@ -585,13 +589,15 @@ static void stop_streaming_firmware(struct ipu6_isys_video *av)
 
 static void close_streaming_firmware(struct ipu6_isys_video *av)
 {
+	struct ipu6_bus_device *adev = av->isys->adev;
+	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
 	struct ipu6_isys_stream *stream = av->stream;
-	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct device *dev = &adev->auxdev.dev;
 	int ret, tout;
 
 	reinit_completion(&stream->stream_close_completion);
 
-	ret = ipu6_fw_isys_stream_close(av->isys, stream->stream_handle);
+	ret = fw_ops->stream_close(av->isys, stream->stream_handle);
 	if (ret < 0) {
 		dev_err(dev, "can't close stream (%d)\n", ret);
 		return;
@@ -990,6 +996,7 @@ static const struct v4l2_file_operations isys_fops = {
 int ipu6_isys_fw_open(struct ipu6_isys *isys)
 {
 	struct ipu6_bus_device *adev = isys->adev;
+	const struct ipu6_fw_isys_ops *fw_ops = adev->auxdrv_data->fw_ops;
 	const struct ipu6_isys_internal_pdata *ipdata = isys->pdata->ipdata;
 	int ret;
 
@@ -1018,10 +1025,10 @@ int ipu6_isys_fw_open(struct ipu6_isys *isys)
 		 * restarting isys we can safely delete old context.
 		 */
 		dev_warn(&adev->auxdev.dev, "clearing old context\n");
-		ipu6_fw_isys_cleanup(isys);
+		fw_ops->cleanup(isys);
 	}
 
-	ret = ipu6_fw_isys_init(isys, ipdata->num_parallel_streams);
+	ret = fw_ops->init(isys, ipdata->num_parallel_streams);
 	if (ret < 0)
 		goto out;
 
@@ -1044,7 +1051,7 @@ void ipu6_isys_fw_close(struct ipu6_isys *isys)
 
 	isys->ref_count--;
 	if (!isys->ref_count) {
-		ipu6_fw_isys_close(isys);
+		isys->adev->auxdrv_data->fw_ops->close(isys);
 		if (isys->fwctx) {
 			isys->need_reset = true;
 			dev_warn(&isys->adev->auxdev.dev,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 63a79524ae97..ad9b65d246e5 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1067,6 +1067,7 @@ static const struct ipu6_auxdrv_data ipu6_isys_auxdrv_data = {
 	.isr = ipu6_isys_isr,
 	.isr_threaded = NULL,
 	.wake_isr_thread = false,
+	.fw_ops = &ipu6_fw_isys_ops,
 };
 
 static const struct auxiliary_device_id ipu6_isys_id_table[] = {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index f39566513a87..fa9bc2730d64 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -174,6 +174,38 @@ struct isys_fw_msgs {
 	dma_addr_t dma_addr;
 };
 
+struct ipu6_fw_isys_ops {
+	int (*init)(struct ipu6_isys *isys, unsigned int num_streams);
+	int (*close)(struct ipu6_isys *isys);
+	int (*send_cmd)(struct ipu6_isys *isys,
+			const unsigned int stream_handle,
+			void *cpu_mapped_buf,
+			dma_addr_t dma_mapped_buf,
+			size_t size, u16 send_type);
+	void (*cleanup)(struct ipu6_isys *isys);
+	int (*prepare_stream_cfg)(struct ipu6_isys_video *av,
+				  struct isys_fw_msgs *msg);
+	void (*prepare_buf_set)(struct isys_fw_msgs *msg,
+				struct ipu6_isys_stream *stream,
+				struct ipu6_isys_buffer_list *bl);
+	int (*stream_open)(struct ipu6_isys *isys,
+			   const unsigned int stream_handle,
+			   struct isys_fw_msgs *msg);
+	int (*stream_start)(struct ipu6_isys *isys,
+			    const unsigned int stream_handle,
+			    struct isys_fw_msgs *msg, bool capture);
+	int (*stream_capture)(struct ipu6_isys *isys,
+			      const unsigned int stream_handle,
+			      struct isys_fw_msgs *msg);
+	int (*stream_flush)(struct ipu6_isys *isys,
+			    const unsigned int stream_handle);
+	int (*stream_close)(struct ipu6_isys *isys,
+			    const unsigned int stream_handle);
+	void (*dump_stream_cfg)(struct device *dev, struct isys_fw_msgs *msg);
+	void (*dump_frame_buf_set)(struct device *dev, struct isys_fw_msgs *msg,
+				   unsigned int outputs);
+};
+
 struct isys_fw_msgs *ipu6_get_fw_msg_buf(struct ipu6_isys_stream *stream);
 void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, struct isys_fw_msgs *msg);
 void ipu6_cleanup_fw_msg_bufs(struct ipu6_isys *isys);
-- 
2.54.0


