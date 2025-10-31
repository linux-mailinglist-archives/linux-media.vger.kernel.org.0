Return-Path: <linux-media+bounces-46041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 410FAC2319F
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 04:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E7E2189D524
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 03:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452063148D4;
	Fri, 31 Oct 2025 03:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+9/4PUX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZMmJqbKF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A55A254AE1
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 03:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761879618; cv=none; b=DWzaL/AnGEDk56bntjT/vCZ8qRm2LX811xj6no507NMoxcgZuAOX0eSLbGK2U7dAq0r2KCS8rbeMdz3BaudeTD+Gn+jl0DVSZoxpQfUcXepdUDRG/95icfNFw2Cso9EeYa2zHJEa0s/cxnoGjA71d0G2+TA9mdltlYQLJD7KHkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761879618; c=relaxed/simple;
	bh=TzCikezoRb8YZPqX4gJvquc17E3NxM8qIn79vKmmi9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O/HiIZ10xpQL1Y0wkwb8YJ1dWoFUvZHi3Gza6rM04hE0tsYoY2DCNYZP6vqxpa4wJ6zHZcgTzBmpxgQUPZ9ZG7+7icTTh+/7u8V/gQNPCCsoEZi6PqAyGlu3wZu1DFp5NiBwwZkyIkFC45p4yzZwqdgsaGVckDcbVnNfoeVAaL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+9/4PUX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZMmJqbKF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59ULCZOY873191
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 03:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KsRPldSlUkMNAs1cF8LcZleWSjUF0Z6b6sQxevYn+vo=; b=V+9/4PUXadBNmWDI
	YQZUPLtSVzLApkaz2Okm0qBlnCR3ogbEtbXNskv2rBAP7XZQrn5olQ6KyBu7Gs+N
	Lj+Vm//Om17cVVn9gGHtM+mu4akLeftRAot462uC3AodO9BQyVkXqhLsA++a76kT
	BYAUz3y/AcmZzMnZ6afa3qxdw4IItBfPpmRSEpulwIKKr3WekxrlKihrBq6yfkZG
	aaUUt8UI1c2BWMhzSMv3smQigOcFf4p+msBQ0zJlnYtFo3AdUBcA2PktMb7Ga7xr
	Ly3YtTSVW8PQokDsXZohL4lATGPztp9TtqLwkNiMKPmK+Oh8BXUNQNBKjiZMe15+
	gwie/Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4fqn0pas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 03:00:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7900f597d08so1681285b3a.1
        for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 20:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761879614; x=1762484414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsRPldSlUkMNAs1cF8LcZleWSjUF0Z6b6sQxevYn+vo=;
        b=ZMmJqbKF/HG+Lu/Aa37hotHxD3YpDwtW2MVFSpCiA/KEi9ySkg/y6BEc/gAm3icp4g
         2n9cLdo6GxUfegAvzXIBvG73DE1i7MzrmHzkKt5n8IFX6+UgXi0OUWajuM0gJwUgdFBO
         SQ9PDpMVHsthUjuz/cuFhP2LCtGd3mhc/q3ESqjWHhsXJcx5SAQQZXyZeKVqJFpPadT9
         BuHjVp+BB8PK4NjpFeDcjeOX0XWO2GHhqqv1tIBWhBKnYq0MLTyYNp/8DQPNescVN1uT
         lEpdvkmrD7AXjmvH9bQ1yxfPVXiD/tuoD9tIKh8G7xNVWJ8PFdNXrQ4P0aq02EDmxRIv
         c/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761879614; x=1762484414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsRPldSlUkMNAs1cF8LcZleWSjUF0Z6b6sQxevYn+vo=;
        b=TQ36grpOUjO8rEmugau0/bda1ziOAB1PEWk5wrw5qqZJEIzZ0aJy2YWe4HXlbjLUT9
         9CpdY61lgecZsNKD35qm1UNRQJmlo0TVMBFblckyV5Zwk79jhFwnTIQHb9JSbQ5o10t6
         8CxJdtZiktBvYK87s7Q+8pLhDqX+PjnjlhU1b4ymWUyd1H98Xk6TFbejpfi8f1o+oy7j
         J4N9wVlGtY0OZaPr4Tb0JHGjhVhmgv0MBbyp8uOykTPG7X0RlWPr6KaTplDe1LrNu36N
         HjUjIaY751hl1QezTO0IOCXX0BzxwWHqFJds5WBcvRCO/KaylZz5SPN9vB6LJwcAJYAK
         QQoA==
X-Forwarded-Encrypted: i=1; AJvYcCUJkUmdVjbtEvPhXk6PcPenhEA1W/fmV7cZKRsu/fYDfg+smdqPFuuOgoizL2r1Tme2CDpKT9jsuZXFiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzENQYsfu6h7Ad4mJBGnxV9WfelSCh/S8M42SWaSuMaoDkE0IG2
	5DtCMCeSg4qwFOhT4LmPDGxpdDme21MpTMjTkPqs168wK9wHYzJsYz6xREC9vGtLXOgOV436mXN
	KdSNHFm1E/Y/Ubf5GTLpcDEFJGaZYuTwQmOq67XeTCZRFzBJ+rRX39bgFZnt4AHvaA5wQDCOSIu
	mziIk=
X-Gm-Gg: ASbGnct1+kP/KJEMRMkgjIs2YYbHFdwEbIOmNBeL3KsUkRnrkyHWv4CBdNsG8QvEjA4
	dZOCntHWROV6xqGatwjgUJMe/ZwDE94c4FivHIP1jTFRmGCDQQxwg+lg8V5UXGJQBKGTi51SK/S
	0hAk5LxFJoSo21mY9MDdfK9qPAN18Xg/0ckRtCWeiYveF36u2Sk00ZPaRNYU7Mcwa51+hpYs5PZ
	13VbgLhFJxHMzZZm9Co7d+1viskUGhbXbf0tF2he+82Ab0KhbfB5f/LmBTFsUfv8T9z4oK1mScS
	5z3MNz5V9mtzAJsaC1rZkT2WDGPRzEBRpCQ1gHVdRmH5SZcMmkzuRX4MzMonjCc1hoNeWGzBmvD
	CSDKxOV67m/nfJt1BJFYvG9uaE80xdJdCffL8RXzX0FOc0rKl10aVow==
X-Received: by 2002:a05:6a00:188e:b0:7a2:6474:f86f with SMTP id d2e1a72fcca58-7a777760bf7mr2388463b3a.6.1761879614028;
        Thu, 30 Oct 2025 20:00:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+uH8uZfk4iNZ4q9rsi10JrIQrjOPeeZkXMJPeDGql8NO4shm6mtDRRlgVtj3gr8iSqv0H8w==
X-Received: by 2002:a05:6a00:188e:b0:7a2:6474:f86f with SMTP id d2e1a72fcca58-7a777760bf7mr2388345b3a.6.1761879612949;
        Thu, 30 Oct 2025 20:00:12 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db67cbdfsm352570b3a.49.2025.10.30.20.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 20:00:12 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 19:59:50 -0700
Subject: [PATCH v5 3/6] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-add-support-for-camss-on-kaanapali-v5-3-f8e12bea3d02@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RL2+3oi+ c=1 sm=1 tr=0 ts=6904263f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: h7sB4IrXIKYXDKhJj3iVZuaRzeWWclX6
X-Proofpoint-GUID: h7sB4IrXIKYXDKhJj3iVZuaRzeWWclX6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyNSBTYWx0ZWRfX9KNweWpU6Mbr
 paqVNjWxbn3k5H6IJufXxea+SqNScgT0VqnpJ4r9a1d3esQjpyZzAfUWZVNBDRWE6W4qvlQuk8F
 S4lQSDyu940oT/YdRYg7RvR2EGl/0tYxCmD6zOZLv/oSmhVrDErmjOZXNzEDkf6XNprZe+dfrgK
 FtFqeOSfterzjA6ya2UCrYzxMuJM9zIVV3ePFyCcMd/R2cQM9nLUFjUsyYTe4bHmLtxzw96mdzp
 jYZ3+gzEz1chiMhAQtcofebTTdho7d+g6Yyr0XjUWQaxXsZUEtcaAwSGtAny2AKPODBFQDBljFb
 lbYhMum79LYDEDInTC8ypzyVA/XbTawVOJifA8QqGQeTJsKABwnfpbUZPGREaziEfuaCt29UeQv
 5Sc6WWpqNjm34e1Lw1jC3kbyg2IWEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310025

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


