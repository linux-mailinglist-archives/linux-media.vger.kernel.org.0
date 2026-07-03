Return-Path: <linux-media+bounces-66507-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zRdyC6rWR2qBgAAAu9opvQ
	(envelope-from <linux-media+bounces-66507-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:35:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 628CF703EDE
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:35:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=dJgrJkjU;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66507-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66507-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44C2930F9120
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317B5417366;
	Fri,  3 Jul 2026 15:26:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86897417363
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092407; cv=none; b=I1f/LAiM9J2IELlygAw8Smdt17wtd253ISeZo5OKrgsmKQG+neIxCccwHg9xwiSmFuQmTuBvYRY/xVOlWnjbg62ZwbLaSkMcNlvCBI1beHCFR7rNjX85whMAX42JNyYNbKGJW/8FlFIdnGJNv6fMRRf4EYxkO/ompY/9t7V4Y50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092407; c=relaxed/simple;
	bh=WtS+wACIiJBtzkLY25Y0pjASNADARee490AFqmjcVrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tft8BuNLKoBkmjeY7qPdp4V3hmzANAgF+kb7idUU3/7tFZ0AbWInfFr8eRzRvWMKQn4YLj3M9YMCXz76XIM5/Je1s6lBQwNYLtI7ncUt9JxKQJXwQLbH+wmDdSeW5pX2VKKzpf6GuO2Iyn1J0Y01Tvyx4iaOkShquxnF1YQ3jz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJgrJkjU; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092406; x=1814628406;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WtS+wACIiJBtzkLY25Y0pjASNADARee490AFqmjcVrk=;
  b=dJgrJkjU8OcJ7sMcIN9KWg/2yZxtz+xG/CbPxrToDGqSISmWmS/4NthI
   IbtdVR8lnpYN32XYxz2vLO32S2hIydhk+q+jfWKcsnFDBOV6dRGz8Zspc
   3EicMRa00KqF46Isl2pFEecxygaBa2za/bjP+bCbjhRteC13uk8uApai6
   3xmJGBFN/nT7MDni1UmcbWfq2a/nphdsGveqihyvXHG44ucys/bGE21MY
   FyzU0K+d6uQcoFob0vpActsSJpk+gN+johTk76eX/c0pOoO8rek+UOk7F
   tnU4REgn8FAmzM47J7HngVIQqtOOwMgMX48BJ6RZKQGi+/JAnlfFm8v4G
   A==;
X-CSE-ConnectionGUID: 8fTOqW1cT+21OS+AE/y6+A==
X-CSE-MsgGUID: Q927njl6SHmM3pIN3xeIrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396289"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396289"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:46 -0700
X-CSE-ConnectionGUID: x7LG0qcDS+CEkExrAGSHcw==
X-CSE-MsgGUID: yjjBPn75Q8WUW06XE22JJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799861"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:45 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 41/41] media: ipu6: Add ipu7 as supported device
Date: Fri,  3 Jul 2026 18:24:51 +0300
Message-ID: <20260703152451.1743132-42-antti.laakso@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-66507-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime,intel.com:email,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 628CF703EDE

Include IPU7 PCI ID in ipu6 driver ID table.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 include/media/ipu6-pci-table.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/media/ipu6-pci-table.h b/include/media/ipu6-pci-table.h
index 022d6f255ad5..c2a1f2f1bc7d 100644
--- a/include/media/ipu6-pci-table.h
+++ b/include/media/ipu6-pci-table.h
@@ -24,6 +24,7 @@ static const struct pci_device_id ipu6_pci_tbl[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_ADLN) },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_RPLP) },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_MTL) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7_MTL) },
 	{ }
 };
 
-- 
2.54.0


