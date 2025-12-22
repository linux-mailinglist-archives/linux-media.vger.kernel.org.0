Return-Path: <linux-media+bounces-49312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF19CD51FF
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6086C3001E08
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE0530EF94;
	Mon, 22 Dec 2025 08:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UKprWWYa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/JmuVkp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123553101A9
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 08:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766393075; cv=none; b=ZSksSCdW/Zqe8U/REQj2A6srMOUXSP4rwTJojGnG5yq6/qpJ6wKvCS6AiEJNyZpV5lE3z1ocgJCFdSDrF7SX3dQYFIZVitdbfORpuKy9eBkKguteWF+GgAXjw2gv65V7NuWbacH6AMLhf8IFA54SN1x8OmJd5LWX8/rSUeVQayE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766393075; c=relaxed/simple;
	bh=zSk1APnfdThvvuoMQXB5XRjhqPJzasZhcJEjPa9ow14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BQhnW85l+s3h7o2nj8g8UlxVPPL5dfGrzhlGBNpM6UOjgaW6F8NFOezBy2uF7tTMZS7lz4VBg61GjT+3LKYfDYU4BYFaVUokDvxzAz27su3CxEtmH9q7VVKkgrCpkXZcg09ASWGLA0jNyaaRP66zkME0hH9Qnx8+v4d84w0qAN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UKprWWYa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/JmuVkp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8J90g072612
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 08:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBPZlLuOcsj4AcXtblqDTvEo7d//tMHnTSCSYQb1X+s=; b=UKprWWYa4lODTSEd
	bsRn9jqDfdzK5G2Nh4D+VPU5k3LzGOE9g050/Wah+yBG8Q8NfS9LsFn6wIuas2Db
	kHFa8NkedXHvDIpaXBY4/2k2Pm/BdBnrjgRAlxulZA1H2oTRinC+X8vWe4YNUdfl
	KKp/CMcu8gxdJiiC4gdQXvF0Y/dcVqeoC6BdwFlkZpo2CvhdDHoYanK3bczqFWHl
	eCRcEsIA24K1O+V9xGPB/6HYkG3kyuLsHzY4lPN51oJc4C4will6t6XetFewk2h9
	AHRUZY57F5u28aVHkZT9tz6dJPLGLaXM2+4oJYvZh8vdb4ScW7snZNfmZeMt5pWQ
	UM6kEw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mracbe4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 08:44:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bbe16e0a34so906001585a.1
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 00:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766393069; x=1766997869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBPZlLuOcsj4AcXtblqDTvEo7d//tMHnTSCSYQb1X+s=;
        b=P/JmuVkpFAAEF1K1focd3dzy9YZ4o3lvNntIUiv9mwl7Dzr0A00maXcN44AyhrPpp0
         ZTagw4DVZDHi3Xhseiyfdx96xy1eTok+4Yc2VCe0x+xq6VY56DKfJ8BD4p71m+MYkEII
         dgDU1uatkcfEOgi9rKnbN1m0JQ7bnLRS32hu9AxX//6J4ZOhZq1owVQHw7ky/CcZxlyX
         nUuzJxnjhWWvXE1XtfpTDrQvi8SoZcfaXE/TjsmVUnchdH7thEXmdzDPIYS63aYDP7z/
         NSy82ztuk9VBBvJ23AQYKRkTQnvRhns3R1hOhZHMGVAB7lOA4+uCUzWdhjfj3UjOsRu+
         5rYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766393069; x=1766997869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iBPZlLuOcsj4AcXtblqDTvEo7d//tMHnTSCSYQb1X+s=;
        b=pvFH8A5KIYRg/GMAsTxn8gerI/wNpiJLCJP04NndMcwPlkWcdr/J/C++CqnSWlxOBt
         m1+cMjD1y/Mmm2Uhvw8eX+BYXUsI1HPvHC/gcAZIxxjh0ZPJKGyB4imU/6UNjZZfPPJI
         ICHtuvKNc+p7lW8adHatc4ApLOuECnoU0WRWHbpnKOnJk18tAJzz33F1mcdK4mp2oep/
         BQv1mpls1o/piy84KJ2doJoINybZqMSnkybmen+HwfifpXLvdu+yEMLIKdOk6bt2cCUr
         Osm6Ilq+o9kH3yuKQ5T8OR1JDlKOV1VlhMZF1T5UHfVyP47hvHcWTqPRf5tRNTiTkEuT
         s/Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWSODgFySXTEIH8tGq1vkYYlZ9JsoLGz+9xyvr1p02EpqsbYwuj3iUqo8l+sr+aveWx2JzQFg+/QYpItg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybAnxaqHPN4WJ5Z1ZMJeTbNJATvhJ2hqY73nDdEj1MkyWpSfwC
	8Vkn3ZdqPg8g0nD348Ub1EVA/5VakVmfTMC2bV9rPSGK7lRSpGUPNMF9O420+64vYHikikSwTdV
	9WNRUJDwmKN4Cols5BrNBhfM1koF9TAUAaVlO/rgt7XLyYiPZfi5crXCRErkEPUry7w==
X-Gm-Gg: AY/fxX66XuOjLPqqGTnuaB9+lmH/hs3HflJKNvfQquWocHEy6b8JBX5KjOROwXxYBCM
	JDXWEcBxOW0iNP5QjIjVS5sDltkf2gx57zwbvCUykv8Bk49+5wC3lEohH+dcmbPRxYtQjMhEL5v
	lNfbWv1tIE+7bjuzTEQ9LGm58aRYAK1UGJzW6+9DA/ShyfU/y0O83D47/qQkXkn/i56J4pNnSH/
	95LDXan9ggcGk9MfySsap5ridKkXdXrRJ9gq4beCiEvq4p2iyM5DEuzRTLkxuFCY2qAWUXZ0HMc
	7gaSQ04+v8Eki6MFNuolwU/DndqRhll9JntVflDo2AyeHA+A6BZr/rOEOTTIgl6wV4/nahT1QfF
	0kfeKOb/R7306hKVdS8+cdS+bzoRtWHQzLBUUJbUfTeuXRUUZQhKib0lUw80AOoRy4GoUkyKMnr
	OC
X-Received: by 2002:a05:620a:f0b:b0:89d:b480:309f with SMTP id af79cd13be357-8bee670c1demr1936300285a.7.1766393069435;
        Mon, 22 Dec 2025 00:44:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtSAW5O8kGqUPF9NIJZUVX0wZTq+jme5tk9Jrv/kUAmOaT7yNWWWH91HXSeLnD+nJs9vQ+2w==
X-Received: by 2002:a05:620a:f0b:b0:89d:b480:309f with SMTP id af79cd13be357-8bee670c1demr1936298285a.7.1766393068964;
        Mon, 22 Dec 2025 00:44:28 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975ec0f0sm782975385a.50.2025.12.22.00.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:44:28 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 16:44:14 +0800
Subject: [PATCH 1/3] dt-bindings: i2c: qcom-cci: Document sm6150 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-sm6150_evk-v1-1-4d260a31c00d@oss.qualcomm.com>
References: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
In-Reply-To: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766393057; l=1364;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=zSk1APnfdThvvuoMQXB5XRjhqPJzasZhcJEjPa9ow14=;
 b=iueo5qdWUFws6kd/i82zmqVqSzTsqmFHLMdodf1Qcmfnh+XN2WS8KJy6Ysil43muPl33CvmiL
 FvRDaKIOjZRB5aDrImvXE3+on91V3jDDX4NXpHKGyZnO36aWnGrMdF1
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: SnJCq1Dv_s63FGx7SNCKKnqdWvpbuH_O
X-Proofpoint-GUID: SnJCq1Dv_s63FGx7SNCKKnqdWvpbuH_O
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=694904ee cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gOhJHmANR_8o__jqBkAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA3OCBTYWx0ZWRfXzYGvAlJbK4hn
 R2xqcBKZQi7g2U37JtREdsndipsIkK6wzNbA5DMbwDcgAR/S33v0thv8jdoClxRC0gKPcgUcHyq
 wwd5aqndRBd4vp6TNddWubfDH04u57aypmfddSfh0fDMd904kGy+9V9PBSN9QlsUe5yOAN5YYSe
 PYgZHBH8zJA3lgzoy1/PVmHhcrLlfJESL2IOuqXOKVaKtDTcPZT+VI/UH6r9hkNlXGCef7kA4Tb
 Dq59Upo5U7tcw8XBCITaEL6KTjJldb7IGa/JvwPNJShaRDCNB4zqLUrV9ATo9cO0uTEuzRsLNKN
 DB20h2sa1HxHDnCdc3Af2L0tk+e5BraIutT+Kjg3Ne7VZe5S9KwqV+8U0LPDt9BWwGDBBOGl+bQ
 LL7hbTOXL8gUaxohLZW0WmpayWSefPkaP/e0Gdiddr2p2Hc8hP/BTtQQfbkFcRkrbYjsW1uWrss
 NQBvHoOQlONPVEhMEeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220078

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


