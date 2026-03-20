Return-Path: <linux-media+bounces-56427-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGoIHt2QvGlU0gIAu9opvQ
	(envelope-from <linux-media+bounces-56427-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:12:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6302D466C
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50EA13133444
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 00:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF8578F39;
	Fri, 20 Mar 2026 00:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdLeZiZS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64542A1B2
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 00:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773965403; cv=none; b=Ce3aCuXY3wogbxhvf0RoscyGSzfNj6CALFk/alBvx6xcq6YYXW5KibW3Mbl5fSMYE6N4VqEQvz4xhIt0EJHlLhhQHa+3ILd0Gw4hMu9AlLfUxJgQ8OrDeZVZgarR0YeH1Xy3ImPigV5E4CqqATSZfHIexWUIgTEVv0bq2wHR7pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773965403; c=relaxed/simple;
	bh=KUWcIgCt9D5pwCWxyvBt4VgHH/prw2tSLJf/1FS/jME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OipJdky4sALVM4wtOnxWpF6cblqrJ1/NWxXQGODB1FuAAhR88tGVm3HvoKUbS+u0BIF9+/W/Y6QYBQhV+l5nBVbZ7Wt/6sP8qbF2dnUykkNo8RnGBxshK2iO0+A8ZbbUcAaaPNj6W0XMa+ZN+OvQsP/j20Vcqj9i6pWPXQoYuuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdLeZiZS; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c0d36f3888so180758eec.0
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 17:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773965400; x=1774570200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brRc9bgMF+/5nq2Bp8IT7dW2X+rA31PaurtC7LG/XIg=;
        b=AdLeZiZS+dzld85PL9ETYPFZm/1qzfmsvT06/1ZcRGrUtudPfCQncRMiz90q2+EPMT
         7BhSzVVNlfI8VlUKHCHOX1QOYBCBL3UBGEwAsBzHr7gNN7m/7VTIAFWyhvSXE0NXZNli
         S1cibJqZ8ZTESquosP44yW4BN/tRh+9bFtlcz/0wMnnEvwiJz/OvyGxoOEYTBehrKTGj
         jxPQ0lxMffQKOtnGkKghqKzEZO0uzsA7GxCGgqFoIJqmdpjjYLzT8vQcZkGrfCbrOqOa
         72rFBHfKCPPsHGpbosYU/rdbxg/9677IMwJCS7yNvRS6Ea+VfCBvZRJLaJkznMzgPCe+
         y2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773965400; x=1774570200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=brRc9bgMF+/5nq2Bp8IT7dW2X+rA31PaurtC7LG/XIg=;
        b=EX76Z5r11rw2jiPw/LfYEfrWVBcDZg6FImrZA5XfK+tH2bsihWBmZ2Gi7G8oP48Ws7
         fBwwuuNFR2ScLlpmvYogpLiCe3NdbJ3mbKXKmA8gpX3PZEs87yu2E94ESPPvjs6xwbrg
         8nXMlyg7Yyeza0p5ULib+98rmRfc3vM/pUM63wJdqIPU/nq+R0iXZKqNJQ17F4ZfIKYA
         QGmexc0aXUP42Fg3FU36ImdN+RXa5nsdgjXOcGHBT+hUkhmEwc9I8KLCNqabgm/aJP7f
         yygGtXaDu9eATuSmCtcT4s1CWsL2b3l5WtabDLzApO3ThK8e9hlm409ecPQtQmO467FS
         RaHg==
X-Gm-Message-State: AOJu0YzNCclwP3LEwirqRb7f4V+akXgcWnBztwDiPP1wLYw3NPAooz5K
	gam9qLWGYPmCugTHGzLAF8oA2T4aE4vo1feBGvh3+SJDTG3++8wcaaZLo1K66cJNrE8=
X-Gm-Gg: ATEYQzyxlczsOXg6BdYIUZicrcdsCnozGAGn/NdsKLqT9FYFuFI0SU34t/rpHIxWojy
	9R7t5IKJwY87eQuArmOU94JMy9Htqtlu0Os/aOxP7uG2xMPO+ZAOL7q3Ni/pysxVQR4jgCJtH3I
	SC68m83cmM62yWpjrULBQQ31+HJbumv13iSuv6YXFvQgqDMC1YWblVmjLJvClYhSIxukOLaJqya
	z864VzzHyXBfltaaOA/OqoUTaUrnhrD5O7KfszftdvX+/hQVhEa0OZQ/6MyFC9K1kKONbSB/CxI
	k6Oj8Wi+Wmq5R8Fp6fS99r+vxU6h8kLdoKZ2RvSP9uqSr8+C7aVYvR2nHvu79xofQrcqcji7v0Y
	gVUMncmFIeyax9ednRsAE0W55kN7rWzdXwztq6eAMlR8ycA/RpMTj5Jqn2DpKBaA1Lo1lgDYQUp
	ukP6HotdG6AfJI7laforPGMg==
X-Received: by 2002:a05:693c:2c0f:b0:2ba:64c6:2cd7 with SMTP id 5a478bee46e88-2c10980abdbmr668243eec.32.1773965399642;
        Thu, 19 Mar 2026 17:09:59 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b3253d0sm927960eec.29.2026.03.19.17.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:09:59 -0700 (PDT)
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
Subject: [PATCH 2/5] platform/x86: int3472: tps68470: fix GNVS clock fields for Dell Latitude 5285
Date: Thu, 19 Mar 2026 17:09:30 -0700
Message-ID: <20260320000937.9177-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260320000937.9177-1-tchatard@gmail.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56427-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linux.intel.com,ideasonboard.com,rothemail.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tchatard@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.984];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A6302D466C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Dell Latitude 5285 BIOS leaves the GNVS fields C0TP, L0CL, and L1CL
at zero at boot. The TPS68470 clock driver reads L0CL and L1CL to select
the output frequency; with both fields zero the clock outputs are disabled,
and neither camera sensor can communicate over I2C.

Additionally, when C0TP=0 the ACPI _DEP method on INT3479 returns PCI0 as
its dependency instead of CLP0 (the INT3472 device), causing ipu_bridge to
never create the i2c-INT3479:00 client for the front camera.

Add a DMI-gated fixup that runs at TPS68470 probe time and writes 0x02
(19.2 MHz) into C0TP, L0CL, and L1CL.

The GNVS physical address is discovered at run time by scanning the raw
AML of the DSDT (and any SSDTs) for the GNVS SystemMemory OperationRegion
definition (opcode sequence 0x5B 0x80 "GNVS" 0x00). The parsed address is
then mapped with acpi_os_map_memory(), which is safe because ACPI NVS
memory is reserved by the firmware and already mapped by the OS. No
hard-coded physical addresses are used.

Field byte offsets within the GNVS region (verified against DSDT
disassembly on this platform, region size 0x0725 bytes):
  C0TP: 0x43A   L0CL: 0x4F7   L1CL: 0x549

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 179 ++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a496075c0..5ffcb45c3 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -2,8 +2,10 @@
 /* Author: Dan Scally <djrscally@gmail.com> */
 
 #include <linux/acpi.h>
+#include <linux/dmi.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
+#include <linux/unaligned.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/tps68470.h>
 #include <linux/platform_device.h>
@@ -140,6 +142,181 @@ skl_int3472_fill_clk_pdata(struct device *dev, struct tps68470_clk_platform_data
 	return n_consumers;
 }
 
+/* Dell Latitude 5285 GNVS fix
+ *
+ * The BIOS leaves GNVS fields C0TP, L0CL and L1CL at zero after POST.
+ * With C0TP=0 the ACPI _DEP on INT3479 resolves to PCI0 instead of CLP0
+ * (INT3472), so ipu_bridge never creates i2c-INT3479:00 (OV5670 front cam).
+ * With L0CL=L1CL=0 the TPS68470 clock driver disables all clock outputs,
+ * making both sensors unreachable over I2C.
+ *
+ * Fix: at TPS68470 probe time, locate the GNVS SystemMemory OperationRegion
+ * by scanning the DSDT/SSDTs for its AML definition, map the region, and
+ * write 0x02 (19.2 MHz) into C0TP, L0CL and L1CL.
+ *
+ * Field byte offsets (verified from DSDT disassembly, GNVS size 0x0725):
+ *   C0TP: 0x43A   L0CL: 0x4F7   L1CL: 0x549
+ */
+#define DELL5285_C0TP_OFF	0x43A
+#define DELL5285_L0CL_OFF	0x4F7
+#define DELL5285_L1CL_OFF	0x549
+/* Minimum GNVS region size: last field (L1CL) is 1 byte at 0x549 */
+#define DELL5285_GNVS_MIN_SIZE	(DELL5285_L1CL_OFF + 1)
+
+/* AML integer opcodes (ACPI 6.4, §20.2.3) */
+#define AML_ZERO_OP		0x00
+#define AML_ONE_OP		0x01
+#define AML_BYTE_PREFIX		0x0A
+#define AML_WORD_PREFIX		0x0B
+#define AML_DWORD_PREFIX	0x0C
+#define AML_QWORD_PREFIX	0x0E
+
+/**
+ * aml_parse_int - Parse one AML integer at @p, store value in @val.
+ * Returns number of bytes consumed, or 0 on failure.
+ */
+static int aml_parse_int(const u8 *p, const u8 *end, u64 *val)
+{
+	if (p >= end)
+		return 0;
+	switch (*p) {
+	case AML_ZERO_OP:  *val = 0; return 1;
+	case AML_ONE_OP:   *val = 1; return 1;
+	case AML_BYTE_PREFIX:
+		if (p + 2 > end) return 0;
+		*val = p[1]; return 2;
+	case AML_WORD_PREFIX:
+		if (p + 3 > end) return 0;
+		*val = get_unaligned_le16(p + 1); return 3;
+	case AML_DWORD_PREFIX:
+		if (p + 5 > end) return 0;
+		*val = get_unaligned_le32(p + 1); return 5;
+	case AML_QWORD_PREFIX:
+		if (p + 9 > end) return 0;
+		*val = get_unaligned_le64(p + 1); return 9;
+	}
+	return 0;
+}
+
+/**
+ * dell5285_gnvs_from_table - Scan one ACPI table for the GNVS OperationRegion.
+ *
+ * Searches the AML body of @tbl for the byte sequence:
+ *   ExtOp(0x5B) OpRegionOp(0x80) NameSeg("GNVS") RegionSpace(SystemMemory=0x00)
+ * followed by two AML integers (region address and length).
+ *
+ * Returns true and fills @addr / @size if found and plausible.
+ */
+static bool dell5285_gnvs_from_table(const struct acpi_table_header *tbl,
+				     phys_addr_t *addr, u32 *size)
+{
+	/* AML: ExtOp OpRegionOp NameSeg("GNVS") SystemMemory */
+	static const u8 sig[] = { 0x5B, 0x80, 'G', 'N', 'V', 'S', 0x00 };
+	const u8 *aml = (const u8 *)tbl + sizeof(*tbl);
+	const u8 *end = (const u8 *)tbl + tbl->length;
+	const u8 *p;
+
+	for (p = aml; p + sizeof(sig) < end; p++) {
+		u64 region_addr, region_size;
+		int consumed;
+
+		if (memcmp(p, sig, sizeof(sig)) != 0)
+			continue;
+
+		p += sizeof(sig);
+		consumed = aml_parse_int(p, end, &region_addr);
+		if (!consumed || !region_addr)
+			continue;
+
+		p += consumed;
+		consumed = aml_parse_int(p, end, &region_size);
+		if (!consumed || region_size < DELL5285_GNVS_MIN_SIZE)
+			continue;
+
+		*addr = (phys_addr_t)region_addr;
+		*size = (u32)region_size;
+		return true;
+	}
+	return false;
+}
+
+/**
+ * dell5285_gnvs_find - Locate the GNVS OperationRegion address by scanning
+ *                      DSDT and SSDTs.
+ */
+static bool dell5285_gnvs_find(phys_addr_t *addr, u32 *size)
+{
+	struct acpi_table_header *tbl;
+	u32 i;
+
+	/* DSDT */
+	if (ACPI_SUCCESS(acpi_get_table(ACPI_SIG_DSDT, 1, &tbl))) {
+		bool found = dell5285_gnvs_from_table(tbl, addr, size);
+
+		acpi_put_table(tbl);
+		if (found)
+			return true;
+	}
+
+	/* SSDTs (instance numbers start at 1, stop at first failure) */
+	for (i = 1; i <= 32; i++) {
+		bool found;
+
+		if (ACPI_FAILURE(acpi_get_table(ACPI_SIG_SSDT, i, &tbl)))
+			break;
+		found = dell5285_gnvs_from_table(tbl, addr, size);
+		acpi_put_table(tbl);
+		if (found)
+			return true;
+	}
+
+	return false;
+}
+
+static const struct dmi_system_id dell5285_gnvs_dmi[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
+		},
+	},
+	{ }
+};
+
+static void dell5285_gnvs_fix(void)
+{
+	phys_addr_t gnvs_addr;
+	u32 gnvs_size;
+	void *gnvs;
+
+	if (!dmi_check_system(dell5285_gnvs_dmi))
+		return;
+
+	if (!dell5285_gnvs_find(&gnvs_addr, &gnvs_size)) {
+		pr_err("int3472-tps68470: Dell 5285: GNVS OperationRegion not found in DSDT/SSDTs\n");
+		return;
+	}
+
+	gnvs = acpi_os_map_memory(gnvs_addr, gnvs_size);
+	if (!gnvs) {
+		pr_err("int3472-tps68470: Dell 5285: failed to map GNVS at %pa\n",
+		       &gnvs_addr);
+		return;
+	}
+
+	pr_info("int3472-tps68470: Dell 5285 GNVS fix at %pa: C0TP=0x%02x L0CL=0x%02x L1CL=0x%02x -> 0x02\n",
+		&gnvs_addr,
+		*(u8 *)(gnvs + DELL5285_C0TP_OFF),
+		*(u8 *)(gnvs + DELL5285_L0CL_OFF),
+		*(u8 *)(gnvs + DELL5285_L1CL_OFF));
+
+	*(u8 *)(gnvs + DELL5285_C0TP_OFF) = 0x02;
+	*(u8 *)(gnvs + DELL5285_L0CL_OFF) = 0x02;
+	*(u8 *)(gnvs + DELL5285_L1CL_OFF) = 0x02;
+
+	acpi_os_unmap_memory(gnvs, gnvs_size);
+}
+
 static int skl_int3472_tps68470_probe(struct i2c_client *client)
 {
 	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
@@ -155,6 +332,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	if (!adev)
 		return -ENODEV;
 
+	dell5285_gnvs_fix();
+
 	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
 	if (n_consumers < 0)
 		return n_consumers;
-- 
2.51.0


