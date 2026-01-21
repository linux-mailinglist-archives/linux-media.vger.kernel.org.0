Return-Path: <linux-media+bounces-51295-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iqP/Iy8ncWniewAAu9opvQ
	(envelope-from <linux-media+bounces-51295-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 20:21:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4905C0D6
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 20:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6E86E62FF71
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 18:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4BA341077;
	Wed, 21 Jan 2026 18:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i7+gM08C"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F58F3C1FFA;
	Wed, 21 Jan 2026 18:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020364; cv=none; b=oTZz1DF6PgTMhm+Z8rpqifc+kcm+55fmbhEFJMT/8azdcge3fkTVK1MuojJl6F/DTEXWfNyzg8QnB6aH/aRx2DWPHgR7URXvpTECAsQnhEYtGgJVtF9fKd8kvmpCMw7RDDc6e54NR1LOF7JficM6VyjwFQtXsbNzRR/8j0lTeRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020364; c=relaxed/simple;
	bh=oIJ+um+GlXgnL7RQ2va5KsUKLQwmY9SPbkvWJShnHOU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BeRPTu9bBVpxq6dI05XYaS2Ulv5qMM7kRFFX5rmpyAkq8NBwoM8EFzr5RHSzYI2cfbQdaikI8mxAbRejHPEe/khRV69/dZITNo/V0aho49Pnb2T1+7nHJGfZlqIr2oJpL4XWI1Yvumrep+cdepD35zFCNGOPOz+6CxpoTO6Az14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i7+gM08C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LH3bLA3481473;
	Wed, 21 Jan 2026 18:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0G8HEdEycjrESwYlgZdxWNRzxpy3UANV79Q9wsSUjI=; b=i7+gM08CNd6h1tbc
	4T+99cbAQ9Pl+e8SwNd0rKB4FL1g3rvJ6f8O1X/KRXbL42eWurYw5gmQf4fTE52T
	wzFvC3TDAgDIZhznHGmiqL40UdnMQuC70sriqFD7jRp1IjKddQu2wwk2yt7SNvA4
	JY6mhi7D6gCuzomewe14n9nIjwn3l36jdm2wkNbyghKO9L4msCAGFYQybwNX3ctz
	ZKBtVA0fC52G/baMuvtEAgZxrJaH9ae4L3Gb48Kx6fNkEZVFiraGKckeIaGQNPSO
	6U40GYG65WHqiea1NqC89sGPZuQoCKCOtG+/ByxBNuXLjIXewqyUAgf5Iy+6Rvrc
	aqvUhQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btvef1sq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 18:32:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 60LIWc9q018297
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 18:32:38 GMT
Received: from hu-nihalkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 21 Jan 2026 10:32:33 -0800
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <loic.poulain@oss.qualcomm.com>, <rfoss@kernel.org>,
        <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>
CC: <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v9 4/5] arm64: dts: qcom: monaco-evk: Add camera AVDD regulators
Date: Thu, 22 Jan 2026 00:01:41 +0530
Message-ID: <20260121183142.1867199-5-quic_nihalkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121183142.1867199-1-quic_nihalkum@quicinc.com>
References: <20260121183142.1867199-1-quic_nihalkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r4I9zNmT-kWn5mn4-_1gtWUpH5rAmKba
X-Proofpoint-ORIG-GUID: r4I9zNmT-kWn5mn4-_1gtWUpH5rAmKba
X-Authority-Analysis: v=2.4 cv=CYgFJbrl c=1 sm=1 tr=0 ts=69711bc7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KSpx70hPW1lZ7Xonwr0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE1NCBTYWx0ZWRfXyhhTnxpg3kDs
 CTp3SNmpJYmCC1sSRcuxJG1V2dSN0Y9c4JA6LAptMHLErzJhOWjCEF1lk2a5k6nSB5l5CAjPEWU
 5CrsQMfkq1SZcNFEHAYq0yh4YLtlN6qSFCvc9lphVvX1bdXn6ZzsIV/o0teuo7yyfzUePhK1QYZ
 JdLLBAF0o6b7zAl00rs/N699aeHCPbGxbDYCbVSI77Q6kAsaYqk56vFgm2MjglG8Hw9tg4ILlxL
 Y5gHiWR4A6BibdgsyA5aPjm0v8l17X3smLa2CQYwKJJp/j4KtQGZgCTGHMZTwlSmgw8ni4hMi2u
 WTXqXRHgZ7bTRAd315wurzWZ7yLYpmhOeuljsTEpDaVDdCZqBEbJRtNm8DLN37ZnG7QArBTsE3z
 LU/YCUXjR5dApFDq3Kip9YDwjAFye61oAboUQo3dV6UT3BztegUHZB3RhqmxbJcwgtgft6cUK24
 yWh9vHi+hyLB/Cjbvcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210154
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,xs4all.nl,oss.qualcomm.com,vger.kernel.org,chromium.org];
	TAGGED_FROM(0.00)[bounces-51295-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[quicinc.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_nihalkum@quicinc.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,quicinc.com:email,quicinc.com:dkim,quicinc.com:mid];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2B4905C0D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Define three fixed regulators for camera AVDD rails, each gpio-controlled
with corresponding pinctrl definitions.

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 51 +++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 565418b86b2a..65c1b49c6dfb 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -77,6 +77,36 @@ platform {
 			};
 		};
 	};
+
+	vreg_cam0_2p8: vreg-cam0-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam0_2p8";
+		startup-delay-us = <10000>;
+		enable-active-high;
+		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&cam0_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
+
+	vreg_cam1_2p8: vreg-cam1-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam1_2p8";
+		startup-delay-us = <10000>;
+		enable-active-high;
+		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&cam1_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
+
+	vreg_cam2_2p8: vreg-cam2-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam2_2p8";
+		startup-delay-us = <10000>;
+		enable-active-high;
+		gpio = <&tlmm 75 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&cam2_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &apps_rsc {
@@ -564,6 +594,27 @@ perst-pins {
 		};
 	};
 
+	cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
+		pins = "gpio73";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam1_avdd_2v8_en_default: cam1-avdd-2v8-en-state {
+		pins = "gpio74";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam2_avdd_2v8_en_default: cam2-avdd-2v8-en-state {
+		pins = "gpio75";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	qup_i2c15_default: qup-i2c15-state {
 		pins = "gpio91", "gpio92";
 		function = "qup1_se7";
-- 
2.34.1


