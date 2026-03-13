Return-Path: <linux-media+bounces-55682-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +L36MF8PtGlvfwAAu9opvQ
	(envelope-from <linux-media+bounces-55682-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:21:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CD08D283ABC
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CB200304FA2D
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DCF37F8C5;
	Fri, 13 Mar 2026 13:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHLUWEkN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pk7RItPE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD4C32E137
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408014; cv=none; b=P+WlUSYNDI9iTYa7K9xhVLJ4hVj6TFWBOjwZ2nuuTl7ZIjNntHK6BRqXpyJwztsx9hpktFKX3rV+iVtmvc3klvoB7RqCANrwJ4yaQdyB3uN+FxlMb7KOhixxo1JPE2uG/WUcv4WUYf8OiSNYTa4B08YmpxvTLuG+OGZVJZMUmLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408014; c=relaxed/simple;
	bh=FugiAkjJAw8Rc+ElWLy7+3EXCO2X/Q7eYTyyl4toOwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SNf8FIUDx4JVsrZ60bJDitD/s2xf44NWReicgBOCWi9s1j5z4whxPthCGTuQ16w/IHILvYrQ4NTmbM8CH/YBPOWfYvbl80Ji3ZBT/ZNwqqfrMcoZ0G23TiPTcLr+/l2cYjOa1iJwaVf4ZrGiukxTMm03uRgzOySgdXcOxzi+O6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHLUWEkN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pk7RItPE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DC087N3342992
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qq/iNMuIBUf8ItEQbdTvaDhG+gM00VgveS6mWqyYASY=; b=lHLUWEkNaJLEia6p
	QwvkLhTrwBJrFVkK4lbqCm1MDtyVjnJodyP8lkFxDSz8vJEXbpzDDHTgeQZ9Pw6a
	61etXw5ZXZHsJFJR38yaUWNmxUZiz6K8fxvQei8x66fDCgIdKe0Mt9h2dEwxiCeo
	lfiB/O0UqSxlcmqQKag6hf5lnTvCa++V7h21Vt7QAiWEtTa3EHdRafrh6QxTCzSd
	G72KNJceTB1UsZp9zKbzA5yi5/DErvUy8Lx2skw+3/OaeLvFV1jSlkdnc8ZgdOz2
	TCXSGRCHrDy69mdb2t2nWg0v7vOmRs5G71nJTiwlIvjpxaxR+OrRg9hcC5XkFb13
	JEXMrA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w4wkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 13:20:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829a9d3073bso892762b3a.2
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773408011; x=1774012811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qq/iNMuIBUf8ItEQbdTvaDhG+gM00VgveS6mWqyYASY=;
        b=Pk7RItPEbdHrTAhvWqPmfvVyG9wMGvaik/mxRKsaH58qoAd/HF896+278kvSQzVubp
         a0l9n8fR1/0VcLc2p+snS1IX/8Kc9+Lm+KzNff7zTaDpfVspdSMsxLQZfCMriDsMAJAY
         pBqNZiRyFwp82+5bFlV4youE7y+owTTQYG3AU22/6+ewryLuRGfjVdsDPQR68ykBwnON
         IBDkq8VPeMtK34Zluj8fGEnplK5z/7FsLTvZiBCVJnVGo7Qllyh7lDFoIR1RWsCmsIxC
         CDnxcTT6yB+LbrA2kOipAt5pjTvylHGAd2IM4gRRwyVVI8VMQwStMwmR0kJqT7iHhgeU
         s3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408011; x=1774012811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qq/iNMuIBUf8ItEQbdTvaDhG+gM00VgveS6mWqyYASY=;
        b=btVljEOkDTPDzOmjGRQ8+onk63oUkcYQJ/UqEZSxcHUPOBjCxReCqSjYLMvpPTbWOa
         Ob5pOQ1d9nHaQeNE78W5MXVUKSajANMgOLwFU2Jj6uigi5jInDjr5V4mLTKiolR2hU1L
         LPYEkaEsh+tU0pgDzcUjMGJ62itJ7I71VUSDc64RtEG79pmuFdVQdfeoU6KfLBhMdKTt
         YPwqR/ue9dnHQvVkprwdrK8Hhmx11UmW225ORF4W1DJpWZvf9BOiO7RoPO4XIjr+Nl8c
         dUMNhAXwIuuFmwSBxefIhFkZ3EBY+NHvw2M1XmrXU3s4512RSCea5cGYo9x8Ufztw5M6
         VNRw==
X-Forwarded-Encrypted: i=1; AJvYcCViu2NmLoJnILY5KdJn73/kPj064azB3AwE65gfagHEiXCEkeq1EGbIll9TwkN2RQn3H5mFcer5DhBjAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBzq+FCCc7SEatls79E5qKCuo4IbIUyKAfyznfLgo/QHp5AFIE
	0Qjbj7NcI2Ay0Y3IltBGsyjfZTfQUdwkrU/oFn76xCHj1MhPR3wVG0zh8+lmX5jodV6BlnGd2jy
	Xc9BDhAS+1fFwCoacxB6jPGJSq1IhZuhHGBNTkd2Xl/CvcbHpbHchRt97pT8aGKg4Ow==
X-Gm-Gg: ATEYQzyUGaI0AlQcG0R6GaPtHtA1emb/ft5X0lgsMVUTGSufS6LUV8CpNfITJednm1/
	pM7NMaswiAbBgN/CV/0/JnjRwwoR6P8jEuCnIIpkT2XZu+Kyg2Q+hX0Gy6RlwiT7lW19630owI+
	WVK5H32nO2Wvk2HfD04BbR6V2C09oOuLWTwt9bCHIlBWSiyWv8YVcXB3MLoLcBb5y1qPOF5yrP8
	Ug6sfrgSUPsjzCeNV61VzV2t8fmrZLANdlfl36clLRapi3xVkwlp797KYLYNuSpGKml+X51pVV/
	jGyopKfbFP6hiRzX2sjzU/Rq+snJZwOdddq0k/gjedY5K7qWSYCLcmBqA0pU2o7t/B7nJTfguXr
	FF9SdJ5mgyKM4rM4NAf6BgiRxlx9HC5Ii13MpFHXZ4A0IFHEadJYfcilY
X-Received: by 2002:a05:6a21:2d42:b0:398:a1ca:7a26 with SMTP id adf61e73a8af0-398ecddd629mr2987571637.62.1773408009934;
        Fri, 13 Mar 2026 06:20:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:2d42:b0:398:a1ca:7a26 with SMTP id adf61e73a8af0-398ecddd629mr2987503637.62.1773408009198;
        Fri, 13 Mar 2026 06:20:09 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0724407csm5775254b3a.8.2026.03.13.06.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:20:08 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 18:49:35 +0530
Subject: [PATCH v3 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-kaanapali-iris-v3-1-9c0d1a67af4b@oss.qualcomm.com>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
In-Reply-To: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773407994; l=10166;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=FugiAkjJAw8Rc+ElWLy7+3EXCO2X/Q7eYTyyl4toOwg=;
 b=1hVPp6u/PZJQh/cJU9zaws2RRqe3k7bztmgXfJ0w7mz1yMHp8PNVfizwyQoOtNl9tYUCq15FG
 fvxhpF9hrx2A8SDYX6onl4JnRrEjHHj5wNI7K+6SM+Lzc2wqp8wDscT
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: -20NgUXteF4bJFdNP7TthgTNQJFONS6T
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b40f0b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=3XxYi-OA7daZLtlGpLkA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNiBTYWx0ZWRfXwbxn9KxdHm8E
 TxgIB2hnh0Xbex2qZmEWt9swpaK32pzmtfPF1pJPhKXGN4+IP+wz9qDaYksBin1INYkcPcl9Ha2
 9dYgnL/nhQnJ7yC2Ii/0CAoEGwxQYA2D++3avGy+0qeqhPMRf6xwnEKw8CUJjIiFxAyOw7mDBCm
 UoUzezKKxPbMvAQa55eZQ40LLkHKcSAuwOO7g/p3vDkDMY01Lp1JdcuX4/K4zr8qmo48WaVib8f
 NrKs1SIJdGFjkvglf8jBxBF2h4+mYuPoPG9ZAHn1V1Sjo2HMUUATNA5PkJOd8IsDDoYJMikaoDc
 8gGkLGEaW4ocfvojuofllfrwz2MSnozbazKTAB1+l6QNfKLBoyLZ9iPscDWhKOHV8YRcGrqjO5U
 xtZ3brILz/V1YdPIg3d8cwdHAT3qlC+Sww2SK+oj2Qzoztv24/WyMaXclCswNI8ogwpmkPqbm/c
 LUpaW4QcRmEG+1bZbQw==
X-Proofpoint-ORIG-GUID: -20NgUXteF4bJFdNP7TthgTNQJFONS6T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55682-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,devicetree.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.30.132.128:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD08D283ABC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Kaanapali SOC brings in the new generation of video IP i.e iris4. When
compared to previous generation, iris3x, it has,
- separate power domains for stream and pixel processing hardware blocks
  (bse and vpp).
- additional power domain for apv codec.
- power domains for individual pipes (VPPx).
- different clocks and reset lines.

This patch depends on
https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15

Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,kaanapali-iris.yaml        | 254 +++++++++++++++++++++
 include/dt-bindings/media/qcom,kaanapali-iris.h    |  18 ++
 2 files changed, 272 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1f35472a2caea7acd2ef20b5cbdafadba882bd3a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-iris.yaml
@@ -0,0 +1,254 @@
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
+  iommu-map:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      - description: bitstream stream from vcodec
+        items:
+          - description: Function ID
+          - description: Phandle to IOMMU
+          - description: IOMMU stream ID base
+          - description: IOMMU stream ID mask
+          - description: Number of stream IDs
+      - description: non-pixel stream from vcodec
+      - description: non-pixel stream from tensilica
+      - description: pixel stream from vcodec
+      - description: secure bitstream stream from vcodec
+      - description: secure non-pixel stream from vcodec
+      - description: secure non-pixel stream from tensilica
+      - description: secure pixel stream from vcodec
+      # firmware might be handled by the TZ / hyp
+      - description: firmware stream from tensilica
+    minItems: 8
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
+    #include <dt-bindings/media/qcom,kaanapali-iris.h>
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
+        iommu-map = <IRIS_BITSTREAM &apps_smmu 0x1944 0x0 0x1>,
+                    <IRIS_NON_PIXEL &apps_smmu 0x1940 0x0 0x1>,
+                    <IRIS_NON_PIXEL &apps_smmu 0x1a20 0x0 0x1>,
+                    <IRIS_PIXEL &apps_smmu 0x1943 0x0 0x1>,
+                    <IRIS_SECURE_BITSTREAM &apps_smmu 0x1946 0x0 0x1>,
+                    <IRIS_SECURE_NON_PIXEL &apps_smmu 0x1941 0x0 0x1>,
+                    <IRIS_SECURE_NON_PIXEL &apps_smmu 0x1a21 0x0 0x1>,
+                    <IRIS_SECURE_PIXEL &apps_smmu 0x1945 0x0 0x1>,
+                    <IRIS_FIRMWARE &apps_smmu 0x1a22 0x0 0x1>;
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
diff --git a/include/dt-bindings/media/qcom,kaanapali-iris.h b/include/dt-bindings/media/qcom,kaanapali-iris.h
new file mode 100644
index 0000000000000000000000000000000000000000..757313799293d59b2122dd8d05b654f7a3a9876a
--- /dev/null
+++ b/include/dt-bindings/media/qcom,kaanapali-iris.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_MEDIA_QCOM_KAANAPALI_IRIS_H_
+#define _DT_BINDINGS_MEDIA_QCOM_KAANAPALI_IRIS_H_
+
+/* Function identifiers for iommu-map to attach for the context bank devices */
+#define IRIS_BITSTREAM		0
+#define IRIS_NON_PIXEL		1
+#define IRIS_PIXEL		2
+#define IRIS_SECURE_BITSTREAM	3
+#define IRIS_SECURE_NON_PIXEL	4
+#define IRIS_SECURE_PIXEL	5
+#define IRIS_FIRMWARE		6
+
+#endif

-- 
2.34.1


