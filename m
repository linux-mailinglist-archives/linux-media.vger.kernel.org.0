Return-Path: <linux-media+bounces-51561-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ayMAE4Red2l8egEAu9opvQ
	(envelope-from <linux-media+bounces-51561-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 13:31:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A028841D
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 13:30:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAC923083AF0
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 12:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2729D3358C6;
	Mon, 26 Jan 2026 12:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NTzoS6v3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWfz3Bqx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD413358C7
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 12:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769430397; cv=none; b=bkwoitG3LDGloWI7p5xXi77Er9ro8j05rzqywCRFnYMKB6XS+0GJoSpnia/pASM+rmCf5V2a07tupSPmKF/jh0GpoX+D+tg3c2+oBN2cG5AAfYU1mIMxcMoO1NPHYncRyYFlFUm7AuVreDBcFTjYwC2hOYpujY+zUPwFjWNYgao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769430397; c=relaxed/simple;
	bh=tGKS4T92lrECaZQhadjFHBGpVn6bF3J4R7FWoMwtElw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KCrAVnHa2Zwnj711/Uk4s94M5eJ0MxUvd2PnyCRNUATBe9xKt/qOyi5aP9JssxGYgYRQsGEiqR2y7yS7DZRsSkuDHQGBy8EdPgHL1xZ6dj6yTzFaZrTEhYUTds9TpDnF8xrqcvIJ2RgXlLiAHZI1kCtSxY7ZKXCjT/lugdpblxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NTzoS6v3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWfz3Bqx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q40l6a1361523
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 12:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FF5H5bV09c8fWN0vXsZAWtIwWT18Rthxv0eooXBFjfg=; b=NTzoS6v3tklV6okW
	LzTIumiqL8VsrxFjva+FQq9IHp90VjaBkXi2O/JrnWBfTszXTR4OW7/gvQDYvMWY
	565ecqM4KbpKAVa1R2z+IauMd2yO5aFFor3ZX+bxLDBWYvcBn1tHBfEaciURz7EX
	bhSg9LjdwSw63UL+swldLTsOwKlgxHU8CHC1K7FK6pUstGLkl676Gi8QrzeEC2Wv
	muWC1CxkmQGV2ex0YhpORiPpRpf2hsYECp0HhfMsjc3yBZMQ8d0tBIvMTS9Nb5tj
	+VpltIidUmqKNdYHMsnrHBkS7BwpnrWLxxkJiXCb6mQRawsFOFoRrai6QiF72CQO
	uh5jJQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx0v314nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 12:26:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6133262e4eso2494524a12.2
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 04:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769430394; x=1770035194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FF5H5bV09c8fWN0vXsZAWtIwWT18Rthxv0eooXBFjfg=;
        b=aWfz3Bqx/h1ILQSVcC6j9FBDpei6EcEM0laQinoJeCoIv+6PPm8JNhUc2QOjiCLgNY
         yQJXD8FixWDliu2wlVWyj8Z2prb/+kCk57v2LFUbZN/kr5vRE9FscUcuixnVA3qkHQcU
         OcZ8saI0RDivjzNOXJ7t4i9w5JjGU2fLWd12K9laC7NcHiRWMzxayf7RSIhLi1BBg/7K
         ynpe9e9Zg/uajeun2s+pYEKOPhvHRbP+XUBRos7fehJDmIdOT7bIiCyHVRwJxJbeoPr2
         Jh8oX9UnQpkNBHmrlcEEEsQW8QRmFqqLrLaCiDWeM7imhfjREbF6eDwU7S/q+UrVdB10
         sZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769430394; x=1770035194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FF5H5bV09c8fWN0vXsZAWtIwWT18Rthxv0eooXBFjfg=;
        b=tsL/HPT5ZVRkM3J+5jjD/6BNdw/RbVeK6EsZLlcRfc7SHsOCsO1pvdv5yrsL1DO5dH
         sjFZZx6pf5A/Ot7UKaHTKUi9SoHVSPM8y8f+6tBMz5iLu0ItCCguyDwlqNUUBRdeOACx
         9Jh+weA82Htw2fZlHntTzwYPguQUZSVGKHtjf6YN930KriKdLQ59HwXt6oqUXl7mdwHm
         GCbr6gINsqn1tStQvqUsT7b95mSi7qRhoWwmbMD0GRPyPKUK7GoJfaz5Lrkg385wPKJr
         tUityMJNIuiIMIaCOhTt/nV3ggZWJp3lBRUdFTHYTR+0OZbyHDMV4Maq8dX+1zF+fIYG
         Y47A==
X-Forwarded-Encrypted: i=1; AJvYcCUcD5jzxlRq1Qa9eqgOsfu/iO82OmjSVkwJ725Bwh5EH1/bcYNPuNUguv3i07/5+wbotsbw6LeXHoMMbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg8WLd+ckxtqmeYo9iEXuZ19PuS264IGOa15NWhzLNdDuBrmjf
	gRd8grXd8ZwrHMm25EC62LzS0I5bp5qfbnoFKl6eWWpcR+H7SzKUvEu5fWs7llOXdSkT9D9yuXp
	hteiv/5oLQaqyvo7cvzOooG/606oshsRSDeZcNIYJqhcb0Q7vWgS2kq4dsGLPew4mDQ==
X-Gm-Gg: AZuq6aI+BphduWva2mYdQPXsabftGTYYKqd5rZ2WipG7SO/e47MUdNvXBjFgMYADNcB
	UhpaPKt0auFFUaHAVMO/d7/QAm5jCH4jg9uWhRPxTwqNHtkDDQIRoTFVTwQiuo+WDzxSSCQKqci
	S3Wz8XwcRlBSPnqyNBSjT/kuvW5npxtzrPhwREoHv90vgD2FN0RhJobEUd7m96trOhmuJ9tCQEm
	bOsp5zqfqAu2nqL/qj+VSdKqauNdpMwXqLrMs/Kl3Y8QvcvOrXh1+9uncNtW6rgv5SOufHFyp4K
	blk0CR/DjOdNLZxHF4je8BjOTj0nCOMwpFX+Z1VFTEkDmsW2Zn4JsUphcx8Qv5z24rEtYKiWb1G
	0izdtqwmpNT+jeqXYcZe9r6aDx6pCdQdFvTV4atb/gs8a
X-Received: by 2002:a05:6a20:1604:b0:38b:dea2:fd0f with SMTP id adf61e73a8af0-38e9f11003dmr4162612637.21.1769430394399;
        Mon, 26 Jan 2026 04:26:34 -0800 (PST)
X-Received: by 2002:a05:6a20:1604:b0:38b:dea2:fd0f with SMTP id adf61e73a8af0-38e9f11003dmr4162586637.21.1769430393880;
        Mon, 26 Jan 2026 04:26:33 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6366644379sm6076022a12.33.2026.01.26.04.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 04:26:33 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 17:55:44 +0530
Subject: [PATCH 1/7] media: dt-bindings: qcom-kaanapali-iris: Add kaanapali
 video codec binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-kaanapali-iris-v1-1-e2646246bfc1@oss.qualcomm.com>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
In-Reply-To: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769430381; l=8103;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=tGKS4T92lrECaZQhadjFHBGpVn6bF3J4R7FWoMwtElw=;
 b=HROUZwon26Sdvm09gkLPN2Y/qqvNXRElUO31/tz+MRZ42SyMCtLkwrdGc9/zUdCk7umE9ZcoN
 n1zjijlJz/LCS2c68b6SZ1FNf0ub0jajPXEQkYMQO+4W5z5QCv6thVr
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEwNSBTYWx0ZWRfX24YITN8xMa4s
 JT46K4yWc481zRR7XjO0ZxoIUSZ/rNXiO0CX7Ky15LrcnWiqZL3WafP1Hb1UK2C7iopCYOdLaIM
 IBp+PECpR8MkTaGRrMlw4k8JEdBoZk80SI9dzDrJEgGwh0IND5Ud1VdtFRMaK9V177S655aUPh6
 nL/zSpUdy6v035nt7KMF78avVNGMJV7CNRQBLlnNS6szsWNhrhiIlpVfznbjzMmkK6ppUWZkUaR
 vBwn9KKIHlj2pTS5pYyf4tnLZa0yPJa0kC7erWTxJ8IuRwaShB1+qRexy2Vz7SW8ShCFTXG5DeB
 Egig9cR5ssWbvQV0ii9a188UdiIaB9XU5rZNTkCaeDNjjnmYrc11/3jE1jH/KDqeYyjFQzoUTXa
 iZY0rvjjpCQPi6m7z+fpFLk0qmum8+zLiRDM8WyWP5niibh8NsiiPCQisjjyEJI9JiJJUBeBvGm
 8zPSMAmoEdTB5hZHwHQ==
X-Proofpoint-GUID: SOvoG7qe37DE5uH3T5XlttzU39AycVhp
X-Proofpoint-ORIG-GUID: SOvoG7qe37DE5uH3T5XlttzU39AycVhp
X-Authority-Analysis: v=2.4 cv=JYyxbEKV c=1 sm=1 tr=0 ts=69775d7b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=PIz1-sESaiOoqeWa7OYA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260105
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
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51561-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.30.132.128:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,devicetree.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A4A028841D
X-Rspamd-Action: no action

Kaanapali SOC brings in the new generation of video IP i.e iris4. When
compared to previous generation, iris3x, it has,
- separate power domains for stream and pixel processing hardware blocks
  (bse and vpp).
- additional power domain for apv codec.
- power domains for individual pipes (VPPx).
- different clocks and reset lines.

iommu-map include all the different stream-ids which can be possibly
generated by vpu4 hardware.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,kaanapali-iris.yaml        | 234 +++++++++++++++++++++
 1 file changed, 234 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4ed2afacb19043a60cfd67c4492356b4adb81c3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
@@ -0,0 +1,234 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,kaanapali-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali Iris video encoder and decoder
+
+maintainers:
+  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
+  - Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
+
+description:
+  The iris video processing unit is a video encode and decode accelerator
+  present on Qualcomm Kaanapali SoC.
+
+properties:
+  compatible:
+    const: qcom,kaanapali-iris
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 10
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+      - const: iface1
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: vcodec_bse
+      - const: vcodec_vpp0
+      - const: vcodec_vpp1
+      - const: vcodec_apv
+
+  dma-coherent: true
+
+  firmware-name:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  interrupts:
+    maxItems: 1
+
+  iommu-map: true
+
+  memory-region:
+    maxItems: 1
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 7
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vpp0
+      - const: vpp1
+      - const: apv
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: bus1
+      - const: core
+      - const: vcodec0_core
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - interrupts
+  - iommu-map
+  - memory-region
+  - power-domains
+  - power-domain-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@2000000 {
+        compatible = "qcom,kaanapali-iris";
+        reg = <0x02000000 0xf0000>;
+
+        clocks = <&gcc_video_axi0_clk>,
+                 <&video_cc_mvs0c_clk>,
+                 <&video_cc_mvs0_clk>,
+                 <&gcc_video_axi1_clk>,
+                 <&video_cc_mvs0c_freerun_clk>,
+                 <&video_cc_mvs0_freerun_clk>,
+                 <&video_cc_mvs0b_clk>,
+                 <&video_cc_mvs0_vpp0_clk>,
+                 <&video_cc_mvs0_vpp1_clk>,
+                 <&video_cc_mvs0a_clk>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core",
+                      "iface1",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "vcodec_bse",
+                      "vcodec_vpp0",
+                      "vcodec_vpp1",
+                      "vcodec_apv";
+
+        dma-coherent;
+
+        interconnects = <&gem_noc_master_appss_proc &config_noc_slave_venus_cfg>,
+                        <&mmss_noc_master_video_mvp &mc_virt_slave_ebi1>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        iommu-map = <0x100 &apps_smmu 0x1940 0x0 0x1>,
+                    <0x100 &apps_smmu 0x1a20 0x0 0x1>,
+                    <0x100 &apps_smmu 0x1944 0x0 0x1>,
+                    <0x101 &apps_smmu 0x1943 0x0 0x1>,
+                    <0x200 &apps_smmu 0x1941 0x0 0x1>,
+                    <0x200 &apps_smmu 0x1a21 0x0 0x1>,
+                    <0x201 &apps_smmu 0x1945 0x0 0x1>,
+                    <0x202 &apps_smmu 0x1946 0x0 0x1>,
+                    <0x300 &apps_smmu 0x1a22 0x0 0x1>;
+
+        memory-region = <&video_mem>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        power-domains = <&video_cc_mvs0c_gdsc>,
+                        <&video_cc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&video_cc_mvs0_vpp0_gdsc>,
+                        <&video_cc_mvs0_vpp1_gdsc>,
+                        <&video_cc_mvs0a_gdsc>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx",
+                             "vpp0",
+                             "vpp1",
+                             "apv";
+
+        resets = <&gcc_video_axi0_clk_ares>,
+                 <&gcc_video_axi1_clk_ares>,
+                 <&video_cc_mvs0c_freerun_clk_ares>,
+                 <&video_cc_mvs0_freerun_clk_ares>;
+        reset-names = "bus0",
+                      "bus1",
+                      "core",
+                      "vcodec0_core";
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d1>,
+                                <&rpmhpd_opp_low_svs_d1>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_low_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-420000000 {
+                opp-hz = /bits/ 64 <420000000 420000000 420000000 630000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-533000000 {
+                opp-hz = /bits/ 64 <533000000 533000000 533000000 800000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-630000000 {
+                opp-hz = /bits/ 64 <630000000 630000000 630000000 1104000000>;
+                required-opps = <&rpmhpd_opp_turbo>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-800000000 {
+                opp-hz = /bits/ 64 <800000000 630000000 630000000 1260000000>;
+                required-opps = <&rpmhpd_opp_turbo_l0>,
+                                <&rpmhpd_opp_turbo_l0>;
+            };
+
+            opp-1000000000 {
+                opp-hz = /bits/ 64 <1000000000 630000000 850000000 1260000000>;
+                required-opps = <&rpmhpd_opp_turbo_l1>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };

-- 
2.34.1


