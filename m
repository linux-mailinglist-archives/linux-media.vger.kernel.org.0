Return-Path: <linux-media+bounces-50581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BACD1A76D
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 17:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E18663012A42
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 16:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6314734EF13;
	Tue, 13 Jan 2026 16:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="THaJ2Hv1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PshAsRyT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362EC34EF17
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323453; cv=none; b=rx1Djh88ZQBYAox+25DKYacdJ06rKkFLESV+CF1647uF5ipz15rMJ50sv6hT+hbuHg3X3JaYuA3ct+UKQPw8GX/jChuFxZhUF3cXZkecON1kbrjq39tJqmpQXrSsiP9viUX8QESR0DczsraDxsAjambxd3yZUovIBQtwhZqI2Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323453; c=relaxed/simple;
	bh=e0V98OiixpaDzO7JJw0Cyt2lkwpGU1Z/ZtgdjEfcF2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lk+mwxX9HXzewXVEJVSUUWQTD8SKs7xZRMtRzhic7zRDEK0Va6bce9MYinu511RyOwClsxvUsdmuFKRx/wGd0melzDWyAP3n8LkQcsifWdTrAICf3VcKEVPN0lmfvHFalkhZ5Pn5V8R3P+MJm0K9PfwHzv1fjiFmHMUvjpxk/ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=THaJ2Hv1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PshAsRyT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DDsXBH2071301
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gwJ/St2+Ayz3u0f8yManVcQBuDHM/IGJ+FC35JXt+Dg=; b=THaJ2Hv14JAK5di5
	8JTVl4OO9A5vNPDfRnovYa2UWCWNEDE8pfBhK8k6PnzI4V4C2dmDQ+q2U5dso8kr
	Ze8d8MCM5aYDh91Otihi4WQKM/MiiADDRPyQuH+rajxTV9bttIhAOcb60BVy2lht
	EJpKU+wp1KKmOezALKZJSdh2zbzOk4tyASujOFlL3jCSi6AX1kiO+nAazp+1ZoaF
	4CMnej8nGDZQRatGPm8fN2hTx98xn88u/olgoQvVxMLA9WoRXzXJ2bzACshVVjjV
	2a6cPN+Hvo5+5fhB+jvL8AwrgD2/UKGWGY+DGZVSOGm2yYYrJg8DTVKCmkTkxvh3
	hS2HYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnqbm8ncg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c277fe676eso2296473485a.0
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 08:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323450; x=1768928250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwJ/St2+Ayz3u0f8yManVcQBuDHM/IGJ+FC35JXt+Dg=;
        b=PshAsRyTCsgk6BG4dy0OrOtqs0wX5PcZW+UAwdWncW9n8kEOJ7S/Vvo41ptJ4DZxDN
         R2QA73JwOtUpXmaohmYTRM5BfQWi2eukuwh+CnsJnFFIBgyb0YZh6s6TgjXU5mNIVHG5
         zo9kn4lQROH0KMylV442fLMyjRA1r3HEy+cvbi9cQDe5cCEe/gdbSJICPEh+9qUNdUcV
         ewkrBKjaKaO2OcrwatXBCzuHXQ1zZKpLSk4wbVFDgOG+tBTdcc2Ybl6sx8of+laiTmvk
         WPhH4Ozpj0T+8UTmo6NbYvFgv0YsiUG7AquaEkk4Zz2mry6W/CfZNVK/VKStR/lgZf18
         8MWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323450; x=1768928250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gwJ/St2+Ayz3u0f8yManVcQBuDHM/IGJ+FC35JXt+Dg=;
        b=KHHKjV3LGCciussacRswYbwTfJzr1tFUmmu8XawyliUzXx/1rBVIIpnXLOPWBaFAFM
         S3NSCb88B+mf/ggloDxmL181+DlGTdPYIyJiiubmEC351hFiHFW8P2thR+K5UCOH1D4X
         oTFHjZ7L1EKMZqqynb3ydCy+7k55afpSE3doTdvamVNYD0aOacYZ1k+mwBd0ZfKPu0ZJ
         Z193WCwcHsiWjdOCZ/bGK/Q5rWlkB+Td8i3KQo80k/09ljQgEC4brSfXjIsv3uqiRP5m
         EJABVQArI3tij298lKt2V6NpDICIJtO56RGHAaH1vOQiodtFV4e2nNcY2AbKfZrIuJ/P
         Rqjw==
X-Forwarded-Encrypted: i=1; AJvYcCWXfal0GmTWhLPYUKYZI6yjmskf62812jOREjEWuSNXUED/tWv1BdJ1/yCtp8q1uumwXxAHvB22jfwYvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMYB4fCvbybBYGGs3srfqO2F0mBfTxB5iNIXC2HJuV0y/K7JhO
	Dn7MS2myOPq7WxTSsE0b/ZVPVC8bG8C6jq7cEr/9b2dAyfGwUURh3mZzy2/NpnbIY4udSQYrv29
	DaPMPAGeaJC3kLWRk7+gSWMMudHfRGV8zVYV/oSUUtYAWGdmnENDubMsRfXWr/ko+qQ==
X-Gm-Gg: AY/fxX5SVnr5SHpCs2hacnT/AqECkjVzpyvtM2QoExKZhVQYJLy3EEnGS2S21eBRN6R
	00Y4oi+GpwHVcuHHbtCl/9w8Aj1MMRCfxUCFMFH5qeNaVU3bVaohtqX29NSQ2+GLv9KawHpChxN
	AaGFsaRSLu8ND92GVc9SbyXE41B7JpWFZ3DgpbfDUwTM3jsIdAtm3bZCDIgmtSddD0WIcfBPa0I
	YAasbc0n4/40pYxCjCq72gToALQKNAljvsSSOt6bkHEe1P8c3B+g1k+YqenR/hXlOuzTAB8xpl+
	xtCX7Fe6EIFI9P+Jm0wTo4HXrrOMTGnmn6phNnQlzDy9FNleGqm6ThPze2x+1Eonmj88lVFfaIl
	Abv6N4JwpBLhzpn6unRlJolYzOPtvoIJr1elJwdqOxsRnP4ERtvMGAsWSciCFpukaSwm8obTu0Z
	cNrladMvV50nImBgWPBqMJotU=
X-Received: by 2002:a05:620a:22c:b0:8c5:2bc7:ef4b with SMTP id af79cd13be357-8c52bc7f196mr145687685a.4.1768323450210;
        Tue, 13 Jan 2026 08:57:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETb/7ii8sn89Sw8DV+nF7jagzkTsPymak/SBe7T7VsY6OtDNVMWeWjvXq4VG/TaTaK4FoePA==
X-Received: by 2002:a05:620a:22c:b0:8c5:2bc7:ef4b with SMTP id af79cd13be357-8c52bc7f196mr145683785a.4.1768323449624;
        Tue, 13 Jan 2026 08:57:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:17 +0200
Subject: [PATCH v2 02/11] soc: qcom: ubwc: add helper to get min_acc length
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1191;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=e0V98OiixpaDzO7JJw0Cyt2lkwpGU1Z/ZtgdjEfcF2Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlyDVz+Wo0glM21ifTIaAQLz5zzbJ4yr5G1m
 +ccpl6RbmeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cgAKCRCLPIo+Aiko
 1SaPB/94hhSkf8Jfq26zR3Uyp0NXJas6waNJbiN+pOkZBHHRlnQxe7rQ/joj0RgjPdp9LKlQCQt
 HocVjc9oF8l2stPsKZofomcbU0siWNtQvToM4Hexmo1inJkw56+9LvCzkV3DyQxyJ6HsV5b5bas
 /TszfA+YKyCzumsLkXZeIrzRRj6Y6j9KgRoTExU3qbdpetocqYPQvZdxXVfGtrF7g35R7pd3XNV
 LQPDO/pKbScaPa6p2mdcBQyJuwBjBJRGTpui85u/vnUsbP6WmBTjxhkr398LsLkEU/DfUwRw6wI
 51kNIAw8g6l01v3BaUBdNMEF0bDUXxoyazke+ndUHonFfY8o
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: LgY6N5c-mmuBKUPyoaaribBqDhuiVuGf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfXzt57sHoBVYnH
 M/ClVJPi9vybNwKsoO2gg263nn/U8Us4f6P+ZqRf43D9SnN66XajDlxDquYtag7tVnOxYhElU9P
 eF+02rCazesQS9JnzoOo06bjr+KNUvsXp7s29SFH0xzAY5twnP01Ukib9OX3o9PwkpgT+hr1N3s
 cubNq9lg0nUOWSl2FBZZNQJ1hDE77fogJoaTq+zNDBDlnYsdGZ7bEpHDmsRyDyQacYRUPgKeF06
 qFzTrOpmqF6werLjxf9qlX6zW9+TICt18mpBoaOt017tVAZU+4Lo5M+YDVRgLLc0Ix4HW2j3Odd
 X7FCCQnXkqsjkLiRBuAukTkYqCUqCs4NQjK97UJPZBGtsKR7UqSDTFounsePN+l7TsAs5ugHU4e
 FKY5pHpVRt0+YnbfHnKm/18o/zLZ6rH5iGvIZuNRGF4ysvvIj0Hm7X60Jo7IJjV8eXGlMbCN6Zc
 qyltsOC2tfAU2y4EfMg==
X-Proofpoint-ORIG-GUID: LgY6N5c-mmuBKUPyoaaribBqDhuiVuGf
X-Authority-Analysis: v=2.4 cv=YdmwJgRf c=1 sm=1 tr=0 ts=6966797b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=iQqaBmfQ5YO45CrMvZcA:9 a=4tUkUnfIpJ8A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140

MDSS and GPU drivers use different approaches to get min_acc length.
Add helper function that can be used by all the drivers.

The helper reflects our current best guess, it blindly copies the
approach adopted by the MDSS drivers and it matches current values
selected by the GPU driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index f052e241736c..5bdeca18d54d 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -74,4 +74,14 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 	return ret;
 }
 
+/*
+ * This is the best guess, based on the MDSS driver, which worked so far.
+ */
+static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_enc_version == UBWC_1_0 &&
+		(cfg->ubwc_dec_version == UBWC_2_0 ||
+		 cfg->ubwc_dec_version == UBWC_3_0);
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3


