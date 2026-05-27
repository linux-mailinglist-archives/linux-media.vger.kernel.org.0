Return-Path: <linux-media+bounces-62917-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAH5NFklF2qu6wcAu9opvQ
	(envelope-from <linux-media+bounces-62917-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 19:09:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A656C5E82CC
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 19:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2A9653031265
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 17:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765A144CAC2;
	Wed, 27 May 2026 17:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HcWsc3Jv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64C244A724
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 17:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779901780; cv=none; b=TWsbQ0apgOq6ywej9fdDggAn18VLEj8wseKSglXtayAt9hqXLf5YxcDm6/eiYn9TaL0JWObjYCh//Tp506cjJ9BGSJxDHZqSkvwRro9mKx2iemQIBXu7bkTi+TQ5FKwVP6vEr+bxw/0GVyagMf2jEQU0zz4PAfCj1RwNH46wGRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779901780; c=relaxed/simple;
	bh=ZI9QAqPTKHIuHkljrSxaxrd+l8tSYMcSn6ynPqZMGis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sEeAxAd2gZ4C6INeD+d+fMUpxr9zomHVtau7Xg30vIsoXTEpJ0A8QicjUnYE7nM35fe25GgCDg14qrkMKHJLsBbBokUxtIarQDKIfqiL+xHJPjIwfOEJKVu2/Dz6BKm6N49T04RYttm+BHyU6v0Lfqs3f36PUCwPQ43vzTlmLUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HcWsc3Jv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779901778; x=1811437778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZI9QAqPTKHIuHkljrSxaxrd+l8tSYMcSn6ynPqZMGis=;
  b=HcWsc3JvZi2s20nMc70zIhOj/cMRrZG0L7pCW4KbTPFe6bdLfe2u5UKj
   NX4xkVYUuv/7EXbVblqR24TR3ah3NKqzwz/U1Kp5E83K0QzHoUQPWHyzj
   WpChn1QegHRds2bo4NZAiQ5SYYslplPxwTk/wQ7DzqaPlAcxPF6jaV7o+
   /BYKDatcjiDMLCTQYN73KUL13SFctXKIfzs4+miUToBcEScHU2gcBSWEX
   hCvNa+eITYPVi21nMm1bV09KaWZhqmWvkqMHRMWa6oCpinf2CVpO5Bgcn
   cn6tRo8Y3Z9ow7LOcCZ6bS7MIactFVglBYBRRCGiv/FO4XDuuXZAXeZJT
   A==;
X-CSE-ConnectionGUID: rrxFLrjbTCKL+gZc1ySuSw==
X-CSE-MsgGUID: H4k02DL/Qf2no1SKCe67Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91428426"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="91428426"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 10:09:37 -0700
X-CSE-ConnectionGUID: 3OcK9AZASKi2K4Za5PImVA==
X-CSE-MsgGUID: eCj7YCSUTo+zhV961WpN6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="244122872"
Received: from ubuntu.jf.intel.com ([10.54.60.90])
  by fmviesa004.fm.intel.com with ESMTP; 27 May 2026 10:09:37 -0700
From: Miguel Vadillo <miguel.vadillo@intel.com>
To: linux-media@vger.kernel.org
Cc: wei.a.xu@intel.com,
	atul.raut@intel.com,
	sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	kieran.bingham@ideasonboard.com,
	miguel.vadillo@intel.com
Subject: [PATCH v5 2/3] media: pci: intel: Add CVS support for IPU bridge driver
Date: Wed, 27 May 2026 10:05:30 -0700
Message-ID: <20260527170531.383871-3-miguel.vadillo@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527170531.383871-1-miguel.vadillo@intel.com>
References: <20260527170531.383871-1-miguel.vadillo@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62917-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:mid,intel.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A656C5E82CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


