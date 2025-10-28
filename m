Return-Path: <linux-media+bounces-45814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD62C14732
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC75419C4815
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAB230F94C;
	Tue, 28 Oct 2025 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KzxpnBkQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1AE30F527
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761651998; cv=none; b=uWPyig1UgmMOcFufD5pHKns4IvPjCr5zLYZf5PvVnlO7hlruWtL5Lzg42SdRdmYGdW/BkrngXrZbEfVDTf3LtR2sm9CQlrTadaVu2a/iNCTZTQuIznUjHVbHCKM7tbfSld6eKKGBiPQIB9ZeOids3C3FkZwbv75TMLOuD7TKtdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761651998; c=relaxed/simple;
	bh=Ebl4v/VkXfD1I64iutehxYEDpuSCR37dBGPipaquSZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OsdA4op960D7HZEjc0ymnTwC7fsw3rVA+5ljG21XTCpJbDErMt9XQe8cjHVGrwjAdSr7x/xxOFtHu8Rur2JTTa0o0BTId8w18X9WuAlX5E9MZ3qdhMJ7NX8bog670z1Jc3CgCOqMAarPsIFj/MlHQSuwxapnHrSHHvKhkOzOXQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KzxpnBkQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S7daFn1033044
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+e0kmPSERHqC5oqgfvQz5PD2Os0wmkHOTZ+f+cd7qww=; b=KzxpnBkQ/iPM+x6b
	JwzP6NlSbWI2LPuBEe2oIWpTt989YCxXvT/KNfMPYwjKorflEvO4IxuosrTb0U4V
	qK2hlLXsy6MqiuyEFAolwx+Z4lxUXwvSyfo/65nAfkQSiEQUL26lrqOa7CKOcczq
	lNpiq7z/HYQi+BiG7GjGEA3Tn07miY2vPcAtzYYB9osvHOa+kZZCUz62/1cBFKBj
	tdHcLil15MS1q3QGRFEwBck1zrTidt6bwNPE4qAp8ukyDCJnWnMQrX8TdcVvVtiX
	c+BcURsFQQkzy0uWWKS21aJWggGbFVVYfJoFFC6CBLbcmtva9FTLazK+vNtZB6PA
	XOldQg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2smurr3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:46:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8a89c9750so173105651cf.0
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 04:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761651994; x=1762256794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+e0kmPSERHqC5oqgfvQz5PD2Os0wmkHOTZ+f+cd7qww=;
        b=fNP1F2xd7PV3nJgCmqnAD4Td5U05oP27a5U5iZ8sTWSg0UuQJK1sFzc8w31sLfOZ7g
         KcSV6TaP2tMVFUepX9FQ3JGHtzQtin/DVN+rVWWuYoUVKR+ZYvTnm35w3NNWhNXEiU2J
         p5mGWRKWKquMIsLvUnPORZ6AIv4QcowbfIPc87EJ/iSIrb+RmBX8SJOJB+9XtxSHQbdD
         mIYzppe0PKfrLDS15uph3gE7SyQAAgfraxpYDwDQkCv0TxEuYCEME+Eo/PQRwVPkEDKT
         ivwnYdSXJGcVUX6WV/RHtrL3sScg6L0HJCZLrx9khyIP3PIdWMsCgDOhVThM+arg8xwT
         cBbg==
X-Gm-Message-State: AOJu0YzYZjvBSwR60CjhEmz9cRXj9onvM9cj+nU0FlneI6t/JaQNuXfD
	XOpHuH/Acs2iGSbLcsh2gaqWdHJBShRZLTg6tt0yufJ8tqJ33JZU0wq6hZjnZ48V4X6DhzNOopD
	QnXoe7rb87TCuT65KlgDIa/wjaCSnjduxJdmQYHcDTDNyrnocMg3KuBAnyOHZSrF/8A==
X-Gm-Gg: ASbGncuhMZr/H30Ni5Yg7d1/bcjvlrHuGiHQG/dFfsOIo75LvMAuX2TzjCsxr6E2uw9
	6gcql0RhH+3qssplLuILWTFOajJ4kppNlGsnIF49EllE/DhDfWW6NEUpdb1jWDx+8PdB0U+ggzO
	WDD4Rv22/NTrmbyOo0aZXimvUJthXhLiOhBtmCEOFCguoEqaScK+Y0wGtW4PumN78SBE545PxH3
	VzOpYa+g9+ejP+f9kTjoN6ck9qP0u2fcc0KCt2poCKXR1PhnZFi7C2ECtBkpMNEzqAS0utnXTF9
	wf5xYfkeKYOt5UQ6pQOBQ17/HSrtkeRcDbSqGpAo/FeiKlOuCEBYnlSdmqfbpHew4aZUjRxQUcj
	Gd68H9azHEYudPOIVwB+//MOngOLKJaAbQlPZ6gfVdzxz3y9r4ba8fzr3pjuINCGWUxakhkxXUw
	FSkOBXOJV1et0n
X-Received: by 2002:a05:622a:1983:b0:4ec:ee5f:e057 with SMTP id d75a77b69052e-4ed075ead8cmr44032221cf.67.1761651994318;
        Tue, 28 Oct 2025 04:46:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPdyep33zieqq9ymIFf1QeHam3SMWH00VNYbqjTxTd6ngmg/6fH8ql3fHc8hhslsjfAg+zVA==
X-Received: by 2002:a05:622a:1983:b0:4ec:ee5f:e057 with SMTP id d75a77b69052e-4ed075ead8cmr44031881cf.67.1761651993830;
        Tue, 28 Oct 2025 04:46:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41ce8sm3096564e87.6.2025.10.28.04.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:46:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 13:46:24 +0200
Subject: [PATCH v6 5/6] media: iris: rename sm8250 platform file to gen1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-iris-sc7280-v6-5-48b1ea9169f6@oss.qualcomm.com>
References: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
In-Reply-To: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ebl4v/VkXfD1I64iutehxYEDpuSCR37dBGPipaquSZg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpAK0RSJzPitVU8mSgc9I6m3hvDaUuZVbfkOsLv
 4v1jiD5uMyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQCtEQAKCRCLPIo+Aiko
 1SXRCACLSs2lpfLAOajSrrl0O0GLKc5qXCKdJ4cIxGnRirHlcx8FMtLp9wGjwR8jbLNXFrmOpFH
 bhTkztGCJl1xMmgm5sj6m9gZCRs1m3WZsXCfJ75Up2dDYuWMSPJTKu7bRA6GyUd046jmP4Tmiax
 tEB7zwZH3ts6gL7oDpMp/IyWs4NZG79RA0xF2uxAKIYlmscq8cBB1ambr4oFuN/NwVWQ1dlpVxI
 gMWvuHSut86efnZso+rMtM0eFiMGH5gfzeegYleLCiX7n8bNhAUIqVB3enkqsJdqnk7aJpfxTXR
 kJWy1IMMDHZhvhqPibTZfy1vUJDPCxo/xp9haZd4T3fZAnlK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: hQYC9ZWfTZ63Rhw3dtPmhLwJz75co0ot
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA5OSBTYWx0ZWRfX/g2yCSfixaa7
 fk0MUVFPfaPIwJK5QLa4Kr8On5V0KOq2ml6MXD2t74VzHwCeCjIQj2Ozayihsmy/C5F98hezisf
 itmDG0whCMSUd7ag94gHNKDzDrE2dXucBBVa54L0dR/tGStyQlMAXf3FgZd1dqM5YdwsusIGJ9N
 j8swDnwHKtfaQ8WlC/PgeD8hUW/rG88MDcvJ3DOJbq3b7+n8T6kNYLzeSK5zOuMQCT5SdV1aJJC
 V8CwN15gn9ILM/gulqXoKS9hy4YtkdtEfAewdRcsKAM9Q3/kJLxqX5XJwA4N3nKhvOXgSbOov8j
 qgi7czluJIeftnS0O1Cy3U74Fccq3h/+suo0wd4kODy3amErNOtCGmdOnWV3nNcuEWagQPEPhIM
 w0ixHxFDJyTA+pDk2SIZxlRSFqRsvQ==
X-Authority-Analysis: v=2.4 cv=IcCKmGqa c=1 sm=1 tr=0 ts=6900ad1a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=OYuIXoeRUKmE5Kzn4ZAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: hQYC9ZWfTZ63Rhw3dtPmhLwJz75co0ot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280099

In preparation to adding more Gen1 platforms, which will share a
significant amount of data, rename the SM8250 platform file to
iris_platform_gen1.c.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile                               | 2 +-
 .../platform/qcom/iris/{iris_platform_sm8250.c => iris_platform_gen1.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 13270cd6d899852dded675b33d37f5919b81ccba..fad3be044e5fe783db697a592b4f09de4d42d0d2 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -26,7 +26,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_common.o \
 
 ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
-qcom-iris-objs += iris_platform_sm8250.o
+qcom-iris-objs += iris_platform_gen1.o
 endif
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
similarity index 100%
rename from drivers/media/platform/qcom/iris/iris_platform_sm8250.c
rename to drivers/media/platform/qcom/iris/iris_platform_gen1.c

-- 
2.47.3


