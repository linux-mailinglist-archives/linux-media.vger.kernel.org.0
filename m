Return-Path: <linux-media+bounces-51487-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAqpLb8ZdmnXLgEAu9opvQ
	(envelope-from <linux-media+bounces-51487-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:25:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA8780B3F
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89E3F305261B
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 13:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01B631D36B;
	Sun, 25 Jan 2026 13:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qt3lwj7v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZyCBHFl2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211B031B830
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769347242; cv=none; b=A4kE25wPp46Plq9cwtI60BQkdWeEUVWe3RmwjYw+NC+GbOV1nUWiZzvtqB5Z5qibMCNG/Rz3JchSWh80VPDpJ0l4B32uXwH9Vdzx5dd8B8eyXheAHhfauKST/r2kRU+PGBT+7IzguLWobjylclYYaDYhRqIKe0DTQ2e/Ad12hB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769347242; c=relaxed/simple;
	bh=HCJVqJ428XQDN87qXRqTrOdSLhLMNLY6esVTo6pN1fY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdM0U4L3NLXePqeNsi9u+uke6pwSRG1sWd9L/1NXAXOTljaEkrWn31ND26cmfjsWLjqWuIhlVQ9/HRUpIUJddAsg7QW090lf8ZqH6PCg/QiXf9mi1b6AUIlJns315GZqyoLqTZSX6ZsjZKDunM+F0t8l+omYYTF2aMxfUGKO0Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qt3lwj7v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZyCBHFl2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PCitWI3213757
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qlGU9H3dfUbp4xV6iF65kZJx7Y/3oJU9X/2nLKTv4SI=; b=Qt3lwj7v5diFjcw2
	2bU/gVOutT6EBjWmM1h+4mUqvSm2X0LLqo8hhrnzPZceaCTFa5F4ljON2DFKgtBz
	acxZS4kWDoXj5Q6ebnCIv9XEtyUU6i8Y3V+eSiZvWUIReYt1G8vjRt0rYBLhgm0y
	/jI5Wqc8m4rmI/IcLIw0MUhsduhVFjLF9vmZ9mKzSRk+I3jlXbKMUp5V04rogvk0
	2JH+cA18/M/s8b0ljMXDsFAOe4AOpNl903QuZexs9PP7kbSVp1J2x8B/ctDbcVjQ
	LW2UvaSu89KKb5xYEsUYTo8BKjN5as/NunU5xfZNQktT3JXDSM7s27rqkRaclRC3
	2zkGQw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvw4wsn4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:20:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c53919fbfcso954157285a.2
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 05:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769347236; x=1769952036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlGU9H3dfUbp4xV6iF65kZJx7Y/3oJU9X/2nLKTv4SI=;
        b=ZyCBHFl2pxsVUfgrApwfAc+Oh1B2hM4DvcfitfAAbp65Mum/R6zR895BHBE2K6bw77
         hT9MQNsZXR0Oe34Ylb5aR5WRd6v6w+2mqkqUTyigkUr2yagU8KHSPZLTpTHxn95liL7K
         Qa243V32CWMYM54yxnCRXuByiEgloSZe3uEB+3FADPZC+zB5siqW/um/s05O57GRxId/
         xcdzbTsMaXaloSQseRO0P+YmQCbM+xZuDMhFILRb5xJDwvoExXV+OQsaeKOp2+HVr9dI
         eMzLcp+xssAG+/ceXGyGSQ6N+1wp4G5/uQAHBfCo8sPJuzDZll6Nxm916iJw7hSs7zfx
         O4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769347236; x=1769952036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qlGU9H3dfUbp4xV6iF65kZJx7Y/3oJU9X/2nLKTv4SI=;
        b=hm9pA1IgE6TsivH0OfYmKT8q18ToFB/mP9AaNy82hYNNrHqeoG3Xwj2FNP9ooNWDrf
         CjrF2T+yvH/u9Drr8mRa3a+ucgk5CXUSLE2Lg3Yi38a32S8HwC90vVQXdzbgXH7r2lzW
         zviycjaPoo8pNOCTqrUDShf4V3k5hydixXotJ/zd+rwOrNKlPUCVFpiRKd6WuRbhz0Ff
         RollyI2V0iABJkEWvM1jqQfQmyJQmamKS+1+9sUTixuoAxeN9k0sVpwaK83XIzC0NUtf
         tC9ui/ayzf0noUjrdXEKif9dWpA3tiV2/J8n/uA5GIo51Ag1g0FZIKxL1VcqST8mmhy6
         fnIQ==
X-Gm-Message-State: AOJu0YyoiI1ujIaXKUrTeGEBDmMX+J51BYS88wwCjkZwZQEmsyWu3XrN
	Kx31lIklm6L06W7N/ZhcPqoVU8ecsRLcx8efiQSG8LprVGv24CPHlUxWurFrQGreSyB+RGLk/dV
	QweIjs2YZNGJ/8o2Hym76lX+ZXKoKly7T1olPD/a68MSSKO8eP5qKe3Z58tfsFY/JIw==
X-Gm-Gg: AZuq6aIVhkEfDbz1tTNQ+KZPoqFfCPOiqfZlzXDWOGrgMkWG7m+MaJsC1WVfY0pEE94
	06fveHlhWIm5pMkUnU0JnHhXsAzu7I4sPxwhs810AuLwnqzBjCiK5ZwR66bOpwGQFwoyHdJGQNP
	Jhs2J4sMCJMgP80r3H3HJP+6ihRkAhUm0Ushtk2GdECY5itcHcg3g6fhxDK3xj9jFO5scSLpf7O
	sit+j2viJzd986ZUas2/rRiCKQNmJToDEXmNN4Gnw2dLC5FqykdoPTxvPTTZdDyKj9sYXnp2v15
	h8d45B1RWfMkvrNyvy79VRjIEqmB/z6JrCQyT9FkONFFSykixtJbIp6oAV6Eb3vYd1Ziwf1uG5K
	AyPxJSqDpgp6lIdtUDcAv2bMPMj2WPZq1ru+ArGvX94GaTGd+sgXfm2FHVy3atcf6JSWzw3fb8T
	IJPVrDUbUXwUQVkvGTHayKMyE=
X-Received: by 2002:a05:620a:319e:b0:8b2:4a1b:b80a with SMTP id af79cd13be357-8c6f95c6dd8mr174359085a.25.1769347236021;
        Sun, 25 Jan 2026 05:20:36 -0800 (PST)
X-Received: by 2002:a05:620a:319e:b0:8b2:4a1b:b80a with SMTP id af79cd13be357-8c6f95c6dd8mr174354285a.25.1769347235435;
        Sun, 25 Jan 2026 05:20:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1706b5sm18901821fa.24.2026.01.25.05.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:20:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 15:20:23 +0200
Subject: [PATCH 6/7] arm64: dts: qcom: sm8350: add Venus device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v1-6-2c5e69fae76b@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2744;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HCJVqJ428XQDN87qXRqTrOdSLhLMNLY6esVTo6pN1fY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2aZxJSaAxnnxMNe3rfyCgkw9eBmy5s3bVfz7yl6v+f+d
 Lpa+byhk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATmfOd/Z+uErPs6itvdea7
 LP3RcXHPdXdVFdHvz6KZy2cU3T+ykjPzWYK/5C6rbb0rU+eZrHuz2nKlmt5B/yTTl5ON96zaLlm
 nlRcgyxHIkmVibtl9tV5pU2zs84IjO1O3/np0/tjkF22sX9qbPTkzNRx9oq1EDnM85RZO1bhqz/
 NpunlGV03m+p48D4e1vOrJ0y7d1usMz51vPLvmVhLHFDWfRa7xW1btz63yNMvx13h/4+CLgsKkQ
 1/Vk3nc76/XPSt7XVpPpuyDZcSmZScUHCN5Ht1cUFwlkBge2a4VVqW/L2l6jOWvlT0uU7MPnHO7
 L3t72YaUrqXOTdk2IYbrjl1x9b2XczRSZMMVRZHnHTEnAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 10TY0nmW0UC_tm-16P-VAUuzV5QVu_pK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExMSBTYWx0ZWRfX0oI9PbUsPFnC
 jgt51wfr1h5KJH8/3skYLkFNqXUuuDqrrBsgAjJaijUvS08+BawkF7LPq6nSjYsdyalBhMDd6nP
 6o795rwak/FzGxJVo4InG5EtU4Q5J6ODydrjq8a++DKGDp+N7nM2PoNubKkJT9pGYsScLtLVlkc
 Lq2pkZ5G8NYYwMi+olPMgOtXbQi9BXLnQuVB2gquNGMJJ2KaNiPX/okNLifkOIJ56Ev46bHf30N
 tFdcYKVVAlgG1pgDqd+t04JQMDqA/TqP8lBwaJUsfERW8ixCrqtfIcaDPNy+8kCRqtBQD40q5o2
 kg+HN0myLwSGbXF4PSJQAnBemydhghFM0fBzBt5MI77zDlhgOnS6OoCGxzVTHxyZq/zADuOvseu
 Tj4n7ZBVAi4BBgeM/dZQpaZDoRT8K+MfZuIGEjJDlGprOrzVlOWycVlQ2m7PuAq4tu3xEi5qqPF
 ycnXKcl6RGPXItpG5cA==
X-Proofpoint-ORIG-GUID: 10TY0nmW0UC_tm-16P-VAUuzV5QVu_pK
X-Authority-Analysis: v=2.4 cv=POgCOPqC c=1 sm=1 tr=0 ts=697618a6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OyNfseFvsq6WzarXZFIA:9 a=RMe4X1btV4NIqd4N:21
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601250111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-51487-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ae00000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aa00000:email,qualcomm.com:email,qualcomm.com:dkim,abf0000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1FA8780B3F
X-Rspamd-Action: no action

Add Venus and video clock controller devices, describing the Iris2 core
present on this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 72 ++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 5c8fe213f5e4..2d8787266011 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2745,6 +2745,78 @@ usb_2_dwc3: usb@a800000 {
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


