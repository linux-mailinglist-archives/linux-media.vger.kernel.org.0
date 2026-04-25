Return-Path: <linux-media+bounces-59574-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDQLA91N7GnIXAAAu9opvQ
	(envelope-from <linux-media+bounces-59574-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 07:15:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 495B0464FEF
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 07:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 766D8301CFA2
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 05:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658122874F5;
	Sat, 25 Apr 2026 05:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axqdTBAu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBC929D264
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 05:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777094054; cv=none; b=BvDPSXrHxcH5cVXk12BFt6a5roXESP2XsJ5Rm6iCyCnoJrXUtpDsVW1vbBpeOeN1eiwRV97plaiW/IXPi3f/VZwAXCDT9ihUH/d2AdH4zPD6kFiwjxY/fPUDKNxjo/r8CQ+6y5uuwKqB3zElTnqmBfgTr2kQA+mtzfvYNqF7vaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777094054; c=relaxed/simple;
	bh=jGEqquZ2fD8KfC6B3eKEDe79Xup6NmyDIFmkXgCEm9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bWU+XwEYKE9QlsrBdnyighvSI9NBPe0w+bRYd7jSFr31LJr2GZiFBYnk34Ys1EPBN1Dj1iU22awVC0ySmoWzg6HzVPBm6PZpmFZOetN4KmIDNIrm1EjMhsn06pDGaaJ6LqlGTV2ZU+LVPLgDslvuYz/ejbHoE9v1765d6dYehIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axqdTBAu; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ba895adfeaso9343373eec.0
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 22:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777094053; x=1777698853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Njwz4GpR6Lsmc9++a5m2bWV+NAXHXBWZE5m0XlH/aas=;
        b=axqdTBAu6myUraMjj6T0eoSQSPSODn/wTMwlqAVVZ+nazlnSAFxt3vXilbhLcxoRS2
         6Ow9gO2rAQoSvcsjRuzzC+j5k+tsW5W/uBy+X9mMp4GntUIYWZrVzCUI01QXFTMFH6Ev
         DcR/VmFRNE6rBfk8sBduPiuehPF3xNETZVa/vMRgeg9op0w7r29x0Lp3uH3T0DZd90+7
         GbB+6YA7IkaThtbPTjWyONFskhYO4EDjObliQX0BTQ+z+/3wzD7Sy0ycipsDfVvZIpmI
         pLzaUo+ZhUQZ7nNAAQBvkTOpzZFz4H7HGducXwHW2yYByoEunTDv++GJy/awie4kUiab
         cg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777094053; x=1777698853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Njwz4GpR6Lsmc9++a5m2bWV+NAXHXBWZE5m0XlH/aas=;
        b=TXxYTNZXQoXISUymdovvUuMLHSxEQmnbn97mHO/PK8Di58GBMctbUgAgFL/Y/Zmf22
         CtQrgEGQLDz5HMaUN8lBuweARxaP8iinp0Jp0J5KOqdzOwZjimfZ7GIKwdOenYhgr5il
         fpdmtYqT9LtIImybrc6KxlrRr8UIg2OfTBhD2khj8Uy86ymR7KylJwdNV8wX9yr3e5jd
         HfF2O8m6FPzo2Ka830ZHQdEQuUPYBDv3GSiIUGxa+g1Q5CrCcD9CwgXZ+lLYwSEML8sm
         Yd93dg1AlpEMjk1kzkYnjwX+uUQ8SvEzBjK1VjscRLhHiEpLXOUtw/mEQkRJMXwor6wd
         m0gQ==
X-Forwarded-Encrypted: i=1; AFNElJ85yrDNErilXsgmsqVEvaoXpsdLYWeY6XfIiodLJp4j+jjZcr+MQMp73+lJG9GAdQM/+Xyldnx5KlYvFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2krKITg0s2UzkqbD5UwiubfwU67l9OL4N399TbZ2ABkjoQKNB
	K+V05fBOQBdUJD16EjW5UCssJCh402JiyTKcXj7lhp8wwLZ2nOtrrHdF
X-Gm-Gg: AeBDievXiQOT4RSLkSZEwrQq6lgtDeV5ACcKQb7FgTBpuwicWWL8qK6/pDH6eA81q+r
	iUML4twli3jt4L/cgD0bNEfrl0msBLKrUPHV8gt20g7ZWNxSKuK6VeqMXewCvsyOsGCs/NAULHc
	mJv2iYyz5k+nZZlvt+ULUKTTeJWaQK35DWd7fBCwPubgMGGO0hsR/dXWH9LuCuAxu0E8mdK2if7
	2qJwpaGimAZog+iq3pcwoiF/n4pA7UZhYr7i51Y82ynBGyXC4p83q20mFfkcrtM+gZNzD0m030w
	AO+vT949Jve4cahhnk5W/++HpE46HmjThekmck4L4yVYRS9WId/0ajYeJjBd5KEnhFZoa99gR9e
	ebqZpSM5NItXTBSEM0HGg2uJoMDZ8yItR+khiWdM6aV5PGRf6+ax9thglyOsVlFEcj+OKwqZQ6w
	Qa6ROhDxsl9YXJb6dZhVGLVS2IGyYzX7drEA==
X-Received: by 2002:a05:7301:6793:b0:2ca:7eb4:3e0f with SMTP id 5a478bee46e88-2e464dafc32mr18035970eec.5.1777094052651;
        Fri, 24 Apr 2026 22:14:12 -0700 (PDT)
Received: from TC-LAPTOP.lan ([66.142.131.45])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm35973806eec.13.2026.04.24.22.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 22:14:12 -0700 (PDT)
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
Subject: [PATCH v5 1/5] platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
Date: Fri, 24 Apr 2026 22:13:38 -0700
Message-ID: <20260425051342.8960-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425051342.8960-1-tchatard@gmail.com>
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
 <20260425051342.8960-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 495B0464FEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59574-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
index 63406026d..f08b41970 100644
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
+	if (acpi_dev_hid_uid_match(ACPI_COMPANION(&pdev->dev),
+				   "INT3446", NULL) &&
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


