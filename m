Return-Path: <linux-media+bounces-38973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF288B1CAAF
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 19:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 764B318C4C7F
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 17:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D26429CB49;
	Wed,  6 Aug 2025 17:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fFeiiefY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF97B29B8D9
	for <linux-media@vger.kernel.org>; Wed,  6 Aug 2025 17:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754501163; cv=none; b=Uz8gBKB1akQTJCAELY1Y8xxyJljEut6qSfk9RwYqZDYbP/igrL/s+qDwK78SePe78lSr/PaJ0IFx5Om6hR0wuy+V671W5dxQ4yH/Zp8MR8IUSIvYz2m66ImGt5tiwOIylNgIo646e8OK3FRLQaQ9guEvGV9i1U1wiP4+AUHQN2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754501163; c=relaxed/simple;
	bh=/1A3AZW8hBz+ePcaAFDA5TXb4qWtbB8oRxr6QzIn/VU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rp4Ay9b+Bv2e5bfcvsi7wS/Xa58O1Eb2WlNdKg004QHFhE4172wmn83kAo0Nb4KOX7uPIVx21tCf5QU77soVZTfMDCw6xjXrtAekIfsNM3yVWAif4bdhUUdqpCAtQKJ2lv92xKPi39+pKafRyzceu0+3vgvkT2oSCbBZ3f68m/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fFeiiefY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576Dugks019336
	for <linux-media@vger.kernel.org>; Wed, 6 Aug 2025 17:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J0kwO+XKJcI
	CduSLZe6gBnukQxiZjQuG4QBPhp437sQ=; b=fFeiiefY0RsI7pQ1xUM5u4gvUfC
	83C+d83g5mv7YxoOeChfwb8U6FcoCHJAajZKntZMZ/PEFXGNfIOvgTvFJgsI3vdp
	dflKyRh3LP9tA3V70uHXknA1qzw8Fsgw54FLafJmjFjOHgUP75PrM1STzDQF8/kY
	OZHTfvNtcJyd7gZ540hzsA6pOabNTPUMZjpSUQaQVIyXsQdIdWT1/woQMSVwhWre
	xsHW5Sy22MVuZYK2e4XdU0EIsSzISkDNHmw9YjvN7s78wC2mQDXqmAVvl9qbMQro
	U4dEAzfeQl2TDcxZSEJyjNQvNpj0gfVti2l3cWlI0Y/KtEyLCkdsnPLfWqA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy6uh78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 17:25:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76bcf2cac36so196076b3a.0
        for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 10:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754501158; x=1755105958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0kwO+XKJcICduSLZe6gBnukQxiZjQuG4QBPhp437sQ=;
        b=ZtQ8kCAk1wWSJtL+Vjl3KNTk0BBIaQwmSK8tt8rhn4QWWw5TuYw1tRF6B1UNeBWpfl
         RbqQR6/zDjfWGoBjmwv4ADJ4aKGva0+UQVlCKUidcy4nsfENk9bzSHFIIJ0S6HGkApJg
         A1+b1hSYbbR9WyVnjsxN2Xl4ODfvCD0+oMkYEZheIuEwuk+VIhQOvkBz5Y7afkt7VF3t
         EMLXXKWTsyrYrpZ12pzj1DNcCU7v3NV2X3qBMEju5qGfyGscHGaJtTubyvRwmNtvDK53
         0Q0G14FiMu94DVducJjVWFGJMF43mL1JwiMihJgRWdwqcEltqiDNv/4f1H3DMISH33LZ
         qysg==
X-Forwarded-Encrypted: i=1; AJvYcCVmZdZ8VItrfq5qSalvEftQidmpsHcwzVlp1Hr518C4i//GNP5oVL6ZkTnTCkw1JhAgm64S/ziAHttJ2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq9n/p5YCPEx+fyqWYXBUZ2PJV8mSucUM2y2oX5WzZ4UvZNbDn
	TyaRr4e+GLxOySFkMLz1jCAbrIsbMt5XWzuE4sGKDa8t161XMyQ6UM0VpqwDoRMOAOlizNztpZi
	7f5RfnAZyplu4VqscJWkwiKS0OQcDTB5QBKA3JQ9rdhVajgv3WCD8Xn/S9wmSkASvgA==
X-Gm-Gg: ASbGncung5v73sxjfb4I1/+Q4DRaYxqcaxP4i+L8rQrBYo7FSZ5DEvcWn7KqgPYt6o1
	TTKbSGBBgBHU6tGxLxkRBWq0OjxCDL7i9eA9hGN7QVFUGy6dIhb7b9cVOai8kwV+ivmtAn0GNpr
	CjXwmd+qI68u1V2hyJ2mMk+qT9tKBe4n9iwSj8jUwQKeXJgvb7G11jaemAidKzk97aQX9RUYlc7
	S6RoVtUc31bV0zaTqEnI9EYedIJlBx2bHUCWyF03sDPytKlaEy3UaLh8RjpvjauM2QMc7ydP0c9
	s4//ThKAOcYWWbeU+0V7LtsJraZPi7C58Aj+0PGRoFJ2ibrlW69WaEvAc0t/5+hdupU=
X-Received: by 2002:a05:6a21:3282:b0:240:66:bfbf with SMTP id adf61e73a8af0-24033169926mr4584788637.32.1754501158252;
        Wed, 06 Aug 2025 10:25:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWT5d2tLsPvTIuVLyXkccfQ0kLVQTUDC6+FpAxVXSC8J88CHJa3SlQ4HRxGVe5A5eMdXLUqg==
X-Received: by 2002:a05:6a21:3282:b0:240:66:bfbf with SMTP id adf61e73a8af0-24033169926mr4584732637.32.1754501157738;
        Wed, 06 Aug 2025 10:25:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f417sm15866210b3a.44.2025.08.06.10.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 10:25:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/4] soc: qcom: mdt_loader: Remove unused parameter
Date: Wed,  6 Aug 2025 22:55:29 +0530
Message-ID: <20250806172531.1865088-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8MNKc8n9sG-ka2Jav8J2QzmybzSYKAfe
X-Proofpoint-GUID: 8MNKc8n9sG-ka2Jav8J2QzmybzSYKAfe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX0Z0364GOtbH9
 zuioUX8Dv+d4xdS/zFxR0jaYSYMEZ/iinRHasFHtMVlFfqFNvtsGg4CLaiOjlo6qG2dH6Ju+R62
 GHvwH+mFWula8ESyRq/j1PJ8k5W8+J9n/5s/Excaai09xrGZX8EP8plKiLNpZNO69uk6Xjhmncg
 2bp/Ek577xqulsiwD1i5JrlL2CZMfIgWMeadUjJr/M3F3tCgMCpbSzVWUQa16a4obUeGPfqSu16
 qbMQbIEANNVwFx211V5Ho/Ly8JCNClwNrKeQ7KPjA7NJVyYQ0Z97RqeU5trNANGxDsS5pWVhxbw
 FIzFxHyRjtyyKrNmoebPqUnG8OfO0UZqGTxNdRcvpYJk4sChHmkencUqKEGe73MPs2u6Yvyx6YB
 AhcDQkYo
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=68939027 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=qLU0tmo_xPokh9XVZMUA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009

commit f4e526ff7e38e ("soc: qcom: mdt_loader: Extract PAS
 operations") move pas specific code from __qcom_mdt_load()
to a separate function qcom_mdt_pas_init() after which the
pas_init variable became unused in __qcom_mdt_load().

Remove pas_init argument from __qcom_mdt_load().

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - Added R-b tag and its order in the series.

 drivers/soc/qcom/mdt_loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 2a14ba9b0fb6..63af3e97c93b 100644
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


