Return-Path: <linux-media+bounces-39005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBB1B1D39E
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 09:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCD1C18A5B91
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 07:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7541C2517AA;
	Thu,  7 Aug 2025 07:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kq23wH5D"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E0523A98D
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 07:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754552617; cv=none; b=nYnQwED11Lc8mykrQK7tTKSmfCcjsnXKQQlc151JGZsVCl6vAxsJwIPyNYwl8BoweIYM0fvYdlGiKvIH+Bey4DNJ8cKGCGSW1nLYjEllezp1gCZBFLRfrWmKBol1vJWgKzQhSVjugwhVkvrQssGiLUSFVUxdBk3HJpoz/q2HOjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754552617; c=relaxed/simple;
	bh=RRxiBs16r7KTIHUs8Zak5jbdXnfM3F+ay1jRs1C93GE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BPXXH5tciBAFIcwuIJFMds5DNLl7QNR7EjKAfVmmaxM7h46Q0JJ0mik5DI7CHvD5wfSA/4jVG7mqlhVC3bNTWcJiP9hCsWVii2gzAIHRD7X3ye3XEVB5jhF7qjHHZ34nXhnFUKh1FbZxjYFgYyuA0XWQUdCny6iI2+T66iLQsmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kq23wH5D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5777MF1S026339
	for <linux-media@vger.kernel.org>; Thu, 7 Aug 2025 07:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IAd5Ze4vzEv
	wh8CRNYeZ2qA7tHf7jWkHfXPtXA/b2Zg=; b=kq23wH5DE2+oLegmUvtX/zF+xtk
	g/FzoL6TijTXlnE32k18k+uqSgh8GeqMAlROGd8glIE9JimOn/gvrPY6p1yT/M6c
	hvUYYjy4mKzw+PWBhlybCB5wlRK4tCqB0FCGCASdh1dyJ9cLEs6wAAtNrJ2azJPT
	SKfMOV/BLmhYZPeropj9mMsLU39N7O348ny4KPgPgyf2PN8cRiTk9ExORGz8YT64
	ueOIL8NOdJKbRwlbVIpTO626RO+4buwTgyDjSliJXBp/cbm1jPai0e721awRoUc5
	WYQjTUZUMkAhiXrnLddJIHwL6ITOAcnK7Y4a4wYDy9lIm9U/VAf+qaVK4Og==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybdmvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 07:43:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31bc3128fcso1296146a12.0
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 00:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754552614; x=1755157414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAd5Ze4vzEvwh8CRNYeZ2qA7tHf7jWkHfXPtXA/b2Zg=;
        b=bc3Gt2DOUJrBRZ07vDgxd8tfqsxJ856x9rMsgkRsEeDy61Ad9EoO/2IGKEOX7yhcGy
         tFc4C8yJW/tT1n2AmvinMyxfhFn3X9XUOpMhcbAudDovav/hTi79Zfu1HNwRG9OgjIg4
         naB3e/yMK9Hbsio4RhsQesHup+0+XQom1yBlBkPhUptCV1IptIASCbJOpFsKnwb5Ya3L
         l3Rmz63xPLRGCTLYYFC2iggurRAlSfb+mtE3ywUy5mc/N2YzeWw+7sdg/PQTF3g+iOtE
         eMC8dAjnhb1p3qK8ZX3Vz0hbkyAnHn45rj0ggs3VHnMdc6tyDLzCg35xFhlkV++8g99O
         x0cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp/5uemIvNRcKz3VwmfEYB7YrLlLcSoeGVla6eXx8zygQuLyXfVzs94qSFgnDpuYKiA01Z108tapX8Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqQB18C/yGvwEJbqli/Ir/h9hFHpOSypzyqOAN33Vyc/u5sr3Q
	N3nAuYZUhh+zXAUByghm6YbWnlDngWx3ZLeX12QFnerSH+JkN+DXcZxommeHeC2fdUVaQI+ai1c
	qfVCqIPw4TVS209gsxjg/us61GAC1zfNAv+hQCYYSuHMn1w0Kc7HZ7E2Fm/7Mg1EIfQ==
X-Gm-Gg: ASbGnctDLx34cRYHPEB8uSFkhLc2TIljOMcXcJ3Ca28L41qrq64rQWFCdf7xhcaUoTb
	07s5zomzopH2waPz3597/dubBXGeS1H0tlJrvGx99TWao7XzPSnBT5/av3PMMOIdtH/Y2/z+qKY
	Qk2I205hiYb83xViW4CbTTixFxRjhU6rrrlhWG3Fm47aNVJQHcyRyXdhPB4UXaaY4DPM+r4a+t7
	TzFTFWDJUJpcW1WWTd9EeBpkhhBiPh5C0DAPbFzaD6bKuOcCAjgc4T+afrRFobbR0MUYa1ynfjQ
	6gV7YtICUZ4eGBcoRBKx6AiVPH/JaNrCx7yKh6YROi+sU39ekYaVUXG4FdBYUV5iuzc=
X-Received: by 2002:a17:902:f68f:b0:240:3915:99d6 with SMTP id d9443c01a7336-2429f4abfd4mr86270685ad.33.1754552614133;
        Thu, 07 Aug 2025 00:43:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmQ70xW0VJBqeSlIUWMJPARL1fYQTkCAlkasjy9//oof5xTgkO6mW9mVoX4c12poiyfQ7JHg==
X-Received: by 2002:a17:902:f68f:b0:240:3915:99d6 with SMTP id d9443c01a7336-2429f4abfd4mr86270555ad.33.1754552613777;
        Thu, 07 Aug 2025 00:43:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef678dsm178166395ad.39.2025.08.07.00.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 00:43:33 -0700 (PDT)
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [Patch v3 3/3] soc: qcom: mdt_loader: Remove unused parameter
Date: Thu,  7 Aug 2025 13:13:11 +0530
Message-ID: <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
References: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXyWvDjVJ4dbdF
 i6RMHVZeNRYllR3Hk2PEarp0VFU0O5oLp3YnZDhtrrulgB3lX5ZpkuZ05C2wc1x28ZwV+ISythg
 YHDxr/ixq7y3Agz4302IguWVEUpoF5+/XDMh0H1Qfk3m5Wk6iGQItuMx7ZAHAKwG5zTIPHW1WaV
 pwV+n3YNgXMLnqQOuDnKaBK9mR60UrMfUWQs6SHCN/3dlj2VwjjOYROXIL+vqWK4KIy8CB37MDp
 19p1s4TxW1et3XcEs9woYGavNQFw7nIXloq/4cuGvrU2l7J2qi3uTVHwAK5PY01mu+Y4PguicxP
 mD3sij4DGLhAghlwXLlW18fQWx1b5yrf8YYQKg0whmFhql44gfaVXj71+MxZj/ukl4Nv9vxrjFW
 DJXLWQaM
X-Proofpoint-GUID: fq8o02xSWZc8AwNngAwuQ8mtyj2iupAz
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=68945927 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wln2f8d1oZJPYHCAfSYA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: fq8o02xSWZc8AwNngAwuQ8mtyj2iupAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

fw_name in qcom_mdt_bins_are_split() seems unused now, it may have
used in the past for logging it but due to code refactor this parameter
is unused now.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3: https://lore.kernel.org/lkml/20250806172531.1865088-4-mukesh.ojha@oss.qualcomm.com/
 - Caller of qcom_mdt_bins_are_split() was modified in 2/2 of this patch in
   earlier version, bring the change here.
 - patch order changes due to drop of one patch from earlier version.

Changes in v2:
 - made this as separate patch.

 drivers/soc/qcom/mdt_loader.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 74c415774657..7522223835f5 100644
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
@@ -353,7 +353,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	if (!mdt_header_valid(fw))
 		return -EINVAL;
 
-	is_split = qcom_mdt_bins_are_split(fw, fw_name);
+	is_split = qcom_mdt_bins_are_split(fw);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
-- 
2.50.1


