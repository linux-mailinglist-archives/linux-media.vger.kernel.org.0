Return-Path: <linux-media+bounces-57851-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDOfMbLyzGknYAYAu9opvQ
	(envelope-from <linux-media+bounces-57851-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 12:25:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 90405378726
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 12:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7D8CE305F22F
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 10:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731973ECBF3;
	Wed,  1 Apr 2026 10:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqJATRwA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aFrUwue5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B633E95A5
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039095; cv=none; b=bJTPAtvV2MrgNqSykJSdzaS5vBORFEG2Xh6uZGfMMvtLOsgAzDynY48Z7ThR2cePaivTQBbWBqa9ZLv4B8CSgpTpIymVAUZO51YmeMwsSRvAcyJzM1w3Y9HeKaPDaKl95FPfQ9L7NRJSYckz2TrxgxejLaPrgt0i8tnjaFUebBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039095; c=relaxed/simple;
	bh=V1xwU9zkDSIyMoQD8LZk++GaYMrCUStmgPDDStsddwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PmPV4Y8isiWjjGEA6owg7V4h9gvWMCemJyrgeoWqMWuQxU4F5nq/z6DFjG+8KY7Nizpv1D/o6SqTNwhAKZ8Y3dbBb2XT6zyuioLYwdLQwntRAV8VWM1S2X3q+LguszkW0iwtM/WyPU3MeFHuXkNx3gHMlkOE5V2CZ+aqAqkj9jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqJATRwA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aFrUwue5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317Er6v4106751
	for <linux-media@vger.kernel.org>; Wed, 1 Apr 2026 10:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OehOIAXSAowGbIjsW+N1EpUBsIAHoo/a+gTVikYDFdk=; b=VqJATRwAxdzF3yDe
	odoh0jmmWacOiTiFNenFwX8Kkq3RBSvAZT06e9zXqVrHcV6FlWe5G4G/0qGJtzaM
	4wj+B4i80CBrm6xWEzFr7cpKwGHsDcJmIhohN0CCFkoqlJUj0QKGsBFFAQVtRFKI
	GTU/utYSh+0bRnyw7YPTobzU0ffE0UZcFt5ZgdQ51k1XgPB/+TBPZH/NZZCICra5
	+roz+1RGjLMkc46SvdcbLATK9FkFrdq27GeJ0WKUYdTVpQVI9FrcRb1lYJlp4kxp
	hjtf41RESL0AUldXEdIn72lo99bnygxh6TvIfdP+lDJtrl6rtXeBCMbfj9u1jCPq
	nUQQwg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt90t61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 10:24:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso4941592b3a.0
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 03:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775039092; x=1775643892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OehOIAXSAowGbIjsW+N1EpUBsIAHoo/a+gTVikYDFdk=;
        b=aFrUwue5YQpy/qSaZzpJ1T1zHbC5wcfHBoWAd7e/0yup9yCpFvXfVvB+bPIsP9H1sx
         X9ItycnR/MiE0uYCN6VUhczqsWdKmPvf432eSKFBLJb6ZHscon/c0q7zrdj0MC1YJbR6
         Eru1bIs+QhvKiNnsI5njuer8HDd6uKSfDjezBT8mgrsrT5rXJqB29yc3Be2rWMwXXmmP
         zy3ruOFQ58nCIjVUkLw12/62KD+Kwg9LRLhAv/RHyECe0xwEs/S/xXopu8Ulv+E97/vS
         0lHqhanHIWgJuiaydtmOQcuefq2ahqgRtoFOwEZgVV4m9+l/33yOLPqlJsNCob0tFirw
         wCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039092; x=1775643892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OehOIAXSAowGbIjsW+N1EpUBsIAHoo/a+gTVikYDFdk=;
        b=Au0W0QHikY9JBBovwDc7uiEBdulB/zDmjScsU5IH0qwd84qs23duDhEMdLhW7SU4Y5
         kinhG2Yr/mrxfTE59/cnuNtr8DrJJRlgpytVIxgEYV5vmtNUseY3It/76pJB/cttlK9I
         eF8xzkvYDyulGuD1FJVMCv0Ofusem+uTKQ/ZkMg+pqEq98XVkbSMrutitioPsD4WvnZA
         odJgXezhaIYSku9Z0Q4RaLeEM9/ufteoFWnGwC7jMLgVDtfoxjnc626xmCjsXxOKliE/
         pUsokI5Xy+WhiBaE5w1TyvhG6ZQVbFvZCD6WN8rIq4JK6slK2t2MSEui/MworHlaZjXe
         6qtw==
X-Gm-Message-State: AOJu0YwaNZ8xQRCvx7DFCdJ73l+qsAjX00pUyZkgB+M187uHndo/MsCG
	hxW7gAub3LkrzwmUpKNPG9omEp0LBR3tol+ARqJuxPp6wBXp0j439RYvwL8VA7At9xk87zwigFd
	W3ZUwu+T66/O32XQUi4WuJFpx9d/2LzRSl2mmq2D1XFgorKgfp5B4uqDISczd/9ujkA==
X-Gm-Gg: ATEYQzwPVVnXw1MA6pl/fmzbuA897t5b/ldRQ9v2hYMp5MZ//aw4Z+MaTfkndttrIKe
	r2FGCn3+C0ibv/OzNVt7VDCnrzoH0AjOjW9kza1FjaYgvdVnIQgb+UwVAL4LqVS6jBBQqMa2AM6
	Jya0cqy73g9ag/DZHBn80Voz7Q1Yhi89H7v/z9brBoSw/bJR/uaHJEa805JrJub+aK0x6+FknrI
	tiNhd0aGOyNWNu019TNEG1InayAANBuRRuikvh/vgAxZRE6YO2XUQklsH2jpW5j2pDFbXQX2p7q
	xFQMDiCEkbM1I0Sm27pv9uj52C0jVgaZ03TIDgT9+Py7GMirVuC275ELp0FPwOMx83OwdUPv2Im
	C51Te4HeGD6ku15lqGyctJyp7s/4OdUJBcHDGx0lyWOxGB4Ey3zZ2c3UMRaSmw6nqP4i+yZI64l
	UIxMitjVlooTrjV8JoiGVJ
X-Received: by 2002:a05:6a00:3e1b:b0:827:2eff:a29e with SMTP id d2e1a72fcca58-82ce8ac8b47mr3121951b3a.34.1775039092496;
        Wed, 01 Apr 2026 03:24:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e1b:b0:827:2eff:a29e with SMTP id d2e1a72fcca58-82ce8ac8b47mr3121937b3a.34.1775039092043;
        Wed, 01 Apr 2026 03:24:52 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843bd8bsm13348329b3a.10.2026.04.01.03.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:24:51 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 18:24:38 +0800
Subject: [PATCH v4 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-enable_iris_on_purwa-v4-1-ca784552a3e9@oss.qualcomm.com>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
In-Reply-To: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
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
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775039081; l=1967;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=V1xwU9zkDSIyMoQD8LZk++GaYMrCUStmgPDDStsddwk=;
 b=weYSLiClw9bp5DOxXhxNoqiLgoUPSSPwqaPJyYFKqFOSJ6O+B2N4DGzBFq0Wu10y7d0SdeqAR
 kM3REzlcMXkBDtR+PzkNOkhVU2tHthHMliflgXmCj4l7XwF7yz3+JZf
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: YbbdLQWPHaUfxu1XGV_IWe8bfdxCy2n9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5NCBTYWx0ZWRfX4vxseXjqhUnS
 AScInT2UFXGVs9fPjwjElqiLZuoFa2jUuLfPOInkuC6a+X8kvH4HFXdpM9Mlrqg+Hec5fNYBUl5
 exrSOZY2XqcozAVo62wspA0OMRGArlkGYtAaB0AQPu4C3sgYXJtcsEVDzf9p6jy5tzRfPTGy7lR
 IBEAzoJHlMe+kmI0t5zGkGdvgG2ynI+hc+WTpU93WiA5K36vjYfmIH6mA0QHn3Af0gkdz1zaM3t
 0tx+lggOJSQgcToxGfWg/wls+CuP8ijt7BuGvazsmjVmn9XVGQ3qWqp/sZLDoo6MWtt+eOtszWZ
 kIjiSlsAgXU9IREy72z6LtzwlllLiXGezOkbiJ/l7j6FXUQ8/9oOrrU2Ugg2HIzoMfDxKNbkz7t
 cOscfdhESiliw/mGi3Zw+H+L1iStY5E0rpeDSHv38DHWip5DOLXGvnCdZKyYm7hYphsvbEXMmtW
 Q7C55G0uFRw3AKvjdXg==
X-Proofpoint-ORIG-GUID: YbbdLQWPHaUfxu1XGV_IWe8bfdxCy2n9
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69ccf275 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZIxFtT3Z7BdGPi6TYWEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010094
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-57851-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90405378726
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the new compatible string "qcom,x1p42100-iris".

The x1p42100 SoC integrates the same IRIS video hardware block as SM8550,
but represents a distinct hardware instance and therefore uses its own
compatible string.

The x1p42100 variant includes an additional Bitstream Engine (BSE) clock
that is not present on SM8550. This clock is described explicitly in the
binding.

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


