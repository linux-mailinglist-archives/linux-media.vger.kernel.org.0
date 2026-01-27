Return-Path: <linux-media+bounces-51654-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N4SBtOueGlasAEAu9opvQ
	(envelope-from <linux-media+bounces-51654-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:25:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A08DA94504
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D5603059F1B
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6D434CFD1;
	Tue, 27 Jan 2026 12:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BwY53seB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c/6dqmko"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6562234CFC3
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 12:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516590; cv=none; b=M11UZno10uiHHkSbuCobpLAQTRQqIJzokh/KInlOQdSI0mhpr2t9au5JThA2820mM/yljNOn81NdCkDNk/7n2ry+6pNKWWI/C/7QBTGw1SsaW8qAXdIlasTndmkZwPnU9Kgxdo8RCfLbVN9K4x1WbptPjQMwH1a+5pWKxzz/dPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516590; c=relaxed/simple;
	bh=Q3m5IbmQGpL6zZUBS49npjIMSzFwU4yGGX1pNZXbyt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qaz6qZXOdyw9MHS78Mc1T2fp55JrQQwlkwYjVMn0yaCcXfiOpiL/UmFhKdKJN+PLxxSsdnFEr1vEmv2wTHW88gqET8gbwORV0xPbxSu5wCuFLWM7TwCi8kBjPIc12mwQZf936dZ2XJgiQiKjXVWMiE3f5EiDMMw3LeE4Re+LBKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BwY53seB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c/6dqmko; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R87LGl2379299
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 12:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oCwC9tuawsbTszbu909/Vn6wlhybyWDwFG7onmZcUCw=; b=BwY53seB3u94Bcxs
	OBVN+KuqRNxHR0nzalbeK+NmcZLXCmEO1QQPc0oIlZC/w9KRtUFZ5rJETs/5yDmF
	GAGBLjgNUvfkuk3KpF8gcl4JslCf2HxpkrnjCaVH7UjkrcQmNPdzJbAfw0u1tQfm
	516s0yRlTz+z4CJJOvTve0b4qzECQ27C3NPz8T4yMZpkJEFfOOt/kGuBJHhswpO5
	l03pwEeDCuYEX00VJBP22w9uMkbiXbRgGkS+zIEuPf8xmfs9/NjytK3F893kNXSG
	kZd9u6hUwbjtdB9aTrqsveU9rzakA2uX8Y788vSs/sd+2IihLLcEHTag86BX6HMQ
	Eb90cA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjr8u8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 12:23:07 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5f167c4ab16so17773327137.3
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 04:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769516586; x=1770121386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCwC9tuawsbTszbu909/Vn6wlhybyWDwFG7onmZcUCw=;
        b=c/6dqmkojhH6YdDI5jwCBGMKDD8oQqnuSQ6O7+fEylSAS6CJUPtT7KtiS1MXyiSNz7
         kmCh5v43Z+OiuJYtDw46OLvw4HezcRF6Am0JcmQ7e34FVGWZWM/0UjIPuwDW6zWyNmn9
         9Sa/2CBylXCLlwbohE/aS/a+5PJuBL/5LBgQaj2fbfVBgYOPedXd+Ytq4zFmeIMl+b3b
         nHF/N1s+GO/tg/l3QPIFtKtHO+5XGK5RLVeMN9aT78gyyr9zisdSerf4Yi1qsxp+p2G2
         SnERQJD0Vv3PS6Kg9nyNmxpt0oBTIr8F++lYU0ATM1uuSe7Lr/yma2Yf2Kh6JJMoodJg
         mGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769516586; x=1770121386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oCwC9tuawsbTszbu909/Vn6wlhybyWDwFG7onmZcUCw=;
        b=GArIayeHTDsPIlLisTMq1iTOyR4zhEROPykZRnbLkW5vAcyXekrLNBdDoXEj7vnWVr
         mZHACW19eCOspqdTFK4/OPfBR8ULewMdVpu5qXy/BGc7mtDOlkaWZqEVkJAwNTyZ3t9I
         lKHSNNyIpyy44Vz9FqkYoKyafPdwdibrCM9bKfr6etSgg6kY06PVqtKlJxk1MSCMXN8r
         fB58cgyv41gjqA5xR5lZu8gpehrIY8fSYnXuGXAWQsnhKkeK9x74FTxH4sqCaVElsjRg
         MyjhJS2lOyLyr2B5dNHUcysjzSq38dKKLL0KylRp5Y6w1CVzDW3lN+PbrnB5SIgQ3uL5
         TpNg==
X-Gm-Message-State: AOJu0Yxf+CcnNxnrRWD9wF67i2Yy1aCaDZ65msbjm9uTLXgGcBScc2sl
	DyfmG9Zk/5pH+H2it19Qoq/UzEL8MXRHyrkaEy2qgaOWKY06yOgjeQyKEUG0bLoCAx2+/oH70/l
	mJXdCaYtttNRPVbVThBFYMipZ3oQWchP4OygJ/Fse/SycT6T2WDJAA9wD1J68Q5Vhkg==
X-Gm-Gg: AZuq6aLQLR/icu26ae+nXxBWevnO3JGuGE8Cd3bjVUnEHdeFQHU18JPtoFk8xZdHiMM
	h2CWUPpKNDZbzVdHbMJ3zdvC6+WVxqmKKnDllhgYdVM+Zf+GDYZrBXI30BFPyzosd/E7F8i1PzL
	WengLa2qqsDOUJBe9eHCFmAddVTnMdzcY3q1k8jGvxDNDV0zgnRvBrvMnb84WClltVbhTZGGkpR
	9vmKpoSeD25DcT8p8D+sJZDDoE8GoXsFG6EgU/RU7K/znhf4WDsWHNKqav/NGe7lAgh6yOW8sCe
	a16h/4bxSMzcKF4DOv1wwu5jmxmZcYO2sp9tkBk1iF7uqJSxnxCjc8Q4seDKZrq5vaiWKxf8w6J
	a8NaG4TKdquA9p3uG8SRZhUCyTiakwqg5Z0oRhtiswA2XgkDiO/Wbs0jnIgtp+EBjGd+A+7RWXU
	U7s6wwEA5DsSPd3kXY1yGpOYg=
X-Received: by 2002:a05:6102:3054:b0:5f5:5c89:72ca with SMTP id ada2fe7eead31-5f72390fb1fmr717880137.39.1769516586490;
        Tue, 27 Jan 2026 04:23:06 -0800 (PST)
X-Received: by 2002:a05:6102:3054:b0:5f5:5c89:72ca with SMTP id ada2fe7eead31-5f72390fb1fmr717861137.39.1769516586038;
        Tue, 27 Jan 2026 04:23:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de492cc4asm3375442e87.101.2026.01.27.04.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:23:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 14:23:00 +0200
Subject: [PATCH v3 1/4] arm64: dts: qcom: sc7280-chrome-common: disable
 Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-venus-iris-flip-switch-v3-1-7f37689f4b39@oss.qualcomm.com>
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
In-Reply-To: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Q3m5IbmQGpL6zZUBS49npjIMSzFwU4yGGX1pNZXbyt4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bFOlWx5pqNu9f15y5hlX50XWRJcYAy79NfCWf9lk3bm
 PRuUuenTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMRJWf/X/U/uS/31v9jjOw
 3+Ut9iqdWljh4aDq2+LD6Mb3MP2uSvzF8HUebOV6Ub9ml5QrZS8Vlelez6NUpBN0173ARX/OhC7
 76A/CT/idZty/sUwmL/aidytj1IUJV8pi/QTvGIjddO2w3PycsfW95Zct93d5SYp9OPlGyuCNTo
 rSUfeJfoZLq//8MFtgWv3G5MBBiXeqYs6exe4bFgguTFoZe/OPjvDNGd+vO3f41iwrjtiWJHif9
 ev0lYXZOQuVr5t7PLolZcVdu/DbrO7iK+K5zF6Xn0/eHhczW+/O5G/iSS27+p3rt/6rbmrkmxXP
 llZWdNeIRUbhyvLJP13OWiuLLXRoe7D62m/ninlJrXekAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: mdOSGUjWU2XlDG7W8VoKYf5N6yXwEiD4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwMSBTYWx0ZWRfX96wxfiDk3x4a
 u13w2VREr5O57jh98V5VEZGQrHIvqRTwn19AByNZrF7RAVYDEBxtYSkZ9JD0ifK5nwDJoT36P7H
 j3UR0mIYpgtLWNm90ZfuSb9nor7s5vsL+0Y8LUT0loZCbjEU8dO8wnvcH02xg3L3fFjaSzSabbO
 A7Ir7gq2dZxp67c3g8nebCtT5Ao5x6x/gZWIU6d7on9jWLErWK0/tpGufm8pY9OItbkUuyBw9nN
 37OT8Qh/TGV/6X/c/QgpLy02Bl29kHmH6IBn1f8166fzouBUW+PVFVXs8OuA1vJ1rvSBotqdL5f
 yISAoigPipaokGDHE5W7gh1bg7sGp/J7MtGgZOsQ8Yu0uwmMCRaVFvM97Kb3W0DAEZyTNwj2g7T
 8Q7vrWcs/LW+SiLh+IYZ+2naQQfRZ5lFhjYSuF5x8rsHVv2nPUaGCiSdhZir1FMT4Vo7rnoxHp+
 nZwjoXSLOS/HVu9MkBA==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=6978ae2b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=foIlI7qs2i6qjVKSRT4A:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: mdOSGUjWU2XlDG7W8VoKYf5N6yXwEiD4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-51654-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,chromium.org:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A08DA94504
X-Rspamd-Action: no action

Iris driver doesn't support non-PAS/TZ setup for setting up the Iris
core. It's expected that the ABI that is going to be used in a long-term
would be different from the defined venus-firmware subnode.

Granted that the SC7280 Chromebooks were cancelled before reaching wide
audience and granted the feature ABI changes, drop venus configuration
for SC7280 ChromeOS devices.

Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index 617a39d32488..debf62baec9b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -140,17 +140,6 @@ &scm {
 	dma-coherent;
 };
 
-&venus {
-	iommus = <&apps_smmu 0x2180 0x20>,
-		 <&apps_smmu 0x2184 0x20>;
-
-	status = "okay";
-
-	video-firmware {
-		iommus = <&apps_smmu 0x21a2 0x0>;
-	};
-};
-
 &watchdog {
 	status = "okay";
 };

-- 
2.47.3


