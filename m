Return-Path: <linux-media+bounces-64734-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +xsMEz1iLGoPQQQAu9opvQ
	(envelope-from <linux-media+bounces-64734-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 21:47:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A674B67C2E2
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 21:47:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EIOFReCy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dO6cjPwp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64734-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64734-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3BFF346E4B0
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 19:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF8F3806DD;
	Fri, 12 Jun 2026 19:44:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690E038F923
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 19:44:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293469; cv=none; b=q22sSxW5X3PXkrpnl/ekINWhw3kf0wUup/mlBe84k4D5T2ILPSatVrzCI/AhoN6K6MgEB9G2gdJSdHRbiYlNiuylPWWXkbCssWVVIFuk0pNdXeyMcDV4RdLLlSqw7GCuiQ53ErqfC/wbyAYiQDdM3CmA1SBkjWbOGkygVxH3IH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293469; c=relaxed/simple;
	bh=VOMbj2ZE6cMRmBwdvDtc8IMkWEVRVNHHLBnh+HmMZZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lBTbuX47vSg5VXRoVH+SU7UCErSikl0das1cySNNWs13zQfYMcmcyJ93fqyrE0u3o44NtAMBhX/f8e3oum04F4w3AuaMIITJviCjngkREH5TUISgUI6Y6i9fAcG0d9WPs1iqPOLRaBdp51FxA45JISVZeJPgkxbjd8bY1XUaU4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EIOFReCy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dO6cjPwp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CJFmDn265645
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 19:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UeYZzjCNeIR
	vXdsjWgi0LrAMwlAA5MEg3Qbk2m3pJt0=; b=EIOFReCyWj90CdXptjNq/7Zb8LV
	BA5d24GkO1FG1Qq31A+PFf0nSNgb+RKaXsyxZn++s/U+zGMm6I2r4DoWbfigiy+F
	LdvFy66YyJG8gZg+K45WAj+nZDbxcVfEdyNK5cX2F75gKEdZ0Lnpho6me4cIdOum
	KV+7yCn6Hx7USAyjYkH0UgsQ11EzLbxhpjihFiN9tvSbAV5e8EzNgjO91jPhu7+w
	zu4eralScTKJoXDIx8ALSHbWv2P3UaBUIrJlA9b5/QcPYZNPoVS1Iqsd/mlSU+mY
	sHG1Ol87fjunxrZCjPe/KtaVJjeHaglDnwdMRhn/JgLJrn9zAkgMchqcl1g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4err46r2vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 19:44:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ccd77414afso18387866d6.3
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 12:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781293465; x=1781898265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeYZzjCNeIRvXdsjWgi0LrAMwlAA5MEg3Qbk2m3pJt0=;
        b=dO6cjPwpzmOxEqbBvvw7IJD4xorpqukIcoXhn5+jDo+u2fOsmwNetbUug2TvBc3w37
         rovoNcXndcZK8/yo/+Y+woIhLtyhOJ3z5EXlvyJ5QfKoxRioVuf8VxnKXYDjErvjEIFV
         2JYdHOtsd/yT9422tFshJGF8pVBhw6PIJSax2C88XMj6NtlaBjqCjSNNmwdeRPoTQuV3
         NKUVeyltNMBWRftyb/3m4Tv+6/Mx3V97JqwyaiVO7m9V61mhhQtqPbmS6lqg0F8AKkzM
         QQt1x44u2C+no/0G0iD3X69/5XaEnlTgInFPaC/HJnSyC4+MnrtSJ4BA8rjy8L01/gNE
         RyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293465; x=1781898265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UeYZzjCNeIRvXdsjWgi0LrAMwlAA5MEg3Qbk2m3pJt0=;
        b=SOks0vavZ1CO4rrRsQQePel7H4qFlawymUBdwiV88OtBfWKinvcfh9ETnzA2mXRJox
         oFY1Pzy7fIz2GUzbtkmgJQtQp2EULaBNlal3HhABsFT5d0JHEIk63u8/nkDOJuD5Mf4K
         MWnDDuhzyP+rCzv0x6xvnuD/z2FFA1FLrER8Jw0pau9xEJ/QJdiKE3bE3IkGEp/LJmo9
         WTRPa4oP+1h19gfn7uKq2rwf7mKNH2A4LJW7txZHs5OjZdDcshpR4T7jQZ0kiIg/TCIj
         pM24c85eMpHwhFO3t0Uvl2QPE0TXNqHN97+5Sm3BFnVgkjlGX54bFKppv+8jeXCbdpZP
         tk4A==
X-Gm-Message-State: AOJu0YxmMyzPdwfHfzzCGG4V17RM7ol8K6QgU9WkTfLEh1etuPZnnhn7
	G3gVr0KwOv33SSXeAfd8DHzdum2D1V+h8tTMqfKE7I54mizOXCEqoQwaEhBX55MgTc6xdkC96Oo
	kKT+cFaESBNWJj71k/nJ268Rk6qA1a6AX1mQU0cAuw5LMd35V8oL2j8bYjEdcUabWxEE0hBXkCh
	FE
X-Gm-Gg: Acq92OGtQB6KBy0yIzPLB2Ekb18sINhrr6uuvaLWfHw6czJ7xSzdsF0R1DZmlCV1nWL
	UMMdjL/3fujzdPOVAFs17h9OD1+F9AD+T9d5pNMBjzlLp3mRoTcqWU0ktqjOJYkNhcVQR0gY4q7
	a53qtKR6oJNDoBA1GqTZfNgtlkBokDXpyFVH88+jhTd2IVizzLvmN1uw8RxVLFkFmPB3HvhNV6L
	r5sC6hvoilwOJtz/qYAsWL0KRSvey96rGc/0qMIujY58vLfkRsevHz7xIH8tMP5MAcvRhmTqewm
	3kTqPyX0C+uqbKJTvApXogCAIzTSEEUFS08gAqQb1lVwk7/Db6u9qbyLjsKg6hAHWR85NyhRZKH
	kVaLAAUTya78s2J7uRl7IQE1RKchiIpSPt3JcfHchT+ovBg==
X-Received: by 2002:a05:620a:2848:b0:8f0:7516:daa4 with SMTP id af79cd13be357-9161bd65c64mr634196285a.41.1781293464704;
        Fri, 12 Jun 2026 12:44:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2848:b0:8f0:7516:daa4 with SMTP id af79cd13be357-9161bd65c64mr634190985a.41.1781293464289;
        Fri, 12 Jun 2026 12:44:24 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420570sm138396466b.11.2026.06.12.12.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:44:22 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bod@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v1 2/4] arm64: dts: qcom: sm8550: Add JPEG encoder node
Date: Fri, 12 Jun 2026 22:44:15 +0300
Message-Id: <20260612194417.1737009-3-atanas.filipov@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=M8N97Sws c=1 sm=1 tr=0 ts=6a2c6199 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=-MlWyOcUqUnKHFJa12MA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: ZtdYBuGTuQMuLg3SlFJUGqFKuYYiKDS-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfX5AbzXUKdj5yI
 du7Vm7qwdYIZpmWg5dcESMWTLsTly9NthZcj9rBijxXu0yrFK6L5/2/uVQ552c+msnrka4gi2Ew
 90ESk3GE9wwAFqIVZs3j6GiIurU7g98dpunUZK56ZqXsQaOW66sfSN3E5vGPCPFwfSf2RpMKvEf
 NCOTyVEyynPXuq+E33xRO/VtHryd1ogCxd5xQEC9DJXON3KYnMEq14DBJhyOvdR8QGIuAemIzZN
 +1OMIDVRmSyVzpvw+W5y1cX16BP11UffuwKWjNrss29pRIoQJsHoqeWHQmcQyVnUaR4okGIfG8d
 8DOOlBFY1zu+v4p0/Cn8c1rbQXHuw80vlOpDfWJune3eQV6Bul1IJaJR0+UD2KD7JmGXnz4TU9D
 KEcZUiQjYF8D4xSDNx3010LQuLoquD7639IQ9JXvx2iVSL4WgNJSGtwLI4GxQZz4JspxqoWni/y
 tMQFJWK251VrS+AZbNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfX0vHmjXWmefEu
 pxViHOfRLyWikvSiIhp752HJHaItSBxxsGHONUU0xmE4BfDMAtvZN8b1bM3LQDvuOJCWuDVKNxL
 EsPb9DCtBD2STgwftvKOLqPkm7gucOw=
X-Proofpoint-ORIG-GUID: ZtdYBuGTuQMuLg3SlFJUGqFKuYYiKDS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-64734-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A674B67C2E2

Add the missing JPEG encoder hardware node in SM8550 DTS so the
new qcom-jpeg V4L2 encoder driver can bind and operate on this
platform.

The node wires the resources expected by the binding and driver,
including clocks, power domain, IOMMUs and interconnect paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 42 ++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6..8090b8b1d7bd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3677,6 +3677,48 @@ port@7 {
 			};
 		};
 
+		qcom_jpeg_enc: jpeg-encoder@ac4e000 {
+			cell-index = <0>;
+			compatible = "qcom,sm8550-jenc";
+
+			reg = <0 0xac4e000 0 0x4000>;
+			reg-names = "jpeg";
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_JPEG_CLK>;
+
+			clock-names = "gcc_hf_axi",
+				      "gcc_sf_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "camnoc_axi",
+				      "jpeg";
+
+			iommus = <&apps_smmu 0x20C0 0x20>,
+				 <&apps_smmu 0x20E0 0x20>;
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC 0
+					 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF 0
+					 &mc_virt SLAVE_EBI1 0>,
+					<&mmss_noc MASTER_CAMNOC_SF 0
+					 &mc_virt SLAVE_EBI1 0>,
+					<&mmss_noc MASTER_CAMNOC_ICP 0
+					 &mc_virt SLAVE_EBI1 0>;
+
+			interconnect-names = "cam_ahb",
+					     "cam_hf_0_mnoc",
+					     "cam_sf_0_mnoc",
+					     "cam_sf_icp_mnoc";
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,sm8550-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;
-- 
2.34.1


