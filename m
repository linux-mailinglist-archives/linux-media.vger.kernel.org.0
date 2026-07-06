Return-Path: <linux-media+bounces-66705-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id byxgJVNcS2pdQAEAu9opvQ
	(envelope-from <linux-media+bounces-66705-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 09:42:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B28CF70DB2C
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 09:42:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eb8jbxDO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="O0d41f/I";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66705-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66705-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F25F307E56B
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 07:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2B23E9C2F;
	Mon,  6 Jul 2026 07:11:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5B13998BF
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 07:11:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321893; cv=none; b=reP8WQrj7mM440QJHIl0d3vS3btO2d+ZvWd496eza6vdhcKIs1mUwWabUhborm6JFHIhgdg/kuzQLvHc6QR4sbNixGV6vkAz+IblUYJgfX45eoaeiCrY6INormjD47aa75h50Ylpf/nSnAPklgKjqYsw1soRBJ7Jew3WoBqcLyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321893; c=relaxed/simple;
	bh=Knxq4D5423UKAR3wkX3Via9xM0R1jLHouZ/zCcPtUQE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TezZGLSsPZNqS7AYGUe/tENCLtMsc56HcffgyphniHfXra6SzulOc+S2MTxFQGpQSkYZ99JFIeywezZBWlku3y/hjpo/9kvQfuYHXFRP8JNRUFIDpUICe4L4t/3PJQqqWVmKIqZJncJ8gS24j92mP0dkVoYBO0lpGXATQYjG6uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eb8jbxDO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0d41f/I; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641q733586258
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 07:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CYG3iRypWTg
	hSWVq3cEnooEpodS3fjJadhGEx2ayCCA=; b=eb8jbxDOvLnt5Io2NkMS0BKWATF
	KdeSaX8cOXfQaduCNy2MjEAuMYrwI2Ilh43mdye4rmH/RBVBUmfvcPq7s7KJMECB
	U6Aj0EB6jjJmYjIrfyl1pBjZPw8vpuWRSY7rlN51mSXqBBPvobRDKzvixAhJw+i8
	+y4dzrd/4P/JVIIjhD387Rjoiaj6D2iPzbnp1/nnFQ2Fdzk2ZaJyiYO/Awytfxla
	ByB60TohccRc3wzv0933Vg6PxgoI1xw2fTRXFxQDbg0zWk3my3K2DsTQFtvs7nB1
	PVVhgHj00gXPmMCCblGLu3d2TICpCUwDoDBdkjgWP1jy5NxQh4qgaTrrbRw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8un0fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 07:11:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e52306621so189959685a.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 00:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321883; x=1783926683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYG3iRypWTghSWVq3cEnooEpodS3fjJadhGEx2ayCCA=;
        b=O0d41f/IXQsdvTNK4lfl0/ya4uDz8yH4qkVqUgKUl4CgR9z4yFv+YJHubWw0e4GJmt
         XCFahEJ+Y0EJtZ0xgRL+VAx2ZqpgTRRipVYoNWGTnlO6pbUfUjUSWOhY7t6pLxl0g17Y
         uTOS9HsW2JMCkLGjXJT0Uo5XcfiazsHal6FNtZyi68FzO+21aHnH88bDlg05BaDmQZAm
         i4k6bMvuaP7PsOoG2Q6yE8BLrx/mc+0D+QXvF2qzUsRGGg5BNxwvHeeL3l8J6915xI4d
         V04zfIfoMVO5RCRoA0iHc8JjvTeqwXDAYlMTxlGty+tlHzYMhkEygX/2FM5RM8Jq0gEA
         6Zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321883; x=1783926683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CYG3iRypWTghSWVq3cEnooEpodS3fjJadhGEx2ayCCA=;
        b=gPbE3cvCA/S3mov6nXwKKlpU9zlMzsyAW5J435OQGZb5zD5KZdRTZuQ82tek55t+XI
         IeS1YotzTMOAFNf3zIrbkzx8qqvPMuLfQgTQ293kW/ch9frjrRurnuBnBBo9LwMo+Mdl
         4vnwveMBC4x+PdgxcM/lURlhJAcywhtF44t6sdkUG76ajuEHuTk8CldBwh6WaewaHMsN
         +qyflipUx1QMn1dotKMEOnREVy/bTXs37sVLesgWAQ1mpzQc2uNDVNnBvQ+vpSgsAoGh
         O4aSqDzD8V0RfT5RrkJfWP5UOf202mCaAr3bQF4/dpW607PU4pQv06oHcbY97VxbLCf7
         ve0w==
X-Gm-Message-State: AOJu0Yzh8iopBEZmJEnCP21DJEeZnLbNlJ/i7bVw8hyDQ0jLyERibxLx
	oQ2G/gTVyvL8u5cWZe2FsztbyKiRBHhUn6lT0NpRQvG2tu0jKSLVLyhW6WK7qTwgbVQEv7demZn
	9AYbwPOE1gnXYO+Ea9LgKqmxc0rXb8whBYTQze7s4TIEq0HWSHvCc9ES4hQLecSDZvMH/Xkke2T
	pv
X-Gm-Gg: AfdE7clXVxHLwu0LmJ7N1iBLj/fWdkwnPv6EDngdJDX7QmP8GEUKer8E+jCBto3n8hC
	w/P1nFOAokxJGfUc2FoKoMcf5hEWzvnF/FTqJ5oNZPVipT5bHF894VSXiyLdbuaxZvwY5fDN7Wc
	dgUK6/2wAb4X6nc0lqNMTbRqDqMzzkcuzfAmlFUXsjHiowZQtOcUhYEQ7YipNGVzoK77eYQZfF9
	9jM4SA/mggQ85SlgCRVLOkhl2cawYRdn834tnCjyrWFmVjnsYJ82j7jNcN6FLREn5ZcczU0/Ezm
	a5VeVetdo0L9n9DenUZcexL8cdVDEQPBQic+86TEuEA53RR3l9kdUpa2/L2iqIbZklzSNV74NYB
	Xl/e+Omp4UMkOi698zJU1mLAhZQ+GSmeVIh4=
X-Received: by 2002:a05:620a:6888:b0:92e:74a5:c70a with SMTP id af79cd13be357-92e9a4172f3mr1241901185a.33.1783321882759;
        Mon, 06 Jul 2026 00:11:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6888:b0:92e:74a5:c70a with SMTP id af79cd13be357-92e9a4172f3mr1241899185a.33.1783321882344;
        Mon, 06 Jul 2026 00:11:22 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f3b40sm674673866b.56.2026.07.06.00.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:11:21 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v4 3/5] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Mon,  6 Jul 2026 10:11:11 +0300
Message-Id: <20260706071113.383215-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3PUVyLez1TRiEAVj1YXc3qpGHbMe4U02
X-Proofpoint-GUID: 3PUVyLez1TRiEAVj1YXc3qpGHbMe4U02
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfX63qjmF1TcvpO
 z6U+3cSdxHewROYiYo90fH90yahCD2JDe/hazv9otCP+DBLKbWVtnsF0JM2x6Fk5r/zM6xmqk/y
 Wa01aTMydcn55TfS4X5cEzsNoUxjLgs=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4b551b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=2iIih-OIPD95PTVVQyMA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfXz7eNrEVsUSCg
 mMJBoCKDfZF4cYP4keJ4ZvNUgt3334DcuJfBRjiceRollsefPEegw4ATKBIb154W2ytZU2znHdr
 UF5cV1N8PaA9imCzZUVDY1vvLYDCq7PR9UlQEW2nChEYaGTFZodLXCHqme+fvBv2+HZ38+1dI1y
 6IQHkC2MORsFZdFBmyRkzcHNnSqyGUfoDHzhpxwhku47DpvLwt/S8RZkfS4iKiTzWhkDN1GATnC
 MkIGVbsXp4LDWIIy2fOjrzdWgR8pCnA5BhAZNT9qm713bQcmeklpYPQJgbF47s7a8uUYi2F80Ul
 zoFbXR6NJ+DvB7Vm3XJ/22jbKDmdiOOduUc6XcSQqx2K5H8+CmXJ2nlS02jeoyrMP6Mio37I6uh
 E6t+Till/QfPZyM1WKajkVOLBEQd0ramvskIuQE4FUAiv6bP7+v6FXBXRzDhqL6R9lJnZ54UOYV
 yjBtFVYeS64dYyvSuzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66705-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,devicetree.org:url,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B28CF70DB2C

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domain, IOMMU streams, and interconnect paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,jpeg-encoder.yaml     | 151 ++++++++++++++++++
 1 file changed, 151 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
new file mode 100644
index 000000000000..e4c16388ef07
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm JPEG Encoder
+
+maintainers:
+  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
+
+description:
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8250-jenc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: hf_axi
+      - const: sf_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: cnoc_axi
+      - const: jpeg
+
+  interconnects:
+    maxItems: 3
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: hf-mnoc
+      - const: sf-mnoc
+
+  iommus:
+    maxItems: 1
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    jpeg-encoder@ac53000 {
+        compatible = "qcom,sm8250-jenc";
+        reg = <0xac53000 0x1000>;
+
+        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+        clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                 <&camcc CAM_CC_JPEG_CLK>;
+        clock-names = "hf_axi",
+                      "sf_axi",
+                      "core_ahb",
+                      "cpas_ahb",
+                      "cnoc_axi",
+                      "jpeg";
+
+        interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg",
+                             "hf-mnoc",
+                             "sf-mnoc";
+
+        iommus = <&apps_smmu 0x2040 0x400>;
+
+        operating-points-v2 = <&jpeg_opp_table>;
+
+        jpeg_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-100000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <100000000>;
+                opp-peak-kBps = <76800 104166 104166>;
+                opp-avg-kBps = <38400 33569 33569>;
+                required-opps = <&rpmhpd_opp_min_svs>;
+            };
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <200000000>;
+                opp-peak-kBps = <76800 208333 208333>;
+                opp-avg-kBps = <38400 67138 67138>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-400000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <400000000>;
+                opp-peak-kBps = <76800 416666 416666>;
+                opp-avg-kBps = <38400 134277 134277>;
+                required-opps = <&rpmhpd_opp_svs>;
+            };
+
+            opp-480000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <480000000>;
+                opp-peak-kBps = <76800 500000 500000>;
+                opp-avg-kBps = <38400 161132 161132>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <600000000>;
+                opp-peak-kBps = <76800 625000 625000>;
+                opp-avg-kBps = <38400 201416 201416>;
+                required-opps = <&rpmhpd_opp_nom>;
+            };
+        };
+    };
-- 
2.34.1


