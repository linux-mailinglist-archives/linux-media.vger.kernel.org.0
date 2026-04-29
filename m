Return-Path: <linux-media+bounces-59935-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HmTDti28WngjwEAu9opvQ
	(envelope-from <linux-media+bounces-59935-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:44:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8EA490A0F
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 488C13010610
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 07:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525EB3A782E;
	Wed, 29 Apr 2026 07:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FOa6jCDb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gngLto7N"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D620B3A6EF9
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448654; cv=none; b=ZmB9+3IdNagRGyAAMbm3+AEyUqCGDlpAvqIyggjEEDDHycR7Dx9mE8yY53HZ1s5LHtQ5wYtJ56QbMYxhPupln9Yss4mjmhMuB5bVvM06odCq9FMyAYii7uCyhaWItFBbgFnk9aIpq0TLhmLCxTKvYv9nZ2gRHwlXxKUNGfD5mAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448654; c=relaxed/simple;
	bh=nCGNVdOSbKP+5Rvbk/rIUMxHzIT1UqzaZk73i/hheGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=chbqZh7zQbYOqXN6F7D+hypqGRbc3fmxAuQHIhkUGinSIlI2sqrY528YNaROLFGP4rR13VIK/Lm4p9qefO4vUfdzkLeT5w8HZEAhWzj3YL2FnUOar32aPjJ+ZLxyhJTZVMUjuEBHzCc4SYQuVyURs4No9GAy7Zn1Vwz96wGX1z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FOa6jCDb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gngLto7N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T7KnNg1882178
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	54q3QdZTSNqZ5QHSHcRcWp5cb9aGSfdnYyk7ggJYBHY=; b=FOa6jCDbRllsTgbG
	fHHxmCsEDF1OKds+K/ic3/zeBy94bmf51PLVfUgzwf2cs0QeKOLUV0ToSLekG6NN
	GsX7qneRkno2c2pwEqF/dV62MZQcKFfFsQy+GM0u3IzQrZhi1tkZkosRcjVZrCh6
	YQe/njYG5bhtpPrH0i5XYckpDfvHsCUPd+6WGp023SSlXXtF263DGIQjPapQTjU2
	gJEFixzUAewc1YeXON1zeEsAU+fnuWayTXw2qFBNZSo3Jqu7V6cxyqRAAHEsXFER
	BEynfGe8IQjO30Y4Tp479Id7R2gSuHvMKLn9v9SzA+2HG+La0IIzLuAe2TtirYzs
	q+gOhg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3r4c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:44:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c79943d2fbfso3815426a12.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 00:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777448651; x=1778053451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54q3QdZTSNqZ5QHSHcRcWp5cb9aGSfdnYyk7ggJYBHY=;
        b=gngLto7NC50zFipJEh2gJZByvgG9uKfGSyYCbug2Uilmoq7EDgTdUyuuyjw4yKToOu
         0RgsTEun/+bmH36jOJ7/14REmHuGWl8hRx34gnlQmdqqYrWrC2WgzyZIi02A+r9jLipP
         JlBeakjJr5zBIVMVWi/HE81qQwodcTipSQqEfU+O2bN+1eYx1v4mxkGfZZLh0BFTT8Se
         NQbFQh6rKHdPt1Ncpd2GArKnjZqts6DAhMvmYlf+9Cjs7KdTsxLKGCyq4BoMJp9iIrw0
         19OuNL4SfF5b049BB9MnAHM0nd1SjqxDTgw81r41GuxP2gvUubrWBZCIwktbB6mdguSP
         6B/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448651; x=1778053451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=54q3QdZTSNqZ5QHSHcRcWp5cb9aGSfdnYyk7ggJYBHY=;
        b=ssNBzeCblOAWXzpdjXqmJ0PQANsZ23s/Fbea68be9aSldg4dztfiHrWwvDwRhTSnlu
         H56NmYegU2CNN+gyelHe4W3olLs4FRYCZXkxrDCAnaKbHSPgceTKUp7A9ZWW+1p7/rEf
         ngMkR26mUYOxHG2x7E88Tbr7I07IyDDMbTQDrgZQjllLSLFfwoj9rGzcU+GYKfUaF669
         0CLV1mg7N0XJgzg6FQy7Whcw4XctE8UPXvj4cncCnnAN0+1IG69jVo4V1895SMAV9oYt
         KHFgox0HOJPLdp03YrVTSJTT/IzIg9KMoiR1+TWJmjDd5Fck73FWbizfgcZbnegFW2rW
         W9vg==
X-Gm-Message-State: AOJu0YxKeY18abLCCaWMKT7NEskBrEfqygYqyLgTfnCAvlbNKT4h1I0c
	Umoi3eYyhwLsA7C84yX811Nzuxu9Xl8rX8q9o+/A7mZ2PuLqBJt5Ot5yFF+A0/IrI4bg6oG2jiT
	ndtVVbq75mY5CNWuqBbQqiyf8Kb3vLadmqwpUw8IcnVgNRw4ycONT81KlRYaWuzAAqaziHFZFdw
	==
X-Gm-Gg: AeBDievSmCjgShR2BE6jHL2V5dH4Dg7G6l7T8wX090lK7SkmE/9R3lh1Ef+g2WELPJe
	RecFGVx1vzMqmNIRO4VD+K2XI3n0Fb0P7dn55sts5HPh1DkHSF4i21NVeYF9SHS2vW5kUYvUiQg
	bRrVOqC+h2iU4xnYYyaJO2lTSfStuEI1hA8fV4vTwhDIs5H7O0+p7DIrfODN2EJ2MPkcAWCFeUW
	OZsN0BpJUXHx/CDMD8vWKrg+oGcmoFErovvi3hhs3bYvD17vwhXHP26ISYOEHaYM9k4JODEzkug
	wDUclSXieI+Hz+33UL6WcrtdY0EY+rtD9vjsUeucOqA81aeFS1Vecx1XHCH6ko10yr3hzAh6CaB
	EUOU3TFhOecbmESILDmtq5aAUbf4Hb+qxmQdHb//fxoJcsre+43PMFbzJ1REdW4g=
X-Received: by 2002:a05:6a20:e211:b0:3a2:d68d:9e6c with SMTP id adf61e73a8af0-3a39c32e8d2mr7733625637.56.1777448650693;
        Wed, 29 Apr 2026 00:44:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:e211:b0:3a2:d68d:9e6c with SMTP id adf61e73a8af0-3a39c32e8d2mr7733578637.56.1777448650218;
        Wed, 29 Apr 2026 00:44:10 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506858sm1155848a12.24.2026.04.29.00.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:44:09 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:43:52 +0800
Subject: [PATCH v5 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-enable_iris_on_purwa-v5-1-438fa96da248@oss.qualcomm.com>
References: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
In-Reply-To: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777448637; l=2017;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=nCGNVdOSbKP+5Rvbk/rIUMxHzIT1UqzaZk73i/hheGU=;
 b=SsLaueJ9P2BSamWpqEywUfgQ/TPTcl/0wfNpalloUqAqne62mP402W7Jl9OyZXtgt0lUudSaF
 ev89sTRtzaeDdIV2A6qiaqqr6R7kGcVxYnBq2eDgCV4zYUQfx8Jx9kl
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: 93UziVNVN7FieeOeqfSQ_aKYa9kfeo0E
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f1b6cb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=IRvKDNPyRmbH6eZ6UP0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 93UziVNVN7FieeOeqfSQ_aKYa9kfeo0E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3NSBTYWx0ZWRfX7LR7CCj3awfX
 CoUmPsrkzgfSduJjcj7byeVYOvYj1jHkAa8JtYPgXP87m66CGk7Z/8qNxMAEmnVskk8Qy0bljXn
 oY6tPTnJK4JpoZs/AGsiERW1x/CU4uWW+SeI2wfh0Danw2NtOfZwtqx9nQmCOjNuTaaWSZg3FUg
 jjCA9a8EF1v9E0yXPRWc4aji0MKStvHXw9X9zP+Aj20vd86HiJY09fWx/bt3ztV8TLupzXRICTt
 ikAQGAzgIZKArdh+q2OR49arHuAgi5GQMBJJsqPagPEQKEUh7AzMN5tVcT0lZPde9PQ6jpNn5eS
 WOm4qP4XM0/8Sp8mq0EJL0OK029hj54aNjV/TVlbx0P9moe7Si8btnOddLKCiHCUob07/ZO2SdZ
 dPWkFlynNnqmPx4vTHchFzCSKkFplmIEJnop+ZLSwn3SYWvGanAKBs1VBVEjLuCXXHJ+mCHi9C4
 H9qkdZ+M8Iuvs23cSiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290075
X-Rspamd-Queue-Id: 8F8EA490A0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59935-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the new compatible string "qcom,x1p42100-iris".

Unlike SM8550 where the BSE (Bitstream Engine) is clocked implicitly
via vcodec0_core, x1p42100 exposes a dedicated BSE clock vcodec0_bse
that requires explicit enable/disable and frequency configuration.
The SM8550 driver has no knowledge of this clock and therefore cannot
operate x1p42100 hardware correctly.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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


