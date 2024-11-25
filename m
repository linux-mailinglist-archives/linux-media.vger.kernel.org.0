Return-Path: <linux-media+bounces-21918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D034C9D7B3B
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 06:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91DBB2815BA
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 05:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6168158218;
	Mon, 25 Nov 2024 05:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OJNA84Yi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C4282866;
	Mon, 25 Nov 2024 05:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732512925; cv=none; b=loPp0I6/0vNKN/XanXoEvsb3fubm/vmijy+4OvQ8DS7c1yi3dPTPPay54xF8bU/DirufGtBnc10lDeBB7FrdVJRpnHhUlb6fdf/0jAUoialH74SlWBOXUyix3F6Xd/Rvl5Y548oA+zMJ8JgObsmPtIvfiHBDYPAECzCuehEVG0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732512925; c=relaxed/simple;
	bh=L5y+6FoBMfwDP8m7K2bNaPdAeIfvuJ65U28IdbYMD0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LQAeA+I60/EvNJOuYADjubtY9doeJby9VcrWtaSuvGZQLWfwXO5y0yFrWcEoHKAFmIyP9sWQslRYRZLNLFQLXR2w2E4OmNsVt6BtVT0u5oPqRfuFfkKarxOO61FEW8Dq3lpx8HZavpBBsDa4QxmNSsyHqMH612xntHKohs4YCq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OJNA84Yi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOMcQW8020148;
	Mon, 25 Nov 2024 05:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DHhZykte0a7xHBxliiaIP4GsdghcPE/ydPEdQu85y/I=; b=OJNA84YiSYVfoL7q
	v0ZpugKnGy4TvP1/ARXcYZN+Xl5Kto322vkUH3ul85JY+R6CYlAphP98vhI7NsXn
	d7152BrvnicGl2BZB/4UGQza7Ly1On5DpHMtZlHA6NFGM9uo5njA6qF5y+vos6oO
	UhNj8A9WPqLW8qLSne4aEkMiyhAgalofDS3jNBRBdlNFP9M/Sr7cccexBSLPdZ4c
	jKwaM6HKWnRjtjCm+WtFj9YPA3AjupAxl+QvuZGEMV1Oiocifa6DfoBxe+2VLbZS
	Un0K3ezgE9Cyl9SIsAVdNGQNtd4yO0ECwUeaEaTORAIzegW8eMq/I0slLy2KK/ao
	TKqgVA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4334dmuq9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 05:35:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP5ZHUM002405
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 05:35:17 GMT
Received: from hu-renjiang-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 24 Nov 2024 21:35:13 -0800
From: Renjiang Han <quic_renjiang@quicinc.com>
Date: Mon, 25 Nov 2024 11:04:50 +0530
Subject: [PATCH v3 2/4] media: venus: core: add qcs615 platform data
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241125-add-venus-for-qcs615-v3-2-5a376b97a68e@quicinc.com>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
In-Reply-To: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732512906; l=2956;
 i=quic_renjiang@quicinc.com; s=20241001; h=from:subject:message-id;
 bh=L5y+6FoBMfwDP8m7K2bNaPdAeIfvuJ65U28IdbYMD0c=;
 b=I58/G+aXm4pNxJSBbPkYQuFp/JosXg1FAwMJ7xSUKRgKNo94zllBZGrJ9Km5mSHseKWbueJX/
 I5D3UTdeTUuBMIetmf11bwrSppOY+zgrM/t+02gmvKJA9xSvgUskM2k
X-Developer-Key: i=quic_renjiang@quicinc.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9CgGXdD-CDB6mLtu6lR8xRcf--8XOT8q
X-Proofpoint-ORIG-GUID: 9CgGXdD-CDB6mLtu6lR8xRcf--8XOT8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411250045

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


