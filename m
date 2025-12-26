Return-Path: <linux-media+bounces-49572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 593E0CDE884
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 10:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 598A9301411F
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 09:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E33265CA6;
	Fri, 26 Dec 2025 09:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O00RH82b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xoiv59PU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251EF28AAEE
	for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766740781; cv=none; b=ROSBf1YdUUbVwsPwIb/7JX4cdjoXfLSst7Dc+VcPUVgL0OR8DxOyCUoU7BdnnF6nr475Yp46xafeWAQxudK8EOWO8QQWxEHgdjbZuFS3WikGHFq2DvthtE/eQcsW8q5NIh8A2hUO5PDdHchXqiO0KTwcn0KOLEeo/6BIV+uSL7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766740781; c=relaxed/simple;
	bh=W0yjR0Tf8+rNLbVprVY1t8vI+DP9Kreo8q1LNcxY20Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dKmZL4fHczOKfPfStMohV6gwq+rcsvmrX2EEqZ+wq4D3mtUH5sNMj1+xTfUXeB+/23eUtWncDG29u2IbTS9OjkcQHyhwYgLvdXRyUQcvBIGV7LKgRGyB4zddWh+6yHgLk9HIyPMdOvM8yVsb2TW50Ls0BGhIGs3UiLZPd/I0COY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O00RH82b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xoiv59PU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8baGt889864
	for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 09:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5kGMP6UzAmvwYHxAkixLjwHfRuNSooHMiikGE69gqI=; b=O00RH82bCdNWKllQ
	X4Cc9VTYDPoWata1r8R9Kowa8PuKVYhEMjVdFuAiJ1CGHLHaKKCKWGty6YALSbeF
	7qwrEgHY8gDEDqzQWHj7HmeXWnDWcpOHeZuhlF4SYhnkwFYShOqh3MHcpxhRV8jQ
	P7iD0bWtK5/uec/SXzXu0fmlr+XB//cjpFLpQL4wsEemplhjwCxMNU62BuUzLzUc
	yEH7NxknzwkwrLz4nkTzwJLmZ3ijADU/4mRrYVMcxHn6GEhaPpSKBf1iL8WzIbvF
	DKG+14um5w/bGgzkeNM8kycwxbpOjqTJEkzsdSdq0YVKW8UQi6fmFE8ukoXz3aDk
	lv+kTw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8xvcah53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 09:19:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb3a245d0cso1586338185a.2
        for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 01:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766740777; x=1767345577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5kGMP6UzAmvwYHxAkixLjwHfRuNSooHMiikGE69gqI=;
        b=Xoiv59PUBYnXVA84TipHJ3bkTwUk3FM6egARUcbFmA4/HbnC/0ypGeunTLBWUzoK7O
         Vlv9dJpse2rG+oiUvq3eNcrONHhpB8uZml6uvKWD2Vp7OIODyFQfW3QoBcuPmkGjg0T2
         Qgc/yomOC6am1I8fesABWfm1jx4+mJPq0O+NB0txIjhauIR+zU0PmMLSwM3qgXA3GebJ
         BOITTEFqyH0yWgXV/g/fsBtjC0TIDyi4CcL/kR944qGE1aBqE4viAe3xRLR4NzknG7p3
         RoYMwGIoKxASzfanQ8cOzH2d8nhgfcQKrYp2LdalvZYaTs9Gt+7sMM9tbBsP3wdzunkQ
         ipmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766740777; x=1767345577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n5kGMP6UzAmvwYHxAkixLjwHfRuNSooHMiikGE69gqI=;
        b=jt414xedRehak37F1JZtIe8MtUmGs6yHcO/IP8OFxa/le+jSaGw3y900C2km4ZMv/h
         J3mkm3T0JW+gC7xG+3rNBxTjN23QbH7D5GkrXDFgWg2fUXMrsdGSwzJfqtQqyqPQh0kZ
         sfaUUVnuSStu5tqZyXIFvaXUUpbcYV1Zu6o+Ujw409R0eFiy8zH0AzNp2JEqET6690//
         UVn8JCIOcg0gH3W2KiKy74ppHhBzOyr6Bo8gy6FUCMvT8B9VkiYyKyuSHg/ow4fdIaTS
         YFZ0VPDSl6zeNg9qGPsBaDacjG/uHWSKd8HlLkD9yESbq/oCDp7TcSnxPxp4oJZJ0Wty
         YHbw==
X-Forwarded-Encrypted: i=1; AJvYcCVOwdXR7XREyizu/fw3cBIC7hNRiNleblQ90zkG030u4+4fHTgKEyLmJPy22AI9DCxV1jCXC4FBYwGQoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGFbvfyqrz0bWPemedbB/Xqne13DKlSZ4xQBgjHIEjDXZaaNFa
	Y5bxHsQ4AY4AgNWxSRDe4/Xkimh+OHHS6tLOaaKGM24k3x+a1JrI06KVsFx3OpAu8PYz9FTSf80
	et6WgKHtMu3pj9i0SVBuCSTVKxY60ybgucBWw9dIEd9GJP+q7lVzjmNOOKS9Dmih8YA==
X-Gm-Gg: AY/fxX7Rm+gI2i07idXu3YKwF0V+43zlTeaBZuA+nr1C+vUt5aAK6JJv0Up7j0q4sMS
	PDrst6i1SfzMKq2WBv6khdCGn/F2UhSIPEMBnlZfXWqwRYJZGPdTxR5QE8jkA9Gx0E/QVLX24ww
	fc0eg6/pZL7LRHW8UnKRThoNi9EK3HO0xRbgcjVgc/XvgtORCJ/8jsMsck1jGsiI52Nvwd9YPHo
	zmziSbiLrrw2D8WXD3uUVe1DTTWXzE5PYLhKWkMFZSLbv6u5iZJEg+pSPVy3syOYqd9bqLXpYQX
	u/3RiCYgO8EqdREEhRGdRDDGquL2ijHcPLAVScaUJrWF/8Ttc63d1Gtgd8EGM4pFJy23c24CuS8
	XakmzFc8ckdknc3shRfjsyaDMl6faZed5BvtB+aWM/GQRFwRp+rVnxgr2iemQeelKXJr4dfKDrj
	jC
X-Received: by 2002:ac8:5d04:0:b0:4ed:b570:2d4c with SMTP id d75a77b69052e-4f4abd7acadmr328013201cf.43.1766740776883;
        Fri, 26 Dec 2025 01:19:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJf3TiOIeYRH14cTVnn4yIGTxVLSvtGhDAE3j7OyvTg//nuosnDpw5UKPunOlYpP76/dDZ7Q==
X-Received: by 2002:ac8:5d04:0:b0:4ed:b570:2d4c with SMTP id d75a77b69052e-4f4abd7acadmr328013051cf.43.1766740776339;
        Fri, 26 Dec 2025 01:19:36 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac62d53dsm160612891cf.19.2025.12.26.01.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 01:19:35 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 17:19:12 +0800
Subject: [PATCH v7 3/3] media: qcom: camss: tpg: Add TPG support for
 multiple targets
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-camss_tpg-v7-3-ccb536734805@oss.qualcomm.com>
References: <20251226-camss_tpg-v7-0-ccb536734805@oss.qualcomm.com>
In-Reply-To: <20251226-camss_tpg-v7-0-ccb536734805@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766740760; l=18103;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=W0yjR0Tf8+rNLbVprVY1t8vI+DP9Kreo8q1LNcxY20Y=;
 b=+sUSu9wSFUXhjVd96M8D7hLb5YiScZCrevpgtZYeeRBgOkLjR1Sl43qaRl2z8KM0khZytYOPT
 Qx4woB+qAS/CqUHAXYnixM3lOHHJoHDBN5FdleWTFEvhUntMWNx0Zwk
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: TDqas2XtLm5-ZCU6FNB4-YC67_O5jCVS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDA4NiBTYWx0ZWRfX57cpTevn3+g2
 72wEE0nBKUeSXiEFVSAjx8hBeXjzILL1/36p/swaOMH1kLgkejMiI9Zhd+2lJxm/taITa0HM8UW
 JUaBBhTSp3l7RmyBJs99HsTjcY3whuadkvXp7c0MY2LGTtKqj906xII1bN2FRSb2aRSMfP3V6QX
 4tEaOL7zzLfFBBNEHqVCTXJ6QCFxcRvCopclVMhGcwpclBw8K1SvyMvJmnUSpLr4UhNyFpxUA/1
 IzKpwBIz5Aaok0hZacRD1+NS0PZzbSuTgsitdH7Sn8B/J82Nn6EqtHbgXfGFp8oGCWaUZaEG7E7
 Dh13/VWiT+xxr6arQzBbxVpxkO3HXygtqb8CQu36Cf+AzQxDiTW/8CQIInpqIoq37t3OfaOroMK
 +s7wy5UbCklV/OVh5svEGjO0vQDV5U0emnLtuPgXslZpNWYW0TtnJ4E+g5OWwHx1ET85zGNJag9
 inBHtEeZYwUmSFUoh6g==
X-Proofpoint-ORIG-GUID: TDqas2XtLm5-ZCU6FNB4-YC67_O5jCVS
X-Authority-Analysis: v=2.4 cv=M4xA6iws c=1 sm=1 tr=0 ts=694e532a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mCskXXD-Dwv-JJgxb-UA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512260086

Add support for TPG found on LeMans, Monaco, Hamoa.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-csid-680.c |  16 ++
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  16 ++
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 257 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.c          | 128 ++++++++++
 5 files changed, 418 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index d355e67c25700ac061b878543c32ed8defc03ad0..e8996dacf1771d13ec1936c9bebc0e71566898ef 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -28,5 +28,6 @@ qcom-camss-objs += \
 		camss-video.o \
 		camss-format.o \
 		camss-tpg.o \
+		camss-tpg-gen1.o \
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 3ad3a174bcfb8c0d319930d0010df92308cb5ae4..dcf6b14168f519aa1f3889ef1b67e54b0ca81497 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -103,6 +103,8 @@
 #define		CSI2_RX_CFG0_PHY_NUM_SEL			20
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX			1
 #define		CSI2_RX_CFG0_PHY_TYPE_SEL			24
+#define		CSI2_RX_CFG0_TPG_NUM_EN				27
+#define		CSI2_RX_CFG0_TPG_NUM_SEL			28
 
 #define CSID_CSI2_RX_CFG1					0x204
 #define		CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN		BIT(0)
@@ -185,11 +187,25 @@ static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy, int vc)
 {
 	u32 val;
+	struct camss *camss;
+	struct tpg_device *tpg;
 
+	camss = csid->camss;
 	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
 	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
 
+	if (camss->tpg) {
+		tpg = &camss->tpg[phy->csiphy_id];
+
+		if (tpg->testgen.mode > 0) {
+			val |= (phy->csiphy_id + 1) << CSI2_RX_CFG0_TPG_NUM_SEL;
+			val |= 1 << CSI2_RX_CFG0_TPG_NUM_EN;
+		} else {
+			val &= ~(CSI2_RX_CFG0_TPG_NUM_SEL | CSI2_RX_CFG0_TPG_NUM_EN);
+		}
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 664245cf6eb0cac662b02f8b920cd1c72db0aeb2..2c94727daeb799aa4f72250cbb2d9c443c5fe351 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -66,6 +66,8 @@
 #define		CSI2_RX_CFG0_VC_MODE		3
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL	20
+#define		CSI2_RX_CFG0_TPG_NUM_EN		27
+#define		CSI2_RX_CFG0_TPG_NUM_SEL	28
 
 #define CSID_CSI2_RX_CFG1		0x204
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN	BIT(0)
@@ -109,11 +111,25 @@ static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy, int vc)
 {
 	int val;
+	struct camss *camss;
+	struct tpg_device *tpg;
 
+	camss = csid->camss;
 	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
 	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
 
+	if (camss->tpg) {
+		tpg = &camss->tpg[phy->csiphy_id];
+
+		if (tpg->testgen.mode > 0) {
+			val |= (phy->csiphy_id + 1) << CSI2_RX_CFG0_TPG_NUM_SEL;
+			val |= 1 << CSI2_RX_CFG0_TPG_NUM_EN;
+		} else {
+			val &= ~(CSI2_RX_CFG0_TPG_NUM_SEL | CSI2_RX_CFG0_TPG_NUM_EN);
+		}
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
new file mode 100644
index 0000000000000000000000000000000000000000..d7ef7a1709648406dc59c210d355851397980769
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *
+ * Qualcomm MSM Camera Subsystem - TPG (Test Patter Generator) Module
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/bitfield.h>
+#include <linux/completion.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+
+#include "camss-tpg.h"
+#include "camss.h"
+
+#define TPG_HW_VERSION		0x0
+# define HW_VERSION_STEPPING		GENMASK(15, 0)
+# define HW_VERSION_REVISION		GENMASK(27, 16)
+# define HW_VERSION_GENERATION		GENMASK(31, 28)
+
+#define TPG_HW_VER(gen, rev, step) \
+	(((u32)(gen) << 28) | ((u32)(rev) << 16) | (u32)(step))
+
+#define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
+#define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+
+#define TPG_HW_STATUS		0x4
+
+#define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
+
+#define TPG_CTRL		0x64
+# define TPG_CTRL_TEST_EN		BIT(0)
+# define TPG_CTRL_PHY_SEL		BIT(3)
+# define TPG_CTRL_NUM_ACTIVE_LANES	GENMASK(5, 4)
+# define TPG_CTRL_VC_DT_PATTERN_ID	GENMASK(8, 6)
+# define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
+# define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
+#  define NUM_ACTIVE_VC_0_ENABLED		0
+#  define NUM_ACTIVE_VC_0_1_ENABLED		1
+#  define NUM_ACTIVE_VC_0_1_2_ENABLED		2
+#  define NUM_ACTIVE_VC_0_1_3_ENABLED		3
+
+#define TPG_VC_n_CFG0(n)	(0x68 + (n) * 0x60)
+# define TPG_VC_n_CFG0_VC_NUM			GENMASK(4, 0)
+# define TPG_VC_n_CFG0_NUM_ACTIVE_DT		GENMASK(9, 8)
+#  define NUM_ACTIVE_SLOTS_0_ENABLED			0
+#  define NUM_ACTIVE_SLOTS_0_1_ENABLED			1
+#  define NUM_ACTIVE_SLOTS_0_1_2_ENABLED		2
+#  define NUM_ACTIVE_SLOTS_0_1_3_ENABLED		3
+# define TPG_VC_n_CFG0_NUM_BATCH		GENMASK(15, 12)
+# define TPG_VC_n_CFG0_NUM_FRAMES		GENMASK(31, 16)
+
+#define TPG_VC_n_LSFR_SEED(n)	(0x6C + (n) * 0x60)
+
+#define TPG_VC_n_HBI_CFG(n)	(0x70 + (n) * 0x60)
+
+#define TPG_VC_n_VBI_CFG(n)	(0x74 + (n) * 0x60)
+
+#define TPG_VC_n_COLOR_BARS_CFG(n)		(0x78 + (n) * 0x60)
+# define TPG_VC_n_COLOR_BARS_CFG_PIX_PATTERN		GENMASK(2, 0)
+# define TPG_VC_n_COLOR_BARS_CFG_QCFA_EN		BIT(3)
+# define TPG_VC_n_COLOR_BARS_CFG_SPLIT_EN		BIT(4)
+# define TPG_VC_n_COLOR_BARS_CFG_NOISE_EN		BIT(5)
+# define TPG_VC_n_COLOR_BARS_CFG_ROTATE_PERIOD		GENMASK(13, 8)
+# define TPG_VC_n_COLOR_BARS_CFG_XCFA_EN		BIT(16)
+# define TPG_VC_n_COLOR_BARS_CFG_SIZE_X			GENMASK(26, 24)
+# define TPG_VC_n_COLOR_BARS_CFG_SIZE_Y			GENMASK(30, 28)
+
+#define TPG_VC_m_DT_n_CFG_0(m, n)		(0x7C + (m) * 0x60 + (n) * 0xC)
+# define TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT	GENMASK(15, 0)
+# define TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH	GENMASK(31, 16)
+
+#define TPG_VC_m_DT_n_CFG_1(m, n)		(0x80 + (m) * 0x60 + (n) * 0xC)
+# define TPG_VC_m_DT_n_CFG_1_DATA_TYPE		GENMASK(5, 0)
+# define TPG_VC_m_DT_n_CFG_1_ECC_XOR_MASK	GENMASK(13, 8)
+# define TPG_VC_m_DT_n_CFG_1_CRC_XOR_MASK	GENMASK(31, 16)
+
+#define TPG_VC_m_DT_n_CFG_2(m, n)		(0x84 + (m) * 0x60 + (n) * 0xC)
+# define TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE		GENMASK(3, 0)
+/* v2.0.0: USER[19:4], ENC[23:20] */
+# define TPG_V2_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD		GENMASK(19, 4)
+# define TPG_V2_VC_m_DT_n_CFG_2_ENCODE_FORMAT			GENMASK(23, 20)
+/* v2.1.0: USER[27:4], ENC[31:28] */
+# define TPG_V2_1_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD	GENMASK(27, 4)
+# define TPG_V2_1_VC_m_DT_n_CFG_2_ENCODE_FORMAT			GENMASK(31, 28)
+
+#define TPG_VC_n_COLOR_BAR_CFA_COLOR0(n)	(0xB0 + (n) * 0x60)
+#define TPG_VC_n_COLOR_BAR_CFA_COLOR1(n)	(0xB4 + (n) * 0x60)
+#define TPG_VC_n_COLOR_BAR_CFA_COLOR2(n)	(0xB8 + (n) * 0x60)
+#define TPG_VC_n_COLOR_BAR_CFA_COLOR3(n)	(0xBC + (n) * 0x60)
+
+/* Line offset between VC(n) and VC(n-1), n form 1 to 3 */
+#define TPG_VC_n_SHDR_CFG	(0x84 + (n) * 0x60)
+
+#define TPG_CLEAR		0x1F4
+
+#define TPG_HBI_PCT_DEFAULT			545	/* 545% */
+#define TPG_VBI_PCT_DEFAULT			10	/* 10% */
+#define PERCENT_BASE				100
+#define BITS_PER_BYTE				8
+
+/* Default user-specified payload for TPG test generator.
+ * Keep consistent with CSID TPG default: 0xBE.
+ */
+#define TPG_USER_SPECIFIED_PAYLOAD_DEFAULT	0xBE
+#define TPG_LFSR_SEED_DEFAULT			0x12345678
+#define TPG_COLOR_BARS_CFG_STANDARD \
+	FIELD_PREP(TPG_VC_n_COLOR_BARS_CFG_ROTATE_PERIOD, 0xA)
+
+static int tpg_stream_on(struct tpg_device *tpg)
+{
+	struct tpg_testgen_config *tg = &tpg->testgen;
+	struct v4l2_mbus_framefmt *input_format;
+	const struct tpg_format_info *format;
+	u8 lane_cnt = tpg->res->lane_cnt;
+	u8 dt_cnt = 0;
+	u8 i;
+	u32 val;
+
+	/* Loop through all enabled VCs and configure stream for each */
+	for (i = 0; i < tpg->res->vc_cnt; i++) {
+		input_format = &tpg->fmt[MSM_TPG_PAD_SRC + i];
+		format = tpg_get_fmt_entry(tpg,
+					   tpg->res->formats->formats,
+					   tpg->res->formats->nformats,
+					   input_format->code);
+		if (IS_ERR(format))
+			return -EINVAL;
+
+		val = FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT, input_format->height & 0xffff) |
+		      FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH, input_format->width & 0xffff);
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_0(i, dt_cnt));
+
+		val = FIELD_PREP(TPG_VC_m_DT_n_CFG_1_DATA_TYPE, format->data_type);
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_1(i, dt_cnt));
+
+		if (tpg->hw_version == TPG_HW_VER_2_0_0) {
+			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, tg->mode - 1) |
+				FIELD_PREP(TPG_V2_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
+					   TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
+				FIELD_PREP(TPG_V2_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
+					   format->encode_format);
+		} else if (tpg->hw_version >= TPG_HW_VER_2_1_0) {
+			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, tg->mode - 1) |
+				FIELD_PREP(TPG_V2_1_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
+					   TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
+				FIELD_PREP(TPG_V2_1_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
+					   format->encode_format);
+		}
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_2(i, dt_cnt));
+
+		writel(TPG_COLOR_BARS_CFG_STANDARD, tpg->base + TPG_VC_n_COLOR_BARS_CFG(i));
+
+		val = DIV_ROUND_UP(input_format->width * format->bpp * TPG_HBI_PCT_DEFAULT,
+				   BITS_PER_BYTE * lane_cnt * PERCENT_BASE);
+		writel(val, tpg->base + TPG_VC_n_HBI_CFG(i));
+		val = input_format->height * TPG_VBI_PCT_DEFAULT / PERCENT_BASE;
+		writel(val, tpg->base + TPG_VC_n_VBI_CFG(i));
+
+		writel(TPG_LFSR_SEED_DEFAULT, tpg->base + TPG_VC_n_LSFR_SEED(i));
+
+		/* configure one DT, infinite frames */
+		val = FIELD_PREP(TPG_VC_n_CFG0_VC_NUM, i) |
+		      FIELD_PREP(TPG_VC_n_CFG0_NUM_FRAMES, 0);
+		writel(val, tpg->base + TPG_VC_n_CFG0(i));
+	}
+
+	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
+		  FIELD_PREP(TPG_CTRL_PHY_SEL, 0) |
+		  FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+		  FIELD_PREP(TPG_CTRL_VC_DT_PATTERN_ID, 0) |
+		  FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, tpg->res->vc_cnt - 1);
+	writel(val, tpg->base + TPG_CTRL);
+
+	return 0;
+}
+
+static void tpg_stream_off(struct tpg_device *tpg)
+{
+	writel(0, tpg->base + TPG_CTRL);
+	writel(1, tpg->base + TPG_CLEAR);
+}
+
+static int tpg_configure_stream(struct tpg_device *tpg, u8 enable)
+{
+	int ret = 0;
+
+	if (enable)
+		ret = tpg_stream_on(tpg);
+	else
+		tpg_stream_off(tpg);
+
+	return ret;
+}
+
+static int tpg_configure_testgen_pattern(struct tpg_device *tpg, s32 val)
+{
+	if (val >= 0 && val <= TPG_PAYLOAD_MODE_COLOR_BARS)
+		tpg->testgen.mode = val;
+
+	return 0;
+}
+
+/*
+ * tpg_hw_version - tpg hardware version query
+ * @tpg: tpg device
+ *
+ * Return HW version or error
+ */
+static u32 tpg_hw_version(struct tpg_device *tpg)
+{
+	u32 hw_version;
+	u32 hw_gen;
+	u32 hw_rev;
+	u32 hw_step;
+
+	hw_version = readl(tpg->base + TPG_HW_VERSION);
+	hw_gen = FIELD_GET(HW_VERSION_GENERATION, hw_version);
+	hw_rev = FIELD_GET(HW_VERSION_REVISION, hw_version);
+	hw_step = FIELD_GET(HW_VERSION_STEPPING, hw_version);
+
+	tpg->hw_version = hw_version;
+
+	dev_dbg_once(tpg->camss->dev, "tpg HW Version = %u.%u.%u\n",
+		     hw_gen, hw_rev, hw_step);
+
+	return hw_version;
+}
+
+/*
+ * tpg_reset - Trigger reset on tpg module and wait to complete
+ * @tpg: tpg device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int tpg_reset(struct tpg_device *tpg)
+{
+	writel(0, tpg->base + TPG_CTRL);
+	writel(1, tpg->base + TPG_CLEAR);
+
+	return 0;
+}
+
+static void tpg_subdev_init(struct tpg_device *tpg)
+{
+	tpg->testgen.modes = testgen_payload_modes;
+	tpg->testgen.nmodes = TPG_PAYLOAD_MODE_NUM_SUPPORTED_GEN1;
+}
+
+const struct tpg_hw_ops tpg_ops_gen1 = {
+	.configure_stream = tpg_configure_stream,
+	.configure_testgen_pattern = tpg_configure_testgen_pattern,
+	.hw_version = tpg_hw_version,
+	.reset = tpg_reset,
+	.subdev_init = tpg_subdev_init,
+};
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 43fdcb9af101ef34b118035ca9c68757b66118df..5cddf1bc09f97c2c61f907939bb54663d8eab3d4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3199,6 +3199,65 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources tpg_res_8775p[] = {
+	/* TPG0 */
+	{
+		.regulators = {  },
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "tpg0" },
+		.interrupt = { "tpg0" },
+		.tpg = {
+			.lane_cnt = 4,
+			.vc_cnt = 1,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+
+	/* TPG1 */
+	{
+		.regulators = {  },
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "tpg1" },
+		.interrupt = { "tpg1" },
+		.tpg = {
+			.lane_cnt = 4,
+			.vc_cnt = 1,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+
+	/* TPG2 */
+	{
+		.regulators = {  },
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "csiphy_rx" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "tpg2" },
+		.interrupt = { "tpg2" },
+		.tpg = {
+			.lane_cnt = 4,
+			.vc_cnt = 1,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+};
+
 static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID0 */
 	{
@@ -3595,6 +3654,62 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 };
 
+static const struct camss_subdev_resources tpg_res_x1e80100[] = {
+	/* TPG0 */
+	{
+		.regulators = {  },
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "csid_csiphy_rx" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg0" },
+		.tpg = {
+			.lane_cnt = 4,
+			.vc_cnt = 1,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+
+	/* TPG1 */
+	{
+		.regulators = {  },
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "csid_csiphy_rx" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg1" },
+		.tpg = {
+			.lane_cnt = 4,
+			.vc_cnt = 1,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+
+	/* TPG2 */
+	{
+		.regulators = {  },
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "csid_csiphy_rx" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csitpg2" },
+		.tpg = {
+			.lane_cnt = 4,
+			.vc_cnt = 1,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+};
+
 static const struct camss_subdev_resources csid_res_x1e80100[] = {
 	/* CSID0 */
 	{
@@ -4674,6 +4789,13 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss->csiphy)
 		return -ENOMEM;
 
+	if (camss->res->tpg_num > 0) {
+		camss->tpg = devm_kcalloc(dev, camss->res->tpg_num,
+					  sizeof(*camss->tpg), GFP_KERNEL);
+		if (!camss->tpg)
+			return -ENOMEM;
+	}
+
 	camss->csid = devm_kcalloc(dev, camss->res->csid_num, sizeof(*camss->csid),
 				   GFP_KERNEL);
 	if (!camss->csid)
@@ -4863,11 +4985,13 @@ static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8300,
+	.tpg_res = tpg_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_qcs8300,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
@@ -4877,11 +5001,13 @@ static const struct camss_resources sa8775p_resources = {
 	.version = CAMSS_8775P,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8775p,
+	.tpg_res = tpg_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_sa8775p,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8775p),
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
@@ -4992,11 +5118,13 @@ static const struct camss_resources x1e80100_resources = {
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_x1e80100,
 	.csid_res = csid_res_x1e80100,
+	.tpg_res = tpg_res_x1e80100,
 	.vfe_res = vfe_res_x1e80100,
 	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
 	.icc_res = icc_res_x1e80100,
 	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_x1e80100),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
 	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
 	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
 };

-- 
2.34.1


