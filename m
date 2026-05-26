Return-Path: <linux-media+bounces-62818-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKFUFmjVFWqXcwcAu9opvQ
	(envelope-from <linux-media+bounces-62818-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 19:16:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4225DA7A4
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 19:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5CAD2301BEEE
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 17:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C863B5E15;
	Tue, 26 May 2026 17:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ie5Ycloo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eG+ZT9H6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00FA409603
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815620; cv=none; b=M6/u/MT+pxYpcciaFsMoT7XR95hR+A/FD46q2O8cf7wv1OX4j+n4tch+PrveP4fTH10dsnO7MhiXnCXlLSkjJE/PUlV/G8cXkEZd4L+4qi8jfZY+6bhxdkCRXZ81H630ma7WnaSX40Mms95yCdz6dZBB84qjfIJZ+bp78igckGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815620; c=relaxed/simple;
	bh=sB1CH5fqfkvydQKUGQkQAAWvvAtcksY1vgaxmjxAO3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b8mYqOLMuvoxVbwXqTE0qAamyRxpm/iYekSRggQ+PyCJL9MtjHmeEKsEo7Q6nB+/GdlpnzCwCK71iCxOLvF9TPbufAusZjsJMI3/uNnxo2JgfZNddHe9Ex7bvUPyoIxYqWSToYyruAmNvYbsBCl95j9+NFu6DFzYz5/l+FSswbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ie5Ycloo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eG+ZT9H6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH11XQ3289832
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XXVCch3h5O4NtbeND/2vo6i4hR0XUpgBJAmZ8skfrzA=; b=Ie5YclooSa+2jjm+
	azDNWrWUux0GlIlJQMFIR2ueQrGqWRhIVaTDWjADBXdx99tdFq7EK5gZlUDT0BJd
	kehYR9JUwXNRi3S79lpV9uG06MSYShkJDdW789uCs4ew8ltvPxf+CK/H47GWR/UD
	gybrQBqbJVJtCGnLlUvA2muzqFi1nzrGAY4zuSrM40cXmqQ1EgkbIrd1y7s0b6a1
	6AkIIq3G+JjnpCT3TD4WEt93mNQsHvzDw5bjovGiAOaBdXvT9rtBFexVWCSXUyKZ
	gg0M+HnEDegjbsDorfS3H1ieWPWjyV7woA45JLja91RCii46p1L5j4JOw2J/vm1z
	8ePCrA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edf1j86ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:13:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8353df9bc7eso10694880b3a.2
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815614; x=1780420414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXVCch3h5O4NtbeND/2vo6i4hR0XUpgBJAmZ8skfrzA=;
        b=eG+ZT9H6PrJ/jpp+8xV9jSdefK4vBY2YBFsUlZ7Gz0q3YyIsCPVEByEljBbIMbT81o
         KRSjHTig14YLtWGQzC9BNLStVc4TL3RCoMOIxtqqp48cB8evcaJykxnBGhmGzr7MHQCc
         vCoQnHanUYc+p2mkA+BqH4I0WlAU34SYBaVhzTVRtiaXtl32JHOjzW5lhzOENZncJ+R9
         fQNVc79FDj1bMDC+B/AbtyOz+WxlXfOx0W6aTD2L8P7ZiU74qH2+/GMIfgSoPEjQAZWz
         Zc+b/ydjX7hOwIdJNv2SAZ9vao1kl0h/P7aw3z016DeUIFs4B+7CSZl2RcT+VuxKhU4w
         2+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815614; x=1780420414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XXVCch3h5O4NtbeND/2vo6i4hR0XUpgBJAmZ8skfrzA=;
        b=agZXCT/E1YtUrarWrUfubmrtICwlF4CdL5AWl8C9G0skn1aJ0jegHpfrYUsjkZ4RVR
         6JDgpXoe7qqYtiPqXBvuK5JyRAMwEnqM2EsUahqMCcm3p3+XCbVMjy0ksgo7ceqd7uff
         2X1cW7Za6hn7Lj2d7LNcqb6UQaBRQ3+k2b+hKO3uwP1wlj1YnXdpn47+kCY3ObBgR3CO
         xpBH/uT7wA8VJp4t25O9KwGzzow5p122O9pf+uR0icQdxGiCqz1iQwihi6OJPP8ogjh1
         Q4J8vXIWGaxXWzo4l+0v8OumiCbLXVHhaK4CZT69lRMdS+YKNlxG7EYGJmzRBgoAOlQL
         EP9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/V1b6Y21WDIS71npnZ+ABPCWLUX33EUYRP/F/hvla9YAwdxTLq4znh9Sy6BJWUAo8BxFKlDZIqAnxAZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVNECsbqnKvWMBkJS+YwtLJ7s4ZHGqmkzbjk02x4xPiWyK5Fs3
	I3rE8RzVO2v8EHprPPtdCid0/d/NaaqACzI88isJ5lZWTX/Nu1vsjSfmr/APO8ZZ7cK85gQignx
	halZbfvAXscIP4lH8hPZz0BzncomzRIypkqve75VAfQfoVTlLZytLv/jbunZxEtJyFg==
X-Gm-Gg: Acq92OGndq0WOxF+f4lSxIJwzLYqvp0s1n6qlO88w+C9GUBEGScoeib6Bin5BQSU/kg
	Y4tgY+eVsQPYA9bCD43eK9wpAMEl0cd8ir9nZerFdtG2LmNyiVSocsgG6NzklQbinjfUrtkqe+l
	+tKHdluzqybNR9Cn7n6XxK84aLpiqxDdqLmPxGY52M1FcSw1lGVUIqJDFZqqArlhUb06dypemVE
	0BtkfsPkBJkSm9e+iXu3Yt2kmw3qPMIFK31X4qsZ/3Y2PyA73ogvpgl7ieB+IfWN3ETtcRSped4
	QK/3fuYcH3tG/O3mNDlEN5MRrM82irgTiYT0SAwKcC+TuyCsQPm7K66Z2BUJUjBzx7GNkapEaQr
	yYdDbvtIGEtQuKzNVhj1ER9KUKE1Yn1AmR8dnZEMnV9G4mNornR1m
X-Received: by 2002:a05:6a00:ac8a:b0:82f:280a:d888 with SMTP id d2e1a72fcca58-8415f158babmr19801933b3a.12.1779815614352;
        Tue, 26 May 2026 10:13:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac8a:b0:82f:280a:d888 with SMTP id d2e1a72fcca58-8415f158babmr19801887b3a.12.1779815613876;
        Tue, 26 May 2026 10:13:33 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:33 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:49 +0530
Subject: [PATCH 5/8] arm64: dts: qcom: shikra: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-5-645d2c8c75a7@qti.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ZNjnX37b c=1 sm=1 tr=0 ts=6a15d4bf cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XuEftVTFR-VjiOTT8WQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX8VXaPfbr7DG3
 OEB4yz8Hofdu9pUJgAC6wjXkZSVQmoGu+nUCfpynZCUczzO8yS6ZYUtPuNu2ly3VKdcyupMbuvC
 tT9feD6qWa8groeViFhy4u59CPWrWX/RRV71xlk50nRR9ZdbajxlI1endjPhvZ9XUH9zqYcAG/D
 Yfvp/eZEJtLh1uT8hXBN0fYrx0PodrorVYmkwizZgZC5ih0Cwe99S8G8MLAkDVyiYVKPjlL48Kb
 wrEY7Wrn20AenMxwa3JdsCmraR5VndHhWa4ESbkfPfQMpF65RX31HK2OBWl7DLxKY0l923FpWOL
 tppqHlInUUQfgvyuM2TAkTFoF9g0qcKCAwctmmPGUmpU8VVtOArotf/yuNQmEOjYXeBdnE3zXC9
 m1xWEH2IC7URCD88uRa7K6L4GgrVchAR2RRSPSaYIdnyoSHHLmIN3mZ2R8ZVvholqjyszure459
 HnSj+Cp9axZOlPWmyZg==
X-Proofpoint-ORIG-GUID: vcJ1VFO4X8VLu89k7WNNv5tPueQwfcpr
X-Proofpoint-GUID: vcJ1VFO4X8VLu89k7WNNv5tPueQwfcpr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62818-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qti.qualcomm.com:mid,4ac0000:email,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.7.161.32:email,0.0.0.1:email,0.0.0.0:email];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED4225DA7A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 6c47cf2a7ef26b4bb7d7f642a240b435cf5208d8..46de35971f629ded990827ebd76134e652758ce3 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -348,6 +348,38 @@ tlmm: pinctrl@500000 {
 			gpio-ranges = <&tlmm 0 0 165>;
 			wakeup-parent = <&mpm>;
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c0_sleep: cci-i2c0-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_sleep: cci-i2c1-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			qup_uart0_default: qup-uart0-default-state {
 				pins = "gpio0", "gpio1";
 				function = "qup0_se0";
@@ -701,6 +733,44 @@ port@1 {
 					reg = <1>;
 				};
 			};
+
+		};
+
+		cci: cci@5c1b000 {
+			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x05c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		qupv3_0: geniqup@4ac0000 {

-- 
2.34.1


