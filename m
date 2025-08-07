Return-Path: <linux-media+bounces-39003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40252B1D395
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 09:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE02E720BDE
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 07:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEF624503C;
	Thu,  7 Aug 2025 07:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nBdaCbm5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77E523D29F
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 07:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754552609; cv=none; b=kfN9ccosdFeecCNku6f2w1sTqf9imLdk4yEN1Dq5dH/8dNWfvxK42w0fSb/fx4E5gOPjQ8lSgQizphZ1rVF4O7RlOHYQrClvdtRFAVkEb33WVu11ne+2zt/jQesfaPBcj8aqkQIHLU3E8jlJ6fNxQ1o6WY4qmHbLASSRt64Tc4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754552609; c=relaxed/simple;
	bh=aJf8dgH4dYz4FeXdIaB9wlD7Vgy/o7rrXh0zl/XsgWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EQZBiVBjbeLsmtla5lubrjPjLDR4q7KatT3REOjP9wnHVkhKWhNgJ6O0IFgy2c5y5meUOp1xPTA0BqRxCuVH8dUTJ/2c5HNm1J48dTgnH2uoZ4jKuCMAIu+qja/NT/5+5Cy8YBAHmW1/KAAj6xOm8DglwIqWfjSQUtsW4n184Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBdaCbm5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5770VOOS011007
	for <linux-media@vger.kernel.org>; Thu, 7 Aug 2025 07:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SdrbuuxHkEeQigeY7KFKAwRwQZ1v06KXS3A
	qG305+AI=; b=nBdaCbm5x8LI4sQsiTXL6sdEItOKhtIwIR4NWJd9vFS8SIpVBAM
	N+RzVIvi2W0ZmCoak2/+cJO/0KH4qzIviQZcXra7qc69fbVc0UvuiCCKqItUzlJQ
	lvH2/THLqc1P9DInQse5YBUs7Mwn/9M+ee90lRJf0VOkfeP+F5mY47BPHZNsR1u0
	m11Eu2vVsTZN8DvVRq4qAkIz7AP3hjqbalATTEHHqiQJnU98uVpT8pTkaR359kTF
	bKnwshfhDwMFwaFbPMHaraW6/UMZYEpWB2g9JXAqKgvnJqp2UTW+JQqVG4C/HkD4
	KzwjHLWvZkAqXuwWUzb0VxGNfJcqkgaqWGQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw35gnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 07:43:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so1260234a12.1
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 00:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754552604; x=1755157404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdrbuuxHkEeQigeY7KFKAwRwQZ1v06KXS3AqG305+AI=;
        b=ZzJEdvvKnynEtCOhIwJwFg029J/AL6ulW0lz+E/q9/I42tPg4oLetnUN6eiEkXw+bP
         R7imWfU13BFd+NuO33d/vLdAcZ9EupAJT+tohzRFUjOIV8JBnmbNfXaY+FvZA8qdqG4Z
         vEhs2+4YbGJXexFJNzJMypFJCFWdi3MJpsnlx7UaQ4eAersZNTuLFI2uy6ms/ri7UKw2
         3n4TWkEuU1TtrszH9amgjBE1Sf2+3+qNHMQe9v6W7R3z8UF21Z4tZ41iX4FdPF7OW5U7
         9PIDXkt2G5fOEEFj+84gE6fiTPgzGsms9+J7igqruKMOltdnW9U+5eMW/4/z7jgBz+oT
         Mibg==
X-Forwarded-Encrypted: i=1; AJvYcCXtoiCPyUQilbUAzXXpuI1rQE/axG+3PoqysFw7rtBamoamkoqNcpyIcF9sV0sFnu9OVdLOaKT+2gbhgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAV7gNJCn9XzCobMr7+/FC9BL1oHUuAYTTHuqDzScnKwxlEfZ8
	lVoaZjlWRzFrxuR5TZHQjE2eH4u/VIfYclXzBVBuUWYarO5Vg1EcRAkN0vWYdffylrzxBxmihbd
	8WDWSrE4AEWQrOpFlJFop/ZztR7CnR3A9xsRMN9tCOu08mjBp48HvYACOJIFw00zeUw==
X-Gm-Gg: ASbGnctYswgVALwV3Vy7gdtHgtvy5Ucs4bdojsT0DRkklp32EG85CTK+XGGfSOrdohq
	OJvb1YCwPCNl3AzYXvHvYaMjGmHG9yl5YvrOb6dgCQ193JjNjaWc2SXAJZmQK7hqY2/MHzlZxaF
	er1853PlSNrYqMRriDi6+Ng5CS89rkfUALo+8h3RdZ6O5w4HG3KLOiAO4H1ZtZhouLMzLwnUsJw
	lZ9dYiUTYJQiHpaschbf7a050qAH0ngbzYjGUcwtI7prP0qcvJMUdbpsXo40zog/KykRP8/Riua
	wF4csBDTXzQO7xXEF9ehpxPBTqlzI3UHZaf9JT0GM4ZvFrIZ2fzasJ6S1VU3Y1OSq8Y=
X-Received: by 2002:a17:902:d2c2:b0:242:9bca:863f with SMTP id d9443c01a7336-2429f5bbc5fmr72030825ad.57.1754552604173;
        Thu, 07 Aug 2025 00:43:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHANSCJfj5IWevcX9I21BsXg/+4n+zB41jVKkCMdFHRNuqkAEqf/i9yKeqzmpgMCnYVJaYulg==
X-Received: by 2002:a17:902:d2c2:b0:242:9bca:863f with SMTP id d9443c01a7336-2429f5bbc5fmr72030435ad.57.1754552603705;
        Thu, 07 Aug 2025 00:43:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm178166395ad.39.2025.08.07.00.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 00:43:23 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [Patch v3 1/3] soc: qcom: mdt_loader: Remove unused parameter
Date: Thu,  7 Aug 2025 13:13:09 +0530
Message-ID: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX7ujbvhDPZH1Z
 pUUU7YbGuUerrgGU4VjdrSWOb+dEA261eqO3cEKkVd6EuN7POawNfuCFPODnVaz7UP+AcXCvuYt
 1HA1xfYcJ/il6e1szrQSY2jv+1y+bWoh4bdpyBD2w8CwHJsePF+EV6TFxohEJuXLFmu4ZRYRryl
 0cIrFGqT/CdTvDsmiMwXchmYZqyFLMX/El6cHNW+YlEVrJcywWooESgUHkwVz27vOIsQ1h7Wu/2
 zz9tvgrNPxz8aN7yxbX0tbKnAJhrfriXdDDH6x4FR/Of9woNscheQA1ky1HYjo2f+ZF5nt+c+C9
 jRxu3QHPIoxfnAhkkluGxgxEJni1cLckmxEsoVxK634VpxedYkNUlUhbB8oPqMrkDSUIYN4h1Z3
 gYxSyYVR
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=6894591d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qLU0tmo_xPokh9XVZMUA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 36OxGWKkOSPAom4QObT9WF-0poTSYO6B
X-Proofpoint-ORIG-GUID: 36OxGWKkOSPAom4QObT9WF-0poTSYO6B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

commit f4e526ff7e38e ("soc: qcom: mdt_loader: Extract PAS
 operations") move pas specific code from __qcom_mdt_load()
to a separate function qcom_mdt_pas_init() after which the
pas_init variable became unused in __qcom_mdt_load().

Remove pas_init argument from __qcom_mdt_load().

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3: https://lore.kernel.org/lkml/20250806172531.1865088-2-mukesh.ojha@oss.qualcomm.com/
 - Because of the drop of 1/4 in earlier version this becomes first
   patch.

- Changes in v2:
 - Added R-b tag and its order in the series.

 drivers/soc/qcom/mdt_loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 0ca268bdf1f8..dfd15d189087 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -333,7 +333,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 			   const char *fw_name, int pas_id, void *mem_region,
 			   phys_addr_t mem_phys, size_t mem_size,
-			   phys_addr_t *reloc_base, bool pas_init)
+			   phys_addr_t *reloc_base)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -459,7 +459,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		return ret;
 
 	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
-			       mem_size, reloc_base, true);
+			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load);
 
@@ -482,7 +482,7 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  size_t mem_size, phys_addr_t *reloc_base)
 {
 	return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region, mem_phys,
-			       mem_size, reloc_base, false);
+			       mem_size, reloc_base);
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 
-- 
2.50.1


