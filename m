Return-Path: <linux-media+bounces-61590-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJ9EDVGgBWo1ZAIAu9opvQ
	(envelope-from <linux-media+bounces-61590-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:13:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A773E540363
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4180306D40F
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8844D3909B1;
	Thu, 14 May 2026 10:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaPqxgdo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XT/PFZi2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5EF395AD5
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753392; cv=none; b=dRAWZg8Po40J7Kfn1whVwodaoH7SkmCoSRxUOWlUPPRTjVqJ8tTvkh2xgHKvInCgWOyMWxwqQ8wu7UitPIFecWW7E2+6gQF4818iVPhroKht+HinGAd9NkiiSXz1m7rvdOAvoOAvwnClAvPrOmdjBfWeYwi7w8vYU3SvatZN31M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753392; c=relaxed/simple;
	bh=hN+CcMR/4h+yCDcjXi3OC+yJFGiVPGnsEedi4k8nUsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D+y2IItwv+xXqKpBhJpqQuIwUic3BF0xJCFcTzh24TjNQj0FOgTTx4Z//7Cx4c3w9d4BN0MPEY0hsTfj3chI0pMTttJW6aXTRhVVYVHzBZiSwU3homgT4dtb2whGWWgwPyk4vyzhxZ8ojQOvMvTwyWY9z6FBb+FHs8/G304xYvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kaPqxgdo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XT/PFZi2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kKt13641060
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=; b=kaPqxgdotF8HSTsz
	LpFohmizT3y3giUL6pPTMQUG9YWLTXRlCvKrj92u0EPsC1ps5ZzefK12dIV/g2vh
	95VqlcmITakvQKnWXAtVabkdtfw2MsUmh/rlH50f1Z7UT9BTIJWLUh8VJvSxT5qT
	62tOi4rAn4SK0agQQpU7E2TRrY6wUacGZtVP4sRrYcaGtx+06/AX35y+pbziy0mP
	ZWfQg90FLk3djfbPS1DtLt9Y3LpJD6JPKGaDJ0j1oxV6LP4lkmtqLcyIGFuV1i4/
	FXbLQgtFA5clJkOuadTwuavxY0Xw2wr+GuzXyaZMSsYu0tCM7nEuyOO2lonQIDFm
	lXkDDQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tuhpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:09:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c828b1b7fddso2644454a12.3
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778753389; x=1779358189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=;
        b=XT/PFZi2DZ+hvtWN5TDBSCWeqKvbImEGB3VCSK3y5ksFO+e+h2BEFIvWW9lWcJBkLe
         Yz6/omKjMGdiUaEQCJ4jT+EsJjKVwAOeWFNmCeWFKcFtL/m28JVwRiKesra2AXISWL5I
         kMfvswnGk4yDwP2WX8z8mmOyTJy7kdKplS4lCzEc2OvblhZwnMiY13LEYsXTmVFaykKJ
         aemMVYz0GsGZ3pz4GrWOWAGR0uY6zstXou/p6+PVf8Hvg/ECnbVHYxZS4ssbHo/E7C3R
         /VXKEdUSgxcRvVVS2VYlG16fJfCJbraPz6oD8GcaPgiqMg+srQLsrmq1WFoGqb2+OXAz
         LrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753389; x=1779358189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=;
        b=W7wYCKYqjUzbHitcX1B74SrGFTv9QZn6C2yeUFfv7MMFFTfnjhhkQ4SBjqbfxMZC49
         w5HP1cKTVMJebIg7q82+62iOrcZHWWFXsczz8VyJ3YKh9G53c/EbDnlhAFrnVTVAirst
         7XmP3Tlhr8hKJAfrPeMbmC5x8SLLZhv9e/vw+B4DAH+7Iw6mcNtW1zs2TcexQC72rsL1
         Fl5jzGBBjKN06qdbWif/LikTQKgdk8nhXHpsVQKO16e6RKjk4ICxxrS87dKqJ4eH90li
         y51Bc7BAH/pllq3Va547NTctb+hUXeTZJm3nPo8Eh2Zo5aFXYmft8sv8n5g1DukeR0lV
         NvJA==
X-Gm-Message-State: AOJu0YxHy3L6XiMNjNGooWEOF5d0gF714SV53KKlvhFWxM3Y2GpB4H2m
	eNBvTQX+DcAiXqsFy4rNBgwY4Oq1l0f9BGbWQa5SM/S7iyp8XC8+kI9s91Xez3UhGUz4uP/kWQo
	1J2ijKnCQ3iuFccf3euK2N1O6myXopSiPUz2HqFvsGmsZ1cWBRzrcEayOZj8Y+hUATw==
X-Gm-Gg: Acq92OHThnS1l2Rs+/IGynd3vMOrgMnsb98GtFHjVFjBo5oZ/0DEIJKFXy45wQwXdte
	JjphBgw2Ok2aMoXcaEpC9kc2nn6CYsyzSGDQ6DJUotDLLMaeUSvvDSFW4PsMjriCLlTUGw0tYbc
	gkZDxOixhnbSnug63gvonXq/oVjcTwkr36zi2xFNybht711kx2MUH+ONuQ0XNsGLoYrxF/3VJFX
	eqtk6AZx/8wTmV+WFYC08ICWGJYO6aD3PVhH8uT8fcR/RWrdgQv0VxCdrzP5gZACcw6A932rc6p
	nd6lAMAIl9uMmkk488AWcCUpGfXCnZSxideYeTwIyHvnZ2/gKofLAQ900fiPTf52sVWOkxigR+J
	h4j30TG4gpkiEEYOQa+gjhzZm1qF6OpafyRhDaebHbrrHxKyaeHWUCjLr8kepcJ9Lzut84OTz8T
	H0byiL89IZkmL373j2OAjW
X-Received: by 2002:a05:6a20:3955:b0:3aa:f9cb:d43c with SMTP id adf61e73a8af0-3af80c7df00mr8203319637.34.1778753389117;
        Thu, 14 May 2026 03:09:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:3955:b0:3aa:f9cb:d43c with SMTP id adf61e73a8af0-3af80c7df00mr8203279637.34.1778753388454;
        Thu, 14 May 2026 03:09:48 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07b007sm1966450a12.11.2026.05.14.03.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:09:47 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:09:33 +0800
Subject: [PATCH v7 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-enable_iris_on_purwa-v7-1-47aa5b026f1a@oss.qualcomm.com>
References: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
In-Reply-To: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778753378; l=2090;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=hN+CcMR/4h+yCDcjXi3OC+yJFGiVPGnsEedi4k8nUsQ=;
 b=LMuK4N3K3iRXR9uDO9yPF60v1xg0w83b3UFfvpAmAljL+QJiXGy9CE91vy1tD/tzk+qdRvDFJ
 RrRisRH2HzkANtypoIiMNnHdegXZoqXUEycn1x3j6GxP07UIkPRkFCq
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a059f6d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=vdEEYnp-zpI4J6gZ5dEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwMCBTYWx0ZWRfXwDv8c/1v95Wt
 LYX3QSiCl+w9HhDRXRPt3zsI+/Je0YGaudZ/X/dd4QIYLniAlQp2S6XyrniPUiZl4aOB5JD+/mE
 Mt6N39jWor57g9F+9esDdcW8KPQoHfO8/7hmHEBfI6a+Pu4LwkkhCQJgwGQqV4o1iQ1SyixMw97
 GY6FOIAKf5TQmYO/foG2kGJl1so54XGPtgekZT7q2sR6je6dtNWPP02BkDMUnl+KivZhFl45l8l
 PE/jDydvu6CCW1j70yDf9ZiLmPgD6sNON0Q+VnyUQJPcy3F4x0+NwUKIxiVzl4Es4tom/F7y0xy
 vPDRWCtR1J6NBDiH3HMysmEtVB8s1Nq0JUSTCpIiNXCdrKqm3SFQRFgVd4aEDy++2GqkNdW9izt
 qg+TjSZFFEbIjwLANctwMJBEQENDuODWCCg9rCTk7HDlIbn8RqvGkluUmeL9N4nVFd1ovRRQYKm
 2LKFRpDD03bkB81Nmog==
X-Proofpoint-ORIG-GUID: ZEgIBH8yFZjHNdXSqthqNP4SQQhjXcBi
X-Proofpoint-GUID: ZEgIBH8yFZjHNdXSqthqNP4SQQhjXcBi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140100
X-Rspamd-Queue-Id: A773E540363
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61590-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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


