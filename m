Return-Path: <linux-media+bounces-66485-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XYaUMbvUR2q1fwAAu9opvQ
	(envelope-from <linux-media+bounces-66485-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F746703D88
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=fgH3PvCJ;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66485-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66485-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F13630300D8
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B1AE416D02;
	Fri,  3 Jul 2026 15:25:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1D341735C
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092356; cv=none; b=FTzaqQjc4K6PcXrIeRDx5LHYjNCNCSjacRxJq92CI0f3/Oo5xKEiD7LmD/rxOiH5onxtpwHtpD7/cPCgUu9BpF7ABikv25LSz2161QUqL3lDIgeDAlMfcLQs0WZuZt3uueuw5+a+TProcy3ze3wxfYeBXq81A1dm44ZFd743lRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092356; c=relaxed/simple;
	bh=/rZt5HvLX23cq5mB4Q/4AQO0JnY0AmoT3JuUbAsvi+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=syRJoIoTUGsCo+LRwNAuoweJb6CN4MM/warE0B2xMPq6Fsm0l0zcD0FRU1B/CCbtXcygbqHZEkh/TpO9lOXUrSlsY7+/Hig+PJYx2y+EN4mRNG5tUeGDN4a86sKPM+RSgQpkd+PKtFT0XLUyPjQHhfxnl9Bhat6Q+EA0pxu8s+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgH3PvCJ; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092355; x=1814628355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/rZt5HvLX23cq5mB4Q/4AQO0JnY0AmoT3JuUbAsvi+Q=;
  b=fgH3PvCJcp+5ee1748oQKheA3/lrcGwpWRFBk8KJGt1QjCrvLBbpyUm5
   K6jT6etMvKfUCt8WSEJ6a4rKSlXkodSOnc+JBDKpmRC1sXczqKOFWaJsb
   H8ejiT+4uQSkAiIdatRue6osgSn2KDp+EDqYMDkVTAcjosN0XlX7avDia
   RaPic0P9pvBdB2vhuKWhrSWjtovlxeVCIjeyL4gvaf0pYNP7arYAd0O2c
   R2VD1MlY4H+2S1WC/3Sx1IZWTnVpFcTgt2SbSZDkw+XolaMfH6hGwl4/+
   qf192SZF69HlY9D3DgE7ne2YPvK79fvIJ69xh/DKMa/ljTvSJ1iNfJhtH
   g==;
X-CSE-ConnectionGUID: AXil4Ny7R0aBiF5O5Zqoxw==
X-CSE-MsgGUID: YH8GtQlqTqSAqaUErzYNSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396188"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396188"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:55 -0700
X-CSE-ConnectionGUID: mrrm24ZCQoSvWQz1S9MMEw==
X-CSE-MsgGUID: //1LF+TuR3uKp+PvBhUHuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799625"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:53 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 19/41] media: ipu6: Move hw specific buffer handling down
Date: Fri,  3 Jul 2026 18:24:29 +0300
Message-ID: <20260703152451.1743132-20-antti.laakso@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-66485-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime,intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F746703D88

Move handling of hardware specific buffers out of common code, like
ipu6-isys-video.c. Now the ipu6_put_fw_msg_buf() works with fw_msg_bufs,
like its counterpart ipu6_get_fw_msg_buf().

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c    | 6 +++++-
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 6 +++---
 drivers/media/pci/intel/ipu6/ipu6-isys.c       | 7 ++-----
 drivers/media/pci/intel/ipu6/ipu6-isys.h       | 2 +-
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
index 52d752a790aa..7728f5bddef5 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -599,7 +599,11 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
 		 * firmware only release the capture msg until software
 		 * get pin_data_ready event
 		 */
-		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), resp->buf_id);
+		struct isys_fw_msgs *msg =
+			container_of((void *)resp->buf_id, struct isys_fw_msgs,
+				     ipu6.dummy);
+
+		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), msg);
 		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS &&
 		    stream->output_pins_queue[resp->pin_id])
 			ipu6_isys_queue_buf_ready(stream, resp);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index c925386a1e98..fabea6a75d7d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -544,7 +544,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 
 		ret = ipu6_isys_fw_pin_cfg(__av, stream_cfg);
 		if (ret < 0) {
-			ipu6_put_fw_msg_buf(av->isys, (uintptr_t)stream_cfg);
+			ipu6_put_fw_msg_buf(av->isys, msg);
 			return ret;
 		}
 	}
@@ -561,7 +561,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 				       IPU6_FW_ISYS_SEND_TYPE_STREAM_OPEN);
 	if (ret < 0) {
 		dev_err(dev, "can't open stream (%d)\n", ret);
-		ipu6_put_fw_msg_buf(av->isys, (uintptr_t)stream_cfg);
+		ipu6_put_fw_msg_buf(av->isys, msg);
 		return ret;
 	}
 
@@ -570,7 +570,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 	tout = wait_for_completion_timeout(&stream->stream_open_completion,
 					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
 
-	ipu6_put_fw_msg_buf(av->isys, (uintptr_t)stream_cfg);
+	ipu6_put_fw_msg_buf(av->isys, msg);
 
 	if (!tout) {
 		dev_err(dev, "stream open time out\n");
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index b4546d3fdd12..63a79524ae97 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -918,17 +918,14 @@ void ipu6_cleanup_fw_msg_bufs(struct ipu6_isys *isys)
 	spin_unlock_irqrestore(&isys->listlock, flags);
 }
 
-void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, uintptr_t data)
+void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, struct isys_fw_msgs *msg)
 {
-	struct isys_fw_msgs *msg;
 	unsigned long flags;
-	void *ptr = (void *)data;
 
-	if (!ptr)
+	if (!msg)
 		return;
 
 	spin_lock_irqsave(&isys->listlock, flags);
-	msg = container_of(ptr, struct isys_fw_msgs, ipu6.dummy);
 	list_move(&msg->head, &isys->framebuflist);
 	spin_unlock_irqrestore(&isys->listlock, flags);
 }
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index abcd5e1cbc2c..f39566513a87 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -175,7 +175,7 @@ struct isys_fw_msgs {
 };
 
 struct isys_fw_msgs *ipu6_get_fw_msg_buf(struct ipu6_isys_stream *stream);
-void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, uintptr_t data);
+void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, struct isys_fw_msgs *msg);
 void ipu6_cleanup_fw_msg_bufs(struct ipu6_isys *isys);
 
 extern const struct v4l2_ioctl_ops ipu6_isys_ioctl_ops;
-- 
2.54.0


