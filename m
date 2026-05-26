Return-Path: <linux-media+bounces-62738-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMzmFIMFFWokSQcAu9opvQ
	(envelope-from <linux-media+bounces-62738-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 04:29:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F275CFEC0
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 04:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32AA030090AC
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 02:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69CA308F3B;
	Tue, 26 May 2026 02:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5WvNyNz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3432F7F09
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 02:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779762557; cv=none; b=A6TLyfBBXSNjzdVWcx/8KLu5U3Jo5RbubkU9QqEEmk1aCfnYkMOQfZs8hBEDhjbTta/6LlVPNbcg/nfG7boPD72Tp7AnfV5NUjSfUjf8YgGmbc8DeudQl4gXaUaxelBuVV1Js6sbPBxvDN5yVouNzxC0vUVfO8Nywbr6eWP6xeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779762557; c=relaxed/simple;
	bh=ZI9QAqPTKHIuHkljrSxaxrd+l8tSYMcSn6ynPqZMGis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H9cGmYw45VIvitS0BqKiIY58yK/3xjE+1JV9vUVxiITVcFe+zCQsqJsKkuzQueJyIKA4j/Xza5S3d9Pc53POVdylKSK8JrewqEYsfaNnRfKTuJZc74GEv1FWpwYjoOO0NkVreQb9U1Mamtod47ctvJNbxwtkFifzR/oyFwT9HNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5WvNyNz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779762556; x=1811298556;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZI9QAqPTKHIuHkljrSxaxrd+l8tSYMcSn6ynPqZMGis=;
  b=A5WvNyNzSmzreYlumENJmQop0EC8RZ9ekaxAQYkrv+fxVVKmcNIBZ6bN
   3ZvO7Z0tl2mn5NKqgeAoARcZA9exWwRW021irzu4mDCjaBBk2HjWmsPfm
   g1t4H7v41OUJzJz+jF/NoTCeiuynkbd0eZlc7WYZS91wLA4Kcc4cSiQdQ
   LScgTUiFQP4SU/XkjcqPH83yuuGiFcJgIEpDzQbZYRLU1l+tbcPOB79/z
   gGn812Pq0Ikm/gCxUYI3GEq7bdUNHCjOoIh5fji4eR21x44+btHN0RviC
   h6wuc9/Pgr9d2xFnv+RUOumOfrgdSNB2niWjoVynjYx1PWxKX9lNaWzxB
   A==;
X-CSE-ConnectionGUID: +CKMn1C2SpmxPkhI1vcxxg==
X-CSE-MsgGUID: WvvLBWr7Rey+BKpn3PuL+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91960344"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="91960344"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 19:29:12 -0700
X-CSE-ConnectionGUID: UGl3sz5fRiasBiUu/g3/cQ==
X-CSE-MsgGUID: 7ZX92qmURaCOVmJL6PUTfg==
X-ExtLoop1: 1
Received: from ubuntu.jf.intel.com ([10.54.60.90])
  by fmviesa003.fm.intel.com with ESMTP; 25 May 2026 19:29:12 -0700
From: Miguel Vadillo <miguel.vadillo@intel.com>
To: linux-media@vger.kernel.org
Cc: wei.a.xu@intel.com,
	atul.raut@intel.com,
	sakari.ailus@linux.intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	kieran.bingham@ideasonboard.com,
	miguel.vadillo@intel.com
Subject: [PATCH v4 2/3] media: pci: intel: Add CVS support for IPU bridge driver
Date: Mon, 25 May 2026 19:25:07 -0700
Message-ID: <20260526022509.162908-3-miguel.vadillo@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526022509.162908-1-miguel.vadillo@intel.com>
References: <20260526022509.162908-1-miguel.vadillo@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[miguel.vadillo@intel.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62738-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 67F275CFEC0
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


