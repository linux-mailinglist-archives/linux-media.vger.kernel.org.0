Return-Path: <linux-media+bounces-66471-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2qKPOhDWR2pRgAAAu9opvQ
	(envelope-from <linux-media+bounces-66471-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:32:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E10B703E81
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:32:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="f7Jd/9iy";
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66471-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66471-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A10930469A2
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20363414DF8;
	Fri,  3 Jul 2026 15:25:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D853DB305
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092323; cv=none; b=WLiU+3ys9AuugSpkl+kpddvP5Y3gNdGY+bDtg7uMSxczWb/4SLJWZhCf/+bGq/hIdGFpv9gcXtF1XByzRm9oQcYQU55b3iEOv45u679oN1Akop/t3pwvZlILFMnd8wuO7Zb3CEEEjOMFKlJet8w95Gm62Sot1coPYxEiF0XxiLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092323; c=relaxed/simple;
	bh=KBIhoRV2AyvUnK64AuCEpt3uP15FBw9pzJP89/edb6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dqvnkh7X1dKTQ/vrP+JxMgc4Kd9cH+ObV6to63t/q6GhLUGzFLHAd1GTGBFuwuUOseC7IPk2JC7lGA5SFP3ZHSBMhMkA3IDWMTjiXbr4TWnKPoHbJdmEUBxgp6uEKb2cLyzypqLPIGNGmdSS71mpsFXLq2H8srus6kIxb9rwv5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7Jd/9iy; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092322; x=1814628322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KBIhoRV2AyvUnK64AuCEpt3uP15FBw9pzJP89/edb6g=;
  b=f7Jd/9iyHG/aITAQ+MXkn8pxFiCaRCEZbGKExxUamk2Q+os621K8tPdx
   ooAA26ELZkwho7MDnSc4Y4XkDpcVzPWQ0chZsuxaRCj7C3UEC3KeyDWyg
   +XjRYJLNfV2f5XcDxCaCIJ7QJOm6X/G7j20gwbdkRVz3iE6phPfBzlbOp
   gvTXzyf5+seJYcZ6yClfApnPUW9ZTQ8qasUU8AHe8+7EerAq7oRK9uNSJ
   Qv0u3t3cKFXDMD3iRuY0yLf+raA1OsinOl/PyrqeKKmPlsJk9lK2ae226
   Kv4JSS53psmwfReVrR4ZyFPRIpvBzn0heMNzmoDGKImrPa8HFPa5DBplG
   A==;
X-CSE-ConnectionGUID: r/LhdEvYSW2t9We/cmQIQg==
X-CSE-MsgGUID: o4VGtUF0QkS1HXJ7npy5vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396128"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396128"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:22 -0700
X-CSE-ConnectionGUID: GKX4bjrMRdOP2uU4qK3z8w==
X-CSE-MsgGUID: 6q/oHGKMTGeuQRGYoqnCpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799476"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:20 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 05/41] media: ipu6: Remove unused ipu6 firmware struct
Date: Fri,  3 Jul 2026 18:24:15 +0300
Message-ID: <20260703152451.1743132-6-antti.laakso@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-66471-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 4E10B703E81

The struct ipu6_fw_proxy_write_queue_token is not used anywhere,
remove it.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
index b60f02076d8a..393245a633f4 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
@@ -511,21 +511,6 @@ struct ipu6_fw_isys_proxy_resp_info_abi {
 	struct ipu6_fw_isys_proxy_error_info_abi error_info;
 };
 
-/**
- * struct ipu6_fw_proxy_write_queue_token - ISYS proxy write queue token
- * @request_id: update id for the specific proxy write request
- * @region_index: Region id for the proxy write request
- * @offset: Offset of the write request according to the base address
- *	    of the region
- * @value: Value that is requested to be written with the proxy write request
- */
-struct ipu6_fw_proxy_write_queue_token {
-	u32 request_id;
-	u32 region_index;
-	u32 offset;
-	u32 value;
-};
-
 /**
  * struct ipu6_fw_resp_queue_token - ISYS response queue token
  * @resp_info: response info
-- 
2.54.0


