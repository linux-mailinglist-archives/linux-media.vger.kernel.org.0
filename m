Return-Path: <linux-media+bounces-66475-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ktyCMjPWR2pcgAAAu9opvQ
	(envelope-from <linux-media+bounces-66475-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:33:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF3F703E9B
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:33:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=S8kFCrg5;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66475-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66475-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2751305777E
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B22E414DF7;
	Fri,  3 Jul 2026 15:25:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DE1414DEE
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092332; cv=none; b=Dc0RwC1pw7K49Ob4jdsSEd9Mlp82Ya8zQV9ebZZe1ZJJx0dyh5d1olGHzcSDp37o++vL48Ls5kUYliQPG+hP+AKPmYvFgvx4GwQbXPKZIlmt7v9z3kq9O9Ey6T0zS0akrr5YC/na5Jd68BxP/wv6de2rOSpAETXMvSjn3yvULkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092332; c=relaxed/simple;
	bh=y6VVAUQ3SMI93dy9+ofAFWpJx9oA0/DUKyKTWV5Vjec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L2BS7z5XvEEkC6U67HJ27CoBXt4bcsgXWyso7gEe5pop6BUD8HmXtXA2w/J3CPBb+FFCOO3g/qDWXnbKti9Cut2WRpWZ4clXjAEh40iRV0u/m1WULxBwXq7/ArAYwSlcUAjA0kNV5b1iYsRNcNWQpCZP8NuAeCKsjrxENRlj+Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8kFCrg5; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092332; x=1814628332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y6VVAUQ3SMI93dy9+ofAFWpJx9oA0/DUKyKTWV5Vjec=;
  b=S8kFCrg5/iuD3NvDzC8prho0se9bHtEM5TnfmpPsR2M3pl4Ryvqq4qgx
   g6dQHXA/I2DP/tCdZAPSCO/7KJinW0h8nlsoLQm6kBAeX54FpcZMHzYdS
   9oRTDabyA/NgHjL51ZF6Md/jYTWUTtZ7+3LaT7t0FMAlKgCsg2DKzOCJu
   XASufPShASNIlK/zEcUVAl38USPmasiK7mTRxoICn9hL/5C6QgZHK/YHn
   Sbx+IQuemSsWDTDld5KC/Tbg/gp/QkQ97AzLFnppubZoxtCjl9SmA6IWq
   6Qf1IQCax3c1GxeAjoU0emI/1bqorAiaGQtzSoJl7aJH3jb7W/Ju1DH4m
   g==;
X-CSE-ConnectionGUID: EntIeSzOQKqjQnxr1lI3Bw==
X-CSE-MsgGUID: xYzQOvl6R2a7TcWk+a5p1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396143"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396143"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:31 -0700
X-CSE-ConnectionGUID: 7a88i86zR+23eWlBo9W9Eg==
X-CSE-MsgGUID: W402RRG7QES3sxKYvFG+vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799492"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:30 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 09/41] media: ipu6: Add ipu7 match tables
Date: Fri,  3 Jul 2026 18:24:19 +0300
Message-ID: <20260703152451.1743132-10-antti.laakso@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-66475-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 0BF3F703E9B

For ipu7 and ipu7.5 runtime detection.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
index 3c1197b59240..fda75f94b0da 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -47,6 +47,16 @@ static const struct pci_device_id ipu6_tgl_ids[] = {
 	{ }
 };
 
+static const struct pci_device_id ipu7_ids[] = {
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7_MTL), },
+	{ }
+};
+
+static const struct pci_device_id ipu7p5_ids[] = {
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7P5_PTL), },
+	{ }
+};
+
 /*
  * ISYS DMA can overshoot. For higher resolutions over allocation is one line
  * but it must be at minimum 1024 bytes. Value could be different in
-- 
2.54.0


