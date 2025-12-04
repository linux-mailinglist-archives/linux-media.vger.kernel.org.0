Return-Path: <linux-media+bounces-48208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 392EFCA2E68
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 10:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C8D03079E99
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 09:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D5232AAAF;
	Thu,  4 Dec 2025 09:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3FVCiU8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApMZslYY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB4E33468F
	for <linux-media@vger.kernel.org>; Thu,  4 Dec 2025 09:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839013; cv=none; b=cs72ZE4OKlCUtav4MqAbaBWwL6w/OL3UkaLHmWO+oca9/fr8WhfwY9YsSPPCPKqsLJOdh3ZWH1LQAIbJmcSSRV9vK3pbovIAShos837pUnbOM+d95Do/caP6QK3+FF+grAVFUi9qQmY8BFaWc8DNYDY5BzQRZ6LdGhvaM1jno9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839013; c=relaxed/simple;
	bh=wsc+Oe3Sx9BWvselyA5E0E9rZE33s5bP3hYuZZv4orA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lxoXB2b8OilDtuAWpRswkAgFb1JiqsHONnP7a0BWGZtjj2Sy5eHCpjdMHIiWH8a3eSEWvyoYMj78/U6rfbix8fPyTNVjEmbUwSBWYLebfobhbpqsr2hdJbKa+Ts44lUnGI95bb+2zTmyg2w5BkRN39guBXmoP7uq9axONcJeMa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3FVCiU8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApMZslYY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468eOZ551475
	for <linux-media@vger.kernel.org>; Thu, 4 Dec 2025 09:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zguyslqrcaP5wEteKasvoSc/KQMTcZmC2hc
	vKR1cr8g=; b=I3FVCiU86gA2940V1w51Zt5ZMXfvlImoQlsyNRfO99SR1IPYooO
	UeIWPboUa2O1cWQPQkLCfP9Tmhp/8DjbNRLwJIPf4Jc5vjxamUW1YwicKv6dZ+ji
	8ErQOvidcjWssZsFI5NojmI6MSasuG2nwILlEE2plihuoBY2lGU6o1RBK1M1BK0D
	9zKYwKP2BqLl4t1tSML4fkXrpg5IB0j+WUSi0Hgfr6I+hioohoLlVeIa6/t2tAtx
	VXDA4ylYEGoKEo2cPZO3dtlPcixfZ5y9VsVC8jrUMM8zHgRXnhSwlprnEh9CwquR
	Jx/BPLw3OsS57287ZdHedGSOTYTbqkbwhxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmmdbcku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 04 Dec 2025 09:03:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b26bc4984bso262256485a.1
        for <linux-media@vger.kernel.org>; Thu, 04 Dec 2025 01:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764839008; x=1765443808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zguyslqrcaP5wEteKasvoSc/KQMTcZmC2hcvKR1cr8g=;
        b=ApMZslYYd+/Ex2Z9uCAFqLZYjm3ox+j8Q+wr6K4g9E6FL08Sksu0ceEo+tAjTRJvO1
         f62WzEyN54IXkEAKfK3YCLDyrFL7g5rR1+iOozs/zFnJ64Rmy4zVTZYShpfxg+6CLZpT
         FbN8/NJJXYcu6BsT1BG+YyocEpZfxD4RMhZF1qMImDPlgPzqmx7EZRRjqD/dQvOxu74Q
         sZfODzcaZ+0xKAv62NFj3mzmZd7Tq6ylWW1U22uBxpj6A1ebRQMR6gs6TAnWFptMUrOW
         uh9BHzhxTGCChn5Q5pDD/UArNE74/mXxu7p/SoVo5GaR4Rhhi7MuoA10l1t70U9vbx6e
         xFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764839008; x=1765443808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zguyslqrcaP5wEteKasvoSc/KQMTcZmC2hcvKR1cr8g=;
        b=cgLwnS7J5hygmaKSre7QQzRxMhYXp3QL8K4F4xYtC+iPITYCrdht/e9u1u7UhWKIpU
         j6kvn+MtzccBoX9IZXPgaul5n2OYnr37mbhZC4wFZxQRibRvoNvm9yLgtKcPyxcII5YL
         0Q7eXdqePOOcATglU5TQPb/etxcEUXG3/uawESzX0RaZi0kz/+gznFveG9NzjTJq8emv
         hSS0ghNNivHNA2H3zmW4HDl4LORGY5Bp48x8nAcNr4b67Ni8TISguXYy0TBD8CJDRmQx
         FxzEQEIaEOC+Kb4oirLVsK5DBbKEHjVLcmVjQapaWuXjq16e7tGdsEmbCaZ7SBmV/j7o
         UwQg==
X-Gm-Message-State: AOJu0Yw0QJ0JiLOHLdHUVwMjeyb85t7941LFPc/cZD/fWguPAGWZZRGa
	7rfypxTMcLkrhvjL3p9VkPoL+wJn1hteimUBA9ZdugQ2ldgSYPAqZa+wzLtvu25iMmsDcZlgv0H
	AhfZ/2mXnpGdq5oLncBMFKTzr9WwSVoJiUpAvjhbzaLuWzxFrPYgnN107gptxXJTPeg==
X-Gm-Gg: ASbGncv+dgWyA8/keH3AabUdpIMVUw5n8V2q0J53u7lLuHHFBTYsyfLR8cZQZmVbtlT
	maDCHC2mlSUHulKUcNTqe5UjHd9pTA0T8Qw009d/UPzybxjjqyoFD1mEMibop4AaMpGSc40cutO
	8oNa8rhjZjbKTKLBBQ1+jJUb48M0U4Gcqtnjdzim8ooO0DPGq3DQ/EQOr4/wIolocjh8KW00GFU
	+sijxY4Nwo/O8A1GG+5fGpnREOhIa8Vi/BY9mwtH7p1mUE5WmhrYkg7vojAKhh0fqUiG4f/gHZv
	vujPWucWsLlNsu0dMGro0oKOZtTgsTml8hwXntrJVr1qiv/mI0XKS+ORSXMEb+D+n3dRNyfbIKC
	8T+/d3xTBS+232RCHKaSRpEINYTBlFN3AnIvWBQqAPjxFLTk5ZHeM7D0mKw+cb79aFoNcQZPKwv
	Kc
X-Received: by 2002:a05:620a:440a:b0:8a3:b6a9:d3c2 with SMTP id af79cd13be357-8b5e6a92271mr710544085a.44.1764839008073;
        Thu, 04 Dec 2025 01:03:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLArSQz+yioi16kVc+PO9ATH8eO3eiC7xSnXodgZ8Suwlzg6CqzZbOPtnw1VcLj2LpabJQdw==
X-Received: by 2002:a05:620a:440a:b0:8a3:b6a9:d3c2 with SMTP id af79cd13be357-8b5e6a92271mr710542285a.44.1764839007671;
        Thu, 04 Dec 2025 01:03:27 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:f840:4916:e7c3:a857])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930cb6a96sm21146195e9.15.2025.12.04.01.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 01:03:27 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vladimir.zapolskiy@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2] media: qcom: camss: csid-340: Fix unused variables
Date: Thu,  4 Dec 2025 10:03:25 +0100
Message-Id: <20251204090325.82140-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pzoskSMMKszWC-OoVS_1ZIeNvQLVLycf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3MyBTYWx0ZWRfX1z/Ms3N5ugYV
 6nYiEbD2wOWgex3pI6mXEKHx4xpVOLAhWCA70bO2gNFG20Ndcy60xEj3MkvGQrbQJTTGbABs/fq
 +HInHIfd8nKEBUz1KENxaql8UuEnyjYlFfhkofCUhiicntBpxumaXbqwP0MsimBpnYErcWlHzJm
 oDbiB4oDi6wWaf2Xxmn0NWhjhQBH4EHJQW6bu0mfbKbD2/T1t0hpDGVnI4ch4g4osbvBQtP/e5M
 tzakeUqjwQi3SQCtoBV/V96jG3+/aE3gM2Ph5q3s/o88/DdDla3g+NsOjY93Eh1ENR6cqf5vlFj
 x+Zfvbh8XDwXrWMakMRDy0f1Uu2T2EiuoabmZvTBxC2sOIX3+Y1nGf068rv6o2AyKc11Y+EXCGk
 pjPwg9wTR30y8jrEPD/XUwpI6okFvQ==
X-Proofpoint-ORIG-GUID: pzoskSMMKszWC-OoVS_1ZIeNvQLVLycf
X-Authority-Analysis: v=2.4 cv=Ctays34D c=1 sm=1 tr=0 ts=69314e60 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=KTbTtSzwl6QXNmdirioA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040073

The CSID driver has some unused variables and function parameters
that are no longer needed (due to refactoring). This patch cleans
up those unused elements:

- Removing the `vc` parameter from `__csid_configure_rx()`.
- Dropping the unused `lane_cnt` variable.
- Adjusting calls to `__csid_configure_rx()` accordingly.

Fixes: f0fc808a466a ("media: qcom: camss: Add CSID 340 support")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 v2: Correct the commit ID in the Fixes: tag

 drivers/media/platform/qcom/camss/camss-csid-340.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 22a30510fb79..2b50f9b96a34 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -55,8 +55,7 @@
 #define CSID_RDI_CTRL_HALT_AT_FRAME_BOUNDARY		0
 #define CSID_RDI_CTRL_RESUME_AT_FRAME_BOUNDARY		1
 
-static void __csid_configure_rx(struct csid_device *csid,
-				struct csid_phy_config *phy, int vc)
+static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
 {
 	u32 val;
 
@@ -81,13 +80,9 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
 								   csid->res->formats->nformats,
 								   input_format->code);
-	u8 lane_cnt = csid->phy.lane_cnt;
 	u8 dt_id;
 	u32 val;
 
-	if (!lane_cnt)
-		lane_cnt = 4;
-
 	/*
 	 * DT_ID is a two bit bitfield that is concatenated with
 	 * the four least significant bits of the five bit VC
@@ -120,10 +115,11 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	int i;
 
+	__csid_configure_rx(csid, &csid->phy);
+
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
 		if (csid->phy.en_vc & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i);
-			__csid_configure_rx(csid, &csid->phy, i);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 	}
-- 
2.34.1


