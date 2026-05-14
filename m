Return-Path: <linux-media+bounces-61624-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I4gHSIZBmrGegIAu9opvQ
	(envelope-from <linux-media+bounces-61624-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 20:49:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3058B54606C
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 20:49:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F0E63016438
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 18:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8284C3BB134;
	Thu, 14 May 2026 18:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5ZTFO72"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAF23A5449
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 18:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778784513; cv=none; b=tLvBv+DMXk309JOBrbAL6FbblLeGY6L6OYBtC3IiykDoxz1H/QgBvOVlEOli5K8kMXBu4bK6gM+2MN164Fj7FhXSAzAP6OP1aRhDJpYp1+R9nm0qgyUiyaVXy2bJbha9pwOkfxBXrX/n0Sh06q4WSk/7Nzny9c64Upz5bm4uZ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778784513; c=relaxed/simple;
	bh=ZI9QAqPTKHIuHkljrSxaxrd+l8tSYMcSn6ynPqZMGis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOuskbG4RxJ91nyJaVrqAz4lHZ4zzXhfN0ksuVbzGXvUlX1JTL5vJJvW9+d1iS87JPXYyFCkQnd+FytOHTyeVWuYAUv84DxxBYT5HaF2sySe5Lyhk8mDhFNFk93tCmL2egoJO9I3wcZTjPQi6mDqHtqQI37A6fvOId3NIgNgBeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5ZTFO72; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778784506; x=1810320506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZI9QAqPTKHIuHkljrSxaxrd+l8tSYMcSn6ynPqZMGis=;
  b=H5ZTFO72c7dE6eLEEWbaa2/rWgv5BFVPutJ/HxVcV1a46+OAWcqaEK+Z
   y/XqcPTjoQq855WfajkPXyg+1+Tz3mX8VIiBLvW5oCkLEPYxMMv/i+tbh
   5gXYeOusTJkMGEmlJuOO9OxOtcQRCQqXdE4lCaWHGJ+3cgE5HzGXSCPRR
   3rsWCxXvN1fiomHtr8YpqmtHhOMUxxtN/Urs2WCTVdb4nCIu91XMyTqkH
   tDOgIYRkmXXbJPLcdCkBQjSh7l3tRGLuEboQaw40YiYWbPxH7k4RTZ+AS
   b+nuEesZMD6yQUkD4odbA3TlBmjSI0ZTbJZ6UEm3IGTpF462aIbYMQIOR
   Q==;
X-CSE-ConnectionGUID: 4l9HKcwNS4ef8KYyzZ1ymg==
X-CSE-MsgGUID: O+j3W1cRQTy9ffyzw3GOdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90044654"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="90044654"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 11:48:25 -0700
X-CSE-ConnectionGUID: U24/r5tYQA++0G/wAkNVbQ==
X-CSE-MsgGUID: aAlt3uGQTV2QY8NptrENsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="237474949"
Received: from ubuntu.jf.intel.com ([10.54.60.90])
  by orviesa006.jf.intel.com with ESMTP; 14 May 2026 11:48:24 -0700
From: Miguel Vadillo <miguel.vadillo@intel.com>
To: linux-media@vger.kernel.org
Cc: wei.a.xu@intel.com,
	atul.raut@intel.com,
	sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	miguel.vadillo@intel.com
Subject: [PATCH v2 2/2] media: pci: intel: Add CVS support for IPU bridge driver
Date: Thu, 14 May 2026 11:44:31 -0700
Message-ID: <20260514184431.288353-3-miguel.vadillo@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514184431.288353-1-miguel.vadillo@intel.com>
References: <20260514184431.288353-1-miguel.vadillo@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3058B54606C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-61624-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

CVS is located between IPU device and sensors and is available in
existing commercial platforms from multiple OEMs. The connection
information between them in firmware is not enough to build a V4L2
connection graph. This patch parses the connection properties from the
SSDB buffer in DSDT and builds the connection using software nodes.

From the IPU bridge point of view, CVS is just like IVSC.

Signed-off-by: Miguel Vadillo <miguel.vadillo@intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 32cc95a766b7..c895584e25a0 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -152,6 +152,9 @@ static const struct acpi_device_id ivsc_acpi_ids[] = {
 	{ "INTC1095" },
 	{ "INTC100A" },
 	{ "INTC10CF" },
+	{ "INTC10DE" }, /* LNL */
+	{ "INTC10E0" }, /* ARL */
+	{ "INTC10E1" }, /* PTL */
 };
 
 static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev)
@@ -205,7 +208,13 @@ static struct device *ipu_bridge_get_ivsc_csi_dev(struct acpi_device *adev)
 		return csi_dev;
 	}
 
-	return NULL;
+	/* Try to locate CVS device on the I2C bus */
+	csi_dev = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
+	if (csi_dev)
+		return csi_dev;
+
+	/* Fallback to platform bus for CVS device */
+	return bus_find_device_by_acpi_dev(&platform_bus_type, adev);
 }
 
 static int ipu_bridge_check_ivsc_dev(struct ipu_sensor *sensor,
@@ -219,7 +228,7 @@ static int ipu_bridge_check_ivsc_dev(struct ipu_sensor *sensor,
 		csi_dev = ipu_bridge_get_ivsc_csi_dev(adev);
 		if (!csi_dev) {
 			acpi_dev_put(adev);
-			dev_err(ADEV_DEV(adev), "Failed to find MEI CSI dev\n");
+			dev_err(ADEV_DEV(adev), "Failed to find MEI or CVS CSI dev\n");
 			return -ENODEV;
 		}
 
-- 
2.43.0


