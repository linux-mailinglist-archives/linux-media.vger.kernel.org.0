Return-Path: <linux-media+bounces-21307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F799C56F8
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 12:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD7D61F215F3
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 11:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD6D1FA843;
	Tue, 12 Nov 2024 11:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xvh1pGRp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596341F77BF;
	Tue, 12 Nov 2024 11:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731412153; cv=none; b=ayg8q8ZL7B3l7kCghNJ/JZIas34FOEnC7pQTSUBU8l2sVC0OPbko53BdTLn9ycXhl/jHL8nkfW3Sb7AcyIgj6XG0BeCDLhuLE1iVEN5MPiHyXt6H7Too0E8iKp9s6QSKlbXCWHdWzzlon2Hqqum5vg5T6Acvwl8ZwwCPyvBfgJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731412153; c=relaxed/simple;
	bh=L5y+6FoBMfwDP8m7K2bNaPdAeIfvuJ65U28IdbYMD0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sjXGl3LAPSpwkQdi8fXDbrqeJBQ6aYNu8yTmagzoH9Dxwwl4clH4KJKDfFmmXze2ZcU4E/FTDs+pj78/RiFkO8M2Xk6aMuzJRIF4WQIGlRxWuiXjpnAhlFGjj4LgbIB9KC9bH5c346yl+akb012FSZ/vYlRnoUezfPyUfdkNgDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xvh1pGRp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC2hVhm028001;
	Tue, 12 Nov 2024 11:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DHhZykte0a7xHBxliiaIP4GsdghcPE/ydPEdQu85y/I=; b=Xvh1pGRp/40/D4Iw
	zQbO9BQAvZHUpYA++Cbr8ZssfOt4Aosgcec2Vb734PNNj3wmIsEuKPoPng//XcQX
	GF8trCe6B/hGgpWovc73Zb1fW1XAAuZdUDImLjHfLmjYzJ0Vi8RMEhIO2gAYaQ7c
	8XOGYx29XylS1hawoy6ovnlmuNVksVwo34rf5hAV4q4atz8ICn3VioQgFkdE4C6H
	KU674zZmzpwYsN8SBQrhvCx7VC8NocwfChLd4QUtZhuff2uZurAwNEZS1kACL5G7
	I7RXhEbd+a1DWfNb0KWNqU699RtOTq6gyLQgMLiuz1/6cD1iy94H4fiZg3PHuXyX
	HnqjkA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sytsq504-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 11:49:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACBn3VX020973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 11:49:03 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 03:49:00 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Tue, 12 Nov 2024 17:17:58 +0530
Subject: [PATCH v2 2/4] media: venus: core: add qcs615 platform data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241112-add-venus-for-qcs615-v2-2-e67947f957af@quicinc.com>
References: <20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com>
In-Reply-To: <20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731412132; l=2956;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=L5y+6FoBMfwDP8m7K2bNaPdAeIfvuJ65U28IdbYMD0c=;
 b=ZPUwF4oArazMtE7/APaMYzGRPqzICOZEHur+8Mg91VY6qlmrhM3pUFjo/21eX2ASv4ZEthFjw
 AbA9CvCee+tD/OoeofEHhrrM19GH/5We3TvbxlnULYKj/K9UY8USbbU
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CpkaPjWZ4UYkrxS0l8euy209IUTz81lW
X-Proofpoint-ORIG-GUID: CpkaPjWZ4UYkrxS0l8euy209IUTz81lW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120095

Initialize the platform data and enable venus driver probe of QCS615
SoC.

Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
---
 drivers/media/platform/qcom/venus/core.c | 50 ++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 423deb5e94dcb193974da23f9bd2d905bfeab2d9..39d8bcf62fe4f72674746b75994cce6cbaee94eb 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -630,6 +630,55 @@ static const struct venus_resources msm8998_res = {
 	.fwname = "qcom/venus-4.4/venus.mbn",
 };
 
+static const struct freq_tbl qcs615_freq_table[] = {
+	{ 0, 460000000 },
+	{ 0, 410000000 },
+	{ 0, 380000000 },
+	{ 0, 300000000 },
+	{ 0, 240000000 },
+	{ 0, 133333333 },
+};
+
+static const struct bw_tbl qcs615_bw_table_enc[] = {
+	{  972000,  951000, 0, 1434000, 0 },	/* 3840x2160@30 */
+	{  489600,  723000, 0,  973000, 0 },	/* 1920x1080@60 */
+	{  244800,  370000, 0,	495000, 0 },	/* 1920x1080@30 */
+};
+
+static const struct bw_tbl qcs615_bw_table_dec[] = {
+	{ 1036800, 1987000, 0, 2797000, 0 },	/* 4096x2160@30 */
+	{  489600, 1040000, 0, 1298000, 0 },	/* 1920x1080@60 */
+	{  244800,  530000, 0,  659000, 0 },	/* 1920x1080@30 */
+};
+
+static const struct venus_resources qcs615_res = {
+	.freq_tbl = qcs615_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(qcs615_freq_table),
+	.bw_tbl_enc = qcs615_bw_table_enc,
+	.bw_tbl_enc_size = ARRAY_SIZE(qcs615_bw_table_enc),
+	.bw_tbl_dec = qcs615_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(qcs615_bw_table_dec),
+	.clks = {"core", "iface", "bus" },
+	.clks_num = 3,
+	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
+	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "cx" },
+	.vcodec_num = 1,
+	.hfi_version = HFI_VERSION_4XX,
+	.vpu_version = VPU_VERSION_AR50,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xe0000000 - 1,
+	.cp_start = 0,
+	.cp_size = 0x70800000,
+	.cp_nonpixel_start = 0x1000000,
+	.cp_nonpixel_size = 0x24800000,
+	.fwname = "qcom/venus-5.4/venus_s6.mbn",
+};
+
 static const struct freq_tbl sdm660_freq_table[] = {
 	{ 979200, 518400000 },
 	{ 489600, 441600000 },
@@ -937,6 +986,7 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+	{ .compatible = "qcom,qcs615-venus", .data = &qcs615_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },

-- 
2.34.1


