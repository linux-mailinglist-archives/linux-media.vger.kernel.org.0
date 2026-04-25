Return-Path: <linux-media+bounces-59595-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLLMLpXs7GngdgAAu9opvQ
	(envelope-from <linux-media+bounces-59595-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 18:32:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBD6466E56
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 18:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AFA8A301A416
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 16:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C2235AC2B;
	Sat, 25 Apr 2026 16:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KURwR5NG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FD8352C28
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777134714; cv=none; b=jejiCP+fJ+gg15gQMhkT5kMpA8cnuEToDnNH5JrutyfTP6cTp4+osO1vdslQ4Qrwy8EK7JZRDYkVWmJU9mfKXaCcC6SkmpqBL5LHeYX0ubdqbOj2z1Lz8OY1DfqcITF3VX/AoeZFw7j8ROO5rPcKyV5TLfVSX1B0ewGHdeZ12ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777134714; c=relaxed/simple;
	bh=jGEqquZ2fD8KfC6B3eKEDe79Xup6NmyDIFmkXgCEm9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qY7Hcg8opEs19k2IDE6PyTYKLSoQn0LJoBkKgrliq1O0lWmKtWmBmJcBMt0Kf28A25iXNW8D0xPqLl5rJ6Ke2PTPfFaZwEzBNv8MQS3zlGQq5D0AbC2FYlHWjEpEOfjQLjimcyLyUmL5/QNQR34+Y59Lhaf2q/vh1qBP2sYsK/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KURwR5NG; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c15849aa2cso11799611eec.0
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 09:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777134712; x=1777739512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Njwz4GpR6Lsmc9++a5m2bWV+NAXHXBWZE5m0XlH/aas=;
        b=KURwR5NGT6bSpqYoi14m9Pz+aBbbQ0mXMjKg61wLYPsY8ZP/lY8rZKvnAjNfGQOl/d
         +MWsxeR87JHVZk6ZfpVeDoUcK8LBPEMQpf1YeKBfmh053HWckxGYbZyGlDFH0txrPnPL
         iqnazAKB0sdTUG6vrKHNwUB+EOEgkaUN/UQoTSnELa7BA03mqWBd+7xRjNpunUAZHQQH
         jBzFK76BOgMf0tcIExn673j8UuSR8Ii+YNJKPfcJ/biVytj2ZpdDoj+xCst0rDbRyHRp
         md6EundHMrCNW5htCyP8p1y1JRsD2/dnenLTOEpYEoFaCHHY5LF6YcG7whrwCcryxUfI
         9U5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777134712; x=1777739512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Njwz4GpR6Lsmc9++a5m2bWV+NAXHXBWZE5m0XlH/aas=;
        b=hF/gIJjLMeSr10L1OZDc9KUBbsyB0cTT5InMMa7qq34/4nYCTbNp7Rzuq8AwMBlnN+
         IbN8LfyuEbeuGV28D6nQAKqW4mEp6t72gTA5yZlzW3LFwq1+Y75D2D60voFpcyWY8Wnq
         bMt70XAS2m4iHDD3HgqqojR6+rrOWdTm7X9sh6jwv1FpwxpMdxDhkMih4a5YNFn7HkNu
         nmQwzHLhYaS18h5exXyedRd1XNByrX0vDn0fCJvbRiVVNjozIAL/YTq+W0eVfjNlXNR2
         oiif9MqdvEYdw0f0eemAof04XrBOGs3Lbbkq0s94JFID0f5Oyxl9xIYv3T7HypHyPLcK
         TwHg==
X-Forwarded-Encrypted: i=1; AFNElJ9YR40iiO0mulojsg5v3wj/h7jmXsKkIPb67JOBJn6bZUrFHwydPSzPdHAa7gv1tcM4pnptEYJzBahFhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxEOEuHCVrh6vgtvapzsBOb8GnVaQSb6CumW3PUUOAfdp3NGbc
	CxBfIwAcOH3tjC9rYe+fqclurlrWaZurIGhfMKfTpUP+joYEfzCVJgyB
X-Gm-Gg: AeBDievON1AXKQ74JJTcuArRE60+gxz5haRpR5V6T4bpiNSTlTUG09yhpS9voFBYugK
	hAob3lxLUp9444+SuQ8+HGR+LWf7/jFDt1vH7XOAV+DBfFtwOktyyK4pOGTYwSNhLCIVO3ztDPF
	Hkr3gWklflKL6YPhEVpAOBDOyuF2FqBKCuB/jtEWgwiezqBqH1O5Pl9nw60TZIZ8AUTkff/frwj
	xi2u//TZZqIB9q2UCpSBfTEV0wap34Een9eWN36Fx/m7xC24VW+fLHFUdMEZV1rVgNOLy6bp8Sz
	C6tZZGdVLNdgYOBVqPbjzd6ZVhiAvvpGXLt4dywTf8QEQ678m+KBZ5sasprmcsp8dS/SYsoA+n6
	m9hl2XUw5nIgvisvsizTR1Xiv46a39tt0y7VnvtA4FnxfL5tT85+SCZOEZBUxlFbO2p9kbjPv3y
	et7/63pScboeBG3+vuiCUj27uyMPcoWvLNOg==
X-Received: by 2002:a05:7301:658a:b0:2e2:9c65:ef6c with SMTP id 5a478bee46e88-2e4646cdc9amr19222555eec.4.1777134712186;
        Sat, 25 Apr 2026 09:31:52 -0700 (PDT)
Received: from TC-LAPTOP.lan ([66.143.226.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8bd2sm35922547eec.11.2026.04.25.09.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 09:31:51 -0700 (PDT)
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
Subject: [PATCH v6 1/5] platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
Date: Sat, 25 Apr 2026 09:31:41 -0700
Message-ID: <20260425163145.8474-2-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425163145.8474-1-tchatard@gmail.com>
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
 <20260425163145.8474-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4FBD6466E56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59595-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

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


