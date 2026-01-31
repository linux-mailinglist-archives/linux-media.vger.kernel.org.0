Return-Path: <linux-media+bounces-51891-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNf3OrgKfmktVAIAu9opvQ
	(envelope-from <linux-media+bounces-51891-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 14:59:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A84EAC21EF
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 14:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BED2E30058E5
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 13:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC9B355034;
	Sat, 31 Jan 2026 13:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XYLhIWXp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FoM+d/9A"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6193355037
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 13:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769867940; cv=none; b=JaFiDsk+BYRrX0yOMTQ0m+m+h5Qe9OZOoLWdBt+pG+7C67rFuWcG8f67WRhL22DobYpUESxedBqaNTZhmELIaFwgDK6PZ+1wzZYadZsShnl5FdnyIDsRSJBmGLSFPbu2m9peFyMgIaik4OU9dXHlBF9E/2gZNgZe9Ev8d6nmoUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769867940; c=relaxed/simple;
	bh=pvGogtYz3ToyC7AvsbxMd3Op0x0cS14QLEENjtD1YWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sogoKqfXLHVN7cW7rAEVfKnA3w1lrWzgQGDp3U6YTjFQsK58bL4sFX0wTv3elajeNXHQIW3ie2pfdhuo5wnBK7MH4ytFm3rVK65C3/XZGjmZ0bWIljSHTbz3/3Om4FuN4jCwfXObsK57AgGo3I0wqz7JKGCysnCNxfL6SD4ir0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XYLhIWXp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FoM+d/9A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V8s24T1401290
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 13:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5sftBoUYRN8krc33OKZxWXSUXoLKwRmpS5072sKzwys=; b=XYLhIWXppzMYAg6b
	05rkqr6meNnYYwE89mgK0yvRl2Agvd0bOgBgXPMGzUktiP0YCfgtSThKPMnHIGjW
	N8kp5CD34s+T1I+hdUTk/DC76PjZ3b2s1U/7wFUMTfuIpTgqKLFHPgSGwUsGAf/B
	Zj2xO79fsiIil3p47sQmPAGVPp0x65tcXFZkZLzSVZY/XcFr0DZqj5SXcbXkTe6V
	KK/NdAp6IYvgST5nT28shAX0riCsIwr8eXr0GBBlSz0FhlT8ektO/NrfuiUnycQQ
	i+xMjfgvjWYwUEC/sQc0YdbBcVOpvOw06oLDZb97s3J21ScYZBMSJ1ybjP3mNGVs
	vA4j6g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1asdrveq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 13:58:57 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5f557e3890eso11389313137.0
        for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 05:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769867937; x=1770472737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sftBoUYRN8krc33OKZxWXSUXoLKwRmpS5072sKzwys=;
        b=FoM+d/9AaHBSBbZgAGWoNYsKtrAxYyJlfWBPqKkrXBY4UHfNlbmVfQbJgsFagaNDJt
         +tUeK1qcBZTJ7M4nCsjDLJvKSqbi9P2nY9nFq+6VxRWUuLUP3+K93utfvub6HEwprqXN
         wCwv4E9SSXiV9SZUK1FpMR8+E1zIErbpo9NGnPm43j9mEg3GSn6Dza0D8J3IMLysyjNs
         VikAeKmpaRY1vke1t2n09ZzvRgaPc87vUuipqBjZfBGbktSsR5gQErf8uXmhtbYpKXaD
         jLUpyJWfu2C0QpmJ3lAkvgMBgNc0QSUnvQyqDjoKTkSJsw4XUXURbhXFLXYNWNRZWpdi
         ELAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769867937; x=1770472737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5sftBoUYRN8krc33OKZxWXSUXoLKwRmpS5072sKzwys=;
        b=XG1v75aiUAG0awMYByTv6SOqFUSadALV/k3jI1T6X8Pl5PyED4ICVXMVwXvibsUlwx
         VoSS1N1k6S6MpZAsA5ZvYVCbCCHr/5EkRAxYAFzJfxBxZFzCNPVD/sOihV390WKZ0Fxl
         8pzrAWO8N4Nm8OGCPmZuxvIFF7wdhJN+VVbPfIhoo0jDEHdqgxM9bHHB/rMtM51RJuI2
         ZWp4mgM/FCNGn08LhDCvV1u4jhoq6z+PpYU7dr76FL7V1saSSgrhPoeq7K8A52XxmaBO
         9TWVamb3QdU99PEvvJ9SGELh2p8gyNQfMlhbYXuZxcREm57ezTFhcvJ2E2kfwnJH52It
         ZByw==
X-Gm-Message-State: AOJu0YxckLBhrzuw0yYr/3wyW5xaerOcgIQWPDg9VH2PlKT2X5myCqtb
	yMtjiGP4Frc/fsSY+Wo07EEonSlTYE8TghC97ns9lljGNpZGs4e7rjMazYk5ioXx2eU0HgvfHIk
	9rbXCCujG9zds1cwea4h61CTGWNkJwQTLIJrDS+Chqnjw9RQZLN2N2Y3EGkbZVVuRHg==
X-Gm-Gg: AZuq6aLBRZddoOigXZxtCnPqB1cRgJW6IT+hkQGtG7T1QkDZPQKBeiioAzX4tlYXI3g
	QBqHoleZdYWdkCYklDez4ufMa/swJRe4MDlIVy53byukrr5ARErJ36GFR8q8rl5mEPha2FpliIo
	O9F1ZTAt8Pf/4HUGOlBJ6d50UvZlkB8j3Tzd1RAbMsloK7EgdVC9dtBXRHCIWQSYzBFu88tgvNb
	POVGoUF+jVP/0273Snc4E4lLGjJ5lPPT4Tpdj3jXMpiN7KufRXCC9hr7RplffFiqdrMjmd7eUh5
	dg7FkWJrRTM0O4U2HIV9ncqGGmmFHlf6IpBap5kZSH6Z/bZQ3XcrDacFC9+Ir3evcxFxb3Yd8zO
	2fizlBCkqLdShPEZU2j1IY+Yl/icmLYhiielyzrpXKt57XsevPGIuv2qMOYL1P/+XU05Z2OxahN
	bRn77HGIH1/to1pxUVUV3PYeM=
X-Received: by 2002:a05:6102:5093:b0:5df:abc1:e6b5 with SMTP id ada2fe7eead31-5f8cdc22805mr3029575137.17.1769867936972;
        Sat, 31 Jan 2026 05:58:56 -0800 (PST)
X-Received: by 2002:a05:6102:5093:b0:5df:abc1:e6b5 with SMTP id ada2fe7eead31-5f8cdc22805mr3029562137.17.1769867936572;
        Sat, 31 Jan 2026 05:58:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b2dddsm2373021e87.61.2026.01.31.05.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 05:58:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 15:58:52 +0200
Subject: [PATCH v4 3/5] media: dt-bindings: qcom-sc7180-venus: move
 video-firmware here
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-venus-iris-flip-switch-v4-3-e10b886771e1@oss.qualcomm.com>
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
In-Reply-To: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2286;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pvGogtYz3ToyC7AvsbxMd3Op0x0cS14QLEENjtD1YWQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfgqcv2i4Z2Cu2/nEoloNKxr/I7lBhK4UHDtz5
 k7mYLNxKquJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX4KnAAKCRCLPIo+Aiko
 1UZEB/wMCnEKm1Ku6n/MNhTRxuEemTMOeN95X9pnxNtvBgJjV/vMgNEB4K7wrtaXqybRBS+0ZPG
 JK8NteYIdpzBG7H4gtdSE2zH486LUacGvfk0UmUrj9ETFqBJfkopzWTgxztrS/PT5drCD/K/gl8
 yuzPQl/vCFnDa3dkr6AanofiJ1sGCMyV5xm2aaWboiwjo76oUloe7h/EkKjKruY9uzg2oPHOHVb
 0IAKO74dEztUtmC47HfnStPcMzPotnD+m2pOWWVz+11/eXTHd6CTUVt8IqVMq6rr0q4OniIRdyb
 dwbLMeMosw3BFwYpSPK97siSx99XDG5KaM6Zc7IgvzaS4QwV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDExNyBTYWx0ZWRfX7c0zcPcLO5OQ
 cJ9Zfcc+hCnkZwPc1b0KpL2w0vSls3wb16QXJdg/rRncONoeIV04ieoRBENvMiOWwMtoh5xZu7/
 Lai9nIhxJXF/o1d/Zy+NguxO9OQr9R6+4fCMruy8Yxhg+QaTmRoOZuYuX+WQIzopj7GhSwGhpvx
 wIqhlLakvDP9xYyb2KxLS1MG46+xQWRaAueDf5sUYcZDh0uRfZBFp0WZCb245O7vsrBk/nCLj8t
 DoFNk/G683VBOeXyg/fEYSlJ/CaaaZn6Kc1G42Eok/N2Bvb6OnZYttZHkNWCX68xQtV93lBi9sY
 7xAcH/qe+9Ig84lAj+YrC89IZyYWPslSAvc9lFB1yC5G6cB3wOL7ydqwzJkTRVnC6EucuTJM0nx
 CWtg8k82NwPjGCxycsWKZbzJfXR+MXCQ2YUxYWb+Y/CZPQv/Jz0vbyie2RVESHgnuSGPXlUqTSC
 8RRTTQypJ+bfGQwTaOA==
X-Proofpoint-GUID: kRR0ah4ZCCSaOfaCRRQmd9_mKb1eta9D
X-Proofpoint-ORIG-GUID: kRR0ah4ZCCSaOfaCRRQmd9_mKb1eta9D
X-Authority-Analysis: v=2.4 cv=LNNrgZW9 c=1 sm=1 tr=0 ts=697e0aa1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0e9ukYqe-uxmdYkeUVMA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310117
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51891-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A84EAC21EF
X-Rspamd-Action: no action

As SC7180 is the only remaining user of the non-TZ / non-PAS setup which
uses the video-firmware subnode, move its definition from the common
schema to the SC7180-specific one.

These properties do not accurately describe the hardware.  Future
platforms that are going to support non-TZ setup will use different
semantics and different DT ABI (using the iommu-map property).

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sc7180-venus.yaml      | 15 +++++++++++++++
 .../devicetree/bindings/media/qcom,venus-common.yaml      | 15 ---------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index bfd8b1ad4731..b21bed314848 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -91,6 +91,21 @@ properties:
     deprecated: true
     additionalProperties: false
 
+  video-firmware:
+    type: object
+    additionalProperties: false
+
+    description: |
+      Firmware subnode is needed when the platform does not
+      have TrustZone.
+
+    properties:
+      iommus:
+        maxItems: 1
+
+    required:
+      - iommus
+
 required:
   - compatible
   - power-domain-names
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 3153d91f9d18..59a3fde846d2 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -47,21 +47,6 @@ properties:
     minItems: 1
     maxItems: 4
 
-  video-firmware:
-    type: object
-    additionalProperties: false
-
-    description: |
-      Firmware subnode is needed when the platform does not
-      have TrustZone.
-
-    properties:
-      iommus:
-        maxItems: 1
-
-    required:
-      - iommus
-
 required:
   - reg
   - clocks

-- 
2.47.3


