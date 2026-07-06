Return-Path: <linux-media+bounces-66703-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0febM01cS2pWQAEAu9opvQ
	(envelope-from <linux-media+bounces-66703-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 09:42:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD16A70DB24
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 09:42:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UMnyBI+f;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OgAc+Uxk;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66703-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66703-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08D77305BADA
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 07:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962963E8C44;
	Mon,  6 Jul 2026 07:11:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72D03E4506
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 07:11:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321891; cv=none; b=fenzp0aQOmA37SMQrYrIhXDNrr8W7EFLBuAHUyQ+MIC/RXKxpk+Pmt4S2GGrCeuDU0F+JGQ4kMb+esvUnH0Y9Fxbf6ohRflvY3qc0aCAiNBWSrgiciLx/a8yPOTTptwrQCMDuGhgsTcQLYplHwr07oY0bvmOPNpsVD89EbsRVno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321891; c=relaxed/simple;
	bh=KKXZeb1RE0r005VvQQ7JENvpHu510rqjXgwKJAo5iQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Caqqg+tAIBGQQoVFcHrCPvoqxNaVs4dJL/al7Uh9O33AXHWJtvB8m70qtU6dGWybE/oT8jzzzUe1I/YIi1gJLTDMUR+PV1bph0dRjrjgSViLFPUpVDiMTWGULtoWw7RVNKoUjyGLd5F9s29mSvc2THEbdkw8hoVKUEjBI11iZME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UMnyBI+f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OgAc+Uxk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641s8l3614842
	for <linux-media@vger.kernel.org>; Mon, 6 Jul 2026 07:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KjE3aY0Hltr
	ecpTkRxum+Wgatm3vTg9XNPg/fbiZ22s=; b=UMnyBI+fLa7buZofz48salBJNU2
	JqbWnckE4T1F7ExiGYmWiIwpTAp/Pb8YMZFscaxNenoQIcZ3tRT+OTA5Yl+K2YQW
	6NUUEkGJ6yYlLS8Nq86P4qxeQLoxFABvXZE2yqXcdOGaftxrCu05axg81W/VU2vF
	U2IkbXiDnpROHMTuHVjKhFA3dYERcYXT4a5vhR5jzMXOb2VUK6P8dStr45xo7Ixh
	LjKUASyWcPAKQKgv1C2okskM+91Y6BwkAcaHwz9EP7PXEmeKXWk3Bw9kIYoczlj0
	aeKX91pmbQ4sROA+m+xtFtf01fKrkGbaTM9ySViOqA5pbAwqwWOO0Q7mHzw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvn1qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 07:11:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ec45d9628aso65474036d6.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 00:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321881; x=1783926681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjE3aY0HltrecpTkRxum+Wgatm3vTg9XNPg/fbiZ22s=;
        b=OgAc+UxkmaoobJ10e5CWqEALgyUwmr5TUOC40BI5+owf3lw59C2+dWx/EtCjvfbdXS
         SZZwG3qI+DM9Yc4Yu0Rziwcew7wwdRyGVafUB1cCusoUnBvEIgX1MctlE3gRnM2wm2CZ
         yz50xb6JGFGXr9q7klf/juk3qv2GY8ITQ/qNQMCLFNDiaagqhaoRRlM7aYtQtwvhThPQ
         eok3fpsKzrxtDL5gGc0nA+TJZE0hAQlJLPRofL5uNfjpqmVj48iLzlfxa5CqjMqmS7u0
         Gc+yuOFXxI7YR69s5V9DS3xPWqB7VgtvMbpBlAByb59mCvVRZ14AP8wBGSbQwp0ewLgk
         p/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321881; x=1783926681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KjE3aY0HltrecpTkRxum+Wgatm3vTg9XNPg/fbiZ22s=;
        b=Rjh1wNpk0p+XutuoHv8ue4Xn1EdZ8Zr0ab/IgHrJfriD7/NMaT1YQwsLvg2rkvz497
         8T/WaRIhoOMXAPQAa/SnKFSOdjCMKNfmIMuwM9nrtWeScQwqgF8Qko6IlIncehGcasrb
         0eiHGwp9VEReHIb5LKvABxG9UA+7YE7RPN/Ol1D3FD3JPksRGkFlJT/TGKha+EGQDS23
         Huey9GGf42fMzLyg/6XrArDtFBK1kcT4rlszPU2N17EqkZDyuutHIpTeojZDAu5P93dR
         9HVyjUdg+uCdDzmDAdUEDX99CyaTRbpGgSJTfsB+FK7+tvP7HvX5jvxfRhp3Kll7kyXr
         0fSg==
X-Gm-Message-State: AOJu0YxSNbL9Ga2rVT+e40LXQRQPnDRUmETniDR/prLBkxa8JDUVWcjn
	anTm7nRIA+02RPpfmfiELVKd7WTc607TbDT9a37eCP5OKDtKwFBCyTD7WfQpJrDEmW3Xn/9fZJa
	UwXdvgJXj3ZgcgY3IFraktXAB4ccNUSrDhRTah0uBxbPZM/gluM93LYZrIdxxHwfeobXR/bZXSn
	nQ
X-Gm-Gg: AfdE7cltIlTSraoDfd1DSPE9c1fESzLgnZh4SQjiVZmF64S01WvwxEFWyBGBjsSGAwX
	Mey6NtWQbJmKyY3okCPW7D6bmEkVVb9k1kDw2R5q6Z4GP1cgBZxgX12eeTpI2HpXqjRqDldssmW
	FzF6F1/eA5uBMyO92VGXwNRkmDz0+YUTBrMKrr6SRcOXVjbHYvKICNLAu5Jb6U86PVuwe4h55RZ
	M+wub14lq6EST4PJwI3l+CBzMAOF4SIYuQFxdtNukO+GZaxFH6WRYu+hoVgfUsCHqpgTpROOv40
	+qKc27w5M3itJZtfrr3T3xDYy/4tsGYAMcbuKFhY8wtzADviW2MDW8fOJirbSbWLVISaLNG9Keh
	gaSWBe/btgWc76tcMno4DvzVkMjBub/rqRvM=
X-Received: by 2002:a05:620a:4624:b0:92e:68be:1c5 with SMTP id af79cd13be357-92e9a34e907mr1295277085a.21.1783321880855;
        Mon, 06 Jul 2026 00:11:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4624:b0:92e:68be:1c5 with SMTP id af79cd13be357-92e9a34e907mr1295274885a.21.1783321880427;
        Mon, 06 Jul 2026 00:11:20 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f3b40sm674673866b.56.2026.07.06.00.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:11:19 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v4 2/5] dt-bindings: media: qcom,sm8250-camss: allow JPEG encoder child node
Date: Mon,  6 Jul 2026 10:11:10 +0300
Message-Id: <20260706071113.383215-3-atanas.filipov@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b5519 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=60vvH-AHyAWEQOE588EA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: X1wjBR2WGt5UvF6hl9EYmxjxEPKZ1863
X-Proofpoint-GUID: X1wjBR2WGt5UvF6hl9EYmxjxEPKZ1863
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfX64OkFmj9B9/s
 irPEbn4rPhfYiauWwf5Mh32+gboOTH6N+om8FM/BT0w+WPxYuezCffE2kLOtHSmGnRrTxIagUvg
 9vpZxd/pH/SE2+iC4+TA1IyEBM+zfxlrMhJMdTXCg96T+6tRzJPkEnIWVjUd46TTG2KootXVCFq
 w3UlEUMKcxTpt34KtlV1b0Ka+LwvfwnpSrMVNjksdZOmfDbqapa4F9MAFS7j47JQ+YQC8/yRf/C
 /38S/tPiI10sRRoblcF3CxTMgKG/6Dt8Grb9G3mrUSMfoXCfTtWnzK/pWcwlg95/eBnmS+cT8Ou
 dhfGnFufgkv+60lSw+Vn62EgsHRwCZlz9WcYAqudWO3xlc509DcpqUaP6wdQnHkMWSxpKWADh9n
 kZzbVNRgQ/PY9GgnZfoqTEA6eIvMOCTVbsL0iPQDocfd4Q86H/xcNdCIKZIi9tJGAkx2J3YzsWr
 I4dmb3yNJLzZzgl8VFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfX7Qdi/KxhhAg/
 TvP+TYpxlal2uDXRTV6W0gxTSuXirkVZqCtqm0dYGpLtdO/V7Y+K5/w5apAX3fTmmTi1ogbSmLL
 yWkkNTju7/N1ywgVgQBcSaLimJzK44Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
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
	TAGGED_FROM(0.00)[bounces-66703-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD16A70DB24

The CAMSS node uses #address-cells = <2>, #size-cells = <2> and ranges
to act as a bus for child IP blocks such as the JPEG encoder. Add these
properties to the binding so that dtbs_check does not reject them.

Use unevaluatedProperties: false instead of additionalProperties: false
so that child nodes are validated against their own schema (matched by
compatible) without requiring the parent binding to enumerate each child
type explicitly. This is the correct approach for a bus-like container
node and avoids updating the camss binding for every new child device
added in the future.

No functional change.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8250-camss.yaml   | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index a509d4bbcb4a..6008938ee369 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -102,6 +102,14 @@ properties:
       - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
       - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
 
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -317,7 +325,7 @@ required:
   - vdda-phy-supply
   - vdda-pll-supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


