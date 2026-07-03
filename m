Return-Path: <linux-media+bounces-66505-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id etAHJL7UR2q2fwAAu9opvQ
	(envelope-from <linux-media+bounces-66505-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 59974703D8B
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=fk7z3TXF;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66505-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66505-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 501573034F15
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B525241735E;
	Fri,  3 Jul 2026 15:26:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E192B417350
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092403; cv=none; b=jUWMkOmL8IL6nDXX6uscZhE+iVZS6p0XHIPG7BTFN5Ny2e242+p7w3kDHJvKf+6j8kgYf2O/8qlhgAcWmhA1nZ+tyhzhHmuaPYCGwbWiZecjutni+gvfbU+BeTrrFNW4qnKCpgE8yDDggnbctBtv4RNj/qFfgSQ6PxBi0UvpdL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092403; c=relaxed/simple;
	bh=gtSjYtprV8NhgkLuic7vnrG7vzc34+zGpu3aJrky3Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MC5HI0kt5ZMkaZUMjthRM8EYIBWkiP6NE7Xltk4kwSLXBBMNvv4qfItKyOLwyF0rfojQm/k5cS2oQf4KWhR4mMxc/8trcOsIAaO+cipuw4aEldGg9VEE2IxkR5gWSfhayzdl4Azi4T/fVOEN+Op6uUHjw6dTxE1A/tgWkicCEb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fk7z3TXF; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092402; x=1814628402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gtSjYtprV8NhgkLuic7vnrG7vzc34+zGpu3aJrky3Uw=;
  b=fk7z3TXFuM1p6xukikPeGAeZ6bKb1qG8pFCWgcFJd5DH+cYTUPHK3bss
   LWoZ0F81lCIFV5Fd8BfNhKF4vYvxXIHl7yxQeC6TS3dVOaoYkqrU7DhId
   AZWvMrk3S2fz8N9UVkGT0gTtw39q8nKS0HOKDImG/Rf60zHzxtEI7HqTh
   4IcCnkkLPM7kSsUQfyFdPNJsMcHBGsnX6Z57qJi39wZvLcIc5izMwpBpa
   QWxQezDkraQoS646tgcO70bA5hBImS9vRMuo1xsKkBCxbHg9H1aNt7gv0
   raQuR5aXL3E4I1SuMEB9ttLiQqasLiANYG3CvjRXnOi8+3qEU7rJw3r9x
   Q==;
X-CSE-ConnectionGUID: 942IPJ8qTlmJQ4bEWzWx/Q==
X-CSE-MsgGUID: ipE7Dt3RSs+8ROXA/q//bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396282"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396282"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:42 -0700
X-CSE-ConnectionGUID: BS6JjbKeSGirK1GmN7oWxQ==
X-CSE-MsgGUID: 8ASgEh5QScuErC40nbOQmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799855"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:40 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 39/41] media: ipu6: Set model name for ipu7
Date: Fri,  3 Jul 2026 18:24:49 +0300
Message-ID: <20260703152451.1743132-40-antti.laakso@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66505-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 59974703D8B

We are about to enable suport for ipu7 hardware, set model name
accordingly.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 5 ++++-
 drivers/media/pci/intel/ipu6/ipu6.h      | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index dca6dd30a270..787da4b807fd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -739,11 +739,14 @@ static int isys_register_devices(struct ipu6_isys *isys)
 {
 	struct device *dev = &isys->adev->auxdev.dev;
 	struct pci_dev *pdev = isys->adev->isp->pdev;
+	const char *model = pci_match_id(ipu7_ids, pdev) ?
+				IPU7_MEDIA_DEV_MODEL_NAME :
+				IPU6_MEDIA_DEV_MODEL_NAME;
 	int ret;
 
 	isys->media_dev.dev = dev;
 	media_device_pci_init(&isys->media_dev,
-			      pdev, IPU6_MEDIA_DEV_MODEL_NAME);
+			      pdev, model);
 
 	strscpy(isys->v4l2_dev.name, isys->media_dev.model,
 		sizeof(isys->v4l2_dev.name));
diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 4cdc58ef0194..18841141a120 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -17,6 +17,7 @@ struct pci_dev;
 struct ipu6_bus_device;
 
 #define IPU6_NAME			"intel-ipu6"
+#define IPU7_MEDIA_DEV_MODEL_NAME	"ipu7"
 #define IPU6_MEDIA_DEV_MODEL_NAME	"ipu6"
 
 #define IPU6SE_FIRMWARE_NAME		"intel/ipu/ipu6se_fw.bin"
-- 
2.54.0


