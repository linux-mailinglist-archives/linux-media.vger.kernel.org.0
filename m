Return-Path: <linux-media+bounces-40313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C097B2CA33
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 18:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 463995A0258
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 16:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C7F305079;
	Tue, 19 Aug 2025 16:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PtN7QPdF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662DF304BD5
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755622566; cv=none; b=FBhO32CYHoqJaq1mdgPbwP3N4o9EomcXRgyrpfftKb07Wtz1umZlBzSsI6Wxc8lRm9HJjazbxMqslZOSZbyqQqDUgXR0zbBHxRJ9g8PaItxbanM0xwCDttpqMiO4KoexG5Qiv6uT2sTGHWkxsn4OCAcT4bLmkNi6kvhzS8jS0KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755622566; c=relaxed/simple;
	bh=Zc7+4/Z4XXaktbT2Lj7+7GuvFjOCS7TRGcWb2kd9DCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nOmze7umEKYKXdPBtiNoPNRVb4DsswwjJG/PEUIECj8H134G+3+RaoPaXBCEvhk7oChD+qXkWzLInAm1qfH2hvZ5TKSlX5vI/XZ+vRyuR60RiNK4YQsZrKFyuC2m97NGpMd5uSRoFVgQBQ65XGxX1bYr8/tjWMRqLmrKEHXRhPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PtN7QPdF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90Zta029801
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7TQCNmijRE9
	VS3dO0cEngmYEHlTvYCRhw6o+g4o3fCo=; b=PtN7QPdFvYCJJ9iXRc5gaT+8PwE
	DC6REKCdsle28yGZSmwt3oHX/3BAOaUzgJfSlzvoSHeM5fuK/xEqDM65Ae/ysP7P
	bMzwzTPs5KHRYxCwkOtDL7Ep/Yrej+rTnrRH1jkz9AoqT6v1itykSljuOI267Bmw
	s7y4GUuYzdwJKv2fXXeYfs1X0nSdnUOhXE7LsedmvAv6NNwqFvQv6E6MzhTVpjDw
	CDifGgtNof5w4bod+bKyldy4notNfLZtAqbf9K/nUwME8vTjB9Mp8UPGNW7RMWo6
	G3VUyN3GvMK7mG+eoM5jsox6GAqkB0BR2tQCWrC9debMTa+hhOALNQKFV5A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mh6b5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:56:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2445806eab4so58156845ad.1
        for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 09:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755622563; x=1756227363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TQCNmijRE9VS3dO0cEngmYEHlTvYCRhw6o+g4o3fCo=;
        b=WgXz1zc4/WNl97u+hVWPTjvF/JRYdHELqpxY3+aERE6K9nydp+zOeN0AVxDnuEscn+
         2LS7ugg6yXKMw0+acS2IkQxV/WB+FbD4ETNf+sec759p6q3hToo0F/sbhAh/guc0gp1g
         0k+awPeNbgakp7/VF6dFsjd+XmFf4WMUrvk/At1WeYgpFI1u794+kLQRHAr6Mv06Rv9L
         bzQbuQokt4IyodZfJLeC9Fq/sYhm+Vd0fkUQOvxy/CstbgJWxdxdc6VW0DrKnUv69L2j
         O2cLTQRFg/6rAzqBWi3KROf7Bp01OVgnykkqAkFBHmyMhAWB0BEUMVrHwb+x0eKlUCfm
         8sGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3qJDgUZGDMtWbrwS1KKHEjuQA6syNJOEG3ELvJSjP8weLwpJfoxfmig0vEieaPh2heQC0PqzmMuMYsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhAhKibdqXJ5+qIAHVyyCxiYci6Bc1U6nNPegxY7PO6nykvpFe
	A6FRXjCP4qKikSo9CCKJ688aUfeWKlB/a5cD2k0AZ6EPCaNbqDjeSS5C0Nshw7ycq9gRvVR5B5d
	lS9wMoYQOm6NXtWGogOTHG7mz5sONhrusodCL4B0O9r5t9/GAtA62KoRZAgAzD7Eg/A==
X-Gm-Gg: ASbGncuY8goZu92Zm/DX6qdH+wzAl5YQHrtd1bom6xtT0rkyfjFPdPsH1O+y3cfmZaF
	BlKQsS2Dwq8DnNpL9G47WIIqt/334ZkYk5hA+IkTcejqWqzwv0RjMcTx/BhjHIeP+aWBXrscsHB
	nxCH1PQkqv66H8IKeH2rKLW8YPHn0ZHGSQaTI09b7kW80NsvlZOkOfMHIYv9Aj6THkoE4nKY4c7
	MdyfieED0wcljYUcyq4gyfU0b4yFp7in6uV8+5fcYBX0TKP27QZfGu3AWcj0Q8YFBtA0D/vZlht
	alvW6RVfuP8CAW4idddYYCJJ+TYSBkNnuuu86729lFggxQ9Daii7CT4QZxOjCTY7Sk4=
X-Received: by 2002:a17:902:e80a:b0:242:2cad:2f8 with SMTP id d9443c01a7336-245e030786dmr50925105ad.22.1755622562528;
        Tue, 19 Aug 2025 09:56:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZhIm1RfeHftaTXr4FFqQ6mdKSfUgMY7hKB3MMlwRM9W570Zfi/DtPRME7Cf9owHlZ1VkQyg==
X-Received: by 2002:a17:902:e80a:b0:242:2cad:2f8 with SMTP id d9443c01a7336-245e030786dmr50924715ad.22.1755622562030;
        Tue, 19 Aug 2025 09:56:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33aa3esm2273885ad.24.2025.08.19.09.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:56:01 -0700 (PDT)
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
Subject: [PATCH v2 10/11] remoteproc: qcom: pas: Enable Secure PAS support with IOMMU managed by Linux
Date: Tue, 19 Aug 2025 22:24:45 +0530
Message-ID: <20250819165447.4149674-11-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a4aca3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=aSAcVJyT6VmtggMVTjAA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: uxPFBd33_w0h7aArkKFsblWDJoCDaCCF
X-Proofpoint-GUID: uxPFBd33_w0h7aArkKFsblWDJoCDaCCF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfXxDlDKXRKnWO2
 RFZQ7w+jh01SvyyqPVnSFxowWeP60vglGYuESg1uCfkN1xpST4eSFkma9FEk8G6AtwvfD/1uoZx
 Qpv7oKlx4cXHEbU7r7GFyiAy2W49IlRjPdRhfYI60jyWy99pi9eOmDiS1RPnHlBsgFGn1uUOtQV
 DcHy8SREkFgwETzj90lZCiI8/pQzSViFizbyKCeXh+6ysMSbzug/L2MSx9+QhDO1jhQk9/PuXuC
 Ryq8bkIFqkaIN06szMlaN0UADnoeVOneEA3R8FMW5c3t3CspEbts3M4eD2BTyQFbmzSv6jn84/h
 hrvQj3e55BO90VghHdLYDniIp1k2AtjCATRr76jzGAwq0HM8h5xVkEM8rmI+XEoBVt4J5apCDXi
 aawgeFcZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042

Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
or QHEE), which typically handles IOMMU configuration. This includes
mapping memory regions and device memory resources for remote processors
by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
later removed during teardown. Additionally, SHM bridge setup is
required to enable memory protection for both remoteproc metadata and
its memory regions.

When the aforementioned hypervisor is absent, the operating system must
perform these configurations instead.

When Linux runs as the hypervisor (at EL2) on a SoC, it will have its
own device tree overlay file that specifies the firmware stream ID now
managed by Linux for a particular remote processor. If the iommus
property is specified in the remoteproc device tree node, it indicates
that IOMMU configuration must be handled by Linux. In this case, the
has_iommu flag is set for the remote processor, which ensures that the
resource table, carveouts, and SHM bridge are properly configured before
memory is passed to TrustZone for authentication. Otherwise, the
has_iommu flag remains unset, which is the default behavior.

Enables Secure PAS support for remote processors when IOMMU configuration
is managed by Linux.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 63 +++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 1e0f09bf1ef2..180528bcd57c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/interrupt.h>
+#include <linux/iommu.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -250,6 +251,22 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
+static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
+{
+	if (rproc->has_iommu)
+		iommu_unmap(rproc->domain, mem_phys, size);
+}
+
+static int qcom_pas_map_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
+{
+	int ret = 0;
+
+	if (rproc->has_iommu)
+		ret = iommu_map(rproc->domain, mem_phys, mem_phys, size,
+				IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
+	return ret;
+}
+
 static int qcom_pas_start(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -284,11 +301,15 @@ static int qcom_pas_start(struct rproc *rproc)
 	}
 
 	if (pas->dtb_pas_id) {
-		ret = qcom_scm_pas_auth_and_reset(pas->dtb_pas_id);
+		ret = qcom_pas_map_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
+		if (ret)
+			goto disable_px_supply;
+
+		ret = qcom_scm_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
 		if (ret) {
 			dev_err(pas->dev,
 				"failed to authenticate dtb image and release reset\n");
-			goto disable_px_supply;
+			goto unmap_dtb_carveout;
 		}
 	}
 
@@ -299,18 +320,22 @@ static int qcom_pas_start(struct rproc *rproc)
 
 	qcom_pil_info_store(pas->info_name, pas->mem_phys, pas->mem_size);
 
-	ret = qcom_scm_pas_auth_and_reset(pas->pas_id);
+	ret = qcom_pas_map_carveout(rproc, pas->mem_phys, pas->mem_size);
+	if (ret)
+		goto release_pas_metadata;
+
+	ret = qcom_scm_pas_prepare_and_auth_reset(pas->pas_ctx);
 	if (ret) {
 		dev_err(pas->dev,
 			"failed to authenticate image and release reset\n");
-		goto release_pas_metadata;
+		goto unmap_carveout;
 	}
 
 	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
 	if (ret == -ETIMEDOUT) {
 		dev_err(pas->dev, "start timed out\n");
 		qcom_scm_pas_shutdown(pas->pas_id);
-		goto release_pas_metadata;
+		goto unmap_carveout;
 	}
 
 	qcom_scm_pas_metadata_release(pas->pas_ctx);
@@ -322,10 +347,16 @@ static int qcom_pas_start(struct rproc *rproc)
 
 	return 0;
 
+unmap_carveout:
+	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
 release_pas_metadata:
 	qcom_scm_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
 		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+
+unmap_dtb_carveout:
+	if (pas->dtb_pas_id)
+		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
 disable_px_supply:
 	if (pas->px_supply)
 		regulator_disable(pas->px_supply);
@@ -381,8 +412,12 @@ static int qcom_pas_stop(struct rproc *rproc)
 		ret = qcom_scm_pas_shutdown(pas->dtb_pas_id);
 		if (ret)
 			dev_err(pas->dev, "failed to shutdown dtb: %d\n", ret);
+
+		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
 	}
 
+	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
+
 	handover = qcom_q6v5_unprepare(&pas->q6v5);
 	if (handover)
 		qcom_pas_handover(&pas->q6v5);
@@ -424,7 +459,8 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
 	if (!rproc->has_iommu)
 		return ret;
 
-	ret = qcom_scm_pas_get_rsc_table(pas->pas_id, NULL, 0, &output_rt, &output_rt_size);
+	ret = qcom_scm_pas_get_rsc_table(pas->pas_ctx, NULL, 0,
+					 &output_rt, &output_rt_size);
 	if (ret) {
 		dev_err(pas->dev, "error %d getting resource_table\n", ret);
 		return ret;
@@ -726,6 +762,20 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	if (of_property_present(pdev->dev.of_node, "iommus")) {
+		struct of_phandle_args args;
+
+		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus",
+						 "#iommu-cells", 0, &args);
+		if (ret < 0)
+			return ret;
+
+		rproc->has_iommu = true;
+		of_node_put(args.np);
+	} else {
+		rproc->has_iommu = false;
+	}
+
 	rproc->auto_boot = desc->auto_boot;
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
 
@@ -800,6 +850,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	if (!pas->dtb_pas_ctx)
 		goto remove_ssr_sysmon;
 
+	pas->pas_ctx->has_iommu = pas->dtb_pas_ctx->has_iommu = rproc->has_iommu;
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
-- 
2.50.1


