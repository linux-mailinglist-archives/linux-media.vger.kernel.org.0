Return-Path: <linux-media+bounces-50540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D31E0D18151
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 11:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1384A3043A53
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F8038E121;
	Tue, 13 Jan 2026 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTiCQOIa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ff20RlVg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A445A38BDBC
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300119; cv=none; b=OdKX7CGrHEFPIx9YgIUrd35bbSg5nYbhEzaDmagbhMUI6gs13UrL7jELyLQVvkqWaksLou5ZJ0EfypfrKKXO0SosX/AZHhqGxhX92ddmGMLdaA4Txgcf8v0xHvYpxNbW/+oL5g8RDSaJ0PXbu+Rw4ilqYKI7o5Fwk7n5R+DioIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300119; c=relaxed/simple;
	bh=LIsn9wAsUR9DXAPysQrnc2VIUa2E1adY86k+iToDgWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uPV9ByrGVQdF/iUJ4M2nxmpv9L6IAGqo/oaNYlnoDnfrn/abFYDaGabs9ybkrXkxU1oHa43PFjOSK6VHVpvmlZm5I5jQPMqk87AdoewNX4IQwONjyXDO2Kvt+JFLCEH/cClOwNuLkSiLABqfqulESrRz1x7iDiwdsCkZZvy0qD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CTiCQOIa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ff20RlVg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DA5t723799113
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nOhwxkO7Vf7CPnCeNuoW1TJzRu1a5VwgL0q/UpJoSrk=; b=CTiCQOIa2VAwnyTS
	i7gkqhCjfL0PoZgByKVQj9jucyxzVLRuxfxNLcHQmUb1/kI+kYSGgME4oKA+oXfd
	CIBLiLIUE1RAc0wF4LvRPt7qJfxMqtf+UeKXVsfHZfHkKd61RpENeQPs/ncYiPYM
	ks34/MAWu0NvXO+ucYTjPHL/mhR5RPZ99mXSeYv9agHnNLIzjFzV2YmShW8HZiu4
	g18ZjzJUBN6XJaLmbL/ie7JZwGWc+79dlWtmYTlWENayGR0Pa5Gt9nnVXF8ijGtq
	XL474Ju6amkMxix/Dbqm/Jf8eY2U51/3IuttoZqF2qwgX7vgCQfCO+aknIFtOBwA
	bjS1qw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnm0dr2cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:28:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b0530846d3so6567875eec.0
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 02:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768300114; x=1768904914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOhwxkO7Vf7CPnCeNuoW1TJzRu1a5VwgL0q/UpJoSrk=;
        b=Ff20RlVg7WXjyWdMq8El2sZX/BKXGm2Tr4NYUhrI9GWFziVu73u7Q54H4/VSlLZHY0
         XOj/Q5/NfDNFRSoHXK88F/uxyXBcCfIxSc2pQCaDkcmNb2cQ4h0FlHQdG8D2+Ac6ArP/
         E+Saz7fJokQbiV5cAVndOjGZHLdMtyZNXNqdrsE4vrKYwOMIMeptdwrXs0viUeAtLxqb
         0ZfIASfyz01/ttdgMO6g0rccCExBwVvfT55DHx2SVO7RY+dcPiqshznV+uR/X73FeL1O
         ZxvVV6NkYnfxNMD9OgjHagFsHcoWjgEhrQWv6/wdA6bhj2vqsmvdVIj/RETaNGQCKLdZ
         ASxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300114; x=1768904914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nOhwxkO7Vf7CPnCeNuoW1TJzRu1a5VwgL0q/UpJoSrk=;
        b=THEu10z3jd1CFvof9XDy6160PApFSjyw3weJyVBNi7IlT7ym6nEvfKZ6yTK9C57erS
         wwbaVzd81T6Pj2iGUR6fM8eb7oGDKa7NV7dxhGAH1H41M0XEXP3TQVMYG69MXtdTSljz
         CE0DTKv7dnzt8ak+JVV+5Re/qEatr2GtrtPg97PKUJmz5dkc3/yo2glFshXGjD33s4CH
         vwa3wSGeTZvRZTEWuv7vzyxRSoLoadeSY/yR6rtA3POjsvCrVrEZZ7aixKAKmdfhzaHo
         LkWJ+faLBnezEIz3a+SWhcwXYJNGBKYCYCEIS2k7RJAUE1RCk3CgVELVT5qB3DoNDENy
         Ki1g==
X-Forwarded-Encrypted: i=1; AJvYcCVWKAZzLF03vuDgsC+A/uE5/EPTWukl8M9SjdNkvvD9RnPubzKxUljjnpzAeYjFadPIlwTiiOCs16xo4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywowp/Jbz0mC1mym2Uv9q3dUXOB58i9zzvZkfjF9989G0Fra7uc
	culXno8RTNAEgfrrYg9EnzexHgE8Kn2Kb5WM+VHJQz0L/ODVv2FhNl3PdmgntZCSHvVZNTdkYSl
	HsMJuOo/k383Hrfn+DSGHQ8Gqlt5r+s4o2lQRNHUmA66hkyw8BBjCRS+ikoc3ZzAMIg==
X-Gm-Gg: AY/fxX7yOUzlCKbosmxiSUge9r2rIocLdayXSjmmivKrjtw0siLlhMVdcIhNPvzwFgJ
	a/KqoGX99YRl5cRqPaWZAc37zTueuHFttV6wjQg4B2d3xFL3K2BiQl1LNtgq8ltmukARcWFPqCW
	SIRROey9svmPX9eDWr+PQJhidQcAUy/mckPUpjm2GKz8huONGh8PhDUEYu+/0vBdkyKjZnzmWin
	rGKsoKpjWskwfr1z7gJAeORK7MUaVPEkeKa4v9uCgZP2VSPnUo9lUrDPQ47iYllfC+puSca+KSj
	VtU+OKJ+pjwM0IJeA+Y/qy1GZGVVFVSE0CMt8sIaeoNdwkqk8hgsQgtwZTVMSoFV6nigdXR9+7a
	MuHuGHUQB88P/uHvFQZ1446Ncpu3awlqkjh+VphLoKF3besrVIG0eYCHYrCGaMw4g
X-Received: by 2002:a05:7022:786:b0:119:e56b:989b with SMTP id a92af1059eb24-121f8af8169mr20021475c88.2.1768300113858;
        Tue, 13 Jan 2026 02:28:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEShs0zhCLm/kgqMsw9xCUfX3GmYXqVOEA5jmVr85gGlImSdXSl0GindBcyX4iMCxB6olINw==
X-Received: by 2002:a05:7022:786:b0:119:e56b:989b with SMTP id a92af1059eb24-121f8af8169mr20021446c88.2.1768300113321;
        Tue, 13 Jan 2026 02:28:33 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f23b798asm21162429c88.0.2026.01.13.02.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:28:32 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 02:28:29 -0800
Subject: [PATCH v2 3/5] media: qcom: camss: csiphy: Add support for v2.3.0
 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-sm8750-camss-v2-3-e5487b98eada@oss.qualcomm.com>
References: <20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com>
In-Reply-To: <20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=BYXVE7t2 c=1 sm=1 tr=0 ts=69661e52 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UiSUrLz6K6kVaq6zp58A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: aNRH3ejld5pY-AhM-LbTL7mP-_dHZFuL
X-Proofpoint-GUID: aNRH3ejld5pY-AhM-LbTL7mP-_dHZFuL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4OCBTYWx0ZWRfX3emsz1GRnkoc
 n6AT6Qp1hxhKVo97Hpca+835CHQ9++7p7n2hm+KiG6hF5+9MtoiPtMx+qFp6u0NDJPod0uFC2nn
 bjifElSwvbqdM19GlwvAUgfzpzB1oSDEHZsEpOk9SNPGrP6hmf1BZlldrF2wZgyEfILa/fkmLY5
 GoI5RluYJgEPVRcJiW8eNjY2cIcoCXOd2Q3P2wVX2kGWphq11LofhrP4fd8DenTAuXf9r5HsiSa
 yoXTC3gsPCc799P76eoxfoyfLpqIofUnXxlg/OiQVIg2+/715ao8KfoQO/Vy608vRnU/41oZffq
 QSI53iTbS+SJzkE+t/6IckkN5eXi05OT02LaIb0sp4P3rrgROpETrNgm5RGGUut4KVp2yCCZvEB
 CaPEOu1kswoMJAOcuji8mN3sZiIPrdEbcbTSmIh+SssBuPOFGeVPOIghJuZKtgj5w24CvLj0JWj
 JzdeVtdQfw4E/lDRpew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130088

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
index bea8c927a2e3..1c95102a72da 100644
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
@@ -1134,6 +1134,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
@@ -1250,7 +1251,9 @@ static int csiphy_init(struct csiphy_device *csiphy)
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
index 56f20daeca3e..1f9a91178002 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4066,6 +4066,129 @@ static const struct resources_icc icc_res_sa8775p[] = {
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
@@ -5504,7 +5627,9 @@ static const struct camss_resources sm8650_resources = {
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


