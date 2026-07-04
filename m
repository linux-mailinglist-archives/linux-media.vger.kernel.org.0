Return-Path: <linux-media+bounces-66590-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TFPrEv9BSWryzgAAu9opvQ
	(envelope-from <linux-media+bounces-66590-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 19:25:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ADF708154
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 19:25:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="gngJ/oRs";
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66590-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66590-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1CE33028C5C
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 17:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E4A376BF2;
	Sat,  4 Jul 2026 17:24:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72B03769FC;
	Sat,  4 Jul 2026 17:24:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783185865; cv=none; b=SQz/cNsaMN5fvGRF/SWYKmVmZr9JQdfUMq/eauX+O4ThbktyjVccdcn7/nkcDLwLOAFGSO2ycofVcbs0LzJc0GCs8xdXmSVVNACIylUQlVrimYfILhrG3qMU2KR4v2i1sWLy0Wxe7yMAhRiNEe4AJbbFs9np+U8J2/MIarvEgOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783185865; c=relaxed/simple;
	bh=LbGUAz7CFaiFiFA3qwNbHTIPBBQz+Bit3qLvS5IIrBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TqefEV0FkQPxqaly31/MQI1DFP1M3RN1BSWgVCHPv9bcSXrkDg7/xUG//yAPpIfS5KamZ7n9L41yDNzJvf6hafQgK5wBERxZapoopKp1FU+roVVUxtW5kwBBEZ9g3QInQBifiLtKB1PbS7IQ/AkXjN7yOW6PZz8mL701a0zP+R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gngJ/oRs; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783185864; x=1814721864;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LbGUAz7CFaiFiFA3qwNbHTIPBBQz+Bit3qLvS5IIrBI=;
  b=gngJ/oRsTmhuNk+1dTNahvjMq0XlvGoH5A+t4VSHFCHcqpQzlzsY2Ug1
   wjZGvW9Lpwlv5uQ11HdPG6DDvRW9fQ87qDXNicCCRVyDOOEYjYO21H0ex
   P4Po+ozOiG1H7JAkkDs/Y8v85bSDjIraAgej64Sc/7OGOx5HNzlSsJB8z
   SbVQOQrJzVFwAUgQnIMJ+wDjgHe5aWTndD4ADqpKRJHNkIO/n1kDsKk1i
   0mkzbnQnQDKXXDJ4InQEPGk3IM1AkzKvyVR1Gw5VBqVqgEaXskimLwzQn
   DmnmAoUcDhS+Sly3IXg2desS1gz3QxMouSl+FmOohkeO9mHCC1ah0N5nu
   g==;
X-CSE-ConnectionGUID: gSQ72+KhSGaG8IAE0/bYpA==
X-CSE-MsgGUID: AA7KUBVKTjizLSbD07u0cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="101308164"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="101308164"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 10:24:23 -0700
X-CSE-ConnectionGUID: Iae4OuvhTQ+CxZNt5ICuXA==
X-CSE-MsgGUID: LrJoX8TkSzisD4n/SYdCpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="250677825"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.6])
  by fmviesa008.fm.intel.com with ESMTP; 04 Jul 2026 10:24:20 -0700
From: Arun T <arun.t@intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Miguel Vadillo <miguel.vadillo@intel.com>
Cc: Len Brown <lenb@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@intel.com>,
	linux-acpi@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] media: pci: ipu-bridge: Add NVL CVS ACPI ID
Date: Sat,  4 Jul 2026 22:48:53 +0530
Message-ID: <20260704171855.1462214-3-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704171855.1462214-1-arun.t@intel.com>
References: <20260704171855.1462214-1-arun.t@intel.com>
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
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66590-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:mchehab@kernel.org,m:miguel.vadillo@intel.com,m:lenb@kernel.org,m:sakari.ailus@linux.intel.com,m:mehdi.djait@intel.com,m:linux-acpi@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:from_mime,intel.com:email,intel.com:mid,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1ADF708154

Add INTC10FA to the IPU bridge ACPI match table so the bridge can
recognize NVL CVS devices.

This enables the camera bridge path to bind on NVL platforms where the
CVS device is exposed through the INTC10FA ACPI ID.

Signed-off-by: Arun T <arun.t@intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 88581a4c081d..23bd29b7a393 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -171,6 +171,7 @@ static const struct acpi_device_id ivsc_acpi_ids[] = {
 	{ "INTC10DE" }, /* LNL */
 	{ "INTC10E0" }, /* ARL */
 	{ "INTC10E1" }, /* PTL */
+	{ "INTC10FA" }, /* NVL */
 };
 
 static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev)
-- 
2.43.0


