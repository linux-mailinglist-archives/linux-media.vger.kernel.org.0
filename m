Return-Path: <linux-media+bounces-53652-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CfWBforoWk/qwQAu9opvQ
	(envelope-from <linux-media+bounces-53652-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 06:30:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AD74C1B2DB8
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 06:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 26F2D3049334
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 05:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B22B394460;
	Fri, 27 Feb 2026 05:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGuh+4E0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NyjPFcoH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3110B2D2385
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 05:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772170228; cv=none; b=g3zoHWRgHspW35o7cuvxiFGW0RcIdkd0qrrA4C/dew+FGtIE/lb6A7fGPQyqTkzPTieUjBzePEecLXDSVM6/N7HfOu9ScpfnA4j2ma1g7q1x2KqgXaADxiHDNUYYK9jVRXayCaQ3r6FzHxurC/XFL9tGnRx7IAjmSv8gac+l2h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772170228; c=relaxed/simple;
	bh=aQgfcz1YjB/i3xUfDXtNpad593tmxbzP8ow++UtlM5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rEAu8UjSu5ikfqiLf7+LGCVsP5G09LIGfrGhj9n3wPt0E0I67fdnFMOxAXXZJ6gEn78UIydH6SzUpR8MG5naLvIxIwayYgMYxDBi3aoYgbuIinfWxuPfmEsk4NZwQSATrmf8Iw5MNRx8NDyNx6j8kjn/kYwtNXExsEAk6wByCu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGuh+4E0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NyjPFcoH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2Jx8I3747068
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 05:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D8+2DDHAbEBXrW17Y32AaXMrRCjta1cm7TYgGHH2v8g=; b=KGuh+4E02b29G3iK
	uei2w9gFmGEF9kqf7+If44Tr0n9m5Jo7rlWrQwo5DXYlpxJ9nHmOoEG3V0n1Qk2F
	+N0aFzEj9FfuzOxFs+VkOzUwyWCDuargARpERKWuU+0uatLrF5ERzUR1WPFEqvrL
	R641gQlvVZHYgw1cX7BLf/Ezetm9wWCU8dDPOJ5ytjMesEILTtgcDfj6T/PLQ99Z
	Jxh3Afgk5W60Y8Y5UXy7MvZUMH0j+4YYJclKaA3WD1gpGMOWxeO8MPQ2WsUuqX1y
	k4xT66/kP+FTMZ+uxIyOWX1O38GkCqbSpzxexyCwupwjlxxkMEFAt/+kWm4Pqn43
	8lnaLw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuur1pxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 05:30:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899c6aa64caso119071356d6.1
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 21:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772170224; x=1772775024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8+2DDHAbEBXrW17Y32AaXMrRCjta1cm7TYgGHH2v8g=;
        b=NyjPFcoHwi5j/NUMODq/i2H94GCSdvN7Nn7YbKuH66R9Pq/7K/M+GB+sI10BMr/67u
         K4b4NhH4HD5Zm1V/WONPgmLnKpbylmqfLPlhoU9JHXtw1BW4ZqS8SrQUOEWTRiRsVOLE
         C2MZafhnLgzZJqBBnJhL4oNeK/AE4xhkCOgOQ0/ouoLpNmiAb2pdw5AdMRfNk/GSDVpy
         YlEOdCUFn+fDFa679Et5Hc2MOJfORq7ZRk+vBWLOkl+Tj9BKDxec0RHCkOaWmx6CLFWa
         u8fzeUkOq3K51nu1Laxs7wrhiuFIfnRehX8y8PKqvE31hqCy+5bDg01iONn8G2vozICG
         dEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170224; x=1772775024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D8+2DDHAbEBXrW17Y32AaXMrRCjta1cm7TYgGHH2v8g=;
        b=dWFPPE3jN9QwM4RLB1E3vS9zzi5jhx2PnaECuCcbX93CjhiFqRJ/a1vUn06lzWlwIt
         Xisv1BqyOcB3sYAz4x8HF6inG7uOA6JVd0mIgRuSeByOa0+SDspevXmidJsSd8musOZK
         Dv7d5Zy1e799T63Y7bOTmAa2xPo0ar4GICCaO7xhBesSbD953DHi9Me0t2Gxl3+je8GB
         1LY+ioCYWWqOGIvbXKuK5zcaaTO0q8aIsAo8WiIFemJM1lLvKH4DVeEyR1P5uTYibD0j
         1W7rtO7lYbIXm3BPaI+VVzryQZTolTzHJFgGFVNtL7jJ7MvKIdI/QfgCofKWqBf+ZOyO
         180A==
X-Forwarded-Encrypted: i=1; AJvYcCXEyLRC6+MWEWHP2zQlrofstRLMtecL4aglOJaNYl0wDeZRByjfJ3GdVw4E8DsDRyfn1B3urGsO0RgDMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YygkA+rqARExvY3yyd25lZHlS43eWKzdwcmpId1UOJqfz5JifK8
	eoTCwc+KA3nirfQBawqXX41Lgla2ZUjTR/UMz6t0wawE5SF9wzp3tShJHvKebiOR/QazkCZi+CU
	B1THPBOw6/fa/eTW6odEWm57IacPbG+5uZbFhTuq62PNX/vIHxYFQ6LYkDmYzBzk0tQ==
X-Gm-Gg: ATEYQzzfj8ChsuFWIES0ikEsbNUfO00CS/ddJSD5HRqXXVuxfIr8tNNPD1xGWv35fS+
	RdPFAJ5vC9DP/6loAaX2nKOShQ6rzcmKYM1NpOcyA4jwo6X1hfA7gMpaBNwW+MF0CPoIsjIDqzs
	fP4zeiCTRvtpTGMNI77fRPMzoA/9G5D9WSR+3HJh9HFbeEHnaVwKUofRlJh52Kukd9WQvSczHlo
	crwAA5XTTmmxRNLPhK0C787HFohLrT24Cdj/kyg63Wx5n3fbt/kntE9G/2QC/mUcPLJF95vpKJE
	MkQ+mL4k+myQLjGlelhklFuGJGzU2z3WDpXLjeU2nQnvvjfVaGRbrbF8RU+CC5OddNBL9P91Hin
	jGk4bhAE+FV0jg+aUj/ALj8hcf1H0UCySDLmslsQ/vzKu0ax4SzZcDg2/VZny5JiRLrDpEDvuzR
	W/RwOyhJAG6YuZ
X-Received: by 2002:a05:6214:27ce:b0:899:aa05:385c with SMTP id 6a1803df08f44-899c6766096mr72358856d6.4.1772170224367;
        Thu, 26 Feb 2026 21:30:24 -0800 (PST)
X-Received: by 2002:a05:6214:27ce:b0:899:aa05:385c with SMTP id 6a1803df08f44-899c6766096mr72358556d6.4.1772170223962;
        Thu, 26 Feb 2026 21:30:23 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744afa7d7sm36590121cf.32.2026.02.26.21.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:30:23 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 13:29:39 +0800
Subject: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M
 regulator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-hamoa_evk-v1-1-36f895a24d8f@oss.qualcomm.com>
References: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
In-Reply-To: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772170211; l=1119;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=IYed/TsJ48NYi3YoYbst6rSy78cyZz0ZOFAmgBTc1rY=;
 b=wcDlf/QkDAgruk00v1eTPzarMz1jhDFufYxGfhLpm+N+2tOKBdGxcP8oE/vadjS6BrYi5JBJb
 aNQq5XBz2O6CeNBibWUQdjQeMjYGsWsx9DQ9sEo3CsF2XkVn/zjQChr
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: U8PCyc78tPa-Nw-pGK7p5jeKFBPuV1bn
X-Authority-Analysis: v=2.4 cv=PN8COPqC c=1 sm=1 tr=0 ts=69a12bf0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Qfmkza9QUpqA5zW9Gk0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA0MyBTYWx0ZWRfXz/va4iu9Fw+O
 /aeReI96muCL36hOlODQWEC8okVM3w6VQEo9LNBwbM1luSDEOxK/m2uUaWxnq5dGGhi5HO3c6cX
 HVh1Uaj/5wkBUFdlYPSZoRC9u6slkbebnZfTBSK0n+WQT0OpYWicRjfkPTBqXYNsHgKeerdSOJ+
 WhE1OluGSnfGi2EPO2khYlG/dhX7d9iCKPSK0EBpwnaWGf2qA9sjx8N7cQyjuhGJ1n0jBdJ1w7U
 a4Wak/fHtUN+TTT9QN4VXZHpv7Xzo3B0cqwIFODX6Uk0PJcwCXfPQDuP+jFn4kbKi+H++d03vQr
 DuqbiC69jP6QFLExJVkyYqmnuZxx1DqNlZfma7okTk99kzJ6zzDVm4rttAr8kUHyNwRqSwzwEyN
 zTPUSab4GTRvHCN+o+7Oza0mi8jvAA6gKNToD4kp3nuNAQS733uee9OMSgO8QVOCQorpR5aSS2D
 ahUwsKYiKeabDW0nuqw==
X-Proofpoint-ORIG-GUID: U8PCyc78tPa-Nw-pGK7p5jeKFBPuV1bn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270043
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53652-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: AD74C1B2DB8
X-Rspamd-Action: no action

From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>

Add pm8010 L4M regulator which is used by Camera I2C pull-up.

Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index b8e3e04a6fbd489f66bb44a02aba7b9746f30fe2..5d9af325c931ebbc9f3f8261d427a31e6da090be 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -376,6 +376,21 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	/* PM8010_M */
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vrer_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &iris {

-- 
2.34.1


