Return-Path: <linux-media+bounces-66503-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dmbyE07VR2rtfwAAu9opvQ
	(envelope-from <linux-media+bounces-66503-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:29:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EE2703E0D
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:29:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=LcTrrbiz;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66503-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66503-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C01CC3098F48
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F078D41735F;
	Fri,  3 Jul 2026 15:26:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E93417350
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092398; cv=none; b=YY9+OecCPPSvXR25DqvMG48XF20pcZUhjXaihqzDrmkTQeA26OMbJijMDuId7SAqY295lhIF0fYPALWtSOkLB2PJW2+75WeaGOAhbOxxIhWm0QBRjuFWp+SX6AIRpYf92Fiqo76A/fxWcwyZz7vxyeuptOnamEK7BmrRvZpggOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092398; c=relaxed/simple;
	bh=aStwut9s5/2Zj0qycgwA8jfBTwND7y7r54v7YlbOiqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qVXaOZDARHxq36uJArU/K51Nw2zbTl+Si68rhQygNW19agt85h33ScRF0Kx8tN2VFCirc8muiCcan3NnzDgb0R/kX72JJMYkj7abDr2cM5LHeOYNBloidc0JBt47o6Eq2O5wYJ06yOVqVopWfPTBuWXpeWYRqF4+HZHHOG1QRE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcTrrbiz; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092397; x=1814628397;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aStwut9s5/2Zj0qycgwA8jfBTwND7y7r54v7YlbOiqo=;
  b=LcTrrbizVoFqhQgUp278i6vS0ChaVqNGH0XLmWOgKUKKU/KoEgrGHACM
   4DDQSqA0OHTKVDrPGpW1xLJJjbHllSugvLgYd1RPKUsrWVLunkH4lh2ij
   0q8pe6kj1F+i3HJxUbcB7NYYaj1Oi5PcxjOEyqlcvP2Gc2axTvIjmtA56
   G6qbs3uTNctrgpJSo0+svxTeXjnq6eW2rrRTgnHM4CSCly3LZtFfz1EfZ
   uC9U+xSUzLcKGPQCAmXiwFrRAV8643oA/Tb5K/IA9VXjWCE9sj2Bl7HT3
   bEJ0MUDE7j2qxV4NMfmwzBGOHE3A/cOrji22mq84lZSsar72GfBEltZ66
   A==;
X-CSE-ConnectionGUID: WRneeFHdTZmSUTf75nF0ew==
X-CSE-MsgGUID: fVRLs9y1TtmQPERaHCMc5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396273"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396273"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:37 -0700
X-CSE-ConnectionGUID: 4eTcoiltQAGLKPHrU1SCrA==
X-CSE-MsgGUID: qQUC7lcmTrC/HWjeAyVIcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799846"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:35 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 37/41] media: ipu6: Add check for pkg_dir before freeing
Date: Fri,  3 Jul 2026 18:24:47 +0300
Message-ID: <20260703152451.1743132-38-antti.laakso@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66503-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid,linux.intel.com:from_mime,vger.kernel.org:from_smtp,intel.com:email,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9EE2703E0D

We are adding support for mapping ipu7 firmware, which doesn't have
pkg_dir.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-cpd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-cpd.c b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
index 186d3dd771cd..72d51b2b0efd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-cpd.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
@@ -234,8 +234,9 @@ EXPORT_SYMBOL_NS_GPL(ipu6_cpd_create_pkg_dir, "INTEL_IPU6");
 
 void ipu6_cpd_free_pkg_dir(struct ipu6_bus_device *adev)
 {
-	ipu6_dma_free(adev, adev->pkg_dir_size, adev->pkg_dir,
-		      adev->pkg_dir_dma_addr, 0);
+	if (adev->pkg_dir)
+		ipu6_dma_free(adev, adev->pkg_dir_size, adev->pkg_dir,
+			      adev->pkg_dir_dma_addr, 0);
 }
 EXPORT_SYMBOL_NS_GPL(ipu6_cpd_free_pkg_dir, "INTEL_IPU6");
 
-- 
2.54.0


