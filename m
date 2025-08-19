Return-Path: <linux-media+bounces-40311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A20F9B2CA26
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 18:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D42B1BC7FB0
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 16:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370303002DB;
	Tue, 19 Aug 2025 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/3ETA+U"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12C43009C1
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755622557; cv=none; b=uYttrt8i4eqU3rHilL5Tl7yflKGJ0GlEAg5CUbcPBt31HPaSz/hpIifisveSPEb/mcMdjzAcy10SDt3cWeOEmYjK/O/VuNwQ1mnOArXw5rbgOVGW4GQ4qUGoDBiNl64QBTq1izGZog4X8O18/QN9635O/5uY+5sHqas3oOCFHuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755622557; c=relaxed/simple;
	bh=J8uls0Dvy/CcmQSkUDekOAYLdJXikPhNFgv4fD+sHnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SykFBDiqtb8TvdvHaOigdnG+mnxZ3ZevT1MdCUiNy0x0pGIggPZH/jy4wSpJoSSTRUmdtdLp+9eaNRMjF+kwbBADnwYFaIJILxDE5OY8tS0LokrQ5eo2ZViZbx5e1BMUPvLGXSPI6gB3pqIeCbJFlHU2MvpMvZKKYrZsh9+YD/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/3ETA+U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90WXX021733
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BGxWt6ZCodU
	TWAKtq3VJEkSSPZxr5kmK9vduWMkjzjA=; b=n/3ETA+UJOA5Jtc/ZdghtEic/tG
	6VZdktZyWtILDCepz4p1VsH3DQ8U6cvnTMpnhDRZR3N83b9+HlnLbdRF4pforI3H
	D5ugv8NoTnDiPLrwWUGp+wjOCEQxptGaVJDTiylifCKEyp7ERoQ+d1WzOMdZaVLC
	xCeHf92MXXFf2eiBVtSKg3rWzy2fyklv/+eCDCnMe1xAnZeOiQFmUM5OsJf24+Oc
	Xfrow6FUU/5ZmySYAlg4q9mnrDCZLCj373laV1kYUnI1LmUvVZgONrUqcJlppryq
	SUAOIdUKR9fY1C/D+Wc6SCQOCTo/bcRcFCbPC/7TsLG3tnI+Pl6rU90Wc6A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71cm22q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:55:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2445803f0cfso58759435ad.1
        for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 09:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755622554; x=1756227354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGxWt6ZCodUTWAKtq3VJEkSSPZxr5kmK9vduWMkjzjA=;
        b=oycxwOgcemvkSWXhMQW3z8tm4OPLqgx/xp/tnGS0uPcBZdOVYh3lkey9W4k2vXA4eQ
         IiVNjMurGbn3lVaX8vhEAaiig1ulMnbKHW54RhO6wsYsphvMRTVVFxwLzFfQmAgMlD5x
         dPXQXNZzVTzpo8imauGUVjR6XkogtGp5pXSNOG9JB5SUpiaRMKK5UneCKsRCzGpuGot3
         JNRTNBbKlWAFe16skhbn2nkGmze2lWVZhZYOz+/yOAAGdlYdnNcvBl9ltERz9wuOO5SE
         6AjIZjzrhOSorK0MmRFGmLJHYwLbYmXYe3S4BmnoKFaMFBozLvKhEqF21NOJG31/J5/I
         Ottw==
X-Forwarded-Encrypted: i=1; AJvYcCX3F85yJ4cbfFZCjlVbTDkrPcErjUqbVhpadhXSYKIG56PZ8x9umxsBM4vttTbSAY0Kv6nVylEmjbU0Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEU6lT2YEWX5rmDBBB1YzRae2epjIibCCLfL5lyCadIbVYy8ff
	KLlZwMKT3Y+73u/IodfXRODRjHyIqAz7hNBNfZBamVic817oV5ppMKi+lFZ3Je6nRt3PLloa+WD
	eicM9Wiqw03XpYL7sJAxALTcb0o2rb7h6nhpNam+p+UcKdrs1xQlMMzG4oR5TDaXSsA==
X-Gm-Gg: ASbGncv5m6WEiGiRdIA7qLW5CZNUdG2geFNsy/+UXf4e41e3/Ypf2ZJmPW97s3cwUec
	vbFHqbUipWKeUpGdQ5cPSr5EFgTh3+qjmZRu80H7MS4+t6HR9IFBcVBEVDj9D9X/NMQQooqLkiB
	hrChatO9v6cDw2GJBGxpZm4eXdNW4uo2XBNzIyq6nqiWEibumS0zZXhLn3UFZc2XwuCYqAgSJu1
	ZFOck/HAcEEbMm4e+BVmiNJ6kE6ceiU32VgZTfKhcaEvRUesaMrN/iXMjO4UboQzyH2KOhoRoC0
	ZdrI+R3rPMizy6Er/4i9eF+5y+VySK8d3inJC8FxC9GEl4OaAqDE3NvKEiGEze321cs=
X-Received: by 2002:a17:903:4b4b:b0:243:43a:fa2b with SMTP id d9443c01a7336-245e05979d3mr45162935ad.56.1755622554388;
        Tue, 19 Aug 2025 09:55:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCJvSyWdYCUdwdFkeuPmuHg/oB5uZt1WNslleqZHji6H0GkE4HG2Ih5XUKxUI8BqkFwEGWGQ==
X-Received: by 2002:a17:903:4b4b:b0:243:43a:fa2b with SMTP id d9443c01a7336-245e05979d3mr45162595ad.56.1755622553832;
        Tue, 19 Aug 2025 09:55:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33aa3esm2273885ad.24.2025.08.19.09.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:55:53 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 08/11] soc: qcom: mdt_loader: Add helper functions to map and unmap resources
Date: Tue, 19 Aug 2025 22:24:43 +0530
Message-ID: <20250819165447.4149674-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9EdYaERav_4OCILH-H4fRu1WCgGJng7y
X-Proofpoint-GUID: 9EdYaERav_4OCILH-H4fRu1WCgGJng7y
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a4ac9b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=uXk6sN4QHJxknyAWzbwA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfX+dCSXrbFQDyS
 xLg1tL2OvnqAJSa3gndG0rsoqocekoiQK6sjo8Bh9t0cD+G2IbaZIlBV8HeR8UtKLGaNXuzIO6w
 5+bK0p87QbHeV2zOg7BL6LjF1UjPau3AT1WEcrBZH3878EMqxDOVBOcc8uj0l7EBRs0s/RKUi6C
 EsGDlr70YtjLmDefqZ+46P1oyxZj/N6gmbxe8UQtwyPnlnNsoEecxIKfdUht5z4J2CYZGQDDGZl
 iCHad+gq+QLvAHcQi02kaeIu4JWC+FvYSTOT7wS/VdDEkMFoSj8mn/NMbGaXfRNfcz88bL19Kq5
 AWp02qRU1v8haLWZAqVzaD2szjrGkkbpBcyrZRZA5W2vezYy0cfFvBEFAE2xIJkQMjP4fgnAUPr
 4W2nfLLB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147

Most Qualcomm platforms feature a proprietary hypervisor (Gunyah, QHEE),
which normally takes care of the IOMMU configuration for remote processors
by intercepting qcom_scm_pas_auth_and_reset() calls.

When the aforementioned hypervisor is absent, the OS must perform the
configuration instead. To do so, it must first retrieve a resource table
from the secure world, to ensure the settings are in sync with TZ's
expectations and then it should map the resources before it calls
qcom_scm_pas_auth_and_reset().

Add helper function to IOMMU map and unmap devmem resources for a given
remote processor.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c       | 174 ++++++++++++++++++++++++++++
 include/linux/soc/qcom/mdt_loader.h |  17 +++
 2 files changed, 191 insertions(+)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index a1718db91b3e..ea7034c4b996 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -11,13 +11,34 @@
 #include <linux/device.h>
 #include <linux/elf.h>
 #include <linux/firmware.h>
+#include <linux/iommu.h>
 #include <linux/kernel.h>
+#include <linux/hashtable.h>
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/rsc_table.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
 
+#define MAX_RSCTABLE_SIZE	SZ_16K
+#define RSC_TABLE_HASH_BITS	     5  // 32 buckets
+
+DEFINE_HASHTABLE(qcom_pas_rsc_table_map, RSC_TABLE_HASH_BITS);
+
+struct qcom_pas_devmem_rsc {
+	struct fw_rsc_devmem *devmem;
+	struct list_head node;
+};
+
+struct qcom_pas_rsc_table_info {
+	struct resource_table *rsc_table;
+	struct list_head devmem_list;
+	struct hlist_node hnode;
+	int pas_id;
+};
+
 static bool mdt_header_valid(const struct firmware *fw)
 {
 	const struct elf32_hdr *ehdr;
@@ -500,5 +521,158 @@ int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
 
+static void __qcom_mdt_unmap_devmem_rscs(struct qcom_pas_rsc_table_info *info,
+					 struct iommu_domain *domain)
+{
+	struct qcom_pas_devmem_rsc *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, &info->devmem_list, node) {
+		iommu_unmap(domain, entry->devmem->da, entry->devmem->len);
+		list_del(&entry->node);
+		kfree(entry);
+	}
+}
+
+void qcom_mdt_pas_unmap_devmem_rscs(struct qcom_scm_pas_ctx *ctx, struct iommu_domain *domain)
+{
+	struct qcom_pas_rsc_table_info *info;
+
+	if (!ctx || !domain)
+		return;
+
+	if (!ctx->has_iommu)
+		return;
+
+	hash_for_each_possible(qcom_pas_rsc_table_map, info, hnode, ctx->peripheral) {
+		if (info->pas_id == ctx->peripheral)
+			__qcom_mdt_unmap_devmem_rscs(info, domain);
+
+		hash_del(&info->hnode);
+		kfree(info->rsc_table);
+	}
+
+	return;
+}
+EXPORT_SYMBOL_GPL(qcom_mdt_pas_unmap_devmem_rscs);
+
+static int __qcom_mdt_map_devmem_rscs(struct device *dev, void *ptr, int avail,
+				      struct iommu_domain *domain,
+				      struct qcom_pas_rsc_table_info *info)
+{
+	struct qcom_pas_devmem_rsc *devmem_info;
+	struct fw_rsc_devmem *rsc = ptr;
+	int ret;
+
+	if (sizeof(*rsc) > avail) {
+		dev_err(dev, "devmem rsc is truncated\n");
+		return -EINVAL;
+	}
+
+	if (rsc->reserved) {
+		dev_err(dev, "devmem rsc has non zero reserved bytes\n");
+		return -EINVAL;
+	}
+
+	devmem_info = kzalloc(sizeof(*devmem_info), GFP_KERNEL);
+	if (!devmem_info)
+		return -ENOMEM;
+
+	ret = iommu_map(domain, rsc->da, rsc->pa, rsc->len, rsc->flags, GFP_KERNEL);
+	if (ret) {
+		dev_err(dev, "failed to map devmem: %d\n", ret);
+		kfree(devmem_info);
+		return ret;
+	}
+
+	devmem_info->devmem = rsc;
+	list_add_tail(&devmem_info->node, &info->devmem_list);
+
+	dev_dbg(dev, "mapped devmem pa 0x%x, da 0x%x, len 0x%x\n",
+		rsc->pa, rsc->da, rsc->len);
+
+	return ret;
+}
+
+/**
+ * qcom_mdt_pas_map_devmem_rscs() - IOMMU map device memory resources for
+ *				     a given Peripheral
+ *
+ * This routine should be called when it is known that the SoC is running
+ * with Linux as hypervisor at EL2 where it is in control of the IOMMU map
+ * of the resources for the remote processors.
+ *
+ * @ctx:	    pas context data structure
+ * @domain:	    IOMMU domain
+ * @input_rt:	    input resource table buffer when resource table is part of firmware
+ *		    binary, if not, pass NULL
+ * @input_rt_size:  input resource table size, if input_rt is NULL, then pass zero.
+ *
+ * Returns 0 on success, negative errno otherwise.
+ *
+ */
+int qcom_mdt_pas_map_devmem_rscs(struct qcom_scm_pas_ctx *ctx, struct iommu_domain *domain,
+				 void *input_rt, size_t input_rt_size)
+{
+	size_t output_rt_size = MAX_RSCTABLE_SIZE;
+	struct resource_table *rsc_table;
+	struct qcom_pas_rsc_table_info *info;
+	void *output_rt;
+	int ret;
+	int i;
+
+	if (!ctx || !domain)
+		return -EINVAL;
+
+	if (!ctx->has_iommu)
+		return 0;
+
+	ret = qcom_scm_pas_get_rsc_table(ctx, input_rt, input_rt_size, &output_rt,
+					 &output_rt_size);
+	if (ret) {
+		dev_err(ctx->dev, "error %d getting resource_table\n", ret);
+		return ret;
+	}
+
+	rsc_table = output_rt;
+	info = devm_kzalloc(ctx->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		goto free_output_rt;
+
+	info->pas_id = ctx->peripheral;
+	info->rsc_table = output_rt;
+	INIT_LIST_HEAD(&info->devmem_list);
+	for (i = 0; i < rsc_table->num; i++) {
+		int offset = rsc_table->offset[i];
+		struct fw_rsc_hdr *hdr = (void *)rsc_table + offset;
+		int avail = output_rt_size - offset - sizeof(*hdr);
+		void *ptr = (void *)hdr + sizeof(*hdr);
+
+		if (avail < 0) {
+			dev_err(ctx->dev, "rsc table is truncated\n");
+			ret = -EINVAL;
+			goto undo_mapping;
+		}
+
+		if (hdr->type == RSC_DEVMEM) {
+			ret = __qcom_mdt_map_devmem_rscs(ctx->dev, ptr, avail, domain, info);
+			if (ret)
+				goto undo_mapping;
+		}
+	}
+
+	hash_add(qcom_pas_rsc_table_map, &info->hnode, ctx->peripheral);
+
+	return 0;
+
+undo_mapping:
+	__qcom_mdt_unmap_devmem_rscs(info, domain);
+
+free_output_rt:
+	devm_kfree(ctx->dev, info->rsc_table);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_mdt_pas_map_devmem_rscs);
+
 MODULE_DESCRIPTION("Firmware parser for Qualcomm MDT format");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 450fa0be2af0..62f239f64dfb 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -11,6 +11,8 @@
 struct device;
 struct firmware;
 struct qcom_scm_pas_ctx;
+struct resource_table;
+struct iommu_domain;
 
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
@@ -31,6 +33,11 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 			     const char *fw_name, struct device *dev);
 
+int qcom_mdt_pas_map_devmem_rscs(struct qcom_scm_pas_ctx *ctx, struct iommu_domain *domain,
+				 void *rsc_table, size_t rsc_size);
+
+void qcom_mdt_pas_unmap_devmem_rscs(struct qcom_scm_pas_ctx *ctx, struct iommu_domain *domain);
+
 #else /* !IS_ENABLED(CONFIG_QCOM_MDT_LOADER) */
 
 static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
@@ -68,6 +75,16 @@ static inline void *qcom_mdt_read_metadata(const struct firmware *fw,
 	return ERR_PTR(-ENODEV);
 }
 
+static inline int qcom_mdt_pas_map_devmem_rscs(struct device *dev, bool has_iommu,
+					       struct iommu_domain *domain, int pas_id,
+					       phys_addr_t rsc_table, size_t rsc_size)
+{
+	return -ENODEV;
+}
+
+void qcom_mdt_pas_unmap_devmem_rscs(bool has_iommu, int pas_id, struct iommu_domain *domain)
+{
+}
 #endif /* !IS_ENABLED(CONFIG_QCOM_MDT_LOADER) */
 
 #endif
-- 
2.50.1


