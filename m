Return-Path: <linux-media+bounces-50768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC56CD23E15
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 11:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90CEC30A4F93
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 10:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8747D361DA7;
	Thu, 15 Jan 2026 10:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OaN9SmJ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jOrJpyMy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6E5361647
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472004; cv=none; b=SvMIpT2rX8wmxCsUPa17p8F1G8d69tByG3sbGZbb9fh2q97sgHENMeDEbucfLj7KY8KAmaMJcnIQIJs+FV7QW1YMRkzbqhAcGR1sCUmSSiz4EcmaOINs3EilOdkKY9M0lZw0KN+fWV4U7ffA0Yba3ftNCDVraAkW7cbsBcb2LaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472004; c=relaxed/simple;
	bh=M5+8O8yCjRisazGnwCs6jTZ5OFgWEq0sYZmbzH3kaMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OIv/hAaBBxDn8nscClRAvU96AVRbHf/CIrEJZZGUh610jAB3OkNnYaSDTv1hMRr0ONPp7P1TEM6fdIx+SGvST4HfckK70+aHJMAaPF3cN1s86vL3ZGC6Z7FcLwX8poDxWyBl3FvaBWfvh3Ba6JvZLzR1Rt+pQBRdtucjOq2TUac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OaN9SmJ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOrJpyMy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6frc91582040
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 10:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CwFjJp0lmv+laEGzitcJx/xcZfSaGwmjovEDoGkonx4=; b=OaN9SmJ/H3lNT0zQ
	yhAHmML/R7Yq/CEZIqgCDd6z9zQU69N7vXY4n0mPIz4gmCKrmFRIYlDS0okxda0h
	A1i3HKy1N94em79UsG5l0/jye9qOWs4fTun2HmFdk2HzL3FwrbMVvFTxQpSx5YbR
	hpY/fIMQHGH1hktqqzkR+zENDMFa319bxJiSEPMiR+lFRysxbKznYPKnkfRRMow0
	bbDDHtlTlIPD+i+AwdA7yXBOhr4r38laM+b2M4Qch9m2BJsJV3UpceAyHavcjBgG
	KOi3kD8iHnSSzIOTu0Yiptr9DBCN7TMV0BIRgXoLDLdaR9gsJ6v7aNp6BuW+2xOa
	9nAISA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpj1pt470-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 10:13:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5013be25d41so23096891cf.1
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 02:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768472000; x=1769076800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwFjJp0lmv+laEGzitcJx/xcZfSaGwmjovEDoGkonx4=;
        b=jOrJpyMyLGehTnEUv6iXGxag2+dh3kGRGTliZjEpS/vcfasctGAKIkrObxF/6aQX64
         iK/vyOITC6VqLbIyUYyzb0yiYm3n4mlHHw1W77t67i9cbglFnV5GPko3ZHg4PuEk9e4f
         RFvTRKINBhapCJ1ZwvXasszsrFKoH0mHMq2iLXI/xvzJVcQUYDbkI/y/E/ze0X98J+3p
         4Yg7QQiXYtNpr3S7z3y0ngVIs+phaErUzJzBBVbaIMttYhiQW0sQVTdcqEyj3XDc7Boq
         /ZBBtn8Z0Sb+UzH7iOAZHiy5jKfsdNAzqcgFajuO4RetYSBczF5BPmVkmTn2aQjo/vui
         c04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472000; x=1769076800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CwFjJp0lmv+laEGzitcJx/xcZfSaGwmjovEDoGkonx4=;
        b=VsDjbn1duDUwSstRzP7OJ+e76AF3sOlXvZrR7mssE5qcNNa9gc1mxaDani0cH1eCRL
         0VwVwNkuv8sRfYemHsu/yLE1Gbj4vjOrLLDOnjvWc80q76Kb0VQgg3c/+Pa0RRokr0rb
         6kdnP5LZZThVlvOXX7H1/D75W+871eRll8EYYHY1UKnv8W7EzRt7+cZU/b7Vbm2lURMw
         ifsGqwCfSrUC3YtITCf/XsLiOvRkeyGo2fZ2vUFV85jaUkmA9PyttoSkuLgIN+Dz2vZO
         KaA7w3W9u2hTOJxy01Nq7S/z0R54SLBeF9olfBwgd+JsR9sXJRetO/oBGSrw0kKRdC7P
         W6rw==
X-Forwarded-Encrypted: i=1; AJvYcCVzChra60NqCn6uthuIT1kTvF6A1QFb9QaCfdVYF2APl8A9WZEr5TvYXpwQQVBMc6mhEtaYxUWOHavIPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi77e5PChu4xIqqFTr+WXw1ToQKKwpuEKR28F4euiHuNYebKCI
	cCR+JLzJWtLiVx657yeysv1B+l9ei2zK3Pm40u8bIBf7dztEGr+OPN49oNFIqXqQ6b/+nKUvdnX
	eVz8pAN90D/ndx4IuIyqNCQaEB6Z8vNas7/pTLmobOWH7cC2PlwlaZefUVcmHfL+PXQ==
X-Gm-Gg: AY/fxX4wVM/pFezKRSo55ci22GPy5x7r+i7B8sgGhxGY0zv+WqguywWvDJq1lRg9LHj
	/rj2Ok3WdNH7zxk1R4npqny19VPf2spqvskLcyC8cc4UWwKInY+db8YobcecciiygbAwmE6kYX0
	UaoD923F5oheULKeMa7NeNXX3EDbf7Re9llf8gxWPC2hJleSK10SD5N4A3f9dqb4VB06q+DmmFR
	B5KPTVZ0neh6pq9bc3SdZsO0OzXQErAIFCfhxew7+Rq7ZSh76Wm4Lrs+6LMJPklGGn/F0h9aVFL
	p+uuyHY1tDXZdnYuNnA9QB5M9wXuJz4CK+TKDX/6AImi7pv/K+yahKIPmamszLhobv9QpXosWx1
	dFy7TCfr8mD7l2U8lv7pB5JobaCYILUX611HN7OGp6UrwR1SIxVokBvi5PWbnZSIaHwm7DFK24I
	Ds
X-Received: by 2002:a05:622a:53c4:b0:4ff:c0da:5a06 with SMTP id d75a77b69052e-5014a91902fmr72422931cf.20.1768472000271;
        Thu, 15 Jan 2026 02:13:20 -0800 (PST)
X-Received: by 2002:a05:622a:53c4:b0:4ff:c0da:5a06 with SMTP id d75a77b69052e-5014a91902fmr72422511cf.20.1768471999685;
        Thu, 15 Jan 2026 02:13:19 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:19 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 18:12:38 +0800
Subject: [PATCH v3 2/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-sm6150_evk-v3-2-81526dd15543@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=1602;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=M5+8O8yCjRisazGnwCs6jTZ5OFgWEq0sYZmbzH3kaMA=;
 b=mcgnYzGzT8fjH70t6p9m5FammsN5vwFrN1bKnlE1VUTzkmRGRIeI71ZRJ0Wmbd6DwFqy10lqm
 byH7WP7ANBsDw1LBOx5pl0N8vq8ioDboHxN1RFC+BWUikx2yvoJRpdj
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfXzEmfdG4I+3Ln
 mwHsmrzPkCdyF+m3buCxH1pJBxFrZMy5nP0oQcJlpLa18NKATR3hLzGEpwmlshwL62A6d9C2RoV
 o7qbSu7iQEbbHuzAzM+NOLLekipPad0AOdv0Z12T9siGV7kNdO/EyAyEYzEwkaTA2vy4/oUXUoi
 02d+ND+PKCE3+oseIJgocwbkFMJlzn0MyT0W5HcEBNt+U6gG5Y4wq9CFFYJSpscG7YDncTK6CZG
 m5NV/H6W4eW+8PRrTZ2HDS/b6k/nlF+U/k+aRbXvJMgDLFpF7MVpSfA2zKKybpqpLBwxr+bNtDe
 7c7CPQU+lVXu8E2qh9wtt0fD8oBcBKZZI3A/fadK3AUU3yhBZTmvpw0UdxIQkWUaiG/X0pHQirb
 wk+eQr2R8rZOrpJ7UckQ2/g2E75PJCT7/rFlz7uBxjbS6L7jLckU7IFI63rHsOxq3vtkOhyajBR
 1QZE3b76N5J//jo2Nsg==
X-Authority-Analysis: v=2.4 cv=J+KnLQnS c=1 sm=1 tr=0 ts=6968bdc1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=E-b4n2RehmlEprTZI_0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Sfr96fi4wRJJsjtE97NQANKndDmS3D4-
X-Proofpoint-ORIG-GUID: Sfr96fi4wRJJsjtE97NQANKndDmS3D4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150073

Add the sm6150 CCI device string compatible.

SM6150 include three clock:
bus: Bus clock responsible for data transfer.
iface: Interface clock responsible for register read and write.
cci: Clock for CCI core operations.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..3472670fdc908ef8f3b3afc68ff437c0435b69a7 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -33,6 +33,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
@@ -263,6 +264,23 @@ allOf:
             - const: cpas_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm6150-cci
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: bus
+            - const: iface
+            - const: cci
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


