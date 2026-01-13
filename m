Return-Path: <linux-media+bounces-50515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A36BED17792
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DCA1E3017E5F
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577063815E9;
	Tue, 13 Jan 2026 09:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F4J8Rv2d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GvLpveAJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5A53803FF
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295030; cv=none; b=X+nbvXVpkvqLIeED65thVtyTbO8ANu8jYufwW6VriUNzavJEz6E3kI9NHlkOQPq2zVblh0hCpC8F8cybMGLTufjVe7SUWW9RjzlLqn1+bURXpPkKBwOVSgpyxzCqthkGq6sVD1uODAic+/RuR1fiO9BryZ/o9bOh1vxyTyeNRb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295030; c=relaxed/simple;
	bh=RA47cgaRqEICEEbIA9R+HT7QBjA/0oaKUJY3ZcMii9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l+ulbZ18GWc5pE4Qy/fW4tmIdUA8XOC4984KDJGXAqYQufNNsS2i+nzOSzPNg4Sutdpyd6iO5mm3XmEWnikcA1VNEashASEMfZSpF5s+v7E9TvaGbPUIi/42S8p7VTTqnoRdRyQo6SiTdBcYoEaTkN6RzF7EFx9q3w9cgSTDym4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F4J8Rv2d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvLpveAJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5SsDh3868843
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4l4RWIj3xn65UD1PVk+9hLYhJQfu+k/eJLaWni7uvn0=; b=F4J8Rv2dDVrLbslH
	dWu4ULbvAAOvVSF1g4zK8VxnRt4gWT1cpSqEOAy8j10xPwwaT19yAcdOhayL6Yd/
	cjpXkd5HME8UFwOD3QkL2pKwLm1kaeHLs68hJiDir9Qpyy4KOuwFIswUHvMavmhh
	e8gmjA9+mPoe0uJBScjP/itaSx9qi6YqmManU7pUG7c5+NoqY5JIKBfXCgreSvkc
	vabOK0ZbDz3eGe+sY5GDqVtMYbLwJ8Q3a+iR1uyKQI3lSFmxSAn02e92Hbk6pHA1
	GJ2wduhPpUiGeDixeAgec/2jJ/joT9k5x35TIbyYSpM4IV67dBGOZdoE0hkx2xwA
	cAZM9A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk8k71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:03:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88233d526baso248858676d6.1
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 01:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768295027; x=1768899827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4l4RWIj3xn65UD1PVk+9hLYhJQfu+k/eJLaWni7uvn0=;
        b=GvLpveAJ9+fp3Hs3Dj9uSWTu8UmaTdhHsjzIV7VAnta2O6jTY8utRC4DpZPmBzsCr+
         hBHSG8HlrxDFV+R1BeHy5CB3qvWqBHnqDSSy6kw3R/HYu17AcWWE4hPrKInyOaLEDzE8
         vNKC3zUvllLSHJ01kFr6KGCbAgapHCH4ssFgGqRi8PjlgmrUSPNU3Qs1YXPAuPFXqY7k
         V5ET2Ra8MWSd7vLBPiYtsL3BA48I1kg4I8mzNwwCarmIvSPLomDHsHvrDDDQ/SIB9YDx
         HVZ9Z8RM/jYe0+PLiYWws6RxWlWRc16WPskSOsHPGyWIMwU+p9J+yoKk6jCFG+th9eNz
         UMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295027; x=1768899827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4l4RWIj3xn65UD1PVk+9hLYhJQfu+k/eJLaWni7uvn0=;
        b=q5NTtKxIvfcJEN325p6a13+aIjkYLeiC6dfGlDCNYmu1lb3yk4Xhc25FcqWK5Esrsu
         dssZ5pkEvV5AOoNxDb6avbOvjqmkz15ENaclOUEL7bSxfUxq2cc+eYUimKAqWQirXYyv
         iJI0WGsQCgm8cCnD5pG+tur7apIjihzloJa2EddzdwB3pxZu9qBeVGHcO5zTVLIc2qpM
         Wr1jJkLJPwLDSBQLdSs1KRCqHzTN/bN1zg4Pzebpkwkeb2sDlFVUtK87e1SY0AfbbZwD
         QimgoplyGg/cy3hrKhkUUOA8+MFqFc/FHidtHzuTTI90cYIBc/YShRngsaIlqIDGslwm
         f0JA==
X-Forwarded-Encrypted: i=1; AJvYcCWgdOos/bSE6UtFyJTamktQZFSk1Blk5XJDbts2dVZpPFXqNdi1yRet7cS9Qm7LjdXrtcq/jYhbhXBDqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhc1YALLRh4dHOFLhSi/IMQPNxdKWQqxi9DEou6KespqcDI9qh
	8Ckan9O8ZpHoiCsN3AdFIAQa/bsx4RdfugGvte+Xla4jcssulpZGOOiVY37gAvpZZmvRb+n9cY8
	VX5zEpWLmJRcv3QxoTHiRDDCOseWWeFkOUqD5EUUhLJ9VIEN/p3hHZWL5Pkd10u3kEw==
X-Gm-Gg: AY/fxX6gsyMu95qzHVbBi//JizYLxfsE7qVcVFtoCsA/1X1RfjiUYzdzhsNUCvGOumR
	BEmlV50MEicKiuFyHcLCf/FSgNeOE2bO02WTx/zFHmBGyGdvqHGgO6R3Etw+nlGu4tdhW3UeEtJ
	BMmTFmVyZ6eQkPPb5TFkmCN4K5zM0ms3645dRs5RgTLPk9rDPn1fR0oix2KYsgT31Cgy+a4ap51
	waRufrgK3hNqk+bg43tqV6kFOcxtpRdeXQjY+tmwPHeOU5NC9yidMEb69spkbGINHjOi38+IPrt
	kuH1rOd4u1GLqI86YCvdhPXV+/+Cw57lonko56Ghi4dxdHgyaFqym11Yra0WaU2ttcS6ZKyJDCV
	Wi78Cvfert2z9fltjtp2b+6ll398oR7LIYDUVdPJWoy9IrezOaMns0p/cx7savdUUMk7Ua2lLue
	6L
X-Received: by 2002:a05:6214:15c5:b0:890:6f67:4127 with SMTP id 6a1803df08f44-890841769ebmr231844056d6.4.1768295026604;
        Tue, 13 Jan 2026 01:03:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWunrzJZvBL5mI4sdRCy+zDU2x+oFlXsL+1OOF2tJb+RA3vpR6VYqiePqr2D7u1Y17kCGgOw==
X-Received: by 2002:a05:6214:15c5:b0:890:6f67:4127 with SMTP id 6a1803df08f44-890841769ebmr231843616d6.4.1768295025870;
        Tue, 13 Jan 2026 01:03:45 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce298sm154352586d6.8.2026.01.13.01.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:03:45 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 17:03:28 +0800
Subject: [PATCH v8 3/3] media: qcom: camss: tpg: Add TPG support for
 multiple targets
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-camss_tpg-v8-3-fa2cb186a018@oss.qualcomm.com>
References: <20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com>
In-Reply-To: <20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768295009; l=18025;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=RA47cgaRqEICEEbIA9R+HT7QBjA/0oaKUJY3ZcMii9A=;
 b=kdr076lw+fweUwktgnELGvENYzI+KIvS7uJxIqf+WHuBjxPv0GZavuro7/2JztqNBUZE9S1xy
 kRx3hMUCj8rDIiS0Y/T+e5P0LnHcUtswIB4wtUEDhKoiVWl92eU1nz4
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: sTT3sCnvINmbNmEqZJANd1fyuttW9-zI
X-Proofpoint-GUID: sTT3sCnvINmbNmEqZJANd1fyuttW9-zI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NCBTYWx0ZWRfX35SQS0lJrNpQ
 WEbGs4fqoy/DMsUaF2iyThyXNoP9WI20biRJKG9urQ5/X7or2xJ/ETx+7/fiaSlWJXJVJYQ+jID
 +zRTO8ENbl0pJTLES9Bm07Cm//grUqUzPbMuiWhwSCNCMENoWBzUOkZo9/Qb4gm83RtSPJ871FZ
 iq6N4hdtzjHR26Ak2OwNE3cKXQwmIexhLv8f2w3BzdXfot35fCxpJN5Ks7jRHSpgHn0dznIBu+U
 hjqMZrlc9PDi6q9hoPZWzwSLP53pUd2l+cOb24QRlJ+CpTKjG2HsRg6C8ZGr4JfCUQZhf7UeivV
 i5amiAMgpA/sJLAGeH66f2suWm1+CW1TSmMV/XV3zzEt2yjwqaIRHeHCDSzefWgu7TOO/Bjhhm0
 IHJ6EdzgPcd0emRxfT0FezpfVgFRBhFO4pNMQbeQvR2cvpW8HZfGedDrvZe1LERjO/wYKIBr+PH
 KTM4EEa5lrX1ZhLKV6g==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=69660a73 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mCskXXD-Dwv-JJgxb-UA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130074

Add support for TPG found on LeMans, Monaco, Hamoa.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-csid-680.c |  14 ++
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  14 ++
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 257 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.c          | 128 ++++++++++
 5 files changed, 414 insertions(+)

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
index 3ad3a174bcfb8c0d319930d0010df92308cb5ae4..a5da35cae2eb9acf642795c0a91db58d845f211c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -103,6 +103,8 @@
 #define		CSI2_RX_CFG0_PHY_NUM_SEL			20
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX			1
 #define		CSI2_RX_CFG0_PHY_TYPE_SEL			24
+#define		CSI2_RX_CFG0_TPG_NUM_EN				BIT(27)
+#define		CSI2_RX_CFG0_TPG_NUM_SEL			GENMASK(29, 28)
 
 #define CSID_CSI2_RX_CFG1					0x204
 #define		CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN		BIT(0)
@@ -185,11 +187,23 @@ static void __csid_configure_rx(struct csid_device *csid,
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
+		if (csid->tpg_linked && tpg->testgen.mode > 0) {
+			val |= FIELD_PREP(CSI2_RX_CFG0_TPG_NUM_SEL, phy->csiphy_id + 1);
+			val |= CSI2_RX_CFG0_TPG_NUM_EN;
+		}
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 664245cf6eb0cac662b02f8b920cd1c72db0aeb2..5f9eb533723f2864df64fd6c63e2682fed4a12ae 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -66,6 +66,8 @@
 #define		CSI2_RX_CFG0_VC_MODE		3
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL	20
+#define		CSI2_RX_CFG0_TPG_NUM_EN		BIT(27)
+#define		CSI2_RX_CFG0_TPG_NUM_SEL	GENMASK(29, 28)
 
 #define CSID_CSI2_RX_CFG1		0x204
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN	BIT(0)
@@ -109,11 +111,23 @@ static void __csid_configure_rx(struct csid_device *csid,
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
+		if (csid->tpg_linked && tpg->testgen.mode > 0) {
+			val |= FIELD_PREP(CSI2_RX_CFG0_TPG_NUM_SEL, phy->csiphy_id + 1);
+			val |= CSI2_RX_CFG0_TPG_NUM_EN;
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


