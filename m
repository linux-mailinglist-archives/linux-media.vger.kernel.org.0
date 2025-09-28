Return-Path: <linux-media+bounces-43299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3072BBA7527
	for <lists+linux-media@lfdr.de>; Sun, 28 Sep 2025 19:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2F95172FE6
	for <lists+linux-media@lfdr.de>; Sun, 28 Sep 2025 17:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC1221C179;
	Sun, 28 Sep 2025 17:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PR4EHcjl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199264A01;
	Sun, 28 Sep 2025 17:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759079864; cv=none; b=td4lM8r7mX12O0zQ+7juT0ZNGMdQdqQhG4jC5+sOsdpGoclLP/S7sbca3w0l034iZF3JJ58cAjw2wU4NY4bMrwXgXkftpYaO+JckdXCk9UIVipRpeotLnNUgZUO81vDvm/elvGtsvcPEBnRXyXHmmSlQff7LCcYLNoK5vwitbuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759079864; c=relaxed/simple;
	bh=SAD+C/FHTaWdTjV0x+/U7xwAZ028POddyaFiMCIPMrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dCFNv4MkahiXzrEScaS5DhLsanwY8hV+wr+mSclPLVdtp6RepeqpCOzgeaoXu5QMVf6KG1fCQ1pY90SDaSSMnpuyHdQA3JPh7xEZzOwEO7NxinRuIxi1wBCnZE8Z/Ld5FJjCBqygr1dkA8va4mzZvR+tqtDHKjUADRqhIXF9EOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PR4EHcjl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SGKR93014676;
	Sun, 28 Sep 2025 17:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E8d0nBXLxTU
	O6aOWwxm8KO5YtTbkyjqmWh9yw06iQwA=; b=PR4EHcjlRHB++3SQ8sEKVvRoZHB
	0BLuluKvG8JIZobt1Yh7aZrr4XfpmxGbqGTcCY1cPogd+aFISH/ZeL9U7p1Yfmj1
	cR94JIDN9MQ5udipVc0sw14gk5cljNTlEBIPC0/PFKeZWXfX8irXEdmIb8EoEJUQ
	oQ69TNwmLDm+ZFf9bSn/oxDqsoj1Jq/1W4r/waHOb9WRgwNzVWbcvr0Dh/V9LH8S
	Rd5n4k5O2Npfft+Fqsb63vG2qv7lqkShkyzalK7WENxS03P+ZJZ94gcpB25t4rzQ
	sDM5b1MZkbQuXIaXh1nC1OyfjS/I1xcZXIOF3EqJWNGOFjE662oaEwqF9jQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59muby2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Sep 2025 17:17:26 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58SHHMT1018673;
	Sun, 28 Sep 2025 17:17:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 49e90k74pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Sep 2025 17:17:22 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58SHHM9Y018650;
	Sun, 28 Sep 2025 17:17:22 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-charante-hyd.qualcomm.com [10.213.97.134])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 58SHHMk5018648
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Sep 2025 17:17:22 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 389980)
	id 3BCE05F3; Sun, 28 Sep 2025 22:47:21 +0530 (+0530)
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
To: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
        saravanak@google.com, conor+dt@kernel.org, robh@kernel.org,
        mchehab@kernel.org, bod@kernel.org, krzk+dt@kernel.org,
        abhinav.kumar@linux.dev, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: [RFC PATCH 3/3] of: implment the 'iommu-map-masked' to represent multi-functional devices
Date: Sun, 28 Sep 2025 22:47:18 +0530
Message-Id: <20250928171718.436440-4-charan.kalla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: t4Z5s7goqR9F1ZlIx4v1fVVg6RWhFSDd
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68d96da6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tZiW2AOmwnKfT6Y2LrUA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: t4Z5s7goqR9F1ZlIx4v1fVVg6RWhFSDd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX21R5/00zIgDa
 OhT6V7OgIMp5/aarF1tAYr7YqkAx8JTXP9VtamDDywyCUuHNrT9f+2BQyi6KM7bqZoiiI00Xik2
 Qx8o62Y8Z0qIkHN8kyeVCVASPmcPMbCrUWkxFWXPsT78UI9vp+JHmkKWabLLVCo758b1O720WoU
 ek056dvRncoueVmhFGvpCOTS+Fhz+/CU899hf5E3ombwoee7UwySPbefN/gjbDmH57os4X957VJ
 8lle7Cb2zkAIEWz4jl9axN8DtJNiyIZCfInVZXsRWtSo+CY+HZCAsbuSAmmxBHnlxsjHwrbIKz3
 vC+m7TeBRkC7cnl96Utlv2OovE+71ZEofbLETpgx6aptKGjDQ1Qys7RgH1uE5JdN1CaYAyfw0Bx
 Wpt+p34h4TGF8ufGAtlQm+kEVT+N8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_07,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

The classical representation used by the platform device to represent
the IOMMU specifier pairs is through 'iommus ='. All the IOMMU specifier
pairs represented will be marked to use the single translation context,
at least is the case for ARM IOMMU.

When each functionality of a multi-functional device required to use
individual address spaces, for arm architecture, it need to be mentioned
as multiple sub-device nodes in the device tree. But since the device
tree is used to just pass on the soc layout to the linux kernel, it
doesn't truly fit.

Introduce the iommu-map-masked property(taking cue from iommu-map
for pci devices) where each functionality is represented(in arm64
architecture language) as:
 iommu-map-masked = <FUNCTION_ID1 &iommu SID1 MASK1>,
		    <FUNCTION_ID2 &iommu SID2 MASK2>;

Iommu client drivers can dynamically create the child devices for each
of these function ID's and call of_dma_configure_id() on these child
devices which sets up the IOMMU configuration.

Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
---
 drivers/iommu/of_iommu.c | 44 ++++++++++++++++++++++++++++++++++++++++
 drivers/of/base.c        | 21 +++++++++++++++++--
 include/linux/of.h       |  8 ++++++--
 3 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 6b989a62def2..2363de8f2fd6 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -41,12 +41,56 @@ static int of_iommu_xlate(struct device *dev,
 	return ret;
 }
 
+static int of_iommu_map_id(const __be32 *map, u32 id,
+				struct device *dev, void *data)
+{
+	struct device_node *phandle_node;
+	struct of_phandle_args *iommu_spec = data;
+	u32 id_base = be32_to_cpup(map + 0);
+	u32 phandle = be32_to_cpup(map + 1);
+	u32 master_id0 = be32_to_cpup(map + 2);
+	u32 master_id1 = be32_to_cpup(map + 3);
+	int err;
+
+	phandle_node = of_find_node_by_phandle(phandle);
+	if (!phandle_node)
+		return -ENODEV;
+
+	if (id != id_base)
+		return -EAGAIN;
+
+	iommu_spec->np = phandle_node;
+	iommu_spec->args[0] = master_id0;
+	iommu_spec->args[1] = master_id1;
+
+	err = of_iommu_xlate(dev, iommu_spec);
+	of_node_put(iommu_spec->np);
+
+	return err;
+}
+
+static int of_iommu_configure_map_id_and_mask(struct device_node *master_np,
+					      struct device *dev,
+					      const u32 *id)
+{
+	struct of_phandle_args iommu_spec = { .args_count = 2 };
+
+	return of_map_id_and_mask(master_np, *id,
+		 "iommu-map-masked", NULL,
+		 &iommu_spec.np, NULL,
+		 dev, (void *)&iommu_spec, of_iommu_map_id);
+}
+
 static int of_iommu_configure_dev_id(struct device_node *master_np,
 				     struct device *dev,
 				     const u32 *id)
 {
 	struct of_phandle_args iommu_spec = { .args_count = 1 };
 	int err;
+	bool iommu_map_masked = !!of_find_property(master_np, "iommu-map-masked", NULL);
+
+	if (iommu_map_masked)
+		return of_iommu_configure_map_id_and_mask(master_np, dev, id);
 
 	err = of_map_id(master_np, *id, "iommu-map",
 			 "iommu-map-mask", &iommu_spec.np,
diff --git a/drivers/of/base.c b/drivers/of/base.c
index ed2a924d1fab..bb11125e9624 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2053,6 +2053,9 @@ int of_find_last_cache_level(unsigned int cpu)
  * @map_mask_name: optional property name of the mask to use.
  * @target: optional pointer to a target device node.
  * @id_out: optional pointer to receive the translated ID.
+ * @dev: TODO
+ * @data: optional param that to be passed to fn.
+ * @fn: custom function to get implementation defined platform/device id.
  *
  * Look at the documentation of of_map_id().
  *
@@ -2060,10 +2063,13 @@ int of_find_last_cache_level(unsigned int cpu)
  */
 int of_map_id_and_mask(const struct device_node *np, u32 id,
 	       const char *map_name, const char *map_mask_name,
-	       struct device_node **target, u32 *id_out)
+	       struct device_node **target, u32 *id_out,
+	       struct device *dev, void *data,
+	       int (*fn)(const __be32 *map, u32 id, struct device *dev, void *data))
 {
 	u32 map_mask, masked_id;
 	int map_len;
+	int ret;
 	const __be32 *map = NULL;
 
 	if (!np || !map_name || (!target && !id_out))
@@ -2109,6 +2115,13 @@ int of_map_id_and_mask(const struct device_node *np, u32 id,
 			return -EFAULT;
 		}
 
+		if (fn) {
+			ret = fn(map, id, dev, data);
+			if (ret != -EAGAIN)
+				break;
+			continue;
+		}
+
 		if (masked_id < id_base || masked_id >= id_base + id_len)
 			continue;
 
@@ -2135,12 +2148,16 @@ int of_map_id_and_mask(const struct device_node *np, u32 id,
 		return 0;
 	}
 
+	if (fn)
+		return ret;
+
 	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
 		id, target && *target ? *target : NULL);
 
 	/* Bypasses translation */
 	if (id_out)
 		*id_out = id;
+
 	return 0;
 }
 
@@ -2167,6 +2184,6 @@ int of_map_id(const struct device_node *np, u32 id,
 	       struct device_node **target, u32 *id_out)
 {
 	return of_map_id_and_mask(np, id, map_name, map_mask_name,
-			target, id_out);
+			target, id_out, NULL, NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(of_map_id);
diff --git a/include/linux/of.h b/include/linux/of.h
index 6fcc46e8b3da..7f3890ab26d5 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -462,7 +462,9 @@ int of_map_id(const struct device_node *np, u32 id,
 
 int of_map_id_and_mask(const struct device_node *np, u32 id,
 		const char *map_name, const char *map_mask_name,
-		struct device_node **target, u32 *id_out);
+		struct device_node **target, u32 *id_out,
+		struct device *dev, void *data,
+		int (*fn)(const __be32 *map, u32 id, struct device *dev, void *data));
 
 phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
 
@@ -911,7 +913,9 @@ static inline int of_map_id(const struct device_node *np, u32 id,
 
 static inline int of_map_id_and_mask(const struct device_node *np, u32 id,
 		const char *map_name, const char *map_mask_name,
-		struct device_node **target, u32 *id_out)
+		struct device_node **target, u32 *id_out,
+		struct device *dev, void *data,
+		int (*fn)(const __be32 *map, u32 id, void *data))
 {
 	return -EINVAL;
 }
-- 
2.34.1


