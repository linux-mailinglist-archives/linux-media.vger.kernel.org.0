Return-Path: <linux-media+bounces-34759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 106DAAD8F0B
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 16:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEC323A31EC
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 14:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9A02D9EC6;
	Fri, 13 Jun 2025 14:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzWy+4yJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11DA2D23A7
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823476; cv=none; b=K2CkJrGZ0Eg7two8+935ZD4TYNJRF2YOnMxkEiTUyF/LzYCc0chUQukxqKo3Of6xtPePeMlPvJ3i0NNSAXcisCTDy1Bi5ALpGF8gHjEK7QSvpdQFUJFibemZ3n6h9Q2jPp3heRpRdowFyUIgooPhnt4QIJWmW2w6BvJWv9ZXPLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823476; c=relaxed/simple;
	bh=R3NiWYA6kgddHMiBWO3ir8vpi4s+0r3d1/p6pCY92uo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RwpGPKq5zZpZc02DwsUYoDyVMtLe1Lh5b5sZzvm0uhn6cgxAiOGT/FJiMN2TUtNnjTDu1cGcrmBuq8LVCgEaOFvFp+iO8jPPxnSyN+aEU7QKnRi3Yvuuy1wztzfAuKsk/BrW8M2nxFDMWbW2i8lznE77pf5bISAuLCxWNOBrngI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzWy+4yJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9g7Fv029622
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 14:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=imWvnWvbJlX
	5oc0s6sKOCcLJcc3gmwA4+SPySO+ydLU=; b=YzWy+4yJeRfNTX8XeSouAcdGnAK
	ZrXS5ggkFYyeyAwXXTzDhxZLoWYnExFjDok5ED5s35S0U4dMbFyTgNQgDcRT7mfG
	0LAQrkbHp4cZ0IqSxE6SqDBHh3oFBhF2ZLzpGtetLq6uI017RsGaj5OK4HbI1VJF
	FYxv/tPg/tHOw6ececAec4SnCzl/CBCzm0gwGv/kr6rex7K7eS98yxdk8F9FE1pi
	TDYqrCmWKxMYZ1EsndJ/ofBXcqHa6I58LtdHhTeUfrPCc9IqlkQKth4WPRAx8qZI
	A+SMry/TNpUUp//k4OduMBukFWfWzrDd/QaRrDj5j7OFbW890kv8oows/ig==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6kp1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 14:04:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235e1d66fa6so21228435ad.0
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 07:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823473; x=1750428273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imWvnWvbJlX5oc0s6sKOCcLJcc3gmwA4+SPySO+ydLU=;
        b=vNkhiV+fa74VJEFEQe+DywijA++cHVNP/CH0F2OuX8BtYsFX7rNKJuncyatolFFKcF
         AQmzSqq5SZknfPRzsDbH/HKextJW9IR77M9QwE7hjVEWV/XSYiBrwGAy53glcT71ghyA
         dXNAk5sUtK/egY0ZU23iWoDkXYOVlJWY01sssubxoUAyW2HPCo60JbTI3SpdTouM6/tg
         wi8eYVJgKGxYB3MU8/o6SQlY1ynoLXCAI/sspH+ZllrB33+MYS3GPZtPuuSSZ5QppP8w
         f3XQxr1PHXGAfz+3K8M8XabTKWrfuVpLMqB6RF6HRpibHZYY6nb5B1V3TgK+mQgnKbqt
         QSdw==
X-Forwarded-Encrypted: i=1; AJvYcCWgar2C6Gc0+Gx4GtGbyuxN8VO/Xxyng58YkvxYQDcjlgHRH0JfpMSCznZYLeN2HwPUNQbZMJ0OH9yTpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxukr4PBOsfmUG0t0kK7ZC37jSVsw+oeGSYG30myK2XCmlf9GI5
	ADZJS/7WdspCqeZVjMs86zrOh7kTsfviJtYeNMry8NR0phpqm1nJQiitKlTkvFmDtZ2n/tc8IR0
	EJqRbNUgX1KGliFaKcFLlnOT/fteBFisc2QQwiV3IfeNRYZEoGryDdHC6R/H3Xdjdew==
X-Gm-Gg: ASbGnctgkCid8sBXgR7LfC99EpYunIl7SiABCAEJxryN7zrIT3kjVMdsJRCV3OYV6yr
	SmT0KR+3uXA0K7c/hNqvQyujsdH01fIoj8LL+Ycjt09ou/SjiFS75EaV/NzGEBMMdYqU8d/wtS6
	Hodq6HexyKceecsiN1sy4C7pWpmfjUxtvFJJW23ZGUaXy88tC12deSqTPCFgAne/QeU8a34iPjA
	c6aDwfdsq0MvhQOSfYJs/1ytSSP79NzmT10RVxYQaZmGeEjLu5Qz2Z45I/KSEjj+PmRS1uqvg9D
	VBa75JGfDeIVZg2p/JHuViQzS0VNGqEL+x2Wb/dL61MdAs4xbBNFo3W3HyfbtnaUbxbKCh5hhX5
	Z
X-Received: by 2002:a17:902:dac4:b0:223:4537:65b1 with SMTP id d9443c01a7336-2365dc34597mr46375565ad.36.1749823472171;
        Fri, 13 Jun 2025 07:04:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGokbzd2JnXLw/G0v+GhIQGYqaRbjI8iFogXgFN8uc9fiV1mee+ivB1odTvwJXOn83pvOiTng==
X-Received: by 2002:a17:902:dac4:b0:223:4537:65b1 with SMTP id d9443c01a7336-2365dc34597mr46374855ad.36.1749823471406;
        Fri, 13 Jun 2025 07:04:31 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm53503615e9.40.2025.06.13.07.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:04:30 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] media: venus: core: Add qcm2290 DT compatible and resource data
Date: Fri, 13 Jun 2025 16:04:02 +0200
Message-Id: <20250613140402.3619465-6-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMyBTYWx0ZWRfX+OAjrIa+5ZL3
 GC3zMW6Ezdqw3cVpfSeA9YwDVXDgBshB/yhKXue4ONEiXx4iHHqxCPto0lOdTPvW24ZjZIHEhnx
 AamocVkVYPOqqBcyZYXyfEaIJ0c8xsu0GdD5MvKn/EM5ajoOWd5I5n2Q0wzhv06CRpBljVNS6jM
 7K8A4cG6CRLqyG8mO3k3NcHBaHRWPS5CiLElWHBIzEbVoyjQn71iCW34LD91NusT0VLOrid4YTw
 n+0BNeNW//zqOhp648sfYrWlnlyyUSpJTVy0LuDdwhCdRPnbYOWeuW3aoh3JkWTLktbb8lEZ+rG
 E3EZDfcQftTE1mLMypRmOVauyB+sDKRKRfjBUgYfwaYYc9/WlocuB/04c+p5iWOXnYn1CpgMkJN
 pNztUw99DGe9UBLoDhsCYZx7befFVkkBh4qTXcKO3DkWli2DqHXJVNpAB2BXkj2sloHTWGFg
X-Proofpoint-GUID: PskmqVfnJNpL_GA3tfmySFbVVhqbZTK7
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=684c2ff2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5jRkx2jbz5RiTHLqnWMA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: PskmqVfnJNpL_GA3tfmySFbVVhqbZTK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130103

Add a qcm2290 compatible binding to the venus core.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 736ef53d988d..f1f211ca1ce2 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1062,6 +1062,44 @@ static const struct venus_resources sc7280_res = {
 	.enc_nodename = "video-encoder",
 };
 
+static const struct freq_tbl qcm2290_freq_table[] = {
+	{ 352800, 240000000 },	/* 1920x1088 @ 30 + 1280x720 @ 30 */
+	{ 244800, 133000000 },	/* 1920x1088 @ 30 */
+};
+
+static const struct bw_tbl qcm2290_bw_table_dec[] = {
+	{ 244800, 2128000, 0, 2128000, 0}, /* 1920x1088 @ 30 */
+};
+
+static const struct venus_resources qcm2290_res = {
+	.freq_tbl = qcm2290_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(qcm2290_freq_table),
+	.bw_tbl_dec = qcm2290_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(qcm2290_bw_table_dec),
+	.clks = { "core", "iface", "bus", "throttle" },
+	.clks_num = 4,
+	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
+	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "cx" },
+	.vcodec_num = 1,
+	.hfi_version = HFI_VERSION_6XX_LITE,
+	.vpu_version = VPU_VERSION_AR50_LITE,
+	.max_load = 352800,
+	.num_vpp_pipes = 1,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.cp_start = 0,
+	.cp_size = 0x70800000,
+	.cp_nonpixel_start = 0x1000000,
+	.cp_nonpixel_size = 0x24800000,
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/venus-6.0/venus.mbn",
+	.dec_nodename = "video-decoder",
+};
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
@@ -1072,6 +1110,7 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
-- 
2.34.1


