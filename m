Return-Path: <linux-media+bounces-50538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 206BDD180BE
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 11:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D747B3014732
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFC538BF6B;
	Tue, 13 Jan 2026 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eR8FhjAM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NsWWT0sm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352D833F8C5
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300116; cv=none; b=J0TPr71y1u+6m9HUw96iSfmHSCB4AeHHZHC1lUqxOgMC4TLHPuCJOp+Y68kBlmTjbR9VJEvL76Zf2G/tpmMC8cqieKTOUmacQs7hVVFGJvDn6r8Jzx8ey0KXO9B6PyfHQYOxuBAj/SGkJqrqek/xSFwUfCx0XnsszMmIT3KhOX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300116; c=relaxed/simple;
	bh=wvW9hw/aHeeOiWoGi2yJoeb6xxjCzaCUPzx8qYpTgL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tnBnJ3S6PWDfdjxnx2QOax2P1LWyvAYJ5NYISCkPOKNsIIaV9tl9/QVLDYM+n5OwLnfWDFG6J17aOQoWWQxhnEMMwFGQVaYoTNTzXfUK+sM6Opnm+SqS/X8iwtCKSQhrdGANB5H+QHK/Qr/q3+a6FDfO8kZyk8Ise8nkWVoBsHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eR8FhjAM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NsWWT0sm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D597v72835090
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	djk/VNd2QSyawjye+VcPas7C71Gc44XxqkCzjL+Ykt4=; b=eR8FhjAM/IcM9VwQ
	3OEWbPVDmdTQQTUCJCSvoLXVSckJCNQJZwwo4MN+WS+C8yUgD0FDe0l+C8Ic23D1
	+o2JVvZOCpAwfyfVpCrup3CdiL30nZ8JVXo3pZYaVo8RSm2dpCmLvgQ7bHheIZG1
	Z+r+jSlD6RGT8G5frkEUg+KUMRW8eXcGsLYzItK/nJUGcIH0g7XKTWjejpWxq3QC
	ov48TH17MAwsncnpHQu2aPPUC+XwMGBLPrY3Fb8NPVjrM+VwkAUSI6RDj2V24+XI
	3GT5QEjzIoSDX84RV+/KTG1RJdg63GB9Bb6eEAAhLhHBawOidSGU3auSP7VeOVdw
	9y8gvQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfn9ry6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:28:33 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-11f3d181ef2so41793081c88.1
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 02:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768300112; x=1768904912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djk/VNd2QSyawjye+VcPas7C71Gc44XxqkCzjL+Ykt4=;
        b=NsWWT0smbfMrqWEf7jRC/bXr85xpp4q5E42iCibia/drqHJyog649klRRZX/l+rQo1
         ecygXSyORtMh2vf5gEB7jCWaZVQsk0Z7qkC1WdLY4yCA+3xmi/TiGAM407fPC9udF7io
         v/aXptUB1IEeR4roK0dyh0B+4OAkhEOXi81ujc/dWEU0qOtVICCMCBusYvfz4DIztX/x
         vcfz3yTXeSatORKTNlBtXnOv6juuqelJTvk7Z68zihLoF/ZbCG6yaV0lRqd9ugyBBKAx
         MbDtDoeyJh9zbyf9Qq58It9L0+heLVMaEsZlDTkRy6E3E+xILfWi9JvBliuk40crou6r
         Y2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300112; x=1768904912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=djk/VNd2QSyawjye+VcPas7C71Gc44XxqkCzjL+Ykt4=;
        b=HADhzo5bkPtXL1pusC2gwQ5bPA1UczthbM/d0uIt9Jp2061za9gX0QJQmZLE6npXdt
         9NRSj/Ejyd5M1NTwP63kaWbOwEZ4ACDMis/S2yD8A5iSTeXcumjoA2Nh9ma9G+WOx0Ml
         dJIcc8//4bzJVrjJzp9HlXpnW6vDFcU7IDKIIjdFkG2gsWvfdQy6NIGxDUr5AgN8qqcJ
         QjDUAuwnTmTU/sG1LphaJcJB7pCqUHVy3o/OFSxa5WDF1g1Fjp+N1JN7ze944du21afm
         7wYzWi2zYhcCz1Zcjoc1pgw/F08HCwocEQyR2wPFaxQ9Utly5CnAzv/zu4m0JIs8dYtZ
         PCpw==
X-Forwarded-Encrypted: i=1; AJvYcCWVoJ630pNnxQqrk8DP+RRn+D+HTSj43m4ZwdbVfFKrP1BWM+wIzIMvrUpgKLmo9UziXEeuHYcjHAOdKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLem4+S0suvKdP+4KlLHIXzVMtNLaHdUvf3sGcPTsvTDrvP713
	/QOBm+pxxEC+XFjb8TJV2UYB8G+xMKhMP2vawX86Mr59bmT6M+0u6jxd9pSUakPs+enMoY5FiEH
	ewbVv2VaVKuPgtbXZTEP6xbFbdGG3UAesKkG5fCqrc2CFjd8CpdY9r9QH5bl/6ATehg==
X-Gm-Gg: AY/fxX6ojC9jFTLcX1Lb6TZKbkls2OtPXoYsmPmzCYLWlVh96qg5nXX1kz+ke5rLh/r
	7cdncDCILLX4H6RHCNUjLd+xJLaYHLJocg3OPlMNFGsGKbLrDcKzjGlCHp8VkhJt5GvOo7hoVGU
	4RYVc1HEeNf2YGF61KElIOZ4skRC71uxUtIpHNfVgyH16lwN3cXwlKwKFi1SKvowrcp2dYyohPr
	0Sa9S7/ZSduWqGjBijvWaXxsW4zdeVwBIaHSxCSmS+tzQubdDoN3cpb/A2WwV0Mr3+Uzn2l2/D8
	ElgFFifK4aFQ7r0MH/qdKgLIAXFdrDhvMicCCFEYVzz4Tqk50xDDO8S9ev1zWiTOiNUaLH0Na3L
	XmIb2m96TbiObVbs1avNdz9uxqO1x/FPo2lS7i+uyWKXaqGDpMrXIBYzn5EnATerB
X-Received: by 2002:a05:7022:23a8:b0:119:e569:f258 with SMTP id a92af1059eb24-121f8abb2c3mr21786587c88.1.1768300112175;
        Tue, 13 Jan 2026 02:28:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFL5DuQsGhc6OFtFJIsMVvV9xMJhRqjudlKRzvjjERuNRlLaKuDKYzPrQ8XWrzZuOarZWNQwA==
X-Received: by 2002:a05:7022:23a8:b0:119:e569:f258 with SMTP id a92af1059eb24-121f8abb2c3mr21786539c88.1.1768300111621;
        Tue, 13 Jan 2026 02:28:31 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f23b798asm21162429c88.0.2026.01.13.02.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:28:31 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 02:28:28 -0800
Subject: [PATCH v2 2/5] media: qcom: camss: Add SM8750 compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-sm8750-camss-v2-2-e5487b98eada@oss.qualcomm.com>
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
X-Proofpoint-GUID: -QZmQ5QdoknXElSdjdeGUz90cVTBm-B0
X-Proofpoint-ORIG-GUID: -QZmQ5QdoknXElSdjdeGUz90cVTBm-B0
X-Authority-Analysis: v=2.4 cv=HN/O14tv c=1 sm=1 tr=0 ts=69661e51 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gE60Ov1lhapgyOv8Ur0A:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4OCBTYWx0ZWRfXwYY3kLZwIEb7
 waICEfv/H7Bb6Z3PAa5K0txoaCcpjwJePodsH2Cf4dgyrX5zJGeT7sIXJbVbYMiMJ6XiPos5Df+
 N1sptre+0Pcgmc93RHT4YV5LGaRftWj/Jcf8fYtoR3GbsMVVoxbeOpfPMi9ylnkkYlmunUe37Ho
 pGf0I3ld9xPZ5PvDGaCH4DGOEIBhy9kycIIcNQ48LE4c6QcE81bXXGiKhTP2vqRJEpvf7I3Sqrs
 LjZyuN71dj5ASy0V6NaVX4isveU/KTFfE11FEfKOaljd60B9IooyAHTr1ISFi+vIDUc8wmnNf2r
 FU1j1UcbNnlDuOsgLQ9Ie8DMvirSW59J0qLN9jG3uKcYrrZUfL0LdvNtIKUjlydVEr3p8rfZkol
 3Bl3IusUoUaqg7ymBR5mvWFYYhv66b7IfceftBBQ+lo31E7rsKMNNhPOyLhPoGH6dS+KNS0A0N9
 VUePfJd3M0muUQcZcog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130088

Add support for SM8750 in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 36ff645d9c1e..56f20daeca3e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4066,6 +4066,20 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct resources_icc icc_res_sm8750[] = {
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
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -5487,6 +5501,13 @@ static const struct camss_resources sm8650_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
 };
 
+static const struct camss_resources sm8750_resources = {
+	.version = CAMSS_8750,
+	.pd_name = "top",
+	.icc_res = icc_res_sm8750,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
+};
+
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
@@ -5518,6 +5539,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
+	{ .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 616ed7bbb732..2a53524dec93 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -91,6 +91,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8650,
+	CAMSS_8750,
 	CAMSS_8775P,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,

-- 
2.34.1


