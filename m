Return-Path: <linux-media+bounces-47746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A50C89016
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 10:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1F97A34FD2A
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 09:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4591731B122;
	Wed, 26 Nov 2025 09:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="alAHDnNH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixls+7yE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370AA2D23B8
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150011; cv=none; b=THxZQA8oOlOf3TRxeyrumpK7U/tXl4LepA8x7865KsaZCyXV0MoDTJCE2z40s+0xtG9YuV5Eq+eZwJiUiThZJkGv4Ql3EIC4QrzYbf/9yHUqpgQDf3WCIED0umy30iexGWTM9kDtQisUXeGAb3UADAjd05Jotq9PgIZs2IMLxSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150011; c=relaxed/simple;
	bh=P+4vSBemr+XqaJS5CuSjW7s0tLIfkJf6/LU++jjhoLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uNQ67BX76ClKkabYF0WmXMFFXfhwsPe4MVdYs1AKYC9GVJBfe6Us5Rrko9WeniJVpeh+eAVTOHCC4vbgmh/2HLogGmAbPeFZSmFsP8Cy/XDiCwjz7eWlaZmQz4d+9A8Zs7Maudwtgcgkstiv7ekFbsN4LToZadQrOq6GVHdWB+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alAHDnNH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixls+7yE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ7gC0r1234719
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 09:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XKAXKIppPV+HGKkCBU59neJ6pS20d5mhwPpNkrTkzMU=; b=alAHDnNHPMWwDg8z
	x4fdf0eEq1OZqpjqMepI15qHoHSMf+YqhR0iThAlFU+A3N0yYVkNwyhKlBEy5idz
	g+Om3mCzCe5paf7hXQDdf644H5A6N/GZ6Gq4i5oQhuajqHhdy8S3gtDsgnvGOJ7/
	9J5HGsvTWhdx7+wfMNRspWEBaTkGaeVnOj56OE3ppFpyU5MWCIZaas/0uI9q3cHJ
	7lmMHWEZMykVtT76p5iPze+gNVKykGog7io37IalVOplZSKLfk64RRjwGyPNRnSP
	jzgNQzGXKpMKanGgDcQKooCsw7vf3D1c1n4++v8FNH64Ox108O1JvZ3FmbJZ1BJ0
	MQ+0uA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd40by0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 09:40:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6097ca315bso11425772a12.3
        for <linux-media@vger.kernel.org>; Wed, 26 Nov 2025 01:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150008; x=1764754808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XKAXKIppPV+HGKkCBU59neJ6pS20d5mhwPpNkrTkzMU=;
        b=ixls+7yEuNYEBx9sN9Wzqxa4/dsoTW9DIHsTWsu5TpfwTfHb+Q/5BuRO6Yn3jRQTDS
         0ipF3OACCYpF0devPn0aLtIQh5MW9MXYUsT5dpOP4vFzZeD4qTvw63O3wlzQErMrTlX2
         n3fGcG3xfwvXAKBzKGtfY50ch9PusyxKa2SP/GQ5FFW+7gdRpZrFUjq2335INrdzrQG7
         lpZ8dheYZi6E6zDmWTEyZEzkqKLcErmwgH3UCLI/3NOho6cSxPkbRWZe9vNfJ2WuwNdW
         4FrABY16vb+8+ncSpXbEI+TYrjRAjXwCW7bf0k3tZO2bC8iYluzSy4IeA2JrPs6/GvJf
         DbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150008; x=1764754808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XKAXKIppPV+HGKkCBU59neJ6pS20d5mhwPpNkrTkzMU=;
        b=e/+bvGg1gUK3ZQVqQQ738pWZmQZ/04kamWetQclPj5jpc220D5qZmhksqcqfdZi2XO
         gY+J/u7GkWywXgJWUnWc4riO3WXisb1h/fnMMul741o5jEvyyjQs61rSpnsztZUSkOaM
         WHoX87iSYAWRQo3L/SMMRxL3yLxgx8sA00isIUB0C3XJb1dfdq3DFnKSps9fI8cv5ytY
         0teubpsmwO8GEzpn622jUKBK2SNuymzy9mRFH3PFF9oYK4tLHJyCojvsaneztazkoA9L
         6tMODPxX8oKlqRqxeQhyh5Da/vGg3uTUJfFQqhp7KdkxvkgxbVzK8V6v80wyY1F0vKJH
         j04A==
X-Forwarded-Encrypted: i=1; AJvYcCX3DMczssIC7k11PjN1qRZUa8ea5L4c/I7V0qK38/TMq9Y6f7jweHuouH/KrkL6B2np9unbE2MXk0XS6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzop6jrk8R1ft+aUuY7qQ7bwsbgzfJax0e/wX1D3IW9mVGXk9TY
	3YtCAiGeXKjXHKiUV4xQc1cyZT6/OKQljEGLCS6ICNms9moHNrWSqxj7RzRhYN948EApjMPhrRx
	bgXvKOD/Vbl8aAZ/VjkfUub5i9KBzUdQ9i5Zi7zGqT6Px+ili6jg5nst30IdHBXIEyw==
X-Gm-Gg: ASbGncvTFoZyOdFM6mWeNnZW1htNsEi79W6VCKE4bYGtYArs64UaRpZObKfhkeIgwo3
	9RW3Bf14y9/DklhX4ARNBHFC1ESh1sW2ua4UmeLNP/A+yONkrkBdRzseCv7v1/F4Ns0Atw7EH7N
	8jTjg//E9Qhb/ibI3BULVg6BLe6Z84yEXHUNHmj7dIyVgwSp78RQ3CCR+pkXJns9oNzG3LMClgu
	+4ReqwD3tRGUOG0TooleG7SDleQ1i0B289LpZ5748EIdipJtA8UJOaJAjtm8NxokeF2xPOIDg9n
	NZYaOVbS/JXpgVMCFeCW8ymQPEBBVA33EysCLCbSSEcrrA/4I0qsCTIdvAQvnbR+n0en6yl064/
	kwlTRP+9gHcWmRe6IaO+hs5pkX7Cb31lJ6/QKYj5dta5rpD9eawYHFGYHRDwJi3LJ
X-Received: by 2002:a05:7022:2521:b0:11b:65e:f2c with SMTP id a92af1059eb24-11c9d60ea19mr14591439c88.10.1764150007671;
        Wed, 26 Nov 2025 01:40:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH49U7C0moElexCLrZcV2e+MlUgzEqGlJSAWySjH4yEsEcXnQAS0Ww7o7oxUV9i0HPgQkXFpg==
X-Received: by 2002:a05:7022:2521:b0:11b:65e:f2c with SMTP id a92af1059eb24-11c9d60ea19mr14591417c88.10.1764150007100;
        Wed, 26 Nov 2025 01:40:07 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e3e784sm69150307c88.5.2025.11.26.01.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:40:06 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 01:38:36 -0800
Subject: [PATCH 3/7] media: qcom: camss: Add SM8750 compatible camss driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-add-support-for-camss-on-sm8750-v1-3-646fee2eb720@oss.qualcomm.com>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
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
        linux-media@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 0NdJWPQUvEpdFqU9y1VL5zwECIl6--Xc
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=6926caf8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gE60Ov1lhapgyOv8Ur0A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 0NdJWPQUvEpdFqU9y1VL5zwECIl6--Xc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OCBTYWx0ZWRfX+CdgmD75Jw9G
 bC1adRjaoWQiHw9orpbHGP+U1sc7bPBogw25rIO0B63kIohYa2ToooDYlXHq6da7RIdbcHdeR01
 SbAz3tGT3btWBVOc4QSpgKDoWvMNfIYE8PF0lhwz/ROOJHDLcS3VovdnKp8Zhd8HNdsdcG9XDqD
 NePaESb1eV9qTiu2bmfrQE2aDknCIVK5AbK3v4RphjOLUVLg1VwGcYvA8BMEzwl/GCPttSqOB92
 R2ORb2Ji8VhF6jT+cJ1k+jpKaFa4Uh13ptS0iq8RCED0W/MHPGd2oH7ywEg8A9ZEf6gn6Xuy+xP
 8Q4AVKP+rg7D1MbBr/lfo0LycQ8lj7ni2eUimgb9ZQx0t+j0INmdg3VXY2Ss0aBdrj0Cp3PiX01
 EHPBWoeKv3g4CHMImq6IqEnQFkH8xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260078

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
index 5ee43c8a9ae4..805e2fbd97dd 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3870,6 +3870,20 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct resources_icc icc_res_sm8750[] = {
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
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -5283,6 +5297,13 @@ static const struct camss_resources sm8650_resources = {
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
@@ -5314,6 +5335,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
+	{ .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index b1cc4825f027..f87b615ad1a9 100644
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


