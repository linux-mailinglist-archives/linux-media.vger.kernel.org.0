Return-Path: <linux-media+bounces-36012-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82937AE9FB2
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 16:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD3D64E2603
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 14:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2A02E92CC;
	Thu, 26 Jun 2025 13:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSMeo9jt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535192E92DB
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946387; cv=none; b=snLEZimtFq03foh0fvqwlcGU6FmN+vZFVPlEbsQWU+NrRsRPoHIysIYK3Uzf5kfqLPYSOzRylkw8wF+32onewKxXN/+/PSnz9f0CfyX4yQ8XgWQ+1Reevz/G52o/b30J0CIAUTrh+cQSZ61eyVe2aRhAdZ1+7a9px2sfNor++sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946387; c=relaxed/simple;
	bh=chjuspMWXk8eI76Jp3Mq4yhHE0boTd39JW8qGPEIFpw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=thrJSQ1bEu2pLyRxWhN6nZmXACNngpzXtsKs74j0LDp3fHlGHcPAT9QacGIhyoW8lqbXhPOJX9NnzN+Bg0d6XirsVUCj4wSBkhZyTdkYZyyHnLZrfePj9SMmy+jaC1okPheNDoXmhxRTJp3Oja1YpuhUzrjGek+ENDlrH7yNWDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSMeo9jt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9l883022397
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P1Inwr+v5AJ
	OSvWCpAeDJxxnBzKcgTqyCl0dEEMlzt4=; b=PSMeo9jtVwztSE0ncTrXJ1WY4ZV
	GCWYOKqRGb2yVUn/V2NkSMchQvIO/2rHTHKBjda8NIsyEp8x0cz9aoXTWAmK26p+
	BBZjUgjuy009DRHOEn8QDc8n9E8Zs6Nfki4A+9Ym68PrlYv2plWMdGaOgqFcffhu
	0TekwIm936q79E9+859bF7zlzAZxypkP5nTGz83j6DMMNfyRfio05McBCp5wQekM
	X+U4ERSZW7/QUMyfBo2vBgvzt/eiEgGRt7mzoRzIuEWO+xx2R6aqouTtaTlWR3CL
	W3VU4wTxTgUOmcRurf+J4J1yQfDTVXeX/iT0kEDPRWGvMPBOGM5KxB0wjQw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx1txr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:59:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09bc05b77so169317185a.1
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 06:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946383; x=1751551183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1Inwr+v5AJOSvWCpAeDJxxnBzKcgTqyCl0dEEMlzt4=;
        b=jGK4CsyHMyCapsv6poY0IEzz6EhFtqOEqobBqEBZirIFsDdZ7tYWI653EmwOHa52kK
         2C9iafsrZ2QGDZZEFRpbpeic2XRB+ypkqeZRrH8ub3UdIzAwi9d9HUtCu6sV0vqWxdgo
         eP1ptopIop7zli42Jojsmblw2abObYTwk5oSfGpTEa+2NTpsdKpcLzi7Ve0Q3nRHfk53
         nSrd+hN5ssBg54bfz3ybVIjAuCDaSg9QCxTSCFvf25983uqOeHdbnIITx76Tg/s1BjEc
         JZQcJJ7F3kgFRHU8sD/HA7CuDu0oTvb7aVn2kMxQltoLtxBpBON6UpVVjLITPrismF0Q
         H+7g==
X-Forwarded-Encrypted: i=1; AJvYcCXkMSwBU50gC46uGxekr8wPTVc/2B39PheOgV+CYJ7Ufh3xV4I2LPOFVkuBaVuqawEndtpq1e1HCZaJ2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwluYw83RX9rkCP/5/OzPUNrnEhDA5zIs4SbSNQV0XcpjhNGJ2k
	vp5lm/tZvuQgT7bf2QXWl2DyKrgT17QybpdnZXSBzkYKfTu3Y0tpif1zw8ENHGfCp3kRO4xknWg
	3hvFdg05sDumCbDqnpv68G27NkQxzEiZfqzZ3/D0MOQYql9ewJVGKDxyl6pVtjLiBTw==
X-Gm-Gg: ASbGncttmQmxGgHsCzZ7ijyRzmEgdovvV+OlzJYZZJ6viokI8suNxZVf1CydbjiSmCv
	ACidTIYRm0hJvra9h3894ypOk1HEF4QInfoo+LkSgAavUv00fpkNQwLuREVhgnrQyZl/IxTpL5y
	E2OV8UgFHHBYbndVTU++iZxLODzakz5887fsIlOMmZRxi+pnhojjjtkrAHbUfN1BQjtZl6cnW8h
	rEBqZAZ7KxAvN+tuR9+LcMyJqLVDXHCjtQtmpjjG8a7WNQMJz+AMwlVYPt7Nor7FEBAh/PR8/oX
	22N9oXMlZTs++GJFcC4BDSyr0wjR2BjiJ6BrZQxlIAAgNc1A7YpE1tHAeAdNhEyBuOv4Qf8zSlD
	s
X-Received: by 2002:a05:620a:4153:b0:7c5:6a35:81c1 with SMTP id af79cd13be357-7d42974b38fmr1137982585a.48.1750946383357;
        Thu, 26 Jun 2025 06:59:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF3lEab+MhnjBuMmiLUDuDSZ0Flwzk3O0Rv44A3LR/pbAhVimij8UTmYIC2fFRlCNqjiINkg==
X-Received: by 2002:a05:620a:4153:b0:7c5:6a35:81c1 with SMTP id af79cd13be357-7d42974b38fmr1137978485a.48.1750946382927;
        Thu, 26 Jun 2025 06:59:42 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c57d7sm53723365e9.40.2025.06.26.06.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 06:59:42 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/5] media: venus: core: Add qcm2290 DT compatible and resource data
Date: Thu, 26 Jun 2025 15:59:30 +0200
Message-Id: <20250626135931.700937-5-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Fk_johXI55ZS9bhcApNl-7umi-9SxK1u
X-Proofpoint-ORIG-GUID: Fk_johXI55ZS9bhcApNl-7umi-9SxK1u
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685d5250 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6h1BjrdT-BD1Ylfs7NgA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDExOCBTYWx0ZWRfX04uziiv/Ivhb
 6o5Xp97gO0qvF2MYTDYlHqPlFyHjSABhbQpKNyb8zZMtIuBU75xKQnq/wyBUnlqR86rgx/AngNA
 pzgptOv+Iry9+PqJewG7HschsPxZ8B+CzLmKko8O4Gyyb7RiBNqJiPeny8TaA6fb14BGaVo2fvo
 EVVKM7K7iCUBDev0eeg3XsBWawYF74ZuauoEO6zqvgNbSq6un9qxdKjf8olhX2ONz6CMfB4HI7F
 I0xxLISZspMnAacIp1NepskLI/heRLH3gI6WyNvHk25HhUAxNcudXVOe8uKHHIQ260/HjHciwSA
 s37tSVQGDCMOjojmTyrm7kotfo3GnIuMbFuNXycChgF+dZkSTds8VlD+bUxAYKoc+x/uVt6hB/G
 pjdAXOjAd4VDtJ4Xt8emLwI932V4lIEesA2NhcB15eJgzntzycDl6wH0jDUAqcTTeG+KUCZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260118

Add a qcm2290 compatible binding to the venus core.

Video encoding support is not exposed until the relevant hardware
capabilities are enabled.

Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
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


