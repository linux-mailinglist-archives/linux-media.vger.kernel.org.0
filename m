Return-Path: <linux-media+bounces-35578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A90CAE376C
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 09:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEBB27A919F
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 07:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747DB2222CA;
	Mon, 23 Jun 2025 07:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muVQYezh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EF721FF58
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 07:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665003; cv=none; b=CxkNqAusi+/6lIUA1I7n0cBn/LFgf1JkpuaI+HGJreXbr0eoeO+7vThiYqwN59iBWIwlOVxnD4VGj/w8DAMAuRlMyY1YKFignTLiomZzNeXy1FE3m8oRW8V6DNWBBzM8uiB3Ox8JizshFozSgN1zK89bGqKMHfhx6CCek3x/8NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665003; c=relaxed/simple;
	bh=cH+A+MjcVGC/i2HYnkR3s9WU3JModY4E/GfJacde7uY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tpo5M3uyBuCe/WzUTP0jucKBQk9Lck8T/fePF3oRBEiBYV9YBedmpfjDqH+VPVQVdlNHw26rA4I63eGXyWZ+YRS2DaNeBIR0oamr3oKyYYJptYXeFyvNEEGtkfpTHy7KbgIc90/fL3u3hBVm6kgLA5Xu8Qpzn9FEu/eNiHpx1qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muVQYezh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MNF4mb027634
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 07:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8J4xLisib0P
	UNCX7F+6K1Pljmp1lAqOEWPlHd7U8+GU=; b=muVQYezhMoadTJs6WisDWTZD9gi
	jogcEItcj7Vi0F5tUZjspsf+zhPwoYNit2GBWJR4zBGWOtfZwowjADHkehOw8tos
	VTiWl6CIUkriJXH43Bvmzovc22wyFbN6ZBX56KDy2FAybdKREUA7EzYp1YEwLKw1
	I0YtfQEt0IY6sLtruhYTZyt5xdfHjB6KRWA2GCuHWCyZY7oR+gGI80ml9jPjvRGu
	6tlByTz3/qhkV+LeeIOS0Y2z1i8Jl6QlqNwlno7VEOagLT9hBoTupIvJr9WdkDqM
	jabScxQPYTPkWDQ2phpoHsywQei1mSDhayCuzkqNUkbJrgYJpTSpsljUi7g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eccdhx7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 07:49:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d400a4d4f2so433325285a.3
        for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 00:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664999; x=1751269799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8J4xLisib0PUNCX7F+6K1Pljmp1lAqOEWPlHd7U8+GU=;
        b=GwUF598p5iAFbmsaxkUrC/OwJ66BO5daxoZNMk7xJ6rc8BfVHYMJEY5FwEPfxRgIat
         zTID+k+dCDBS31r32c15iaYrE6RQheC0q7svtILmZE7/nUZ+VN0/LmSwJZCmJTtwMOcu
         QNRARZFSaEUpCEjBgcY068bSiaRf/iGB2EqXN2A5OQcoU2OXhz7X3p3H9lauzfyiQ1O5
         L9rC5XmJPslkvipmGLeNZcNSpeCqcrHV2zvqZW0OkEWUvr1Nxu1200v2ygq/fJSJfcF3
         zPVf+U6t1DagkzeCmBcNSubphC3X4P6I866D9dElwxlxnxHHf2etQgCyNnxT6yx8u0Py
         FuVw==
X-Forwarded-Encrypted: i=1; AJvYcCVIZjWxPRBCvJj8PsVlWj9SvjQugN6flZw3FKemOLiWlxpCaMEyW6hZprRsF+dP7z80OqvhxcFh0cA5oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzopqAWwqmphAuDrFTeRBbXULtfEjch/0yaXM6u+cF7cgzXQixq
	cizzfrPB2cCgcABBCOSQRXkIKprRCH8UvKqHCfwuaKzoxSLGtERFDWx6+IidHDrnXn4PxGmeXNu
	0xu0+CIHMVlYZbl4tEtaW7Tj5/HZ77QDTTotH8WYI15lj2ChkpVIpgImQ4N1RZUkktw==
X-Gm-Gg: ASbGnctasxGwmlMZDn0eThhpmM7wqZr+WAEYqGTIFH2mktxzHnEZC4nLHNMVrpQvMoV
	qReiWQWzeusIDyuJcTBlv86SMSKJA1oqCpUJmGsA26jVgm073r/U2rAM6XLqf/2lEp8SpmlAhyE
	XnMA8TjeZDB02JqwNTvzvb4eMqKEHPdkL6CvMsSkeAPC4gzl10+0OeaD02zwnmYOehWqM4K3+zN
	9sPmc0VFIl3RD3q9ffxPoFbQj3kEfxQozW8qW8W9/bJYc6s2DtAAjSmMZg85urwJHtDr0sV8EHc
	RnjZww2FjxOTYcBd7BcNAQ2pKEgqQClxNf5IDn3tDXgPT5r8MLWGSYlfJkJ2oHDCcsftg+CjIrk
	s
X-Received: by 2002:a05:620a:4403:b0:7d3:a52a:125 with SMTP id af79cd13be357-7d3f9923f0cmr1477814485a.26.1750664998687;
        Mon, 23 Jun 2025 00:49:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGGPyNOllQk9/Q2F0cGH3t0SOxPclBqyGCztEZ0NQrWXoprecRp0lVRoYZaMH2VHLGHf53KA==
X-Received: by 2002:a05:620a:4403:b0:7d3:a52a:125 with SMTP id af79cd13be357-7d3f9923f0cmr1477812985a.26.1750664998238;
        Mon, 23 Jun 2025 00:49:58 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f17ac7sm8755313f8f.23.2025.06.23.00.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:49:57 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] media: venus: core: Add qcm2290 DT compatible and resource data
Date: Mon, 23 Jun 2025 09:49:39 +0200
Message-Id: <20250623074940.3445115-5-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623074940.3445115-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250623074940.3445115-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LOVmQIW9 c=1 sm=1 tr=0 ts=68590727 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6h1BjrdT-BD1Ylfs7NgA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: XEUfRFics65Orp2sbTVoiHHvsSnAswh-
X-Proofpoint-ORIG-GUID: XEUfRFics65Orp2sbTVoiHHvsSnAswh-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0NSBTYWx0ZWRfXwHvLGRQAHAYB
 AzCWj8CYYVjgBfwlCAvNcLOe/KCItuGpl//iqhtlmuAn3E6IVCm1dJcQmKH9ymkBu5G0goZifac
 uDn9jlVTsoVB1WJUVLKmkQjnw3T1GgmyALw2jVNOVkJhKppjxvNuxP8hPeKYjFT1qmtg8on8qkn
 6wVVPE06K+a3GOmfIU9ZHfkQCZKolX+ethnyXuH1vX5dygi1WPb/ECT0MBRn8iC1BMjR9zRmGg2
 0aDN+PgQ4MeMU4rK/jSms2z93xtJubee2HJvdCQ4Q1QxRvvWpADYbbT+l5Lz2eC8XvSZ2KH/gQq
 UzKh1jTO5g76WG5Xo/FtRivD2u94gXJRtavEE/u2EgLBtzCRq5iny3RXzVh8AR2gtrwvuraazAw
 fipnpKP9CZXkBZXANdUxMCPRt4Y/LybHpm1ErC59+kEkZQThfhCtXDJHHOpFhPlJBjgDTFiy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230045

Add a qcm2290 compatible binding to the venus core.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 736ef53d988d..81fcda8fb4a1 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1062,6 +1062,45 @@ static const struct venus_resources sc7280_res = {
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
+	.enc_nodename = "video-encoder",
+};
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
@@ -1072,6 +1111,7 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
-- 
2.34.1


