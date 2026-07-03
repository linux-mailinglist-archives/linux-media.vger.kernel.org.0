Return-Path: <linux-media+bounces-66495-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id spSSIYbWR2p2gAAAu9opvQ
	(envelope-from <linux-media+bounces-66495-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:34:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B797703ECA
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:34:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=HqlcTHuO;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66495-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66495-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EB0F30F25F3
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D70417368;
	Fri,  3 Jul 2026 15:26:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A593141735E
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:26:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092379; cv=none; b=UaGzHIKvrsF60DcOX4h+/ErjKQBrrMAVLzCYw4jaJHI1hQ0E27Lgic+x6+Op4iEgs1rP3X4kDkU+s/17RK/0vY8x7gNHoOp1tQHM6BidI6JoYOPdguR4pEsixF/O/ZL8gwin84tdMZpzgmJkFMnsDEIha6peSaf8ePe9daLt9+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092379; c=relaxed/simple;
	bh=tarOwWnEgYxnbRh8OI81+xJxjnWromge+4PdHaX/7vI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=on+MssenysTISPdwL+k+Ewq1dI4ZnIxHLe+4BoFycVY3npNFayhsR8mi1ZqXaAPQ6CWXv8fPnOB2luGLMRi/j6xw20aZRCvojGrI56jYKMcK6d83Y+pNiZLqT9BJlW8revqwLXyxs1QJW0oSMSDmWm9brfsEol0URuVYvmdKY88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HqlcTHuO; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092379; x=1814628379;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tarOwWnEgYxnbRh8OI81+xJxjnWromge+4PdHaX/7vI=;
  b=HqlcTHuOth2UqMVKDgFXfzR2Klp/PoEkjfkoyx/epagjiXs6B69zIhGx
   oQy8ElWOrOFBE3G3x65m3LReIsEf4vbv2iZ44P7A0IV9O2IrO0DgGME/T
   6TF0w+80By8CIm5rEh9XbaylY+1mZ68S+ABfnnK5WZw9sUkeTSGsrom9q
   W+DmNy6J08XZgGE/8//RVlAT/4KNhVxTiHD6QIaAbrVzf4P+98z4eLEQx
   7TwOzTeotW3kBtG6zHs35d0pyX0VdgNI17IPsC6sGmOfI3muiteC9YnBM
   M8HEqGq+OGn61OSgNZmBJMahyZbXNJk2kobBQQgWFa6T0OhsOiqm/9kJj
   Q==;
X-CSE-ConnectionGUID: ataJWiJ6SDqj4kMM/YNh9g==
X-CSE-MsgGUID: IOAYgpQdTvW51uQOxhEVew==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396231"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396231"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:18 -0700
X-CSE-ConnectionGUID: mlwlXV4rR5+gsHPrWrNfEw==
X-CSE-MsgGUID: Z95GSRLnSxSoQWZMFwvZXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799747"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:26:17 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 29/41] media: ipu6: Skip watermark configuration for ipu7
Date: Fri,  3 Jul 2026 18:24:39 +0300
Message-ID: <20260703152451.1743132-30-antti.laakso@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-66495-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 7B797703ECA

The ipu7 don't have watermark nor LTR support, skip it.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c |  4 +++-
 drivers/media/pci/intel/ipu6/ipu6-isys.c       | 12 +++++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 560524e6e624..dae6fbb0756a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -727,8 +727,10 @@ void ipu6_isys_update_stream_watermark(struct ipu6_isys_video *av, bool state)
 {
 	struct isys_iwake_watermark *iwake_watermark =
 		&av->isys->iwake_watermark;
+	struct ipu6_device *isp = av->isys->adev->isp;
 
-	if (!av->watermark.pixel_rate)
+	if (pci_match_id(ipu7_ids, isp->pdev) ||
+	    !av->watermark.pixel_rate)
 		return;
 
 	if (state) {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 7db0bc657a4c..d374fdf80381 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -826,12 +826,12 @@ static int isys_runtime_pm_resume(struct device *dev)
 	isys->power = 1;
 	spin_unlock_irqrestore(&isys->power_lock, flags);
 
-	if (pci_match_id(ipu7_ids, isp->pdev))
+	if (pci_match_id(ipu7_ids, isp->pdev)) {
 		ipu7_isys_setup_hw(isys);
-	else
+	} else {
 		ipu6_isys_setup_hw(isys);
-
-	set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_ON);
+		set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_ON);
+	}
 
 	return 0;
 }
@@ -840,6 +840,7 @@ static int isys_runtime_pm_suspend(struct device *dev)
 {
 	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
 	struct ipu6_isys *isys = dev_get_drvdata(dev);
+	struct ipu6_device *isp = adev->isp;
 	unsigned long flags;
 
 	spin_lock_irqsave(&isys->power_lock, flags);
@@ -853,7 +854,8 @@ static int isys_runtime_pm_suspend(struct device *dev)
 	isys->phy_termcal_val = 0;
 	cpu_latency_qos_update_request(&isys->pm_qos, PM_QOS_DEFAULT_VALUE);
 
-	set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_OFF);
+	if (!pci_match_id(ipu7_ids, isp->pdev))
+		set_iwake_ltrdid(isys, 0, 0, LTR_ISYS_OFF);
 
 	ipu6_mmu_hw_cleanup(adev->mmu);
 
-- 
2.54.0


