Return-Path: <linux-media+bounces-66493-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IBREOvbUR2rLfwAAu9opvQ
	(envelope-from <linux-media+bounces-66493-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:27:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF48703DB8
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:27:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=nRjniOlb;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66493-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66493-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A6603056940
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A573417350;
	Fri,  3 Jul 2026 15:26:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0586841734D
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092375; cv=none; b=deKL8smLUPXv1Xg5TOmt1Vto/xjMWtlW8cqIKYELqNUZMdfITbi+9Gg7ddBTKzCnggTtNT+Fk+iXFv5IukAIvz3RDJ6bQrglV3ZTOqjZKuNHiCsa5VGH8b9BpyrF7IM0r9TXChTfDOPeZRrRJsVa9CE3l1CYluofKjTzCYIPEUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092375; c=relaxed/simple;
	bh=BZLhowFg6h/URDgO32f/ZSeo9nYctWw0kvDHcpH73Xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mqbsC7XMso8YP9cKaP6tzjrN7LqEgcCaBpQBCooC/Wp1neEy12PsAvNQjIAHPDTGjpxmNOnwBTbujqO3WiKkYiSgl8bAfhkw1uHE0jtXl0tGezBPfDXyBfmeQi2Ek7Gb6z52+B698xTZrlu44HFzqbcRgxw47dDI+HwGlusEB+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nRjniOlb; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092374; x=1814628374;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BZLhowFg6h/URDgO32f/ZSeo9nYctWw0kvDHcpH73Xs=;
  b=nRjniOlblMSKZFP1tyvyYO1oeG09QvfvAl5rtL1GJxmf0Qv0jBAoXVzf
   NVCnJFrM7nqLWP4XmpGyK+GZS6OvImX0IN3/gpK1NKiA7N1trOgdestqX
   4rRUcdK7Jj+xSn5gURsw6mu7KrdqJpq+Lf5YTz6FFZMFn24BE2BJ0pV0n
   zAnbjhGwpom/pgxDLCMFhdbvJUBTfXI2ARiOy6epEdqTpwKxHyz4PHmHs
   k7ygMO5e92/XBpEVkyugYd/pmjVrMg4lTDyMC1RNUEI5IcXt4a+2Et+VD
   1fRYFNn7RVo7lJbpQ9vqr1xzVEcrsdiANnIXzq1rV9ZzDgJPsv2QXqaJt
   w==;
X-CSE-ConnectionGUID: RwsCWmJlSY2eTsIJjUA3fQ==
X-CSE-MsgGUID: /98Bhg88QeGfiSKOEoi8QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396224"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396224"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:14 -0700
X-CSE-ConnectionGUID: 1LlGUq08TgG9ge19Q8fxTw==
X-CSE-MsgGUID: 4HLUK0MZQ7WIYToOYijHjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799736"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:12 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 27/41] media: ipu6: Parse bus type for ipu7
Date: Fri,  3 Jul 2026 18:24:37 +0300
Message-ID: <20260703152451.1743132-28-antti.laakso@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-66493-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 7DF48703DB8

For ipu7 bus type can be CPHY or DPHY.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 16 +++++++++++++++-
 drivers/media/pci/intel/ipu6/ipu6-isys.h |  2 ++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 4a1ff3f27660..74ab5ea7751c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -133,6 +133,9 @@ isys_complete_ext_device_registration(struct ipu6_isys *isys,
 	}
 
 	isys->csi2[csi2->port].nlanes = csi2->nlanes;
+	isys->csi2[csi2->port].phy_mode =
+		csi2->bus_type == V4L2_MBUS_CSI2_DPHY ?
+		PHY_MODE_DPHY : PHY_MODE_CPHY;
 
 	return 0;
 
@@ -628,7 +631,8 @@ static int isys_notifier_init(struct ipu6_isys *isys)
 
 	for (i = 0; i < ISYS_MAX_PORTS; i++) {
 		struct v4l2_fwnode_endpoint vep = {
-			.bus_type = V4L2_MBUS_CSI2_DPHY
+			.bus_type = pci_match_id(ipu7_ids, isp->pdev) ?
+					V4L2_MBUS_UNKNOWN : V4L2_MBUS_CSI2_DPHY
 		};
 		struct sensor_async_sd *s_asd;
 		struct fwnode_handle *ep;
@@ -644,6 +648,15 @@ static int isys_notifier_init(struct ipu6_isys *isys)
 			goto err_parse;
 		}
 
+		if (pci_match_id(ipu7_ids, isp->pdev) &&
+		    vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
+		    vep.bus_type != V4L2_MBUS_CSI2_CPHY) {
+			ret = -EINVAL;
+			dev_err(dev, "unsupported bus type %d!\n",
+				vep.bus_type);
+			goto err_parse;
+		}
+
 		s_asd = v4l2_async_nf_add_fwnode_remote(&isys->notifier, ep,
 							struct sensor_async_sd);
 		if (IS_ERR(s_asd)) {
@@ -654,6 +667,7 @@ static int isys_notifier_init(struct ipu6_isys *isys)
 
 		s_asd->csi2.port = vep.base.port;
 		s_asd->csi2.nlanes = vep.bus.mipi_csi2.num_data_lanes;
+		s_asd->csi2.bus_type = vep.bus_type;
 
 		dev_dbg(dev, "remote endpoint port %d with %d lanes added\n",
 			s_asd->csi2.port, s_asd->csi2.nlanes);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index 30539ea5f826..8674c041b994 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -14,6 +14,7 @@
 #include <media/media-device.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-mediabus.h>
 
 #include "ipu6.h"
 #include "ipu6-fw-isys.h"
@@ -96,6 +97,7 @@ struct isys_iwake_watermark {
 struct ipu6_isys_csi2_config {
 	u32 nlanes;
 	u32 port;
+	enum v4l2_mbus_type bus_type;
 };
 
 struct sensor_async_sd {
-- 
2.54.0


