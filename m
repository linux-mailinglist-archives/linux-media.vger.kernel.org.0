Return-Path: <linux-media+bounces-51095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 752E8D3BF91
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 07:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B8A474FA92C
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 06:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF172389468;
	Tue, 20 Jan 2026 06:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfZyAO43";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TfbAbJdQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6D337A49B
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 06:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768891401; cv=none; b=mUf4qAejPd1kRuX3Sb6uwJWU/BT1Go2Z5AD2LJDGQmJG0AndmWh2BcztDMcUC3Sh9CZj7X9Hc+Fhn+1duZlWQX0b7lQ4oBHUZnl0GATo8+RKFbvTedl9jatsr53O0CB5NikxWbgi1vZmH+/FfQNoC528S26ZFy3jzgvLIrrGbKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768891401; c=relaxed/simple;
	bh=jsOwb+B7K7FZCCxlNQxrJlUg3vB/VV4uHdzNfSRGhWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=adpsxWlUfyEmikFTLOiQh+Ejxi0YjZdjkQfcyUAS5Nc+LZHQSf3DHUxC4TB18t6T6GsLAiuXh5p3A4sKHjd32d+UIf/Ewit556UlUI3WFBxrGfSg5L1YibfddHwcbZNtTpjCstp29FnyB8DzNLD6nlzUcOmWzYIilBwE+1PQA2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfZyAO43; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TfbAbJdQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K5uBwB1905335
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 06:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dRNqRld3lGsF4aYevT7/zEHLhoj3+AVXmXvtLLinTAc=; b=DfZyAO43gl2nPnTq
	SBwP2sjHNLbq9WmPeJZtnVLk+oUqrJMEke4pqyBTUW6aujvWy1KyxsPjx1+k7hAs
	yIwbmQtimzEYjcb0nGVrfRIwCV+pDHW+wAF1jiSMY3/fKwY1c34N7cp6eBoGLP7b
	pXnN1tfwKC6mAPotNukIizLFqhhkZsuJ76Ffyiat/xQEUR0X79TKU4c6zsFr/7iz
	BBuqnYYoiNTOoxzXQAo+I3e8gjT51/9VVBlNYQvW5nLlAMQCZraD/JKg/ikOW1Xo
	iSgbt2BwZ12kxKPNTvs+9Y1QO3qXI5ThGMe1hsfw8qX0AWDSNbjQeyAUKDSSn3JM
	soO0LQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgmubb35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 06:43:04 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-123377038f9so914784c88.0
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 22:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768891383; x=1769496183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRNqRld3lGsF4aYevT7/zEHLhoj3+AVXmXvtLLinTAc=;
        b=TfbAbJdQr9s3pywrf5dlCtgq30HA4xohEZtqsm+0YnO9dXD2AthEYer/5rvnIoJ1gy
         XMJyhTrtjb1gm1j5HWHVZVV+ah+YP95YMYlGJOfI1WwF7dYWnxbXqPfh3ER6+NktrNPY
         Pv88NrXlzu+MrrbOhacKiw8VhlG1UAhrEB/9LGHjDWguNhvZ2NMbYq9KaTToNiZQhS44
         y96WhCZLhXkXxjJxp/t52EJg/i9tfqMHk+RhwS6hSNa7FRrVfMGoGnfFZN2CBnuz/5Wl
         BugEzpm6loPyyNt3DKpUXI9wKjOT/j68iYMdaieK4+qhZ9u6EAvGD7qQimHR4SPVqVRN
         pl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768891383; x=1769496183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dRNqRld3lGsF4aYevT7/zEHLhoj3+AVXmXvtLLinTAc=;
        b=HZedV08ra53CarzJphGB2MTVc0ZR+gKIe+mZMxnBLKpqNvyLjadceNGa4xa1i7tAr4
         JMs4MnSfs++P2oy9jLBg6p89FrIUVb08vIuJZdKKrrrbeEl40kOqEVJFH3kkRD9MxJru
         EHdjbYCD8Vvk3LDUyWvVQgJ92Z4S0a0lXEQYfYhe9rDtG3IEAM+vrwVluossv4eHw3Q1
         b1NQ/Do/TyqJyMf0LSF6jwZ3hJB3M1Ov66DyDZ1GsAhFvDr4A40oK2SF8ApS9gisrkuZ
         YLmidxMBV6RA49nTk4i5AuJLQV/xVLjH7Rdfx2DT55ZLJfyI4/irhCqwJEGgINCUYknI
         ONfw==
X-Forwarded-Encrypted: i=1; AJvYcCVsRUDeJUSOZtnRHpo63uvICyCpDINey45VCDrmjP17V6msHPxSB50E8YbV8kbaKFALsQ55vOhgZlcnDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+GSC/dww4mEMH4rIoLtLljV8DD2pk9oFmIhD3mYVTtvP/OF6x
	0VnqqZfJAyCMAnmiAOFOjpV8M/QKkdc9s30Iy1b9IfZ2IYU66WBiTsC5NHP3EsX5onBjNqb3IpA
	V3Xd61xjV/1v1jqd59/XVSbdjQyDAPnltQFFIUJdrBOOYHCY16OGbg2ZJIyEsHNP2Jv7V0KB11G
	lh
X-Gm-Gg: AY/fxX7DXHFfAGWCd6RF28LXqPeQ1V6j34D+ruyLIg/DgFg3yzuwVuu7DlVzyi3pneI
	9wAj45/IRNayJLQh4OyQUulB9GvJvbgPZSomG5roWBxRoWsk4SD0k8nrr61BIUCyf+ZKWa5O49C
	Y8toNQo9j/xku6QRz+JfIy+u4JEYKBr7PtY22u8xJnEEZI2h/cYTU1avJyUX7FslkY26uKABarM
	aaYGE6KCPH7pqeN95nhkIZ09iwtSxasUpC6ocRDG6jyt+zHsXLWh12JMFUpK01++Z8D7T5qCXPp
	XoN1vQy4c3Y85EK0QE4D9vwk/VyEljqFP5cajWQaOvsThqZgHRf1EfLahsaqR49um6fVjggFC0K
	4skox1dKxp6yGUoY0AVUQsqIe9O0nbeGCTh3IWKvW3aD4EQ0+ENzQpqLn+yGhCCpJ
X-Received: by 2002:a05:7022:458c:b0:11b:88a7:e1ac with SMTP id a92af1059eb24-1246aa8951emr690873c88.19.1768891383415;
        Mon, 19 Jan 2026 22:43:03 -0800 (PST)
X-Received: by 2002:a05:7022:458c:b0:11b:88a7:e1ac with SMTP id a92af1059eb24-1246aa8951emr690856c88.19.1768891382922;
        Mon, 19 Jan 2026 22:43:02 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm19128658c88.7.2026.01.19.22.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:43:02 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 22:42:53 -0800
Subject: [PATCH RESEND v2 3/5] media: qcom: camss: csiphy: Add support for
 v2.3.0 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-add-support-for-camss-on-sm8750-v2-3-3e06583a0a81@oss.qualcomm.com>
References: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
In-Reply-To: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA1NCBTYWx0ZWRfX0CQRZtzg7qhX
 Zk+qRvfK+7az5/IL2XeZTyFuC8q/dkSfvzerUEWJXuJdkM7IGoxlBXNQVNwmeECwNbUjNPNbvJZ
 v/vC0EL0NjwhshskfTSQ+6JX1h5so/t+3ZZUGsy/wCkeOmk/Rb+X79IWVkiDrfrxeEsHBRkxluu
 L/Bx1B+uSVeQnpsyZinMXI/v/oR3sFGnzug4kDlmjCVXe4Jybz8/Nows64dw3KBgNr0f1ZmFmgc
 5CJpY+rU4/FDK5tSrHCrJQ5Jm+/e38UAFhSNjkStZPDGFM0yTgQtLOJgpE02gaQ9ZDXPITLh9zu
 38BI4WsCmG+LUx8cWhJGWwb79CldOeoy3ZJt5sFAkdiL9p9H3zvLyu6lrDNkJzKi6KSXZ5eHPO2
 NJiTrTF09HpYW3rJae1eo7w5A/pqvk5XGVjXz26hKF1BjFHxxxlWqxymSCASgNzDlhIMxLV42l1
 80r6GgM4WqMTXkoG/8w==
X-Authority-Analysis: v=2.4 cv=Is4Tsb/g c=1 sm=1 tr=0 ts=696f23f8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UiSUrLz6K6kVaq6zp58A:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: uVkKf3QSN5LrRVRyDVywv6JBk5LHhOED
X-Proofpoint-GUID: uVkKf3QSN5LrRVRyDVywv6JBk5LHhOED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200054

Add more detailed resource information for CSIPHY devices in the camss
driver along with the support for v2.3.0 in the 2 phase CSIPHY driver
that is responsible for the PHY lane register configuration, module
reset and interrupt handling.

Additionally, generalize the struct name for the lane configuration that
had been added for Kaanapali and use it for SM8750 as well as they share
the settings.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   5 +-
 drivers/media/platform/qcom/camss/camss.c          | 125 +++++++++++++++++++++
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index c51ffcd93ce1..5b633786314a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -684,7 +684,7 @@ csiphy_lane_regs lane_regs_sm8650[] = {
 	{0x0c10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
-/* 3nm 2PH v 2.4.0 2p5Gbps 4 lane DPHY mode */
+/* 3nm 2PH v 2.3.0/2.4.0 2p5Gbps 4 lane DPHY mode */
 static const struct
 csiphy_lane_regs lane_regs_2_4_0[] = {
 	/* LN 0 */
@@ -1135,6 +1135,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
@@ -1252,7 +1253,9 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sa8775p[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
 		break;
+	case CAMSS_8750:
 	case CAMSS_KAANAPALI:
+		/* CSPHY v2.4.0 is backward compatible with v2.3.0 settings */
 		regs->lane_regs = &lane_regs_2_4_0[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_2_4_0);
 		regs->offset = 0x1000;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 0b524b615a94..e27e12c08443 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4248,6 +4248,129 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_8750[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy0-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy0-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy0", "csiphy0_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy1-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy1-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy1", "csiphy1_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy2-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy2-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy2", "csiphy2_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy3-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy3-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy3", "csiphy3_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy4-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy4-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy4", "csiphy4_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" },
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY5 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy5-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy5-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy5", "csiphy5_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy5" },
+		.interrupt = { "csiphy5" },
+		.csiphy = {
+			.id = 5,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+};
+
 static const struct resources_icc icc_res_sm8750[] = {
 	{
 		.name = "cam_ahb",
@@ -5687,7 +5810,9 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources sm8750_resources = {
 	.version = CAMSS_8750,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_8750,
 	.icc_res = icc_res_sm8750,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8750),
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 };
 

-- 
2.34.1


