Return-Path: <linux-media+bounces-35605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2043DAE3D50
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 450D13A1E35
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA59242913;
	Mon, 23 Jun 2025 10:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ote4D8um"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4670C23E350
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 10:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675881; cv=none; b=POnMhTivO2VlsStfmSWWjOSJ3hvfNhAhDLfc085xa+1BWX5zdK6rEKvYUCueKBaofBRrxTS7RcNYE7cDlUjtU6FO7+mNGHy9qTFTFg9YuqjsYsLRApZctmNPoX7bSosMKuTNQAF4P6Bft3+W9u4beAAQ+K4Obp+3pY0zyvyciLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675881; c=relaxed/simple;
	bh=cH+A+MjcVGC/i2HYnkR3s9WU3JModY4E/GfJacde7uY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FzwL552tGlC8FyZsaohcgnlRvcaThr/6o8+SJX9S4WaO7Df4TlsHHaqN/UjImkaWg6E4B5Rvhq6F9Xxh50Xcfv4HfztAOR9Sz/ctsd2Jk1M33VFRco9Z63Poow7BQHFUrpFuhfvVvm5hGbYBzQSfbg0XzE71FRiiatEK6h6iotk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ote4D8um; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8LajT005770
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 10:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8J4xLisib0P
	UNCX7F+6K1Pljmp1lAqOEWPlHd7U8+GU=; b=Ote4D8umSziSOav4Wfcp0O++Nxx
	flvPPlzXub+bseSdeBMWp7UhdCft0dcW0alzpkBydlzWk9T6wQjggNLhi3r1C3Yu
	DRSKAw5nWF6gTxA1kUpn6w4MmW07u7TMC7vAp4In60lZzE60vfKPHE1rp/bYF0mv
	nY7O5lfUxuq/GZG60g9kPDfSdseiQMUMNzkgdN9r8qm/laa3MRhQpVEN/e/hZWj1
	BtjA4+CfMM0b8JlMUe+fKA27vZ3QUCIoGDs5hnusVXOsnIA4/cTOT+RLeX2sk7Ba
	1JP9ArWHMjn+diiYaLPiDrut+qkmNOHQBh5MexoG1vI8nmuiNqwMdRRIdQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bg8dga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 10:51:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d413a10b4cso160131685a.1
        for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 03:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675877; x=1751280677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8J4xLisib0PUNCX7F+6K1Pljmp1lAqOEWPlHd7U8+GU=;
        b=Fk1kXXfL36p+ze/Crz2zlH8zFK6V5b/800R/vU8a1MsUyZ5O91PCUS1/0IBk6zEwsG
         rU6dyhtnTK9QAjTmM0jWq7EjU1UJOr4HWHB+K0DO+H5RI9raOn9hMHDUqAt4wkfwQO2A
         kLHdp9KKovM5RweX+rTJ3pXAWU0r+Iqkm94JXg96N9IjsgLgK8uzHRFcDzon2UMoFIMB
         qI2NVhNFuKaszSI5WNxWWeTOpVcQgpre3UE2iRiwmJNdPuKgAz3wJSnnVi3RDiZhnDTd
         /usNR6CsHOInxDAOGKMs1/976KNLhxOytrSUDupgBoHCx2wFgWND6RiNAntAIZhTwUUm
         0ghw==
X-Forwarded-Encrypted: i=1; AJvYcCVnjlZbOMcB1XF83ye/GJi4qrQh5yXM+6IREWexslTOB2r0mhV4KzBYofMRHdmDifT53wiQO0v2ZUTbdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjSEd3yg4Gfi34yipSb33oB1ddKWiv9KNf/+UUnS7Xg+dIJj7/
	/VJRpZH6cg6yn3EW8NvI/42Ny5ayejed+i93qs7EY49RYjsADmZT1FdtqU7we9HFYYIE9/2hu4Y
	OtTu8DstFnXDY0UN7sOY8+VdYHXNYPrXfwOgN07Yg2SkwCfRP/WHaUsEN8Qg9I1HMJQ==
X-Gm-Gg: ASbGncux0HR1ip6fW/jO4sFcLLcdT7nkxAv3ggsbBj/Ky2dw0vFXW3Jh2JROq+VOsNS
	PGlzOcs0ef2LiBN5ojEgAbp5hjVarYK+tFOZKlqsiPTX0Gb666Iqek3Ndkc9MFBL2AUXSUKRW0l
	+aFTdHXYZlrGPClqdgHCDHidZ4H0dI/fFlyDVr+qgKOoRejgHMv0nnK6xvTm44DPxWdI/3v2eMu
	rEfCuPQBHMR9hCVN6sEcQX3DPrlpaAfkAlvy9DFI4nC3rADOJ5L1Ec6C1nn3whcT8+GjL+xmpTM
	tesIwIsiYMSIBYGeV+psU4B0RgLEfguZv9RIoA8RasQVK/TPR2gmt09NVlDGpR7S6Ne5lPAHVTk
	q
X-Received: by 2002:a05:620a:8014:b0:7c5:3cf6:7838 with SMTP id af79cd13be357-7d3f9947e23mr1940422185a.49.1750675877298;
        Mon, 23 Jun 2025 03:51:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAYc7H2G9B9LeRlYdXSdWLBowJZ1IDPdn8TvJI+9hSsq518lLZTPwLA5xkLp8gZUzH4g6NMg==
X-Received: by 2002:a05:620a:8014:b0:7c5:3cf6:7838 with SMTP id af79cd13be357-7d3f9947e23mr1940419585a.49.1750675876869;
        Mon, 23 Jun 2025 03:51:16 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45365af83easm100821835e9.25.2025.06.23.03.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:51:16 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] media: venus: core: Add qcm2290 DT compatible and resource data
Date: Mon, 23 Jun 2025 12:51:06 +0200
Message-Id: <20250623105107.3461661-5-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tMpwimarndxDe5SyFIrjeA_hANiUKwpj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NSBTYWx0ZWRfX/MDfYe+7QvAO
 MhBT5K7dZzZ6wwFy+EOvMQ2ZMGM9xTfus7Yx4LZud/BDPEjd5QzFLLgpjLAp/oDI7zC+o6+Zvwg
 ekl/Q6vAUmhZ9kXHQbuTMNAFsO026dj1zZxFM0nlWrMitCkNvg8lIvHWsc/lFnkbIhr7ESq7r9e
 ZMiq34ttO5QraKfbC2G4DOvm8QunRmnWD735KZgqW1aXr6m7SFBQucIBhriLAf36UmqaYGIIud0
 qYxeQ3hnoHJT9E42B6hMOcqc83GqyAoMcoQcNssor+4DDNleEeqvztBnkr7W0MRYpmyv/PEmcGa
 FlPKCfA12rVU7L55g150Cx+hhb/PTz1qEGQH9+4y1ckbJ/sMIUtXzqE1r2sBTGV0hkiC27ZkyNy
 czXabSUZIQmfN584l9c6rdR7ScrwpPOqg80GtN7+3HgyIF5/5wSBae5fukgwaUp9QJCetmsS
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685931a6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6h1BjrdT-BD1Ylfs7NgA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: tMpwimarndxDe5SyFIrjeA_hANiUKwpj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230065

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


