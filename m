Return-Path: <linux-media+bounces-62819-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sA75JFrYFWpYdAcAu9opvQ
	(envelope-from <linux-media+bounces-62819-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 19:28:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF035DAAD8
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 19:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B598D313E8AD
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 17:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED27E40F8DD;
	Tue, 26 May 2026 17:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEpLz8Si";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXz+Xz/R"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4512403E9F
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815630; cv=none; b=lpV6hHOu6s2HtoRQXLtBP9hAdvjkp5MwBS4f/VPX+0D+LUYilfydT+HZw2rmX0wXzsFiWCPdeWvsXTeePUWjBsZ02ccZJhcgEu+cMWeeqraJkf7Qqx6R8Ufs+1EDmlsJWzh65yrXwLjP7pjkuQLGNONS/vZi3tF5blIsuVCnaT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815630; c=relaxed/simple;
	bh=rNQVM20UUvgudFA/i6n3y1WsCxjVAxnVn14FXEO7CqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JSJyA9SCOx1szzihuNhAhIUDJwVaHKaIMNFqk4BL44oIe3qx8wKxRs5UOFVMuPFozAPkg0cun2eU6mhg99exrqMA7TTPMEFWnvgrlBGG3cbCvKTyIEjScrtE01kJ0fVvUxn+GbOlYn0LcSOxt0yJljjm2yNiLyIM8I3hu9AkK28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEpLz8Si; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXz+Xz/R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH12mq1752097
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qsLRItlvQTaW1wXx2stcMbcEedskcqLdoo78VHGXMS8=; b=aEpLz8Si6+oGEx/e
	94nD1w4n3U/F1YKkmZ+bjrBcSs00ROga91Gs6ak/4IwKMhIPvN7uTvyEv74lLbko
	T2VRWTyyzE2amMz5ojCcfn+yRMf1jlE7vDrAUs3A5Bw1xYIiL4djmiyHbpKaaeKD
	Q54hOxZSbrIaHk40GxCz+uhdkLVnfzoOFMO7SkIwDYCdEzwvuVUiYxf61tEerfyx
	R8FYioriVa7PU8LnLaWEiydgMBOtLJaEaNiA/JyDpuj3othiOWBJdtx4H2oI52cS
	n4c+3jfeoMUw2wQAvH50k63aawjEY0ActGAJ10HjoMeqNJIcEHbfBNbNJnR6hDYR
	63d9Ag==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edd5nguf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:13:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc977e6aedso115223865ad.2
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 10:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815622; x=1780420422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsLRItlvQTaW1wXx2stcMbcEedskcqLdoo78VHGXMS8=;
        b=YXz+Xz/RZiGw2uxAnpD2qf8rNZOiUHG3QdKA7jiHxIGpmnECrJ/R/CgKAQHZ1aN0uN
         x/hOZ3TR2/FgNztJB8J41+jPdMtLGgWkxhxmhjenkMYeS+hA/6g7dsHjOpCskXUWoMR3
         /z0hy+exQIdKN2A2mPWnph/7ljLcffWGOlwLpFvSWM2W5HUjqGSiN9ZRbFoabNq9ytVr
         aLWV90wgrxrwYgm2EO40VGg+3eV44MOrZv0LC3BBkyTDaT4MK7X5CFDTZ2s4U13YKwbq
         s9hiPx8vRDAxlA3JO02QUagWuV0jZqlZBwRPM4N5DQFaf/YYoatYdVN9ILf4wnOxxNWR
         lYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815622; x=1780420422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qsLRItlvQTaW1wXx2stcMbcEedskcqLdoo78VHGXMS8=;
        b=LtZVH1Es4PtIaK6UIwBvemOmHb2NcLh1kXJsiYJvJT7Bde+lomz17BS5zXTtSOSv0t
         Vkikx3ukAKbg6vFUXr3r1OnSbIanSeKB5vGRk/1hWCD09PWOmwq6UaIN/iDgfIzD2pt9
         LajZv2s1bXFjDEqYWOHnWMHWlCXySq47tWxffRRBcWBIHZ/WK6XfWOEslykgL+mWP2Ki
         tahJbb/VbYJ1mIFZmdgFNtVMrRJf1BsngOZr5SgKuXKjcuhgJnkU1ClCKgBSUH6z2aC2
         TKtyoIfUYtvii2M/sUhtZy/e9ntvc3L4Z+fbL1wub++TdzUhPYdpwLQYs4L1PRkaHSiH
         bzng==
X-Forwarded-Encrypted: i=1; AFNElJ/ZHndtF+lwnKYBI4/tXQR+5h1R2p61wwkc4XeoOI3TE+poV1y8V30wSBR92oHhV5z17w6bu5WGAPS7UA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN9dL37rfLC6GpJRnuH3r4QkptB3PDlSZS2/xBkTG7d4UDjxMJ
	fSAtMfabuKfyOogU2oC1ccWdYtU+tHg8N7EnJOvIu5Ne4q40bb+0wgeJCFlxruS1otHhYin+GzS
	NqhMOvAK7i+w5atHNtHMjBOzADQkYZaV1dpxDY4HwKbgJB+nFdeZ9VfYu9FPZpD1U7Q==
X-Gm-Gg: Acq92OGn/931nofEv5n/JLbWmCNAOn2GPsruN8lERC534Rhn9g7EeZdfsAMkUPK7aQj
	DxijtrWvvE7JvPvlkrw05duD3GZJ5u+Yo+LfiA6BfhHndBy8rd805bq6pBtOnno0mOxc720YakU
	X1k5W5GDYRSJ66qBHy0oMHU2PjxWllvQ6W9cbDKg7FWFUEmRgC74KeU9QcbnQPIiKVEVYJkaVxy
	48ufdAsrUufS1CBn4Mm3xouQ0CmxE+YHrtz/GRLPpM0qvHuLHSYTbT68ky2N+4OLn9Z1G+3iqB1
	9lOLG0N9mHu1X+F7mq5MuYnHy9x/FsEJUINPdxtOpseKPDoP2FGiPz/oSzJp71RAhR71Tf4lMhp
	WkFI+C7VkR8qQBWcW+QfQFDhXk07YUdWDAYMBV75Z7e9oPJYOAFT/
X-Received: by 2002:a05:6a20:244d:b0:3a2:d79c:415c with SMTP id adf61e73a8af0-3b328fde9edmr19895555637.47.1779815621714;
        Tue, 26 May 2026 10:13:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:244d:b0:3a2:d79c:415c with SMTP id adf61e73a8af0-3b328fde9edmr19895511637.47.1779815621220;
        Tue, 26 May 2026 10:13:41 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:40 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:50 +0530
Subject: [PATCH 6/8] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-6-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: VxeLurKi_QlT3bCaEWBnXvmozsswDlb2
X-Authority-Analysis: v=2.4 cv=TZ+mcxQh c=1 sm=1 tr=0 ts=6a15d4c7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8fHhTolRNNEGZtKOGWoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: VxeLurKi_QlT3bCaEWBnXvmozsswDlb2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX2E8V1bkEU7MA
 c1VvyBTY1k75fXcCzHcDjPFIMYVdbVUvnhOfIxMFPO2fr2/eP83YFlZsdsf0cH7e8p5QP6x22xs
 o5H2bM0gv5q94XtAFF1HV+FScEzb0HqRdzmk2qby5w4tcekHQcLvmLwwaS/zEQ9/zMHFgakZkdL
 oHa5Gh6sRFxqDSxudQGQVVtwXzh6GDvRjWpzKuy/mXN5Fjulgxqht1ygK7gi9Dqqgpy/P/ucKCI
 3UQHQuZIxNOiwyrJvHPNUHZVyLejQnrbYk5d6O0TtEBhFX0+tLO86M+a1QE7L00aeNGCMpvZkyD
 6xdr6uYqMj9t/BXb3Y/vkvd/HxTaWltK+RjYteuNat2BUJwjx6NA+ScI/hoqU/d6LyroV4KHQTo
 BjG+LUJi0zQN078ZBDAE8gBmPnqoJ+pF+kGsuh3xbQtmH0MD40HnB7Dc2Soj4hkEcgeoRH+lOJY
 /tjoYrUdQHPvmgIE2Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62819-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,qti.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DAF035DAAD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add pinctrl configuration for the four available camera master clocks.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 46de35971f629ded990827ebd76134e652758ce3..3fdb0c45d17880f1c1c6b90ee6e91b154e313738 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			mclk0_default: mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk1_default: mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk2_default: mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			mclk3_default: mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";

-- 
2.34.1


