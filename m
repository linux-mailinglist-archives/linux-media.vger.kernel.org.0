Return-Path: <linux-media+bounces-54596-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G4/BGRSqWkj4wAAu9opvQ
	(envelope-from <linux-media+bounces-54596-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 10:52:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DB820EFE8
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 10:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 022E130B7764
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 09:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC78377547;
	Thu,  5 Mar 2026 09:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dmOAzAJ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xh9Dj0mM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1D437AA84
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 09:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704140; cv=none; b=EXbncjUnECxRMyT06/UMIU19JzvN7tcvEOUY7KgkGlFYA4z6HwddjKq/3MqU96XCyo97+jgXJxy2U6gXhuniIIeRXBaMiqaylqPE43YUZnkmkY5ZOgd9Prnx+xRv7X5Uw865TGc6NZIBK5KG84ZcNLxQnCtbzrWqYspJHO4/lRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704140; c=relaxed/simple;
	bh=UHkKZRKX+Z5mrmHc9PqOylVQatIA9vArdG8H4u12kKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ftfHrD0l8z2HOlxQVpZKReYTUGPxS3dIvMP8iqyvhLEoGxG6f3snqQdARSkCkUiD/SG7kxZ3kFSfbRwQDEEtrWd4G86hnKTkAk8DosOgFxLfEJxxyAbryOjB6tuHbEf75IxsvpkUyRHmZAGGwHod5wBd7mTAP7YmisyEzsllOkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dmOAzAJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xh9Dj0mM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62595glr3482642
	for <linux-media@vger.kernel.org>; Thu, 5 Mar 2026 09:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aiE01OmyyEcs6zk7EOhDkZHfhm9tePHQG31k/jipSjo=; b=dmOAzAJ9ZrOjruOE
	sdLdWneq+TWsBayn78t5h4CmBYcmL66WFcTik6lfAhPJ5NJmASDZPDuUeB+U1nV9
	CuSPKA59VK1betskPcR/5Upm/GTJQM6hUEg4ZLH/U7q7WdKPmPr8dC8d4jqaqjcZ
	RbUbjrQ4Na9fvGpFnh+xSxV0zOZJHmgq6uXutykT3oEleTE/wu7agrxA7W/cbA+Q
	25OFLCIB8LQzuBcNhst50BzImrHflSazqK5AZeBohG3FA5c8WXTZYm32RuaDV1ad
	5cK/w0RfnaxIjP8sp2HA4cI3bYfU1dLOnYHqPmiezNBt0iNA5uoXmO9wZkKKbyDp
	4OtYOw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wjrcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 09:48:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50336ebabe0so849310301cf.1
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 01:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704130; x=1773308930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aiE01OmyyEcs6zk7EOhDkZHfhm9tePHQG31k/jipSjo=;
        b=Xh9Dj0mM0NCo6uP++oIzvwLj3dvl85B3q0T5R1Z59gcQW/o8+VjgNzxh5+itKXDzbf
         X1VseQukLax1sNuEhG7nBDmUln6Bbt6WbiWdsaHrKR+wtDgyOaCT35gcSXjUiW/+lh23
         1QEajaNMyspIAFsC9yzgKYSukMEDkLXx2NOvBNd326mEdacWXb4ZKUHifAMoMd7vcGW7
         LBI6ASOeKIKx6uiBkDeWvlyS7ldb4jaavecB6yaqHO3w6kL+CoVJ0yr8v2Dg258IrQDn
         pf7SK6DVCs2Gkn4Sk3X9XmP4ODroy56ACHveft+QFKgyMl1MDSFoW0mXZQsoCEKMUsoc
         opdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704130; x=1773308930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aiE01OmyyEcs6zk7EOhDkZHfhm9tePHQG31k/jipSjo=;
        b=Fu1oTMuEDbyi3RAkpTK+naDJzVSqAHxnR5J8QWet/xlolKcRvvcmqABNhI+B7+2jGH
         TYtDFDmlwYHwH08dpohkoPZETF8Dlv2IWlCdrSKpUkD/f30bx2sPFCOmEj8ScxNL58Cg
         v21NPxLp6iXWkY/pd3Q1as9kMFDS412XgczMJ1HM723bXC16XlE4z8IFMf0/pbdbtrWz
         z9IaGpSm43qcUooIK/URYWR3GkRf4Xv1s/fI9bGzYYRy96lCLLfSyah9HOwDgUHReKsk
         wkV4CMyYWwNowBkHCq3pp2+WoMZqfzKHdhEbZs8UcOYMruNqzUZQyLii1zOTEkwDS39X
         Sz/g==
X-Forwarded-Encrypted: i=1; AJvYcCUz+3XaObxoexfryzGR3VNI9DAZzM05GjDierGpPCLno5ViYqoENpxMFWDHxhigfe6L18kj/pNJ1k5lWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRed30K8WiPmMebudfniO/OFPFJsY1PpI3PpHcz8TzsuSaKN/Y
	HZ8zHKFI2LxhN1KHxB8LnFE+5slYu/DqjXbwnYxdgdu4QjUVE6C8IFOp9Sk8M0hefrcEHb5Kbku
	vBAI3AcNvfzei3YWH2Uq4+QbMLzdFYQ3ImvypIa+RatOWGDDxYWCOFG7e8WfpZpFUTA==
X-Gm-Gg: ATEYQzwWVF728BEhpJc14ChY+nM7MQzKZ4nVTKplDQal/8lz6nEJfLcJuQnvFPxQID6
	g//Wk2cUUy9j0DC3TWAorxq2K0QzaRWi995emuRhApcgjL3pZKwAvc2fyxt+GN6zYmglsyYUBAW
	Kdot7DPg94Q3gzTLB5NTGsqG4zov66UyAwh4Foqwnp3GZY7zzZviFc8/KuIwaMcMC8i6YTSJ14U
	SEJtXh2D4NtlmtSrUzcHfqIjUwxkAJWU2kOZHhpFPr8N2fX0MjCpE9CcFPmW6ei+aCgT8oMD5S5
	2UEyg+YIhNV10Z9w1lK7PnvFEPMjG+nisiF6J6dzt2LUveWEgV76IN78mDe9GMwlQuTqaB+12EX
	Unu6ZFT2OI1jzQhHswhhf9LoM2DcEBnNIKU5toXaGUORqb6EaINz60RlDnJg1brKmayuN8pI33D
	9OPtnjxV9Uo4RP
X-Received: by 2002:a05:622a:164a:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-508e6946118mr19329601cf.21.1772704130399;
        Thu, 05 Mar 2026 01:48:50 -0800 (PST)
X-Received: by 2002:a05:622a:164a:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-508e6946118mr19329321cf.21.1772704129986;
        Thu, 05 Mar 2026 01:48:49 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm177126211cf.2.2026.03.05.01.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:48:49 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 17:48:14 +0800
Subject: [PATCH v6 3/5] arm64: dts: qcom: talos: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-sm6150_evk-v6-3-38ce4360d5e0@oss.qualcomm.com>
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
In-Reply-To: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772704098; l=2250;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=UHkKZRKX+Z5mrmHc9PqOylVQatIA9vArdG8H4u12kKg=;
 b=JXkhUvtpWwcXpsiIO4GJCvO2jqVyJnJtvoaiDr78rNtQppEPMG0cyzhxpNpFzgjtrNVT6NBAN
 vP4TBSQjCTJBSEg3SgjuQHxLSvbTDJZF12Hfbd48KYEHcVEgdryAtuf
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: NvuPniq5x85EoNHwsGvEObAAnq03oLVz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OCBTYWx0ZWRfXwr2yN+zROpw2
 hxfCz4Z9/C0odOqu6b9Tffg87KSL66NfwGQlTnpPRKEx3CpIgHucEvcDdvLtfmJiVFYduxj/v20
 +LNpmyqKjf+EZga67Fx4r8b/4hqIy2A1F6hnLPb9VgoDQaKDJLecFAlBwJP3k40XBPNFQVugGDt
 nomyPvGc+Ueh8tXSyw9u7Y5VMplG1v0iTU0w42Va60ZRQd6B5QhT21XrsuQbfInvurNyZN3k0Mk
 nHXcVmCycARa8z4nr0IgLWmsYENlMdwisF2lI+KJv1ianbayX5XwnHUqDIkdtjcN2EF3orKzxqr
 +JwBaNT6uFoB4fjzVwRqZTf2J2Yo6OB7wQCOxbpNAjUzHhpnPfQD64kOEHDvpqhe58hFzaLVMPm
 VgI02d1tyLC7umYBIeSl8MyzLVzZk+Uqg5FsK3dlLiINW+4FlKWeY/NCEDJmT7GixudRIUZdSt6
 qoX9IMloxAgfeWD3GTQ==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a95185 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=szutk0iRDVHniUSXDBIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: NvuPniq5x85EoNHwsGvEObAAnq03oLVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050078
X-Rspamd-Queue-Id: 82DB820EFE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54596-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de,nxp.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,acb3000:email,0.0.0.1:email,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.47.77.96:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Qualcomm Talos SoC contains single controller,
containing 2 I2C hosts.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 51 +++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 054255a65c7fbb51e6c411d10252270bd7ef1522..ace2b2a0bf2b7e574b0d43f98ae4624df03b477c 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,22 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio32", "gpio33";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio34", "gpio35";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3789,6 +3805,41 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci: cci@ac4a000 {
+			compatible = "qcom,sm6150-cci", "qcom,msm8996-cci";
+
+			reg = <0x0 0x0ac4a000 0x0 0x4000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sm6150-camss";
 

-- 
2.34.1


