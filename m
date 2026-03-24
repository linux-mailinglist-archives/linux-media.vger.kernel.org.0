Return-Path: <linux-media+bounces-56920-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJHXNSYGw2lKnwQAu9opvQ
	(envelope-from <linux-media+bounces-56920-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:46:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB5831CFCA
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 22:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DD2D318D930
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 21:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400A53624A8;
	Tue, 24 Mar 2026 21:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAO5yOFR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243CF18027
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 21:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388533; cv=none; b=TzwTaiM0nWIpgJDOxbPaBd2BcynN0jOIl3uNRG7CTb7Z2BfI9RTpTB2AZAd/aL10g/UJ4otPrP0yzfDmbm4RIfeSU1ic126sZJR8OwtYzWytvUKSHBVLHS3D9luaHimMPNEudPC+P4hQWt6KOsgeQ5lIw9gdJfnxRkqhRx2zAYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388533; c=relaxed/simple;
	bh=la0HE0qtz7Pv2g0oEQay0X0IsfysA07UfreUabqV8LM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXmY9Z30TqhdW0fKv/oOaj0toivkMoSmydLIgR3AM1KQt6eBI4XlWHnJU9yce7q3gYHGXqdCX+GO/eOhkzUzZgIrxvGo15s9IN/BCIT8/kkPCds6SEqySokjQSfckfWtds7dnK/yRUz0YEJBQnRlwQio5Ini0ehffF7MaWjZ1qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAO5yOFR; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c0bb213b16so10433741eec.0
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 14:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774388531; x=1774993331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/PGeCZ0MB+zM0M8BNi4C8mQnbwNTKvleFT37RyQ3oo=;
        b=VAO5yOFRivRDWeCqSGcKEoAgQ3wAG7h0HQJ0SGhDmOZQM9GoxQJpp/xdFNaXI1Rkcc
         symzExbUa4giLYw+SLJfqpvqsum+QFVM6AEz9KUy9GifeZ4KzKCiJ55VVRxsW1VfgIwM
         BkmH01zAjSJEETIKQlToAAUCt8OPSxIGXA02FWX1AZp0EgbKBVjH7kSxp3n+zCRdbrgy
         PFP1+OU+q5ITg6dC2IuScY4GJiCTB4L1DhTW3fTqBhh7QYcJQEW5WW6+i0YUGOBAQ+iq
         pMg7EAGp9a8MEE5yRLNN9l7GeyFcLFu+J1Si0V4kEt2TG9PZK9h/IwWkTtcY4B++fBFH
         p6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774388531; x=1774993331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M/PGeCZ0MB+zM0M8BNi4C8mQnbwNTKvleFT37RyQ3oo=;
        b=Ya4rCJVQTDPcvgtBjWuVZ81LkJWDE4P5xt+bleBDS7cTZsMfDqs9lH9IbcceUfhtq5
         wixn6b7OcbTwcdq4iTkUN6xPWYO6Cp56g2qdlQTbIp+2tPY3904uVIhx6hjM/ox9Qn3a
         NgtLFxx2GhaDPgSLqvT/TUEa+TMOj07GsnEYWWEvSGjzSj6pRJNw9lLUcFw30EtfxWf4
         dv8McMxTL9G4XjpLHlUsHj/NeybO/qw8r91iEt1jJhwyxCoFCh+SUl/wC4Kp8YlgYfW3
         h8fFt+v1EJmRNLqymo5k1d3ZQNHoyrneCieSs1R6wQA0M2yiaj+8qx+YfjRDRRSlSOUZ
         AZqw==
X-Gm-Message-State: AOJu0YwyYbfC8tqYk6Ivtnitpw4hEGoYzNmx1vSfTEEXKq/yMcmcqNes
	Zvm4pzhbOUnGG9vk5zqRthA74SvJ8gtZycMIXbOVDXTHkMaJr0VExNWv2gN/+NwDV/4=
X-Gm-Gg: ATEYQzyM55KVjDxDKaeVwZIcwhQ8XxIlwSui8y4lE7yIXNlWYEueZvACAG1kj2K2bs4
	hd2iPjNaP14wB1UORsjujJ/iC2+gactgf/rMYaHImUj0Z4mRangCpst748z3Pxb5JvM2j4hk8JP
	TXWOj5DSG1qPnO2KOgPoOW9OJUVi25lTXMTYljM0rNwzYnLzMMVRV2nvU7X8lJJPqHkDxcReGiU
	NgTX4/+g1l+jaya6gJ+gqip5M4zBXeNd2nlLs/uxBnp8byDvAm5f8gOohHu3j4pav7NnRCVT2OE
	hZrk3wEm5baJsB4N8Efmf9AGx/9XAfMxpxabk36dW//We9KekW9JKsui9BnDb7FRlmbjtsExFzZ
	fZTa8MkEU/IwUqCLMAosyi4DaLrpLYe0GEKV6YOYUzsM2O9Ib53yfVytP1CnWIgkH4GVuEpAQHG
	CYbepnGWtR558i56n6zsZl2g==
X-Received: by 2002:a05:7301:d19:b0:2be:2b8d:399b with SMTP id 5a478bee46e88-2c15d2800b5mr570130eec.5.1774388531176;
        Tue, 24 Mar 2026 14:42:11 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1536aa870sm3284180eec.2.2026.03.24.14.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:42:10 -0700 (PDT)
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
	Thierry Chatard <tchatard@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 2/3] platform/x86: int3472: tps68470: fix GNVS clock fields for Dell Latitude 5285
Date: Tue, 24 Mar 2026 14:41:26 -0700
Message-ID: <20260324214129.17300-3-tchatard@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linux.intel.com,ideasonboard.com,rothemail.net,intel.com];
	TAGGED_FROM(0.00)[bounces-56920-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 3AB5831CFCA
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
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603211747.Z6xudmNd-lkp@intel.com/
---
 drivers/platform/x86/intel/int3472/tps68470.c | 201 ++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a496075c0..c9686426f 100644
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
@@ -140,6 +142,203 @@ skl_int3472_fill_clk_pdata(struct device *dev, struct tps68470_clk_platform_data
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
+/* AML integer opcodes (ACPI 6.4, section 20.2.3) */
+#define AML_ZERO_OP		0x00
+#define AML_ONE_OP		0x01
+#define AML_BYTE_PREFIX		0x0A
+#define AML_WORD_PREFIX		0x0B
+#define AML_DWORD_PREFIX	0x0C
+#define AML_QWORD_PREFIX	0x0E
+
+/**
+ * aml_parse_int - Parse one AML integer opcode at @p.
+ * @p:   Pointer to the current position in the AML byte stream.
+ * @end: One past the last valid byte of the AML buffer.
+ * @val: Output: the parsed integer value.
+ *
+ * Returns the number of bytes consumed, or 0 on failure.
+ */
+static int aml_parse_int(const u8 *p, const u8 *end, u64 *val)
+{
+	if (p >= end)
+		return 0;
+	switch (*p) {
+	case AML_ZERO_OP:
+		*val = 0;
+		return 1;
+	case AML_ONE_OP:
+		*val = 1;
+		return 1;
+	case AML_BYTE_PREFIX:
+		if (p + 2 > end)
+			return 0;
+		*val = p[1];
+		return 2;
+	case AML_WORD_PREFIX:
+		if (p + 3 > end)
+			return 0;
+		*val = get_unaligned_le16(p + 1);
+		return 3;
+	case AML_DWORD_PREFIX:
+		if (p + 5 > end)
+			return 0;
+		*val = get_unaligned_le32(p + 1);
+		return 5;
+	case AML_QWORD_PREFIX:
+		if (p + 9 > end)
+			return 0;
+		*val = get_unaligned_le64(p + 1);
+		return 9;
+	}
+	return 0;
+}
+
+/**
+ * dell5285_gnvs_from_table - Scan one ACPI table for the GNVS OperationRegion.
+ * @tbl:  ACPI table header; the AML body is scanned for the GNVS signature.
+ * @addr: Output: physical base address of the GNVS region.
+ * @size: Output: byte length of the GNVS region.
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
+ * dell5285_gnvs_find - Locate the GNVS OperationRegion by scanning DSDT and SSDTs.
+ * @addr: Output: physical base address of the GNVS region.
+ * @size: Output: byte length of the GNVS region.
+ *
+ * Returns true if the GNVS region was found in any ACPI table.
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
@@ -155,6 +354,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	if (!adev)
 		return -ENODEV;
 
+	dell5285_gnvs_fix();
+
 	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
 	if (n_consumers < 0)
 		return n_consumers;
-- 
2.51.0


