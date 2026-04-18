Return-Path: <linux-media+bounces-59070-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xFTqJCpQ42mbEwEAu9opvQ
	(envelope-from <linux-media+bounces-59070-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 11:34:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B760142092E
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 11:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B29E9300AB06
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2026 09:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D391C335554;
	Sat, 18 Apr 2026 09:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T5DStEa5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC4D1D5CD1
	for <linux-media@vger.kernel.org>; Sat, 18 Apr 2026 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776504869; cv=none; b=pHCO+URjMwA2x0OWEUjHgKfJzkDhfX9n8I3iCj+hQWnSTHvFFA0WDjrJE03oq8nRxf+fHByanwxhTeiXkVLsAw9rwwWb/yRuOfYVBQ5q2a2aDlanDMIt5NOk2rBdzi5PWUabpZSz17+6FO/ZWwgeRTiTeb25ixMCCoy70l+mkwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776504869; c=relaxed/simple;
	bh=bws97b1kEda8E/QWvBGw+p35/oid8Kj5sNWSILzUwFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LWqGdVGIKJpTk7tgxBEOtmmNDXJeLqzX3Fw5my9PxB+ePiwHJhUcq5zG398F+QBTTvIJx7CQGXHnsTnuBcW+LDczZeyRHDNojHHtV8twM5+fW7bQF+nUqNmq22tf9jMhf3GI4XGqxfuox1hG97LZmtVi2Am2TH0Vf+pW0nWmXhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T5DStEa5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776504866; x=1808040866;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bws97b1kEda8E/QWvBGw+p35/oid8Kj5sNWSILzUwFg=;
  b=T5DStEa55cRMgqJsV661Q6MBUUdJRBKFhPsxUUxbpVWcoFCBbyBhMv1W
   /jmyzVupHx8J7PcbTKem02iKIDlOGZuR8b/eOz+z1EnPmtw/4OGX01pdi
   WCx6AFqB8ItF0FYpvXgY5TlSuVkRG140lzRKA6zNPByRCWv2jv1Ed+yXK
   Zrd7+2kP7KLSgBIOUd3eajAG+4VktxfD82mbo8CBW/f7UYxO/0WJcD7W3
   efN0m0deiglucr1SONXIRGgVwBYIvKuml1aVeGBnOimb8UZJ0cWaM4P7E
   tFPSQZENBkRLf2ZbtOcnsCKeMmZ4LxUWEUbeY4ub6b+XlB4pZ1Ss4H2vF
   Q==;
X-CSE-ConnectionGUID: i013JprCQwapt/SD3sqknA==
X-CSE-MsgGUID: BxluQRsHS9ewsjaf2wt4WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81373149"
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="81373149"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 02:34:26 -0700
X-CSE-ConnectionGUID: 47Qa2NNPQkqFkUEprZvL6Q==
X-CSE-MsgGUID: T9TEmtaLQJSwF+SxUC2V6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="228105310"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.245.232])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 02:34:25 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EAD0A12081C;
	Sat, 18 Apr 2026 12:34:21 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wE24C-000000000Zl-3aiV;
	Sat, 18 Apr 2026 12:34:20 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/1] staging: media: atomisp: Update TODO file
Date: Sat, 18 Apr 2026 12:34:20 +0300
Message-ID: <20260418093420.2205-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-59070-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B760142092E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the TODO file to match the current state of affairs. Add sensor
drivers and make adding ISP parameter support optional.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/atomisp/TODO | 36 ++++++++++++++++++------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/TODO b/drivers/staging/media/atomisp/TODO
index 82be275b4a0a..22a579eace2c 100644
--- a/drivers/staging/media/atomisp/TODO
+++ b/drivers/staging/media/atomisp/TODO
@@ -1,9 +1,10 @@
 TODO
 ====
 
-1. Items which MUST be fixed before the driver can be moved out of staging:
+atomisp
+-------
 
-* Remove/disable private IOCTLs
+1. Items which MUST be fixed before the driver can be moved out of staging:
 
 * Remove/disable custom v4l2-ctrls
 
@@ -11,19 +12,13 @@ TODO
 
 * Remove abuse of priv field in various v4l2 userspace API structs
 
-* Without a 3A library the capture behaviour is not very good. To take a good
-  picture, the exposure/gain needs to be tuned using v4l2-ctl on the sensor
-  subdev. To fix this, support for the atomisp needs to be added to libcamera.
-
-  This MUST be done before moving the driver out of staging so that we can
-  still make changes to e.g. the mediactl topology if necessary for
-  libcamera integration. Since this would be a userspace API break, this
-  means that at least proof-of-concept libcamera integration needs to be
-  ready before moving the driver out of staging.
-
+* Refactor the codebase (random cleanups won't achieve this)
 
 2. Items which SHOULD also be fixed eventually:
 
+* Support ISP parameter passing via parameter buffers (see
+  drivers/media/v4l2-core/v4l2-isp.c).
+
 * The driver is intended to drive the PCI exposed versions of the device.
   It will not detect those devices enumerated via ACPI as a field of the
   i915 GPU driver (only a problem on BYT).
@@ -33,10 +28,23 @@ TODO
 
 * Ensure that the driver will pass v4l2-compliance tests
 
-* Fix not all v4l2 apps working, e.g. cheese does not work
+sensor drivers
+--------------
+
+* Use v4l2-cci for register access
+
+* Implement enable_streams and disable_streams pad ops (use s_stream
+  compat helper)
+
+* Implement Runtime PM support (see e.g. ov8856 driver)
 
-* The atomisp code still has a lot of cruft which needs cleaning up
+* Use sub-device state and remove state related fields from device context
+  structs
 
+* Implement modern V4L2 camera sensor controls (see
+  Documentation/userspace-api/media/drivers/camera-sensor.rst) or even
+  Common Raw Sensor Model (which isn't in upsteam yet though; see
+  <URL:https://gitlab.freedesktop.org/linux-media/users/sailus/-/tree/metadata?ref_type=heads>).
 
 Testing
 =======
-- 
2.47.3


