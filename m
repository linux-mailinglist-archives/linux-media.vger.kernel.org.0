Return-Path: <linux-media+bounces-51496-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDb2OYQhdmndMAEAu9opvQ
	(envelope-from <linux-media+bounces-51496-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:58:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7363080DF0
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7406301443C
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 13:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950D6324701;
	Sun, 25 Jan 2026 13:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVaHSc8+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aa9rGIEf"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4333322527
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769349468; cv=none; b=VCorozGA44QPIetTiP7T+AvpTE+3mJZPl+XVSCoGHOsvCc19bsemv7UjIhzGA4sQ7SFZ4VhSEDemKNJkAcls/UY7OnWLOAVSUTERJFT1gWRHtzV8rO4t6ysGYkQPtCvWQ780907UgdFPhNa8dXxTuvEq4KL9+qy4vOW2q8RDAXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769349468; c=relaxed/simple;
	bh=KR51sK/8+Hrks/YLV+YZPJvHG7uJqvASVsBsq8BP4dQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UY05O22FC4Eskf5YNLmW2UY+7mrOovqzmn/+WdjBlO996cP5Yw/YryXj9JuYsSgRbNiiXtxr2k9wxqizVafT5rE30QAA96yy4sygqHbgDGPgti6EaKFIlkRwkAxznhouVKickkXBVMt/Qkg+hF02DUh4Pgk5So6QhI5V9SfkoBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVaHSc8+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aa9rGIEf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PAKuip2700045
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6EYL9Fhq5znzCwCxTjLpT+asjrYPIFckBy8iTpWZyVA=; b=gVaHSc8+6WiTwgpD
	7+Iwfx5RiBv9PfpNlsnGtxLP61tOw6k57zvvf5wxq1su25sZg0P5nhsSes0gmBSG
	CVCgvF8S+NEbP3fw0hRsz5na79IYod8EzImxVEwIxSYeOFYSzj7lFgTIxWwsG2Ek
	5zOecrlV4K+mh8Hx9UVnnLfxF6+7KISjBRXjk0dUc1S3BoZqmjD9F2CJ/GhJLJuQ
	zFl1NAtA1ATFUBiXdQ7XoRE+1ZeKIAvFGIQriTYm7P4uw6bGDZbj+ryTEooL1GeG
	zMfykst7ljNu91aGpJ2/Fcuy2VsZbuNYDXjpZf+O3YkGh0Fx4WXpXWsPS34BAzgc
	wM5B9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq24j6yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:57:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c538971a16so278866485a.1
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 05:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769349465; x=1769954265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EYL9Fhq5znzCwCxTjLpT+asjrYPIFckBy8iTpWZyVA=;
        b=aa9rGIEf7weDhNofm3E39utSte1bSvybX9MZLB5Hakfx5xYaty8SsM7B/ImOK+t+56
         hWLNvw4uS2Ce4Xzt2g2KXw3v57MUm29eO6kmabJDNHh2BU7nw09ZphSFZmktql3iiGOu
         3UHho/PDQZvHrIu2mYIgAbS8eg0FCHLjLqKT71K8RNMl7qU641oZIhtHvpjDBxxtElpR
         meWGfIFWyryewnzdG2q3Qd5IY3hTALzI+ciS788o0S8PiDZbVlB07q6w6XM+FRBjdK3d
         mKaDWRHLg64zoEz3cheM/MLQhhfc3veSW2yv4qcA+/NcSNhntKt6hZBU+91pSY5GneQg
         sqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769349465; x=1769954265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6EYL9Fhq5znzCwCxTjLpT+asjrYPIFckBy8iTpWZyVA=;
        b=u51ThuQueMGtt5MOe3olUlFkaoJJngHzFe5P9tNq60wiu0IESsXPgH6jUWCrYrzmY7
         nnmPLBQNJduKGGgMae4lWnMepi08oCIeQc5NTNLtPhZqFiLv671kezCwHqiL/PK5Di3Z
         fvBIsi4TQHS5pW/bTLqvT3QTaHGYCL+2pkVdgg96CgEb6j9lH+gxnU9UI/yO17XsDkje
         PV2FOTi93gns154r0853W8gz0cte2xTgKXYP86a91XZRF6gJEqiFisS8psoEPGLeeV3N
         Mlelay9NIQ25YpL1LLd2qz0SQtiolQNrb4ZKH1mFkxG9nPZIon1zHfG19jL0tu6MaWF7
         OTTQ==
X-Gm-Message-State: AOJu0YxwyaYRW8QpUAXxk2DHX6LEGJuF/K+7d+RcTnVj3JP+0vSPXhgL
	BgNMtFnmNHQV677NPb7B1EJjrMAyOdqf8PnK3I0Tja3BNnspQ8X+L7ow9tB+6cJwT/AGV1ldJM5
	GqG0hUBm7Ex0O5WDJ4y1v4kbr3SvusUMHA7z1rU1fkQJHtbeQHhjlpdufCfsHD4cBXw==
X-Gm-Gg: AZuq6aJ3PUjXqQDcNP6GPKvkwCq4mthIIa27fMb1qZlU6dkN8s9YQSHquEOEVD1Lom6
	WWTG5rGqYd2h5gBe0vsN0OnNk6afNvWcvOUkdO4DZoEu2Mucm0tUdMELmlGDATo4yO0Aq8KBWdT
	ct7JarQF0rIlSeeH00VkspmqQQ9XFt0dlso8s0l/HqR/UJnYXNQ4hgDZ3gc9q1vdT6npFMi3JTw
	Le+gk4FZoduRZdtQ+PoG5YQiFlyJ0vC4hVxWkO0LC4MhPyIT8sGGMzh48hcUddwIpt7ppYRCghM
	vnSNBk8i/5sQgqcUgrT44UNRYIB0ytJh+YsPYWbV4JsIl5QttkSuX/pSBU+lnZjyX93E5RXslyP
	i2CThB26G06M81zBbm7mb9hBmNZ2sm3B0nOaHRDin+Eab+XQKGDrzF7D+IWz86c1jFwMCc6z7wv
	3sicXOQllCOIcxvn317GegEdw=
X-Received: by 2002:a05:620a:3f97:b0:8be:6733:92ab with SMTP id af79cd13be357-8c6f947bf2bmr174244885a.0.1769349465065;
        Sun, 25 Jan 2026 05:57:45 -0800 (PST)
X-Received: by 2002:a05:620a:3f97:b0:8be:6733:92ab with SMTP id af79cd13be357-8c6f947bf2bmr174241985a.0.1769349464646;
        Sun, 25 Jan 2026 05:57:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918a3asm2033621e87.52.2026.01.25.05.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:57:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 15:57:29 +0200
Subject: [PATCH v2 6/7] arm64: dts: qcom: sm8350: add Venus device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v2-6-552cdc3ea691@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3081;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KR51sK/8+Hrks/YLV+YZPJvHG7uJqvASVsBsq8BP4dQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2aZopv7i9X2V+RCw6b7uob8y2I9sFxvr//2XLX/f/e6H
 hbQuTK/k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATYSrhYOgT47T6cuDmPedL
 oje2zXh+0s024b7YzKJy/0cr5M2TtnwzE78xde5HB+uIj41sP3M+R1UV+rxwl5jim13CNPvng+h
 SpqnsMexL3MT3bdr2q7p6fsPas1nSb6QVTGdOCnRVyxV3Ukt69pql8vHKa8vKHqw1vbLEj/PTKt
 7qmi+6Qh7C7m9TX6vG+aoLfWNcyjUjdkJnQ9LirEr/g/LVgqu3M/y6q2KaEKbD/j2ysFpnnQ8HX
 4xD3Zrc1lBpsbnngua8sJ6yZH+3zvN7J/gE+39KnpfzVbMTO9vntTfB5oAph4+loiCD/tYHHUrb
 amTWqZYuaZnyZ55dr170lisPjqV3Nyub3HTj7yhennoNAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExNSBTYWx0ZWRfX6+QOrp3cd72p
 tdTvIrabdJ0zzqnK10neeT64C81RATw1a7zdoWBeTs00krd6d0DMgbtL/cn7IuqBQ9911MWH9QA
 PThP4uRLIj4duLILlEgYMI4FT+VPHoVApV7SIozF3VmJHIZqgx4OiGrLS+++Au32hgPVvY2vS4z
 CBM3OUGuGOQT/omnTbLOOqztz+9MyJ/uwpNI/QQRi/BG3JdwdgWpJQATrWLw55viz/YcpceEWhs
 HAH5fP9M5GARYdXIdNfBjFPB17VMs64zYKb/1EaihP8SxrPLRfuGoLcUZ1f/z2G+J2Z+6Nz6I6s
 HZFtKj+MIF8+1dov3AWvSG7esOCsU42ZJOe8Bmq/4uH4AVi409zIIvp14cUewHghI37DRT2JEQh
 7sDg7gDIp+iTDLPpCE/fwEJAQDpuuzOHwoKTnXnTzzsCJVmzUmt1fveSRcKeIw5R9fC95x2OofI
 ycAyxi6b6pxsSUqjz+g==
X-Authority-Analysis: v=2.4 cv=EsXfbCcA c=1 sm=1 tr=0 ts=69762159 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OyNfseFvsq6WzarXZFIA:9 a=nwUz52_nThrR2rjS:21
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: DSjMSPupVbOGdLfAli1VjDOZGBfzTkJk
X-Proofpoint-ORIG-GUID: DSjMSPupVbOGdLfAli1VjDOZGBfzTkJk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250115
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51496-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ae00000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,abf0000:email,qualcomm.com:email,qualcomm.com:dkim,a800000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,aa00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7363080DF0
X-Rspamd-Action: no action

Add Venus and video clock controller devices, describing the Iris2 core
present on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 73 ++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 5c8fe213f5e4..7aa43e3a274f 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm8350-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -2745,6 +2746,78 @@ usb_2_dwc3: usb@a800000 {
 			};
 		};
 
+		venus: video-codec@aa00000 {
+			compatible = "qcom,sm8350-venus";
+			reg = <0 0x0aa00000 0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+			power-domains = <&videocc MVS0C_GDSC>,
+					<&videocc MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+			reset-names = "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			operating-points-v2 = <&venus_opp_table>;
+			iommus = <&apps_smmu 0x2100 0x400>;
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-720000000 {
+					opp-hz = /bits/ 64 <720000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-1014000000 {
+					opp-hz = /bits/ 64 <1014000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-1098000000 {
+					opp-hz = /bits/ 64 <1098000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-1332000000 {
+					opp-hz = /bits/ 64 <1332000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sm8350-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sm8350-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.47.3


