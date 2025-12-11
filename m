Return-Path: <linux-media+bounces-48634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCA2CB5BFB
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 13:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 956493040A47
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 12:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0416330CDA7;
	Thu, 11 Dec 2025 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jt+M4plp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2Ai3Ik0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6286830C35F
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 12:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765454634; cv=none; b=IiCdwHldTOtsAR5jSwaQpuQ1JRogYt6e5xoJszJzVrJKf2xWBqDtH2P15xp+03PE9grNS8/6h9zSgmxDUb/AX5s6AiXOOlZOUiBnUCTbgFoBhnm9rjs8GCXdWlgerYL5V60xTgmgzFkZTLxFVXcDzm7CxX037xZSVPopS7eJTXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765454634; c=relaxed/simple;
	bh=3Qfyj1CVAZVlbnhuGUNbDDhk6Hp1O6OSsAfi8HXmhpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cm6kiU5amgEJEJvSirAZYuOu+GutHqX8vRa9GwHz9BtNR72MwAUp8+i2fvBUqq8z2pTmCpz1E0o+dwQQcdDT8TTnDvsjXe/hzMoFEysZO931jfh70yeioCby6kBuHsjW7RrVgD2ZTKfPqZydD8fUsDpB+V/VxN9bXaRsfmpFAwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jt+M4plp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2Ai3Ik0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBBlGQI1687143
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 12:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1PXK3yWZKrq9rrT1XXywuoMHxSRm8iwEWtPs2wpTSIE=; b=jt+M4plp3wHagDZO
	sAtgvFwToIM8+C4FRSmQIpZZBJypAW3pSgPHQb8AahLoAHiFQIDSvJrcBPBfGNBO
	0s17xRwPMgSSHq0ZTUxQMbzgkQJJ1qu6ksWqeONq5ZMluFRJaLqA9TeSqJ2VOBAF
	Z931Gi8FGNGp4BCoCEedX6bZR2ar4EJzqAqyePEX6EDey/WBTHBSGz8xi1Vg1TrH
	v8JFKD8lJDhZvQeZT9UhHlS1A8aleF/geBloF+oObtIjW7WWRzRXt5IMXnePltmq
	BGPU8/R7ElTABTPzOZgnWEx6g0PC22YB0teZTyJyj2QE1SnCO8iFqIifV4NkhzrK
	bdMEKw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aywcxr1h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 12:03:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-349a2f509acso1781377a91.1
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 04:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765454630; x=1766059430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PXK3yWZKrq9rrT1XXywuoMHxSRm8iwEWtPs2wpTSIE=;
        b=f2Ai3Ik00Lny/mG2BeVTvIyp0cZebjTTWCxOwwllwQzTPKOdXb5MjUfTnXDiKkHgu0
         5ytBS71qPTvz+BVPT2yk9yE+GftRSy9/2asE4C1TZMKFdFSrdkKws0ou3O+3weaJTmM7
         2UYVDdpgJP3gWyU5f2j5Pmd+QlHGWi0mdTup4gW7OBa8rfbxteRFEmTeZcNgpm9mQLUb
         UixUrPmZy6+pb0pEFqzk4SnXcW2+UCMMl+0xKfvcov7/fYGlasc8yTwAOkzAQivtkHbk
         MD7TlkRgGXYG1MptvN+1rCzzK4RrEiEJgqufyZ3bLwwe8gVZW6gfCqMjGWY8l2bad6wD
         UVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765454630; x=1766059430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1PXK3yWZKrq9rrT1XXywuoMHxSRm8iwEWtPs2wpTSIE=;
        b=pgvjDJY17NvmF0nW2zqlBvnXNMQ2cmqAlMpKZ3JsTNr3aA3jn+hZ/9ZuEusRRbOvxw
         ll8AelZEJMatCBLFHS24KdTooJOMJgTckDh4Hyt3cIz5bDqmoukFRdNIIBitIzxzJC3W
         pKgba/kIVulfXF+DoIcDhS0JmgzuHl7tKOw+H+rmYLpsJJx7PiH/92R9Lvqj8txR96Vp
         HsYUDdjPainmrFEOheXtV42DUSZtcI/vRl2/ckY/s4VlYTOqZeV7af5ydERg9spC1Clj
         4V5k8PHt/f3Alx+xlAbta3C0/WyO1sXHR1N9v4vKIQ4ZPmEwE5BqPQe2HNYchYyZdR+g
         ERCg==
X-Forwarded-Encrypted: i=1; AJvYcCWrB2+yxsXmh1iXRaSuCVUIxvHA81U4LJgPSnu8D//nF5Otv5H86QDJcIL0N7MmKF4q1TTK7iyOYdLomA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMk53UeMsVJPjisWliyDsdaIDjhg/IGL4rPUXEvCJZbKSzML4Z
	H8UBpkVAhQjYJ0KfU0DyvttVjNB+uAP0UKC54E2ja2wwfJdcEnzivg/TAdVB9chrzw9+tIR+oEP
	mObbAYfPwczB638/EMDO67lCqWCE5PPxO8PXUyQ+pYSi7CFiTYnlO6qC/lXg4Wb8NmQ==
X-Gm-Gg: AY/fxX5DleQRIruVuJaiV9xHNzU9aLwqPcmew4bWVIPJA/hrtdTaqsw7tB0EmUBGn0a
	fvugnunv4NDkhVkPoHy6gUG3PKVnVbJ5o2+dD3daPLbsPRxMUKFitGfLL/xp7aLzjQEIEkjMDpp
	UlubagTogqntGvvNUAj652+bOMYzg1D/wosNkjaIc/AYVK/uzzmnOjHojXDawulCqhaPYzxYqMK
	QVyu0knUWo/j2PbHXA6iQj4Vp1UP5vofaGpIZlWdUmxPDAO2thh4FbrEGzckQk5HYglf+cBDSGQ
	akLU/d8me8chSeRDz2ELBNmjsjK/W7eMHFxIoNIKsVsG2BnNYmuBhU4B5QCwKk/KGwby5i4nvtw
	kmrq4zLBtIzUGGoCEVeymet7m7ZH2KpR2dmeoFF7TrQSj+Zc5r+Xy2L005cDM17uj
X-Received: by 2002:a05:7022:78f:b0:11b:88a7:e1b0 with SMTP id a92af1059eb24-11f296b569cmr4947161c88.26.1765454629607;
        Thu, 11 Dec 2025 04:03:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYQCJ62GMHwexp07IY/vzn26ib3jEDLoc6zwD2Xvd7TC+VXK4/n5oXUgZTat2nbQWutBfQFg==
X-Received: by 2002:a05:7022:78f:b0:11b:88a7:e1b0 with SMTP id a92af1059eb24-11f296b569cmr4947139c88.26.1765454629041;
        Thu, 11 Dec 2025 04:03:49 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ffae2sm5924073c88.9.2025.12.11.04.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 04:03:48 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 04:03:44 -0800
Subject: [PATCH v10 2/5] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-add-support-for-camss-on-kaanapali-v10-2-39e8874dcd27@oss.qualcomm.com>
References: <20251211-add-support-for-camss-on-kaanapali-v10-0-39e8874dcd27@oss.qualcomm.com>
In-Reply-To: <20251211-add-support-for-camss-on-kaanapali-v10-0-39e8874dcd27@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=S/rUAYsP c=1 sm=1 tr=0 ts=693ab326 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HEREEm4myudZRjOc48jmtLFaJpn_lSee
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA5MiBTYWx0ZWRfX2xL8YK5tTcfX
 96mEo6Lf0Z+DOZrg3Ggc0eWMn0LG1PHDwGcqyxYBbk7Lis03BB5Vv+Fz9TdGRXWnHHlFS5qbL55
 MGRmo+bf2wsGnr8pM8Jmfpoz7b0wyljReHvHeHU751Q+OtlItXu2LCyr4BlBE5qwxPUQ/N18wsh
 teInFvPH3aDx/SzDbDOj+SVWX3lB6mJwljfVdDhYkwrQegfv85FhxM0UwHeEgZXqfG2y1j7PQyK
 aI+AiiRPfsKnuCs0nj1lvjsQ5nshFGBjJiy0UTQe7wACiFp9vWzYlboAayN3m6aFR6ANhTjoAym
 1wp0dm/M8cxrY3QHSerDc88tU9W/56Qn2pvue/c4X5BKbHJyt9oLqy/ysKsnHKUTbrMRJxZkKUT
 l0kxx+As5t1bI84mLndS1qvwPBWgYg==
X-Proofpoint-ORIG-GUID: HEREEm4myudZRjOc48jmtLFaJpn_lSee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110092

Add support for Kaanapali in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2fbcd0e343aa..6388897c5fad 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -34,6 +34,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "cam_ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "cam_hf_mnoc",
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


