Return-Path: <linux-media+bounces-50587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AD5D1A7CE
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 18:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78D3C304DDB7
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 16:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374E73933E7;
	Tue, 13 Jan 2026 16:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNuur/qt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QfXIHsZi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3235C350291
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323468; cv=none; b=n42d8NkaA55ndOU9UsPStKkFV7m1aq81+/fX3f/GVIWqNjzKQVAwOPPdmYm4xRwWojZ0g+qVgu4GvtfAj2PXdsdFzyIBVYI2/teXAhr0C1+lsCkcFCn9gsHOCM/hJYbbjizMNt7Whr1UPEJ9I5RfK2T2wUpgxk4GE6DLY63GbvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323468; c=relaxed/simple;
	bh=FQ3Xn2inLRRi3XEzsW+334edjBagx6YVFOZWSWxe7Hw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EyNsTe/akcqAu/dGO4WObV+GkfFjyvSTI1cipOpDv52HLc+ygnwLpLDowdrdUd8Avh/FpRAwuKT+QO7hMEyx5V/r9bNUToVn0NVrIOUL9DgWhsZj6Sl2vZ003Ah1gUlmhJSRfnOtvZZvFN/IYlSiPKcfqfxXVL2mIS/f9kVKpP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZNuur/qt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QfXIHsZi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DGr6aW026765
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7qfeZuNCMKyWjmLYciPdmW1fc6fwfC/7fosDwvplVK4=; b=ZNuur/qtVvLzMr+v
	XjNCee7HM10Vuh12hmEZcOK3HZp1xKLvdbeT6SsrAS+hgEiVW9WzRBjeh9VhDWVC
	Ti07r6PtcRH2lztn7CwnrtcQN625MnjlzixXdVXxp/ltELpDQppGzVQy2MtB5MXE
	5HirBRKrpe166TRMyOZ+z2ZQ/yJOVyfpGFGntgx5sAo2oE+NcedU53SXNUWVPYYi
	KgPEPgO31NsEAWUuTddgwDVQFMnlZ7KdxiDkPQ7sZjuu/vHf7LaPNE5Dl7WEeRVG
	hKcCBEiF7K0n9AK5emSEsXlpnozlBc8lOQeJuj3vBiHor7eHMEpYSQlVajzNcoLx
	R2xQzg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnsyb80ew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52f07fbd0so32064585a.2
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 08:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323463; x=1768928263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qfeZuNCMKyWjmLYciPdmW1fc6fwfC/7fosDwvplVK4=;
        b=QfXIHsZizSaokI9ewrkb6YwdR7QuZJKXbUw+CeY3GQnKYBjYe44e0YKhHg/7J/VSSJ
         QT9kqUTdwWaUpmRocqS7I71m1vs63+dhJBkfH+vZsg4WI5BfFWTl5wWHKlRKhqIDe/Ni
         vmE9w0MzHeXFFGBBGxJtEVyIVHXLgULslMHybdOfKCSsQyKLIRDuEkz+dE1xn9Pag1Ar
         7JD2EWb8Qdprv81GSNRCIIYP6/3P3p9avWZr57vUBzO01grkHpbX2yuQkVan0wtVXx+r
         3Oq7YtMMlq0eWOHw4AXN6GoHfa2T/7hZly2c4k3MaRvdxSGBj2PxfRuHGrRYv9oh4bDF
         /E6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323463; x=1768928263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7qfeZuNCMKyWjmLYciPdmW1fc6fwfC/7fosDwvplVK4=;
        b=adwLJdJ2tU72CXyq3RGn16gdkTS6v4yvrt7A8GrqD3yeg7awV23gJMGzqciJDOUFP8
         FdXKmv99UjkFhpLrIV078qyDBRa+oymPZupgSb98KV41An3waxE5BVCdxzncADcCOxbo
         Tdbs4uDvIIAiNdg/BZ0zP6Px8EX9xcV+huCTGr1CNvMsfQBaZLqp0UrDZvPdDXorTs5i
         xMdAqEjLCbJQ0oUIIMihxhxwclrX+dwJnh+vtWt456fplQlqPQoy/r7VAO8T6XGCS8Na
         7lMJAv2/YzX2F3s+9ioDKQYcsfTXiwHx1IQHDURH51Q4uVkIBq9lCvoO0HccWGhT9MP0
         d4bw==
X-Forwarded-Encrypted: i=1; AJvYcCWzsi4xA6AMde9y8HMO6qsZ+WR54vIATsg2gv8yzZgOlllA9Yne1Gy1mYVA9PYsTl7Sfi0jEU0vfkc8Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzENDyhh9Mk0tedpZuK2lBGiS9ohm+o0QOzb55mKD+GcYXb+Q5f
	ZJ9lDj08ju+jaSlYAs5pKND7rcCVdvmM0Rwzyg3A7AIGMGgRUyjpC4udIsbKNf0m0p/N8f+h86F
	TAHG6g0lwWSN5lQA6vCkTwSURfvhEbuNA6KVoSsl0BZ6OwZJupgBV3QmLyiPOPVLzShNniSrF7A
	==
X-Gm-Gg: AY/fxX7Bt0xXkynVkNpfl5oUd3Thbv9CE1/J8uuMZQt38hfXO1Ee7tMNC6cijka445i
	ZT0jRF5XeqPYIh97xsZtS9UhCNaOoMjZHHVHZNkJJkIRx3FzGgGjU7yUEnidCtQqgXOCnVzKrea
	5LeN/8mF3dJsImA/q8CzXp27JRCD/0dGIMBWtYZzCBx83GEcen7J8YD2ANWuNve+gL2li0K8QLC
	dP4ia5JV/lNcyPet4SXLisraCnblAJckNYVFPIF/8WPReWm3+Ii2FjeyJax00U1eMDMp5nvNviY
	WUUsaRXI3+b/xyCG109l/QCa7mTKR5nR6TIxE2ShwgNuv/e0jGFCdOAfsuYUjuR/orM2Qfrdacq
	U7dP4fkcH8UEXU28WWhxDXc+diS/CqWw+lbXID7+mhXGyBUZzGwDkYb5l1oX4/+j+wguUP7EDwK
	wTCxC8LV9I0B6S6/XTIa2MSus=
X-Received: by 2002:a05:620a:522f:b0:8c5:2bcc:fbd4 with SMTP id af79cd13be357-8c52bccff0emr141437485a.53.1768323462834;
        Tue, 13 Jan 2026 08:57:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAyNsrk5Z2AIsgj/nQvBJ4uUGWq1+bsfUTTPz0/uGeCx1jrAMbGLWAwnxIuqCW9E2DAXzDfg==
X-Received: by 2002:a05:620a:522f:b0:8c5:2bcc:fbd4 with SMTP id af79cd13be357-8c52bccff0emr141434485a.53.1768323462365;
        Tue, 13 Jan 2026 08:57:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:25 +0200
Subject: [PATCH v2 10/11] drm/msm/mdss: use new helper to set min_acc
 length
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-10-4346a6ef07a9@oss.qualcomm.com>
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
        linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FQ3Xn2inLRRi3XEzsW+334edjBagx6YVFOZWSWxe7Hw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnl0PTE5OHFGoICxjRO7KNmDeBBGHDOeA6HsO
 GiBE9zODjWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5dAAKCRCLPIo+Aiko
 1fQAB/9voiIS7ZX04MxzzN0Dm1inK5aUdGgfXovuk/BA3B31X7AP8OTxtGaenMVPoXAqZlevNxE
 ZPdBKvVUsIXKrEDJgGtVVPPYHDImICP9S5GNbC6hyyIh10Re0xb3nsXr/zYqTg4Kq5diERZq2zf
 AIjWLSnFI8dy+V5BN53UE1t/dZ8MMBPt1xjQtqusy1GPJrErOfdB2kaNp0pppcuxOGpm7oYDmfD
 a8MAvz59mqXgE2SVaJmpbJct8XUFaxL8cU0M8WLgswAs8VmS/sLJBc7nWIxkYlApd1cYoDRqtPd
 Jk+n52B/7fIhtfBXiVRRA4p7i8fc6PRtP0oFEi1McOQBuzdR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: FEy0XIstb_gtwDCdCOrVf3O8RLQbzdrW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX3FjaOlo1b4ml
 qTwqPenUeoy9C7fgR+b9CS5LmJXPnl2bPUUSDkphehPtEwBsnuEe3M5sk6Erq64Wk8B3tQL5t8L
 BEBTkh7athCxA2wRTzNA9AhkqKYWOkNxp/hLmrQgwfgJFY5GRAIQt8Jh++DIi0JtpaRzZW1Aryy
 Bh+/AUU2cfy6ibHIlSu2wdRECOP4AFUjbbYU8xeyrpn/z8ZIhwlyNQSNRQ5sKElw5G1nnAxoX63
 Ew36WyY9W5xvM0/i6BEUWIuvPfKNkoxr71Ae1adJIJdi6wd9V9+Jss2+wUNu6wBfsY7Lgzx4Zb0
 LwsUfQvxW8xQTTUhG6WdRZtdFAyek5sjk2y9+CG2QI5MtdCcXTWk3iF4H7MxGEyX3WYxbWJROdf
 Q66O8gL2sPVJKi8lp6vVIRykU+1dJtn1tS3HnjwPkojY/JSEggmoXyHDdJ3tiTtgZVPdbW+JpYy
 6fPGX6f4hHfPrEp+ghA==
X-Proofpoint-GUID: FEy0XIstb_gtwDCdCOrVf3O8RLQbzdrW
X-Authority-Analysis: v=2.4 cv=IpETsb/g c=1 sm=1 tr=0 ts=69667987 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=X-e67srwgh_QgMMAbO4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..da266753df69 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -175,8 +175,7 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -193,8 +192,7 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 	if (data->ubwc_enc_version == UBWC_3_0)
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }

-- 
2.47.3


