Return-Path: <linux-media+bounces-59251-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPXxKmAB6GlJEAIAu9opvQ
	(envelope-from <linux-media+bounces-59251-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 00:59:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 115B64405EF
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 00:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 317223125D5F
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 22:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5B43A872C;
	Tue, 21 Apr 2026 22:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7K9HljG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71B83A6EE6
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 22:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776811957; cv=none; b=UHI4MpLZ0BjKzk+mC0qfCou0pS/WK+73hSFSmu/vopBaQ7236CxIiC512lzyV9DFO+zJAAi+hz0sGVNWvGNWuneq6Pc91bVZ3D8xQgE5WxpWKw3yQqFe9t6ph3R5+N9MiOlJZjX3Y7mO5Md1HnONSpstVlnEfUgDbiCBYFerh+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776811957; c=relaxed/simple;
	bh=lfv6xMuTWxVW/xyXczBYRRPg3gtNkJiy/z6/BGQznFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P85qn38pqJTM58mKxfky/9j6q7a7HwAtYDzENurrbYkFXN6u+dbl7rNKhGuxropiaAt5rXqZ11uH/D0KP2GjI0fcB0Erxff+Anyds2Nq59Rgg+HPMiyU0M6T3tYJx/uHkPh9+Lze4mL4Y5BnoW4BqTdHdfZPQIgCY/0V8IDUxyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7K9HljG; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso5108530eec.1
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 15:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776811953; x=1777416753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1E8HRC9jadERrbomVh88MVvNtDc5/zpLXfvKSJQAhUQ=;
        b=H7K9HljG3k4FBBsjw0fRAZ3ZDr1QYneatGr6HW/IAsFttqeG8bJNahLg3cabbnzYpK
         XA0k+XHQRVyrF2aaAXa/A7euBI4bbCjTnVqAYoyhVLiodx+z/pGG3xTUgfETs62PlwKW
         v6Rli7b9sU/00sU8et5GhWI2XOCkvyxtyjXFUBiPbdQ/qN0esBpmax0siiLy2Wjky0gm
         6Qynln8Bl2SgM5rEttdqReHBmGKdne2Aw/vUqBeVhwsP4Mo/NgRTYnLhcciNssOGfoIy
         soRWV/2zlHmbaDwFq39YlUO+HUlEUKBSubqWp87SEwuKb+DGb1AsinG4Chfp30td39nH
         DYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776811953; x=1777416753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1E8HRC9jadERrbomVh88MVvNtDc5/zpLXfvKSJQAhUQ=;
        b=i9o1b4F9cGNKycI60BJ+PR0oxiPs6Sp6Swf7OMRzid1uYWi45inHQYhM3S2FvjdLgO
         Uj79oPMXIKQdIc2dra/C7wNNUsi3Zi01JhZqM6a3XjNNn86fRvAdS+cC+sBCcENFWnbk
         R1g61J+M9N+t80rQ/iXHWPvzbDEgY3/xWjpG/skZUd2tcJV6KdpXlDFIKj6zn6BP4dXT
         9d14gdua15o6WFaakp6YR8kHj1+rouoy5GwocaQZGj5223wMkdfSNC1elVuWaXIna3hl
         9MiCViqfUZ+uufpOfx2oxZnEjQEqzIpkrTGv1WWI1uFFBtdsgzYhIZpndZnZv0c7USvX
         PBWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9uMWk8ud0leoVkfQkitIIC2qN0deKtdG7IAtQCQvstDoSO5ituTGEV2wiI3ncjZH3dvgcWRGIRwtEd0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIfl7SxdoHbamTxHeZlS/5RVJYS/JUnI5aErQ5ONjznI4EVcA3
	L8r9FNbNNZqr6dPv2tnWjRgQj0Dg98IRid1vLYu+fXAY4BMju230xLJp
X-Gm-Gg: AeBDievZhy819DNWPsT8Q9b/e7fPLWrqzWxAgnMnakoF0TH6cMmAdDDMWPL1APTWpDH
	z7diKLqTKgBvMRLpHjX3D2Tqb4P9R7fQIHPrMaaTmQXgO6yIqzAb0Ror2DjxMErl6UROdAqjJH8
	DBECUvf8TyxUPalL9l5+nMBhlzIlgkgp45gzYNOkHbkGO6vcM3iF+en3t65mEhLf244YH1vufBJ
	1z534qscoIa5D4wsbu2eyXSkgZzzKUqHKuFviqF+pxgMRO5/j56Qaq1LzstKM648ZZtS4QtLBDt
	9WmISIMMABe7MhuK+Em40vtaECVtDtgMraWqGXXb1ZKIQOf7ICEOLrTR8E8OrPgtenszyUcvRR3
	/4jxK4VQmYwI0hPcJb5iTjj89Cn5KGksDODWCPxRNUhPR8/ZKRDK3t/ajitxlR23dJs07VtyU/G
	rHps/SayFyrq+VptKZqmUCR0A9KwhSfzOYY2Kq8qpr45w=
X-Received: by 2002:a05:7300:cd94:b0:2ea:4228:ab11 with SMTP id 5a478bee46e88-2ea4228ab6amr3006778eec.3.1776811952929;
        Tue, 21 Apr 2026 15:52:32 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm26145884eec.8.2026.04.21.15.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 15:52:32 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v4 1/5] platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
Date: Tue, 21 Apr 2026 15:52:13 -0700
Message-ID: <20260421225217.12472-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260421225217.12472-1-tchatard@gmail.com>
References: <aeMvy5aL0hSNNmEd@kekkonen.localdomain>
 <20260421225217.12472-1-tchatard@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59251-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tchatard@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 115B64405EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Dell Latitude 5285 2-in-1 has a BIOS bug where the ACPI GEXP device
and the I2C4 controller (INT3446) both claim the same MMIO region via the
shared SB04 variable. This causes intel_lpss_acpi to fail binding to I2C4
with -EBUSY, preventing the front camera (OV5670) sensor from being
registered.

Add a DMI quirk that selects IGNORE_RESOURCE_CONFLICTS for INT3446 on this
machine, matching the existing pattern used by other LPSS quirks.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/mfd/intel-lpss-acpi.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 63406026d..c48eac03a 100644
--- a/drivers/mfd/intel-lpss-acpi.c
+++ b/drivers/mfd/intel-lpss-acpi.c
@@ -13,6 +13,8 @@
 #include <linux/ioport.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/dmi.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
@@ -52,6 +54,16 @@ static const struct intel_lpss_platform_info spt_i2c_info = {
 	.swnode = &spt_i2c_node,
 };
 
+/*
+ * Same as spt_i2c_info but with QUIRK_IGNORE_RESOURCE_CONFLICTS for Dell 5285
+ * where ACPI GEXP device conflicts with I2C4 (INT3446) MMIO resources.
+ */
+static const struct intel_lpss_platform_info spt_i2c_info_ignore_conflicts = {
+	.clk_rate = 120000000,
+	.swnode = &spt_i2c_node,
+	.quirks = QUIRK_IGNORE_RESOURCE_CONFLICTS,
+};
+
 static const struct property_entry uart_properties[] = {
 	PROPERTY_ENTRY_U32("reg-io-width", 4),
 	PROPERTY_ENTRY_U32("reg-shift", 2),
@@ -172,6 +184,16 @@ static const struct acpi_device_id intel_lpss_acpi_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, intel_lpss_acpi_ids);
 
+static const struct dmi_system_id dell5285_lpss_dmi[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
+		},
+	},
+	{ }
+};
+
 static int intel_lpss_acpi_probe(struct platform_device *pdev)
 {
 	const struct intel_lpss_platform_info *data;
@@ -182,6 +204,18 @@ static int intel_lpss_acpi_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
+	/*
+	 * Apply IGNORE_RESOURCE_CONFLICTS for I2C4 on Dell Latitude 5285.
+	 * The ACPI GEXP device conflicts with I2C4 (INT3446) MMIO resources
+	 * due to a BIOS bug where both use the same SB04 variable.
+	 */
+	if (data == &spt_i2c_info &&
+	    acpi_dev_hid_uid_match(ACPI_COMPANION(&pdev->dev), "INT3446", NULL) &&
+	    dmi_check_system(dell5285_lpss_dmi)) {
+		dev_info(&pdev->dev, "Dell 5285: applying IGNORE_RESOURCE_CONFLICTS for I2C4\n");
+		data = &spt_i2c_info_ignore_conflicts;
+	}
+
 	info = devm_kmemdup(&pdev->dev, data, sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
-- 
2.51.0


