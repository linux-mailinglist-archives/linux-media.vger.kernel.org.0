Return-Path: <linux-media+bounces-61685-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BmXArERB2rgrQIAu9opvQ
	(envelope-from <linux-media+bounces-61685-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:29:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1121954F8E3
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A62A303FE82
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E2F47ECC6;
	Fri, 15 May 2026 11:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DsEsgw8W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WneUN54a"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD3547DF88
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845640; cv=none; b=fAJ2O+/WidPgjHxlRuQrEwvDiqTRKR09XExGIZtOgoiKhEUD00M7bQYJAraviTTdw72r5FFfjENguGmiNjXTdjQt/bnR1TUTa2Ph05+4qaQqtBLRnnV4q4JuH6Ojc3Vc9ZiCiAoF+81qUTlwre4tB3koBJK/GctEMpIAmh6U2tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845640; c=relaxed/simple;
	bh=pJg+R2xE3TJq1ua9vcLgtwOsiqpAX7eHWu4mdzJVQKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qxkSfuJTB62z8ebjoyfzYq2+S3omFFQ8gBoKLyktZo/cZ6f6pDWN72JFLbp/83fWo/8hWyWUOzeeTpHNDnWILpd++TN/lwyFicm9IipKbdrgtVqIvbGOumeSsfdKDouRAiYxODZOaLj4wMS3nitRmubSVy7DbYGIs1yV29XBuAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DsEsgw8W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WneUN54a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB5ciD3219705
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7nKgCnI8c2DSmKG5lrtRaSOZViyWlVhBD2IxthKxy7g=; b=DsEsgw8WEvoW5Gfc
	k9QlDtMLSH96Fjk4qu1OOzde0UrPMCqOLZ/Dcb8v8/jnGR98LLd6Ch/dIV8mEnhV
	wX8H0ZzMiJBSYTYSIF4tan17R1SMAhz0dNMNFIRb5as7WLpIXNyYaBcyn6uf0BCc
	AZy7lUyPKX+K4j++BVNlTa5iqPuBEtMT4gBMK/I/cyjtTPCGujc1bQ9mhv3cF4IB
	Yeq0yvwtaO1ucbKVFMWamVl13v4d2UzC5dxMCnOSvDOj5hJp1gi1A7cfWIh1gIMV
	RcEfll1/oRvCCCjyeK1Bk2/NL3UscGutkH0YiAyLvD66ZB4MaaV6vAs8eorLhsyS
	xdLpIw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s32ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 11:47:14 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95fb6cc0b7cso86438241.3
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 04:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845634; x=1779450434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7nKgCnI8c2DSmKG5lrtRaSOZViyWlVhBD2IxthKxy7g=;
        b=WneUN54a40QMjYq4yWDZ7jVZ3e1fhw2PHjzbTX9ebaI1pzLhN0fdxjx+wAfDew54Sd
         sX0wMOGGZJMzFX1xNRWrX6Shh6ys8UPrHdH8bnc7t57n34p9pmS711UGXtnHx5oKPbKr
         gmvsQzvBqPjVGQeoNuVaBGt1fZweFaCbIA8M+n0a5onb6yJGLa8mXWx4p9L4LdHyV9mi
         u0u2HnyG3whtRMTsvgyCqwSqAF91heiYrkCDJW1GWvhS8tLO04znvYSSOo93bzH+Hz9K
         cAIvEB38bEoRIyghYwVM3PNTY2dTiCF4rRM8vX45b26PDXnrfCXT1RJ7wD4KC1XVenrq
         akZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845634; x=1779450434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7nKgCnI8c2DSmKG5lrtRaSOZViyWlVhBD2IxthKxy7g=;
        b=Pge3QxJTFB7iueVYL3nOGiis2WRMsVaH+GDRit1gI8UPoNVKHQNMSS4zhKVoc8K898
         VpGc44knY+sYg1mK0euL4hiPFPR+W9I2QMiwIGWCTIIlu8cgvC+KGhj/4erse9oXAnEw
         cwy4vHnEMHFIT0vYfoVqjPEefg9+3nzh/k99LLVshCGacNDmWidtupwTqHm4FNC7MDCv
         mnsp5ZRJGv01voZBL/ZRb2hs2Wn6bq24a1ro5QjlTeeo9QQETKz+w+Nz728PgR/I8HyP
         X/MAP4udUXhH1UNQu4RTUtwpXnDKfvBE7/IdpB8EU3X/CbVXy8dr4YUddSUiGiv0cS8D
         voRw==
X-Gm-Message-State: AOJu0YwPeialMYFfcypt6g1TQEQlDLAh6vn7nrdI0/lQA0ML+ViiZukx
	1mHEr86mGRj1ov4ec80c79xKUzsQ/nQcH/Yhf6VUFsVG6juK3O7GWkKy6pkNiu6HewtNArpCQNP
	V3jgllPW0TKQr55jmYye9ZNPHSyL9wIgrR0eEZbA/hWkJyUbI+59KscUCYE4uSV+BZQ==
X-Gm-Gg: Acq92OFN1qL6HvoHdv83Fn1g3b+uJb7AABcZlINtgPGuMptiCS0jyL4pFtnj5AcEXn1
	XIeZWnjSbA1o4rSr7yHomkUUes+Erkv9/TPNYEG3rUlt2gyN1BUQwOeOfqbWMgWPuXtNHGg8kza
	WflgsUmh2hXCCxTJiCSJzQEbfoxwbOVDOFRfYlXDaNvUWytjPMRNFGeVBi2OV4uQGsK4y8zeISW
	3iPTS8oTzwFxQwNV1kmcEZa30neTfXQ6OmjrEojk22xA6QCfbgkB8uWBYf3NdcNPSR934Xgq8h1
	oBsqNwRwyosmnHKsokVF1UV9kmUFQGZIfQGLtT3wzfig0iMfOdSpdMRpVmuLF3HuxD74G1fBozH
	3RDoNDp7g3nedV+KiqRbBEP839FiQnpCD
X-Received: by 2002:a05:6102:3f12:b0:632:5628:6d70 with SMTP id ada2fe7eead31-63a3d219ce4mr1726749137.3.1778845634287;
        Fri, 15 May 2026 04:47:14 -0700 (PDT)
X-Received: by 2002:a05:6102:3f12:b0:632:5628:6d70 with SMTP id ada2fe7eead31-63a3d219ce4mr1726725137.3.1778845633766;
        Fri, 15 May 2026 04:47:13 -0700 (PDT)
Received: from [127.0.1.1] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c3150dsm216853366b.24.2026.05.15.04.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:47:13 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:47:01 +0300
Subject: [PATCH 3/3] arm64: qcom: dts: qcm6490: Add JPEG encoder DT
 properties
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-qcom-jpeg-v4l2-v1-3-f38c2e1b3555@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX33tl0Hw3DVU/
 UuOLpT8C94uyrwzNsmlalk4nR+07OQMMEIfMxIdo66qlc1JS6/VYvxxZn2+FkczpD4MGL5ugH12
 2ZJZ8M3v2icLL4OmgDp3Rp84Y//uoihYGk6jh+SOVfUIN5ZvYw9U5RSUZlJVDz+v2fHlbALIAuW
 RvFcOPkTGp2wL8OInujrXfiTqBwvHJQWXUzKRrtPySb/5yMuSORUiHKQ0wAFsvi2HAe4xrBHfqm
 T5/sw407GG1Fx9sf9P8sQGVp1E802j995ukvkK/JR5E/uy/HVhERwVOirlCRINh/xM3TLfZ4jBk
 Qwxco3bnsa8yC/sSEo1mntE7P0pCz0XykRusevTKmvp1AFd3xHxlGtFzDBEWDbR8sScMUuzX3+I
 Z8b/EmfFJh/sRws85tXXd/otjmqC2muTWLeMntS9MEI62XtSzobEC8OyKOmO7/fhEePqyeetyw4
 Tm3T6WRbn0jxavh5pXw==
X-Proofpoint-GUID: FzadOuSd-OL8yeGKuwmYkgAhWH2158Tx
X-Proofpoint-ORIG-GUID: FzadOuSd-OL8yeGKuwmYkgAhWH2158Tx
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a0707c2 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=X9MPzu39_fj-rEql-G0A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: 1121954F8E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-61685-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,ad00000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ac4e000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.4:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the required JPEG encoder definitions to the device tree.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 52 ++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..dbfc6cc051f3 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5198,6 +5198,58 @@ port@4 {
 			};
 		};
 
+		qcom_jpeg_enc: qcom,jpegenc@ac4e000 {
+				cell-index = <0>;
+				compatible = "qcom,qcm6490-jenc";
+
+				reg =
+						<0 0xac4e000 0 0x4000>,
+						<0 0xac40000 0 0x1000>;
+
+				reg-names =
+						"jpeg_regs",
+						"cpas_regs";
+
+				interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+				clocks =
+						<&gcc GCC_CAMERA_HF_AXI_CLK>,
+						<&gcc GCC_CAMERA_SF_AXI_CLK>,
+						<&camcc CAM_CC_CORE_AHB_CLK>,
+						<&camcc CAM_CC_CPAS_AHB_CLK>,
+						<&camcc CAM_CC_CAMNOC_AXI_CLK>,
+						<&camcc CAM_CC_JPEG_CLK>;
+
+				clock-names =
+						"gcc_hf_axi_clk",
+						"gcc_sf_axi_clk",
+						"core_ahb_clk",
+						"cpas_ahb_clk",
+						"camnoc_axi_clk",
+						"jpeg_clk";
+
+				iommus =
+						<&apps_smmu 0x20C0 0x20>,
+						<&apps_smmu 0x20E0 0x20>;
+
+				interconnects =
+						<&gem_noc MASTER_APPSS_PROC 0
+						&cnoc2 SLAVE_CAMERA_CFG 0>,
+						<&mmss_noc MASTER_CAMNOC_HF 0
+						&mc_virt SLAVE_EBI1 0>,
+						<&mmss_noc MASTER_CAMNOC_SF 0
+						&mc_virt SLAVE_EBI1 0>,
+						<&mmss_noc MASTER_CAMNOC_ICP 0
+						&mc_virt SLAVE_EBI1 0>;
+
+				interconnect-names =
+						"cam_ahb",
+						"cam_hf_0_mnoc",
+						"cam_sf_0_mnoc",
+						"cam_sf_icp_mnoc";
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sc7280-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;

-- 
2.34.1


