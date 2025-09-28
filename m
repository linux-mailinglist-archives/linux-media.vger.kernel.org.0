Return-Path: <linux-media+bounces-43301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEFCBA7545
	for <lists+linux-media@lfdr.de>; Sun, 28 Sep 2025 19:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 304C37A274B
	for <lists+linux-media@lfdr.de>; Sun, 28 Sep 2025 17:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042D0242D7C;
	Sun, 28 Sep 2025 17:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C914esgf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B639C1494C3;
	Sun, 28 Sep 2025 17:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759079874; cv=none; b=u3tSHZdZuP9awJE9E8yhvpKBKRSbb/Kr/4aTVzkKQDYZEYaWxXzykEFKc3nGrYhwFYr7f8qZja4xwsddX6mB3M+gS6vvcKqryHlxivo0xOkT1xvLpi19ZSAVF7FwV+kjBZgrpBRO8zeBvtNOUfaKK9s6gKuq3I73+p9pn1CQ1Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759079874; c=relaxed/simple;
	bh=5RBuK09EVOyYkXHD4zvVywFmut3grmLymlPS2wQ9/w4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NyHZ50OaBpaZnOeNApojBqwWlYS1cxlZFOanBN305o4dYXSIzFrlljn4+YjqBq90m2FHOWI9cHe/FMzzxs6mn5zCjoGHPvSi9JNwcKriXSzWzrwwMLChpAdFKR0DvapMo/5okmg3Ph5l4PDNcHzblAYCVSpFfA5vgC8Iq97NeIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C914esgf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SGrFB7024946;
	Sun, 28 Sep 2025 17:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4IP0H+KM2Y8
	li2p4r3BV6jUlQlBH4IbPQPuiqrFVGg0=; b=C914esgfNmzSqK6Uo+D9Cbk5zhn
	wOvYmNamRC6npqNRgkdUWUt9kjOCPTlX0nUy/nnwOkMCEhWMlCfGEkun91ZmPcSX
	yUVqSAE0LBY92rSlys44ir66wiAGQxsry+C3Z5dy1TtctMTAgRzki0uQHxDNCDu+
	YNKDBIq1Yi6CO8WBYB/lKwDcvDlsbopKT/2E4fUQYy4J4MPe7CMgvzudkiwEEx4V
	uaCiTmuxTCGGlvoYWBLshKAUokOVcPhg7d1yYvuuDmPJjE6h61s5uLChyWIvGW20
	lTvQJmA8tWY/a97EWRsIL5PLslP6RFVOVZNxwLd0whQLXwm4EmPZSrSPbcA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e78fu30w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Sep 2025 17:17:26 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58SHHM87018671;
	Sun, 28 Sep 2025 17:17:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 49e90k74pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Sep 2025 17:17:22 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58SHHMRw018653;
	Sun, 28 Sep 2025 17:17:22 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-charante-hyd.qualcomm.com [10.213.97.134])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 58SHHMpL018647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Sep 2025 17:17:22 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 389980)
	id 379375F0; Sun, 28 Sep 2025 22:47:21 +0530 (+0530)
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
Subject: [RFC PATCH 2/3] of: create a wrapper for of_map_id()
Date: Sun, 28 Sep 2025 22:47:17 +0530
Message-Id: <20250928171718.436440-3-charan.kalla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=DZAaa/tW c=1 sm=1 tr=0 ts=68d96da6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=BA3SHdP6qxbv-UjKQhIA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyMiBTYWx0ZWRfX5u4M687hG9T/
 yY7+cQIj6Fx0AMqx3pUivoB6DT/uSxTaRIgqTL+C28RWvYmhZ21eRubOBfEiJ1Cs/R6nECYBkr/
 jyI7Y+LTLNUZoqQqpuukR/1kJulPYoJl5vEF878wvvrDNQk+GUJ25tHQ4KbGAGurxvTCqIjZ9Mz
 8YkZGDh2Z2ESXKLe280OUnbyB+CTNiNZUnaVd1+cCEJyuodLdELxNh99urfLtJicYr92GXqNICS
 49p4jnUdF69iNYosjcvcNdYjXy8Qg/bVHz+b9mgs8rvfCoQe3gF40Bp+BPh4WFzU5ZcGTkU5HEj
 HoWKSGqKfEv1aOqA5YKyTiiMSQQ1f95LtrVgty8OP4Uhv9HdKVovVPGAtdZfmLAHNEeVOzXO928
 S8S5mqv+++1fu5woVlVLbB87qR8PAg==
X-Proofpoint-GUID: 1xP_p3OU49YfZH8-Cq8WZDCHk8vjTmWT
X-Proofpoint-ORIG-GUID: 1xP_p3OU49YfZH8-Cq8WZDCHk8vjTmWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_07,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270022

Create a wrapper function for of_map_id(). This wrapper takes additional
params in the subsequent patches. No functional changes.

Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
---
 drivers/of/base.c  | 36 ++++++++++++++++++++++++++++--------
 include/linux/of.h | 11 +++++++++++
 2 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 7043acd971a0..ed2a924d1fab 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2054,17 +2054,11 @@ int of_find_last_cache_level(unsigned int cpu)
  * @target: optional pointer to a target device node.
  * @id_out: optional pointer to receive the translated ID.
  *
- * Given a device ID, look up the appropriate implementation-defined
- * platform ID and/or the target device which receives transactions on that
- * ID, as per the "iommu-map" and "msi-map" bindings. Either of @target or
- * @id_out may be NULL if only the other is required. If @target points to
- * a non-NULL device node pointer, only entries targeting that node will be
- * matched; if it points to a NULL value, it will receive the device node of
- * the first matching target phandle, with a reference held.
+ * Look at the documentation of of_map_id().
  *
  * Return: 0 on success or a standard error code on failure.
  */
-int of_map_id(const struct device_node *np, u32 id,
+int of_map_id_and_mask(const struct device_node *np, u32 id,
 	       const char *map_name, const char *map_mask_name,
 	       struct device_node **target, u32 *id_out)
 {
@@ -2149,4 +2143,30 @@ int of_map_id(const struct device_node *np, u32 id,
 		*id_out = id;
 	return 0;
 }
+
+/* of_map_id - Translate an ID through a downstream mapping.
+ * @np: root complex device node.
+ * @id: device ID to map.
+ * @map_name: property name of the map to use.
+ * @map_mask_name: optional property name of the mask to use.
+ * @target: optional pointer to a target device node.
+ * @id_out: optional pointer to receive the translated ID.
+ *
+ * Given a device ID, look up the appropriate implementation-defined
+ * platform ID and/or the target device which receives transactions on that
+ * ID, as per the "iommu-map" and "msi-map" bindings. Either of @target or
+ * @id_out may be NULL if only the other is required. If @target points to
+ * a non-NULL device node pointer, only entries targeting that node will be
+ * matched; if it points to a NULL value, it will receive the device node of
+ * the first matching target phandle, with a reference held.
+ *
+ * Return: 0 on success or a standard error code on failure.
+ */
+int of_map_id(const struct device_node *np, u32 id,
+	       const char *map_name, const char *map_mask_name,
+	       struct device_node **target, u32 *id_out)
+{
+	return of_map_id_and_mask(np, id, map_name, map_mask_name,
+			target, id_out);
+}
 EXPORT_SYMBOL_GPL(of_map_id);
diff --git a/include/linux/of.h b/include/linux/of.h
index a62154aeda1b..6fcc46e8b3da 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -460,6 +460,10 @@ int of_map_id(const struct device_node *np, u32 id,
 	       const char *map_name, const char *map_mask_name,
 	       struct device_node **target, u32 *id_out);
 
+int of_map_id_and_mask(const struct device_node *np, u32 id,
+		const char *map_name, const char *map_mask_name,
+		struct device_node **target, u32 *id_out);
+
 phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
 
 struct kimage;
@@ -905,6 +909,13 @@ static inline int of_map_id(const struct device_node *np, u32 id,
 	return -EINVAL;
 }
 
+static inline int of_map_id_and_mask(const struct device_node *np, u32 id,
+		const char *map_name, const char *map_mask_name,
+		struct device_node **target, u32 *id_out)
+{
+	return -EINVAL;
+}
+
 static inline phys_addr_t of_dma_get_max_cpu_address(struct device_node *np)
 {
 	return PHYS_ADDR_MAX;
-- 
2.34.1


