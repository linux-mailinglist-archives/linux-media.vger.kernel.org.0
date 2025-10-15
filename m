Return-Path: <linux-media+bounces-44496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D25EEBDC390
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 04:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C94424E6F74
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 02:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D170730DD2F;
	Wed, 15 Oct 2025 02:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0Lo8gil"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C0729BD80
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 02:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496984; cv=none; b=b6Dk1BD6qYq7a8t9g2RbyXXQFNuCTpmWyK9SqMnfGgL1Srjqa8MKER2XAWedMcLn2IOWvnM4TVGxkXXgxQyaxZPk4vP6r1Mz6D4q+EtcX8ke82aF4wTIn1Fjedd4VVZB37pKoWNtaX+S27ZlDoRfMMJO479Wvs4yKlKdkUSPcLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496984; c=relaxed/simple;
	bh=rR6/8g9HpS0WjNNfiScilIsYrlz4c5/yKVO/1c2K5Rc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KqIa4J3PM/FDjEsXBWr0nhknhbJQ++4Xs6V5/ST17BpUtt96tNWeZLDTD0rFUQOCL2PFIien2Xzxorl62RlEw1TldOMT2+fRRf7ZmTmEpX0qIlT1FPcAGE/PrtRBiHLDAmORWa2qrgePDClDsAuyCMyDMnjbJNM8DoONSAmSlK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0Lo8gil; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sQG9015160
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 02:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dgjToRlAFCLqOwSb7emxbEIZZEXm4uhTqmsunIze4Ws=; b=F0Lo8gilQt9Tn0gh
	MQMnpkBxIB8OryS5IIddPb0tk3zT2fDescYryboxL/0wWs2r3v7LCIIMWM67Zcye
	pauYmGG35ZHC9pHzJUx4J8LrxHNFB2UGADhWfjaCZUdnSeS2ntXJvh11bJ8JqS/Q
	Z41KUIwl5lMQ/AgoVBmcTHJ34d1GrcfKSPD7xKAc7lGy6GKEojL54Uy01pKOdOqf
	ErxqM1btf712DMxPOLdEVMFck/cUoMbqBgli5+QjuuLm4GOQcPEwxP1ttKDHcXod
	vU/6LsjVGNqkKtXyDWLDvhOUQzHL23e4Gol9qO6I9UGInpCPz8ClQipH7sNSkN6O
	cSTUGw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj2ua8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 02:56:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-27ee41e062cso138357745ad.1
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 19:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760496979; x=1761101779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgjToRlAFCLqOwSb7emxbEIZZEXm4uhTqmsunIze4Ws=;
        b=Ga88cDtnhWmHlB8UKW9ONdj+K00mfG16Tr1HWymRVsHHIWKDGi1x/Y967jwHRs9D9R
         Q1Zv5iHOFanD4bQdWrUHPUD/pQo1Dk4psoJoo9HCQKxHyvZigdNxo0JHO1I6YagRUv0c
         5uo2q6j8fR66FdjqLqVf5RmSZz+IxvLXUs9k2nyMRjAj0XQeqAEjnLddidt5sNpXZbi9
         wsjbRCsyCMd8Cct8EiIj2sspuJBLiu85Eq1lEehuygC4bHDgN50i0tCYR/KC9KgDvM8z
         2gnXCYkPOXOkSi+nsZ+9bjy7im0w95+Mzl5dGzfnqa9ez71CHeo7B+smUeCJxvfaCyNe
         9hhg==
X-Forwarded-Encrypted: i=1; AJvYcCVXbvbX1C9bTtHPrWf24YYOEzQ1vozRb8RVd/ZtEF8jrJhX5AY0rzJou852fo9+2aoZPS64w1Wl6LES7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPeqpUmo0gxYfhnGJtXW9BZkmidSXAsMt86zYFNlcLpCsIZ22t
	VVKMoogA3ToVW8XeIrEwLDst5q16Odss2nQUJFe43UzeqU7HvZywbnF+Czx/z4XrB9yBigeH5SJ
	nDzFWhAoRIsRfcd/p7xyEFhrpKHA97C5kfV3NCyPHsL+2Rzb+TAku08IpMIfVzjVO8ddmvYAbQg
	MM
X-Gm-Gg: ASbGncuOVpsM2yWgHqTu3AUo0M5sVdZcWE9+kLI7ixxJOJN1E/yz9H4iSLAWnMx8jLO
	rQ59gOBHJZjF1rIP97afQ+k1wIkY8gKdY6EsRL3dCqyys9YsdK8rMo9nXk3YecqIuQNmJrgoSpA
	9nBvseGKd5nIYPAwfQKOD358j+mIe5mUCmNbFk1IxP02pymuIcXDfBkXKiuvRFAAI5CxTFGvnes
	l7fubkZWBW99KDkm6WEZikePdt/wB9IKWG2GONZ8kNZ/pj2mNg/IXPQLxnvqtPF6aBmqTqBlBlD
	xZbn6v4JpF500MqwJwwDsGUXdLKVZXoBJ/q1cayux6bYbKhw8mfPW/ss6hhxjAexbZTfOcotln8
	kGcjf1YBKQXhz049j9XA=
X-Received: by 2002:a17:902:d584:b0:269:6e73:b90a with SMTP id d9443c01a7336-290272aeebemr351370825ad.15.1760496979285;
        Tue, 14 Oct 2025 19:56:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0wD/t8NYX0XxivHtewIN2wQLEwA52QjaUl5YXrgjbud9zmuMZOs7Cm0SSD1cYvMG8t8VMPA==
X-Received: by 2002:a17:902:d584:b0:269:6e73:b90a with SMTP id d9443c01a7336-290272aeebemr351370645ad.15.1760496978814;
        Tue, 14 Oct 2025 19:56:18 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de54d2sm179122855ad.12.2025.10.14.19.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 19:56:18 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 19:56:03 -0700
Subject: [PATCH v2 3/6] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-add-support-for-camss-on-kaanapali-v2-3-f5745ba2dff9@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
In-Reply-To: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX4nNqgqaXE+Hh
 jQyRT0mZI2r+8wHU2w/ndDIDBRyasNA+64SVRD/604p2gQVChWki/BuPsVDnAlYOQjsEsIxl0Eq
 h3mQeGK5NxDl3Ho9aNM1Zl11sjKuwiVjvNEzC7yvRCLySpbuAj+pGU20sAQLIT67GThmpcJJdo0
 JQdO4F+esENG+cdfTSTmp+l6ZdRJHzljmQzC3AxAJvR3UeuRVATxYui2Eg7kNYkZn2unaQF0qsD
 qHPwV08MrRIruK8DzSco+hQw1yiEVzACVqWOJB54AYFR7VRUjiynLfSt6r0NFMdT2ac1SxFh0oA
 21vZmBG23AUATgVg/zr9GehAzskx0uKujYnac8lKu0uChCVARouFNInQt8MoMEB3+DYgKoBumMQ
 pJdkUYOca6LDRKH23HDgRI1QGFccRQ==
X-Proofpoint-ORIG-GUID: 9Mba1qbKRTy5WEtx_3Z8-ny1B2m-J4JL
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ef0d54 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 9Mba1qbKRTy5WEtx_3Z8-ny1B2m-J4JL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

Add support for kaanapali in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2fbcd0e343aa..4a5caf54c116 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 925857,
+		.icc_bw_tbl.peak = 925857,
+	},
+	{
+		.name = "hf_0_mnoc",
+		.icc_bw_tbl.avg = 925857,
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


