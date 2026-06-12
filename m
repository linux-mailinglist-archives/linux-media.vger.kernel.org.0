Return-Path: <linux-media+bounces-64732-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RNUcEZthLGrXQAQAu9opvQ
	(envelope-from <linux-media+bounces-64732-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 21:44:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C4767C233
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 21:44:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MaHvfdw+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jvyX7jS5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64732-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64732-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8D83301AA5D
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 19:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E10395AE9;
	Fri, 12 Jun 2026 19:44:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FDB390992
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 19:44:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293464; cv=none; b=EKcu/Jc/DVEB/h+fPb8gbujLaVy0ScDvyPX2XzvRhiLoB9XdA+6mTInOyeERYdCYZYZckS4fjwCVEmOvaqCG/W7E89d7svpaFggDDd+2bE+jzJ4hHWv9/qeQlTo9pFlgQ3lOQjNiBGXhArXm4IpaYvrlVSp0qUtM4Gj82uDhwDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293464; c=relaxed/simple;
	bh=J9o6uiC3hi8q182stCHjWKLIz7MjXttP7UeclIVpQzk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C5Ga3SzR9pLeqTu3BLVUvQ0Snz8PnAYiZKMqW+JQtR09exyzNWETwPMj0jVKirp9/PLfqq4TvoP+6vimbKZlBtEOT628S9Fg8uBv7B/71IWadyjzRJU8ISKmM6twHbwGR9xHzVUrIa5aMrQYwkEhx4acGWdR8+X/XoDF8VCszNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MaHvfdw+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvyX7jS5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGVvvT019744
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 19:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JQY8vaHCT+s
	6pSmQcKdPxEExsD1nYmMloB07u5w9rOA=; b=MaHvfdw+R4kWe2I2ygXJBk4KCr9
	jmv4LGOcAz0Mv+G9qGMxhpHhjQe+8Goc8zzg4db9SjCrCjsg7AhwHuOuNPf5Z1Ni
	T5p1Ua/OhfJoMw6e4+nXKqA3GA9auL+W+1AOiGzq8Gx7QQZGCa5zo+lxno7QIDlI
	7R+S+Gecmm1RqEIVN76tzNe0apH/KTaYCtihDRxDLoBaWAei0eRMqVJn57RDYZYd
	DOkfFVQ6LiYTM6R25Qc3yuFMR4xw5cDendEPbtM9U0VTXHY6zwu53I515+bqrsKi
	pUOtsCbP6zkFZXiEAWNCF8/gcM1vg2ztfBKmk1LUn8XeHEvvRN21qu4BJ2g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbmrgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 19:44:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-914c8954923so234901085a.1
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 12:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781293462; x=1781898262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQY8vaHCT+s6pSmQcKdPxEExsD1nYmMloB07u5w9rOA=;
        b=jvyX7jS5VIqz3CTpBGqm7xmrwoq4TEh4/Epk1U696tX027zGcWz78Vk+WXJB3GS7hc
         M5XeuTCI/zTEJuUmuV2Zpp2SDEfNoPmwEV4ONg9Doq3p/YgWKpJMqFgUrOAXcbUaCEhl
         wofmPnMdU6JuHVaDqpueYQpmjLr0v62IKdTI2GcymPrOoHBc1oCQhMs5bKCA/Tl+SoLD
         5kUnM5Jbog78JVuup+vIeKfoWlrRyOOyK6L1axHA7EWWZyw9V4w+hRFNWOfZR9+7IYlA
         kWjIe1nSDYq3z8xCcp0JMEhEbIp2SfAY6rR/mAdQkN1HYDtgdsSGMJ3t5wzplBeQo6+P
         wJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293462; x=1781898262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JQY8vaHCT+s6pSmQcKdPxEExsD1nYmMloB07u5w9rOA=;
        b=BrW9ZEOo0eW8/KZ+51i9a5QwWgQsVKjx03HuMp5hHlS0HnDcIQrfEoxY+/B0FEa9n7
         E/2i+tgtMNxlzHsN1ZFj1rKjY/eQenOWWYHM2HuFptzOw8OEbG/Yc+g6xHaHesRifXDj
         6R2e4JmcsjHiC+++dGCveGkd9n8CpEYNvQdK+uvHKmHibcyyHefwm4MFXfu6kQncHgJe
         FjgW++0D4t7KBH1mNHg+yc6nO/t+ANJ3iZuRuOLDFlesc8AX6r/grvOxOx78tsh8mE8Z
         bwvb1Yrvt8NfY4IkmGpsTndTsVaAQqVz1oaQFlx0IaPWnUs/k8YF85Not9Yo82/nIklH
         knYw==
X-Gm-Message-State: AOJu0YxavJAmjSXsXacogSBiB9xJWfyB8nQPATfyTwE8WFOMZkoFiFK7
	aG89klKjyMNM8n6eAnLZQOD6krhEjW3z4mZtbQxM1rpHuEsl5SkW3PgVeUK7faE52rpnalKqcfI
	nloTRGX4bq+Z/PD5wd6/Fb7cY+GbatoE6k9tAIPsLLC6B+/jyqGnl6LEGl8EZVh2uCoj1MXsKcU
	DL
X-Gm-Gg: Acq92OF6ie1rm4fVqftdwEYOu94VWDE/ur/+yaI+0Pq2fx0C1yCpvDAtD/ZXcfszIF+
	ryI/trAEEhoUh5FoEE8K1ZoALDXjE6YwKK5dItKa2Do+0vS+HmLuu4eH8U5ENV8R/Kn5fGXaac4
	mjpWjk/8F/ma+Fq7m2GUK6qAvwv2DyZDTcMES1ziiD27n05I+Qhzg/O5YX8s2afw4VrSWAKkFUp
	/iAty9DuNvB6Vbtz8zCKDQpEKMZ6KvcVs1XF1rwCzci1lbQ0S3d7vcYHjDP5ySJbGQff6Ppy29Q
	gM9jStrMpLUzu/2ekPzQLaQj/LbPNnBNlAlTnNlWzbYkrHWctxpYajS2fZsdmkLBbaplx6nSW3P
	E/rRSn76+oVlVga68KLsBNkS3RyC3dzq+1pF2XaxeAxMFlQ==
X-Received: by 2002:a05:620a:4152:b0:915:70b5:b204 with SMTP id af79cd13be357-9161bf58dc3mr589396085a.54.1781293461693;
        Fri, 12 Jun 2026 12:44:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4152:b0:915:70b5:b204 with SMTP id af79cd13be357-9161bf58dc3mr589390485a.54.1781293461248;
        Fri, 12 Jun 2026 12:44:21 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420570sm138396466b.11.2026.06.12.12.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:44:20 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bod@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v1 1/4] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Fri, 12 Jun 2026 22:44:14 +0300
Message-Id: <20260612194417.1737009-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ChGQynWu4v97F6rW35O8bB6XHivDjyWx
X-Proofpoint-ORIG-GUID: ChGQynWu4v97F6rW35O8bB6XHivDjyWx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfX5kqY4pv1vgs2
 pSCW/ytEmseyy0DimmIoHOdnyWn7xXZHqKDCU6NpS1YZmin8EyT2So1vNZU4EaPiW7ZUdbJac46
 cPTCq9iB1uliQlcQCH5PsFpAcEs15Qw=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2c6196 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=8hwD-i0G8y5I-v6eKTYA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfX2AlplmXTkJ2P
 TzFjXZZhdgX9sMeuS5o4TgdxckFreiMrLFBCdLEsawjeKCcaf8NIFk10j/o6z7CBo8BqDAv40G/
 Q81TOeOW4RNEvFgubXboczEiizlOkkFqeaFqDaQrnpXnNB+IZ2qsEnq08CXqHBA9R9dCv8GAzEE
 gIxqupX7o8wYmNopgrgEUaJ28bNMBKO3CKYvW8yyfzV9vR8kgV7Hm1vMB8sUmOfjnLV/DTXQOsS
 lMG79K5iUmv68Oo60JSGbwjPSXX/aTqiGujiEbx7t5nQwgf0x7V7HKRCw7PR4BmpZDYRU8QFiYz
 YqdnOWAXDY2/WdvOaRa3kZwzfWDLs3pibUyf1yalgnHyQdbJB2j8icxi92FRTqBVOZS/nY/6IHq
 gjlgR9IyEb5bgxH1XZANB4yfpZQO/eMaWxygzjtxY7xp5x1fZyJpGiBEQaAAPr5rEapfsNdvdLR
 HTSxvoDMx+625yhA0NA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-64732-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,devicetree.org:url,quicinc.com:email];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4C4767C233

Add device-tree binding for the standalone Qualcomm JPEG encoder
hardware block (separate from CAMSS media pipelines).

Document required resources briefly and scope initial support to
currently used compatibles in this series, including SM8250,
QCM6490, and SM8550 class platforms.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,jpeg-encoder.yaml     | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
new file mode 100644
index 000000000000..83f19719a869
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
@@ -0,0 +1,142 @@
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
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
+
+  The JPEG hardware IP version 4.2.0 is shared across SM8250, QCM6490, SM8550
+  and related derivatives.  Platforms based on the SM8550 register layout and
+  interrupt wiring can reuse the qcom,sm8550-jenc fallback compatible, provided
+  the correct register base address and IOMMU stream IDs are supplied in the
+  DTS node.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: qcom,sm8250-jenc
+      - items:
+          - enum:
+              - qcom,qcm6490-jenc
+          - const: qcom,sm8550-jenc
+      - items:
+          - const: qcom,sm8550-jenc
+
+  cell-index:
+    description: Legacy JPEG HW instance index.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    oneOf:
+      - items:
+          - const: jpeg
+      - items:
+          - const: jpeg-regs
+      - items:
+          - const: jpeg_regs
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 6
+    maxItems: 6
+
+  clock-names:
+    oneOf:
+      - items:
+          - const: gcc_hf_axi
+          - const: gcc_sf_axi
+          - const: core_ahb
+          - const: cpas_ahb
+          - const: camnoc_axi
+          - const: jpeg
+      - items:
+          - const: gcc_hf_axi_clk
+          - const: gcc_sf_axi_clk
+          - const: core_ahb_clk
+          - const: cpas_ahb_clk
+          - const: camnoc_axi_clk
+          - const: jpeg_clk
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
+    jpeg-encoder@ac53000 {
+        compatible = "qcom,sm8250-jenc";
+        reg = <0xac53000 0x1000>;
+        reg-names = "jpeg";
+
+        interrupts = <0 474 4>;
+        power-domains = <&camcc 0>;
+
+        clock-names =
+            "gcc_hf_axi",
+            "gcc_sf_axi",
+            "core_ahb",
+            "cpas_ahb",
+            "camnoc_axi",
+            "jpeg";
+
+        clocks =
+            <&gcc 0>,
+            <&gcc 1>,
+            <&camcc 0>,
+            <&camcc 1>,
+            <&camcc 2>,
+            <&camcc 3>;
+
+        iommus = <&apps_smmu 0x2040 0x400>,
+                 <&apps_smmu 0x2440 0x400>;
+
+        interconnects =
+            <&gem_noc 0 0 &config_noc 8 0>,
+            <&mmss_noc 0 0 &mc_virt 0 0>,
+            <&mmss_noc 1 0 &mc_virt 0 0>,
+            <&mmss_noc 2 0 &mc_virt 0 0>;
+
+        interconnect-names =
+            "cam_ahb",
+            "cam_hf_0_mnoc",
+            "cam_sf_0_mnoc",
+            "cam_sf_icp_mnoc";
+    };
-- 
2.34.1


