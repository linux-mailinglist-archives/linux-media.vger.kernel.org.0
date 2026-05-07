Return-Path: <linux-media+bounces-60715-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLiBMdcr/GnVMQAAu9opvQ
	(envelope-from <linux-media+bounces-60715-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:06:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFC74E34A4
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C24C3300D1FF
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 06:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0B1339875;
	Thu,  7 May 2026 06:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EffP+dlo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FYRg1bhk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED41336EDA
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 06:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778133962; cv=none; b=MLRiDqBnhKdqQ6EBQN8hKKq5kweec6iYWIRxNzc1BIHTpEh/1EXWhr2JoCg45TWbnAjFU5gjb/LmCH+Qe6FgU8RMWGeHxUR3wdTC8YJ1rfc0GOp+JR20T4k51z8V1f6W3vH3xRSxZhvPDqBkWbOCpDAlHfeok4DhVtymfSKhh44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778133962; c=relaxed/simple;
	bh=hN+CcMR/4h+yCDcjXi3OC+yJFGiVPGnsEedi4k8nUsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L4hQWI2pHEmoq67Ktg5LhDdW61dkKUVpJM+6c4ljfJLzZXY+Pc7qNUAsyar3DlPT98LI1lloeOVldBhGoST5SkQKSMLjIMRAg3NekeTGj7BHvh4d+qUw5tkfmwUsPLIRlbxEFRJKhq9E0fQxegldtyaEQ3VDG1AMrqV2MItZaU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EffP+dlo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FYRg1bhk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64745oHH879575
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 06:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=; b=EffP+dlokp7zmGb4
	5XrfBm3ZfPOxyrNDtgftFJYyrZ4VNh68J1OBZhsRE5cduW+TXeL1BsHUfir5yAWl
	ZyvtSSqJ8V+hcAShWupWv+J2Hx3++OOo3jDBNcZCIBUxDAsynKoC68mt0ATFdiiB
	lFQjOnnNhpmoBQioAoJXSFjX2QZ3dnYWLDeZxL2drQYD8OyoVaCK5IdaZUKFOf3p
	mcpucgP1/v+SCQjZuzMi/Xj7Tova0mTM3sOLr4vb5PVcMuAMUh5R+POI0gZJHOXa
	cArFNDPqq9oM4+p7/MGEhKtkGOckpOgA/sJ1RUAAqnB3vDg32ey838KG93HBFRDF
	Be6kFg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq0b8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:05:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8234c06a10so228716a12.3
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 23:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778133958; x=1778738758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=;
        b=FYRg1bhkQt888vAOcMBPUDW1Varq6w+mA6yxrXfOP0mVFfRtUrtEqXRRifUrWZ8/mu
         qMR3o1e5U//czys+EzgFtREc1mWg6WgOFVK0GOuBOORt4oSDUuGx7WW6HK1o11ZALt3M
         IGyVIeAcWvMdU0qFCzK72oN6CN8tjTgUpmAm9WNRX+Jg9O7ZGYkCyRqMvL4W1HELmLIb
         hjtmYAxjQQWH/qsVB3UQkrgLSfIm0bpKJe42LjRv6AbxG7oFk6PciX5VJH+U+MQTqfLu
         ZEgjl9v0NwOQbqxbD+Ik0OH7k6V7bQls+QslqtWFMCXz0v+itrzD3Qazav9v4iHXNo5q
         iGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778133958; x=1778738758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=;
        b=b4FYw+FNwcD+aJCjsD34qCBTn9iiOZb0mE6/Lz+ALOiNzAjKQb+NI8eVk2v+MKF5Le
         8iMwEARaSBjzxAcKOa1Yh5eQv2zYCMkQYjSz/iFwFBvg216ZTE1eQaYk+OjNVG43Fi7g
         lDaW1Yh7GuaCIqXCjX31xo2uR9eRAoKMDdCt1JKadVlGGxknY3FhyjCfEqkDUM2NIa8q
         bn28Go6vMvEdU2ss4lWzZ4NWTWanAmQdBDMNp+Oez4VAWZak98UkDkLU9nXBvB5Dadbz
         c5Q8D5htm1W6X3gDi9zb8mNfpswUB1kDH6RMI1akEq5jjOpc5J3oLkmLKzAtvsn9vWTZ
         Lr5Q==
X-Gm-Message-State: AOJu0YyvvIaPz1mp/oeW+4oT7ZzsSMOJNynVbmXKpah6qXnFthmHzYWY
	IocIcOd8h6MapHravipRMqrv6soklXWtQwKmBpBDqit/yVbihJtmbiVFm6ydZw/4XeJ3fWaykqj
	d9XxmmvnItLdLeLrhrakvk2FyaFunBU/LLtUSDfAS+gRQiNDbnrXPgvVnyP1T9sX/vw==
X-Gm-Gg: AeBDievpHrf8UYuV/04IzNtxd6zGGCBahC4DM0VOmzl0vLxlHi/ZD7con8Mvv11oPU1
	DnTE+5Qpb0wnfrKkY/mmcwgLtb2uCvJygtj08yarBLtsdj6EqGcwkT75VckJZJH9WgYCjoDJVd/
	OwNRk/9rUUUwrAXA9WzJzgpaJu4UEba3DKd95BOe7TsFB69YdAKkwTmZgTKxbKoQ//R5JLBiUYa
	3e8sIBPsLSGFiC/xAbJAjPOjAh7V0lRJqsBICgtSI5GBb6dZ8ljc0wqZntMVH+FI2p0MQoijwZm
	blb3ySTxChnwcVGXgXO6LcBbTfJbR1ghCDuA0dSrix8HF+UxRI2SawsBQ+GShRbd3+owyxumorH
	pwF/HvGIMJuiey9T257fExhsKCr3huKNu1Mn9uJCr1aHj8i7h7K7V2+UPTVC5rD573aJVmqdJAv
	Nn+k0LoimjU2/6pJQSyeZSTxEHEhNK1h4=
X-Received: by 2002:a05:6a00:ad09:b0:82d:62ed:b01d with SMTP id d2e1a72fcca58-83a5e344711mr6631734b3a.45.1778133957907;
        Wed, 06 May 2026 23:05:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad09:b0:82d:62ed:b01d with SMTP id d2e1a72fcca58-83a5e344711mr6631675b3a.45.1778133957215;
        Wed, 06 May 2026 23:05:57 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839685a3187sm7566187b3a.60.2026.05.06.23.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:05:56 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 07 May 2026 14:05:44 +0800
Subject: [PATCH v6 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable_iris_on_purwa-v6-1-48da505e23bf@oss.qualcomm.com>
References: <20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com>
In-Reply-To: <20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778133946; l=2090;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=hN+CcMR/4h+yCDcjXi3OC+yJFGiVPGnsEedi4k8nUsQ=;
 b=ySqW3zrt98saYppVDnevs5Z81HpuCw4cu5WC0GU9dwHrFvoWagPI+Y7wMDjG2goOoLqcySTxB
 hDCOb0ShalIBHTDHsSBNs6Jjzg2FB3VhX1SgIq8b9ex0pwA3j2Vgf5O
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc2bc6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=vdEEYnp-zpI4J6gZ5dEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: CiTRey6pMyDUmlTUodErm4RhGt6B73sV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1NyBTYWx0ZWRfXx3hoBZr+jZOv
 sOgiSUsK8t4ZkJNUYobNsZ4IKGGjcqSDme9sjxENOyurlhTx9w+UnTHHD6OgA5VjetyXh+D3+wX
 sg/gYBC6zdVxufHoPSLTIegVeVQTyT17HW1DPWfHTqGb/ru21iNftIvlsFkLXK/NA87MBG89NWD
 pRwxJG+avHiVooNRZJqm6M8L1mL2YvZy1CXtLJY0g9RXuOTHwtTgqVDuVud+2frmi3IjN1cogTq
 I/e5zsQ8dmTrZ2NEmC2XHloxczXU7LYIEeH+oA2gGtcazPEljbUfbMIhvCCno9QbDKNL39w93wy
 /gPuQ2e/gRzJWRg0r8fZRy5fvpFWzdhuSQhhaKqIwEhxYQLC32TGfBpFcXVq0vg7Ia0q61asH34
 8pYjqsl5lWvPzRjb/ETV0VdGXQK/dkgSb58gBWy7JdAvsiVg/Hy5yHPci/hL6uTd38kK5awo2uP
 Et60FER1riy6T/2PKtA==
X-Proofpoint-GUID: CiTRey6pMyDUmlTUodErm4RhGt6B73sV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070057
X-Rspamd-Queue-Id: 9CFC74E34A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60715-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the new compatible string "qcom,x1p42100-iris".

Unlike SM8550 where the BSE (Bitstream Engine) is clocked implicitly
via vcodec0_core, x1p42100 exposes a dedicated BSE clock vcodec0_bse
that requires explicit enable/disable and frequency configuration.
The SM8550 driver has no knowledge of this clock and therefore cannot
operate x1p42100 hardware correctly.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 9c4b760508b50251ac467ad44a366689260bfc0d..0400ca1bff05dcef6b742c3fbf77e38adca9f280 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
+          - qcom,x1p42100-iris
 
   reg:
     maxItems: 1
@@ -41,13 +42,16 @@ properties:
       - const: mmcx
 
   clocks:
-    maxItems: 3
+    minItems: 3
+    maxItems: 4
 
   clock-names:
+    minItems: 3
     items:
       - const: iface
       - const: core
       - const: vcodec0_core
+      - const: vcodec0_bse
 
   firmware-name:
     maxItems: 1
@@ -115,6 +119,23 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,x1p42100-iris
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
 
 unevaluatedProperties: false
 

-- 
2.43.0


