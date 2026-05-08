Return-Path: <linux-media+bounces-60924-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P7uCtbM/Wk9jQAAu9opvQ
	(envelope-from <linux-media+bounces-60924-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 13:45:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C07D84F5ECB
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 13:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CBBF309FCAE
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 11:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1E93DB652;
	Fri,  8 May 2026 11:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdAfwAgf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMprfOk+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A4E3876B9
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 11:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240505; cv=none; b=CPWx6AtE3f2yTYiZojGstmcuFb+TvpxZRfN5PAFYMr0my5cqNS8QFAbrAREDUajQ/LnuIxT3dK7Z8JNhDXHLompZX9jFBMVtJKDg6fZU6vWZ82mArd4yhJXkPULW1Qq61krrIPcCKGp0MQGeMOFrWsd23RoDugkJ8/jcGX0U56k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240505; c=relaxed/simple;
	bh=32jODA13rVX71Zub9iZ9JION5MzYjUkv5FW4RsKBnds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yqx8sojUz9f8CYZ9clpSnQaYoNhMKG6BxsL4yvxuPlcrFCW3TzzFqSjGi3V9Xy1GlvyHyEeVYPTXDHN54ShF6toClnYEgHdyAygLI1hrMvUve7OGjhDfo7AoLINv/kv7TV3ignOYyyMT8z0YWLMflY+jP3WKcK9+BgDmHQIOls0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdAfwAgf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMprfOk+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jG0X257853
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 11:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	msDCUaDZXyv1zY4HE/5u9m4Td5p9+h60WHj5PdPUy40=; b=GdAfwAgffubA/UlP
	7ento7RCBt/jJNAUgbQYKFTwZ6YgH+zZeJbdKQt4o2LRJa5ZbjSanxgDjVo5p3ho
	O3Fibcf8v91Twa9Fi5YrAom1Z2MSQ+CJNYGKIMHkcgzeDOL01lbatcVZjGZ2k1lV
	5n29ZDDnahfpx65AOFv3OEtzAF7kf17ELITdUP3nzaR7VwEjxA0cr5hYOEfTQ+lJ
	MRdJdSSG7Ivj5CcoQO8/xsSPxjJYF3wKAwR7Pbn7Kw2JTSV4RDx10oQ29dS5h30r
	HwwmwXuB+qlZa3Bs+cv+z8AgPam7PM3FYAH4y4yzQbmufu0ItcY221RP2EKO2Oet
	JtmxCg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1aueh3k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 11:41:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d60fca52b9so341943785a.0
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 04:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240503; x=1778845303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msDCUaDZXyv1zY4HE/5u9m4Td5p9+h60WHj5PdPUy40=;
        b=iMprfOk+L5oV3GGM5HexRpe5o8INKDbqktBuzejZalS+nR2FDR91f/QZQ/0+XuhKOQ
         L+AQdQLmmmuflmHcOhR5B/yB69pfhtqAGyWP9Z3fGG3gzsM8JXVkMl6HgTROVSyiJBQH
         snWlmqTKqKSl0qaJ6tOoh8J1fXUP/59FvNivHD5IT62T5YFWRZlHgCt4IMBzBwLf6JJY
         xAM6qlgxKtR6EyLL4AqICZzngRM4kB19JIJsgpJuHtS9Vi53+dZBkPEG50fQPQcCjfKS
         89mHujdUC8ZJY9YEg6W02SjfL/rcp0MBPEuaAa0blGx2G28zDdKcDo8iN+Yr8KO1szh0
         gdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240503; x=1778845303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=msDCUaDZXyv1zY4HE/5u9m4Td5p9+h60WHj5PdPUy40=;
        b=dNKPq3Vv8feiw1tNFnvHPXj3U/GEoNCTauEdNPvMs7P5lQf7JjMUIuXGm7tp1dsr3M
         4JSDlFyL3voVQQXaXiAvIKHXVyNZ3YZOZP/CfxphYG5rD2Yy/U+cg9+jgWvwLxSffEU+
         N94z32QmnpzhNJiK0c7zHPnXAPV/3SaGFa962SMi5cSdtfXPhCU+m81bhVdDO6Tw6+UQ
         L1FbeeZcZIf6IaaWBYakjvMeQG+OxByWxkuh3iczghKaZOu/g55EjRiOG5f6zrRVXvNs
         NSnF2Pgt+jPRvXGdXdzWDzLrrPO6KQuu41Ak3bedqg/ptkxGqNHRxVLAE9SB7gFwYGH3
         Km9g==
X-Forwarded-Encrypted: i=1; AFNElJ8Dv9GHhjx9LYXaMA/iwJWhbzSLI7tfsMaA6k2AhQOaSqzh2cYloSQVqRhZdT9MtHw3zDgiA3dDPMU4/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxez+KOXWWpVdhHwRnsULIWNA4ZgnhrS4eLgGV7sxvm1d7uaz42
	7FhkB6TNFv4ZIOmiF8snc9WdScYssqCA3F0f9feu/93DAG/W2Ar5b/T013wFu5llU6XNZOTjZeY
	wvtCbZTlRKY0vySqUShtNKjoQxk7iCVz0q+gMCTn0xJc0U3AIBGZFOzM4ZjpfoUyEIQ==
X-Gm-Gg: AeBDieu90Kau7Hy5Xh7p4dC+6MaQK5Ptlcjs8L563/uHg5e0G8uL/D1GWWfQujXP9Hr
	T+WJladMM7BcJcLiromBKNUUUnjwydJdubBmhgHG8Ed1gDjPhBOJU15ODr5Gs7sCcUmdOXnv88t
	/Looz0rt8Ww9nOwFReuThZ0xHu/Tp0NaTLpgOtg05RDWcDsqA3jFHA/lGvbdv72AgwzQXbJGtJN
	8BL3IEidPB9lWCsjeTimfQFwUe0AfziQLmIWKXLjVffq5EQ/Ns5GnkIzp4lwnUw2PI9/eUkzIS0
	KMS1cItLZxr3E+YhntyKOjHeMReSlhE2NcaAUhob7a/y/rCuo7aSSXNOgBRLWREj9keB0WurP9F
	iD7ujVPupCs4DGeuLBbaQFK26qbN9Ab94ncTpzCfTrAqiDtu50Uiqwg/pmwh67chSbsXSzv9kev
	LhzJNp+C/GvsVYJKTzi/yxnIk=
X-Received: by 2002:a05:620a:408d:b0:8ee:30e:cb97 with SMTP id af79cd13be357-907b9674f78mr285704485a.21.1778240503054;
        Fri, 08 May 2026 04:41:43 -0700 (PDT)
X-Received: by 2002:a05:620a:408d:b0:8ee:30e:cb97 with SMTP id af79cd13be357-907b9674f78mr285698485a.21.1778240502612;
        Fri, 08 May 2026 04:41:42 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:42 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:40:02 +0800
Subject: [PATCH v2 6/7] arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M
 regulator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-6-3ebdca3e4ae2@oss.qualcomm.com>
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
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=1119;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=TIwiNaPtfGEt7M6lhlfidGbwYXL1gLP4Ebpm5LfFo1U=;
 b=j2xXh8saEgkacjWqHlWFnlm8eiG2Fo8yBQdInRz8Wor/E59qm4wk9Uu4mQ+9JxOMgl1DUPP3s
 +hAxpV2N4eyBKU1apy7polO2QWDqEgYhPEOF3Lao/DsaUEnCMw0WvTm
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfX1PhDc/Fi2DHN
 4OeLDJlY6WjxJHLpx+kpjEGsk+IdmjqIwNffXnfP5XH69m0ZpFKSb2+ADxiBv9QXy5KVkax0XYU
 zd2LIiaaWyFbJRYItdp87fLSflMC3P9wO16QhhRVhmFPYcmP6bIig0yD0TU1nocBggcLT5ZC1X+
 OSPUAAzplEuHTMJERwpmA570uB4oh6JfdPNcFB0+Eiaf06Xhf7ZXnz7q6gsBcK+nB/g3DIw/B1G
 jDXyxU2gGqnR7WunHoTbvpjsjfl9AmKRw+Fu+uJGzuSyM8cqHpHCs9hicisMIB66CzEmh3z64mv
 nKB5pdG2cJA/Br2tAblKZcOfYmg+JcXA8Rleu6AmSM10ymSbSaWdq1lerGDr6Tp7ouyM4YK8GIU
 H7TQSGpTBKXWQDzAASzf4dmyPWPeAfcjAUqnCqrUqlfATWC5YDTrkENMB1avAhoUUKgfSmMz415
 2bykIvI0RtWLhcSGPUQ==
X-Proofpoint-GUID: CHQfPcWa0PIe_QCdZLbK22SwqthbsRJ0
X-Proofpoint-ORIG-GUID: CHQfPcWa0PIe_QCdZLbK22SwqthbsRJ0
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fdcbf7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Qfmkza9QUpqA5zW9Gk0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080121
X-Rspamd-Queue-Id: C07D84F5ECB
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
	TAGGED_FROM(0.00)[bounces-60924-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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

From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>

Add pm8010 L4M regulator which is used by Camera I2C pull-up.

Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index 9c5e77df0054763c8a1bc8de72e296f4efdf9c58..5c9fc0315f7dc125e3176dc4038ec655b7fc4018 100644
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
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &iris {

-- 
2.34.1


