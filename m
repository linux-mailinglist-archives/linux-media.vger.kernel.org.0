Return-Path: <linux-media+bounces-66473-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cSGvIiXWR2pYgAAAu9opvQ
	(envelope-from <linux-media+bounces-66473-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:32:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DC2703E98
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:32:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=FnLUXoNn;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66473-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66473-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC0D9304C615
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D355A414DF7;
	Fri,  3 Jul 2026 15:25:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060E83DB305
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092328; cv=none; b=gof1R5yaUhZgpL0GNXraQx4RCBb1JY2m7au6u3BTohkGMEmW4KBQL8xTSZvYvrI8YAhhK6F+hffc9zxPtPrci64D5BkY9nqJFgD/8S/KdoLVMq75xOyu47+9InLhOe3ix8TMLgxRk1OJntgbYGUqetF9yhlHGsOBmT6o+XrxwDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092328; c=relaxed/simple;
	bh=BePnkYsEyZq6bq4sJ35PKOODPSqxb9LE8v7NKqFhPH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pGtOdHKEfCFv8PdKejw16kB2byLueZHcimi97H2eLVSVn0MN8tEd1NrkeyxsA3SciGtXpFK4mQvou4vaH+tLEjYZ2VlRAXA0d90HRXpzT6jKxOXkKFRJuXpZZlLbrpss7l6CnSiT4F3PT8dZOyLEqPSTEpWU9ifjvOpHhixjR9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnLUXoNn; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092327; x=1814628327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BePnkYsEyZq6bq4sJ35PKOODPSqxb9LE8v7NKqFhPH0=;
  b=FnLUXoNnv10I/va1vTnGf/2BGAOJ2Ld+fSl37F5bZdfKLipZ7S/49RoN
   bgI8DjP4ZWnWwNEwTxiKPO0AQuoEq7PGwRdMlW+/fQ6G+unhQERrAMmeY
   xfpYLvfQ/uqW7+EwYkXCVa/DXVvsBcMES6aijYksdqI3Svw5tV2iqXuYq
   vufBVWo5wYPqwmMFk5vaLvvVkDKSiElX/I3Kchsbs5Avz6A1qTP2QUytG
   OTSghmvT8hg5iC9JXbyFkYyTWaHZi67DbJpnbT/vyV26iQb1eOeNdVix3
   FB7TeM+MKxEAGJFzEeCb5kAlk6kRZdjYNd9zzMdJJ1UI9XXe6ub+QGlkQ
   w==;
X-CSE-ConnectionGUID: jziEExTfR+iY7Hu0NLE0ZQ==
X-CSE-MsgGUID: Sts7+KR0TRqTmJNjAaY44g==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396137"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396137"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:27 -0700
X-CSE-ConnectionGUID: HXTyz6HFTUmVNds3rRKHHg==
X-CSE-MsgGUID: VIpSfNjsQjK/fcjkTlLN5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799484"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:25 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 07/41] media: ipu6: Simplify firmware com arguments
Date: Fri,  3 Jul 2026 18:24:17 +0300
Message-ID: <20260703152451.1743132-8-antti.laakso@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-66473-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 69DC2703E98

We need only pointer to ipu6_isys struct, and queue number
can be removed as it is always the same.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 8 ++++----
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h | 4 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys.c    | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
index a65e9f1aa104..fc2f24c05de7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -366,14 +366,14 @@ int ipu6_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 }
 
 struct ipu6_fw_isys_resp_info_abi *
-ipu6_fw_isys_get_resp(void *context, unsigned int queue)
+ipu6_fw_isys_get_resp(struct ipu6_isys *isys)
 {
-	return ipu6_recv_get_token(context, queue);
+	return ipu6_recv_get_token(isys->fwctx, IPU6_BASE_MSG_RECV_QUEUES);
 }
 
-void ipu6_fw_isys_put_resp(void *context, unsigned int queue)
+void ipu6_fw_isys_put_resp(struct ipu6_isys *isys)
 {
-	ipu6_recv_put_token(context, queue);
+	ipu6_recv_put_token(isys->fwctx, IPU6_BASE_MSG_RECV_QUEUES);
 }
 
 void ipu6_fw_isys_dump_stream_cfg(struct device *dev,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
index 393245a633f4..15d4ae355f28 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
@@ -576,6 +576,6 @@ int ipu6_fw_isys_send_proxy_token(struct ipu6_isys *isys,
 				  unsigned int offset, u32 value);
 void ipu6_fw_isys_cleanup(struct ipu6_isys *isys);
 struct ipu6_fw_isys_resp_info_abi *
-ipu6_fw_isys_get_resp(void *context, unsigned int queue);
-void ipu6_fw_isys_put_resp(void *context, unsigned int queue);
+ipu6_fw_isys_get_resp(struct ipu6_isys *isys);
+void ipu6_fw_isys_put_resp(struct ipu6_isys *isys);
 #endif
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 06b0a950499c..9eb15810d75c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1214,7 +1214,7 @@ static int isys_isr_one(struct ipu6_bus_device *adev)
 	if (!isys->fwctx)
 		return 1;
 
-	resp = ipu6_fw_isys_get_resp(isys->fwctx, IPU6_BASE_MSG_RECV_QUEUES);
+	resp = ipu6_fw_isys_get_resp(isys);
 	if (!resp)
 		return 1;
 
@@ -1323,7 +1323,7 @@ static int isys_isr_one(struct ipu6_bus_device *adev)
 
 	ipu6_isys_put_stream(stream);
 leave:
-	ipu6_fw_isys_put_resp(isys->fwctx, IPU6_BASE_MSG_RECV_QUEUES);
+	ipu6_fw_isys_put_resp(isys);
 	return 0;
 }
 
-- 
2.54.0


