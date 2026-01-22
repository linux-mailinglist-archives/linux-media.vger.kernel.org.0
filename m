Return-Path: <linux-media+bounces-51337-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKn9FzECcmmvZwAAu9opvQ
	(envelope-from <linux-media+bounces-51337-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 11:55:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A259E6590C
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 11:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D0A028A614D
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C8C428484;
	Thu, 22 Jan 2026 10:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jX01lWX3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KSlQgOKB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB83442848E
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 10:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078503; cv=none; b=smyQmVQ+OQ8eJfdl3bXnUvsLFt45qwbtis6nvRkvkdrF0ZsgvN9mLhB6EwZ7GxrsZO5bPOg1IqePyzI/v4IA+dton4kNpOGQjxJ2FeILaHOwtJld0Fw5UpmTXHOIlRsmLxNV9b/t7UX6vFOx2S7NTiaxGw99GQZfXwm8RD11YzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078503; c=relaxed/simple;
	bh=urisQog5JZfbdirBxu5tGAO+ASUUaW9dPoY/c9Nj33A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TJRGrP4cGR6eoD4MCkS2fZa3nAT6iLigRBvc5d5f6dgNwSsZlTRDL8TwoieR8DXZoX/8KlOVzaYZI5ZtKAUBeFxkzChy/Gk1202xxjxZmUScbe8RKvhtohgNpeenY3bbrXov1MkmAgY2JDKvBXPJIxdcq6BVfbgRkYQI4mN2RN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jX01lWX3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KSlQgOKB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MAcdhX2898699
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 10:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=; b=jX01lWX3yFK3QBsd
	L11wmoR0sLo16up3YONxLEHLJk2fQa8+O3fwOBkgB+dmzXIWC4E1F/EnEjOf6Pyk
	OwOSeGz3EvSWgknLzrr+rG9KJo4HIvZloVqTT6wDcqTQHGbUDTsgHJopNddxjtzU
	faOtMzyWbz5okd4Ra+b/IFTL2RXtUPduPNsANfSOHjVAoZf3bKDHODF1haHbpmuG
	6Rm3fMF3SGo9IIUJUCb7QDejdTHI3KBUfZzwNIehxvs4hLLHji9AcKfCM9WyFus/
	Ac7IWRkCfS4o45LxpNfVFPA3oEDdHuK2XrLeiwzsasYQMhtxZOEt/pNGNGg89CmY
	Bi61pw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bujau00by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 10:41:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6b4058909so205993385a.3
        for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 02:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078496; x=1769683296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=;
        b=KSlQgOKB1ReCIV6JrVt56GVhm4w5KqkhhN9wAC0VuuXSz3Jwz1ir7xmJfvCKRLKCKC
         n54owv/sUR9lwvTGZeclWHhus7JugkSSx3IaFazMW8kXIgZwgintOLx6a7L+d+vHQZx6
         WBQxKa1LlIKF56LAx0hB3lO1V5zK7f+YfMX8ocnc2QkAOxqLEvhMpccPj7+810E2iftP
         kHTPtiqgb7a3VSv+9evaOM2+TbDWr13q2W9QHoGsXplTwoVFoqhugEk5kvJyyk7g+Afs
         /D/2feS2xpICl1CG+OAufy/Ss3oRR/1fLXf9DCb5GTClmgw3kHGdFHDtcet6/6sHfZ/F
         Q87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078496; x=1769683296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=;
        b=JFFYXuyVDEitTeYkleDArkQPeu3ag4f8ZzoKPHczNpW+tK3zIrxIvcuKINbHLPnS9Z
         itaG2QbLLbbrQsTdaDyeLQiX6T9eTWypszGSx5ojzmAan2B5QT+kblfojGc+e1Cjf4Xr
         0PfIsVADr6BvJJw0CjNIvqdWlfD9rSeJzyJ4orwk63bb6ibej3y81bm7glP1Fck0ytHa
         +qCJBz9JpxuRs/TVXJp5JCkIlNVEnISBwY3rlLokzZuk33t5I+VzjZz7PQSQKhQHqjtE
         KDm9+o67Nu66ush2yIwLbiW7rqYj/tD0j1kk8NIkOpWvJ2UsjVD+p9eB3l/CUbwn702p
         jH4w==
X-Forwarded-Encrypted: i=1; AJvYcCUdC52B+puQcVTI6lB8xx4HDqTIhYWpCiYDnfKjXju31/qNhPx38pYgBj2QSDCV4A2T9h+w4D4XXHf0zA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm9tSvsCji6XEIIxq7U7AIl1XFEnLbcFWSHf039tpXuXvbdUsD
	qYH0xP3mvEvKPXWmf1pwnBxCl90Sqn9Bfcogoo158WfXfh9ywzyfQo6z39flbwXLcN98HThb3RK
	1nJvM5VDYsqDooqp1nUR4iM0wcfFVOC2o9CrZ6ewa1u5xom0n5g3qFWw/tbHYQ6Z2zA==
X-Gm-Gg: AZuq6aJra/oTYpM0XE9xqCKvGXwh/6zgt40mttYA8SKpY6E7ux5YeLbvciZ/MOWKlV7
	+yoPs5aj2sAf4oDEsPfRGrBZAvu5WI3UOYdk4jvDDNSs/BHhbhbn5geXbncN7Tm967/u737LFM7
	ozSahU31Zk8hDI9kmODARhAwoKHzg+BJQNAKh/sS7kZuPu90B2FiLNQDC+ASu2rAo9me+J4VwWe
	r7ncfs35GZ20NyE8cwdrMIWsZzWPDwe8cUr1Od3l0fLHJwlK5AEQZx24nqoqW49Mv7H/qK8eUxE
	4yd/o7XYhPK6al75UL3ta8YqyPT7+11Q4b1iuPx00oC3qZqfNITasuaP6wd5ESKbQVc1s9eD64n
	Xw/U7FYrkSK3gr+pmDfYIgZUREzQ57Nw9JZWyojWPWpZcKTDXkRRAlGu2z0oxFgar+SG6X+ciXe
	IH
X-Received: by 2002:a05:620a:288b:b0:8b5:1b5:cafc with SMTP id af79cd13be357-8c6a6709b67mr3080296285a.36.1769078495751;
        Thu, 22 Jan 2026 02:41:35 -0800 (PST)
X-Received: by 2002:a05:620a:288b:b0:8b5:1b5:cafc with SMTP id af79cd13be357-8c6a6709b67mr3080294885a.36.1769078495346;
        Thu, 22 Jan 2026 02:41:35 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7260229sm1387868685a.42.2026.01.22.02.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:41:34 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:40:49 +0800
Subject: [PATCH v4 4/5] arm64: dts: qcom: talos: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v4-4-a908d49892e7@oss.qualcomm.com>
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078453; l=1538;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=urisQog5JZfbdirBxu5tGAO+ASUUaW9dPoY/c9Nj33A=;
 b=I7z9k27YrP0G4lQE7jSsHQaqMCmfAdS0JW5oaDyYtJTvk5+UcdXrfI7CMFvOcIoB4Bt41Vodq
 tUrvYBEyWVUDgr/FFrVxfAuANQayW2RNkejOcM6nSJ3Mw1e+f1Ux8fA
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: -8Dt2Hp_xe38r7Y4B2JY3BZaHM0WjSDB
X-Authority-Analysis: v=2.4 cv=P443RyAu c=1 sm=1 tr=0 ts=6971fee3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -8Dt2Hp_xe38r7Y4B2JY3BZaHM0WjSDB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NSBTYWx0ZWRfX1RN5gzueobdd
 RAuHqM4dpFiqHnV8JvmG0ApbbLS3jXu2YubsqJo0Imhy3K42j7jxZcM9qPPGBvJ8gxwtiweLD3W
 hAmqXXaCcD0Lc0LDFEIkS/kubexCV8HKodb60EokBCKOqiG2qbP8s3I/310tSoNvdAZ0LDd3KAw
 vgmrM6bmnxAmXvq072zQdnBlxOM8LJrFOC1/ADADTfjeT2gv27YmZdINfiq6VQqkGcdkC3QvQ9R
 OFUt1K9iVB1C70ipzJ979xrqj1V4uIxSLy4tLYt4Q1iY5C2saSj26a76b/OWlblrpY2qkk++V9Y
 qA438qOkWmAMJIB4KGp5hMmGu8vjJJa8FwRUxgNzkdmWKxKyTGkxNUysKHYy+SbkbtEUZcLYw7/
 Np06wg4zjkrD13Rjosh8TSYWK7834DiTTGlh5GzRxdfEcNEo/ZS0E+2ub0HeVj2364/U9TO3wTr
 M65RtZLCi3SB4RaO94Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220075
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-51337-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.47.77.96:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A259E6590C
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
index 6d28096e50546855bd762e479b66ed6214ec5d65..33897994d0ca8a193acfbc94a932551a09c712ce 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio29";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio30";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
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


