Return-Path: <linux-media+bounces-64735-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3PF2JrphLGrdQAQAu9opvQ
	(envelope-from <linux-media+bounces-64735-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 21:44:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEC767C246
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 21:44:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="eKH1+Z/4";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZwW7wPLs;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64735-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64735-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C681306F7B9
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 19:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA261376475;
	Fri, 12 Jun 2026 19:44:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DBC38E8B2
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 19:44:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293475; cv=none; b=my3x/zsGmGB1Xx/u/tyEFTFg1jkieS+yEcKj73xMhQzMkhJvXiyvJNh4t9zLgEyDFROM0k4pzp9jP7M2ALDrf3KwkiOcQ6uNXbgXZ7Vm1qnPZ7UrXaE8ExPFMKadOptRYxXq3/6wGVcOMMCryfR2nKUwMoGKgCF0pkuq9aC4fRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293475; c=relaxed/simple;
	bh=aUUiq+Iduw1k27qHCGXJ7Idq+dfJ3/r0NyLUI6TSCPY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cHHBIxN7Rqk85gK+8V1+7Dxjhp5IcD0/Ky5Aq425bS9KrthwXxN+ceXPmhqAd117PAtlFqnvSd6PVeuaupYueLUy+XZKOOMXpVjLWvPzPf+T0Xmil3vMeofBYHuodjjfEK5FdOFAFSfLfxFyzChmrdVCufEIQ0eBwvolS6nIpxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKH1+Z/4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwW7wPLs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGV7ZG047244
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 19:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EB02umt05Y6
	14wpjp/AnU++dEKKady3nd9BX0XrwaCU=; b=eKH1+Z/4b/kBmG58mdpHBiUxNgO
	ypg3BfPj3TcTytK5Oq4RzrDW3NfvLu0eZ4LiwfJjuZSdJsp7EOBrpTPz5r9RHH/T
	uKK48YRRdOedctB/Uxb54jcX6RifdI9c9yeWjFPTF01e0IdS8iZe/Grk+fGUzaRu
	oL2qEgGicYuGfVGhDbFqaYMbJcQl5zD0etli0pCpWnVAvjcTLlri5RE6MV08dp58
	udoEsoNt0J99TPBtu/wuHgYdMKqN3HWgUltz41Ye+q0vaoUODWsG9kd2oEShiet6
	pmRaWd9zVy2ZdsQkCvqR3SZs7tydfY49rJodycrY9jAkhjLHAcdn9h9Ng5Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u44859-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 19:44:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157f453a27so197200485a.1
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 12:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781293466; x=1781898266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EB02umt05Y614wpjp/AnU++dEKKady3nd9BX0XrwaCU=;
        b=ZwW7wPLsgfH+8h6poYqgxiur/wLCg/2eLhspUzxWJaA6JYB5SEuFJIweJEwwd7tk1h
         0tHVdCBgKlbQSHXDiuzudUF4VLJaoTSx+ZgQPTMjva8LrVjoB7v7wdKrbOlj6Xrtmkw0
         KcAWiPu8D95BG0bxMtihqBH7iasse/7aeYLV3wX4hmMsVFy/GhHY2DE7fYnOJ4ZlprvM
         MwgGoNGUKsnSm3prVvb+Guh+TPkiILSJcur8v5IRreU0J+O0kvhjd9wTz0cinURaQKwI
         2g3ro6kggrx7BWPOIJsrz2VLjxxpRHfxewxl9cYAc2KbXNuu2rpZ8vIJ1BnFniOrI4ro
         gMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293466; x=1781898266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EB02umt05Y614wpjp/AnU++dEKKady3nd9BX0XrwaCU=;
        b=d5d5p7opC5rKlQtXDCUho3XvcyghOVldlQKF+oiByciuYf/hzCvL4q51vx/PqJxoNj
         +Ns3cJqg+XeU5uEnaZwSC1EOd9Tx2cBqwudBHWHy7ZCjKeKEEgDXpFR+4+66Leq3S7bf
         qdjFh8QWNh378JQGxhucA8WZIEzYsHbeUfW6RCTzLZ4+iiaifTQE8coZHtTEsBf8EnTX
         YUTbySG7cuXQAXQOY9BjHlkTSiNgkk1jtyc/2jCUJKBZGFrci9ubvIDgERd0FOQes8sj
         vEpoddrrMOaKvoKkmyKwsKA2E8LeV8xkB8i9I0EQuNdZ5JwcjEEnkQoOCkZsK3vjTK3J
         6gmA==
X-Gm-Message-State: AOJu0YykQP3W7DV92Xbxl6CaDcqA76OfehJJg0yRwxvRwKcH0OavBCAC
	Txop0bjUub6fmxeEG9MmgS9EqXj5+GN56vaKCc2iajjjkAQ9qp8thKA9DckKz46WcZ2R/r6XEyQ
	99WlgxO2wq9qy4Ok/kCRg+OIEmoIxqE6hmJCz0gs4A4SDWUSXiMmw/oKaSVgc2uD1atF3uXdquT
	ck
X-Gm-Gg: Acq92OHGPsIk/06paByPPfpaK7VgC3RgJRq9d3d7m+QwJ3t5Su3+5R7rdHtCkj1Nh3c
	/kn+lKAMUnMoVoLkjbQU38T/Mu+YognQSav0OAq8kKXZFzrsmO9meDb+OAcEkxn6u5y7lDD6Ih0
	Jshr31IgUB9Qct1V3Bc15Gf9RgvWjV2uzWl5GPb3XchVuNxQGgUtz5PLypWNAla/I5DzcKg8xNP
	nuOwYsekZJ2yyF3xwyFmdcqfyXpQqvdE1czCWT9XKwdO/o5042OiE8xPK0KWa7twaotLAuiGmVu
	qAqymIvJG6gY5J+SUm2WECfVm19/kFJc8LJVFuCm7uQelX3FQFkxqjChJf17ZZ3Sp/VQWvbOqCy
	pD/QmCUiZSPzKzDxqgqQvmn/zJlz1nBc1mWmZ1aDx/0Z2PQ==
X-Received: by 2002:a05:620a:6409:b0:8cd:9033:1724 with SMTP id af79cd13be357-9161bc20a3cmr601091985a.9.1781293466416;
        Fri, 12 Jun 2026 12:44:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6409:b0:8cd:9033:1724 with SMTP id af79cd13be357-9161bc20a3cmr601086485a.9.1781293465965;
        Fri, 12 Jun 2026 12:44:25 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420570sm138396466b.11.2026.06.12.12.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:44:25 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bod@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v1 3/4] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Fri, 12 Jun 2026 22:44:16 +0300
Message-Id: <20260612194417.1737009-4-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: zkHWHYllQHYj4EyXSLdMYfWHwPmP-TYa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfX3e4muSQ9eijZ
 HK51nXv392j83/RPTA3SQEtfeKOzkbxmdDf7J7X/KqIiaK7O5kWmokfbgzEolt6x7QYK0Ceq9z3
 jM16KIpOQGXfG/gO0KbryO+h1v15hBg=
X-Proofpoint-ORIG-GUID: zkHWHYllQHYj4EyXSLdMYfWHwPmP-TYa
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2c619b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=YfY1aoyU_xzM63z2oOkA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfXxA3AerVQy5fn
 u5eJNwRwaVXPezwo4x+d+qV2NGekmeaDDw3m47dgpTXwM+IigVRPS3/alGUR7CTaH4uUCG8SooF
 XfXT+LK4WfJ3GA2aRkFr0vGz1dx8UffVYgOI6tYc8lJmeC+ZC5tVWcZBxh78c9wAuwmHxknWw/Q
 VXJoaqwnoeLoWzLMS7+w+Gm8xwVKJCZFP4MbWvS0dNK8xDOLnCsJCu2gQw9729FMEiFjV61RFIT
 pP7RapkjJUmsnwmaJeczfqsxHK3/0433u2bN5B9mtrkGHT70V99+aAADbpHUNDMakb+vf2DffMh
 CLJ04K97I5skVvdYaHt471YKWC68u/1PDjDE2krSEoE06agyUJgN6VGovyn1iMuSHLXSyOKwF7k
 Kdpd1EWJw5ozVqFTxZZanPRvPON7+aEX4okMSi88wZQiHuVVj819UxS0xLln+4Qs3jPXUuYvAJ2
 /QpmsNvC32gT0gDZPeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-64735-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFEC767C246

Add the missing JPEG encoder hardware node in SM8250 DTS so the
new qcom-jpeg V4L2 encoder driver can bind and operate on this
platform.

The node wires the resources expected by the binding and driver,
including clocks, power domain, IOMMUs and interconnect paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 35 ++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..081f172018ae 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4469,6 +4469,41 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		qcom_jpeg_enc: jpeg-encoder@ac53000 {
+			compatible = "qcom,sm8250-jenc";
+
+			reg = <0 0xac53000 0 0x1000>;
+			reg-names = "jpeg";
+
+			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
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
+			iommus = <&apps_smmu 0x2040 0x400>,
+				 <&apps_smmu 0x2440 0x400>;
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
+			interconnect-names = "cam_ahb",
+					     "cam_hf_0_mnoc",
+					     "cam_sf_0_mnoc",
+					     "cam_sf_icp_mnoc";
+		};
+
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
 			status = "disabled";
-- 
2.34.1


