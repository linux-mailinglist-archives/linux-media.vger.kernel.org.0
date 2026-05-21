Return-Path: <linux-media+bounces-62545-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNZ0F/eGD2qONAYAu9opvQ
	(envelope-from <linux-media+bounces-62545-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 00:28:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B97A5AC591
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 00:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D3813010F2C
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 22:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4B836606A;
	Thu, 21 May 2026 22:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ji08F5Gm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8F236B048
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 22:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779402482; cv=none; b=ifdkylElKeU2axVV52L69f9f/J98CpFWD+B6oqtY9upQkDIBNKguDs7uKEqNVCu09kc30VSdaYC43LaY2V7smb/2NXpptlMCwmfEM9JgjMlGNuYYbXxoCNtP8Ihd1sT9tFwmpP3eoELnlykJrk9yUP9ZFUkDo49fjgiRaJ2zvcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779402482; c=relaxed/simple;
	bh=ZI9QAqPTKHIuHkljrSxaxrd+l8tSYMcSn6ynPqZMGis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQI+gM93Rik5KcxudnTgmuiW03HoNtq6OBGOhLq/uO7Ww4FKb/imtcl9hlg2RaNgthc7EUA2nOpMZ3sPyLW8jVzImvagwx2MOUQnxE1NF6pD6n5mIGe0zxtJcsSjRSLRaUq/VOZ9FLzgzJpFextQ9QQa46Zrufj+zo6BY7+RZJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ji08F5Gm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779402480; x=1810938480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZI9QAqPTKHIuHkljrSxaxrd+l8tSYMcSn6ynPqZMGis=;
  b=Ji08F5Gmk6QH2nQc8xO8FRifx3fn0O4ivnBsDCT+YWiEFJlxFN7+4BdU
   n05/xQjiqW6z1UrsIKwAt9xaTi8WX7l0pMjCSsd1Q6afGbf+HK50B5hua
   sNcuaLfIxQvTCRre5tV4dnC9KgTTGPf2jxOxHXCOsH9+3qo+Q/rEKVWlG
   yf1i1tWSUID9v3748YzuxVky4xcZ68Np08DSs085FsUWTOu4k6ktf/75O
   wCwvB1A57m7XnC4UZtHSODRP3j+Y3Wa5kjZ4Ghl8nl7e3Ev/rXCIEsF6W
   RAjgNOUjH4f2RmrCcsd+um/QSPhDWs34neOAYVtWoEFb+oOIO902FojP8
   w==;
X-CSE-ConnectionGUID: LwOm88aWTlingdkQow30Hw==
X-CSE-MsgGUID: uZ3yotxrRzK+KxMvL/auww==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="67857595"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="67857595"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 15:27:58 -0700
X-CSE-ConnectionGUID: woe5zKbeS+WaSalxa+uFYg==
X-CSE-MsgGUID: df0zfXAGQXGRGLyCbCNTrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="271031217"
Received: from ubuntu.jf.intel.com ([10.54.60.90])
  by orviesa002.jf.intel.com with ESMTP; 21 May 2026 15:27:58 -0700
From: Miguel Vadillo <miguel.vadillo@intel.com>
To: linux-media@vger.kernel.org
Cc: wei.a.xu@intel.com,
	atul.raut@intel.com,
	sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	kieran.bingham@ideasonboard.com,
	miguel.vadillo@intel.com
Subject: [PATCH v3 2/3] media: pci: intel: Add CVS support for IPU bridge driver
Date: Thu, 21 May 2026 15:23:58 -0700
Message-ID: <20260521222359.16716-3-miguel.vadillo@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521222359.16716-1-miguel.vadillo@intel.com>
References: <20260521222359.16716-1-miguel.vadillo@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62545-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:mid,intel.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4B97A5AC591
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


