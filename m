Return-Path: <linux-media+bounces-30327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9A9A8B89E
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98BED5A328A
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0758F24C06E;
	Wed, 16 Apr 2025 12:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="igXmAevR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9E324BBE2
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805362; cv=none; b=L56phBuF3hbtf2cmH3qal61FjX7s8W2EXFCQ/f5r8lPgBS3GKz72ycND/38jjVU59g+Mq/yF/zCYe69tV5xPbdcS2+wELwk54TfUrmw4Om/IX56/0bvJ5CKpFPaYJTbeHoUVD1sY3K/eq2svA0z04rkP06c/pO+EcCQCR4Ilf+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805362; c=relaxed/simple;
	bh=EikXQgvXEbeuMOm0/ej6wfNj69w5FhPyG4oLxunLFsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S6W21Q4KC3qOvwRU+AdUKVEn2qwUHU/rwedgZPnYjuurIz2G50QM1OgfGO/f9JN/cwyM/voSEpkmIDk2a6gyMLWGlRCp8dEtZZdDaK/Hcr8lMTFuMdNGYXLGDgCLDaoWOT3iF8hBE6V2SA4nUbyTrbeywNyuTKDuchTDM++4+Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igXmAevR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mMGb007082
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ynah7SVilvt
	NbvliQkFcZ5ZlC7MftpwWwSoA7dNu06o=; b=igXmAevRUqaEmmO9F73+A/65Khc
	9Tu+Cvt8as49BNWPWidWrCba8OfSjI8J7ZtthoaFeLP+10fqQUsXfaErcJ7FwIcd
	0At5jQEoQhdQDDanoJ6CNJbaUBfgEGC2h2OKlXvIyU/vuiPT3RWXHq2M5M6SWYAe
	BLXDQH7GnK15kqtIWsdFw3QnatXWinw/T/iJ6JjmITGP4aMbF9J2fR2rNRGTyKWC
	KxbSIQX3PEeGG85nhDhYpPTXaatbbBXNt2xMIz/mtdztTNMdKZSGrwaAe9x3vXbs
	GbuFhxRIS91R6gETRxsjFU1m1yR/X8nUvtdQntwm6KRRf4hMqy91juvPaGQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjkchu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:09:19 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3f6a5103779so1960833b6e.3
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 05:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805358; x=1745410158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynah7SVilvtNbvliQkFcZ5ZlC7MftpwWwSoA7dNu06o=;
        b=ZWPfis8vHV+KmsT4SHlClTEFyrES0B1iF5RS9oP5eaGERIwWAqAm+N6pny+yZHXceO
         DuA8aupg4taOMDwoCmnBObA+VGYT+bYkUgMW5KIQsUYpbcnIxb4Mbonejp4BEDSRhMqi
         s4t0VSoAHFjGHg/xcJUjnx25IKA5tQkKHKdZ+3xnV09lpkLwAyFSeg6uINQp0e413Zsg
         563zpoGjy6O91Yz2R8eJU0azj1ReTYpu4PM/BuJes2pDKGGeNUQsWi4wmH6I8Q+JVub+
         ZmGAB4Ro3K+omKfTICWo6Y4uI9s9z6vtu02YDl7j5934OmWglEKk/rZk2SpgsW/zdeKp
         gCKA==
X-Forwarded-Encrypted: i=1; AJvYcCWQfnujrGpE4eb3R5hALgvpMfohBaDXLXJhKQXPkL1MCQ2oQra2Ww24cbYFG0jSCA3ndTuxu1LffNmoDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOMWB+n5nYnU1Eg0nbCTPy4ZRBqTnld5me/WbsyjyWyyZnsZNt
	SsZBncf/MAq2A7S9i9r+1b7Mne/0iBRr2f6T7llSqjU41bX9hKn208aS2IBo/Mt8yIzNEHihY5s
	SZ7EmOtAo726NoHg2/hDpS3k1kQ3nKmEIRbLjRH0mu7YGK+8yaKV/4gDT2y49i3ItEMUP2Q==
X-Gm-Gg: ASbGnctVXMnChpsKVkA0rfym1hjDdscspEHEU680+Hdo/YBrLiq9tpnUoypiiXGEE+D
	RTISGdRsTglIWtv8kNtbJ/2ZdRJDPf5jJxuwXXfJ6SLBjF4NkRuragjAgQemwyavhMP/AqSg8I3
	DZ2/QNd5GwxllmC+D98t8dAls1pSb4Wpp2erLNxpges8GG6FR9n6uXdFBDzQD3tTcd866zE8XYJ
	bHKKFyCveO/XeIsa2mHX7lg7G6F/n4G8BrsS3bI7ePvgF4ftgrECVogwpWfjRtgxHPIJS95taOF
	L5cNDpWQiw8ZbUsciGEtw1ujoxSE35myj6BzaK8HhPwaylI=
X-Received: by 2002:a05:6808:4495:b0:3f8:effc:938 with SMTP id 5614622812f47-400b022dfd0mr944805b6e.34.1744805358257;
        Wed, 16 Apr 2025 05:09:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmTv/iEO8MvigYLmmer++FToIwH8hBxnPDVpvhmHwbMKueBxQw0RSzJClWAxOcSgk0PlBeHg==
X-Received: by 2002:a05:6808:4495:b0:3f8:effc:938 with SMTP id 5614622812f47-400b022dfd0mr944781b6e.34.1744805357909;
        Wed, 16 Apr 2025 05:09:17 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:15e4:d866:eb53:4185])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f068968sm8328669a12.35.2025.04.16.05.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 05:09:17 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 3/6] media: qcom: camss: csiphy-3ph: Add CSIPHY 2ph DPHY v2.0.1 init sequence
Date: Wed, 16 Apr 2025 14:09:05 +0200
Message-Id: <20250416120908.206873-3-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DJNtqfUEEKi_L3h7RoR1ZKmQf04KZbTB
X-Proofpoint-ORIG-GUID: DJNtqfUEEKi_L3h7RoR1ZKmQf04KZbTB
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67ff9def cx=c_pps a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=Z2TnqjxRs3nyLks1V8oA:9 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160099

This is the CSI PHY version found in QCS2290/QCM2290 SoCs.
The table is extracted from downstream camera driver.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 89 +++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |  1 +
 2 files changed, 90 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index f732a76de93e..0e314ff9292f 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -319,6 +319,90 @@ csiphy_lane_regs lane_regs_sm8250[] = {
 	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* GEN2 2.0.1 2PH DPHY mode */
+static const struct
+csiphy_lane_regs lane_regs_qcm2290[] = {
+	{0x0030, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0028, 0x04, 0x00, CSIPHY_DNP_PARAMS},
+	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0xD7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0004, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x000C, 0xFF, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0010, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0060, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0064, 0x3F, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0730, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0734, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x071C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0700, 0xC0, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0704, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0720, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0708, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x070C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0710, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0738, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0760, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0764, 0x3F, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0230, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0234, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0228, 0x04, 0x00, CSIPHY_DNP_PARAMS},
+	{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x021C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0200, 0xD7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0204, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0220, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0208, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x020C, 0xFF, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0210, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0238, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0260, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0264, 0x3F, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0430, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0428, 0x04, 0x00, CSIPHY_DNP_PARAMS},
+	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0xD7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x040C, 0xFF, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0410, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0460, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0464, 0x3F, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0630, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0634, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0628, 0x04, 0x00, CSIPHY_DNP_PARAMS},
+	{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x061C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0600, 0xD7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0604, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0620, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0608, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x060C, 0xFF, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0610, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0638, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0664, 0x3F, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
 /* GEN2 2.1.2 2PH DPHY mode */
 static const struct
 csiphy_lane_regs lane_regs_sm8550[] = {
@@ -744,6 +828,7 @@ static bool csiphy_is_gen2(u32 version)
 	bool ret = false;
 
 	switch (version) {
+	case CAMSS_2290:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
@@ -829,6 +914,10 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sdm845[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
 		break;
+	case CAMSS_2290:
+		regs->lane_regs = &lane_regs_qcm2290[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
+		break;
 	case CAMSS_7280:
 	case CAMSS_8250:
 		regs->lane_regs = &lane_regs_sm8250[0];
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 63c0afee154a..377707d91ff2 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -78,6 +78,7 @@ enum pm_domain {
 
 enum camss_version {
 	CAMSS_660,
+	CAMSS_2290,
 	CAMSS_7280,
 	CAMSS_8x16,
 	CAMSS_8x53,
-- 
2.34.1


