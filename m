Return-Path: <linux-media+bounces-38839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE64B1A19D
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 14:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9169177FEC
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 12:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6191E25F78F;
	Mon,  4 Aug 2025 12:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="APpA4Uo8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B9625E828
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 12:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754311363; cv=none; b=LE1fubr3uSrkCrrE94U/bNU1HKsyhOP+nH+nq2xPQ5Xi7A27eqIkJh7I0HLX1p8KPQcKU2uee5YJtH/BUzOhBs0SFDBUchPplSl71Hd/fqn6p0QOwGl68jsd5diBN/UiQS41uZWFLm/aI5rwtXZ2UM0pWhRoisM2SfMBSGQYKP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754311363; c=relaxed/simple;
	bh=F/VAeubVw+7Ebvh24oFSsn1MT1FFSrUw3oTOjOE96As=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XT60Sb5A6h3R1IFr0Sxr49Gcxb5+/+icUOke41OPD/aPuy6zIu+eAQRH0P9xp1swl8J+vLHaDVnyoRWn+OyPiE0u/b4jk1tboJk1BUtfyrwD9+yPrmcgmlIa8qn9Vj5L+mbvWNQHVgG6HHF/4Uc7humHt6a1s5ljhb6RlVxbpx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=APpA4Uo8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748cAV7016577
	for <linux-media@vger.kernel.org>; Mon, 4 Aug 2025 12:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	euPMbICaYz4sYTXfiuz9KHR/6SowX7Y4n17wo9kNeSE=; b=APpA4Uo8Oda10L7J
	b+a/swrubD3CiYkEuUx43Tx7rT9QlEGaO8a/aDwWkjcxX3Gc9yqGwAWkfjDOXsh/
	s9ApeyB0K5/CCJjQ0Z+0L+9KL9h11MNBeH/98TOjCRqdUWamO+I+J5sW42DG6VD3
	OJRbobsnIC8lcBixDnbYmF5pFtNYMmrjelswH/SMriN4zQpn88vPuF4/482Q5IVf
	Dc+YntLQxhVbiSxTe7tPpkLBRpO0/8kjEvurFxTMdK6K2OEEkuF/Ebo0k+G/zQ7D
	3HtmjG1VetmdelOT0QX93o9rLHim1n7v4nEv6OtCVIvAQ7tA9bL2i2BSmb48H9Cb
	Aa26wg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4898cjn7jb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 12:42:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b3f33295703so6074930a12.1
        for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 05:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754311360; x=1754916160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euPMbICaYz4sYTXfiuz9KHR/6SowX7Y4n17wo9kNeSE=;
        b=LP0/O9EzhSRRdG1OZJ5KuQItqZ/A6vyom9FyKnK0PbTErqq3+FIm1f4mectx6zROSN
         9veyhdtIMd0j+Tpx6KCQ9kUan6M6Gkn8OQIGahH9CQn2LNj0+bTa7ZQfmzx4VfnWvjmW
         T6VIOMx/5KBQAZQX9OkD+NTOVxAMavzjRjS3+1CsfM4bISOeWzuWWlnO/xFq3LFQ/kk3
         3XMg6xMLO4+vO4uhTwa+M3XhBT/E1niYM0qW8ecQkVfLYyrQ60U+mEt1lNCeScKiMV/d
         QDcOXj+WvBbq9cStB7TTcfcPNUYJklk+7asiVlDrnTfAxMWXvIKIEiASWKMDtpKxh30R
         PN1A==
X-Forwarded-Encrypted: i=1; AJvYcCVXpe+VgVBsLlo/fZ8V0bGRg9PiE7ZwOgMQ2EtGiucRrkWfawcVQcnX0iKXy5V4Dmp95DbtCa+HpyWk+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPyU6SQyMec2rhVEEtceI8C1lc6kNFPe15oTT8y27GwIVJx8Pu
	Xv1PTlcTmnTFqekTcBR/WAoLw5Ne6kcZjkEKs7uE6NSfVRjZZ+3Gqw3UzgjKcnup70HNNvm4sxN
	Wjz/BY6KRb9Rt9ArJzay9Io9vYw9FDOdv9NCbnW9gur6H1Lx9cS44vpLYla5CektHPg==
X-Gm-Gg: ASbGncuZxyvjzU3iLPpzqEIf7ymWwYy4zIVOHhOhPqc3U0e0cvJ3jsNV8Rq+MT0xOIz
	QH72OPA+YD7QwPdFVXz0PDopvFXx0pz/2klp4AsUhbVe90RVCNipimxcGoCI7zF5j3g2Vb8TYT9
	NXuUv99rBOvqhJnes1m6rp/eZ+BACHWjxhGguXLYCZGYrF/x4GUa6vh6kY7yBBD0VkHeNOyCYH3
	PUJTx+mcF49sLI0dlg4ROKb2HEYsNPHJ7Zg/QwAGxUDfeNXye3KPYR6TfZhRfCPimCdSyXI8ZYc
	a4RF8glH4dbEYRKsjs1NwYYL5Z+WCP570Cnp4sXUSwJCakDuFGjOJfq8cLKhXvYf3sc=
X-Received: by 2002:a17:903:41c6:b0:23d:d348:4567 with SMTP id d9443c01a7336-24246f68df6mr148128565ad.19.1754311360450;
        Mon, 04 Aug 2025 05:42:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYqj5c+gIwk1mnIxx2ce4F76rKrGqlwyIVz1AIrOhm0r6nHNc02SPcnNUal7tSAdMaoY7hGw==
X-Received: by 2002:a17:903:41c6:b0:23d:d348:4567 with SMTP id d9443c01a7336-24246f68df6mr148128195ad.19.1754311359991;
        Mon, 04 Aug 2025 05:42:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef8204sm108876365ad.34.2025.08.04.05.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 05:42:39 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 04 Aug 2025 18:11:50 +0530
Subject: [PATCH 2/3] soc: qcom: mdt_loader: Remove pas id parameter
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
In-Reply-To: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754311345; l=8001;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=F/VAeubVw+7Ebvh24oFSsn1MT1FFSrUw3oTOjOE96As=;
 b=Mkcw1bDdbiqVAT9mbABo7MRbkbP3OmQl9LTHR111RUUTJ8s0JLA/4hSX2SafpvxpPft4utXbX
 jtOHGb6h6d/DXZP3zVGyNtXg3hlgi9WwI3Mmf41FegM/27KWUp1Cw+T
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=MNBgmNZl c=1 sm=1 tr=0 ts=6890aac1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=8m4FMoEBHb0BRpTWb9cA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 3j0K8ByNDtXJi62yckKv8aEb5mcoBqir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2OSBTYWx0ZWRfX6VODaMb2555s
 S/vavVjkdJhZL7xxKM7Zn9XUBW/paSCIft+bsqbzHYssJvo5IgsMHFLqCReZ5V0jRPe940JZDiV
 7oGkteabkAEXrSROAKmk1yLvta/u+Z+qqJhRuL4bsxxGANGm1jZOAaTYKX7HLNR46/URYti644r
 3lemx8Kou+ujUked8xg3jndF7AZauIB2QfIXaflxk3PhFxaqXz+xqiQsFCTLFMOpNPPPEtd30ef
 Y5CRmJUvNUDTruMJoctAbpVzTJ7zItGM4MzQfGgtzd8j/RngBfQVLtNza2cPptPG2RFxQCYUZx1
 UGHSye+Nl2feZ1gB+0Ol2pd++Pr1r4a1rCkstey8syD+Dd8bNC1uqAiiDDZGRizzIYZQ7PIhjUv
 KUFoFR9qupkb6DLiWhF5R+jeOIs0dkX+MFGtza1NFQBoVDxCoudIuyPIVWLfhFTjWJa1RX6o
X-Proofpoint-GUID: 3j0K8ByNDtXJi62yckKv8aEb5mcoBqir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040069

pas id is not used in qcom_mdt_load_no_init() and it should not
be used as it is non-PAS specific function and has no relation
to PAS specific mechanism.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/firmware.c |  4 ++--
 drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
 drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
 drivers/soc/qcom/mdt_loader.c                | 14 ++++++--------
 include/linux/soc/qcom/mdt_loader.h          |  7 +++----
 7 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 66a18830e66d..862d0718f694 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -136,8 +136,8 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 		ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID,
 				    mem_va, *mem_phys, *mem_size, NULL);
 	else
-		ret = qcom_mdt_load_no_init(dev, mdt, fwname, VENUS_PAS_ID,
-					    mem_va, *mem_phys, *mem_size, NULL);
+		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
+					    *mem_phys, *mem_size, NULL);
 
 	memunmap(mem_va);
 err_release_fw:
diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 3b983f4e3268..b30527c402f6 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -414,7 +414,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		goto err_fw2;
 	}
 
-	ret = qcom_mdt_load_no_init(dev, fw2, fw2_name, pasid, mem_region, mem_phys,
+	ret = qcom_mdt_load_no_init(dev, fw2, fw2_name, mem_region, mem_phys,
 				    mem_size, &mem_phys);
 	if (ret) {
 		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 94af77baa7a1..e98b7e03162c 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -317,7 +317,7 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	struct qcom_adsp *adsp = rproc->priv;
 	int ret;
 
-	ret = qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, 0,
+	ret = qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware,
 				    adsp->mem_region, adsp->mem_phys,
 				    adsp->mem_size, &adsp->mem_reloc);
 	if (ret)
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 02e29171cbbe..55a7da801183 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -242,9 +242,8 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 			goto release_dtb_firmware;
 
 		ret = qcom_mdt_load_no_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
-					    pas->dtb_pas_id, pas->dtb_mem_region,
-					    pas->dtb_mem_phys, pas->dtb_mem_size,
-					    &pas->dtb_mem_reloc);
+					    pas->dtb_mem_region, pas->dtb_mem_phys,
+					    pas->dtb_mem_size, &pas->dtb_mem_reloc);
 		if (ret)
 			goto release_dtb_metadata;
 	}
@@ -307,7 +306,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	if (ret)
 		goto disable_px_supply;
 
-	ret = qcom_mdt_load_no_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
+	ret = qcom_mdt_load_no_init(pas->dev, pas->firmware, rproc->firmware,
 				    pas->mem_region, pas->mem_phys, pas->mem_size,
 				    &pas->mem_reloc);
 	if (ret)
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 93648734a2f2..07c88623f597 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -757,7 +757,7 @@ static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 	int ret;
 
 	ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
-				    0, wcss->mem_region, wcss->mem_phys,
+				    wcss->mem_region, wcss->mem_phys,
 				    wcss->mem_size, &wcss->mem_reloc);
 	if (ret)
 		return ret;
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index dfd15d189087..7522223835f5 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -302,7 +302,7 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_init);
 
-static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_name)
+static bool qcom_mdt_bins_are_split(const struct firmware *fw)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_hdr *ehdr;
@@ -331,7 +331,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 }
 
 static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
-			   const char *fw_name, int pas_id, void *mem_region,
+			   const char *fw_name, void *mem_region,
 			   phys_addr_t mem_phys, size_t mem_size,
 			   phys_addr_t *reloc_base)
 {
@@ -353,7 +353,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	if (!mdt_header_valid(fw))
 		return -EINVAL;
 
-	is_split = qcom_mdt_bins_are_split(fw, fw_name);
+	is_split = qcom_mdt_bins_are_split(fw);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
@@ -458,7 +458,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	if (ret)
 		return ret;
 
-	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
+	return __qcom_mdt_load(dev, fw, firmware, mem_region, mem_phys,
 			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load);
@@ -468,7 +468,6 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  * @dev:	device handle to associate resources with
  * @fw:		firmware object for the mdt file
  * @firmware:	name of the firmware, for construction of segment file names
- * @pas_id:	PAS identifier
  * @mem_region:	allocated memory region to load firmware into
  * @mem_phys:	physical address of allocated memory region
  * @mem_size:	size of the allocated memory region
@@ -477,11 +476,10 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  * Returns 0 on success, negative errno otherwise.
  */
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
-			  const char *firmware, int pas_id,
-			  void *mem_region, phys_addr_t mem_phys,
+			  const char *firmware, void *mem_region, phys_addr_t mem_phys,
 			  size_t mem_size, phys_addr_t *reloc_base)
 {
-	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
+	return __qcom_mdt_load(dev, fw, firmware, mem_region, mem_phys,
 			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 9e8e60421192..8ea8230579a2 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -24,7 +24,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  phys_addr_t *reloc_base);
 
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
-			  const char *fw_name, int pas_id, void *mem_region,
+			  const char *fw_name, void *mem_region,
 			  phys_addr_t mem_phys, size_t mem_size,
 			  phys_addr_t *reloc_base);
 void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
@@ -54,9 +54,8 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 static inline int qcom_mdt_load_no_init(struct device *dev,
 					const struct firmware *fw,
-					const char *fw_name, int pas_id,
-					void *mem_region, phys_addr_t mem_phys,
-					size_t mem_size,
+					const char *fw_name, void *mem_region,
+					phys_addr_t mem_phys, size_t mem_size,
 					phys_addr_t *reloc_base)
 {
 	return -ENODEV;

-- 
2.50.1


