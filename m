Return-Path: <linux-media+bounces-65937-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nlksFqFiQmrc5wkAu9opvQ
	(envelope-from <linux-media+bounces-65937-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 14:18:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC43B6D9F62
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 14:18:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pfcdb+7X;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PvqliEZi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65937-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65937-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C665302960B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2AD33FFF81;
	Mon, 29 Jun 2026 12:18:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB91E3FE36A
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 12:18:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735487; cv=none; b=MftAanJcWJaTdfGaYwh1qFG686M8krx8rg98/mya3fYlTCfytXdIYMW6qZcIpSZTFmCXF7LVm/RN2ZfTV4NdbhA8MAYEOZrYtvfHcxTWyru032f9BeAGyYQEjDrgD7Q7niuBE2zTMvREKajNdiL6xzaKbupjPGTE4jNBp/OI6fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735487; c=relaxed/simple;
	bh=0osYs0gFrrJEZE6iCUGbkP1jDPBnlf/O0siNXKMpI0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mOe3u0zcFc6TL5qtFbpx+86kc+Pti34se72Mr15V2tMENHnF3MIQqW9cakeqz9h6PKAHJ+B6KEzIZPIH/lxNKZRpaZxRtfvNS+Xbb53ebxtNqyudliQOYlYbYJlvjl8un65SOzXYi7jUmDXgyt0Jx9aau67XxZ7zRJVlBsEwWsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pfcdb+7X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvqliEZi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASuj12601194
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 12:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=krgFgmnm5jx
	WmULG5DZcK9leTRJxTnKRiZO5YqaRlkY=; b=pfcdb+7XB0KUiMWiu9eti/bl2Q+
	8p3YIugewfkH8kchyHD7q4yAOEAQrntgB7UpTDsDL0FirNi0SBdIpGx8rWrSOgUy
	STs4M/bu4wVaIWKl9nnkcFUa5JYAGsc2EPGuRT3Rq2GIXWkpjuLlSXmnuy30TEsn
	h77yYZUwiDXW13bXrozFyGsxuq4xqpMVHxup810Ub0RxkkbQoUGa6D0riqA6UIY0
	LqfCZmTQvMYGzo/hbHXqs0YsSFcRHJduClwnTptwbLsMfaV8eyw6kqoXauE3MF4c
	shTcyBKGMtu5mZy32FBy+U8EfqTQ7Dx7BJsQzUsMrZ6Y1Rwvmp3O8kcHcIg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw8rc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 12:18:04 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5af6d1a2c32so4827227e0c.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 05:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735484; x=1783340284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krgFgmnm5jxWmULG5DZcK9leTRJxTnKRiZO5YqaRlkY=;
        b=PvqliEZiG0mPZqjMMyHWV8FatJln7ZfyACouFVxEZrc1jEoHxEtONjWiB/Iv7dWNOI
         MsvGZAOK98hMcU5g6mjKbpJqmIIRd8uTJuzETZOIH5p638LLTpPolhyKtt04VkY4kiBZ
         Pgeg8txzLNFky0L+oLiaehkeZFa72honH+4xr43Gh1y1Xi4JJ9hCG51NlUTv45GParWZ
         N6Gg99SwVQjxo2EobTJ4Gzq4a2mKUe4Cu2MnjGUoPbPh77TV+zvVLPWtqogv/AjkX9gu
         nQ6QucfZY1J3O27ORCRhKOsUSF/+yNfM78TSIE6FNJU4sWAEyb0Gwys0RQ2DP6Ri3TVb
         J8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735484; x=1783340284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=krgFgmnm5jxWmULG5DZcK9leTRJxTnKRiZO5YqaRlkY=;
        b=IjKrSqrHaBbDWYd7N0q/ifohoJBaEi4YSfUPVYx88fR6vNxxBaT6I3ZpXxG4O6wtI+
         39ISCrZEi0LLKj/Zgux1HqpkFAhQoIiuMJIfA+DSA8IPjFS5tvffBZuGl5pkiyWHALmN
         LUGuKW6V1t0ph3f2Jbli1cStDSqmfSCtN2aHxMhu0rAa+Xe+5FZ6NLp399EJ5HxtoPkY
         LAg/Zt3TVLB2lIouJV9A3De+72kMsmG61QEgPe7LKs8JSUeko/FU2JX4iYZC0aFyNr1Z
         i0UhrelOhoDoKJrDi1CkOTszdp/4MfqaPktUXnHpEhSv5i4E0mGcq1Gf+uxgM9JwxyLj
         ZuQQ==
X-Gm-Message-State: AOJu0Yy53jX1ViVdkDcqZ9sJ/8sBanD3ac2Rs7AuGIZD8zO9NEW+4laJ
	ZBgU2+hpMCB5BYVLo7LhJCA7rcTELC8iZZV+8iepx0TNTVlmTM/VKvzBs17MXk0qyYtD+0d619D
	i2IkidG/oxl8IaVlGpy8DGRb6kLo+Er/e6R73v8pPRqFkUGnrvrPUpsDgNxid8pUsV4dqnTCJlP
	JM
X-Gm-Gg: AfdE7cmNjucSBtnAILzHI3NJMa8ujwdTMN2Sz37PQwOnfRGxzaefifs13umR7xUD9IF
	OoMrLC0goMZaRZbGpQ8xrwIT3aiHiH0s/A94OR0T1SlMTaziv7qv5mLpfGhstxGKy7dK76N00hE
	Cz6A0Q1AHd0iFEVdaTtNTznlb3C2SNOS/Db66R2bmxFhrJnqGwvtZAuRdpeh+uZP+Q2phLfbW3n
	1qPItGoK8y7597OgVPffcKNhyoFh+jtDHzonJjGnwb7K7QwCGeRh6/2H+v+hodNNAmXCq4mc7G2
	uU+mUWT2juXaEo8KEVckJnVGlM/t/Q6RkDGVt16FMvlv8ZzUHzgoKyNRVwPf+iZPv17+Llr4ZwM
	xKG/47Hi0KY4d5t8pZ/MX79N6J+2e5YR6IQc=
X-Received: by 2002:a05:6122:208b:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5bdba88ec29mr230814e0c.5.1782735483546;
        Mon, 29 Jun 2026 05:18:03 -0700 (PDT)
X-Received: by 2002:a05:6122:208b:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5bdba88ec29mr230759e0c.5.1782735480453;
        Mon, 29 Jun 2026 05:18:00 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f46e0d15sm6837519a12.14.2026.06.29.05.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:17:59 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v3 2/4] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Mon, 29 Jun 2026 15:17:48 +0300
Message-Id: <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfX8DYwSYN4Aes1
 EvTjdS8/1gJG2k+Omtg/+ihDmWYu1pEXQgmdiaq7CLrO0hXrCZry1MwNkfjodvi/GuWbLj1LEnt
 WEMJbdEiktQJPYuOG0+ooOIIIGBvZRo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfXy45L3S35djq1
 JJiz3d/JeuvbsZtiFpZxd2KUUhP+Q5qoKLQg5COBql8d+aqaGyT4twdiYvSKlj8bI5JtSAALupO
 17cxBMk98ifn/5+V28XkvbRTaEAAktYa3p7TJVzX7lgZmgKSbJIXQpq+JJpjyyKgqe0KPB1JZc0
 O6sFZdlksdnuOHvpnSKICwq5J/bUJLUxgezL/cEoqWu+xcDd783u925nWR36gGdp12FMKBoZO7I
 V53tnxMA0ga20e2aXksu5cN6LKFk9OWyEEwl3IKqPiIoa65XGMhfWTXHU0nfGHhXb3Xjjy97lyK
 +8aMdQW8GoR3ok2YKib2qxRclWjuhq2LwGcF5083VgQnfyydo4XzN55LMc3/Neg8A93z7EauDJJ
 mtGGaRYj9nydnFuggHU/fe5CuKbw0/WIS54rtwNej1+xyeF76xt3JSkGE6UChUJw1sTYVYweVxo
 eC2BioWCWHRz9YHGsgg==
X-Proofpoint-GUID: GKTNqPrBTQumgXkQhHUaXpa1oNa47rYc
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a42627c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=2iIih-OIPD95PTVVQyMA:9 a=hhpmQAJR8DioWGSBphRh:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: GKTNqPrBTQumgXkQhHUaXpa1oNa47rYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-65937-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:quic_vgarodia@quicinc.com,m:quic_jesszhan@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,devicetree.org:url];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC43B6D9F62

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domain, IOMMU streams, and interconnect paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,jpeg-encoder.yaml     | 160 ++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
new file mode 100644
index 000000000000..c8b4808054cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
@@ -0,0 +1,160 @@
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
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    description:
+      Two SMMU stream IDs for the JPEG hardware. The first entry is for
+      the JPEG core engine; the second is for the JPEG DMA/scale path.
+      The exact stream ID assignment is SoC-specific and not publicly
+      documented by Qualcomm.
+    minItems: 2
+    maxItems: 2
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: hf-mnoc
+      - const: sf-mnoc
+      - const: icp-mnoc
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
+  - power-domains
+  - iommus
+  - interconnects
+  - interconnect-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss@ac6a000 {
+            compatible = "qcom,sm8250-camss";
+            reg = <0 0x0ac6a000 0 0x2000>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            jpeg-encoder@ac53000 {
+                compatible = "qcom,sm8250-jenc";
+                reg = <0 0xac53000 0 0x1000>;
+
+                interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+                power-domains = <&camcc TITAN_TOP_GDSC>;
+
+                clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                         <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                         <&camcc CAM_CC_CORE_AHB_CLK>,
+                         <&camcc CAM_CC_CPAS_AHB_CLK>,
+                         <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                         <&camcc CAM_CC_JPEG_CLK>;
+                clock-names = "hf_axi",
+                              "sf_axi",
+                              "core_ahb",
+                              "cpas_ahb",
+                              "cnoc_axi",
+                              "jpeg";
+
+                iommus = <&apps_smmu 0x2040 0x400>,
+                         <&apps_smmu 0x2440 0x400>;
+
+                interconnects =
+                    <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
+                    <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
+                    <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
+                    <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
+                interconnect-names = "cpu-cfg",
+                                     "hf-mnoc",
+                                     "sf-mnoc",
+                                     "icp-mnoc";
+
+                operating-points-v2 = <&jpeg_opp_table>;
+
+                jpeg_opp_table: opp-table {
+                    compatible = "operating-points-v2";
+
+                    opp-300000000 {
+                        opp-hz = /bits/ 64 <300000000>;
+                        opp-level = <0>;
+                        required-opps = <&rpmhpd_opp_svs>;
+                    };
+
+                    opp-400000000 {
+                        opp-hz = /bits/ 64 <400000000>;
+                        opp-level = <1>;
+                        required-opps = <&rpmhpd_opp_svs>;
+                    };
+
+                    opp-480000000 {
+                        opp-hz = /bits/ 64 <480000000>;
+                        opp-level = <2>;
+                        required-opps = <&rpmhpd_opp_svs_l1>;
+                    };
+
+                    opp-600000000 {
+                        opp-hz = /bits/ 64 <600000000>;
+                        opp-level = <3>;
+                        required-opps = <&rpmhpd_opp_nom>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1


