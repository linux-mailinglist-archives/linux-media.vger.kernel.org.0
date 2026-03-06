Return-Path: <linux-media+bounces-54707-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLw6GoiUqmkkUAEAu9opvQ
	(envelope-from <linux-media+bounces-54707-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 09:47:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C15C821D501
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 09:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00BA830A541A
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 08:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A9437A485;
	Fri,  6 Mar 2026 08:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G58vDAB3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CmCSr/Nv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07DF379ED7
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 08:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786687; cv=none; b=LDJe9hhhSNnEqxt+s/9axX0z0BetlVLr0E5sDTbo2a0LiDBC25XqQc868mjICkTKwNXJJdFvlxaux2G5v+m3gcyXCZ3rD2/MBUz1R3UjAHkROsDstRFaMZuUZHB3OWBGshTHw6RPDAX+TJ5um1IO8XwLKQfoIJNIA/swNltt9Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786687; c=relaxed/simple;
	bh=w21jMDaZrGB02auvZr5ohZpYlh3pe5ze+V3Lti5Q+Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cKxaIhW21ihEw5rQy4p7gVi9KSWRbHV3Ujj7di30glJZvM87gXbrpZHo9gxE1qGr/FeAmj39Y8SF5z3NPX/8cLxjdpGlBcUAeMXwwOMgKe/Pc6cQfljLOBsp44p+5DkWAZ3W9SCrti1KG6NKcZIeuRdlsrOYGdUVxTlb2xJxo6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G58vDAB3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CmCSr/Nv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aXKr2483274
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 08:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vI4/4W5Aajj1NW2T3+dqTuaPe4SwAiIcaUk04WPRPCI=; b=G58vDAB3GNO9zRaA
	x7S7W0hfmImcHIrRt+Rtbm1KXF6iTsK7Rq05POkA9j57fc+eD3+QubVbMiBh9Z+d
	Yds7QwHiKVuW0OOpj4O8GkUn0isdwEM3xIvqYBJbPd2Yq0kqIiu+iZ3bjQGKjtYp
	1JpZ2nwasAeKQ9Wxk93M/Y2m8RBTzd14pAC5UMJOowVqi/9Q/j6JMhM9VQF8YOmJ
	85Ig6OcI+7M2ksOvbvEL2Jd2vZ6LLSAJ5yrnX880c0VdDkQn1VaKceyZcUQ2aF9b
	yIUeBluBulREUT74H2YmJ06xwRDOeDcntRJPIj7pCiF1RINtRTd6wEIht+NLSbH7
	mQGQyA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq84wbxh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 08:44:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82747fb4cf3so3869516b3a.2
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 00:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772786683; x=1773391483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vI4/4W5Aajj1NW2T3+dqTuaPe4SwAiIcaUk04WPRPCI=;
        b=CmCSr/NvIQKeC+hTFjE+D3ej1TwKSY0STFwo0SPC2y9E+gYWN72qfU/v8LDO4wdj8w
         pIE03wIa6e9BbzY0gpr6jvarcGPxFRyH95hPer1Ex7oheZDZflZEH1AfrWVzOzOfEJJR
         KDb1PHChxUuLqR+cM23FG/LdoE1Ba1biF5zK0+cPUBleaGZFP7+Wzka6Tc1oOQl0TdiI
         fOrtVr7zwokjlGfHRCrVGghp9o0cQKQ/GP7TVHj4CN1HFUNwtd/jwHM5pqHfAPJa6+SF
         8IiVopmY06KUblDeytfEOggd1aIe7MZH/yPiaoC2WOr3e/kdYYqfTqDbN4BQOzIGfwqO
         9Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786683; x=1773391483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vI4/4W5Aajj1NW2T3+dqTuaPe4SwAiIcaUk04WPRPCI=;
        b=aSEZeqIK6RHy+2Gq4djuQyXfLcL/I4387fLc+z8oajVqQNXFaOLlSf3ja/2XqabYB3
         WBQ88xhgXeARwor4yguW6GiWm6TaJwC1rH7eWZqE+Dp38s9oxJuCSbjnUljhSy5+lNgN
         s/6yuBR5j+OgOoZ4qKbj2WFIFQyxY3gwBKqLdEtJGeVTqlv9dsoqFAR7EGCGLZvrE4ov
         hLfRSyML3gRnwkeV5jP9gVI/zwVu0E2yPjWJCVUOgRmJ+HCRZ8C/TgwmqxqnC6COCugI
         SrwsS24EPkCLDjBIdW5n/cVo0wuoL+wM7qJhO1c67ByEPXAx3e3QaXd9fzekTBKh29ew
         SExg==
X-Gm-Message-State: AOJu0YyuUjQ3CClWWXLyzCLEnwhrJhgerW0WdNo4YhuN/XEb09V45Imz
	z0UgOuoJ4SVY1AEfKEUh6OqW1fs/hFxpdKn0eygZbnA2VQUsX/qZhvSvjNlC/gdfNxHoH9vkRpg
	Os5as9hLscM49hHMHU9jJDna1BspSGMmUzJB4nLq14Odp8d5ZGg7j6m4ss2H+FmQFTA==
X-Gm-Gg: ATEYQzw4w4mEh5zADAvyEjn69UlaL59y38uCLio07Ig9TF4cHCnFMXAT1vaJFILWRy9
	gpf75eH2XJL3KjSwrgOQ8e8UaiEpHmrIM8Ej0jjHzHtKcqPJTMCgCZ0JHB+tkG+SICNmFjjbCpw
	QK2C4IjpJhznCs4XqLd6sQITWMgTEzqn0/7lIoiq75O3jIzKL0CmlqtdT/V69lYnRz73BJAS2dL
	cdKwyem16q/Rxj46V0uOcjsAU7dWpcBaUv2fUoWbNUTDzEfPkfrF8Qq7nbvRfnmUNEAO4l3pyHA
	R1IIH7+vpPyh2DVsNdpP/pfH2JGMNtODQogfDMpYYtTnZ+P/dDSbEg8x6cbuWkD4d5B6ER5To/6
	gkIDYXCT057gEQB5zfSfEjdgyHzj3PW6CpFCONru86uYJYE6zBGLhP7yY8fPgrKU8YigPwnwayM
	RNlXg5n1gkOZnCbeV+bPPs
X-Received: by 2002:a05:6a00:993:b0:829:86a5:d30f with SMTP id d2e1a72fcca58-829a2d81e40mr1412657b3a.11.1772786683445;
        Fri, 06 Mar 2026 00:44:43 -0800 (PST)
X-Received: by 2002:a05:6a00:993:b0:829:86a5:d30f with SMTP id d2e1a72fcca58-829a2d81e40mr1412635b3a.11.1772786682947;
        Fri, 06 Mar 2026 00:44:42 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4636c74sm1393573b3a.12.2026.03.06.00.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 00:44:42 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:44:29 +0800
Subject: [PATCH v2 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-enable_iris_on_purwa-v2-1-75fa80a0a9e3@oss.qualcomm.com>
References: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
In-Reply-To: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772786674; l=1851;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=w21jMDaZrGB02auvZr5ohZpYlh3pe5ze+V3Lti5Q+Ts=;
 b=S3bJBPfDcGsIIQXCEuO2+ooBXPVZeWngwbvMq074OUUvfGghNofGXvNpUApTpRBhV25Vr4ZvY
 ArASLdNP890CMkgetD8IHe7wNqgVkYVioFQdLg0NkHmY//F8GoS9EiD
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: PtKyS-o6d9qxKGY4LHL8e6G0C0Byfvyn
X-Proofpoint-GUID: PtKyS-o6d9qxKGY4LHL8e6G0C0Byfvyn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4MiBTYWx0ZWRfXw5EnUtgRGOFT
 8mDE3L/ak18JGq1urhOUARXv/bkN7kaOgR5UDwBdAZiJt8J+10x78YeWSxQhkF4bvZNwyR5cL6I
 myOsRgY2ZDy8TxEdCTLd0vuFNGrhUyNlSg6dSS/1w7xhq53dzkgsljT+5m/XH4tx4RtINrHGuc8
 I7q2NWtHiW3gZsfEurA2yvSBguqBVoWry95tOnwkGqX9SNlTnyG2lifPP6JRlqsQ29ION34tt51
 P+S26e97S4CIX18AoUHGP3aAhL4WjjN0uoMkLex0q38pKYgM7I7gXU3NGrYvwqPOQgP6IHkxRS4
 /tXRaS3E/Mu3rTvPB3RBWYtGaQro07pDma3DJyIJrmIEEXnRm1jA4ATHLja6JD/8NgAwO/3mJX1
 6TK5qMNuTnLXIm3UJse5WltRpe+bPeSZc/mlgnkSXEx3+oLDh7Kp2jX6JqtIOZRxG5MA1tPzZ/a
 7pBGl967YW929eRjGDg==
X-Authority-Analysis: v=2.4 cv=N64k1m9B c=1 sm=1 tr=0 ts=69aa93fc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=BfjIKjrZkJso1lgBsdMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060082
X-Rspamd-Queue-Id: C15C821D501
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-54707-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the new compatible "qcom,x1p42100-iris", which is compatible
with SM8550 but adds an additional set of clocks. The BSE clock is
used to drive the Bin Stream Engine, which is a sub-block of the
video codec hardware responsible for bitstream-level processing.

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


