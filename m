Return-Path: <linux-media+bounces-57139-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HjLNJ0QxWkI6AQAu9opvQ
	(envelope-from <linux-media+bounces-57139-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 11:55:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F71333D59
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 11:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7137430BD985
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 10:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7984E346FC8;
	Thu, 26 Mar 2026 10:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nwzm7oce"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69608382F39
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 10:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521970; cv=none; b=j/k+6HjKlUlP/FMbJGBylDAn4g4oG33ZJpvrdc8uD1aeLCgkn1/me0MmFXaO6StzmyDmrleF5JpWycsl29uNn1ZDyZUc4hbRhMCSf2kBEO1aWFI+tHMxeZpf1JgxPPsTHLV+kZWQLqcnDSoIel1LwdzlKcSTbqhQSE+9BPUypTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521970; c=relaxed/simple;
	bh=ZJZ4eU/Z6kZMsaMFWYaP3OUf6TsQKy/TzTZOlVkCAjY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=P32pbSiQMntgBAxbI1bqSlm35kh0Cl+CXKVfw28cvoQmTsZULYGrpBo9LUeU7JeUxGMsccN+j7mLDP7ERSmTMweSpfHqt639kFyC5qI2/TRjmhH+rz++fnSaQyZ8qeUd21enDlSRJq1gNXiMzSLDcnC3i5ZA8rVgTu8bpeliVQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nwzm7oce; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774521970; x=1806057970;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZJZ4eU/Z6kZMsaMFWYaP3OUf6TsQKy/TzTZOlVkCAjY=;
  b=Nwzm7oce6XgPfZv3ugjYHb846ZpQ/H07T95LewuGCrA968rJfNNEksc3
   kSRA9jWLW+klMJQVzlj0NdKUk9PTHb2ZAPn1gxrJaPsO+fIKDQTI0FlfE
   YiIod4AXT/hEiQ7+VfbwRI9Q97w0ewWV1pEe/AphDliqYWg0HfRz3a9E/
   6FG7Bdmtyy5VAIyul3yDpHaF1us1bv6duM8pp8lXZb+9iKYJChEWa9IVu
   Shhw2mbeFKj+6jldJLQv8JN9dHDoxDey6NILiGXdnSBcmoWiIMcEGmeF8
   GjpHKcbZhJAIhbnWpkBkoVARbfivlx+Fta8rpll1RmLS8xRnOEoBW3U09
   Q==;
X-CSE-ConnectionGUID: EndBTOahQ++iC24h28fWyQ==
X-CSE-MsgGUID: Mhs+GYnLStKDGXaDNV9Qug==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86950194"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="86950194"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:46:09 -0700
X-CSE-ConnectionGUID: QEshd2djS/KZybmYQ+vEyQ==
X-CSE-MsgGUID: PX4Qp99XSMq1G20Q8eUuHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="221661364"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.1])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:46:08 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BD43B1214B2
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 12:46:11 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w5iE7-00000006ecx-0b0m
	for linux-media@vger.kernel.org;
	Thu, 26 Mar 2026 12:46:11 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: Documentation: Use right function to test device power state
Date: Thu, 26 Mar 2026 12:46:11 +0200
Message-ID: <20260326104611.1586131-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email];
	TAGGED_FROM(0.00)[bounces-57139-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41F71333D59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Tell driver authors to use pm_runtime_get_if_active() instead of
pm_runtime_get_if_in_use() to check the device's power state in the s_ctrl
callback. pm_runtime_get_if_active() is the right function to use here
since it returns non-zero if the device is powered on rather than its
PM runtime usage_count is non-zero.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/camera-sensor.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 94bd1dae82d5..c8552f70f496 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -114,7 +114,7 @@ of the device. This is because the power state of the device is only changed
 after the power state transition has taken place. The ``s_ctrl`` callback can be
 used to obtain device's power state after the power state transition:
 
-.. c:function:: int pm_runtime_get_if_in_use(struct device *dev);
+.. c:function:: int pm_runtime_get_if_active(struct device *dev);
 
 The function returns a non-zero value if it succeeded getting the power count or
 runtime PM was disabled, in either of which cases the driver may proceed to
-- 
2.47.3


