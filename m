Return-Path: <linux-media+bounces-63010-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLWcAMlBGWpVtAgAu9opvQ
	(envelope-from <linux-media+bounces-63010-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 09:35:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9583B5FE988
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 09:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 320653053BC8
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 07:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1383A9631;
	Fri, 29 May 2026 07:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="avyeEaf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IpPxjZ48"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5565B3AFCF0
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040117; cv=none; b=QrIfDxBLavsSpVS2QcmVV+L8yS1MOzvpzE97XkTT6JiKVu4vKNNf+f1pgutJ8DXFz82147U/DD66BB6M79Pnd+z061LZ9NvTW4DlmQ6vLtNvmqxT6iP+y3bFvBLHFMcwYZmb4Df4Z5C3SsSYOArX9MF2PRP5iVoeLv6vekOd4gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040117; c=relaxed/simple;
	bh=hN+CcMR/4h+yCDcjXi3OC+yJFGiVPGnsEedi4k8nUsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SKLh3MrYVOc8UCZUPrJOCpxEO7jOirelB5B1FvReaHnWD/J5Es5AlM85IK2/38oTi15G7u+VwmlqFkYkKKG8ivELOcoqBU7uE8hvlFSRoIjEW1+fyHEO3YHaP7v9bORXyabGEaNywXkDTe9bPtnCSOpF9kd6Mh9jDVOQ0pQ2y6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=avyeEaf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IpPxjZ48; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6Kkhi2118164
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=; b=avyeEaf3WLr9mVrL
	HrmvUOeEEZmmv0zbo6K2GXZ9S6+DK4Ir1tv+kENTy85CjdVPyKsQfgHaOL3ao3U2
	GErFd0URfRd7xEodcbcKo/kiraz0BFeazxx62j6UL1dHxnnrHmcFNsvPWk+Kf91m
	pwn35ccFFCotLIsXdQhFlZo6uH3dNFrWEA3I/D+yOIDxdeZ1S8oUU3whoIxvgVjD
	cZhr9d8oxH9Zx28gxSjjkkoGXigXHrAl5i5HRK27b0UScUsRTWn17TqWy86nFDcY
	4aoWdx17hmQr1o9L2Pa7ss6xzTTvNdQv7rOA0dcjVhLyVSTboczRkvvpSmYFzgM6
	jOhDZw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eeuy5ahsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:35:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4654f9bb6so150738015ad.2
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 00:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780040115; x=1780644915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=;
        b=IpPxjZ480nVahzhDsjOsGeprzIXbaZioADHsSbyL+rIyxGzfpZGrevw1UU4BV2V0rA
         yYh896e/UuxwHeUHEM5KuYfQ2/i0TUBIdGTDH7YSGHFgKAZDNG+j1xf84m4OWF1mo3dT
         Uz5+YcLDamngGf/QrHFlNiyrrbp2F1Ru0EoAonydG0TN3gmd5q2vKem6xnbcUQof2ZJO
         F/WL7AUUE9FIZDqSusNgBV0D54vL+pi3tE6OomaMFabHm/HTR/I9QqTPF3xp8FuBvm+I
         YRSnw48adCPqOOxCDs+EDUxykfFghFUuB0JvYF3oFMOCIRcQ2urAnQbPGYOqGEvSn7u+
         wYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040115; x=1780644915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=;
        b=Sq118Mqq305WKogWemjxul6W/sC0PCPJImH1EnjOw9Q/MlEA37FLZ8QQ5ok2Bflv0M
         8oUZKA+nDWxcC6Sbzst2hdGNF2ps1Ux0xpY6/oLcsiL5nkT0McUw641OJ4qhvhhfTLvA
         QE/dA6/OxeJ0q9qeNqoEh/PQ49BdwNTMi4Dql3xf0k7s3pgfqLNL3CRxOnb3kLTiFB6g
         ofd5NBuJNgxGFRqal5pRccz8xeYx8J2SUZZgmODrHPVKGIzeuzcq5VQbnQjgS1Dg1KrM
         V7rtXJ6C9n75QXVter5ECPBv83/OnBcrvp7PSfN/hGZN0mXdqzlC5WhtwLsKYUgX7GIh
         X8qA==
X-Gm-Message-State: AOJu0Yzzr5dLfm3k9MPTCi+f/vb5lwjloEn4EmBNfptY7ZYJ7s2nv3Xn
	8SVy39i6rmSct0xkqjeAgMsOEbsI9HCYCJWL/cRnrulGwLNBiczJZPAjJQdBDcsrqykU4t45WJf
	1f7sjICldKy65WLdViuXYVYe36RUuAi4Urs/XcKhrkxwJsrVkRXMHm4BQeNYWkb//2AfI9R1ouG
	z/
X-Gm-Gg: Acq92OGmvqG8h7b849JczNVdzDCqln4LsfPY0G12lvDaK4Tv1/YvrHy4f9rEuJ31Tf0
	lVTE1JD4O1xakFymJOLsFnnPj//LIY2Xoj8dnKJL6OCICQdh0ezp7VKxqWHpJKm32JHCNspT0St
	cH2XUsvryApRlyw30Wp91DtC8c3sniEB1wK5mNWcjoVdbFrGBAskVAsCjqA7rTIOzKLfaMtPlYa
	x6AHJEF+z2YHkfGcrEfKPmMaWT1AZaHVHcF/jEzIqGd/51KaXTbWZPErJ8qV2E97J0W33nBxpsu
	wdL3N+xtvItY/4iwrk8mMmZrt43VhlBwnJhYNhwmU7B6hLkLiPfTNHKk9wc8wYT3H+FnzSKnArQ
	U+YKeOEgAgQVKBgjI3Ap9hRtjNC5BDANurwSPXWawk2nx+G64MJ+hH7e/5PWqSOXBzoaa4x9lUR
	/ID5Z44j2MbI0AwDvr3ngBNMN0fAdX2xU=
X-Received: by 2002:a17:902:ea0d:b0:2bd:4b8c:fd30 with SMTP id d9443c01a7336-2bf20ce71d1mr23150005ad.41.1780040114826;
        Fri, 29 May 2026 00:35:14 -0700 (PDT)
X-Received: by 2002:a17:902:ea0d:b0:2bd:4b8c:fd30 with SMTP id d9443c01a7336-2bf20ce71d1mr23148655ad.41.1780040112841;
        Fri, 29 May 2026 00:35:12 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011d3sm9767335ad.52.2026.05.29.00.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:35:12 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 29 May 2026 15:34:58 +0800
Subject: [PATCH v8 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-enable_iris_on_purwa-v8-1-b1b9670459ab@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
In-Reply-To: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780040102; l=2090;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=hN+CcMR/4h+yCDcjXi3OC+yJFGiVPGnsEedi4k8nUsQ=;
 b=8ZAMmoJONTi8l/umFhkC2sOa0L9b4o45/2EgRUWWydk6hU5M/O7pGnEswHAG77EHEASth8lTj
 Q9kLskIVOWEBGqwCHMTkV3qYyp/meYN7m9Q+tcD6uyYi0JARnae5/88
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=SPtykuvH c=1 sm=1 tr=0 ts=6a1941b3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=vdEEYnp-zpI4J6gZ5dEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MzCFdpY_m3w4RuMzQtY35Qn0FbubthZu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3MiBTYWx0ZWRfX+8u9xS4tsV/H
 CCt1xewjBmHh+7GWrheH9d9BsKilD9c0NtPoaVLoEQDa34ugqLKBlGSFbNrXBGhybQZLeFIxusg
 yPOwTfy/DoYSPbtuK5f7ZBOOK93fO4f70zIOv8KgL07yN2N8WkdipiA/IbMhQ4xpPz7GZHBcnkq
 GZueFwkJAAMqPQsFHdSALaw+2+aV2KnphEOVpQV/FmJvRl8nL7ZnnlZoyYqezC5KNyF9wD029l3
 vX8geL9HxWLpYo3RjRqc/zmDM4Mv9IZEi6Omla9gzv5LJurvWFCXJw9mYT4T+xqpxX2N6l/0Hus
 u2cp4KfcKmbqTILLaNNL6OH4GkWuv7EhqapdM54fYuOHJL3LWaC+9+RXj6aFBX5sRz8PE/+NXIT
 vgNQOJP4IrUI/Ad94h5YydIQWww7+KpqlF22abFKr8U2VsdTBx7Ims0ITFXqkFV9l18iwPL6paf
 lf6qVdviA4mj8yKVJmQ==
X-Proofpoint-ORIG-GUID: MzCFdpY_m3w4RuMzQtY35Qn0FbubthZu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290072
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63010-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: 9583B5FE988
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


