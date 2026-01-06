Return-Path: <linux-media+bounces-49991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29921CF793B
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 10:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B06D430491A4
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 09:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88387320A14;
	Tue,  6 Jan 2026 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+itOZeN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZxmF/wlV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF25321F48
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692429; cv=none; b=uu7Bkn4jNVmaJ76qus44k+S/+X588J6rDBdUay1t5iRYyC65V2syFNWXj/d7HMbjCYfdfJKKUI2n3wJuDxVvejMqmzJV4a/J4Ff3D/eK7z+kvgucY2O6lFRP8eIkR7PFxMuDOOJxUhB1dY4yvARVvy4XJ81tqS4vje90EcCEYZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692429; c=relaxed/simple;
	bh=zSk1APnfdThvvuoMQXB5XRjhqPJzasZhcJEjPa9ow14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4QZuvCGpXHFKLX7+FSdkIETo25L1MBuWC6BjtLiGeP3Sbbk06iEzVP+2i/mYR+Xxl5s0O40pH12dq/R7KfKGzlCedq2ZJXW/+bVeXtjj9Ik7iDVXHteixqXmYMEOL5rcVLEw1DfKv1fIu9Sdj2n+2uYrkRtQzsmaptjqdwJ1sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+itOZeN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxmF/wlV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063Q8UU3442292
	for <linux-media@vger.kernel.org>; Tue, 6 Jan 2026 09:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBPZlLuOcsj4AcXtblqDTvEo7d//tMHnTSCSYQb1X+s=; b=M+itOZeNvFit/ilV
	winrUrYjmxhgRVbOougbrh35IKIBS/cXYcGkzGPK6NsC0wcfhxPd3ergEwyBM81k
	WpoCSnX+1jbGjQelXKMeIOHjWHEPiLqD+fsasmHEwQz6XaMftNf87y1cd0VMhPhD
	1yzhUSRXlXm7xFZ+x4rdwuOjOmB8kGddt9MQ1c+99xPRsOYWrYfocHSQI7+h0gqv
	DuRJKp02RDQ9wlkkx0fleJoog2h1F3U6mbwlzGQ/Xxy50knHt49VWX5HGzA1I1nx
	cXNMyhLlR75OJch9uYlXmwirB4ERnxtJhE8LrFUQb/OUU2edXPexPYoPD4k5prrx
	AOc1hA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgmnh9wfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 09:40:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2f0be2cf0so279804585a.0
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 01:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767692423; x=1768297223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBPZlLuOcsj4AcXtblqDTvEo7d//tMHnTSCSYQb1X+s=;
        b=ZxmF/wlVtcUBpK2xsedS08WxTNVhN3mnCNHVcgeToDY6AHlBamehDVecrfUPnfBTJL
         4CwnEc+7rDhnbDZYFPvGwOzrpTfykGBqbjByv+IWS783ePy+b0FLEytRkbytUM4xuVFt
         C6kOhB+AQLwrBU0fueHNOg017BVBD9Z7DgLkyh+ooXcdiobvNgP+szJRpH/94Utb0EC1
         uCcljqxSjwyVwvAutrOmDC5YRsaYm0MwmLLbPnhwekInflp+fIv7vJFBlELyjfLTpVmW
         Vj9zhswW/Y+tEcdFpY+vTy+pQD5N3c3lQvtUondk4lompSlzqgXesLckzWVBVsQxPneS
         TGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692423; x=1768297223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iBPZlLuOcsj4AcXtblqDTvEo7d//tMHnTSCSYQb1X+s=;
        b=ory88Fc/dY2lTC0Bdz26W/YDBEroFybqA3XeP3tXYFK5wuVvsBjI4spg1OOCDOoViZ
         TZrRByy8vKyeQQ9jv69aW/OgFb6LZMraQmsjK4Mny2sG8XYD0063It3NOsSW6ds3egLm
         04PXk3Xw9Y9fiNyf1Q3n+9Or2bmMb19pNTdL271xfTX4WEjY00++Jfg56II2PQU9eWi/
         qzNHb5i0GluzL6cypgWT24YZU319V/bUbXtamTJF9DXn7T4kGbbUIhfc+N0Qls5g5JWk
         cNFWJU0VbQp9Okt1cOp9CGy2Br4Zzo91W3NhmkCsnBvCGfL53WR981A7W/35JroqII0e
         DLbw==
X-Forwarded-Encrypted: i=1; AJvYcCXhCKi1DrGtxongDCmoZJ2E7EtvfLMEi8bKsQJVx/LmomQEHQQOVWf9lAc7Se7LaT4vnkFLhrOqlE520w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxomTynGNZ4lkbZAd9eyTHHYTL4yDtxmJ83b/sTapi6+MQelX/u
	pb1FRafulNxO2rLA9qFOypXwJophwTmt5yKb+aQngRjJl0laiv3quEhQTzk0fG6Q4+YYn0uF6h5
	fXZQJpQShULFTk6XsIUJ6oKYZrkDH8MmAicY8//p46lTTeYAzwyP/7RnRT7gUyNamiA==
X-Gm-Gg: AY/fxX5eQ8WxMDERWawCoqVxRVBzRBQEE6w+y15ZyL9U2VlcW1x8PjZKINKpcXz8/RG
	N6sgGZ20y67lAuSgtVxaCSN8U4gsOTctXnPXToKk7dPzdBPe/BVM+KMGdjY17Bzj9hGsgZIp3Xr
	2SPC/dhkUhlv2iACL9/ZmoN9npqfFFrI82WrweO8eHq7qr7cY9ppeiqqZfsWbokopaB4HuZ8m8T
	Br/SY4p54NCstMX1fJpGiGOEzoqrW/GXAbK3wRsDBVzsxZm/YeXdaLt3xUa+Ffdi/RdZ5HJ8JqL
	iv6wlO+t2EzHZbrnUH/eD8OYWi/kRDkN7jO0piQUsAWbu0SkQaltZFy8ExYRAXMnWfcT6amxoQ8
	YAAPY+gAjBSz4zCv8e1faZYeKCaNl7g5ZuW+ywsaP38miuqr0xhteY7N5yZ98EYFqFU3gnM/R7K
	h5
X-Received: by 2002:a05:620a:25c7:b0:8b2:e87e:1093 with SMTP id af79cd13be357-8c37eb72a4emr298598785a.3.1767692423455;
        Tue, 06 Jan 2026 01:40:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMAm/z0JG4VqfvPOutweGcWxwBQ4HC4pgvIqFOkKyoPOyPw4PYsNpVNOXjFwkqMz/+ZcH1iA==
X-Received: by 2002:a05:620a:25c7:b0:8b2:e87e:1093 with SMTP id af79cd13be357-8c37eb72a4emr298595385a.3.1767692423064;
        Tue, 06 Jan 2026 01:40:23 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51cf95sm135397885a.33.2026.01.06.01.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:40:22 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 17:39:53 +0800
Subject: [PATCH v2 1/4] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-sm6150_evk-v2-1-bb112cb83d74@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767692409; l=1364;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=zSk1APnfdThvvuoMQXB5XRjhqPJzasZhcJEjPa9ow14=;
 b=ydzKyJw8JaSS17eXOdSXbA163ARvdltQImiQp4zHz7oi2mhkpTlWS6QJkxenalgitCtGsFmsI
 6kszHiwHWUTDwgyDutf8pOQL9Ke+mPC2CD0vbWtUsQB2gsfihh1Srxb
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: Upy5N6fmMZhkaGcyX0_bs1swkl5O4K36
X-Proofpoint-ORIG-GUID: Upy5N6fmMZhkaGcyX0_bs1swkl5O4K36
X-Authority-Analysis: v=2.4 cv=Vscuwu2n c=1 sm=1 tr=0 ts=695cd887 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gOhJHmANR_8o__jqBkAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA4MiBTYWx0ZWRfXxi8CQONqqhBt
 zVFWADTENBJnXShw8t2AH8i30pz4RmORP6uoSRUA6LYFWZWhboOnv1abqofnXN8/rGpdohJHYMd
 Lyc22OkWDjtsV+CJhawRdNkX65N+2WOZkdOYhIPok38M092FJ+4s4Pqgu/um3dcAQqri69yGm9m
 1iW49WmRihWqBLkWbO63YnQQkQP/EoGJMiOYPrc8NRZS5ZswgEgzTn+IWyxGN3XjXqCKZ6DlCNy
 84TGB06XIceGR8sVNkeFjBPyB5roj8AB0bGxrwtiggN2fr++KlDVxCM7QOMHJ7LUZxAxTHhC/95
 SEXatrizdMibuby6MY3LteZ3AITCOlXzRzsJ/aADX74Do0MGaKqFUpOtdtPCq4Xg+KmBWyCB3B3
 9jDwiKVuY4sUlpc+Hb1QPZa/ncN5offKCydJmwrk3UTT4ZBl1PJ1qOWljBVCS9r7T69Kftq+Oux
 lkYPGSs8IsF6FTuEtJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060082

Add the sm6150 CCI device string compatible.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..cb5e6fd5b2ad1de79a9b29d54869d093c952d778 100644
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
+            - const: soc_ahb
+            - const: cpas_ahb
+            - const: cci
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


