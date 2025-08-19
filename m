Return-Path: <linux-media+bounces-40308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F10B2CA19
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 18:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8612F584070
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 16:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98D62FC880;
	Tue, 19 Aug 2025 16:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M9OmXDBT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985E52F39DC
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755622545; cv=none; b=ORXm9CYkVz+kql5SpfJN1ufOi8v7y6ADWk3rziy+MNhPzR0wR8gkVynRcEsWU+vxdA75G0T4uTJWD6ykZ8jFNVz5tjaV1/H1FeKxTHRVFdPgkif6TpTKLJ7KQAuDUOCXp45m+ZCnUJi7J1EUCZ9FkNsOTn66R+dHSafXnE9Jwnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755622545; c=relaxed/simple;
	bh=igmWXGDfZJgGqYLQsdWmweoZviV0aJv6y/WleauHOUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U4vF3W3Cl7kxuWFV2YKRBeS/+BoLCKh88/U8G8EfQWnkzN2czUmwDYslTHoYsklgAF70cIXoeAGudZO0vh0WKwaqTjw9v5d7jnG1jdOpPo65WyEnJZU9FUa9R1c5cJalP6e9+pvOasEviMESJtjTbAttcc7e1Fih9Hx7WfeXRjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M9OmXDBT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90YNC008290
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CjgXp1Y64nh4dU4S4gqNWdoW+21OmjzNlNKNUULzdWM=; b=M9OmXDBTor4vXzNP
	SWxLZqdfIT/rEVeIWXeBSmknm4ZO4RWErkAyRq/NlbxsQU/iTfO9sB21RtZFtCBY
	auODGNEKS4OSAqrU3GymlyIFPXFJK1CNmLStwlvwQvXdJxxj1zaReP2D2EUbU11x
	CcrHN+3KMjQTQC8K1b5mKaNvn9ShdO1nkgriak4Mb4E0MRR1S4XuSWndKCUdr7R6
	zapUdDjC974G23Xrjf3a/H+iFX2Oy2LPCvTuno/qMXaMvuHnyNP2RCvFyUB/TNEH
	/nqHoA3XxveEof1iqxcGy7CwbBmYazDbdJ7K6I/iWvYbNocW2akYNmEmdvWl8c53
	muIV3g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99s97j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:55:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24458194d82so57258795ad.2
        for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 09:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755622542; x=1756227342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjgXp1Y64nh4dU4S4gqNWdoW+21OmjzNlNKNUULzdWM=;
        b=w/HOTz30JukoPIXCf/0q5iBLKAUiIPSRDBtfb0gofIizgfN1ElnrUPmceFyjH3tpDZ
         Dln8pRsv0YvsdLZreG/rCjW57e2gegLBCPlmtP0a3dRHErHwU/IwIEzSeQxBGI5KhO1L
         Erdtu8RhD3KyPQ7DgRIVrjr7T80gfzpZYCVCxv+d3C4ALryNTU0xRpjKOVK5GZVfl6zS
         y+vgRDMTJ1IQqD+UrbkGPWc1DrTi7SsEbYBo7l5p5uyVW1dnNq+9eAhQnZ49x9S9Fexj
         dzVlvoVYIb5WrDHSe9pBsGPlospmDMuxbdzzzLHKznVxVKAjS8I4Tr7a/OtKqpxtPJbS
         nvew==
X-Forwarded-Encrypted: i=1; AJvYcCXp3Dg4y9Ojf1HgzvXAxTI2Xl+DzZMGlMniepjIcMzmCVaqnteBaxkr19ngvYiIouYb+G2z1vz+8WrHqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7x+KaH8ooJsjZ4IoTxdINy9UHBa4xBiMpcv8xZt9K0hDb1qUO
	lCJTeKqEjS9pMXoka/jO36V751jaTiFqJT+AjKBYd0SSLaxKHM+jYHboRHOKtbSCXfE6RWNgcD7
	HJ4lNfkEpbaWeG7s6heeJF9uBFuwSH+WRxLFEcoQBrihe3mIUZN+HlUuph9uz46wcRQ==
X-Gm-Gg: ASbGncs9FgMNPua6nCbt4rWgYorm1t1KCD6W/XhVz/RoHkenlik+pBDqtMlz6mD1R/i
	qIBjNtYfQD9Iq66WevBJhrUoQjcnW8+rTWgE4dWCjuiEF88zr684fwMElje02FEnFU91QrtprOf
	Gz9KqWyILKfLpwVHqnfoa5gwo+vloQ7B7xV5G+sXf3/5Qp7qwnoNvVxF0D6cO6P7XI0JNwknSyb
	J0REueG9KRQPZ2PCL143h2sBVcxru3TbvUs14Ltu8A24ou5J1b7/H0P9DAfFVwh9XpMJbsoYjNM
	Y1NQ8GUifDHCfWT3gJbIThgGPDwhHqqUvYcC+amDGZQ7pemyJQeStiIeOegK27ltz8g=
X-Received: by 2002:a17:903:90d:b0:240:a222:230c with SMTP id d9443c01a7336-245e04347d4mr44873745ad.12.1755622541970;
        Tue, 19 Aug 2025 09:55:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjSbx6hP0IXrtwYPwayQaEdPlolnmEHoQI6x7PsME5hqHanrSk6OjmUJzYGCOGXay3PmcQCg==
X-Received: by 2002:a17:903:90d:b0:240:a222:230c with SMTP id d9443c01a7336-245e04347d4mr44873265ad.12.1755622541415;
        Tue, 19 Aug 2025 09:55:41 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33aa3esm2273885ad.24.2025.08.19.09.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:55:41 -0700 (PDT)
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
Subject: [PATCH v2 05/11] firmware: qcom_scm: Add shmbridge support to pas_init/release function
Date: Tue, 19 Aug 2025 22:24:40 +0530
Message-ID: <20250819165447.4149674-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: F8aQUn8BPqSzfh8Jtl55gBNR_fsWgdFD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfXx5ikSkEdT5s3
 Nzn9KyOuPWqJyqLs3AdFr5XTtHe0wPdYShVqQeZrfF33UsV3MdfZRx/BgAXNuLNDcbhMsE9ZOnK
 /HC4fj2WAtXKEjzh+hFVR9KJWus8WiF+tK7o+K/tON8VsX3aPEOj8pbNbQ1LX1k7fKx0JLjgWAI
 IUFS5CkYGIi60WNH+Mk6lN09zrxRjE2/FV6qfzEplkwkJwPwXQ6YUmEgmS1MT4OwX3IK5rvD0Vw
 nYN4NQqoqw8efXX5GlCh1gBDxgZ+WpHExUPmDTLMgQBvwf4IamGuoLSUanOFpg7t3oMEbg83R8k
 hMnJcr4pQdJXtzKg4TY5bHBY3ZFspLolJTDnKMH2hZCBuCYWcGKufdtdH5Wzxxng4mG1Pt6ASNV
 XXyx7Sxr
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a4ac8f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ztJyIkpEuA6XkPtyt7wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: F8aQUn8BPqSzfh8Jtl55gBNR_fsWgdFD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045

Qualcomm SoCs running with QHEE (Qualcomm Hypervisor Execution
Environment—a library present in the Gunyah hypervisor) utilize the
Peripheral Authentication Service (PAS) from Qualcomm TrustZone (TZ)
also called QTEE(Qualcomm Trusted Execution Environment firmware)
to securely authenticate and reset remote processors via a sequence
of SMC calls such as qcom_scm_pas_init_image(), qcom_scm_pas_mem_setup(),
and qcom_scm_pas_auth_and_reset().

For memory passed to Qualcomm TrustZone, it must either be part of a
pool registered with TZ or be directly registered via SHMbridge SMC
calls.

When QHEE is present, PAS SMC calls from Linux running at EL1 are
trapped by QHEE (running at EL2), which then creates or retrieves memory
from the SHM bridge for both metadata and remoteproc carveout memory
before passing them to TZ. However, when the SoC runs with a
non-QHEE-based hypervisor, Linux must create the SHM bridge for both
metadata (before it is passed to TZ in qcom_scm_pas_init_image()) and
for remoteproc memory (before the call is made to TZ in
qcom_scm_pas_auth_and_reset()).

For the qcom_scm_pas_init_image() call, metadata content must be copied
to a buffer allocated from the SHM bridge before making the SMC call.
This buffer should be freed either immediately after the call or during
the qcom_scm_pas_metadata_release() function, depending on the context
parameter passed to qcom_scm_pas_init_image(). Convert the metadata
context parameter to use PAS context data structure so that it will also
be possible to decide whether to get memory from SHMbridge pool or not.

When QHEE is present, it manages the IOMMU translation context so, in
absence of it device driver will be aware through device tree that its
translation context is managed by Linux and it need to create SHMbridge
before passing any buffer to TZ, So, remote processor driver should
appropriately set ctx->has_iommu to let PAS SMC function to take care of
everything ready for the call to work.

Lets convert qcom_scm_pas_init_image() and qcom_scm_pas_metadata_release()
to have these awareness.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 71 +++++++++++++++++++++-----
 drivers/remoteproc/qcom_q6v5_pas.c     | 14 ++---
 drivers/soc/qcom/mdt_loader.c          |  4 +-
 include/linux/firmware/qcom/qcom_scm.h |  9 ++--
 4 files changed, 73 insertions(+), 25 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 7827699e277c..301d440f62f3 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -616,6 +616,35 @@ static int __qcom_scm_pas_init_image(u32 peripheral, dma_addr_t mdata_phys,
 	return ret;
 }
 
+static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_ctx *ctx,
+					    const void *metadata, size_t size)
+{
+	struct qcom_scm_pas_metadata *mdt_ctx;
+	struct qcom_scm_res res;
+	phys_addr_t mdata_phys;
+	void *mdata_buf;
+	int ret;
+
+	mdt_ctx = ctx->metadata;
+	mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
+	if (!mdata_buf)
+		return -ENOMEM;
+
+	memcpy(mdata_buf, metadata, size);
+	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
+
+	ret = __qcom_scm_pas_init_image(ctx->peripheral, mdata_phys, mdata_buf, size, &res);
+	if (ret < 0 || !mdt_ctx) {
+		qcom_tzmem_free(mdata_buf);
+	} else if (mdt_ctx) {
+		mdt_ctx->ptr = mdata_buf;
+		mdt_ctx->addr.phys_addr = mdata_phys;
+		mdt_ctx->size = size;
+	}
+
+	return ret ? : res.result[0];
+}
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
@@ -625,7 +654,7 @@ static int __qcom_scm_pas_init_image(u32 peripheral, dma_addr_t mdata_phys,
  *		and optional blob of data used for authenticating the metadata
  *		and the rest of the firmware
  * @size:	size of the metadata
- * @ctx:	optional metadata context
+ * @ctx:	optional pas context
  *
  * Return: 0 on success.
  *
@@ -634,13 +663,19 @@ static int __qcom_scm_pas_init_image(u32 peripheral, dma_addr_t mdata_phys,
  * qcom_scm_pas_metadata_release() by the caller.
  */
 int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
-			    struct qcom_scm_pas_metadata *ctx)
+			    struct qcom_scm_pas_ctx *ctx)
 {
+	struct qcom_scm_pas_metadata *mdt_ctx;
 	struct qcom_scm_res res;
 	dma_addr_t mdata_phys;
 	void *mdata_buf;
 	int ret;
 
+	if (ctx && ctx->has_iommu) {
+		ret = qcom_scm_pas_prep_and_init_image(ctx, metadata, size);
+		return ret;
+	}
+
 	/*
 	 * During the scm call memory protection will be enabled for the meta
 	 * data blob, so make sure it's physically contiguous, 4K aligned and
@@ -663,10 +698,11 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	ret = __qcom_scm_pas_init_image(peripheral, mdata_phys, mdata_buf, size, &res);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
-	} else if (ctx) {
-		ctx->ptr = mdata_buf;
-		ctx->phys = mdata_phys;
-		ctx->size = size;
+	} else if (ctx->metadata) {
+		mdt_ctx = ctx->metadata;
+		mdt_ctx->ptr = mdata_buf;
+		mdt_ctx->addr.dma_addr = mdata_phys;
+		mdt_ctx->size = size;
 	}
 
 	return ret ? : res.result[0];
@@ -675,18 +711,27 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
 
 /**
  * qcom_scm_pas_metadata_release() - release metadata context
- * @ctx:	metadata context
+ * @ctx:	pas context
  */
-void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
+void qcom_scm_pas_metadata_release(struct qcom_scm_pas_ctx *ctx)
 {
-	if (!ctx->ptr)
+	struct qcom_scm_pas_metadata *mdt_ctx;
+
+	mdt_ctx = ctx->metadata;
+	if (!mdt_ctx->ptr)
 		return;
 
-	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
+	if (ctx->has_iommu) {
+		qcom_tzmem_free(mdt_ctx->ptr);
+		mdt_ctx->addr.phys_addr = 0;
+	} else {
+		dma_free_coherent(__scm->dev, mdt_ctx->size, mdt_ctx->ptr,
+				  mdt_ctx->addr.dma_addr);
+		mdt_ctx->addr.dma_addr = 0;
+	}
 
-	ctx->ptr = NULL;
-	ctx->phys = 0;
-	ctx->size = 0;
+	mdt_ctx->ptr = NULL;
+	mdt_ctx->size = 0;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
 
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index e376c0338576..09cada92dfd5 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -209,9 +209,9 @@ static int qcom_pas_unprepare(struct rproc *rproc)
 	 * auth_and_reset() was successful, but in other cases clean it up
 	 * here.
 	 */
-	qcom_scm_pas_metadata_release(pas->pas_ctx->metadata);
+	qcom_scm_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 
 	return 0;
 }
@@ -244,7 +244,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 
 release_dtb_metadata:
-	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
+	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 	release_firmware(pas->dtb_firmware);
 
 	return ret;
@@ -313,9 +313,9 @@ static int qcom_pas_start(struct rproc *rproc)
 		goto release_pas_metadata;
 	}
 
-	qcom_scm_pas_metadata_release(pas->pas_ctx->metadata);
+	qcom_scm_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
@@ -323,9 +323,9 @@ static int qcom_pas_start(struct rproc *rproc)
 	return 0;
 
 release_pas_metadata:
-	qcom_scm_pas_metadata_release(pas->pas_ctx->metadata);
+	qcom_scm_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
-		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx->metadata);
+		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 disable_px_supply:
 	if (pas->px_supply)
 		regulator_disable(pas->px_supply);
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 509ff85d9bf6..a1718db91b3e 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -240,7 +240,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
  */
 static int __qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 			       const char *fw_name, int pas_id, phys_addr_t mem_phys,
-			       struct qcom_scm_pas_metadata *ctx)
+			       struct qcom_scm_pas_ctx *ctx)
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
@@ -491,7 +491,7 @@ int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
 	int ret;
 
 	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->peripheral,
-				  ctx->mem_phys, ctx->metadata);
+				  ctx->mem_phys, ctx);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a31006fe49a9..bd3417d9c3f9 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -68,7 +68,10 @@ int qcom_scm_set_remote_state(u32 state, u32 id);
 
 struct qcom_scm_pas_metadata {
 	void *ptr;
-	dma_addr_t phys;
+	union {
+		dma_addr_t dma_addr;
+		phys_addr_t phys_addr;
+	} addr;
 	ssize_t size;
 };
 
@@ -85,8 +88,8 @@ struct qcom_scm_pas_ctx {
 void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
 			    size_t mem_size, bool save_mdt_ctx);
 int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
-			    struct qcom_scm_pas_metadata *ctx);
-void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
+			    struct qcom_scm_pas_ctx *ctx);
+void qcom_scm_pas_metadata_release(struct qcom_scm_pas_ctx *ctx);
 int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx);
 int qcom_scm_pas_auth_and_reset(u32 peripheral);
-- 
2.50.1


