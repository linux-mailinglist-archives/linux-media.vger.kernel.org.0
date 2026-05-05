Return-Path: <linux-media+bounces-60493-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GUVKKFw+mngOwMAu9opvQ
	(envelope-from <linux-media+bounces-60493-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 00:35:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 245904D463E
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 00:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0E19307B07A
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 22:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7512C21EE;
	Tue,  5 May 2026 22:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDT2pnT5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80182D061D
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 22:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778020434; cv=none; b=mhFXsfjeYAy+eW5hLOR51NZSWP+W07NChZcM/7SBfU7FB8gKf4ZTcyupyiZZV0OBLN+QKp1H3J91SMEmLCPOcL0dUY3kDi5AZ53LJDyxoRUG+xoRf/49qIm+jO3p7zppB9qobb1CFkvFgX1V1IUlaUwNo676UcAEPyd7z5NpNFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778020434; c=relaxed/simple;
	bh=ZI9QAqPTKHIuHkljrSxaxrd+l8tSYMcSn6ynPqZMGis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/ZWG9PT1HKz1zOm40xKvUq9TRHshS5ktUJMKg7VH6iNTddXfCZgspaq17ROXmFpIP05BvKs7YHqL5BxmCCvDpi0OzrAsgWWFCRk7cG+C1ni1cpY7sdymZK582GJgm9lmmF3585fGgi4hhSCr+oIqr0XyFcNtjGNr/67NrLWpCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDT2pnT5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778020433; x=1809556433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZI9QAqPTKHIuHkljrSxaxrd+l8tSYMcSn6ynPqZMGis=;
  b=cDT2pnT5RvvE+WI6ou5sxMXflSJQ7b61gdK+TdpwTGwSJCF0F+oTfERk
   N5E4UAXeK5c5cX77lBurtFJgksTTcaWm/pLB2en0Y94lgwvzOvAgzm5kb
   hVnwxJIQld+HFONeahwRrPyfEJ9TOJ+elMgHR0PiMIPDBOLPEWq/KetJ4
   qCNVyEo+zCkj8vVLIWus24ececkSslplzOGBskth/B0RoXM2cCzJXMN1s
   yt7mvFZiUEZVjQkPWvXk+WYV1o5i54qsPGNiFTvl+bv/oHTm32jqlGQ40
   P/vY/88D52Jwoe6WEqcv7DgOixbzL1qfL87m7ikgE5MPc/BClS/bcBULL
   w==;
X-CSE-ConnectionGUID: 3srN79HhQuaTuS8l9Aqn8Q==
X-CSE-MsgGUID: Jiz44wOoTN6BEkMI/yakJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78843612"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="78843612"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 15:33:50 -0700
X-CSE-ConnectionGUID: fIB1zzXzSS+1waJct8OsAg==
X-CSE-MsgGUID: 3ZxpVGiMRcSkpbTyCW+AHg==
X-ExtLoop1: 1
Received: from ubuntu.jf.intel.com ([10.54.60.90])
  by fmviesa003.fm.intel.com with ESMTP; 05 May 2026 15:33:49 -0700
From: Miguel Vadillo <miguel.vadillo@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	miguel.vadillo@intel.com
Subject: [PATCH 2/2] media: pci: intel: Add CVS support for IPU bridge driver
Date: Tue,  5 May 2026 15:30:05 -0700
Message-ID: <20260505223005.84162-3-miguel.vadillo@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505223005.84162-1-miguel.vadillo@intel.com>
References: <20260505223005.84162-1-miguel.vadillo@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 245904D463E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60493-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]

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


