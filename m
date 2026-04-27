Return-Path: <linux-media+bounces-59678-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAOgIvZb72m3AgEAu9opvQ
	(envelope-from <linux-media+bounces-59678-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:52:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F48472D3F
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8C40302B223
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2471A3BA243;
	Mon, 27 Apr 2026 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AI9xGh/B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9oJZFMl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2343C1979
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294017; cv=none; b=nS/MN9+wD/AdpFC5+xYulXDyzC5/uwOsq7ICeEsnHZyu4t4X81Cy4FeH6mhRiE/B6xaiuv/7s6+r7xyKP6T99YkVIObMifV0V49Nrn1dVFcBd/Sv1S//soWgptm4EGsgE8BH87WrNLYzWFd8zvQ3SZ5q3jLdusdY1p7iVr4Fano=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294017; c=relaxed/simple;
	bh=MOx96nk8+K3X65iJbnE7cnDVWRW2qZP90gd3iYGxINQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KLF1pe3UCf8PNm/CpZXpZKe0zs73Gav0ENb2bSysJvwsTFz1geYdC5V5ZLo1JKEHmWmskFOmzmA+Ggd9vQgvTgpZQ9nEzDnJCvwvKd7/2982azF8hmYQH6l4/4h9SE6raxmjeaK744JUiJlCNj4B9fcesfFeY8L/SVfbTGW3HZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AI9xGh/B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9oJZFMl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TAYx2793074
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	60/MBbjIS4gVvBbUhWp9MfPwL6PKKn1z3/apxZjK3bY=; b=AI9xGh/BRtgdIiC/
	G3cXNFb2/9zGLySsZmTuS71/F5HZ2is7rBQyDpAyZ5DO9itit+OLa7lGpJTSTDv3
	LWGdm6yuujh+U9hRMP5eL+QNAq0se0Bbc8iPHIcW76P5/H/XX+0pEx/V166H05HD
	goCPdVPFISgU36lMEZuevGetYm2QL9Fi9dqzHk4czy0g+ub/FfktFJpofaGn81XQ
	04PdpGRC5AyNCIRNr2Ansut5spZyzRa0O8DEgCjyvqdz3TKe3wEZ51dfY8m8QNjw
	Qtop29DAzQH9b0N9bEKq7TWWcHVuz3BGc9s9c/Gndcf5pQ+lgY3t7CovxnoCYIyC
	nrhWpg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4uv6xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d6bf346adso130156601cf.1
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 05:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294013; x=1777898813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60/MBbjIS4gVvBbUhWp9MfPwL6PKKn1z3/apxZjK3bY=;
        b=e9oJZFMlZe7Xuu+aSI3VgRbRgBefH0AF7hE16xZ5skg2TfoEjBMC9xxGmril5Hkpv/
         2vhGJZS4TyVhXX4kzAdp/TNnhl7XAyWcYs7vGP0pxm3WqVILtyOY8/9IHv7pkM50s5Hj
         BxC6KsQwKlNH/nRWC7tYKSEtlLLwA27iGeMi6qCNnZMOh7MzqA4eboi8Zi9rTEQs50fl
         tcK65/sAAV0jb87sceUWxI/N0ok7PjPwTbXTT7+eQ1k3twRUtMUVa+rWjLt+h9emVnUB
         CM94PYNQgxI1Sfv6t7QBwkQHCTsOAfZ/QDeGfxPqUuyZyraxPiwdkPhPl+QRrNSR088h
         EnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294013; x=1777898813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=60/MBbjIS4gVvBbUhWp9MfPwL6PKKn1z3/apxZjK3bY=;
        b=XIt7xAeNxQhd9s1nbs1IDQRXd1oIxxwXWpi+9r4+YpRc7Z9nTzweZYohaMB9ovToPa
         0wGJoXvqeRYjgVMOfHaWThyoxXbAt9G1HgnMBWMPA3t5ImXhRGLCaRztttHdilILrsPe
         q3fRjnv4pGbpfstz0pSerGm72VefBayuKlNRYCnpbrSb8wr/UEq4iaQJZvjsu9difPuJ
         ra78GjHDsIeI6FvwdR4viTvQvY0HbGODbUyBxCp79Cg90gXro6GOk+bZ3c6YdoeMb+D7
         iZzKBaepW1xOj8lwnmkMKCMiiav7UCm5Y5cpAwYfT6hs53eeSZmJOMIzFto3q0jkiL9i
         6V5g==
X-Gm-Message-State: AOJu0YxpacxALWRHnw1lbwC4lO/nkB9p5hqjZYvorN6D9q4uL5OjejCT
	DefiF/kZIPTvLS5KtzICZuhYkrQnQYktnN9rnlARCMXNuyCrDffPFhKSF8up+xzIEv1Oj2yMYPC
	j6EKu9zPm/CbKLHtEk9kd4bEDxK9yKAHHdhPYdbG6jmALOLrAEJMtGn8kUD+18E2MmA==
X-Gm-Gg: AeBDiesvbvQxHHf9Ud2DWelQ0vUPiDg9xixvSWM3OrxYYZs+K5S0orZo4vjiYqbHBuk
	UTkpFVHudlIfS5eq/NnT6GazvXFJyPFIwDGuF+0rQYF27KbUOKT5bOz93fZKB0UZZS518AlCpFT
	kTFKhJg8dwAn7o5WYEkYQXW4zy1j4J1BOEC1luQvQnMkEWhsseNBgITfKtl2/Qz6xSqWBykkLj7
	JIpjtmarE++mwpLmZCieM0Ze8Bugs9AAPWU4qJeXvpCVBbcUtEHz5Q14un1n2pM3kw/qcUQBDvD
	5E0E8o859npfTgaaTc8B0wpUUss/O8pbBamAqYMxRVQBGfhe7R7P7/1tgSzShYdQqV5QTdtDO+S
	1D6gFxDPYBY3LcRcGSwfwYjiLdhZTMqHjB63sTD7GXEgDEnpH6rTbiFRUJdagOf8ihf6KCr/wRN
	RueEFADKuJ8ZpDaeFufSnShWqnbUs=
X-Received: by 2002:a05:622a:5e16:b0:50f:c36a:3821 with SMTP id d75a77b69052e-50fc36a3c68mr332981041cf.34.1777294013394;
        Mon, 27 Apr 2026 05:46:53 -0700 (PDT)
X-Received: by 2002:a05:622a:5e16:b0:50f:c36a:3821 with SMTP id d75a77b69052e-50fc36a3c68mr332980301cf.34.1777294012973;
        Mon, 27 Apr 2026 05:46:52 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:52 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:37 +0200
Subject: [PATCH v2 10/14] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: lGjC_uPtvfuXxgZc6-UrEB_1zADu2VZ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX61duWop01YtS
 BpWfunFH+t27RYM8bDXSCJzN3t+0DFu8TvhwqEoF1Rr+N0Gh+3FwaQcMZC5c/l/dndaoioVB8Mu
 5KU+MiZa7iCfo/cx5DvXAbsnwMwoT3PBfxxGOWFDtLd5GBVW+LvUfrpTB1f3fzHsErkJj43Qy+j
 B+2NGeBg3xf3anTyPZIJCEJ22Ln1J7NPnrnL0n4E+mAT//EHWjKuOTrRkxcVLIeYphCA1yMXgN1
 s3lFGQ0RMMhNT22VUMJArdQnsf7JBpdy8PuKa4gzTrsIfbpd95vFnnHUaaWW3lgeIBo2uXgSXmz
 tR8+/L5dku4Uff/xfQc1Tig3MBBRk/wv8qvpjvK04DhHT1J/B+3cBKiul9ZapKrNVEDzSbd/R7j
 3IyS55C/G0AbRQz8ksCE0sZuYRMYVUlfYC8uLqjXDVQm2s0q8urdqfSAUWolqD8CF7jrg40bUuw
 9oL2szXECzsyFbrzvaQ==
X-Proofpoint-ORIG-GUID: lGjC_uPtvfuXxgZc6-UrEB_1zADu2VZ3
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ef5abe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=V6_9baJ7xsrOGZ_p:21
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135
X-Rspamd-Queue-Id: 06F48472D3F
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-59678-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 131 +++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c91d73af61f5cbf8384be5ff9b03683de8413542
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block. It supports a range of
+  pixel-processing operations such as scaling, cropping, gain adjustments,
+  white-balancing, and various format conversions. The OPE does not
+  interface directly with image sensors, instead, it processes frames
+  sourced from and written back to system memory.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss-ope
+
+  reg:
+    maxItems: 5
+
+  reg-names:
+    items:
+      - const: top
+      - const: qos
+      - const: pipeline
+      - const: bus_read
+      - const: bus_write
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: data
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: config
+      - const: data
+
+  iommus:
+    maxItems: 2
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    camss_ope: isp@5c42400 {
+        compatible = "qcom,qcm2290-camss-ope";
+
+        reg = <0x5c42400 0x200>,
+              <0x5c42600 0x200>,
+              <0x5c42800 0x4400>,
+              <0x5c46c00 0x190>,
+              <0x5c46d90 0xa00>;
+        reg-names = "top", "qos", "pipeline",
+                    "bus_read", "bus_write";
+
+        clocks = <&gcc GCC_CAMSS_OPE_CLK>,
+                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_NRT_AXI_CLK>;
+        clock-names = "core", "iface", "data";
+
+        interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+        interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                        <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+        interconnect-names = "config", "data";
+
+        iommus = <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>;
+
+        operating-points-v2 = <&ope_opp_table>;
+        power-domains = <&rpmpd QCM2290_VDDCX>;
+
+        ope_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+
+            opp-465000000 {
+                opp-hz = /bits/ 64 <465000000>;
+                required-opps = <&rpmpd_opp_nom>;
+            };
+        };
+    };

-- 
2.34.1


