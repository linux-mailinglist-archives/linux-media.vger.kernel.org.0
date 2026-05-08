Return-Path: <linux-media+bounces-60923-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COMsBrHM/Wk9jQAAu9opvQ
	(envelope-from <linux-media+bounces-60923-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 13:44:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA5D4F5E9F
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 13:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51FC930964A6
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 11:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446E937AA9A;
	Fri,  8 May 2026 11:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GROTOrvt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JM1Ojurx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DE5388E46
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 11:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240498; cv=none; b=kPisatqyBYSHjbeZXLz8CyWYhpBn8MF4P8b3gImQ6Qf21Ct0IkarEhLhnGZaTA4mOqX6wbZ7cVSNfP8bKxlWSUnkTBHNhUjzZQ+aL1n+mh6Z0oYdIKEGs9wN5QBC/XH0+lvpWRrChozS67OwQbh6HNqIR4Ol2+0DWp95iHnfufw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240498; c=relaxed/simple;
	bh=4icgvbXTmREACRNwNtLec/LL7hmKBfhtcMJvtLBARXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I59sV2ivvtPGnwQusv9gFZSArm01XouHNIesZwuHv4g8IU4OWxFxt9mBduDLjd4DrNzBlCK9Rob/IrkajGDjmL/c78rDuW7mMsXNw6WPEAJ12dIBpr8RWGY1iIkNE3SjWXw7y7grvT8KKZbl/NCBcX4OTCq7U/Pdks2pMhjJoA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GROTOrvt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JM1Ojurx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648AufvA2199588
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 11:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5cLcgdWoMYt7Epxbuuba1uCp6kFzhol+vAL7YhruF4=; b=GROTOrvtWA91ya+I
	NIjaF3PW3PCAsgzZsy2oyd2C7Vd/4dk5qmzcPtNztQxDdFWO8IOSkldBjfZCmJ+m
	fl8XmvU9DK4jQbhlM1ABMg2GVID6sagid2m3qIDiZ9ofop60FiK2Sui6dKR/03Y+
	sFEe72L3B3yUxM7X8uLM5hmlEDgjHhiR7RomqqG7Dskj2JV4jMMe34EPlTJeIvOR
	NUa8OEln/6whOjFKX/KJTLNp6l/1sh7xM4UlSB73ujmissSmoklFuSmg/g+wWJTI
	ivc2OmWdlaAdm1Q0BQ5VyVRYK88ScfE9jlLpCt8SAn3nB2Kki/pLEz32tgA0tcSs
	azLRVA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sk4xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 11:41:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b1f4478ca7so45161416d6.3
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 04:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240496; x=1778845296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5cLcgdWoMYt7Epxbuuba1uCp6kFzhol+vAL7YhruF4=;
        b=JM1Ojurx2MxPQDQqpUjgEhTikLUQOK/r7/zZvdUiU4hNkiUmOZqsNe8FC7W2SX08gO
         PSPe/v6S90Tuq5KJunO2oVXOZ8+RA3czhEdkvmcq+FCUrG5EZ6fltsQSo62SI/jsDIow
         fjllfB06BL/fpHN+Dytk0uvqCsc/edhF1UjMU3Tu3NiL3d3DhameZe8GGK+W10Y+8bq7
         0LCLemDdLibRyiUbgyODddk9HMp8NA8V4+Y9xAWEhmm+OM5eVcoGxgKgEMOgNT94Sqq0
         R7L4jxyg4neVXO/7BqOg+2ypaFV+Pdy+QcqjV7pnFPlU4tiGNoVRpeyjj922B2OoYqrL
         WoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240496; x=1778845296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z5cLcgdWoMYt7Epxbuuba1uCp6kFzhol+vAL7YhruF4=;
        b=QClqsZ6dcI0K1nzWo3OX57ChaltxIncAQOQNJHadIvom12s6yZbvnGQYCtcVlG+JJr
         v78XnDsi0UEGSvYkJfww1C51ukGwpa8zXgcoArOu0R6LhTY7CHAkOiKuL/O/Yd2I2rKA
         j7qEyTvMfhUpTHIPNoW0iJcu+hb2U3WYl2SUrf86xXY6/YwdVRbMEL47zmARjJTmqXK1
         hGvWrSEQXjplNCNxZitB9T84dj2l66jbaMnsBhB3uqKTtUltg7lOQFKUFdBhW3B+0C+N
         nOqHz7Fv24+v3rrJFDIzAHJgKTgW67SwdrdH/3UA/bct/STG8/SY8xExMYjaYdLLaHbl
         ZnWg==
X-Forwarded-Encrypted: i=1; AFNElJ9amSMDxkJhHlllm2Er+6njwp2Xe/PS67P+IY8LIUlOg7HPFTi78tVBBIrmY/XrSVsAz2brlmlnP+Ou9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ucSSCS+c5bXAccMkOcPNJDWX30Zwr2dgNF+uRXKfqf9HrG9r
	vXjro7FHRxBbIphaWgswHh7yTOwFEzk1XHW4i/XDYPWX58iOyDLtekauFangiC9X/eSB72Lqc9q
	375Buv7B/28/nj90WWvOoqT7N1HAJm4yGwnI6pydisPqAbzKTS5L55Nf2LnlT91Sqsg==
X-Gm-Gg: AeBDietkSo+HZVfxLG3KPNLFN8mNhuDuA04ec7MwfcltrRl58ZLPBWtb5gMKJbg49J5
	cHAFz5murogn5YR9uBugEOobOuixxg+BLNOZTzYly7ShEbTJWh6f5EjukLhQbc1kz+WB+JkGrW9
	6ofZ2hBrZOp6UW11ig+RIrrplBuX69OedS30OJNTL6mzVpQ1L1FMYJ3S0ElCvOV9SZiJiz2eXuW
	kOmtv1rWp1llDzsMSZogNhbIk64RCjPWEbi7ocFHbEQpLNtA9o04eKP2zqDaCaE2rO55D1PWNl6
	spTLuCVdfj/TsuQY6Dh8Rs4nUm6puOgm6uYdszABrWV1Pk615qAw0FvLDVNFvG2zPKDlGxdcvdl
	toM28SX62MY29TkTwcA9RnOppktKBDEt6kCl75wAp04KIBizVMcv9XVjHuWpqglNPaW/mPbtlo5
	TKqzU9dwLDXBf/
X-Received: by 2002:a05:620a:4451:b0:8d7:e3ab:4c17 with SMTP id af79cd13be357-904d64e8cc8mr1794331485a.41.1778240495904;
        Fri, 08 May 2026 04:41:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4451:b0:8d7:e3ab:4c17 with SMTP id af79cd13be357-904d64e8cc8mr1794325485a.41.1778240495351;
        Fri, 08 May 2026 04:41:35 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:34 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:40:01 +0800
Subject: [PATCH v2 5/7] arm64: dts: qcom: hamoa: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-5-3ebdca3e4ae2@oss.qualcomm.com>
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
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=1588;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=4icgvbXTmREACRNwNtLec/LL7hmKBfhtcMJvtLBARXM=;
 b=CA1/7Y7o0nrqBZMiJFg5zW+YvMWC9lI4uYv6wvbhS3Hi2zKo+2rpb1GtKXFI+XgOs67OVIK5S
 MZTOB/rA+OvAoRCv5/tiwiIWbm6/BowPi8q/rYzmtiQ8jdGcn9W9EZm
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX0MT41CKiiTC9
 CA/82nNsLPot05aOdA72Tol7So0WVN+AtdrBcHm63BYA1tIRH1SD8K0OK5zINXMtHvUTa1r6Bqn
 q1ruk5QRA8wljnUym4/8kENXEThvRsOCkHnFmMARfTcuwG6Evkc0+LNFaIDIzpKBUS4iOf3gyhi
 QyA34sLtWPKCq/vAryIpuF37RWEnZMUAwG8f4Uj+ig7VkxCYZoFXg0yFvIyjg4dT8DxpiKALYC4
 gZx/2X7J9I9xYKXzojce8CPWuKrhTOCFw1z9nxevcuG5VIKfBLXmmToBm8UocO6IIV6+F7alcH1
 eIhk6OIRlbu9K58zfKWghvzoye+uLwW9Mj9100X+ry1cM7CVUOK6bT/Aizw9BEf2kWOAafjV4rc
 Jie1JnRoX+R7OLcuH/rte4zs8ZGNEuabPkM1dy4TvD66XEEoC4XqYiDGDgddi2N7E9+Jt1wxFeC
 5JHTkNO7kH83X9XQmhQ==
X-Proofpoint-ORIG-GUID: 763GO5htCogltww_ROPWK5alQaUwHf2G
X-Proofpoint-GUID: 763GO5htCogltww_ROPWK5alQaUwHf2G
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fdcbf0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=MjFiaTNPcx9fmn49iVYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121
X-Rspamd-Queue-Id: 5DA5D4F5E9F
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
	TAGGED_FROM(0.00)[bounces-60923-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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

Define pinctrl definitions to enable camera master clocks on hamoa.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 086c94217eee64756b734f436f1f0b49d49dc582..235076c808e6f6b5f7861dfc5d2703ee46c6ae9a 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6462,6 +6462,41 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio97";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio99";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio100";
+				function = "cam_aon";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				cci0_i2c0_default: cci0-i2c0-default-pins {
 					/* cci_i2c_sda0, cci_i2c_scl0 */

-- 
2.34.1


