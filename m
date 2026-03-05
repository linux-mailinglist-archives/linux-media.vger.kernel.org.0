Return-Path: <linux-media+bounces-54597-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFcJLXpSqWkj4wAAu9opvQ
	(envelope-from <linux-media+bounces-54597-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 10:52:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C92720F045
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 10:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB7E330BD487
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 09:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F16288D2;
	Thu,  5 Mar 2026 09:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0eanmbe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DRkYF8pU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29809372EF3
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 09:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704144; cv=none; b=Rh7b77cvIsudkFJwGmvc5+GxYY04RxENZlejXU369A7MOPyjvOTT4xMmR5YKRjTKIOMaOuvKdZUAdSpWnbjB7LhUIuXQ4SQANdpnlakLDftbutT9emP1mkqMCII+y3Lpt4LfxZ2isYMsUyyXNfWzg6iJu6Q5ohYFk+5FFd5GZMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704144; c=relaxed/simple;
	bh=PxCok/m06RL8EtXvhxkBdkhQnDrY29ujrliEFTX0zGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fXqfRohXcOEZKBC+3brdOudy3ifoZDZsvd3GPk2WQJ7q9TCI6nhOrAxePfP7/Ir+7I4hta+Iw01/f6DbG0KsomKz6Fe9CBOF9DVMlBCvEcM3NEVG8PQL5h79Q96Tc+duzpLhH2chfCPvTqLdTkyDLxEf65qm+1QDUwXv3FS2KBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0eanmbe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DRkYF8pU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6253A9rW865377
	for <linux-media@vger.kernel.org>; Thu, 5 Mar 2026 09:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UTco5l+cTyAHR+yMd81P+5uIodWOmaB8yH0KycCwb6Y=; b=m0eanmbe0KpQ4EZG
	fwJYyZ/9ahL9lpyukyALogpv9cxSWSnZeI46S33ZVe4AVK8y2C1BH+uW8WAjj51e
	wT92BFgBGN+/uIHznYeinmRIjsiyXz0wAeHa0DubAIIEQxHOABkmvXPce8xeNjyM
	6AR1gEQzM15hAJwrCcq3KU83KNRg3jWTigIdr/QVnxcjxD+IA83DSU9OYuvVf8zB
	PTBe0+x9CXtha7Xmit5ktXklz94yEMA5WUH85/oB8mBKtl82+woEiJZdyqIWmucm
	DuhMQvbH0wTiebtcRz8pTsHL7y2RymWb9eHAw7H8qD9b5OUxTsiAyhhdMdilG5Xx
	xDkiQg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk17v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 09:49:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5069ba5af5bso461816181cf.2
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 01:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704139; x=1773308939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTco5l+cTyAHR+yMd81P+5uIodWOmaB8yH0KycCwb6Y=;
        b=DRkYF8pU6mxou1H3y2p8M7W3LWOY+5m0B6JWMJPGJrLjRxGM0UNreaWvGJ38wnviCf
         saD/6B3eAXpEGq3wKHkNTa7D6/Rk6bl/LQh0jPqdaS6DOlHNecRZCDsIc4sDNos0f9hk
         Zt73SHZGM/xsD+FGRgD1mczHs+vCqwrISvh822dan70x40WETNHkomYU6wsJg7Azgrnk
         A5mev1Ft4W9MbuQpqv3jgioPCbW2W55cICsNjZEew29cQ28SRCOavIfZtBFtv0DRKwV1
         YgoIR5UAQmr9YIz+cSEY84oMbOB/rYrf7JLj37xOMh/+/h8eO20dCT44rAoiO3asbERw
         tncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704139; x=1773308939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UTco5l+cTyAHR+yMd81P+5uIodWOmaB8yH0KycCwb6Y=;
        b=Y1jqUJpedEwXM67GRvl6HlwBEzoOxQ7bSXhVdHDyaBPjemoUMxHzinh9Xbwi71pmUs
         k9cD8i7jRQSmtC8FwQ2Y/B9shDcW86Q6kh1BGGfQlm+ntxmtFh5woEQLL4e4yacEHg12
         x19x/4xq3a37qgK3MLuzLkg1Vv7UHuiJneiysyjVUYLqpKpwP7F7hVSV8U907ynG0mbT
         0AEBxqOCd7+jjb87FNGh03uq/sQmKq/mJDr0lo7qPzbkgjJ4qtsBRjX4+kqU8V3toZZx
         SiOx9dad0HuoCpWfanffYX1RHP5U05UAUJurmLIeYqAwVAzSRXhz5twAYzTmNFfLbMoq
         Ar3w==
X-Forwarded-Encrypted: i=1; AJvYcCVly1XWOS98ctwigZWcJf1DQUjqE7olEWx3/7RXEwJcwPtuzOx6lMO5cZupB9vfgfJEPlKxVBqgbCbbbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSMcCvXo2B29WlL2kSpqzcPbLNlTt9gerRyzAiHwN0PgkhtzAE
	UL18p081ahjgVoKbBohWpgMOUnyE71dEWnz8vV687KStxXezV/4uVGRxCkEDHmAa9gChh8ar2JX
	zEPJTJEoDA9Eu87Q2xeXFjVCwunRk2ylOR1DnpXHgrLemRWEsTtRUDtc+5Hla4THdRA==
X-Gm-Gg: ATEYQzyPd7iOYiMQQ3fXYtQypt2Y6f8pEQHEFDazFfjhjb/mD58Iai3xOAGkIQHzx/J
	7DjnQ8buTnpkykNSR0nW9pZWd5bjzrjVfa5Z+P1Wd6JhS09iC4YBtmgooBMS6O8SnCxf3VMNy4c
	C3j04l5L+3wwDiG6BUliXmHbQ/B/ubSXZW3Fpl03ypPy/VgeTj/MVFtthgoMcALzjvGvd8VTafO
	/sEkC1Gjkxp1btqwOZGaJJvqhVTJmO/jAgVcIRP1inn1p7/sV4ngFfMlmqrhpeUHCx4ziED4uJX
	Lx/WVeswcQbgDWnprxY5IA8rKfIQ+xDzF/XVrEbaVeCkqMSr8kk1Qcl8iukUFbukTZ0i2yuJQ8l
	+SoZKTxqoic5qEnmCZaE7mJ3OxMGEGKsYwYRSpP0+EpLUMIv+fzHM56h4B+fgN1eB1dafKL6y2X
	trTtGVDuXr02Wj
X-Received: by 2002:a05:622a:190c:b0:503:2f21:6355 with SMTP id d75a77b69052e-508db32cef3mr62095061cf.34.1772704138545;
        Thu, 05 Mar 2026 01:48:58 -0800 (PST)
X-Received: by 2002:a05:622a:190c:b0:503:2f21:6355 with SMTP id d75a77b69052e-508db32cef3mr62094771cf.34.1772704138150;
        Thu, 05 Mar 2026 01:48:58 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm177126211cf.2.2026.03.05.01.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:48:57 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 17:48:15 +0800
Subject: [PATCH v6 4/5] arm64: dts: qcom: talos: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-sm6150_evk-v6-4-38ce4360d5e0@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772704098; l=1578;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=PxCok/m06RL8EtXvhxkBdkhQnDrY29ujrliEFTX0zGs=;
 b=QCvqamsbtXSXBcZDLP6JGVj8UEFEM6iTAPbY3uUtSzvfKRzoSV6fuCQYY0vBFV5l2El9SHEjF
 TWyDUqc5QqZANTVRm5sUT2Yqc9F9T6A+NHbsPYIv5LDxHIpYi7GFVTx
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: irgUh4d48naBfos96MoOZ56r12gQltFG
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a9518e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: irgUh4d48naBfos96MoOZ56r12gQltFG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OCBTYWx0ZWRfXx2c2+333R6Qk
 YsCF4j0ULn3jmQzN5husz1Bc/rCRUtP+2N6+2tQaNRkmP54TTIH7evzHZhdMg5agKGz+JH9+qbO
 L16lZN7ZrSos7IrHRzQI2ZtVyABy95lQWVxyY2r8xH0FW0If/v+boyEx3AEdFLvDYpNBuosEJo3
 yXVOMCBzRVSTIAg6fDItxukpv0l6evTpV+hXlBG3uQ2wZcQH1hCKmCEJjSFPbiOTKZTWWCZRSvu
 n16ZZdJyLTw2YJcP9KDr/zkVHpOam4S2k4JlTA5fuj/Bo18sWE7A8TZirCOsyOTBh/Unwdsxqox
 sf6RDf/SMYRkBuKNdKuNS3RKYw1mKFA2wPPFhqvk4hwOEJ6vFspzwgJrUEL5onA2pEUZvsvJkiz
 zu+dMppFrha9yL6Pnk/9LN2T1jnL5TbEmNL5zLjknH2PIgJJlcNdJh7HgKPaLbaj72RlbjL9NZp
 +eeQ80oRfGpgnaRh0vQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050078
X-Rspamd-Queue-Id: 6C92720F045
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54597-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de,nxp.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.47.77.96:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Define pinctrl definitions to enable camera master clocks on Talos.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ace2b2a0bf2b7e574b0d43f98ae4624df03b477c..9da6ae131b9195885458ff4b7688773620af8e8c 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio29";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio30";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio31";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_i2c0_default: cci-i2c0-default-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1


