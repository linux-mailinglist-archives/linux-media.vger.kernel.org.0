Return-Path: <linux-media+bounces-61684-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIYQJSwKB2o6rAIAu9opvQ
	(envelope-from <linux-media+bounces-61684-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:57:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C85554EEB8
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1933930FC848
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED7947DFAF;
	Fri, 15 May 2026 11:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ow2/Pxru";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NmESJO7U"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708C747DF94
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845636; cv=none; b=jIMM1i6HfaYhatSasACkRjNJlZlKU/LQzFSnehbJZA3Gt4c1Fvnv8SCsOR9IrYX+HBF9fRlXtSIT2xmrg77dL/gyBXdcQAo9rlaekx7k6Vw85mJ8hA7BpCRrzDAPGCt2UdLWVK4FkkPcwZmJmK9ilvM7CJ4cPPH2ddTL3bpF1zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845636; c=relaxed/simple;
	bh=4M2TBYpxqgqbTrXGYFva09FAQRD8CqoUIWxiqXhZFjY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Riov8GGkZTkEC30Kp4xYKw6jMYRmGwHAuBS60TIQ2ZSHr9veJoAOfFAFi6ZQk7KmqiaN2h2R33AktX2KW77jfyKI+A5U86azgibv0mBlwhPdNBUxKw0shs1UWKruy3qOFNXJRzEVo0+eybDu1fXSmvkmQdHa1FjCGtTrBTfpNkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ow2/Pxru; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmESJO7U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5A23r3796896
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6roQNjpb+8MQigLcJcJkp9nr601xqozhRNmfLC2tKqo=; b=Ow2/PxrusAXTWq5D
	QTWHn3eD3uMqayLeQ9SdBMJQxkb8F3OEjTCK4rsvN196DiPH2aoeVfs0r9R8Mb1a
	LTjRlnRyj8Obukk2ROJQ0qnZGtd5E47G3KEb53Dr2ovMm7bb4KMvxkcsgErTLznt
	fNCdlLF5h9YF6ezTXa9x9NmdIORnp+C77hjr8Cl1rYoFoTNHmD/q3IqKjGzsEJAA
	Xoe8yp8ocePVbstJIZsqcfNR/dYZ2TQxk1Z3G6UlOFLX9m/ndV3+24oAucofoaGs
	8pWUW/mfFC9ntwQh1YVZ0gomI/q0stdWGa7p4VVOqxuVVGlCavmempGU0H6rRG17
	0LctAA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su1pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:47:10 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-575c3a362f4so9558596e0c.2
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845630; x=1779450430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6roQNjpb+8MQigLcJcJkp9nr601xqozhRNmfLC2tKqo=;
        b=NmESJO7UEqjLljy+xnKil1B44mt0T5/dRGaJsHAO+1FnqCvY9k9qtaCJ3iOJYRTkOo
         OXZ2M85HlI6obJmMyRuUN5G9Oj23kAPv1rVUkgL+bc6ZS3D4eeyu1etK2PTL+Dj3+ZgE
         AT5GUANL3CfA+KPpM3UN1UTCGaV8SNSVXj/o6P/949wG8sDjSdkg0sE9j5wq94wzB9+j
         0EoWtuWf1+BXYUh+OofKON7yio6qIFVH64bAHqjwx/zYAzUNPzfHPtQQZ8tyvTrBV7Bk
         fw4tmgyzyXv5IcenF6YYD2c2ITyNKvvWHwVwNyzNcdjcm2hLvv2dacWfnQVSnDkFKDSl
         6bFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845630; x=1779450430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6roQNjpb+8MQigLcJcJkp9nr601xqozhRNmfLC2tKqo=;
        b=SuFxYGI1SsjP5WFR6RiC3bJrU4pdq1yptUEiBu/wWjrkrsHGwM3OFZXDneQZdjGF8y
         ekmL+VDty1zARG+wn0PJFpeELLXKXKjTBG8yS7CJg4ifEpIheE3CBcMEPCaeWsuLSZms
         iVY3KZ+k217d21j/rIfhghdvPsEJCZ69yfRcym6fhA6ndgZ0R/CHC4PaadtSNhuu1Gub
         PVgz/u2VIIuU+NWpuomU4cha5+lR1FqqbSwvx8mke/BRi6jOVxVKJfpIECuubknajirQ
         k80uHiAjm2TPTbxgMlmr6Uo+KwtoZCtd7AZkISwatCewLLxG6EU75rZNVcVzlVztnZYd
         wlSg==
X-Gm-Message-State: AOJu0YwRIxoT46sh0IdbDtVqbICGcWHfiwgeF8Tjb9PtZCoVtXIc5yqQ
	NjfywHixNYAHXPKAfJLnOHvQvqzxD7V279YLqEZTeFmc3IMkJGrek7FE74tvNRL+yeXqt+RFh+e
	8bKtC1D9eE2HOumzBmu1J1UBwAD4lp5siNgrtN2Cy8zGtqdj2NtTi4p7kTVQ6IUyrNA==
X-Gm-Gg: Acq92OHc4BgWT3BVGSpl58dKQMcrCfMrTRZ5m/w5sDjLWx+8HdlFeOPMyTpHfn34nrq
	9ARF30iQ0Jqka/ncCbMEIgRuvRnqtT3unEEOgJ/vvWBulUjtkjg3Q8ivo5Ohr+uFG17KVW52P3j
	DWbc+5hNX6fbaWjW0ya57LG4ehcUeMOvfG5YWn9OD7BeXQuf/11ZYVaTJmI4g3gOmMOHSHAKBLR
	ZLUoPYpUvEIHr00TQxchdFf7f1P6nw9VEmCMRyOCudXhfIllmMMIxIHvcJq83xVJ/ZqYF4MIXdS
	gT9PljA22sXuoi0aPeKt8N42h1qw7e32lzlDWOHKj2TKiiVwClnIuQC42vacyt6ruJhfsy8rFy1
	Tub75lzYNM5cJ5EJqI5sxQHn+W7rO/6Jd
X-Received: by 2002:a05:6122:30c4:b0:56d:451b:e4dd with SMTP id 71dfb90a1353d-5760c1c8c1bmr1863592e0c.12.1778845630068;
        Fri, 15 May 2026 04:47:10 -0700 (PDT)
X-Received: by 2002:a05:6122:30c4:b0:56d:451b:e4dd with SMTP id 71dfb90a1353d-5760c1c8c1bmr1863575e0c.12.1778845629522;
        Fri, 15 May 2026 04:47:09 -0700 (PDT)
Received: from [127.0.1.1] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c3150dsm216853366b.24.2026.05.15.04.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:47:08 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:46:59 +0300
Subject: [PATCH 1/3] media: dt-bindings: qcom: add JPEG encoder binding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-qcom-jpeg-v4l2-v1-1-f38c2e1b3555@oss.qualcomm.com>
References: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
In-Reply-To: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed <akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gjorgji Rosikopulos <grosikop@quicinc.com>, afilipov@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX4BJWPFfACQER
 /kZQyXGOErT8dqJCkppjZHNPEAX5WGsd/MZEGa1DoNpR/2u16cEjLFBn94wkuSIX6AJnGGzJ3n4
 0FK510QkqDF2RuaRpVE9jMe8h/NP8ScZnQq3PxqZf5eQX9O/+pqf9Kw3nmqQ9xy1WNqz2baGyFK
 /uJQEZC7RK12SKOuvTu6zgsBpOLQU08LF2w4f+WeCDBEJZCqERFJIt3xi8muebereQBNBi4q+U2
 1/j7P4VUNmbwW2dMUBHsa2Emz8RlOQAyDgYhcY397/vHlrdIb5aVe8ra/MKYWvzQUPvqw2VIUlQ
 u0xzx1tH5hvnrcUUn/GQ76iZOQ+P5ulwyElHusMWRW++2WhpufHkJRs6G2zDzA8vb2HN7QprfsE
 euUf7Fm6hfhnPTcfmIjT7F2MycoDYV8iouitsHOSS8w3E4TFQw9a72CotV5GrEMpMbCUvC04XyP
 4qFRka9DDrATBRQA6Hw==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a0707be cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=zuwlB1WPNs1_77ySLLMA:9
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xuPD5XxiSkClQjviDAl-MvbpJFOHk_9P
X-Proofpoint-ORIG-GUID: xuPD5XxiSkClQjviDAl-MvbpJFOHk_9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: 2C85554EEB8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-61684-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email,devicetree.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add YAML device tree binding for the Qualcomm JPEG encoder
hardware. This binding is used by the newly added driver and
describes all required resources, including clocks, power domains,
IOMMU mappings and interconnect paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,jpeg-encoder.yaml          | 122 +++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
new file mode 100644
index 000000000000..fac3e654458d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm JPEG Encoder
+
+maintainers:
+  - Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>
+  - Hariram Purushothaman <hariramp@quicinc.com>
+
+description: |
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - qcom,sc7180-jenc
+        - qcom,sm8250-jenc
+        - qcom,sm7325-jenc
+        - qcom,sc7280-jenc
+        - qcom,qcm6490-jenc
+        - qcom,sm8550-jenc
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: jpeg-regs
+      - const: cpas-regs
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 6
+    maxItems: 6
+
+  clock-names:
+    items:
+    - const: gcc_hf_axi_clk
+    - const: gcc_sf_axi_clk
+    - const: core_ahb_clk
+    - const: cpas_ahb_clk
+    - const: camnoc_axi_clk
+    - const: jpeg_clk
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 2
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: cam_ahb
+      - const: cam_hf_0_mnoc
+      - const: cam_sf_0_mnoc
+      - const: cam_sf_icp_mnoc
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - power-domains
+  - iommus
+  - interconnects
+  - interconnect-names
+
+additionalProperties: false
+
+examples:
+  - |
+    qcom_jpeg_enc: qcom,jpegenc@ac4e000 {
+        cell-index = <0>;
+        compatible = "qcom,qcm6490-jenc";
+        reg =
+            <0 0xac4e000 0 0x4000>,
+            <0 0xac40000 0 0x1000>;
+
+        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+        clock-names =
+            "gcc_hf_axi_clk",
+            "gcc_sf_axi_clk",
+            "core_ahb_clk",
+            "cpas_ahb_clk",
+            "camnoc_axi_clk",
+            "jpeg_clk";
+
+        clocks =
+            <&gcc GCC_CAMERA_HF_AXI_CLK>,
+            <&gcc GCC_CAMERA_SF_AXI_CLK>,
+            <&camcc CAM_CC_CORE_AHB_CLK>,
+            <&camcc CAM_CC_CPAS_AHB_CLK>,
+            <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+            <&camcc CAM_CC_JPEG_CLK>;
+
+        iommus =
+            <&apps_smmu 0x20C0 0x20>,
+            <&apps_smmu 0x20E0 0x20>;
+
+        interconnects =
+            <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,
+            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>,
+            <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI1 0>,
+            <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI1 0>;
+
+        interconnect-names =
+            "cam_ahb",
+            "cam_hf_0_mnoc",
+            "cam_sf_0_mnoc",
+            "cam_sf_icp_mnoc";
+    };

-- 
2.34.1


