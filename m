Return-Path: <linux-media+bounces-45893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EDBC1855A
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 06:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2EA7405B28
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 05:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7337E3016E7;
	Wed, 29 Oct 2025 05:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMjgnXd0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kW12P2lR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE312FBDFF
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 05:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761716682; cv=none; b=a8oKUEpp/zaJqqS3Gu9K8f+oMX1VjrREH+Lp3Ijo8lFUpXJ062X/NUPaZEc6bVJEDn5yUyKRgo9Tx/yP+IR3LW8HflvYC6g1wqH/fxcxnxTJjqXuZ8va/3MVg3y30c6oT7DwvTUlcAjQwkMKvsJ6NeqOIQZAf4QlX0yZuGWEfiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761716682; c=relaxed/simple;
	bh=p8ySBPeMhhgOjthdspe7wrGny1MNgnBjciz9CWlWZqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uexZ95Ed49p7uhKgJbozZJf2MtzTJvYynIf1QrCbiacYTXJDF70ZAmzLWUhLl59Vvl+yeMVnTsBKE/cdlfwj1JnuNe3sgn9UkZJwBgET0xEmWXzh6lP0nUJvc2B4L+xenKIbljLZbl4DakhP2jKI/RQxW9uXTq8UJ4n8nSUGk8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMjgnXd0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kW12P2lR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4vF2F3755299
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 05:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rGA6jyIhggMQN7nzJCboVgsPOrhbc0c0lh6rLgR6WNM=; b=EMjgnXd0HAQlHGtN
	GTy4vq4OMP3OlqZJL5apjN46DL5MlifMlyRhSCu0/AxWHetMLSeqQXN+Q27Mxhqr
	htgTahxy6uYnQCL2DGBJKUUULNeTUowtVregN2HDD81KcC+v0uov1QGSSBcL3vpp
	G6jVV8/NkoyT8EqWHdnoxfAvP3vlnvF5S1gY0Ls3nsjZCy5IoI0EAHWbl7vhtuJn
	Be7eIqRBmNOoKkHuRj2yXImvrd4wo2HaIy8M31bs4YVl9cVLJiRC++AS+a7c0XZb
	MqrtwAM6XuYJnce+LKgtVXoG46XiGqIVPuj64YO6Aw7zFVvVchz8xRr1xCjDQMSB
	8Ou9vw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a01bes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Oct 2025 05:44:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6d53016548so10313193a12.3
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 22:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761716679; x=1762321479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGA6jyIhggMQN7nzJCboVgsPOrhbc0c0lh6rLgR6WNM=;
        b=kW12P2lRpoo7JB+eF/Xu1LmeXd8nxvhZnNCQmgn+0U7lDtuN19pc/SJ1aVHvcs8PSL
         Xhjlg1V1C9a/EUxHWp0cUdv1s0HQEjuTiGAdhbrHZBdoYzWo+/a1wLq6dKuOraPlzngU
         kzXchWlz0w2KLiKDbE2+eWimvofh2fLrXgiUn1qQwO1ryH95E9e/r1c68DyyjSv90b2u
         vxpeTFtLzxecA0G/IDl50cBW3om0x8Po34ntdFn94E06o31v8fdSgE/WSnhaETAt/Mfy
         73TfMyue7i6/mGFD6yJbkZnh8ZtfopIHXXt9UKszSTfqsc9E3pOYDNrj5aX6s3/sL1CF
         V+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761716679; x=1762321479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGA6jyIhggMQN7nzJCboVgsPOrhbc0c0lh6rLgR6WNM=;
        b=No0ATo7JUOb3UZQSxfHScjvBy/+zbVtdatEkIz10vSiFKjmpE6iFSxU/l+BGeD+jKD
         d1KxlzCbw3Rr62g+kCbWWdy1fRzZAPfXK5NYCYmkQwFBthHFlD7cd77S/Y7X3OPHbjuq
         /IZyNCRbbvfSY2DyqG5IxpMQzQtO43x+VAtTH3QVjpajRZJaj+B6zcVJJzwQm7kBiC8g
         n9ZNNvodQqQHTVWQJX3ewNcZ/Y3Q/nnhJg2YMwENwDj7q5ckF8TZTdm7oMI/RtKdXwMS
         ilVLuwUcEARJZMuuAFVEL6+ueyJSZ+zpMTgOIolaW5cwcWSu3KjqaaSvnsdp58Qnqlyl
         M5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXya0ZODgcIl/sYJwtsEa/R0ewF2/kyOSFTeV2SEqPNohZnTLBqgtWSLf723IFda1jMGa80gzmIuSf/QA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI5zBq0WwmkLLnU9NK8+w467Gx0zARYjHmmEmYJnCHqQAnVaKR
	FcL/DC6fwjVn/bZCp8k6lrOmx6yXymZuoLBArPQ0WMvGjR2Qdl2cQkPjIvwparO1q3QBRSkF+4h
	Mw7hR6gkrvJc41/40NVcZ4tYLVrQvxbEQkrUsAppbnDhAtyk3J5MZbS4bqIL0U+TQew==
X-Gm-Gg: ASbGncufJB+3oPdGGqzbtumPsCSBnMQ3iGNvAZBqJmOFRhAo4SMQaJnGV5frgCDCJ47
	vycPs6GIw1bBZtb6jPSeKpIZPP4qbIMlilsHb00aY/iW/PPucvOlSKOktogPNRfmJeNpz+WiTpU
	dFeCsKhx9q7CRLFJHI9cMlPNXDaxJ+ahSsuYv3m+C+D5Mj3EuaCKKQPTQFVPdJIX9Qv9ktlaOmf
	oYQ5A2ztUlm8PfS2DV3rxC1qQxFqmUgVT647KdBjyX8hpMUZ7nJNJnIRiIvDaqmgf6495X+immL
	rvxM1G22ZmfrO8Sk2Q3CR1dMeJMxnYSwu/5nxAUZYcXXRgGA7xkAYVi4CNm6311yiMuz6zR0a2d
	X2MK5KRgrxzdcrF9PrOxZNvH1yKGvtjiqg3PBSWCx+n5tNeNyDMnhIg==
X-Received: by 2002:a05:6a21:3384:b0:343:70a2:bca9 with SMTP id adf61e73a8af0-34654128d42mr2160039637.53.1761716679188;
        Tue, 28 Oct 2025 22:44:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHL/mDvAsHrsYqZ3mKEmdPc4gs2fnr0PGSPRIa+7ron2IPWKz1ls32Vwt7lsvJWtlBKEzRPA==
X-Received: by 2002:a05:6a21:3384:b0:343:70a2:bca9 with SMTP id adf61e73a8af0-34654128d42mr2160019637.53.1761716678692;
        Tue, 28 Oct 2025 22:44:38 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7d1fdesm14280643a91.5.2025.10.28.22.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 22:44:38 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 22:44:12 -0700
Subject: [PATCH v4 3/6] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-add-support-for-camss-on-kaanapali-v4-3-7eb484c89585@oss.qualcomm.com>
References: <20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com>
In-Reply-To: <20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA0MSBTYWx0ZWRfXzZEbaKKOjzcL
 cCcTeJ2TLX03oASt4Jqv/WbCzVY283IcjwzdGsPPmPO+m+yDZJlXGi8ljx3nKzYYmMYd2X5HZFI
 osDuoAq02ti7HKwo2eVTpj37b5k8GR0/oL4V945XY7tbesg4nNg7LpNeJIN8or3VklcHYDRRh7t
 hD+g+LEsh2RVyl4EkjkkTCAqkdgqdlPiBJ3Xxj7wzOBAPK6AVCl00D8K0EDD3DP2wI56Nr8CzeI
 3BbL17/0n5CBvhQrE9TnLssMcastN3CE23dplyBqcu2FQmqtMxb5ifo4yub68qV9g78It8MreMt
 zjgJZ+mKVlTGUdMieKLs5tlpxviCpUaWTkAk7t3J2dCKuXdLxfQpkW0yydLKbzh6sXGI60NvkAf
 KiAOgrsQ5YmT1pPQxu9dpOwV1xuzag==
X-Proofpoint-GUID: -mtYVis_UshfYTaG4TkPfbnx8WwPM8i_
X-Proofpoint-ORIG-GUID: -mtYVis_UshfYTaG4TkPfbnx8WwPM8i_
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=6901a9c7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290041

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


