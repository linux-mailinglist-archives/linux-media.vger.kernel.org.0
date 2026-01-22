Return-Path: <linux-media+bounces-51343-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ1dKYkFcmmvZwAAu9opvQ
	(envelope-from <linux-media+bounces-51343-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 12:10:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A67465BEA
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 12:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BBBEA8A6BE5
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 10:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBD342E00B;
	Thu, 22 Jan 2026 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zv2rITlz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8e3ygF2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30923ACEE2
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 10:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079008; cv=none; b=TSUzazJTpZ9Sk8Uo27BYH1GfxYPRezjVf8TIqw8Y2Y9B9pvhGZ+mR3ZBObEDYvzbAtekXtGn5h3wtE8b6ql0pBDxKev/b2cSQ2+yI0C90env0DxW0/+L/XgUl3P3sJ4dwfKtik92tZ79cuvBKKqHxZGFe5QFiM6Wm69VF9/QFnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079008; c=relaxed/simple;
	bh=2WG5aoisKJwerkvnpytr8xGIA19LajXbCLZsav5MoQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iU+7b+uEAFIy8pCsIGwDWlxG18DoObf3ofc0k8kJQMiDTUm6jfvxxRoZ1dBn6T3qvlcFUMHnV8uTUdtPLSqeW+1ED1oV72UlnfDoeVTuxOcm5yObCIQxKwreszxbnvhDxAOlwBuvju+mJZeEOleG4UgC24lGOazwNOtkCG+yoko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zv2rITlz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8e3ygF2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M8KTYg3867427
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 10:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=; b=Zv2rITlzggNvS3KE
	HJ6wXwDfRMydyGn8W0+KaJ75ZV1lf2lijfbO7WT8i+TcxiG+w5v4jOaLRSZ0M9PN
	+gV4dk2kX7hPQzc7cL9iU/+Cao7nQ8mMQ9fwgrvT6r6SCY+fz3Fz17hDCdemFgyN
	zB97T0tb4p8HYKMgfXJyAWKl/zcgV4Q8dp4JCfXpLyhSKYu+gJixBDsg/j9VyRWa
	VWT0iIwCMtkvPw8pGtfeyWNBJZg8NoLoqDTNibLq0v9hyO1Tn1QMc5r7/kNHICV4
	AGQTbW+pLaKAZIxKkKfjtVVXh1bGGg8TU8sUfdPVg8WUhIdQ4cq4CoMQPnHLZO7/
	Ymlz1Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btyrpkqdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 10:50:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50148a2a5baso21491771cf.2
        for <linux-media@vger.kernel.org>; Thu, 22 Jan 2026 02:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769079001; x=1769683801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=;
        b=b8e3ygF2eLWqNAUpS3qcU79uEOIdPZ3fbhgk9eGunLzmbZegwhQ6sVzUMYQwKwPCtv
         0kK4We/kfzyYZmEPrL/omr4HypMBmwHorxVRkFyoO2siH1dUhTKFgVfRMhFr83iHOGX3
         /IJ01g+jsGwDZJUH5IvGNHm24nwFtEY8M+Lz6CClSGpk/qtavAxowE2GVfI60nVgskyF
         Yb9h2+51Gx5usmFloEFlLEWI0IHC9Cq7iQM3COkoVyyM5y8AV28ivNK6AWancpAInFLP
         9wl179bOwJ0lN5ys6swWg6gnNwPJPjztnwL77Ck2hQZbjCwlPa8FQzA3VrI27nLeErwP
         fauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079001; x=1769683801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/UfWtw5ZQfseqhZRXzgqUeaU3ggF8Gp/sL3W86n7mc=;
        b=q5751D3uKnFqPX3k91I/k3sXOZDXB6DxWnizj2JoRNKOTefQ8g0ao/VcmDnApEP3bP
         lc792FKGl+F9Kb6sLYiDgISMCssA8OdUhR2bN74MSMwFAnxA/uyzCmYc0ONc+6lPWOyK
         nPjAUmM4jUZdISnO5qxOocD/enZEF3d6w53aiB1BobS3Y2LG97aZAXmfTy2Txt81NCEK
         ozxC44aqfGr+plruM6RkNYlr1u5Amx9fRks7nZq6BQ0JVN0jBGlg8W8AUuC5Kb8y/ZWs
         sqdeRs59n/Mp96w9qQ8j8bIOhE1PwyKasgjtlmOmFVuXCCBnu5wAzaWxzF7irL4tysWv
         NIgA==
X-Forwarded-Encrypted: i=1; AJvYcCVzJjYTCuxfYNHqKHwFFT2eug0bLoBzRbUG2j8G26/lZfL/339XEBwoJgpo524C+ONkQv7/LkhyXZ+t2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhQ6LqCrkQz3OEA6Bdx51+F+RkU24H+TUgYF+y3ORQQswfvsX6
	+flB7CRM3AxTvzHEKVskqOea8KFwJ8q38ym4mxUvpIMnpq/yX+ewbGAw8g766fDgusN/fqguWID
	KEdl05mRIfJ0AD/CuZiBH1k4m43L0zb3iyipbSIrYxqm77k1MfLGhS7XQLoBiRX5wmQ==
X-Gm-Gg: AZuq6aIY7Wgp8mf92GjwkJo6cWhoerNm1opf3toMUayqFrJf5ZDXDpEJ71AlMl6czXI
	arkZmqocRM5T5hkRh9WfWW198WQ9XyjpeFQ0saRokSapbBrXp/oqg3CV1YqRVonTBv3l3J9MkCI
	OKtHhV1DbflWZmJoPA3HxPCYGgKnAC8QYYkUT9HUT1OCycEcC2x+4MDkiTijYcojDaIEuCfGXWA
	9NlvOz+C8PG+imVV0siW3CxwHKbnxsFBygUJQyVE6OTkV15JmN1vrafrOotbbMeBNu2bVF/4riu
	vnt2OXtkyctHMOXYkh0Tm2hIASXdKoDm9B0E/DI9vjpo8KL+7rHh8ilq6zm8rdc7kkNlLEh8WwH
	s0xnRbMgxNVcMdKt41q7vPsdVDfae2cND0XoztSwbjh9CnKTFXweRAtt+fXzb4ntYR9luWexTT1
	Nu
X-Received: by 2002:ac8:5a08:0:b0:4ee:1aab:fd6 with SMTP id d75a77b69052e-502a15e4660mr293697641cf.3.1769079000823;
        Thu, 22 Jan 2026 02:50:00 -0800 (PST)
X-Received: by 2002:ac8:5a08:0:b0:4ee:1aab:fd6 with SMTP id d75a77b69052e-502a15e4660mr293697361cf.3.1769079000440;
        Thu, 22 Jan 2026 02:50:00 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9ee19sm121704901cf.14.2026.01.22.02.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:49:59 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:48:54 +0800
Subject: [PATCH v5 3/5] arm64: dts: qcom: talos: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v5-3-039b170450a3@oss.qualcomm.com>
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
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
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078967; l=2250;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=2WG5aoisKJwerkvnpytr8xGIA19LajXbCLZsav5MoQ0=;
 b=D4j93r8djlEVFvPHXUNxrEEMUPi8V2DnJbU02J3SwFN91DYAirb6S8cKc2/TO4Wi8hzF3ZLYt
 j71PwYeIltuBT7izRRMtbrZ8CkPgnc4JNgREU7urfXhndWGqqpfwO1U
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: 1ydqFzfQ0zCNFN6VhQ1Q88NIwV5azJG7
X-Proofpoint-GUID: 1ydqFzfQ0zCNFN6VhQ1Q88NIwV5azJG7
X-Authority-Analysis: v=2.4 cv=KpdAGGWN c=1 sm=1 tr=0 ts=697200dc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=szutk0iRDVHniUSXDBIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NyBTYWx0ZWRfXy652os5IE6YK
 8g4+DotZtEbIFOtqUoS/Zl4qhdM7krPfCP7yoB4wASJ/g5xfb+HgnyQGcD1gT3UlVl+jMZ7Kbnu
 SXVDyEtuLXTq8MX63rbqDfXFIUx7g/XXZ5bodxjnur+kqbyPYYduWkz0g0BSc2eRM+8xI0P1Ftl
 z+c4irlkELxfD1U7YViPiKExqvWDxzKoWjtsoUvBzAp4nFFfYjMryOTkFkZlNVEOfKjlha9UuXZ
 Xn33eOfHTeHYaKmTL19nKRBVgEtPgmvE1QNC7GexbqWh/X4ovCVYGIJkM8k5RfupAgEm0SHX1eN
 GkaEZTLrTQFulWeqsRx7EGahd8Tuqn3hDGTVo/iBgZ1VhHCetjZul9xHR1UHu9CPelweRjTM38F
 jU3Ps292I+AmkxhIdCI4fNmocpdnq8DMFZbUt35msyJYoTgDIvWBIYTknvIN68+QHC4h6sXzMha
 /yqnSoXex1rkJQANVyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220077
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
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-51343-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ac4a000:email,0.47.77.96:email,acb3000:email,0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ab00000:email,0.0.0.1:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A67465BEA
X-Rspamd-Action: no action

Qualcomm Talos SoC contains single controller,
containing 2 I2C hosts.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 51 +++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 3e1d85b6eacb90b48496ddfee2db27c586f3331e..6d28096e50546855bd762e479b66ed6214ec5d65 100644
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


