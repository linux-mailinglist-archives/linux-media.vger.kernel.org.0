Return-Path: <linux-media+bounces-61593-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOCoJ+GfBWo1ZAIAu9opvQ
	(envelope-from <linux-media+bounces-61593-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:11:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CA05402C3
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 12:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0C5E03032FFF
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49BA3A8750;
	Thu, 14 May 2026 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTgCSQ3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7nF2xaQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDF039FCDD
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753405; cv=none; b=DsULPoAbBfxncady3Ihilkd4IU8Fss/2kFvoA8lwVeyngPZrQjqBZLmPU3jRSmNzJVxibdt+SjEb06MhBrmxPUKhwJTeyYyIx4u/Ve0eTf/Al+5v5trf17RlAStyS/rVsrhbFD05ztF5o86CxlreAjXim+shWeTUABLZqY/Vcgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753405; c=relaxed/simple;
	bh=p/8Ia+hgACUnCJiEOKz2KDkUiywwxeTKUp58FnW6600=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LuWAeqpn0aLpoLSA18T4/SeoPon12PHwSqRf0fSOChrTU805uTI6GvCj9wnJ7iln9lnipVvoEAtKLZ/4bHvyKCkshJQp2NszvKUHZMRQplv7z8Jf1KI+r7GQbw5EVdxMj1Ko4SX0OW8sUre2yTMpBaQdzzExTzeKBHM9LoUSk1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTgCSQ3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7nF2xaQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9k9g11468120
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=; b=QTgCSQ3ccGg43hiP
	Rwtraa8+7bMSJ9Wqx8jaRAT6r97OFgreQYfH5I5Ug+NxXZFQaF06nRXaHm88Wfg8
	LHFVBgBf+dGPjS2pMydTH2m86TNpXoc5x3MPMY9UMtP6/wGXhM4x0N+NbNKDrUEb
	VK2JfNrMklqepTZPTOdAElQ4tMPm4FWZ5TfxAX7WUNlAlE4dQGJkXfTcEo/D8PJS
	TR+I88ysaSCpXnVkZ8mGJFpUyfexBs0L6o2sJ9mo2cVaGU1lb9uB6JASwm7JZiwK
	b4XDmrCOig5T9SoR+jLdRLA3XnTi9LR893QRfrJ38hPeQsIetyMnt+cDnjOfJZoW
	yyckCw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7h26w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 10:10:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c82c4772950so212546a12.1
        for <linux-media@vger.kernel.org>; Thu, 14 May 2026 03:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778753403; x=1779358203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=;
        b=g7nF2xaQAsZT6v7xYMDVe/giNiWH4by3pdiC/QTTshyi1llXBAT1/lGdoc3C3GUQy9
         lrdfApkGy6hD87mkO7VtfYHEWNMVUx11mX6EBO19n4jVP8U+aH76DsDbbmDIFdnCOGiQ
         EYxYx9ZXmlTiM+ALlK34guCJo10UDTnlkjYUU8aU4JI1M+8gEy/jByUr+/e86wj5wT0j
         rMAAr8gGVvXkHfO7ePFIPMzMcla2mxwlIyW88VqFwocycfXaqY6O6CI7drqJMvRT7BOS
         dHI05/XwF0KpBK66TR2M+McBqC09xMh1tLqGQskuG3qFNQ0bvfozvqGjuqjNmPylvTo9
         tS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753403; x=1779358203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=;
        b=bXFEb0GVbIpbLKG3pBKTLrg9WITPxco7htMp2rP2WbK7QTcy5uFBk46eygLeyGhuXc
         l8rNLI1w9Xq57yUFJNNa/4YZa+NsenI65oAsQWhbaQPZamT5gygdw9tUXheGoNEBultb
         96IApaDiJiJ6GZZ2myO08Th7d5/J+/MWFXRb+oyWIu5hxTmFKIVSKnO9+iwMkVNxBnuS
         IFm64EXTWuVTSrlW23dboSMxyBXMsGyg7Nrm1C1TMhWTnbH8Ev7kTT5eGgZmnvY1DO6K
         UVphGfqcIFV3XQyI+OQny1uNhu/x7zDnoZ/Nk/5CTZbCTSIE8HS2oeo9/kr5M/OaFKOE
         1Sow==
X-Gm-Message-State: AOJu0Yzu/y577Yuxr4HZQj9hv7HMKxshMnuHwYbApcmGdKpHLIC8Ipf3
	Sr1H0EjHgGE9EEpRihGfP4SeTCoaNt/9KoJz5DJpjgBeN2PbBCqnr4DoT+77uBohbEu4QGJTvim
	1O9PuzPoEBfV+wncBDcP4zlHZFchsX6bdGvetYxmZppCTwTSyKZy10QqSLU8Rb+zR9g==
X-Gm-Gg: Acq92OEHqwPIp83qR5JlqgiHOaVBpulxTJ28sZCV3q5kj4R/16BV08YW4xspM5yDnLR
	gbHMKfHS0wCF/WsPu57SRMdyEOCSoHgXMt9IZOPaTHtVCDiYZA8H0Va3lEfHqQ1sGtLcUstOMxA
	24SECnhVkb/0mTbe5PH/oPa2SEUkihWzTG4Afcpek0q/leWWnQWq5z16MzsXUUlwaEZScBQhrsa
	dAH5WNRkW0rkymv1GWy4gkMaqoexbuyCgGcdmyesZ+/iFkoEulK3lkVdZiJgiKp9lRrdYbvJuFz
	LgedDsWfnDyvmIGwxX1worAccENebV060GAnIt/OqXHbhPYysHYWbz8tHywjEd3CBUzDpJYmceT
	vI+YqsX/80ov8kfujpBHlK7qByWKgK9j2G8o6vGC1ehsQOMQY3/f69H5v9rLQ5i8qHceaHybeT7
	Ui6Ujg5h1ga/yBbsVWlVpp
X-Received: by 2002:a05:6a20:a125:b0:3a3:128f:1c77 with SMTP id adf61e73a8af0-3b0bf7bcc1cmr3011007637.12.1778753402710;
        Thu, 14 May 2026 03:10:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:a125:b0:3a3:128f:1c77 with SMTP id adf61e73a8af0-3b0bf7bcc1cmr3010968637.12.1778753402080;
        Thu, 14 May 2026 03:10:02 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07b007sm1966450a12.11.2026.05.14.03.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:10:01 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:09:36 +0800
Subject: [PATCH v7 4/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-enable_iris_on_purwa-v7-4-47aa5b026f1a@oss.qualcomm.com>
References: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
In-Reply-To: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778753378; l=2709;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=p/8Ia+hgACUnCJiEOKz2KDkUiywwxeTKUp58FnW6600=;
 b=jxlS3QPnZuGE8Gy7GXcXvsndcJWJfx+1EvrwrLWH5TDHJNIO+E006heIue79AaIhblhMGuOC9
 IoPMqF2icZ4AdjeHdHPe9EM26dzLkmvvKZasQIfn+gHvqvGJCjFQOSt
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: 53pDoytK3jNMQ-rYJqICTeIhMujaCLrC
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a059f7b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4TMTxM8xbnWuMOlFmbIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 53pDoytK3jNMQ-rYJqICTeIhMujaCLrC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwMCBTYWx0ZWRfX5Sp59GESAl+6
 6c3MJdmW50t/ZqlzO09pfko1Gbk0Y2R6NvYA7nfvt+KIKfJeq8MHpPDaENJnaULarNmK3dypsRu
 IpQkyVe2OiR7HPHnUnDvgzD20ZLBPAQCEjs5X3WnpyBHD87gF99jyyeIbZCiHf6XzW5HRCRyksp
 ZRym2HAgGeuCe7mrJfWKOADkRai4fAsSzZZx6DPUFo4HYs1kE/ran+BM1MBOOH5ukLHkynUO0pp
 mZ7PTCgujichHDRGfcl7fHpn4qjJ9qrWLek3ZYUavJAJCOC46zgz/ws6hEupXHe05iBIhIDUr9t
 X9/fHWVIsnQXAmhRrKVr78IL1ebYslvPt2RvhV2LJ7ic6nl7uuxnIo7QG/sO/JSB4+DzE59Ues7
 /fHoBJisJiC0IWaSg/EVJDlQmnzK7XI2KfT0AyRHqz07FYiS5lBnmrthP0sz09QbRnZ7PQ0m3Er
 /dhw7PSMkl6+5/mGUdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140100
X-Rspamd-Queue-Id: A6CA05402C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-61593-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Iris block on X1P differs from SM8550/X1E in its clock configuration
and requires a dedicated OPP table. The node inherited from the X1E cannot
be reused directly, and the fallback compatible "qcom,sm8550-iris" cannot
be applied.

Override the inherited clocks, clock-names, and operating points, and
replaces them with the X1P42100-specific definitions. A new OPP table
is provided to support the correct performance levels on this platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index ea65b8448836ead83f837e973ed536e8ea0ed8ef..a503deec97d75dcfb6792b007e0b74e517404cfc 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -21,6 +21,7 @@
 /delete-node/ &cpu_pd11;
 /delete-node/ &gpu_opp_table;
 /delete-node/ &gpu_speed_bin;
+/delete-node/ &iris_opp_table;
 /delete-node/ &pcie3_phy;
 /delete-node/ &thermal_aoss3;
 /delete-node/ &thermal_cpu2_0_btm;
@@ -167,6 +168,55 @@ &gpucc {
 	compatible = "qcom,x1p42100-gpucc";
 };
 
+&iris {
+	compatible = "qcom,x1p42100-iris";
+
+	clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0_CLK>,
+		 <&videocc VIDEO_CC_MVS0_BSE_CLK>;
+	clock-names = "iface",
+		      "core",
+		      "vcodec0_core",
+		      "vcodec0_bse";
+
+	operating-points-v2 = <&iris_opp_table_x1p42100>;
+
+	iris_opp_table_x1p42100: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-210000000 {
+			opp-hz = /bits/ 64 <210000000 105000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000 150000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>,
+					<&rpmhpd_opp_svs>;
+		};
+
+		opp-335000000 {
+			opp-hz = /bits/ 64 <335000000 167500000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-424000000 {
+			opp-hz = /bits/ 64 <424000000 212000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000 250000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_turbo>;
+		};
+	};
+};
+
 /* PCIe3 has half the lanes compared to X1E80100 */
 &pcie3 {
 	num-lanes = <4>;

-- 
2.43.0


