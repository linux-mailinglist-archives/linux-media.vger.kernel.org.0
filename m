Return-Path: <linux-media+bounces-49993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C2ACF79A4
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 10:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 862EF315B3AA
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 09:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEE032471C;
	Tue,  6 Jan 2026 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCaC7NdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ktuNe/dV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBA93242B0
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692444; cv=none; b=VofUZFxEwdCJ/1m2fZXudN5orPNuoQCFDs723jp2QCflOJfjksfpttScAl1lFFdh9H0aQqICgZUJtNL5DHJs7rTKh3SMPWTmYJz1zJ0Y4hT3GM2rWd1rmw40csGvewUB5qbPiw6bPloVy0kNiTG8kQzULF+xJSpmH61ZeoPP48E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692444; c=relaxed/simple;
	bh=71kIrdwXOIdWDI2rV00pLfUDGbPwWfRVl4u4iAFTVI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t8BtuQ3pV2/F1f/uZsTUjoVQr4r5cmU4rPjOJuch9yJg4WYGnHFvhopGUfDJDiQvDP8JQqYvpi8uRtQdscSRNZ8W+l+eDTTKXMu93nKqAwK+pmX4vOIwOaz4n2zPBF7ol2C4lTB29gzQary/s3PHgVwhPRNs9uNNR5F/enAEmss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCaC7NdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ktuNe/dV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063Q1su2429750
	for <linux-media@vger.kernel.org>; Tue, 6 Jan 2026 09:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EFStuPjDqBGq11Y8PaNhKeVSsWepDyT54qvpTNycVyM=; b=KCaC7NdVJ9VG4PDR
	e1xRKvSi6sbivbapl58tFv+UDOduYBWSqf8kH+QgXki3I+awmXw8wBhFZQdhQEvi
	iJqdGEnSAcMjO3qCUXVXrAMiFA74RzM4GFqGzPA3P7GXgoLbX6xLOErCHPr2XZp6
	/TDEy3Owet6YmbTCOiHkw123aMiqHocMQEzNVE9L5bIEGav/rETBuOU2Kw/dawL6
	0mgilYV3nKi+J2JBleOXyGUkvY5xnHutdDWCrNbqaE1a0syHQugCJOi3VfCFiTvf
	kv1pgEmWF8cTQ/ii2aZueZmcqZo6SFPPTRVrgOeRyPocu79YutMkDzLd0JlhGoWd
	n6J4Iw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgr739cut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 09:40:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bc4493d315so193024585a.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 01:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767692436; x=1768297236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EFStuPjDqBGq11Y8PaNhKeVSsWepDyT54qvpTNycVyM=;
        b=ktuNe/dVIEd7VYR/fpVbVym0Kb/vjSLTIYVokN8HpqQsUfU6UKWAnwuJ2pIzOqOtm1
         6wRNB980+kgiR9Dma3gSySnm2oZJ29oIqskOXuwVAJ9AExBIjkbBa4j5z0Ig/NvZqQKm
         VqNpc0xAxJPmZ1Psek0oX3BD6FuN6Ebhwyv68bU2D5si2/JzMj8OX3oazbJ6635or0t9
         2TqFpEF7B1V63gN0fE3nu8DO4QXkGykc/CMeW8VSRB9TvtDLSZIDL+DrEw9B6k+YQDnZ
         gkepavLU8zBnS+wo9FF8yK4nEjLa1KQR2tsSbWRbOtjcPeA/+7Y9mjz0M1o/C3ZDUt6d
         8lUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692436; x=1768297236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EFStuPjDqBGq11Y8PaNhKeVSsWepDyT54qvpTNycVyM=;
        b=t7FrwjacIWvuzUUM63t/R56qh6+6nFqTU3TbpkGqYcdomIdOjMrdEK6uGRdC+n2Hwo
         r2Nw6EFms2JPMK0xwYy3gReEZd3+4mPAU5+R2BzidRmblRTBKuqdDZFloz3ObKiI3mz9
         T5K72M5IW1ghBxImJC9bDtbuH/olAyOmvWggZlHYGaP9s4BMTtdHXVReDxK95vJqichg
         O1DEMmp1xecOC+8Eys+QQaoEwC9s4eAfGXDtdcvNunkAl2t4gy+oqSTshd03sUONkvsg
         jD1I2NtbYLAu3ufBrETcyp4bZ6bE+IJCPYpo4QfpyEEpAhnjHArWrt5Lftksi5r/IFIi
         g0cA==
X-Forwarded-Encrypted: i=1; AJvYcCXJE8NQviBAnLGVc+gSvFM8j0SRvYZawT/ZzCUCITbJIO9TnELpFk77Lpts6DJVJxI6XYjn7gMqMI52jg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7T9W4lua+9DhymdgyhBzr8qUB8ve8/qQjQNAGRDdhWDRUbURD
	3dk5P5lpWAoivvRTaZ64bKiTCNjwl2zi3tyfYwHBUdAr88aZnOOjquU/SUgKJVC8rvvnVNhxoqY
	iJDpCCB21JlMdRuDduLHzsQocV8x7PEBDz8lWg1TwF66TisJ3PUvkxfp6MYYLvAdC8w==
X-Gm-Gg: AY/fxX4EIm+Z620yoNr/kJgy4ySVbSBUgfnbu6DoGNaRrKewgSfCq1M/0uU7xNj3hFP
	sZ9oY3uuLlANZkASslW5TulyBXUtQFI4xBQoqRZAKND02/c5FwEuxEFg0o9tKvrxpMZYLFOdlfB
	Ub7duVQZFg2I+NYv974zjC3fvVG8RuTo4obcG8FZZ+NMenmJwvK2zsCwiMeJvVU8mlgttcgAWe9
	l+9xDMxDHI+Iki5Kl5gxWvG+nT2l8ZBo2nk3WXxuaFQIs1KY5IXYulABLK7wcMVklxk9RC15n87
	crXis9puKaORnB7t7URsaMjQKdxeWTKFsQk5p88GdESqbqmwez1CN9UBn9w47/yMiWe2AIH4aXv
	jC9Dy5EOdjmr7vJkJgiQyIEODYL//bsozf5EZKiT36nUYjxlNXXZ9A+NMdYT/9ODqkzcW34A9qa
	qD
X-Received: by 2002:a05:620a:4543:b0:883:c768:200a with SMTP id af79cd13be357-8c37eb4d650mr303474285a.32.1767692435803;
        Tue, 06 Jan 2026 01:40:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmqsSHsznJQkTB29DSsDfJAY6G6shE6/2pb2Xe1QxC/b+6pxtXJD5dv8h+jQwBKu6WgbSw2Q==
X-Received: by 2002:a05:620a:4543:b0:883:c768:200a with SMTP id af79cd13be357-8c37eb4d650mr303472085a.32.1767692435331;
        Tue, 06 Jan 2026 01:40:35 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51cf95sm135397885a.33.2026.01.06.01.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:40:34 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 17:39:55 +0800
Subject: [PATCH v2 3/4] arm64: dts: qcom: talos: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-sm6150_evk-v2-3-bb112cb83d74@oss.qualcomm.com>
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
In-Reply-To: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767692409; l=1352;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=71kIrdwXOIdWDI2rV00pLfUDGbPwWfRVl4u4iAFTVI0=;
 b=/2qPrEPq76b5AFwh3yYxMGxslMvx3cl7umKuiGmVN2XvNYnuqa4mtb7b+r3bZaVI8AoJ2P4Im
 72afZFI40hBAYzNSqu5raZ80dlkEt9Mg2qM1bT0u8gtPf2HwjI8lxMb
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=QrxTHFyd c=1 sm=1 tr=0 ts=695cd896 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5gU9pCGy4F-zOMtWvC4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 5NCCzeIN9U9-NURaYvu-uNVUr9_WDsWR
X-Proofpoint-GUID: 5NCCzeIN9U9-NURaYvu-uNVUr9_WDsWR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA4MiBTYWx0ZWRfXxQSxB9I8BXUx
 Dtde52aiWvv5MzWmBsTZMm5QeXiCr4GmPvDuRNOTwHkydbJX4z264GilCPUvpfUbjHdZcGrfYPH
 7TgzsiWF8fd+6S8X3IRNqDFi+A4XijptNSGoGxkvM81WROLxSvgOwKH4Kjt/+ZdIDAL6FwcpRPA
 2UiYMfrZ4WxIARvDsRY/Lg4LcrDHXe2lsK04zwRuwANeh1KUh5Hnyj7Xzd0Y/ft95pcSCmjDviM
 OIMEfpl47YqOhAkm11YcevqhwTgpGYgl4YC+4GYV5O5EtXYk1jaOxtVfq/DzM1f83BPpBANfQO0
 EQENrewZWwpSpJcYG4EWxZC+/ZgAudZlmTAvDBLYGah7QygjHvT9qVPY5BqfQrUIi2ufoECAo9W
 ROrPW7sb+4/w7jI9PAV7aaSqfZHIJ/7AL5DT7RwPzS6y2sptMaWeULJmUUVccHAuVQMJxq5wsyO
 AndhvcJRz/Nme6L7m+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060082

Define pinctrl definitions to enable camera master clocks on Talos.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 461a39968d928260828993ff3549aa15fd1870df..880fa10a2db993a82d31faf868195944128237c9 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1549,6 +1549,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio29";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio30";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio31";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_default: cci0-default-state {
 				cci_i2c0_default: cci-i2c0-default-pins {
 					/* SDA, SCL */

-- 
2.34.1


