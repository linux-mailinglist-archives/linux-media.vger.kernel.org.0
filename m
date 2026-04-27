Return-Path: <linux-media+bounces-59681-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIBRO91c72njAgEAu9opvQ
	(envelope-from <linux-media+bounces-59681-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:55:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A039472ED4
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BB673003EC5
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46ED3CAE66;
	Mon, 27 Apr 2026 12:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ar8oH8ll";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQqkeyqt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFD73C1977
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294025; cv=none; b=G8xjhilOh1hbxv1YLmPHj2nZxqG0mjlTad4fzfhfzBTmQki6Ie3UqqHXR5gnsyeUXN1DlvfejSv5678/jLNl+RmBENpU4rf/uyItv/Bw1Wc06kyVQXl4xvpSnn6ZjgvTb9IA9qrwzkWY/BLf2j67P1YbIH1CxJ2FqKjgGw4gjAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294025; c=relaxed/simple;
	bh=keJ16zCRgQ+7YWtz1ydY/Dm8A91/0/g1XPoTpBY7qXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TSApDBVly38MXfScdZ+essm02rZJ53Z6XdODgDEXX2hbsz2C8DKhFbQxrNkFqA2XPcnhUf43iVACwQUMDxG+9MKRFBsAeTgtS2uhVssEtoOnL1eRraPmTYAbSEiSNp309JS+/reckTUiDiK+86g9dP7pOATB6m4eXIWrtDqIr0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ar8oH8ll; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQqkeyqt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TAZ22793074
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	npU9buGBkOswEXBY2Iw0wFN7bz1kBrMayAzI2eUT5/o=; b=ar8oH8llepQOZxd+
	UTZpfHbUkAWmyjaA22ALnke7mxRsIOez0vBkv4ytx7Pm5HnD9weTiQBtCGEwavQv
	3gB90EB61foqm5OwruI+oCn5fKivfKbwV/eBIfBDBeN/sCMB0AiQ2zX7qBpykMGY
	uJ96dToVNa9/IrP+986kQja56/lEWU+5fhAx+CCiWCvHY3uvuivDVjan83DNRuiU
	eP2P6hkrt45LGz7vQGboiofcIPOzXborTKPSuEjCCvQpAEgKsqYkpysyo7UHuf5W
	dmxVvrFKsWGqO3AFTiLIv4z07bTNJT8OGyUGljdD1WCOM51uHzPbnnu9EFK5TVbf
	jev2vw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4uv6y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:47:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fba8d8c40so105589521cf.3
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 05:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294021; x=1777898821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=npU9buGBkOswEXBY2Iw0wFN7bz1kBrMayAzI2eUT5/o=;
        b=GQqkeyqtFeC8NuDhyYoEhBhjyUFa1ANEEQNUnO9aj8MNxkLHpQxkPzngr/4h0kJoex
         3SLvNZ5EJza3mJzvepOcoZ3ubWf9ichIq6miPoQYrtnI79rf/4/LSTP5ViHsO41gzkBA
         2vraUZF31iuYp4coo/CNotQRcsmFkBMngmUuGUI7vlocHGpSjEQLHUqRjtse/0nDTkLW
         c5HYxxuJ4a97yKo7nEvcW3pPXlOcDylGQJruWjVmI+kTqW6kta0ozVxNMfufyD3OXGse
         pbRoP+fTsDpA8htUFrlPiC+8pRBR9y8LWOC2DfYvBLg1UI1U3tiBFTlswmR9P+Glgvv+
         7EGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294021; x=1777898821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=npU9buGBkOswEXBY2Iw0wFN7bz1kBrMayAzI2eUT5/o=;
        b=dtPw+kprp5E+8WFbWG58stqWk8VLXi5ajdbdV71MCMpDG2AT/Z3qwta/Hp4XU3jMOU
         dKHlnGphyOkZHLH6EUTXQpFa2kvQW7n8WFpSxg7jHj+8H0TrgGUiBDwHCVo2/b+0NeCL
         Lz30eA8EtSe1FUs5ks3TkVCC8S5dePt+n8c3uivE35bSgSYg8diHUpghUEfPY3kzp7iM
         Fv6uZitS+vXgvwOXcgE1emKanLLcvOZAYaoshkfniTwKIv+By4X9vPKqcfyyBnFkkxrc
         ZZgXkwSS8cuMlmWp1EaSxirDYww32lye2+l//siIEQ1hVAD/55evJhBrQxdkYC6r+vYG
         FcJA==
X-Gm-Message-State: AOJu0Yxal8TprOW8uHT9Roi6Bl+0/bFGJ0qF/tLF4JRVs3g5EOsjUb4p
	fvAQNIrOFtTfKdn1YOwteDk72bKx578e2lDwvskeqffkDztzs/iNGH7HrU+zg+5Zgk7s7ALj5ki
	ZbkNWA36de9mGAGKVtlOLLLB21NF62RiMKGxShOs/XluJqe3WKzQTUvwi4fYloxeoLg==
X-Gm-Gg: AeBDietEvoaG/7JcRf0GgIyQnUdIJA/W6ZXEyq6msxiVQNw7rZS9sHZ1efFwaPW8tQy
	+o9f2HfP1juLqyhNVoJuGQLYE8XOje2BIzOeYfRrcPJBUHkVs/zQlFo5KhchWjkwjweJUkL8oa0
	hpNFgsjpNIK/OxQ3bPViKgYYEeAUQBX/UymiCOAjyUj7Hcp0gpA6jYqX69/ziFgZ1Io0RZGQtKA
	EXOoICUg/wzEOikKGfJBCzA1PpfRLcUje7zgBy8DKt0uFH3wERrF0qs6m/uKxh3n4weOdViLA5g
	vfz9nPC2eiEGESvQwuD25qhMYugd4Jl4JRCDmpvIXjzWomcx0Q4NgaEscmUmvSmqL7FXhVV9o2g
	HgT4iDGk1Rx5VTEd77TPvSbrwy4+8/0v908L8+9M/BY+Ra+u/W5+ongPWTchT2Ns8Ds9MQDEwh+
	sWXUEW8MDcWkjXXUMYrD6ejkFQfNw=
X-Received: by 2002:ac8:5890:0:b0:50d:6ee0:3822 with SMTP id d75a77b69052e-50e36b3c598mr624428701cf.4.1777294020693;
        Mon, 27 Apr 2026 05:47:00 -0700 (PDT)
X-Received: by 2002:ac8:5890:0:b0:50d:6ee0:3822 with SMTP id d75a77b69052e-50e36b3c598mr624428121cf.4.1777294020214;
        Mon, 27 Apr 2026 05:47:00 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:59 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:41 +0200
Subject: [PATCH v2 14/14] arm64: dts: qcom: agatti: Add OPE node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-14-f430e7485009@oss.qualcomm.com>
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
X-Proofpoint-GUID: pnfVJ4Xjs8TQ3rABVcfJOxEcohfCx9QP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX0KuZ/qaB7Msu
 J2soRLw03wLT85O6mFrAh/ZRSA6XxkiCyHQBvz5yZNzfmm8ODPPjGX5g44HIOXo+dwddgYj/Cr8
 VqknaVmLdba496qLxjKkRBXHMOrflKUZcgfDe/lf7DQOzMPG42XfpRpZD1DL+fzips7+EN2qO76
 oIPYq14NcBIII4iLWQ5TJIxoTIjt9Og9qF5hklu9U/s82gdJyqRtJALA22aEUl36XTDHFlIHijI
 nNSsOVgIl3T+pTIYb7x/cXVwZI79Y4w6o++HULieoI2ls/op2wXGDemEvDUshBFD/2rn0MFxx0O
 MLD4fc/6i9nLO6zyP3KtlB80iRNAOBGCHUpKfdWW01Fx6hZAT4qqG1E9y5GwPzyQCm6rWGEqQe1
 eeD2N7n0mw3GsLs+FY/0aK6r6aOFMFQFLuJNt1yz5cJ7nZBpinhImwfmXUCPHKFPr/acPj+6zps
 kDzASnaiLKz/tVfF5yQ==
X-Proofpoint-ORIG-GUID: pnfVJ4Xjs8TQ3rABVcfJOxEcohfCx9QP
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ef5ac5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=L3Ch9UzycIYwzZWD:21 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135
X-Rspamd-Queue-Id: 9A039472ED4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-59681-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,5e00000:email,5c42400:email,0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the five register
regions (top, bus_read, bus_write, pipeline, qos), clocks, interrupt,
interconnects, IOMMU mappings, and OPP table.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 71 ++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f9b46cf1c6462a89784429565e1636ce2ba68d73..ee0fe1832248eed8405968bf05d4c73dd6e8d13d 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1919,6 +1919,10 @@ &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
 
 			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
 			status = "disabled";
 
 			ports {
@@ -1933,6 +1937,73 @@ port@1 {
 					reg = <1>;
 				};
 			};
+
+			camss_ope: isp@5c42400 {
+				compatible = "qcom,qcm2290-camss-ope";
+
+				reg = <0x0 0x5c42400 0x0 0x200>,
+				      <0x0 0x5c42600 0x0 0x200>,
+				      <0x0 0x5c42800 0x0 0x4400>,
+				      <0x0 0x5c46c00 0x0 0x190>,
+				      <0x0 0x5c46d90 0x0 0xa00>;
+				reg-names = "top",
+					    "qos",
+					    "pipeline",
+					    "bus_read",
+					    "bus_write";
+
+				clocks = <&gcc GCC_CAMSS_OPE_CLK>,
+					 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+					 <&gcc GCC_CAMSS_NRT_AXI_CLK>;
+				clock-names = "core",
+					      "iface",
+					      "data";
+
+				interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+				interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+						&config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+						<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+						&bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+				interconnect-names = "config",
+						     "data";
+
+				iommus = <&apps_smmu 0x820 0x0>,
+					 <&apps_smmu 0x840 0x0>;
+
+				operating-points-v2 = <&ope_opp_table>;
+				power-domains = <&rpmpd QCM2290_VDDCX>;
+
+				ope_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-19200000 {
+						opp-hz = /bits/ 64 <19200000>;
+						required-opps = <&rpmpd_opp_min_svs>;
+					};
+
+					opp-200000000 {
+						opp-hz = /bits/ 64 <200000000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+
+					opp-266600000 {
+						opp-hz = /bits/ 64 <266600000>;
+						required-opps = <&rpmpd_opp_svs_plus>;
+					};
+
+					opp-465000000 {
+						opp-hz = /bits/ 64 <465000000>;
+						required-opps = <&rpmpd_opp_nom>;
+					};
+
+					opp-580000000 {
+						opp-hz = /bits/ 64 <580000000>;
+						required-opps = <&rpmpd_opp_turbo>;
+						turbo-mode;
+					};
+				};
+			};
 		};
 
 		mdss: display-subsystem@5e00000 {

-- 
2.34.1


