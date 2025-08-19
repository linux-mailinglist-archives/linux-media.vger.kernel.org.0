Return-Path: <linux-media+bounces-40303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DB7B2CA06
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 18:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C4615E8124
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 16:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B742C235B;
	Tue, 19 Aug 2025 16:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXRdml3m"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCA42C11EC
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755622529; cv=none; b=Fhl1UjlYOGjp8+nl+seJJ/BNY3kt2kGWzAV/tSN4GXrBtinPA39IWazOi1rYFp9P1PWqXtN0HzSSpWYCr54dx9gtGNrGwuoibwnMHjdg1Hi5+N9ZGlxzLyEkHpWYHRTaxGJzkNCTtsLBzPXSl3wdnl1IvE0wbY9hayGb65DzPag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755622529; c=relaxed/simple;
	bh=/AflHXTFVOH16SOW2V+0meYRbIqCERPZj2WZC7Vo8H8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJG2yiIDgBKP0n5dCm9+p7Kchp+19JiiteWNXSp9n/7zwp/jLd2LIgGu4LcQT4VEuSZWUz7MC4PevSY4VNFBm8N3KZEyP1yht3+abp02d+lJGpTGey2u9IopxS7XddxeIK1HDSfTJ8m3ODrx/NmIcuCUWCbKqhCRGJccfAoM55o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXRdml3m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JFLGSO007362
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pXVD6URM8iG
	tLYeJuDTnL3ZNXgs+m9zGa8usL8h3epI=; b=cXRdml3mbCs2lHhaZJZzWvieN84
	kUS2hI4UYd+t00HXPun/dT3q0wvOzh+VJZq5Sz4z68oWu6692DeoM6iHmvklrRvk
	3kO1lhs7ViWgxA7Tc/8A06DVdWK60h+dHVuL4iS4EVmLd7n7orD79MAnQhiq9Vea
	x8mZItrgJUcJNZo06G0lcAL8rfbWcfRdZwY4kzuyGkAAMKVwMehXWpGYZMQfcL8c
	983esjVm9Rovo/ji4enBKuQseE70aQHRkDTwV2jGVxXPg3QtFeb8XiXiB3pkMrAK
	rdh2t6kW9+ewtdHjPflu6mtlmLLbkbFSZzRHSfsZ+kIrBBC/BRbbPRx342A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48muu0ga13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 16:55:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24457f59889so58907855ad.0
        for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 09:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755622526; x=1756227326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXVD6URM8iGtLYeJuDTnL3ZNXgs+m9zGa8usL8h3epI=;
        b=DNuATG0JmDXn2bkllp9I8GMaI21ZzTsDsQVwDERSxuaTxavebkSWM72RJjdqHAtmzD
         n7s/u4CJrOhAjXECDdOL+v3C1iJ9qEnS0s2m7jxpW+vFjCqod6YJiW3hOx41yc0ZkC6g
         trAppXVXzdSED14o33/t/FVvXckdwXPzqoOyuNihPLS87FBIiuhkxN9LOoR1US7qGqV8
         ZenBc3sGjmiVTlHNQilJx3F47Yx38pCfjWhPzecz/roPL88uwD7+d7mXsWNjFq1bOYmJ
         UyCXzek2+Uu43mGEPBd9FeIpeYBGMjcg1RYb7G07sHOvSiZLcMrbL52uZVM7HppOJhQk
         3+7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPuDYCHJd/al25CYL1ki1SabjpkhSn61ijYFheJuZG4exxXga+Kd3Tn2H9Ue1880sPYJDe4BWv8/7uLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6PDBPYqzJETiGiL71PocDElWCpkNUwDA0ZsdqvxCDpv257t//
	+JeyYB6Dud8zaig1ZLSHfB49iatDVuyxj7+LWQBC2Es2WoAr9f1xbAzk3QruupxeWTZMZ4yN6Y+
	uVLRZkB12QlLKhG02BGmrBKrJDuh+Zbgbizu3YJj1xg1iI6Xd4uNOqB0r6XUA+Tm+9Q==
X-Gm-Gg: ASbGnculT+1WPKGdl4fL0vW4UtW1rrR0l7J6bvV6uo1egLjQF9Lgxm9Zj9lO4uRowsO
	BnXg7uiKhZQiRg9pR0elgWgwGWWx4AjXGd5aELmrhV0t154yGQD3Hdd6ztlPw9vPAs7Wy2j+Eg9
	WFtdiO5yfZDvcL4Uip4s0CqGRevykiO8FSX1oytGvtb6pm+yvOGo+s46VUZm9emHaQPvtTHP/Dl
	BzaQEOXRxgB0am800d0DgXGC9YfkksFwDsIeNDxq97i3QJVyOnnEmstyFdwiodlQx9+B3XId0xD
	B+3DwC3+oAoJtl85zB83wgThDR7aEwvUW30GOT8JVSq1qwPUHJXm7Db7CBO0AoLqf7U=
X-Received: by 2002:a17:903:198e:b0:240:967a:fec3 with SMTP id d9443c01a7336-245e0484a9amr41225745ad.29.1755622525688;
        Tue, 19 Aug 2025 09:55:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+lNYppywDdTFFexVwLhEK+BRHzaI9WsoHo0SSwLAnNl6dT+h/o5sN/sHh1+Wi0XAryEA6Lg==
X-Received: by 2002:a17:903:198e:b0:240:967a:fec3 with SMTP id d9443c01a7336-245e0484a9amr41225205ad.29.1755622524920;
        Tue, 19 Aug 2025 09:55:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33aa3esm2273885ad.24.2025.08.19.09.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:55:24 -0700 (PDT)
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
Subject: [PATCH v2 01/11] firmware: qcom_scm: Introduce PAS context initialization helper
Date: Tue, 19 Aug 2025 22:24:36 +0530
Message-ID: <20250819165447.4149674-2-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: khNofPLLUpzhXzEQkZ9OC8y9UpM460IB
X-Authority-Analysis: v=2.4 cv=YtYPR5YX c=1 sm=1 tr=0 ts=68a4ac7e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=3w5JJ7MTCOpz5QvkTaEA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE0MyBTYWx0ZWRfX4jQO/upVV1A8
 xi38OQT1zjygnnIV5fClK8UNQ5F4G48mG74Al8K3+z+egSzA2W0ZLOp4Vjo0mqg5J0rFYwbKVQG
 bAVG3x3N9nZ45V4l7kXO5htILjtBis4vBoQNWLiWV3dNXk0ZpHPA9w8Qb3NDDrIQabgGemO36P8
 ZUApwMoAphlWLw4+9rE2u8PRai+8b7n/oWK/p2UmhNg3wUlD6WQT2UHQ9jZ/GRZjYMYqTP7hTh5
 /qee7pHwOBimz38k1gVtEDcmplaYnGhsSMsKsZhlDoFJ5pNB+LCEPO7txdtlxbwJer8Gq/Whqln
 RhmvB4YJXPXP/au2qt/XAfFMtWocVGTbgY++yi1FCsSMEinojDXEDds3nK+KfERUA9dVIlC+PxP
 HTHzX1HY
X-Proofpoint-ORIG-GUID: khNofPLLUpzhXzEQkZ9OC8y9UpM460IB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508190143

Currently, remoteproc and non-remoteproc subsystems use different
variants of the MDT loader helper API, primarily due to the handling of
the metadata context. Remoteproc subsystems retain this context until
authentication and reset, while non-remoteproc subsystems (e.g., video,
graphics) do not require it.

Unify the metadata loading process for both remoteproc and
non-remoteproc subsystems by introducing a dedicated PAS context
initialization function.

By introducing qcom_scm_pas_ctx_init(), we can standardize the API usage
across subsystems and reduce the number of parameters passed to MDT
loader functions, improving code clarity and maintainability.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 26 ++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h | 11 +++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 96d5cf40a74c..33187d4f4aef 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -558,6 +558,32 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
 }
 
+void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
+			    size_t mem_size, bool save_mdt_ctx)
+{
+	struct qcom_scm_pas_ctx *ctx;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return NULL;
+
+	ctx->dev = dev;
+	ctx->peripheral = peripheral;
+	ctx->mem_phys = mem_phys;
+	ctx->mem_size = mem_size;
+	ctx->save_mdt_ctx = save_mdt_ctx;
+	ctx->metadata = NULL;
+
+	if (save_mdt_ctx) {
+		ctx->metadata = devm_kzalloc(dev, sizeof(*ctx->metadata), GFP_KERNEL);
+		if (!ctx->metadata)
+			return NULL;
+	}
+
+	return ctx;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a55ca771286b..b7eb206561a9 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -72,6 +72,17 @@ struct qcom_scm_pas_metadata {
 	ssize_t size;
 };
 
+struct qcom_scm_pas_ctx {
+	struct device *dev;
+	u32 peripheral;
+	phys_addr_t mem_phys;
+	size_t mem_size;
+	struct qcom_scm_pas_metadata *metadata;
+	bool save_mdt_ctx;
+};
+
+void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
+			    size_t mem_size, bool save_mdt_ctx);
 int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx);
 void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
-- 
2.50.1


