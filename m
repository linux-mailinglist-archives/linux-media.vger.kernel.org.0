Return-Path: <linux-media+bounces-56919-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MfvCBYGw2lKnwQAu9opvQ
	(envelope-from <linux-media+bounces-56919-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:45:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8716531CFC3
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0C5B3184191
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 21:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC2E25B30D;
	Tue, 24 Mar 2026 21:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RvcVZ6cM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AFD361DD0
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 21:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388531; cv=none; b=rHP/U5/+Sqk9IQifRaA6xOXBnrPGuvU7zijjlM6/3qjEKb+sW5W1AKa+7DOMzSDeUyljUCxMWMAsJ581iw5Gqt1mnuI3LB8jMI29bi63CdYeQPzoGp9lwqjnnW+9DyJtpMV/QgRmFor4BpPaOk+gaMyV0ZzNZb0GSnYQHiVsfnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388531; c=relaxed/simple;
	bh=+075GOoyLbd5S34H1HUCr/nG7KpOcOATM4+CPgFOnJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pi9QlvzfXShMa40ddhbkbpw4Y5eg50OETmk9K4SiuQ1lqxzYPHAn3Y2stsTJ4wmoeB58PdF6v6in1uEwzxA8b4LA5QMIo+Z8YA9Gwdi6flUwKsmu6BjGp0S04wx1qz1125xwWKp6tb0TPDWXnUUW8Xjw7nMnWhteJiLZ+n6XY2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RvcVZ6cM; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c15849aa2cso921714eec.0
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 14:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774388528; x=1774993328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yX+MCrL59z+GAPTCkuU/G/y2YHYVEKPhhbS8nU432oc=;
        b=RvcVZ6cMJxhRdvn7Bv/A9KKNs18E8ieDu7jXAZpbPgyWWP7fql5cMjdevy/uMr01UM
         VebWwpE1OZREP+SSEpcxMrTjgY5kUSGMSZr5IMspoCGuOWbMixo84xcr6eFo3xxSsbuI
         A3eAVHJdRx9Pp8DV2oTLWJoEWKX2MxywdYfPkwABPulG1UbK21M9cWeE0jCn6e9+S0wm
         TnVkv3JAjNNV1K+hBvjdB49hEvqeK3mvtEPu0mV/T9ttkN7hpE0wscqM2oPr7zbxfs7b
         bWB5Cj7FtIDzTErXXbg+OsWDh7dz4CdY+Ueq4GH0OhiIIseRyXLdkCpjYO4crZsFUXYg
         7iuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774388528; x=1774993328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yX+MCrL59z+GAPTCkuU/G/y2YHYVEKPhhbS8nU432oc=;
        b=Om2W8RVESNBR2jC+X56WMn12ADZbwH0CZrxYtM6/YfHy2jlA6Ze1wTQMCXvAlYDm/y
         MzSFMVMDzwV/WTBMV/YzCIg1+Al0cj7VPcr+WmQjloXUzH/3603Q55dPXvci8p2qB5y+
         bWihw6L18zgz6jcoBTZi/rLZD4k8uy8TcpKegIhFH6z0XEHsXSj1yiBDM0gZUoTuk9fy
         ckDW8yVE4yTaqqrUXEu5Zqk3YBCC6RcqSBnKhfc04+gPvmPsw6lKd08pmgpu1mEXQn8V
         aszzh2mmX7WFtjmTXDPSQ2hEthr3B4jfRfLDgmRVaYOwONqNIrIPpo0rY13GofOeC1Re
         WBAQ==
X-Gm-Message-State: AOJu0Yyb8T4c7XrWZVRurdRS5nYvFUBmbQIIZMU1QAk7VKBvMslA1GmF
	lmQLCZxFLMxYmF7McQrLbZZTNYkv2vubuCeLCv7Zd3fN+zPdkZuuwSrT
X-Gm-Gg: ATEYQzxGI19KBiaqEP/i0aP36F7tWa01sFH9VYEyWraPYkR59UMY/smaxihsdq8SGhD
	LtD5qZGVKCsNunaZJhVnd9ukxPkX4kmHfdE2PEXZ5r7uYfYthQr8/vZeIMM+LREvt+RoPXQPqtW
	tbYRj45oXLHJtGDbOl7Ic+1CIqqE8XAysi6E6hUu4wWnqoD0cwy6KravpDynf10soCxAkl/jRIj
	RenSGs4rT/Rsd2B/yI2szPU6ZkqC9IazGFiUxNxlId7e/xyGFyWzk+Mlql8KeXV09mEBGt6lnmY
	OIY/vI6WFm0BKfDxKjpY2wolX3Tl8Yu9nLegK6PNgPjadMNAb7qkGEam1RBrBAYwNNXlNqoZSbp
	BgOZOqkNT1VYOdtRrc58m4mWqpSknHH/pEy6EJZFiVGI9yYe6Z02ujyJ7lXLRQVfiU23Fc3EdP3
	+QJCZa++plYCpLH86WZ7NWmg==
X-Received: by 2002:a05:7300:2153:b0:2be:e0a:f37c with SMTP id 5a478bee46e88-2c15d49e2bbmr504337eec.25.1774388528256;
        Tue, 24 Mar 2026 14:42:08 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1536aa870sm3284180eec.2.2026.03.24.14.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:42:08 -0700 (PDT)
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
Subject: [PATCH v2 1/3] platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
Date: Tue, 24 Mar 2026 14:41:25 -0700
Message-ID: <20260324214129.17300-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260324214129.17300-1-tchatard@gmail.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
 <20260324214129.17300-1-tchatard@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linux.intel.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-56919-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 8716531CFC3
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


