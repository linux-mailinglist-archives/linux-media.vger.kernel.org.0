Return-Path: <linux-media+bounces-51093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C50D3BF85
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 07:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 903604F9651
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 06:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347C63803C9;
	Tue, 20 Jan 2026 06:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDcl/gMt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aP8KXRDe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9776431D367
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 06:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768891394; cv=none; b=R2SlLF879uEY2vKksnuxhviqoeUO9yGVzO2lvbnZGjWzmaJ+/ZCznQMsuNc+9eOpozpyH0a+IDu3FgeWTXwBgaHMM+P0w1HS190DFcNqWeCig26IWc6EsBTea6EMcM5c02pl8bFmyNjBKfAD1RoamcLKxZqIUebTcUKsPhVIgu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768891394; c=relaxed/simple;
	bh=XOJI2rJ7c5I2GGESHXGkyzvnPUQ9FXZdcswTT53MBHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RbSnUktTXYIbr0W7RyNRllRsZZtz2zwdbRmJ+7v8zL1i5YOy1PfJ5gYHSbRd2mr1jq30ij9XA7Aisd8sYklR08/JvBaCcElRfu/kut3/G2Agj6AI3f57YtJ02qXwuFALgwmZ2Fj2zuUyIrWR3xpOgRejwYwlnfnMH5JUC0229zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDcl/gMt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aP8KXRDe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K5wpm91905191
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 06:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xxzq5Oepq3GgmFFUYeTPUXDTix+PLprCmsF253sSlaQ=; b=UDcl/gMtx4utMg5D
	JH9TZ5sXB9feQ3yWoLpe6LOVdLX6wKrgYx6GJJzw4d2YGGDev2FUaQLJvlAUmih1
	LKog3GFxkklNn7UtbosYHsROAtZTh8jhpiyzIFtU8RKY2/nC/jw6ErdvmCg7czCN
	kzdTIVIsAiop3OdwJfVhpaatH0Ct7p7DBXep91+OT96IGCYBU5WczI3PMG+XO6cb
	1OdfqUSByn4aCqlyMT0iyCv8Ogp22mdJFMZibMkg/bcEOxSnywWu/Gab5YmxWoIK
	c8XCuIwL4OiiaFtZo4aF0zm9KHeM1EiHTNS9Dcm2mYwgaSQV27sxCKq/PNOi1GLL
	KiDRig==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgmubb2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 06:43:03 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-123377038f9so914743c88.0
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 22:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768891382; x=1769496182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xxzq5Oepq3GgmFFUYeTPUXDTix+PLprCmsF253sSlaQ=;
        b=aP8KXRDe8KWYRY1CjT9c+1V4fVm3m5TWakZvV12NfBuiX0kJ43efksznHilTQL3a4h
         HNzjHadpkUMSohfSp6W4zAdUdpmYmH9NCnHod5LoSl3MI/2oYwYgK9V1U1EPuNUAaALZ
         tV6t5sbIfDCDBfnTuLyzk78pzTSZeYYtOWcMyFuLVnpiVWYCO57OGYyZ+xwqFKrsD2+F
         eMFYh3/6ZSV3Lesb8++Hmcnr2vAVeY45UPN7uRvxrUa5FTluvjKQvJeVO8QnWNBbma1R
         7jNynz+AQylIsoIeSbhSAZG0qGyxL1ZIKqtxG7SqXthFPpFSwAn++G1MT6i2WpL2hilB
         e2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768891382; x=1769496182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xxzq5Oepq3GgmFFUYeTPUXDTix+PLprCmsF253sSlaQ=;
        b=KKwnk+WnaS4XZaDL3zwUWF2zNO5zxc91VGluKY97/I2Q2Kw5LOF/lV2M9if/Jc5h5v
         uO3Cx5huCh684/UxfYWf84d75JCx6/j4QemR7lhstnH8l0WjvY661PHS44N2etGaKH90
         L13HuYJ9/5MYq83+yxtTqtoPqTViOuP76mh9ZxqrT94CiJK8tnu7U0oCptXVJjGhKsiR
         Vu8uFeCvEDI17r12ym41M+dUqzeApKGZBbhWxqOuMcPKmTtnznxCxU12ExpJQ4ZYDbca
         lJz9dEApDA5enparMB3nRWr0NLzuaIRMjwB2f3UzIJAIqF7EZw5ySasswVYErBgO81sk
         5wQg==
X-Forwarded-Encrypted: i=1; AJvYcCV95DTCgSrp5++BdqOxrHndx13vLgQNozAL+MynDOBmZcGZ7hpaDGiZziC0nQ9+pzbQ/kubYMv0HFTdwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzTkf97cK8J3j6gSkgwz6kFwO3jV1oO7jhBJVPn2IcDjvGAVpU
	38IJtH8QYJObJhgiUYsQTb2lcTU5PR5zr0BELUT5gw95NosokKWLFqJspK1f/hY3CHwOE7uPuFj
	SUJ7bca3YaNMzByIvFJv+8Px7KA+1VjFg5L6dAMDzZSJNaeK4JPoz1BAo1zDaPzWunQ==
X-Gm-Gg: AY/fxX79ywNdXWexpiOw67TXcLKZ6ECiyLsfPb3LWgfcgbKsyYO2Urw0eicotLIkFYd
	COqHmD6HiU39APO6IKj4EX56ygcOn0LerMzhNQCctiiZlnYhrsgMLF3r4+ihDl7X/mbQVt6c93p
	5yvx+J6OufDx1zwr9O7/gwD0uh0gfQx2RwFSKeG4B7GwWv4pEnpBsk82m+4i2Kj9TT6ZsTk13+D
	K4WXH47gf3A+UxkIsTBdhFCKMJ3YQ3OwmjOMVT2KOTOrhXcfVLCW+fdGcv5x0uFziaUGSHcVDQM
	GbwF8oQ099v8Tn9uzg+wd7zxhmVhDdRx1QJ7V2uh2kzwqzLKpNALitbYf0X8PpVDyPnCbxS6PC4
	RKkUBTu7xEIZUSe8RScqke3ezjzBwlTsRurc2hQLGfqxo+C0L1nl6QjhpSDsDrFg7
X-Received: by 2002:a05:7022:eace:b0:119:e56b:c758 with SMTP id a92af1059eb24-1246aad1d38mr568311c88.29.1768891382109;
        Mon, 19 Jan 2026 22:43:02 -0800 (PST)
X-Received: by 2002:a05:7022:eace:b0:119:e56b:c758 with SMTP id a92af1059eb24-1246aad1d38mr568287c88.29.1768891381455;
        Mon, 19 Jan 2026 22:43:01 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm19128658c88.7.2026.01.19.22.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:43:01 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 22:42:51 -0800
Subject: [PATCH RESEND v2 1/5] media: dt-bindings: Add CAMSS device for
 SM8750
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-add-support-for-camss-on-sm8750-v2-1-3e06583a0a81@oss.qualcomm.com>
References: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
In-Reply-To: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA1NCBTYWx0ZWRfX6rwCho+ahTSe
 gKrJbJYpJGksa0llBBQ+KmTY4kcvzO3Eh1LsQoTQuhIA8p0q2hhnd6E9Udr/zW4UjGn42P0IeC/
 f5ACw4SNdSPrKsVCwPDwq1tTnatOBi8TQhxbw4ZcU95MgbxAvww1W1h53gxzVHMq/in2/Go7DaS
 xCP9hmwY2hzn956v4Ei7ezWnQf9nQ5Crj6iN6GMkb4abHGp9A2vZ3Ns1K3E2Djrv5lpDPrPYET5
 VyaV5HK2YgZ4ssr/1smGNO6PE/+xhKZmH0jbZCBA8oLzHzsK67hYqzxMvdCqAw/t7n2ULOMaTSs
 RNIKdluNaryE2ALR9XSEaTHcig+DvAWUH1ldRN3TNR1lm8OZLZKwZ6Dgtry9vG0IJ4FR+abEthp
 eUqDdf+DARv6c2URTc6O8Ofl/ZQrLVEseDo/9/ADypUdhJoKE5oHedPuwPZKxq7yskjj1tgj1gk
 79WaQP6DGORvPR8i8Wg==
X-Authority-Analysis: v=2.4 cv=Is4Tsb/g c=1 sm=1 tr=0 ts=696f23f7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=dpxBiYkotQz7p_VYlh4A:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: aUYwIQBEYGit4R-r0CPHMtzwwAYLXOVW
X-Proofpoint-GUID: aUYwIQBEYGit4R-r0CPHMtzwwAYLXOVW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200054

Add bindings for Camera Subsystem (CAMSS) on the Qualcomm SM8750 platform.

The SM8750 platform provides:

- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 6 x CSIPHY (CSI Physical Layer)
- 2 x ICP (Image Control Processor)
- 1 x IPE (Image Processing Engine)
- 2 x JPEG DMA & Downscaler
- 2 x JPEG Encoder
- 1 x OFE (Offline Front End)
- 5 x RT CDM (Camera Data Mover)
- 3 x TPG (Test Pattern Generator)

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8750-camss.yaml          | 663 +++++++++++++++++++++
 1 file changed, 663 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml
new file mode 100644
index 000000000000..e2a9f89888f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml
@@ -0,0 +1,663 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8750-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM8750 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
+
+description:
+  SM8750 camera subsystem includes submodules such as CSIPHY (CSI Physical Layer)
+  and CSID (CSI Decoder), which comply with the MIPI CSI2 protocol.
+
+  The subsystem also integrates a set of real-time image processing engines and
+  their associated configuration modules, as well as non-real-time engines.
+
+  Additionally, it encompasses a test pattern generator (TPG) submodule.
+
+properties:
+  compatible:
+    const: qcom,sm8750-camss
+
+  reg:
+    items:
+      - description: Registers for CSID 0
+      - description: Registers for CSID 1
+      - description: Registers for CSID 2
+      - description: Registers for CSID Lite 0
+      - description: Registers for CSID Lite 1
+      - description: Registers for CSIPHY 0
+      - description: Registers for CSIPHY 1
+      - description: Registers for CSIPHY 2
+      - description: Registers for CSIPHY 3
+      - description: Registers for CSIPHY 4
+      - description: Registers for CSIPHY 5
+      - description: Registers for VFE (Video Front End) 0
+      - description: Registers for VFE 1
+      - description: Registers for VFE 2
+      - description: Registers for VFE Lite 0
+      - description: Registers for VFE Lite 1
+      - description: Registers for ICP (Imaging Control Processor) 0
+      - description: Registers for ICP 0 SYS
+      - description: Registers for ICP 1
+      - description: Registers for ICP 1 SYS
+      - description: Registers for IPE (Image Processing Engine)
+      - description: Registers for JPEG DMA & Downscaler 0
+      - description: Registers for JPEG Encoder 0
+      - description: Registers for JPEG DMA & Downscaler 1
+      - description: Registers for JPEG Encoder 1
+      - description: Registers for OFE (Offline Front End)
+      - description: Registers for RT CDM (Camera Data Mover) 0
+      - description: Registers for RT CDM 1
+      - description: Registers for RT CDM 2
+      - description: Registers for RT CDM 3
+      - description: Registers for RT CDM 4
+      - description: Registers for TPG 0
+      - description: Registers for TPG 1
+      - description: Registers for TPG 2
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+      - const: icp0
+      - const: icp0_sys
+      - const: icp1
+      - const: icp1_sys
+      - const: ipe
+      - const: jpeg_dma0
+      - const: jpeg_enc0
+      - const: jpeg_dma1
+      - const: jpeg_enc1
+      - const: ofe
+      - const: rt_cdm0
+      - const: rt_cdm1
+      - const: rt_cdm2
+      - const: rt_cdm3
+      - const: rt_cdm4
+      - const: tpg0
+      - const: tpg1
+      - const: tpg2
+
+  clocks:
+    maxItems: 61
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: camnoc_rt_vfe0
+      - const: camnoc_rt_vfe1
+      - const: camnoc_rt_vfe2
+      - const: camnoc_rt_vfe_lite
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy3
+      - const: csiphy3_timer
+      - const: csiphy4
+      - const: csiphy4_timer
+      - const: csiphy5
+      - const: csiphy5_timer
+      - const: gcc_axi_hf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: qdss_debug_xo
+      - const: camnoc_ipe_nps
+      - const: camnoc_ofe
+      - const: gcc_axi_sf
+      - const: icp0
+      - const: icp0_ahb
+      - const: icp1
+      - const: icp1_ahb
+      - const: ipe_nps
+      - const: ipe_nps_ahb
+      - const: ipe_nps_fast_ahb
+      - const: ipe_pps
+      - const: ipe_pps_fast_ahb
+      - const: jpeg0
+      - const: jpeg1
+      - const: ofe_ahb
+      - const: ofe_anchor
+      - const: ofe_anchor_fast_ahb
+      - const: ofe_hdr
+      - const: ofe_hdr_fast_ahb
+      - const: ofe_main
+      - const: ofe_main_fast_ahb
+      - const: vfe0_bayer
+      - const: vfe0_bayer_fast_ahb
+      - const: vfe1_bayer
+      - const: vfe1_bayer_fast_ahb
+      - const: vfe2_bayer
+      - const: vfe2_bayer_fast_ahb
+
+  interrupts:
+    maxItems: 32
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+      - const: camnoc_nrt
+      - const: camnoc_rt
+      - const: icp0
+      - const: icp1
+      - const: jpeg_dma0
+      - const: jpeg_enc0
+      - const: jpeg_dma1
+      - const: jpeg_enc1
+      - const: rt_cdm0
+      - const: rt_cdm1
+      - const: rt_cdm2
+      - const: rt_cdm3
+      - const: rt_cdm4
+      - const: tpg0
+      - const: tpg1
+      - const: tpg2
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: cam_ahb
+      - const: cam_hf_mnoc
+      - const: cam_sf_icp_mnoc
+      - const: cam_sf_mnoc
+
+  iommus:
+    items:
+      - description: VFE non-protected stream
+      - description: ICP0 shared stream
+      - description: ICP1 shared stream
+      - description: IPE CDM non-protected stream
+      - description: IPE non-protected stream
+      - description: JPEG non-protected stream
+      - description: OFE CDM non-protected stream
+      - description: OFE non-protected stream
+      - description: VFE / VFE Lite CDM non-protected stream
+
+  power-domains:
+    items:
+      - description:
+          IFE0 GDSC - Global Distributed Switch Controller for IFE0.
+      - description:
+          IFE1 GDSC - Global Distributed Switch Controller for IFE1.
+      - description:
+          IFE2 GDSC - Global Distributed Switch Controller for IFE2.
+      - description:
+          Titan GDSC - Global Distributed Switch Controller for the entire camss.
+      - description:
+          IPE GDSC - Global Distributed Switch Controller for IPE.
+      - description:
+          OFE GDSC - Block Global Distributed Switch Controller for OFE.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: top
+      - const: ipe
+      - const: ofe
+
+  vdd-csiphy0-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY0 core block.
+
+  vdd-csiphy0-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY0 pll block.
+
+  vdd-csiphy1-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY1 core block.
+
+  vdd-csiphy1-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY1 pll block.
+
+  vdd-csiphy2-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY2 core block.
+
+  vdd-csiphy2-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY2 pll block.
+
+  vdd-csiphy3-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY3 core block.
+
+  vdd-csiphy3-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY3 pll block.
+
+  vdd-csiphy4-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY4 core block.
+
+  vdd-csiphy4-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY4 pll block.
+
+  vdd-csiphy5-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY5 core block.
+
+  vdd-csiphy5-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY5 pll block.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-5]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input ports for receiving CSI data on CSIPHY 0-5.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@ad27000 {
+            compatible = "qcom,sm8750-camss";
+
+            reg = <0x0 0x0ad27000 0x0 0x2b00>,
+                  <0x0 0x0ad2a000 0x0 0x2b00>,
+                  <0x0 0x0ad2d000 0x0 0x2b00>,
+                  <0x0 0x0ad6d000 0x0 0xa00>,
+                  <0x0 0x0ad72000 0x0 0xa00>,
+                  <0x0 0x0ada9000 0x0 0x2000>,
+                  <0x0 0x0adab000 0x0 0x2000>,
+                  <0x0 0x0adad000 0x0 0x2000>,
+                  <0x0 0x0adaf000 0x0 0x2000>,
+                  <0x0 0x0adb1000 0x0 0x2000>,
+                  <0x0 0x0adb3000 0x0 0x2000>,
+                  <0x0 0x0ac86000 0x0 0x10000>,
+                  <0x0 0x0ac96000 0x0 0x10000>,
+                  <0x0 0x0aca6000 0x0 0x10000>,
+                  <0x0 0x0ad6e000 0x0 0x1800>,
+                  <0x0 0x0ad73000 0x0 0x1800>,
+                  <0x0 0x0ac06000 0x0 0x1000>,
+                  <0x0 0x0ac05000 0x0 0x1000>,
+                  <0x0 0x0ac16000 0x0 0x1000>,
+                  <0x0 0x0ac15000 0x0 0x1000>,
+                  <0x0 0x0ac42000 0x0 0x18000>,
+                  <0x0 0x0ac26000 0x0 0x1000>,
+                  <0x0 0x0ac25000 0x0 0x1000>,
+                  <0x0 0x0ac28000 0x0 0x1000>,
+                  <0x0 0x0ac27000 0x0 0x1000>,
+                  <0x0 0x0ac2a000 0x0 0x18000>,
+                  <0x0 0x0ac7f000 0x0 0x580>,
+                  <0x0 0x0ac80000 0x0 0x580>,
+                  <0x0 0x0ac81000 0x0 0x580>,
+                  <0x0 0x0ac82000 0x0 0x580>,
+                  <0x0 0x0ac83000 0x0 0x580>,
+                  <0x0 0x0ad8b000 0x0 0x400>,
+                  <0x0 0x0ad8c000 0x0 0x400>,
+                  <0x0 0x0ad8d000 0x0 0x400>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "csiphy3",
+                        "csiphy4",
+                        "csiphy5",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1",
+                        "icp0",
+                        "icp0_sys",
+                        "icp1",
+                        "icp1_sys",
+                        "ipe",
+                        "jpeg_dma0",
+                        "jpeg_enc0",
+                        "jpeg_dma1",
+                        "jpeg_enc1",
+                        "ofe",
+                        "rt_cdm0",
+                        "rt_cdm1",
+                        "rt_cdm2",
+                        "rt_cdm3",
+                        "rt_cdm4",
+                        "tpg0",
+                        "tpg1",
+                        "tpg2";
+
+            clocks = <&camcc_cam_cc_camnoc_nrt_axi_clk>,
+                     <&camcc_cam_cc_camnoc_rt_axi_clk>,
+                     <&camcc_cam_cc_camnoc_rt_vfe_0_main_clk>,
+                     <&camcc_cam_cc_camnoc_rt_vfe_1_main_clk>,
+                     <&camcc_cam_cc_camnoc_rt_vfe_2_main_clk>,
+                     <&camcc_cam_cc_camnoc_rt_vfe_lite_clk>,
+                     <&camcc_cam_cc_cam_top_ahb_clk>,
+                     <&camcc_cam_cc_cam_top_fast_ahb_clk>,
+                     <&camcc_cam_cc_csid_clk>,
+                     <&camcc_cam_cc_csid_csiphy_rx_clk>,
+                     <&camcc_cam_cc_csiphy0_clk>,
+                     <&camcc_cam_cc_csi0phytimer_clk>,
+                     <&camcc_cam_cc_csiphy1_clk>,
+                     <&camcc_cam_cc_csi1phytimer_clk>,
+                     <&camcc_cam_cc_csiphy2_clk>,
+                     <&camcc_cam_cc_csi2phytimer_clk>,
+                     <&camcc_cam_cc_csiphy3_clk>,
+                     <&camcc_cam_cc_csi3phytimer_clk>,
+                     <&camcc_cam_cc_csiphy4_clk>,
+                     <&camcc_cam_cc_csi4phytimer_clk>,
+                     <&camcc_cam_cc_csiphy5_clk>,
+                     <&camcc_cam_cc_csi5phytimer_clk>,
+                     <&gcc_gcc_camera_hf_axi_clk>,
+                     <&camcc_cam_cc_vfe_0_main_clk>,
+                     <&camcc_cam_cc_vfe_0_main_fast_ahb_clk>,
+                     <&camcc_cam_cc_vfe_1_main_clk>,
+                     <&camcc_cam_cc_vfe_1_main_fast_ahb_clk>,
+                     <&camcc_cam_cc_vfe_2_main_clk>,
+                     <&camcc_cam_cc_vfe_2_main_fast_ahb_clk>,
+                     <&camcc_cam_cc_vfe_lite_clk>,
+                     <&camcc_cam_cc_vfe_lite_ahb_clk>,
+                     <&camcc_cam_cc_vfe_lite_cphy_rx_clk>,
+                     <&camcc_cam_cc_vfe_lite_csid_clk>,
+                     <&camcc_cam_cc_qdss_debug_xo_clk>,
+                     <&camcc_cam_cc_camnoc_nrt_ipe_nps_clk>,
+                     <&camcc_cam_cc_camnoc_nrt_ofe_main_clk>,
+                     <&gcc_gcc_camera_sf_axi_clk>,
+                     <&camcc_cam_cc_icp_0_clk>,
+                     <&camcc_cam_cc_icp_0_ahb_clk>,
+                     <&camcc_cam_cc_icp_1_clk>,
+                     <&camcc_cam_cc_icp_1_ahb_clk>,
+                     <&camcc_cam_cc_ipe_nps_clk>,
+                     <&camcc_cam_cc_ipe_nps_ahb_clk>,
+                     <&camcc_cam_cc_ipe_nps_fast_ahb_clk>,
+                     <&camcc_cam_cc_ipe_pps_clk>,
+                     <&camcc_cam_cc_ipe_pps_fast_ahb_clk>,
+                     <&camcc_cam_cc_jpeg_0_clk>,
+                     <&camcc_cam_cc_jpeg_1_clk>,
+                     <&camcc_cam_cc_ofe_ahb_clk>,
+                     <&camcc_cam_cc_ofe_anchor_clk>,
+                     <&camcc_cam_cc_ofe_anchor_fast_ahb_clk>,
+                     <&camcc_cam_cc_ofe_hdr_clk>,
+                     <&camcc_cam_cc_ofe_hdr_fast_ahb_clk>,
+                     <&camcc_cam_cc_ofe_main_clk>,
+                     <&camcc_cam_cc_ofe_main_fast_ahb_clk>,
+                     <&camcc_cam_cc_vfe_0_bayer_clk>,
+                     <&camcc_cam_cc_vfe_0_bayer_fast_ahb_clk>,
+                     <&camcc_cam_cc_vfe_1_bayer_clk>,
+                     <&camcc_cam_cc_vfe_1_bayer_fast_ahb_clk>,
+                     <&camcc_cam_cc_vfe_2_bayer_clk>,
+                     <&camcc_cam_cc_vfe_2_bayer_fast_ahb_clk>;
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "camnoc_rt_vfe0",
+                          "camnoc_rt_vfe1",
+                          "camnoc_rt_vfe2",
+                          "camnoc_rt_vfe_lite",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "csid",
+                          "csid_csiphy_rx",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "csiphy3",
+                          "csiphy3_timer",
+                          "csiphy4",
+                          "csiphy4_timer",
+                          "csiphy5",
+                          "csiphy5_timer",
+                          "gcc_axi_hf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe2",
+                          "vfe2_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid",
+                          "qdss_debug_xo",
+                          "camnoc_ipe_nps",
+                          "camnoc_ofe",
+                          "gcc_axi_sf",
+                          "icp0",
+                          "icp0_ahb",
+                          "icp1",
+                          "icp1_ahb",
+                          "ipe_nps",
+                          "ipe_nps_ahb",
+                          "ipe_nps_fast_ahb",
+                          "ipe_pps",
+                          "ipe_pps_fast_ahb",
+                          "jpeg0",
+                          "jpeg1",
+                          "ofe_ahb",
+                          "ofe_anchor",
+                          "ofe_anchor_fast_ahb",
+                          "ofe_hdr",
+                          "ofe_hdr_fast_ahb",
+                          "ofe_main",
+                          "ofe_main_fast_ahb",
+                          "vfe0_bayer",
+                          "vfe0_bayer_fast_ahb",
+                          "vfe1_bayer",
+                          "vfe1_bayer_fast_ahb",
+                          "vfe2_bayer",
+                          "vfe2_bayer_fast_ahb";
+
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 657 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 372 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 276 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 287 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 456 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 664 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 702 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 348 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 349 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 413 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 416 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "csiphy3",
+                              "csiphy4",
+                              "csiphy5",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0",
+                              "vfe_lite1",
+                              "camnoc_nrt",
+                              "camnoc_rt",
+                              "icp0",
+                              "icp1",
+                              "jpeg_dma0",
+                              "jpeg_enc0",
+                              "jpeg_dma1",
+                              "jpeg_enc1",
+                              "rt_cdm0",
+                              "rt_cdm1",
+                              "rt_cdm2",
+                              "rt_cdm3",
+                              "rt_cdm4",
+                              "tpg0",
+                              "tpg1",
+                              "tpg2";
+
+            interconnects = <&gem_noc_master_appss_proc QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc_slave_camera_cfg QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc_master_camnoc_hf QCOM_ICC_TAG_ALWAYS
+                             &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc_master_camnoc_nrt_icp_sf QCOM_ICC_TAG_ALWAYS
+                             &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc_master_camnoc_sf QCOM_ICC_TAG_ALWAYS
+                             &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "cam_ahb",
+                                 "cam_hf_mnoc",
+                                 "cam_sf_icp_mnoc",
+                                 "cam_sf_mnoc";
+
+            iommus = <&apps_smmu 0x1c00 0x00>,
+                     <&apps_smmu 0x18c0 0x00>,
+                     <&apps_smmu 0x1980 0x00>,
+                     <&apps_smmu 0x1840 0x00>,
+                     <&apps_smmu 0x1800 0x00>,
+                     <&apps_smmu 0x18a0 0x00>,
+                     <&apps_smmu 0x1880 0x00>,
+                     <&apps_smmu 0x1820 0x00>,
+                     <&apps_smmu 0x1860 0x00>;
+
+            power-domains = <&camcc_cam_cc_ife_0_gdsc>,
+                            <&camcc_cam_cc_ife_1_gdsc>,
+                            <&camcc_cam_cc_ife_2_gdsc>,
+                            <&camcc_cam_cc_titan_top_gdsc>,
+                            <&camcc_cam_cc_ipe_0_gdsc>,
+                            <&camcc_cam_cc_ofe_gdsc>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "ife2",
+                                 "top",
+                                 "ipe",
+                                 "ofe";
+
+            vdd-csiphy0-0p9-supply = <&vreg_0p9_supply>;
+            vdd-csiphy0-1p2-supply = <&vreg_1p2_supply>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    csiphy_ep0: endpoint {
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&sensor_ep>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1


