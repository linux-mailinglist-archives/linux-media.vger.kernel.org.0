Return-Path: <linux-media+bounces-43114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5860FB9CCA0
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 02:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDD012E1F1A
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 00:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D2A1EE019;
	Thu, 25 Sep 2025 00:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfZv7oay"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813A71AA1D2
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 00:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758586; cv=none; b=GQIofyEleBJww6XE/UoPOD9bX2ZA0OnRxwR1X1z+xnhOVb0jY2QQlTOoSZ/8rnQ2DD5Hr+BQNpyIelH95+tJreGre/v4qVZYeIIT036DETyFd+yjAgIrHoIxV9iIWBHnVB5k7vvWcJ3e9LoeFAmDZ82DH7CXcHZK1STRbF1HXK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758586; c=relaxed/simple;
	bh=RpsDt6AfmyJar6HaUrbvvM9UHQECfIpfv9kFh5VPSdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AIx2L+MGuqSQ6M8sX5sHjgGXv/vswbDtl34UElOI9wqgi+DXGFO5/+nmIIC6A1XONmTF5LlYQVCSB8uHiaStmRXkcD2vB7AcNG0GLL6eXBnHk7yL+Q0s5Qv+sWhadF4jEzMLP2EyJIVIau4CzbWmn9pxh5zt8sVBnEhPAw6gwtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfZv7oay; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONeXbu021569
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 00:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lwkFrLt9CwZe3OTR8N2fT7/T3WpENDpj9uT84vDktvs=; b=mfZv7oayTPWKte5b
	DUFEWdNYEiNo/9Dz97qZaaHLZeHx6Wv3Jvzt9IGW+iWK9BmDm+AZseG0/TI0HJPM
	hEgxThrxj3BkZp8qtqEDIWF/QNn2H8HmA1W3tallSFix9TEO8vuihcjccnRDUxFL
	qDsi4M3wwthPIamsh0l42jlnT5vxVc4ipDdTlMjE92ZZu1sQQ+eSuLcXUNEWAxrz
	Z0EG7TVrzGLyY3DA6vnjQCtqCcdwbJZMF0v00BGjM77vy0SS1ma6JrDZfbx/eS2V
	WUm+xHvP9dDQo8S3LuhcAyX11xrYLtHTyTfHdOcqykn0FckYHhEt7D9C0FGZdPRC
	fmWlRg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49budadntd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 00:03:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-269880a7bd9so3659185ad.3
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 17:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758581; x=1759363381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwkFrLt9CwZe3OTR8N2fT7/T3WpENDpj9uT84vDktvs=;
        b=f4v1me0dKdcgjg0eEemmLrU4Oow2Zcp2aXJzXB/uG2dnNHOU+zlzmJsmgCRI+gGI8m
         rVCx8OiFGukot8QT+K0tgk1IpazVAt6xcyIgjzSF1SvYwaR6asJoroAcw8b3R0Jb9YRW
         pFYbrFkXgTzvUqgOynsQMAOo8CxPZE/ammfuFuNapG3BLUFISKDmGdQwcdEKX15yiwaM
         9T1DcM7cbg8ANs49MadN1UuQLxIpjNo0vm+n5e0ggekEpi4/ag7tSFrIRss0SJFdkUYF
         IcTxdEjZEo0gYAGdutT4km2mVrV1HLqe9oktjPIcEN9XXx2A9DnMHwm2d8+xsE4OyE/3
         z1gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZxpSX7/YaqirGGUF2Pd7tMrowAQsz2UyOrP6oH/xOmu7EIf3k2JKOcMXcUxAXCFzMPThZ+kxXPhLOiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywis+uKfWA0QNRtCRzCAVTLtP27C1IYExEewV32kkz/FHJFqUJW
	7OipN+mew4HptiAmiOOsXvNj+mZbFBa9d2TAMc6FBYxJkHsyeh87TDzHpd4T04OXaAJdtN/dS6H
	IHNEnhtKJ7ifm+YqVNx669wttyGrBEPWq6dsTueNlWqTFZuNKbau40rw84r0k3666xQ==
X-Gm-Gg: ASbGncsoqox6GyuXP9zKr8QOJZRouZ6Ku1MGxKqv+bfRYuyDgd/PMAcX0L7OaSLE8T7
	iqKIrDkFgsSnHvMeEtKeGV3TByriQ8os9cii+6+zOH1AMpO4uNoO14qoCXeRdAFO9F4TpIFvrhS
	YB2yN/Wo3R5y1nuhwonyExaNxCDRauy3trn/q8IsZ4YZdLeepwczX91j5UNsOe8HuAa4LGpIGzm
	k37O4KjVvLyOQiOL2VyXtCi+9n3jcBPztc6fToldO+ZnEpri6ZSdggozJ2RwRejLN3FRs/prSju
	PdQa1qcYZGxkpecJ7wb4M1P0NIhrSOIenDvqrqx0GmE5oIRx21bdofhvSjb7KTE3Y9BWcVc5E3h
	865mrRHongthh0FQ=
X-Received: by 2002:a17:902:cec8:b0:264:5c06:4d7b with SMTP id d9443c01a7336-27ed4aab67dmr13116335ad.32.1758758581103;
        Wed, 24 Sep 2025 17:03:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg4OYy/wcHEm80h3cy0Kv7xZ4NhAqx6tS9+1F1Vhla9mXFmSnekp486y3cB9xDJ1tVDQQr9Q==
X-Received: by 2002:a17:902:cec8:b0:264:5c06:4d7b with SMTP id d9443c01a7336-27ed4aab67dmr13115885ad.32.1758758580513;
        Wed, 24 Sep 2025 17:03:00 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6715f0esm4807215ad.52.2025.09.24.17.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:03:00 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:02:50 -0700
Subject: [PATCH 3/6] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-cam-v1-3-b72d6deea054@oss.qualcomm.com>
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
In-Reply-To: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758758574; l=2494;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Kdys2jJmwooCgeMAOsC7UrGVCJ/d9/5ByqD43NxfiGM=;
 b=lI1OzmIm+8NBUdhLMPuCT+AEpT0VAUkp8LHFgV9xz+9+b52RE+rDo/IHJjYNBOenj//hfFqKp
 a5dpvmn0TQ2CkCmljxrEQd+wCDNtdG0OUxNPKOQkip3veQrAXFMKdnx
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: vkOp3ysQPQYDlqC5I_occWlH7kpvaIvR
X-Proofpoint-ORIG-GUID: vkOp3ysQPQYDlqC5I_occWlH7kpvaIvR
X-Authority-Analysis: v=2.4 cv=Yaq95xRf c=1 sm=1 tr=0 ts=68d486b6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDExMyBTYWx0ZWRfX905Nr58UpbNp
 n/ACzfxfmRVPK+hFo/wfUqa9dFD5Z1GNzZYeQhpz54hPtnAFV5lOzfdYZCA1lmMml2cl3tGk25A
 LTe2tx7/1DhMx10klnxIw4App4j0PWWA68lteq5zS8nC+YmcQ0cZ4VF366p/kTLMNF/kMsY9kQK
 R0UmA9/cQzAhOSwnv0SKB97HIoiYSs0fj6b5mdmk+YZ/lAgTiUXrHxy6E260C5MgL7iCEo5r/50
 hS32iiATeJ0Vbtr+9htZXW7DZBIuJjjC0DOWNPi4JdHy6E6pJqZbQHsiUDxkOk8c4fOm4E176H5
 fu9npuhxtfqAddmvqwv/a+DrWqXvodgRcbDRbwWeSylr6nzbsG+AG0YqIw4PVNXj8GgyaaW/Zz/
 opMwVGo7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230113

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add support for kaanapali in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
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
index a70fbc78ccc3..9fc9e04b9dab 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -89,6 +89,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.25.1


