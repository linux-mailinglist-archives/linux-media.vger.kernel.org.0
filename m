Return-Path: <linux-media+bounces-54708-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHrbOSOUqmkkUAEAu9opvQ
	(envelope-from <linux-media+bounces-54708-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 09:45:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCE421D486
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 09:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5951C303CED5
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 08:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03B437AA8D;
	Fri,  6 Mar 2026 08:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gOW631vU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VaiMbg7L"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B89E379EDF
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 08:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786691; cv=none; b=B36sFkoqh58bNL1w4JZug01L24E0boWwNNd8uZb78/yDp8lntJh15k2Mm6vO8Ih0pR/4UD6ysv0JJU/KP/bY07sYzOO2M+QjY7AiTk/kdlEmAzmgrmL0smvaOtTMSDeTL23z62DewuXRG1EjhV3c/M6cgaMkYdjzwwUH7Qo8u7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786691; c=relaxed/simple;
	bh=Zg9lmcifY79a8Un6AZk/xfMz8WdGCWi9sZcIyDdPApw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PjK/1ytEcASTqGD01Mrb4zv9CjTMnKXWuZ3Z1sBUOUZaj2LHuazuhsDNp7PuosJVzhP7KYPI1XHFUdN74TlI6p1beAJ+98oicUUnsddjzsREoZJRAUP65emPQ/gYqosi49SXKWJSYzCmbQRSxb/kCtNSZY0D45RpUQiKd/S4aPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gOW631vU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VaiMbg7L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264ahDh3886883
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 08:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EO53ulTur0o31/KzMiAB1NJVdCgiA+KDt8dS3rNnu2A=; b=gOW631vU2tJ1433B
	F9WOYLc7th/1eP+Me70Px5OTtSkqVWoA6mSYasF8pvqtDYuouLzzn8Z04gdxv+Uw
	DfHaNK4qkFX2oBBmsNxuoNBmEFGzbGl1hIOFqh8lqBgEg3XRsl3W8xg2rQPcxQJ0
	Xi/zi/zyVCUVdtrb5JEhNro81Sql846noRonNp7IajnceTFCaoUeNTJ3wgYe5ztx
	NqmgYkS+qykru+jJT0mLrhgAGVngeiaXqxRvlhM2EdYgBLMVLtyLKcjEJ7b2Af6/
	Upno8c8J3lWPAkTHuNuYWOBbXS2mK0GVgCqVyrBkoQY/LERJiZ0RO5jx+QlEIFcN
	Lx7qPA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqj4s9w8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 08:44:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7378ffeeacso9638653a12.0
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 00:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772786688; x=1773391488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EO53ulTur0o31/KzMiAB1NJVdCgiA+KDt8dS3rNnu2A=;
        b=VaiMbg7L+rHykaVa2IfYlcg3dn+myoVbBlhhwb4c16WPXwKFOrBCM8KHCSR6b1lFkT
         tRVpJYllZKMEHpPak0DWE95B7ecZCIPkbU9z2t/wCfyEgFa0WcXb2DA8UpXDdP8CQQ2A
         siMY1BS2VzclrK5JiZso101oxcffpWYaC8YCKcBAYRXKtdwOjYy97/taJGnhAsIem5G2
         LHWzkHEX9LMvcF+J56nrwsDbU5wi3IvBSER5fdaHQyLquHcQDsjLJekEemZeK5jxhMzy
         CxT7Nq25YAWiKqe2eDLPEl1B+Y7tts0rIWcz52STbmiXq2mVEpR1t8mvISzkCu3EHFQ/
         No7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786688; x=1773391488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EO53ulTur0o31/KzMiAB1NJVdCgiA+KDt8dS3rNnu2A=;
        b=VxXGwnY9/fqzf/tooeYkaqvdHllPNGgzKQ9qlBHMp6B4RyFzuBmD6x0m6JvHjRTbwQ
         dpXxD/hQ9WuIfcAGKzMo7evaSTkEh6bDjS8utLriVPCGXV92ElFKGudqgju3u7kTlm8i
         TpvB3gnEjssenQsNDbBGySC0Kcoy60DgJoReFXyn4lN9O8+1w/ODYURJBrVk5hINAeGo
         yz10N60DKUkf96tttYiHeM6PZ9hHbUXtq3b7ecD+g+kMNVOYSx2rCpP6PG//u0Nohzll
         GJD2xQRfFl7N+gCfXu+5fwEdsUGScgIie8IxN1YNUCgN98q9ZuVCZlGOLJB9m5BRNwZA
         YmIw==
X-Gm-Message-State: AOJu0YzSBWWEMwLCiXJU1vTHNexW+qLLDR7Kw2L+nZjElRzI9rCoo+Jd
	yIUt9XvJ9vnR1JxaJ4U72lMsUqnrw57BVeTHaEDkjyGoGoZziBhrMh/vm9Tvrss9ExWtU8ywogL
	dKNj9+CiuW57q9PiiMbwnLov0XYtv4xDGQFjBVi0yJhxc7K5dxOtp0TW57yvFfBgICA==
X-Gm-Gg: ATEYQzzNltl3hv4OWrf5pPLj7fG/ejZxyDEgOFG9pmOg0yp/1tGnOKZLCH7j7V2yWZi
	HA/JSMD5OJ8p27oonGjJ1sQ9SJ2HgYXJhWbjVmDBWHJoKdHzr7gHe2pcsxZ8P9mirL5a9kHvMHv
	LSc4yk3lAuCQDII76ESFFU/1zmw3QS3SYrS2oMagaJrMUpHRhQRAnuiY+dzV3A/rcSBuMVOdkgc
	ytlSscRcwhWTY7Qv8dbXb1OZAlngt0nZjxfxGl8AeULq2km6RAxkdoLAghROfyk60+rNC2wYyV2
	YzmwSeZ26vTCIagTXfCDIUm3vhkxzjEbJ/kXnaoLP3rBvfs20R2MlARJuyPfZzhm/vpFFMkxEJE
	9lE+MMPS9QTlHZSnIGCPRDbojHjetAU4d0+aCtQNKAff7hwVyjgs734tN4WZjga+RPtwd2rC6Ow
	Jix+yeNlt4m/7SWXyh7je3
X-Received: by 2002:a05:6a00:7483:b0:829:710d:a46b with SMTP id d2e1a72fcca58-829a2f7b48emr1186691b3a.41.1772786687864;
        Fri, 06 Mar 2026 00:44:47 -0800 (PST)
X-Received: by 2002:a05:6a00:7483:b0:829:710d:a46b with SMTP id d2e1a72fcca58-829a2f7b48emr1186659b3a.41.1772786687249;
        Fri, 06 Mar 2026 00:44:47 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4636c74sm1393573b3a.12.2026.03.06.00.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 00:44:46 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:44:30 +0800
Subject: [PATCH v2 2/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-enable_iris_on_purwa-v2-2-75fa80a0a9e3@oss.qualcomm.com>
References: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
In-Reply-To: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772786674; l=2376;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Zg9lmcifY79a8Un6AZk/xfMz8WdGCWi9sZcIyDdPApw=;
 b=0zQDnxv6QtoP/rZIQFUZlKVUWWFDx1aFsHudgAEKJfPqZVakmGjs1phqgj4EiYRgBhp3LNdqO
 gbfGH2rX8J2AjTSQLrUqBCEPmPM5KqHv2PkQ4W0pysedsynZJS/U+4q
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4MiBTYWx0ZWRfX3w5DceFoOcid
 WEANb1xICUF3Z4TlPM3LGskTkIHw7me7aYzv4CeyrldoyO9FlAU814iEwrg/ap0LmTJyqR9wzyH
 Knm6FQjMSYlScKp3+lVHziA546Qu9h8hnWml5+8uRw+JfVLwZbAJIy7CFI998vH7CC3+mw/+LQ9
 yZpFiq2uSjLiqyJW5uHmSuEWyAgAq5WqbnoUw4r5y7N5pw/s9jFbjZOKeXNT+ZLGcIr923ukUl4
 VuzQwyAMO2uswd+XvMv41zZWmLA8ymevxVV+JB86cGbfFvh2uzaLCQy6jncW93+fBKiClKdXRTd
 FSVwVm8fREim/BVwjpE3oCSwLrCFoWaqwmsv0C6rTpSBsgmq7YnQtzH/pxYjFKjROg+IL1+p6XK
 VVKq4Eqz/ZbIZZApOib58cmNfCM26hRGyF8yT2cRQm4Q1T5fEBHLwITFBHvrwrYoZ3AKle+uCVA
 s8j29W3BjNWz714vjbg==
X-Proofpoint-ORIG-GUID: zAiAfVstq-AD3X05csyZCQhXJ8Xt7FNB
X-Proofpoint-GUID: zAiAfVstq-AD3X05csyZCQhXJ8Xt7FNB
X-Authority-Analysis: v=2.4 cv=T8uBjvKQ c=1 sm=1 tr=0 ts=69aa9400 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4TMTxM8xbnWuMOlFmbIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060082
X-Rspamd-Queue-Id: ABCE421D486
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-54708-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 53 +++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 46ffe5353f3d2fe20e70fa8373c2591863708c61..9db77fc734021ae2986ec6a231b1f6f5461e6688 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -153,6 +153,59 @@ &gpucc {
 	compatible = "qcom,x1p42100-gpucc";
 };
 
+&iris {
+	/delete-node/ opp-table;
+};
+
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
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000 150000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs>;
+		};
+
+		opp-335000000 {
+			opp-hz = /bits/ 64 <335000000 167500000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-424000000 {
+			opp-hz = /bits/ 64 <424000000 212000000>;
+			required-opps = <&rpmhpd_opp_nom>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000 250000000>;
+			required-opps = <&rpmhpd_opp_turbo>,
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


