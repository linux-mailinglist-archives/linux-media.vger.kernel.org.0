Return-Path: <linux-media+bounces-66474-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6mdIC2/UR2qQfwAAu9opvQ
	(envelope-from <linux-media+bounces-66474-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:25:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC2B703D27
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:25:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=lNqg25du;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66474-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66474-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37C123013028
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02AE2414DF9;
	Fri,  3 Jul 2026 15:25:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543F5414DFB
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092330; cv=none; b=POCE1OqZqCILvlL6vdtxcj6zlQwZK93V/mwuCL2EhzND59QjoSStl0zoE1kPpO5G1pw/cr4M5y1WroTsnb8Ge9Qmy5GbZjOyqO7Ibk7BOnRTXlQsfof8dPcAQJHimXQ1WUkpMd5sjFvzMznG4htZAwNEej3RImU22IPvI58JGpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092330; c=relaxed/simple;
	bh=wn/QKbTfYfOsSl5sjs8zOkpQhm8YX4Tww0NcyArbiP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=diRDZoWLyPnL5dr7n+SRZPRBpXC25n3C65etosbog7UJCPHFXjn4yzBJleVjcrcAx1yZ6bgr9WIUEDXNGkcrN4xPNCp6rC/6da5mMDjK5UNBzdXWi0AnWGSrG+rnvBZgRKWcqwhhAwpHuGPQWrbhPG8Ob2rPm4E3D53czbj8f18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNqg25du; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092329; x=1814628329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wn/QKbTfYfOsSl5sjs8zOkpQhm8YX4Tww0NcyArbiP4=;
  b=lNqg25du0t1SSc8LwBWCSWHqCuV63XZWuC0l2fyI6KFckRLSDDswesqI
   3mQcOVkbiXX4d1p8LOJDtB8i4XRhd9r109h9PPjlED/+kvXN/74Ja3s7H
   0M95ScCSjy4F0TETkW/peCoPog8WCp5OK4SmI5oUkGVHJ1quluFdnQtJ7
   raX9YtLJP4wRULpZINchEOi7wmHHyAUNrduQ3CudOGrLa+h1ovBryqPIE
   MwWuvNYkWS25Rv4XhIAu2Uojw7MpVj9A9+vFk7KsgSccZy1sfUO7bmT3d
   dtksKMIdD9FR3OpkybLXTtJ4a+WlWkxacrwxzQgCTP1Dnmh/b8amCYQgH
   g==;
X-CSE-ConnectionGUID: kXCNxMzvTs2iP+J9AsnbrQ==
X-CSE-MsgGUID: OKizUVYzT9melmh/efRj0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396139"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396139"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:29 -0700
X-CSE-ConnectionGUID: W0miyDDuSOGkiG/6G+4TeA==
X-CSE-MsgGUID: trTa2/GUS/m8pvKvMO53Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799489"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:27 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 08/41] media: ipu6: Add IPU7 pci IDs
Date: Fri,  3 Jul 2026 18:24:18 +0300
Message-ID: <20260703152451.1743132-9-antti.laakso@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-66474-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EC2B703D27

Add IDs for IPU7 and IPU7.5.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 include/media/ipu6-pci-table.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/media/ipu6-pci-table.h b/include/media/ipu6-pci-table.h
index 0899d9d2f978..022d6f255ad5 100644
--- a/include/media/ipu6-pci-table.h
+++ b/include/media/ipu6-pci-table.h
@@ -14,6 +14,8 @@
 #define PCI_DEVICE_ID_INTEL_IPU6EP_ADLN		0x462e
 #define PCI_DEVICE_ID_INTEL_IPU6EP_RPLP		0xa75d
 #define PCI_DEVICE_ID_INTEL_IPU6EP_MTL		0x7d19
+#define PCI_DEVICE_ID_INTEL_IPU7_MTL            0x645d
+#define PCI_DEVICE_ID_INTEL_IPU7P5_PTL          0xb05d
 
 static const struct pci_device_id ipu6_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6) },
-- 
2.54.0


