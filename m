Return-Path: <linux-media+bounces-47048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 57443C5B357
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 04:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 554E13461E1
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 03:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82911221FDE;
	Fri, 14 Nov 2025 03:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNnkr196";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PXPYLEAL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75ACE25D1E6
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091760; cv=none; b=hALyIfGXeoqO+GkXAveLMI0XdQTSTyfoZYD9LI3lq5kpHwF6/ddvER5+Q4nV1UZxuyogGu9xF5bJwoDGpFO5mZA5r1eBBpzG+PzxFBkFUFABNWCMFHOLKi52m7SkdrNO67TLaOSUiPuJT47qlkifVc6y9MkzZIl1NgNHe6c8Pjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091760; c=relaxed/simple;
	bh=TzCikezoRb8YZPqX4gJvquc17E3NxM8qIn79vKmmi9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sfmqqGdSrezDe490cas46WagAFsyYWXqNGtuRn+g9OxNRh1sGUgw0/Kp0I+mPvzwam02keyIgsIgzqvTbkbMKd6N6WTkUfCH5SnbjM11g9bWGV7zNmjkqLEMFupkCRTAvlGW3Rw12YAMPoxYlLD9xTOiZjf/r4hM1rS5oq/igFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNnkr196; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXPYLEAL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaqNU1704009
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KsRPldSlUkMNAs1cF8LcZleWSjUF0Z6b6sQxevYn+vo=; b=MNnkr196S0/0lF9D
	UkGiLNC3jSW4IiBA1z/Erz1xNmvzUugAeYIzqwNt0FBMlYh+pGcMIM1nsya1+UYR
	C4NA/BgI++FC0XBf1o9zjABdtJNpYjH9JyInNsIKPXoQvsgkPH7XOAmJy2JVH4kv
	5psqpV0ezfBGVQ6FHR96Rzw6OHhglrE+Mc/xOaLXhVlpcSybbOabIz0KlWJ8PHKs
	onYl+V1NA/7KYVx8fz71G4CCQQSKM0vbLmsbYAQGN/togwfcAj8dpg7IaPjhy0+e
	ylULJyRcLtbLMMcHaUPNkYPho1LAX/hc81YUZlTaGA1gbvekrfEy8ErI0JiVQArx
	T5csGQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9e8qbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:42:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8804b9afe30so61348776d6.0
        for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 19:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763091758; x=1763696558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsRPldSlUkMNAs1cF8LcZleWSjUF0Z6b6sQxevYn+vo=;
        b=PXPYLEALVcQQAUzUUGQOimtvPe9Emg1RxNmaPlTYChgQfToAaFPTGOagWcC4cZZOsH
         9gEHvvQ9JoAiuRCD7udHJUhqezn4NqvEtS8vumjHqpShxHC+qs9Q8JrQb/tSt8F+G2fD
         IWUibkydyExt2rCWNrRJakP7HN5a2AvJ1oFSj7Fe6x3xoe/kyZuvPkZu2aQeN2txoHEQ
         6RqeilXr2CFaJIsVT7G7In9okLVsujupj3rBaVI3blm/ar4Vye6dzqCCx2Hj9Jj4S0Yu
         nbhpkHBx52UOpGzDvO9Ebzf06KJWY+bemgXUVUggHcCrqt7w2mCBfMk5EABMdPkET9LX
         fIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091758; x=1763696558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KsRPldSlUkMNAs1cF8LcZleWSjUF0Z6b6sQxevYn+vo=;
        b=nWghb/q0MdgaSj5fBdaMKf/9oo0Q3Mvh9scwu1R69FgKEWPRV57x3TVNdqSWXoxAX3
         b+9KNsC8NKI8Vi+7D/dLfoCweJuAQ/Trh2apofvcBQDGAZ3u+ArulTOG7332dRxbiou9
         g6VAGYHg/MNTowf8K4rihT9gVygG4RbrFn8tN8FiYiKO2ypZdsQsn1/qnbjo7NF0HJwa
         2dspuf2FyIIysu9VW/zZvxpa/eD2uZTQU718MyR2fF/YLD9jQoKTG/r4R7i6yyXyWjuM
         QrUmkmZKeL0zuO8RFWOH+kyDXvyUDQDhi9DmFGU0x1bIBN/ZMYWq1uZMMLGSuOTpuV3K
         1nPA==
X-Forwarded-Encrypted: i=1; AJvYcCWsMk/gAOCOt3Xv4dtACtacSCXgASBR6htJnsQ6EmxeDTzOJGeZnLTTwo9E1oSLpzuojZ9X2lkTsWcVWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2cvvAOY7oj9nUzpQPFH2TzUksvyMIANEW9A4plI38KXouRNSH
	126U6xE00lrvtcrHdDuZiQQ+axWufdfMK2hb3GYr9g0JS+GtQcZ9gyvp2QF44GC8QVnQHqQqy44
	LQ7KSanS317kNJ7mTIlN1dtFlCGDCR8kMOYvI9AyD+MthXwfFZrT1qRkcdtGAnY1u9A==
X-Gm-Gg: ASbGncsYM+dA9n7JgmZ1aDsSGoIJJ7lDthgFE+cqzo0h5y3RnEqL6H1IAtyxvw0B47A
	Wt4VWuCZFmeb7hoZWpxaFUUOwUmUbzR2Y9qF2ttOP+v4USO1WtAYhv1MKUEc/33OkRQTBLyoNAS
	58jFpSLX65r91JhxuSOJxn9I5QNPlJbxAxZFA6FWpLnHgHHNr7s3FPOj2jEHwtvCmsAipW+MBiN
	EDG+zsE6+8POKpJl+QbfG8skdIWAdyg27rU3t5opGgLuHCADLfNTyVKooIp4nI3J60JUFV1Woc0
	t8BLHtRoU+uB+DvKWzq29JZX+BfvMiK7LEN7U48ubrE5RQG6lM2kkteX+kR0a7pHNfiCwtcqSXL
	crOWaS5dSE0VO2U0vLD/XDFBqOf2bInWIDIncztPRNpazOguWUIYU2A==
X-Received: by 2002:a05:7300:85:b0:2a4:69ec:ff0 with SMTP id 5a478bee46e88-2a4abd906d0mr537574eec.27.1763091007007;
        Thu, 13 Nov 2025 19:30:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9iZz8TDmIXJ5HowgRjrGyJ9Hq9d+RUvxqKJkNRvYyMWA7TfjixYbmmqmfVejGF3/E0j3oyA==
X-Received: by 2002:a05:7300:85:b0:2a4:69ec:ff0 with SMTP id 5a478bee46e88-2a4abd906d0mr537562eec.27.1763091006341;
        Thu, 13 Nov 2025 19:30:06 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49db4a36asm4104108eec.5.2025.11.13.19.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:30:06 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 19:29:19 -0800
Subject: [PATCH v6 2/5] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-add-support-for-camss-on-kaanapali-v6-2-1e6038785a8e@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
In-Reply-To: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=ccPfb3DM c=1 sm=1 tr=0 ts=6916a52e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: daIdm3KOVqsXaLh0Sz2wFksvsn9vd1rB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX/Y5yujJNjPnt
 XTe8EtD5wHJZOZluhKGWYfQjxTCeoUNQSvJRCegw25Leq7qqqWrN9VuqVlfKcXzmJC5CmO9YVUB
 uNOCWPZuNSNh6JzJCjFcwLdDysfmgkqS6yrtZ8hR9YEFf1jmXupK4EZ8rOrhu1CYT9md6Q4/wh9
 euXXiCelLV0AQaf/RJoR6g12CCKfd6mVxbQe0Ra6EkxI717wLZ1Ei1xHJIC9BfIOyWNc9huftmR
 pNotPQ2Exgm5C5Ywbduwlw68s7sIO0dTcaq8CWnPDFU1HEoy+vvit3ElqzHZlwrFkF4Hp8x4ys+
 /Ma9ZVq3QfvhHQUMYisat4WR7mNpaImsM9gp666WkwXPCPuPgFpTGmj6D7zJPGN5lep7gpkqYXy
 pnPG2XuWfy18BFLGB0PfV3Kfa6yiDg==
X-Proofpoint-ORIG-GUID: daIdm3KOVqsXaLh0Sz2wFksvsn9vd1rB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027

Add support for Kaanapali in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2fbcd0e343aa..658d9c9183d4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -4291,6 +4305,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -4467,6 +4488,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 901f84efaf7d..876cd2a64cbe 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -90,6 +90,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1


