Return-Path: <linux-media+bounces-46042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B2447C231AB
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 04:01:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9744834FB8A
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 03:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A8E3191CF;
	Fri, 31 Oct 2025 03:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QBI2iNQS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GHDe7sf0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD0018871F
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 03:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761879620; cv=none; b=sNIL6gfIS2BnpgRGt9FhNRgU9CjRBnXUx37aH53r1AOQ0nS8k7+PGyNTfQU7K0+hQs4einvxpbYRvw6LH52vdkXRP253eVkbH4CjWJn4s5HcHckGOppH4L6S4TNskbahETdcw5MTRf3ECyOonblWZrH7C/pl6CVit17mLfcdlnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761879620; c=relaxed/simple;
	bh=/VFxNDC/+4OXwxjw+fC1cxECcAHmPyYEYL69YEwsaDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QS8/WIhBz0DgzIYD/QO2r6dnzp2gjksBOUCAhaHWHErmINSVcuo+8yNqrtdAke1BYd3P6B/3amQ5byEDY7dOafKXROcbd6euxrahideGfBEJC0qaoBh8LCddMgrFu4QZKDcpPc+X2mwF7B3mGMF2mRmRjC3C8i//kHbWZQeBPsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBI2iNQS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GHDe7sf0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V17sZD1512142
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 03:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9VzPj0s+32E8DN794i60/pMz7ADIqRLAIP3bBDi3+Y=; b=QBI2iNQS6/7C8ZuI
	J3cwHjLh0X/RxTe9vRAlHDeaaDGifzXXYq9iFsX1uIQ6Eq7HKuOMy9m5aO6cQzM5
	pfVxDYf9lXkkLyq9ERSanEMDfGkul6zfhtb22NWU6+33UXYNyD7dB54P9l9W6pfa
	FTppmj4ld0hPFC0aVcRRsdgs3zoTCZwi3KNgHgKheU6MUKP+BZG0zWpPnYIEwkUR
	4CLtxnE5Tl7hk7qlnPI2JKHwQgGvmXLr+yPE+Y1aANjRu4Sc0x6j1jr4AhGOKhBW
	RYO3OxyvzkyXsY02W7EFfudYtIMa/dAhFFvIc3p/QpkuO0lQMppQIV7ZgwkoYiym
	dT27Jw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69g7v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 03:00:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6d0121b1c5so1373000a12.0
        for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 20:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761879616; x=1762484416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9VzPj0s+32E8DN794i60/pMz7ADIqRLAIP3bBDi3+Y=;
        b=GHDe7sf0CW2FJsjq+VVaNBYB/v3wo2hW0ITeNumzMFFlkkvhvwpMLczPP6fWPI89tU
         6acsSvKlFg8BAo9BJkAJyOd0e10AoVDiNu9I7MB8t+Wf0yCrD2P4j6n/Hjv+rDpjLYIi
         6muco5TkkzcPkypWXG25Q4TCI5eQ0AgFuS+PekBnrwEVgTPGtejs/X9+irMn5l9TcLiC
         78RBMjIrpR+qz7LFja0xFePJ+Yq8qSdmFhbBVnQDRuLUCnAStXl6ttGPNxKF4oCDsDe4
         wfWBQlfQwz9LmB/p6PgPRrSueR59Qgr3f8mP61ntNRltJLZoFdapstb+fDCZGX3E0JH2
         jUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761879616; x=1762484416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9VzPj0s+32E8DN794i60/pMz7ADIqRLAIP3bBDi3+Y=;
        b=vYFpGaFz/ifiJg1dgy3hJEF+CQjGJElJ0ETKMnIH4V75pridBLiYO2RxysP4Or5nRZ
         PQv+8Vp7nN91F4PrDYCpVGmBfK0PUHJKG9XV9CsxgFjbB5VGS/Ygxnx6akzcZRIu4vqK
         eyFQdB6AJNbZPyY+6OfuNjuZ0V2sXths6aY9jyOyU5+MIgskpuY6OXKimjiCusk0h4CQ
         kIqe5T5/cZ138NuiNxUkukMRsiT3g8s+sB/r5WvttXPqQmOv/gf7+TBL4sxq1IrC5Vmr
         TfqkZqo7vwqGElCVJkEy55iFv91X8GFVbD2nS38RNqD32d8KFPN+yf9BQF56vg7osIPG
         VtVg==
X-Forwarded-Encrypted: i=1; AJvYcCU+BbOd+OJR0JTdgl55W/OtBWd3HW36rFxQ5xHZQuO7oPcqZWtbAS0pKwvtrG96wikoQVNSL35gEDhKsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNOAv63orLpoCQSonTqX7x4kf2w3szuZABzp601GubMEJOD6eU
	Vi7nuwvtBTSIOnQBoODSwghWwHOFr6Ui5TOPLSPrzvQwEooyXZvPJite0yKviijepq/YQDzylLn
	PRaUWKrVWYFWxyw3GF6GOAfOy+HXWlKUJYQAaiZQ7tvjsJDgdEuhzTCIo5y71IWIgVw==
X-Gm-Gg: ASbGncsQhdjVcbOPsPXZzah09Y92G3vNuMdXWzSPn0tATlrQ4v2ljncYIkpge2yHBqt
	Xjc8bhp+QiERS+W53YKWjoxbF+G9x2IKXMYGF+CB3/RNtAxFo4bTNUCS/JJPTgBNcMHMzri/SBj
	3r8W2z1glm5SngbYQ6jcidZEiYlSQlbEEAdWnF09rpm8pj/bXOigcF7HbD9fYTXYZL/kw1dIzXe
	ap/AlNmPXcMbW8NZaGIzmN7EemE4/5UA6vhl+g6AHzk0ub1sUpOta/aorJlSJJiBbwigZXS1xtW
	k3qmTjcy52KP5IxobB0Y8UWoIpAvRMSINIToF4Utc72nEpOwhFUIOmqsdnnGDx7zNqF5CIvjxVX
	4X6c3NGIYJ5GMdJ65RRsaSy7/z6UhMDeA1cYAIWGwqWc/oPpQIVBxyw==
X-Received: by 2002:a05:6a20:6a09:b0:33f:df99:11d5 with SMTP id adf61e73a8af0-348ca463b62mr2824710637.13.1761879615493;
        Thu, 30 Oct 2025 20:00:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpMzUDVgxj6Dv5ADUj+xeztNdIatoVTR3EtbawbaORwiEXZge/pCWr4gUuj5if+FDRK4NGoQ==
X-Received: by 2002:a05:6a20:6a09:b0:33f:df99:11d5 with SMTP id adf61e73a8af0-348ca463b62mr2824638637.13.1761879614903;
        Thu, 30 Oct 2025 20:00:14 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db67cbdfsm352570b3a.49.2025.10.30.20.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 20:00:14 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 19:59:51 -0700
Subject: [PATCH v5 4/6] media: qcom: camss: csiphy: Add support for v2.4.0
 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-add-support-for-camss-on-kaanapali-v5-4-f8e12bea3d02@oss.qualcomm.com>
References: <20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com>
In-Reply-To: <20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: IyNnhxbrRzllGxoXDvaT_K2_CVWMiFmh
X-Proofpoint-GUID: IyNnhxbrRzllGxoXDvaT_K2_CVWMiFmh
X-Authority-Analysis: v=2.4 cv=OYaVzxTY c=1 sm=1 tr=0 ts=69042640 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fxCOb-bM6HI3QnfcwHgA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyNSBTYWx0ZWRfX7P93aYjkjpVY
 3UhDqrTSBxUMK+UCDyydIPPu4c+PUWxgJ/VrtOR+DPg+q/Gh+HPauteVXjRt8iVLYQh8UawHcWc
 lrFalnlIH27x1bU3SlsxrKQgIkzcjStBuOwpp98T7uITQzjhgTPTW6vWdvfPpK6shte22SS1wSr
 8zt+ybvYLiczPdrBcbiqNEpB35pBH+yTdnw5e0Demm7WK4szNwYHe56e1PQfBL709FRMbRBOfF/
 gcY4zSDnoeytNEC3Jq7FIMdlsex/mVCl8ql12pKUNxDV+L/3cvHDfFGd/DgSSx7+xtGRZeQl0Vs
 I+gxm4Yy4D8FPGcVlqHaw0C9F2TTlNQZh5ZlRWZmHriSCVSaJsU3ztKl/UXIsRQGCG69jT//jzj
 r+Gn5RmTzNmkoNR24RfN2ZRssVWfrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310025

Add more detailed resource information for CSIPHY devices in the camss
driver along with the support for v2.4.0 in the 2 phase CSIPHY driver
that is responsible for the PHY lane register configuration, module
reset and interrupt handling.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 124 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.c          | 107 ++++++++++++++++++
 2 files changed, 231 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 9b6a0535cdf8..5499f4141294 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -588,6 +588,123 @@ csiphy_lane_regs lane_regs_sm8550[] = {
 	{0x0C64, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* 3nm 2PH v 2.4.0 2p5Gbps 4 lane DPHY mode */
+static const struct
+csiphy_lane_regs lane_regs_kaanapali[] = {
+	/* LN 0 */
+	{0x0094, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x00A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0090, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0098, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0094, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
+	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0094, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x005C, 0x54, 0x00, CSIPHY_SKEW_CAL},
+	{0x0060, 0xFD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+
+	/* LN 2 */
+	{0x0494, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x04A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0490, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0498, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0494, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
+	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0494, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x045C, 0x54, 0x00, CSIPHY_SKEW_CAL},
+	{0x0460, 0xFD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0464, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+
+	/* LN 4 */
+	{0x0894, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x08A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0890, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0898, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0894, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
+	{0x0830, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0800, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0838, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x082C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0834, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x081C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0814, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x083C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0804, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0820, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0808, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0810, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0894, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x085C, 0x54, 0x00, CSIPHY_SKEW_CAL},
+	{0x0860, 0xFD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0864, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+
+	/* LN 6 */
+	{0x0C94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0CA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C90, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C94, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
+	{0x0C30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C00, 0x8C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C38, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C08, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0C10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0C94, 0xD7, 0x00, CSIPHY_SKEW_CAL},
+	{0x0C5C, 0x54, 0x00, CSIPHY_SKEW_CAL},
+	{0x0C60, 0xFD, 0x00, CSIPHY_SKEW_CAL},
+	{0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},
+
+	/* LN CLK */
+	{0x0E94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0EA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E90, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E94, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
+	{0x0E30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E28, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E00, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E0C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E38, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0E08, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
 /* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
 static const struct
 csiphy_lane_regs lane_regs_x1e80100[] = {
@@ -921,6 +1038,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8775P:
+	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
 		ret = true;
 		break;
@@ -1030,6 +1148,12 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sa8775p[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
 		break;
+	case CAMSS_KAANAPALI:
+		regs->lane_regs = &lane_regs_kaanapali[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_kaanapali);
+		regs->offset = 0x1000;
+		regs->common_status_offset = 0x138;
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 658d9c9183d4..b12e79e40e97 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,111 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdd-csiphy0-0p8", "vdd-csiphy0-1p2" },
+		.clock = { "csiphy0", "csiphy0_timer",
+			   "cam_top_ahb", "cam_top_fast_ahb" },
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
+		.regulators = { "vdd-csiphy1-0p8", "vdd-csiphy1-1p2" },
+		.clock = { "csiphy1", "csiphy1_timer",
+			   "cam_top_ahb", "cam_top_fast_ahb" },
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
+		.regulators = { "vdd-csiphy2-0p8", "vdd-csiphy2-1p2" },
+		.clock = { "csiphy2", "csiphy2_timer",
+			   "cam_top_ahb", "cam_top_fast_ahb" },
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
+		.regulators = { "vdd-csiphy3-0p8", "vdd-csiphy3-1p2" },
+		.clock = { "csiphy3", "csiphy3_timer",
+			   "cam_top_ahb", "cam_top_fast_ahb" },
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
+		.regulators = { "vdd-csiphy4-0p8", "vdd-csiphy4-1p2" },
+		.clock = { "csiphy4", "csiphy4_timer",
+			   "cam_top_ahb", "cam_top_fast_ahb" },
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
+		.regulators = { "vdd-csiphy5-0p8", "vdd-csiphy5-1p2" },
+		.clock = { "csiphy5", "csiphy5_timer",
+			   "cam_top_ahb", "cam_top_fast_ahb" },
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
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -4308,8 +4413,10 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.34.1


