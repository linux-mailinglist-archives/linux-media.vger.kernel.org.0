Return-Path: <linux-media+bounces-56426-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMBaELaQvGlU0gIAu9opvQ
	(envelope-from <linux-media+bounces-56426-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:11:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B75172D4649
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE64E3157D0B
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 00:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4072140DFB6;
	Fri, 20 Mar 2026 00:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFTxmVXn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F02219EB
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 00:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773965398; cv=none; b=LSHip66Gt/4lQhwXvnyfxU94hZM9jdrLZtLy8xerD6OsFiUecQ4Ho0oVuVOjxMlZru0+mDZHNzHEGo4U5x5HZYeSGPWmyIFbvd0FbF17B7qj8cgI20bOTnoo86pPJSL5UZ6x6BRVsjxa2YfC5WVZekcOs18waskyCuJrEIWd3Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773965398; c=relaxed/simple;
	bh=+075GOoyLbd5S34H1HUCr/nG7KpOcOATM4+CPgFOnJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hpj1w6HZmsC8igBp06tr+Mlc1M/0iguCYdWbGLQoEvFJcXH0GO0zbL99mVTiYXD3c5/CMRpth0NiYN2fOVTEudSo9WrU5c842K8fBzHRziWAPhCr4mWwR99s6hEv6uGUbDjgTVt3YdOnsPdmkz8vNJqfs+BlU8rYALAILRxhNxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFTxmVXn; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ba895adfeaso1745061eec.0
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 17:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773965396; x=1774570196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yX+MCrL59z+GAPTCkuU/G/y2YHYVEKPhhbS8nU432oc=;
        b=hFTxmVXn0dDfoYV3hMU4aLW084yRWr1F33oAfITIKfKqgAq4lvvuQT4yIYAqAV0zGM
         7btESoIZgVGzkQh2iF4Li6eTBNrBxZlPkaC0SZgZQp1J4gAx34j6NsvGTjcjmP7um0Qm
         WttdjaQE8RWzY0NjymZ9ul0XFgt6JaDYlFXF12xUNdNTk7g0GaI03lLnbAmMQrOQL6ld
         Wtk2g+kwtCUuXiwPHEnhAp3J/VfgJ20iBYUFqBzo+GEiqJtp0ubjVNTeXR8YWGV34UUx
         4B4v6Ywt3YQQqnwUIEc7Eexj/W5G07OaSLQLBV/YrV+ABkYNOOGOdTPhTQD3uunkhEjn
         RCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773965396; x=1774570196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yX+MCrL59z+GAPTCkuU/G/y2YHYVEKPhhbS8nU432oc=;
        b=jKf1b6SHVjWWwQU00p49yHvwdNXuaZQVhWwRQDzxmyp241WW0lFsClLHLbZ1NEjX59
         o/TbkypGgIQO/6hhQrXdkk1sFpgWSXW2ygMwJm6DNDn52YZNzd/yW6yp8ND9aHxATl9D
         JvqkUxEeDBAwIh39/2C9r83M961NaqQrIvCeKNLW9QG2ik9mjgOYJYd9isxHn7hYHkx7
         q8W7wKDU71bIgN/nn1wY95tam3NFrsQBh9fwsRCsZCnx7lAhOcWFeUKFaVkvV3ma9LyL
         iex75msoUh43sPtD8rqzmLe8u7H+AioalHmnKhkhnK8BkX+zJds9b52jT59kjMUzFZ9d
         OcRA==
X-Gm-Message-State: AOJu0Yzk9kHWGx/7VHnTBHnk8zlHr9MDZh8muIC/gizW6BO/exi9M8NL
	Up/exc5hp6Yt+dmQKY6wj25eh8n4bsHlG6Ic/JgHrFZTeKjMnIBufH1N
X-Gm-Gg: ATEYQzxTJFlJEeRiUxqWuqPKP45IGxWmXg1ty1Vv4n796SZx9qdbi4jOL0hJInM57TR
	nA09QUsTecaOtdCItiI8zn4R6XFFerHDZlusTxmndP/uCr9PWWwwtz2c2bbGB8sLeKOPqMON+qD
	5akCDSaB46apdtRwPtqvgwe3xYPD4va6sE1iyGNbApwFXex9r8PDLDqpY3IxLVcpqI9eUkddgVg
	CtxAqmDYfNZEDnfqQKl7c0oebMXk24lfpH6+wIHftIm/d5v3BvpF1wzHnhI7NqvjHqHQwrYI2Vs
	cPGL+M98FtwtoQvwgUxrHW4OxARl5Ka5N0mcA3EC06ix7SL2pRUphtGugyRvP5Lr9TZgQutu6/a
	XASkiGRsbOYAF5brV9Hv+y0CQ43BxZxrgZW4cKxmABYPLbA0Wq4NukxP10SbAj3vio+nPAJzdae
	pzxFimTIEMH74mVZxLOhiSbQ==
X-Received: by 2002:a05:7300:50e:b0:2c0:ffe7:318d with SMTP id 5a478bee46e88-2c1097d7856mr553269eec.30.1773965396453;
        Thu, 19 Mar 2026 17:09:56 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b3253d0sm927960eec.29.2026.03.19.17.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:09:55 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	lee@kernel.org,
	djrscally@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH 1/5] platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
Date: Thu, 19 Mar 2026 17:09:29 -0700
Message-ID: <20260320000937.9177-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260320000937.9177-1-tchatard@gmail.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linux.intel.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-56426-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.904];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B75172D4649
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
 drivers/mfd/intel-lpss-acpi.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 63406026d..7d0964848 100644
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
@@ -52,6 +54,15 @@ static const struct intel_lpss_platform_info spt_i2c_info = {
 	.swnode = &spt_i2c_node,
 };
 
+/* Same as spt_i2c_info but with QUIRK_IGNORE_RESOURCE_CONFLICTS for Dell 5285
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
@@ -172,6 +183,16 @@ static const struct acpi_device_id intel_lpss_acpi_ids[] = {
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
@@ -182,6 +203,17 @@ static int intel_lpss_acpi_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
+	/* Apply IGNORE_RESOURCE_CONFLICTS for I2C4 on Dell Latitude 5285.
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


