Return-Path: <linux-media+bounces-66482-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M/QsE5DUR2qffwAAu9opvQ
	(envelope-from <linux-media+bounces-66482-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 46865703D4E
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 17:26:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=m+pHKd3s;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66482-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66482-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EABBE301D4D3
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 15:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CF8414DFC;
	Fri,  3 Jul 2026 15:25:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C64B414DFB
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 15:25:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092349; cv=none; b=iql7BYZZlCS7PRWXTRNN6FY5ybrMcpfjzzvlqTtQ93Rs/wXVJ2UMq22K5kEQZ846sFOniOaYhHWFBvijeDKogHkbJS7CybPd2LM6J/eRrYmiFJDUV6TJjBze7ydmZqHXmnnXNY68q8oFsSq5a9s9AnTQF/B3U08/8YMzHwWJEfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092349; c=relaxed/simple;
	bh=yVZ0WorXo716Lsqz7Gt/J1sYMhsr9aFOSChMZYt4SNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tc3j9SR/IJOGHsQO9+XRFGeSpqn2qfFT4oBRAAFilw6L86BYOKlXwQ6+xzWAZeVJYOXitUo8rmXWrXfBU1NejvVu1Vi8qVh8QFelp9uLuG3nSH6/KqUdCRat7Af8dAE0FEmTbbVcnsL95sbGQ0Y9zFEH0G033WmC3ndz6phC9DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+pHKd3s; arc=none smtp.client-ip=192.198.163.13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783092348; x=1814628348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yVZ0WorXo716Lsqz7Gt/J1sYMhsr9aFOSChMZYt4SNw=;
  b=m+pHKd3suUB0s/mOgtXUP/uFNRaXD8OJa+7j6NwnMC0PBq3bPd9y2SSk
   iy5Pv8724b9SSRZ81sPfl14KCtAYvM3/r6dUXlUk3EXASNwz7zF451UXq
   DAyYwKOaZAGxEiaMGKoQfRkZcBr29Ph+PMT4wME37HNPmn+NB5htRbv3Q
   ncw6oPDQY529e3+xZ8Tpwq+JQCRGbk1vaMMwn+tx22ToZdV63Ar/vQINW
   YQ9J2CcBQ/gg4BkUt9AU0lZegnAjPN3tLa43wAZUsY6nTqMxUMTASAhbM
   ukk2EavUm5ytY5ckYrumyeeOPNKS9550ZCZdkxFKfBhUO8BP0QY8rypr9
   w==;
X-CSE-ConnectionGUID: wTfL7sr4S2mb28yMaO3gKw==
X-CSE-MsgGUID: 9+WElDHWSzCIDHXCtrYCAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="86396168"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86396168"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:48 -0700
X-CSE-ConnectionGUID: JOFtKU25RsmRb2p2GMYcQg==
X-CSE-MsgGUID: QAkrr/W/QV2CZy5BEaUGcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253799579"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO alaakso-desk.intel.com) ([10.245.246.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:25:46 -0700
From: Antti Laakso <antti.laakso@linux.intel.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: antti.laakso@linux.intel.com,
	daxing.li@intel.com,
	ong.hock.yu@intel.com
Subject: [PATCH 16/41] media: ipu6: Add ipu7 cpd handling
Date: Fri,  3 Jul 2026 18:24:26 +0300
Message-ID: <20260703152451.1743132-17-antti.laakso@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
References: <20260703152451.1743132-1-antti.laakso@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:antti.laakso@linux.intel.com,m:daxing.li@intel.com,m:ong.hock.yu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66482-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antti.laakso@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.intel.com:mid,linux.intel.com:from_mime,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46865703D4E

The firmware format differs slightly between ipu6 and ipu7.
Add support for ipu7 firmware validation and handling.

Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-cpd.c | 158 +++++++++++++++++++++---
 drivers/media/pci/intel/ipu6/ipu6-cpd.h |  43 +++++++
 2 files changed, 186 insertions(+), 15 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-cpd.c b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
index 966a16a300f8..186d3dd771cd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-cpd.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
@@ -62,6 +62,20 @@ static inline const struct ipu6_cpd_ent *ipu6_cpd_get_entry(const void *cpd,
 #define ipu6_cpd_get_metadata(cpd) ipu6_cpd_get_entry(cpd, METADATA_IDX)
 #define ipu6_cpd_get_moduledata(cpd) ipu6_cpd_get_entry(cpd, MODULEDATA_IDX)
 
+#define IPU7_CPD_BINARY_START_IDX	1U
+#define IPU7_CPD_METADATA_START_IDX	2U
+#define IPU7_CPD_BINARY_NUM		2U /* ISYS + PSYS */
+#define IPU7_CPD_METADATA_ATTR		0xa
+#define IPU7_CPD_METADATA_IPL		0x1c
+/*
+ * Entries include:
+ * 1 manifest entry.
+ * 1 metadata entry for each sub system(ISYS and PSYS).
+ * 1 binary entry for each sub system(ISYS and PSYS).
+ */
+#define IPU7_CPD_ENTRY_NUM	(IPU7_CPD_BINARY_NUM * 2U + 1U)
+#define IPU7_MAX_MANIFEST_SIZE	(SZ_4K * sizeof(u32))
+
 static const struct ipu6_cpd_metadata_cmpnt_hdr *
 ipu6_cpd_metadata_get_cmpnt(struct ipu6_device *isp, const void *metadata,
 			    unsigned int metadata_size, u8 idx)
@@ -309,39 +323,153 @@ static int ipu6_cpd_validate_metadata(struct ipu6_device *isp,
 	return 0;
 }
 
-int ipu6_cpd_validate_cpd_file(struct ipu6_device *isp, const void *cpd_file,
-			       unsigned long cpd_file_size)
+static struct ipu7_cpd_metadata *ipu7_cpd_get_metadata(const void *cpd, int idx)
 {
-	const struct ipu6_cpd_hdr *hdr = cpd_file;
-	const struct ipu6_cpd_ent *ent;
-	int ret;
+	const struct ipu6_cpd_ent *cpd_ent =
+		ipu6_cpd_get_entry(cpd, IPU7_CPD_METADATA_START_IDX + idx * 2);
 
-	ret = ipu6_cpd_validate_cpd(isp, cpd_file, cpd_file_size,
-				    cpd_file_size);
-	if (ret)
-		return ret;
+	return (struct ipu7_cpd_metadata *)((u8 *)cpd + cpd_ent->offset);
+}
 
-	/* Check for CPD file marker */
-	if (hdr->hdr_mark != CPD_HDR_MARK) {
-		dev_err(&isp->pdev->dev, "Invalid CPD header\n");
+static int ipu7_cpd_validate_metadata(struct ipu6_device *isp,
+				      const void *cpd, int idx)
+{
+	const struct ipu6_cpd_ent *cpd_ent =
+		ipu6_cpd_get_entry(cpd, IPU7_CPD_METADATA_START_IDX + idx * 2);
+	const struct ipu7_cpd_metadata *metadata =
+		ipu7_cpd_get_metadata(cpd, idx);
+	struct device *dev = &isp->pdev->dev;
+
+	/* Sanity check for metadata size */
+	if (cpd_ent->len != sizeof(struct ipu7_cpd_metadata)) {
+		dev_err(dev, "Invalid metadata size\n");
 		return -EINVAL;
 	}
 
-	/* Sanity check for manifest size */
+	/* Validate type and length of metadata sections */
+	if (metadata->attr.hdr.type != IPU7_CPD_METADATA_ATTR) {
+		dev_err(dev, "Invalid metadata attr type (%d)\n",
+			metadata->attr.hdr.type);
+		return -EINVAL;
+	}
+	if (metadata->attr.hdr.len != sizeof(struct ipu7_cpd_metadata_attr)) {
+		dev_err(dev, "Invalid metadata attr size (%d)\n",
+			metadata->attr.hdr.len);
+		return -EINVAL;
+	}
+	if (metadata->ipl.hdr.type != IPU7_CPD_METADATA_IPL) {
+		dev_err(dev, "Invalid metadata ipl type (%d)\n",
+			metadata->ipl.hdr.type);
+		return -EINVAL;
+	}
+	if (metadata->ipl.hdr.len != sizeof(struct ipu7_cpd_metadata_ipl)) {
+		dev_err(dev, "Invalid metadata ipl size (%d)\n",
+			metadata->ipl.hdr.len);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int __ipu7_validate_cpd_file(struct ipu6_device *isp, const void *cpd_file,
+				    unsigned long cpd_file_size)
+{
+	const struct ipu6_cpd_ent *ent;
+	const struct ipu6_cpd_hdr *hdr = cpd_file;
+	unsigned int i;
+
 	ent = ipu6_cpd_get_manifest(cpd_file);
-	if (ent->len > MAX_MANIFEST_SIZE) {
+	if (ent->len > IPU7_MAX_MANIFEST_SIZE) {
 		dev_err(&isp->pdev->dev, "Invalid CPD manifest size\n");
 		return -EINVAL;
 	}
+	/* Sanity check for CPD entry header */
+	if (hdr->ent_cnt != IPU7_CPD_ENTRY_NUM) {
+		dev_err(&isp->pdev->dev, "Invalid CPD entry number %d\n",
+			hdr->ent_cnt);
+		return -EINVAL;
+	}
 
 	/* Validate metadata */
+	for (i = 0; i < IPU7_CPD_BINARY_NUM; i++) {
+		int ret = ipu7_cpd_validate_metadata(isp, cpd_file, i);
+
+		if (ret) {
+			dev_err(&isp->pdev->dev, "Invalid metadata(%d)\n", i);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static int __ipu6_validate_cpd_file(struct ipu6_device *isp, const void *cpd_file,
+				    unsigned long cpd_file_size)
+{
+	const struct ipu6_cpd_ent *ent;
+	int ret;
+
+	ent = ipu6_cpd_get_manifest(cpd_file);
+	if (ent->len > MAX_MANIFEST_SIZE) {
+		dev_err(&isp->pdev->dev, "Invalid CPD manifest size\n");
+		return -EINVAL;
+	}
+
 	ent = ipu6_cpd_get_metadata(cpd_file);
 	ret = ipu6_cpd_validate_metadata(isp, cpd_file + ent->offset, ent->len);
 	if (ret)
 		return ret;
 
-	/* Validate moduledata */
 	ent = ipu6_cpd_get_moduledata(cpd_file);
 	return ipu6_cpd_validate_moduledata(isp, cpd_file + ent->offset,
 					    ent->len);
 }
+
+int ipu6_cpd_validate_cpd_file(struct ipu6_device *isp, const void *cpd_file,
+			       unsigned long cpd_file_size)
+{
+	const struct ipu6_cpd_hdr *hdr = cpd_file;
+	int ret;
+
+	ret = ipu6_cpd_validate_cpd(isp, cpd_file, cpd_file_size,
+				    cpd_file_size);
+	if (ret)
+		return ret;
+
+	/* Check for CPD file marker */
+	if (hdr->hdr_mark != CPD_HDR_MARK) {
+		dev_err(&isp->pdev->dev, "Invalid CPD header\n");
+		return -EINVAL;
+	}
+
+	if (pci_match_id(ipu7_ids, isp->pdev))
+		return __ipu7_validate_cpd_file(isp, cpd_file, cpd_file_size);
+	else
+		return __ipu6_validate_cpd_file(isp, cpd_file, cpd_file_size);
+
+}
+
+int ipu7_cpd_copy_binary(const void *cpd, const char *name, void *dst,
+			 u32 *entry)
+{
+	unsigned int i;
+
+	for (i = 0; i < IPU7_CPD_BINARY_NUM; i++) {
+		const struct ipu7_cpd_metadata *metadata;
+		u8 idx = IPU7_CPD_BINARY_START_IDX + i * 2U;
+		const struct ipu6_cpd_ent *ent =
+			ipu6_cpd_get_entry(cpd, idx);
+
+		if (strncmp(ent->name, name, sizeof(ent->name)))
+			continue;
+
+		metadata = ipu7_cpd_get_metadata(cpd, i);
+		memcpy(dst + metadata->ipl.param[0], cpd + ent->offset,
+		       ent->len);
+		*entry = metadata->ipl.param[2];
+
+		return 0;
+	}
+
+	return -ENOENT;
+}
+EXPORT_SYMBOL_NS_GPL(ipu7_cpd_copy_binary, "INTEL_IPU6");
diff --git a/drivers/media/pci/intel/ipu6/ipu6-cpd.h b/drivers/media/pci/intel/ipu6/ipu6-cpd.h
index e0e4fdeca902..b614ed0004bb 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-cpd.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-cpd.h
@@ -98,8 +98,51 @@ struct ipu6_cpd_client_pkg_hdr {
 	u32 prog_bin_size;
 } __packed;
 
+/* IPU7 */
+
+struct ipu7_cpd_hdr {
+	u32 hdr_mark;
+	u32 ent_cnt;
+	u8 hdr_ver;
+	u8 ent_ver;
+	u8 hdr_len;
+	u8 rsvd;
+	u8 partition_name[4];
+	u32 crc32;
+} __packed;
+
+struct ipu7_cpd_metadata_hdr {
+	u32 type;
+	u32 len;
+} __packed;
+
+struct ipu7_cpd_metadata_attr {
+	struct ipu7_cpd_metadata_hdr hdr;
+	u8 compression_type;
+	u8 encryption_type;
+	u8 rsvd[2];
+	u32 uncompressed_size;
+	u32 compressed_size;
+	u32 module_id;
+	u8 hash[48];
+} __packed;
+
+struct ipu7_cpd_metadata_ipl {
+	struct ipu7_cpd_metadata_hdr hdr;
+	u32 param[4];
+	u8 rsvd[8];
+} __packed;
+
+struct ipu7_cpd_metadata {
+	struct ipu7_cpd_metadata_attr attr;
+	struct ipu7_cpd_metadata_ipl ipl;
+} __packed;
+
 int ipu6_cpd_create_pkg_dir(struct ipu6_bus_device *adev, const void *src);
 void ipu6_cpd_free_pkg_dir(struct ipu6_bus_device *adev);
 int ipu6_cpd_validate_cpd_file(struct ipu6_device *isp, const void *cpd_file,
 			       unsigned long cpd_file_size);
+int ipu7_cpd_copy_binary(const void *cpd, const char *name, void *dst,
+			 u32 *entry);
+
 #endif /* IPU6_CPD_H */
-- 
2.54.0


