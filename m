Return-Path: <linux-media+bounces-66366-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GdB9E0FnRmo5SwsAu9opvQ
	(envelope-from <linux-media+bounces-66366-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 15:27:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA456F8563
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 15:27:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=i4OPgdsE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66366-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66366-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00E1B303B594
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 13:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8354A138F;
	Thu,  2 Jul 2026 13:25:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D385942B32B;
	Thu,  2 Jul 2026 13:25:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782998740; cv=none; b=olbXAiT6e1P/ywlBUrSIjqBHYNH+aQluV3/luWoOXfTJGTVdGg/7IzL0Wz6WPZyuu3c3gPv2b9mx0lVkmyiJ4O6Zb/Xj15uFnZuckiEck5ANap+M6+Zv53E+EBWAcXg+aFg943sn9xucLwI4jqGGfsBp4c8DOhWdEDQm7JSI4QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782998740; c=relaxed/simple;
	bh=LbGUAz7CFaiFiFA3qwNbHTIPBBQz+Bit3qLvS5IIrBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rBXcgFKNYyu9myBgD7QhT5fAe6AIkw3y8vDPh+VySCR+w7mt+6Z9pmSJ+hzSFfddyLHSap7jyGWmn1K96ChMNjrdWAGdK1Rd0GfF/JXLjAMh51xR87rik1pU4N/kHdvxNB7tjyiNLEGBD3rIY1Dh+c2gvVGazPp2+wt/2WDyWS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i4OPgdsE; arc=none smtp.client-ip=192.198.163.19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782998738; x=1814534738;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LbGUAz7CFaiFiFA3qwNbHTIPBBQz+Bit3qLvS5IIrBI=;
  b=i4OPgdsEPtgmVlymCWF4G1MQ9UVH3JBwlvT8iqMG9zNcbbR6oagbnP2B
   SWImGqMcxk5D2vrzCa5WbKf+d1qBn4feMrQt+BUO+TLYlvkKx3Lu3+gCM
   IfD2I2OVPIAQacodBQwEmroXp1znVIlJOR+1NV56YwUPVvLyDZeRlYSil
   8EF3+lr2dqMsoMmk6bgWqA6dO0AuclGc8HfKUDxA4Yt48XrpUSUQW4W1N
   u08+f6AFaskP2JBNrAuvsTcbAyU4icHpSIWgWaI+LfB1xNy0M8ePf9gfH
   dljJ4o5zDV8qajwKUyHGhUZCb8V1vwgLoYfVoiS7YVI92ebTNDrsGuLqR
   A==;
X-CSE-ConnectionGUID: OHsr081sR1u3E4rb4Dl6dg==
X-CSE-MsgGUID: ptxedTYdTPunBWcvyBzvOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="82742270"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="82742270"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:25:38 -0700
X-CSE-ConnectionGUID: aTSUZee6S3Whj0X1zqz6iA==
X-CSE-MsgGUID: iiini5sjQb+JB//Aw23t6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="250209817"
Received: from intel-nuc8i7beh.iind.intel.com ([10.223.163.6])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jul 2026 06:25:36 -0700
From: Arun T <arun.t@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehdi Djait <mehdi.djait@intel.com>
Subject: [PATCH 2/4] media: pci: ipu-bridge: Add NVL CVS ACPI ID
Date: Thu,  2 Jul 2026 18:50:21 +0530
Message-ID: <20260702132021.1225818-1-arun.t@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66366-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mehdi.djait@intel.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.t@intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BAA456F8563

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


