Return-Path: <linux-media+bounces-60921-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMqcB2nM/Wk9jQAAu9opvQ
	(envelope-from <linux-media+bounces-60921-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 13:43:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B10D4F5E71
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 13:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D4FE30753BB
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 11:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EDC33DB647;
	Fri,  8 May 2026 11:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xebmvqyr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BG95JYsQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AA838424F
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 11:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240484; cv=none; b=IHv209DLe98a4Tz6Bv3hjcNWM6iEVkk5hJJESp4FvlhfHbzuQGxrT5n3jDUsiFhP6gNYLdIK+toTjTgLJG139QI6kEeP0Nh0ympIIxdzxYDPbiGODz824U0hllldq7kWojoXJ88C9o08Zl/XMH3+zwLLXTwwzIj89j4fZrgF+f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240484; c=relaxed/simple;
	bh=LrVQzvK3aaFPI2VJ/t92Tum+Ag4s5MXEloeYF6b9XwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cMj79sJquOgJ5bjvjTzmc6uEQRnl68oQ2T1ELcgSn6RUYx3qAe+xv17gZ9qMtNdvAXvggalDv1HzX+fCMsJLk2KKz9uVG0TSRKGr1smmhwunYNOztKk84YnSBdFwfwi2GCn0/u1Ffo1tU7uL8fqOF2HilMVXsi2rgxI3LZnkbT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xebmvqyr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BG95JYsQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648ASeZm2183134
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 11:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3lUfbSzHokBAbhf+FTi5ZKM0wliKzbivz6yle+r6Q8Y=; b=Xebmvqyra6sMtzTX
	swcqjpfSqrvDMUqUE+Q3d8+0LuBvOi3FSH9SpZ+rMsHP72xE+bDtQZ2qF2GCTD9t
	iYbXpzdA2RIOyS+ykSFhon/g10NsJ1hRNzEoLjuQ1SYyc0jT9Bl3eslORXxAyQKU
	sBHy2A3g4s8Cg6Uc41/K6RXpFvmu5XLeU+n9gRQqxzAFBDc/G6QdEpC0b59ZSb/w
	FOY0IbpkvSfz33D4jFnPkx77ABTrPhDsaVVGKJ2hov6CttpuipyiGQ4u1CqHbkgX
	wm1RFdWKjZRAYtlTxk4Ve42+b8HJqoCx4+7PeVWJjHaA2vSjB7I2yFSiM/o9/C3x
	yD8y3Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10pyb6fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 11:41:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8f9e55c40a5so214464485a.3
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 04:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240481; x=1778845281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lUfbSzHokBAbhf+FTi5ZKM0wliKzbivz6yle+r6Q8Y=;
        b=BG95JYsQxLnFN0DumMA0XJ3WVKy+tX368sWvfwp9qtLMCg/K/Zl/dnjBmV/Y7NlLC8
         RIqFhXdauOTT+FtCmGuSuKcZkObhqZiwm6PphsukcUTf283ULqjB+BqwYbHKtiNNhG/O
         oEdFrCAVJZSoWKBY3WS5ofKM3gf1JPrZsUr4TmuVhi0TXom9kCDcl7g9F1eoFYPlvc7g
         8vl82c1GUiIPNN6HljRsia3gdMqSOXOATCkiS5p3hMxH6IpQwaMqgmD6DBxr4cm88RzS
         fVXqDVH4bnoZp2RzLDgDbxTgrnMH2CCKmeAw2mnx9mxrxC0tNQ9khvELH1d9aSkAhVHY
         /tRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240481; x=1778845281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3lUfbSzHokBAbhf+FTi5ZKM0wliKzbivz6yle+r6Q8Y=;
        b=UgqYlp/DUzicb5rG9/uXPddswxnldIQ1NzJsZjJ80Fa1H12ZcoFNhL+jQuuK7xh5j6
         Lych8tFRgnHhVve6xvVrsXmV8QtXBcbL5CkLsTnNY5fwrBRbJsBiat0+11+uvuVnltTi
         7G27wu0rj6hb4udpOH3rhu9W1B0tCtrDv/QTdCNgXozbJ3njL4dORXsQx7/GtrOUBMaB
         6z87BF4OGBf0eg+Re16nkV2BiQpA3R9FO9os73gLzrOcb/4uxNgnPcflkBjs1E8ViaXw
         7z4loos7v+RjHkL5qFR+ia/dTKjedJEvq0vdcMHUi/HzMM/NYzgOzBvJoKjRFe4CRuk5
         fw7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/2y6z/rLXI3Wv6YSlrPqXgFIDIf4Y2ty7JgQ5GePbq08dIEDuPVqMxsrW5cJZf++t8DxiuX6xyaThzqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxilRhfAfXvw1D6mJUiteAJlDjkaPMYfLq8VPbt325wCbutEJAL
	BMVQk9FsrQ5YxGY/eaa9EE404s9+/mD9DncVbUMZvTMf97GS6C2JkKAQhIe1fsltUscN2VSn25o
	uRkQatHLULH+ROEqa11bkf4WKXm9ptv09Uko0BcGBGbSbUiqTJh+z6v5OAoYgTLk2QA==
X-Gm-Gg: AeBDiesxfZhvNaDGhPD51f69HmUHaB8cLSD7h8c1iafvT0yYnsE/ersaobqRppWozCq
	CfXUPpPU9Dc1eG0fQ/gHmFE3tg3JBoXpdkvibG+u5i7g6MRjKtKsZW93lFMr3fL8L9ltR84NoAK
	xQ1ouL2/SCnyf40v/2m/kfWNRR/pUWPIrFIao2N91YDsJqiNK1pjdTI2M65+3K3jK797VvfyQPq
	Jn8gyYW0KqjQJHIyVKj2TcMZsiV6cmLnjC+bHTTZXYAlsrtHeZx2lH33cOqzekMnxQKxMPgVPGK
	nPHmccbuDyIvNb6OntfLGS1aH/QedV39d/d/2ZQbhsEWdve3SziM/2ZyWLSRVLVdPHhXX0of1uc
	0vLxXxoCliABt8kxv6scErY4a2NpqeOJf3V7xg/pHPpu1SYXW27dV034WmkPTYnrDRlnlAl8hLJ
	biGxy1ndiDrO28
X-Received: by 2002:a05:620a:370d:b0:8d0:27b8:fb7 with SMTP id af79cd13be357-904d68e0a4dmr1850237385a.46.1778240481437;
        Fri, 08 May 2026 04:41:21 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:8d0:27b8:fb7 with SMTP id af79cd13be357-904d68e0a4dmr1850230785a.46.1778240480777;
        Fri, 08 May 2026 04:41:20 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:20 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:39:59 +0800
Subject: [PATCH v2 3/7] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-3-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=5190;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=/I0mDof07x8EifLd7501yc6I3MTWZ4BBdf4ShwpUlpM=;
 b=CqwPvq9TmB48DqZyALYSV4F40gjNSmgNzB4Q9Ok04YbO8qTyGp4xqlb3vxMKLnirJRHw4MFZd
 pdss89cjjQyC/IzDy04KqUE0vjKKMazgFQA/K+rIFFMJQRDoChTfW6K
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fdcbe2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EFDngOt3UxJXKfoqbMMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: SWeEGOdfwn3nNbOd9cfpJ0UkO-UGOKCP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX53lpeLyDB43V
 m53IOzNm6pneM9RB6Tce5LPR0aPoXuyf3YSbKM3d2/tI3KzNdJHhIcVgj3QclDVl6w+SiZb8Zw+
 boiZyKYcDIhfTAxVLraWzFJ4gA7h2j7ax9so5k68NVM1Iu7D/FaNjxjwzCsNAmDGkBB1X+Xz4fe
 idaL+bWpuO2QdETq0aznTD3D5/3NOK7FbOLiL+EZQPWAALj7lvNKUrhbBAO9k21KU7KpAPd0xv3
 J9qzV9sQnYJ8csEoPNZxFNYhzPqasJCJuBpM8rTtr9MDrkCtEMwijeKv3wqUhCGFKOU43iFF9QL
 3y4ffnmUlP7wK3Y5g6C0NqNdBJmwUOkdoHPfXLDS23A0fEfin5RA6jkdqKCZoPpjR1uhXg7dzoT
 r6DWIgoeK0iaRzz0J1lNR+DZnDh/ZiAXvRaqvTJD4aovOZUp36rVrPWBlwX9YTusqZ+Q35PO7G0
 X84VNrxigrmoYpnStHQ==
X-Proofpoint-ORIG-GUID: SWeEGOdfwn3nNbOd9cfpJ0UkO-UGOKCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121
X-Rspamd-Queue-Id: 7B10D4F5E71
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60921-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ac16000:email,0.0.0.1:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,f100000:email,ade0000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aaf0000:email];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Add in two CCI buses.

One bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio101
cci_i2c_scl0 = gpio102

cci_i2c_sda1 = gpio103
cci_i2c_scl1 = gpio104

The second bus has two CCI bus master pinouts:
cci_i2c_sda2 = gpio105
cci_i2c_scl2 = gpio106

aon_cci_i2c_sda3 = gpio235
aon_cci_i2c_scl3 = gpio236

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 150 ++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index c31462ba393fd77b7124db2ce680663945e7fee5..74d6e4300506645a63e09490883eabf749829e58 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5551,6 +5551,84 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac15000 0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac16000 0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0x0 0x0ade0000 0x0 0x20000>;
@@ -6201,6 +6279,78 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				cci0_i2c0_default: cci0-i2c0-default-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default-state {
+				cci1_i2c0_default: cci1-i2c0-default-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			edp0_hpd_default: edp0-hpd-default-state {
 				pins = "gpio119";
 				function = "edp0_hot";

-- 
2.34.1


