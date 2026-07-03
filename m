Return-Path: <linux-media+bounces-66470-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +hHfJwfWR2pQgAAAu9opvQ
	(envelope-from <linux-media+bounces-66470-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:32:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D50703E7C
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:32:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=hEdlc8qa;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66470-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66470-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 543A73044F33
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0AB3414DEF;
	Fri,  3 Jul 2026 15:25:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1748E3DB305
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092321; cv=none; b=KKfHFmga+Zfta53rsjZe8QlFWks/twLtJufdbzuIT6g4A+RVdSxp2ILfD3VqB28+B/iCBfvAuuj+K4yQUjKUoDDjPWl6lLqBYwrYkgeJ5Q7CHVRF0zZBQxmO1ki5eRsIlWxpT+WOjXVyyEtK7nI9LIJ1xH9QGeMAeUzcIcus2uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092321; c=relaxed/simple;
	bh=oCFSbubnNVqMNJmmxoR5NfD7hHYUVewG+c8fBEXTTS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6IBw2IAqZQ/KaJYsrOjgoq4XCI3UbK4h4a2qQ9lo3HHFIvcBD0gbWnz/J1Qhwqgb+Wbw9FfW1ad2WTIP/LszlMURYaUDMtoUWqlDJ6xBngnAz1K8ZDfHte+wRrPVIxcyUUoQ5H+2Muma371MeRlCl7AkTNg3QiX/095lGINQNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hEdlc8qa; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092320; x=1814628320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oCFSbubnNVqMNJmmxoR5NfD7hHYUVewG+c8fBEXTTS8=;
  b=hEdlc8qaNOh5552ewyy4Ibt67gvZLv2U8T7R5ovsd5GWZpSVEboBEgvj
   NbV8zpH2xm2yYIRsKj5iNvZRPfEi87tIyQggZgIOPndgw1hH66PhGw/Gq
   T0m+i088inCJ0tN4ehJgNdo/sB/nnHAW/6uLUXvM0eAkk86nSpaOfvpZb
   17oq4N8oRYHoB+t+aHH2ZMgTs0Pi905RML/ikJubD1k6NmZJcyOZtvzqB
   Y7Aezrh1HWPBtQKRUjmMRgv7gNw8e9g36seCkzmkIPUXF6AIV/LUUuxMg
   tAKPo8IiJlQTN0nTYB3nkg5LRyAxRUSGWNyaT+YbGGuY5SiXxgAnMLGeT
   w==;
X-CSE-ConnectionGUID: hbsgaSkLSk+gAzOktzqnSQ==
X-CSE-MsgGUID: mwlwVfZ+QhqvB81j3oRURA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396124"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396124"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:20 -0700
X-CSE-ConnectionGUID: orTDsUMSQV+YVc0pd62CMg==
X-CSE-MsgGUID: PyuyijptQ22T4R43iIVx/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799473"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:18 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 04/41] media: ipu6: Remove duplicate warnings in cpd validation
Date: Fri,  3 Jul 2026 18:24:14 +0300
Message-ID: <20260703152451.1743132-5-antti.laakso@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66470-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: F3D50703E7C

Some of the error paths printed same or similar errors twice,
once is enough.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-cpd.c | 29 ++++++-------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-cpd.c b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
index b7013f6524ec..966a16a300f8 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-cpd.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
@@ -266,7 +266,6 @@ static int ipu6_cpd_validate_moduledata(struct ipu6_device *isp,
 					u32 moduledata_size)
 {
 	const struct ipu6_cpd_module_data_hdr *mod_hdr = moduledata;
-	int ret;
 
 	/* Ensure moduledata hdr is within moduledata */
 	if (moduledata_size < sizeof(*mod_hdr) ||
@@ -276,15 +275,9 @@ static int ipu6_cpd_validate_moduledata(struct ipu6_device *isp,
 	}
 
 	dev_dbg(&isp->pdev->dev, "FW version: %x\n", mod_hdr->fw_pkg_date);
-	ret = ipu6_cpd_validate_cpd(isp, moduledata + mod_hdr->hdr_len,
-				    moduledata_size - mod_hdr->hdr_len,
-				    moduledata_size);
-	if (ret) {
-		dev_err(&isp->pdev->dev, "Invalid CPD in moduledata\n");
-		return ret;
-	}
-
-	return 0;
+	return ipu6_cpd_validate_cpd(isp, moduledata + mod_hdr->hdr_len,
+				     moduledata_size - mod_hdr->hdr_len,
+				     moduledata_size);
 }
 
 static int ipu6_cpd_validate_metadata(struct ipu6_device *isp,
@@ -325,10 +318,8 @@ int ipu6_cpd_validate_cpd_file(struct ipu6_device *isp, const void *cpd_file,
 
 	ret = ipu6_cpd_validate_cpd(isp, cpd_file, cpd_file_size,
 				    cpd_file_size);
-	if (ret) {
-		dev_err(&isp->pdev->dev, "Invalid CPD in file\n");
+	if (ret)
 		return ret;
-	}
 
 	/* Check for CPD file marker */
 	if (hdr->hdr_mark != CPD_HDR_MARK) {
@@ -346,17 +337,11 @@ int ipu6_cpd_validate_cpd_file(struct ipu6_device *isp, const void *cpd_file,
 	/* Validate metadata */
 	ent = ipu6_cpd_get_metadata(cpd_file);
 	ret = ipu6_cpd_validate_metadata(isp, cpd_file + ent->offset, ent->len);
-	if (ret) {
-		dev_err(&isp->pdev->dev, "Invalid CPD metadata\n");
+	if (ret)
 		return ret;
-	}
 
 	/* Validate moduledata */
 	ent = ipu6_cpd_get_moduledata(cpd_file);
-	ret = ipu6_cpd_validate_moduledata(isp, cpd_file + ent->offset,
-					   ent->len);
-	if (ret)
-		dev_err(&isp->pdev->dev, "Invalid CPD moduledata\n");
-
-	return ret;
+	return ipu6_cpd_validate_moduledata(isp, cpd_file + ent->offset,
+					    ent->len);
 }
-- 
2.54.0


