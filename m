Return-Path: <linux-media+bounces-66483-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hs2ZJ53UR2qkfwAAu9opvQ
	(envelope-from <linux-media+bounces-66483-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDFC703D5B
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=DjLW36CO;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66483-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66483-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 140883020FD8
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B074F417348;
	Fri,  3 Jul 2026 15:25:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A1A414DFB
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092352; cv=none; b=XlFr7uMg82Ong3gVeVWflwtdsr61JeqzSaNiofurusXL4dHYEgaqUMicstMIL0TcF5JkGEl+T6vBioWcm28PNqiKu5t3glba/itrRD+pgbnTlpJ3egJAu3m3CdkQ/3C4I+8yKkWudyW64tsZkOjVGY66a/odbm+Y7xIa5vCybnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092352; c=relaxed/simple;
	bh=2LlSR01LZnLLOZoox+LZfXf8kJIGZANkZBh9E1zwU1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f0AFUiyJayI7nU/evX5nn09P6QT6WpA/NstTV4CmlxXvoAoewfeeqdpeSKT2xgIDo1lK7eVQChvsP8QjHMTy3yDsb/eQx+o1R0p3eXdFULo5HN7CRk1yOREJgP/VAh4lTopMxYjbPDXhcgOuV2K5n0zhcGf7uUqb6TVHECWY35g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjLW36CO; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092351; x=1814628351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2LlSR01LZnLLOZoox+LZfXf8kJIGZANkZBh9E1zwU1w=;
  b=DjLW36COOq/pbJzfePgxG4iCmT6Y0Mc6ZX9phhGAn+VSiG5oag1plxak
   zRwp6r6G8Z+hHMAc/cKUvBgU+7hDmvM6MtqiEi5W55AR+MKYzIPWBBMBr
   VE7cvAbSdO/7h27h8aaPkRNcrTlxR6DSTy/mlDTBUFEppZSIo49augTyZ
   5DGiNDxSaUQ6bLJQBMi5hMOFRcL2BW/prZZfIYtAWdblrqjBXlCAtl9wC
   Gvqoa1xdPb7Zj0+nZUqHTO33U/pnUMgyccJsZHAL7aiGigvENQbknQDgt
   FMHWwWiHwUHYeu9o02EsGt2S4mjGcQjy55Vx1BC8b+qeOiDQKmbL1kDQd
   Q==;
X-CSE-ConnectionGUID: 2XtQKj20SV6FkuASqHHI4Q==
X-CSE-MsgGUID: Q5TFsolBQXSk0Nv2tTU0mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396174"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396174"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:50 -0700
X-CSE-ConnectionGUID: dci1L1PBQmq/Zg6kC0e6FQ==
X-CSE-MsgGUID: RIeBMqc1QvKQR+jXAIPW3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799594"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:49 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 17/41] media: ipu6: Rename isys fw msg union
Date: Fri,  3 Jul 2026 18:24:27 +0300
Message-ID: <20260703152451.1743132-18-antti.laakso@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-66483-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FDFC703D5B

Later we need to abstract ipu7 firmware abi structs same way
we have it now for ipu6. Renaming union per ipu helps to make
the split more clear.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys.c       | 4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys.h       | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index fabaed63df0c..529973860e9e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -316,7 +316,7 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 		if (!msg)
 			return -ENOMEM;
 
-		buf = &msg->fw_msg.frame;
+		buf = &msg->ipu6.frame;
 		ipu6_isys_buf_to_fw_frame_buf(buf, stream, bl);
 		ipu6_fw_isys_dump_frame_buff_set(dev, buf,
 						 stream->nr_output_pins);
@@ -396,7 +396,7 @@ static void buf_queue(struct vb2_buffer *vb)
 		goto out;
 	}
 
-	buf = &msg->fw_msg.frame;
+	buf = &msg->ipu6.frame;
 	ipu6_isys_buf_to_fw_frame_buf(buf, stream, &bl);
 	ipu6_fw_isys_dump_frame_buff_set(dev, buf, stream->nr_output_pins);
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 89eb265737d7..c925386a1e98 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -533,7 +533,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 	if (!msg)
 		return -ENOMEM;
 
-	stream_cfg = &msg->fw_msg.stream;
+	stream_cfg = &msg->ipu6.stream;
 	stream_cfg->src = stream->stream_source;
 	stream_cfg->vc = stream->vc;
 	stream_cfg->isl_use = 0;
@@ -590,7 +590,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 			ret = -ENOMEM;
 			goto out_put_stream_opened;
 		}
-		buf = &msg->fw_msg.frame;
+		buf = &msg->ipu6.frame;
 		ipu6_isys_buf_to_fw_frame_buf(buf, stream, bl);
 		ipu6_isys_buffer_list_queue(bl,
 					    IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 9eb15810d75c..e71cfaf0def5 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1002,7 +1002,7 @@ struct isys_fw_msgs *ipu6_get_fw_msg_buf(struct ipu6_isys_stream *stream)
 	msg = list_last_entry(&isys->framebuflist, struct isys_fw_msgs, head);
 	list_move(&msg->head, &isys->framebuflist_fw);
 	spin_unlock_irqrestore(&isys->listlock, flags);
-	memset(&msg->fw_msg, 0, sizeof(msg->fw_msg));
+	memset(&msg->ipu6, 0, sizeof(msg->ipu6));
 
 	return msg;
 }
@@ -1028,7 +1028,7 @@ void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, uintptr_t data)
 		return;
 
 	spin_lock_irqsave(&isys->listlock, flags);
-	msg = container_of(ptr, struct isys_fw_msgs, fw_msg.dummy);
+	msg = container_of(ptr, struct isys_fw_msgs, ipu6.dummy);
 	list_move(&msg->head, &isys->framebuflist);
 	spin_unlock_irqrestore(&isys->listlock, flags);
 }
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index 0b139ab24431..abcd5e1cbc2c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -169,7 +169,7 @@ struct isys_fw_msgs {
 		u64 dummy;
 		struct ipu6_fw_isys_frame_buff_set_abi frame;
 		struct ipu6_fw_isys_stream_cfg_data_abi stream;
-	} fw_msg;
+	} ipu6;
 	struct list_head head;
 	dma_addr_t dma_addr;
 };
-- 
2.54.0


