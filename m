Return-Path: <linux-media+bounces-31121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B47A9E043
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 09:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFAF7177891
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 07:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80142472BC;
	Sun, 27 Apr 2025 07:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gdcoivVj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A292512FE;
	Sun, 27 Apr 2025 07:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745737390; cv=none; b=T2zhIyBz52aIqN3nuggEzETVa1LQI2rpWe71ZLhy/EwGrwpdt7B+fznq+VyZEKCME/QFH9BlPxLp9gNLq3/qvQiQqxUNYvLaJoDbsfk2DkcYcGvqQjl+YemIbnltls6cvYw4mBbuVDQlyW2C6WTk71JWdA5tac0VM7BfGOoSMCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745737390; c=relaxed/simple;
	bh=Zl0kk73UM/9g7+BaU8Ffj9NTc01PTvJB3y4i1MGIghw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JdEdugAzy7IQWsDihSyS+4IOo6m23YCAeklOf2A78FaKLr8Z1Eh7nDkkIRb/Vd4+Q2ePWkWxKYhL30JhRRSYPBW4Kgrs6YD7pv5E4FtFoI1cgDPcJW9yNOOObdMjVmQ7pwAwk8Wsocnf393oFl7V+ZNbh2TLVFH2M+k8qkNoMUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gdcoivVj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53QN01GN009775;
	Sun, 27 Apr 2025 07:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ok688CuA3LWCCtorEyK9rhImHomuiRyOyYZcGPLCTzU=; b=gdcoivVj9XrvvAIV
	5cNdLqtG7DdJu5hyokBeOBvIMWN3lkubTdWqyp+CMq3GqYv5vXyNMrt+l0oR9mpm
	4RDvRQpQFs4LV3lf/b/whOrC00OUOuvbD/M9a4bfxbwJtHTYvzX7HfxaAAuW6/Xm
	6NYHb2GQxvj+7m6VzVydcbSJ4x0uXzdvu87IfZg3N1crmv+EzkAqpFkSdYj69WjT
	RPAKnA6u2ysfHoo9c1qHyT9HHpI/hzP2NQoemOOXViSf893Y1dbyA28sWd9Wre4F
	vralFFMrK3sy1cQT8+l63mlAcQ8JOn82REHqn2GP6XupsO+VqlP0yQ98RzTdvpjz
	v0QtSw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevba6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 07:02:56 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53R72tqb012325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 07:02:55 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 27 Apr 2025 00:02:49 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Suresh
 Vankadara" <quic_svankada@quicinc.com>
Subject: [PATCH RFC/WIP v2 8/9] media: qcom: camss: Add support for VFE 690
Date: Sun, 27 Apr 2025 12:31:34 +0530
Message-ID: <20250427070135.884623-9-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
References: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4f1mp7B7h_cUyryWEd66jEAOu7I020d-
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=680dd6a0 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=0AdmA4Ab7mTEdPd1OvoA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4f1mp7B7h_cUyryWEd66jEAOu7I020d-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDA1NSBTYWx0ZWRfX1/B19JDke+3g LyhNQWZhO9/fBa7IWZ4TfSMitFS9nB6hbRL8t9gp8hg6EBvtkJjxcHkIPs4/5Gj1YwcY4IU7qcw ZLU+Y5F2/7/V75n9ej3pAmTk6Bz+WhPPCrvRnxYTSnsw/QqPXKWTgY9T+kXb2MBvmXcw7QAtHpc
 xiYy7BWn6DVtQJD4nOKhBUQ25OyAqMJp3ZgO+JxACYV7xvfQmMgh7TC7brtKttDqyfkdfxz3/8J p/qKj37zbLDIveN9Wc9rIEFHXXKUmLeAYskknqRYzYDM+sg9bEcwE//2kZ26wB1YId4xXIhhq2f E896u3nbvWhSY4qRQfxB5rEEtMgHWBHOX6K7yN0SVpwHVuSqzOQOHHFA3ArM1pa8Q6lcxHAbOkd
 9KnkzYTfx2IgJ668lXf61xawk8nzGM8tL8TN9ikq0t5Ug00I34hPm/eBgOzmysTFEbHExeli
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504270055

Add support for VFE found on SA8775P (Titan 690). This VFE is
different from vfe 780 w.r.t few register offsets.
It supports two full and five lite VFE.

Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c |   5 +-
 drivers/media/platform/qcom/camss/camss.c     | 189 ++++++++++++++++++
 2 files changed, 193 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 4bca6c3abaff..99cbe09343f2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -346,6 +346,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8280XP:
 	case CAMSS_845:
 	case CAMSS_8550:
+	case CAMSS_8775P:
 	case CAMSS_X1E80100:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
@@ -910,7 +911,8 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
 
 	return (!strcmp(clock->name, vfe_name) ||
 		!strcmp(clock->name, vfe_lite_name) ||
-		!strcmp(clock->name, "vfe_lite"));
+		!strcmp(clock->name, "vfe_lite") ||
+		!strcmp(clock->name, "camnoc_axi"));
 }
 
 /*
@@ -1974,6 +1976,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_8280XP:
 	case CAMSS_845:
 	case CAMSS_8550:
+	case CAMSS_8775P:
 	case CAMSS_X1E80100:
 		ret = 16;
 		break;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ef7b06c9f258..763159ac39b6 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2705,6 +2705,195 @@ static const struct camss_subdev_resources csid_res_8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources vfe_res_8775p[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+
+		.clock = { "cpas_vfe0", "vfe0", "vfe0_fast_ahb",
+			   "cpas_ahb", "gcc_axi_hf", "gcc_axi_sf",
+			   "core_ahb", "cpas_fast_ahb_clk", "camnoc_axi",
+			   "icp_ahb"},
+		.clock_rate = {
+			{ 0 },
+			{ 480000000 },
+			{ 300000000, 400000000 },
+			{ 300000000, 400000000 },
+			{ 0 },
+			{ 0 },
+			{ 0, 80000000 },
+			{ 300000000, 400000000 },
+			{ 400000000 },
+			{ 0 },
+		},
+
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = false,
+			.pd_name = NULL,
+			.hw_ops = &vfe_ops_gen2,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 */
+	{
+		.regulators = {},
+
+		.clock = { "cpas_vfe1", "vfe1", "vfe1_fast_ahb",
+			   "cpas_ahb", "gcc_axi_hf", "gcc_axi_sf",
+			   "core_ahb", "cpas_fast_ahb_clk", "camnoc_axi",
+			   "icp_ahb"},
+		.clock_rate = {
+			{ 0 },
+			{ 480000000 },
+			{ 300000000, 400000000 },
+			{ 300000000, 400000000 },
+			{ 0 },
+			{ 0 },
+			{ 0, 80000000 },
+			{ 300000000, 400000000 },
+			{ 400000000 },
+			{ 0 },
+		},
+
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = false,
+			.pd_name = NULL,
+			.hw_ops = &vfe_ops_gen2,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 (lite) */
+	{
+		.regulators = {},
+
+		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 0, 0  },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+		},
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_gen2,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE3 (lite) */
+	{
+		.regulators = {},
+
+		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 0, 0  },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+		},
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_gen2,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE4 (lite) */
+	{
+		.regulators = {},
+
+		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 0, 0  },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+		},
+		.reg = { "vfe_lite2" },
+		.interrupt = { "vfe_lite2" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_gen2,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE5 (lite) */
+	{
+		.regulators = {},
+
+		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 0, 0  },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+		},
+		.reg = { "vfe_lite3" },
+		.interrupt = { "vfe_lite3" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_gen2,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE6 (lite) */
+	{
+		.regulators = {},
+
+		.clock = { "cpas_ife_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 0, 0  },
+			{ 300000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 400000000, 400000000, 400000000, 400000000 },
+			{ 480000000, 600000000, 600000000, 600000000 },
+		},
+		.reg = { "vfe_lite4" },
+		.interrupt = { "vfe_lite4" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_gen2,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
 static const struct resources_icc icc_res_sa8775p[] = {
 	{
 		.name = "ahb",
-- 
2.25.1


