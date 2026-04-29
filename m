Return-Path: <linux-media+bounces-59938-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEEPL1238WngjwEAu9opvQ
	(envelope-from <linux-media+bounces-59938-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:46:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DBE490B00
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E13963061B3D
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 07:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2E53ACF02;
	Wed, 29 Apr 2026 07:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qo4y2uid";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LsPAv+kM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DE63A8739
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448671; cv=none; b=J93Lbhhkr191pDzqawObOgqwGwEFKZOwAx9rSEMMTD6zY06NiBOvR8FLTw7e8XNdz2imOeXjJIvNgsl4OrLEl0nrCFn1q4doa8neNLjo4DnLkcR1T7gOiclMs5qFsSKl8wUwn0ppgXQJ9jTBjapQaDiqU/oLpXrhA/bVGdyodMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448671; c=relaxed/simple;
	bh=p/8Ia+hgACUnCJiEOKz2KDkUiywwxeTKUp58FnW6600=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bU5atr5TqnTqnD2itOXkA7kvUejXrxRLK0iHczI2PBaNzWXsvAhhaz4OCycYMlbWZFT08W/C3+f6VjVyTii0nqVQmoyS/btisuYqTgJv7XYTELwIh6KPtgWl6+rf1JCpNXfzVbuw9YfkEnPe0tJ0FZEz6dYEP7M7x+5Dhq14S8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qo4y2uid; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LsPAv+kM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T7KnDt1882162
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=; b=Qo4y2uido7q0bZW2
	TyM6/RxjkDFPIu0ZWCmqDZGXwX3/zdBElRiMvydEci03HIkGkYeH0XyEbQd/JcUI
	HF2U7K6PYWnUUm3/ZnPS2BAZBzDu1PhQ6zyOEnjnli5mL24O4qIdf+d/21F6WS0w
	eo5aO57Im5AhVYmeUslKQcFhm7nSZI2Cv1dcGNOcnBFRm8r33W22x4ahITHS9ROm
	QhI5lM9qcH1gNxBdUUdHH/zPgIb3GPh0ik94lajGpSEZNKcRKijh3PAbVgUTJW/Y
	eYtG2U/oLC3XzCIqJtFGF7B3PrgV/jPVzfryi+CCArSB9Ne8UeTN136eMx7oxXS9
	9EKW1g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3r4dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:44:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630753cc38so16274211a12.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 00:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777448667; x=1778053467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=;
        b=LsPAv+kMXyJPyqio2AgwRS25XqWpau8iZ9CSKQzIPtrK2a13GeCDIHl9qgwBxzHMOs
         NwQz7PoLEj8UrU52uWTEwfqO9UNyfT+4uW5snIeOcwaD3oMeeapk919qsfRplwMki66C
         su+tPFsxKMJhHyxtiJ+o0yDsXzA2TpcSGhwOs8mTQ0p2XJGZuObGx9Sjg4hR5fo32K5R
         oWv/UsBxmzappTvB4ddjhB5EJHF+RCJ9UuZ1dHLVztFbxx5DpnJPUvPn0wgxiFW1+8oZ
         q6h1KghC2ubRbqlUqb7IH5xxCL2QOUBTzw+CGuiylcHN5gcpIPHUl7ClZafMr/4VVta0
         wLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448667; x=1778053467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Djb8deguTpEm5n069GC5ISx+s3tNXXuO3yNPHMRx/QI=;
        b=LbgtG5uXp3VlscsB/JcaZ9ZLV0RoZhM6lioRDLNAlHKXUc+Lc5RPEYgs2YLMoQaIFw
         B+2BaDOxW460+/3kZyAhxbPO2QxuQXBodEmIBwe7x3GDS249+xrJhvlrvwd4p1RluBgM
         xmrNS7Z49cuatJbXRakXz9kHPABNDGrbu+41zHiC8McNBiLkHpFJHcaJfx2pxWnnz1Y5
         VPVIfpMzyGYkARzHuipmRY+0wstOB36A1As7Y3yR3NPad+aTS+uH9XspIPOrWqcMDr99
         iEZOG7CXkUtZMN8j2/yplVNf7zV4U4NV1Gm9EgciczU7TdApof+9JV/GE65zb7zUc83s
         42uw==
X-Gm-Message-State: AOJu0YyzmJ3Wozz8JsxgryNzRmH5rwh83QbwlidRAikuQYAfb7qvR2io
	9jDqJBs8fPbv/UCpUrdqcKVO/tGRTR8QfkCtPhY6eqDeliCdqCO7R8o9dPuuwW93qoyYqKruuzm
	mcxgzK9J9B0ckL6r+OAlG9SxMSCYdSBMnUkA1zyKr9IllJhnhuKD/c+c3kagpO2dlvpPBRB4i8A
	==
X-Gm-Gg: AeBDieubtVuHzJDsbpTAvLXplFR9BjhIVYEAUYR9u2dG8D/beXRgDDy5xHKPKRBqKcp
	fS+yEmEeWTTOErZWx6ijzNnCQcwH23L0WBxbxpjQH8hyPdnYNk0BQwzoRvaLX7iXPZ4rBMDSLZ3
	IKdmMlCQ2LCpnDytExQJYF9HTg898MYSNfomJZPCYx8X6u1tGqPRf/fgxC9iLoUwon8nIjiMOxA
	/tCTaPu+5MlEaRZOz75VFqqwInJEGRMSqdKtNWFBwcr0nRB057RBVi2O+pvE5pSBKdYYTclVxDg
	+tgkWrg/wRvXDJ4qNrUdOp21f6P7Q20GiqkDZapyHwZEjRq68TxiFlnVw2PPPpbXavv5hKyNWGn
	1OAuTGI74p7M3kn9bcZb6mQzgjWnETIO0k2B1g/Ulhud7Bio1lqeSAWmKX8WEb7E=
X-Received: by 2002:a05:6a21:3399:b0:39f:8aaa:face with SMTP id adf61e73a8af0-3a39c10bc91mr7560456637.1.1777448666965;
        Wed, 29 Apr 2026 00:44:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:3399:b0:39f:8aaa:face with SMTP id adf61e73a8af0-3a39c10bc91mr7560413637.1.1777448666535;
        Wed, 29 Apr 2026 00:44:26 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506858sm1155848a12.24.2026.04.29.00.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:44:26 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 15:43:55 +0800
Subject: [PATCH v5 4/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-enable_iris_on_purwa-v5-4-438fa96da248@oss.qualcomm.com>
References: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
In-Reply-To: <20260429-enable_iris_on_purwa-v5-0-438fa96da248@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777448637; l=2709;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=p/8Ia+hgACUnCJiEOKz2KDkUiywwxeTKUp58FnW6600=;
 b=Gp/4tUPyrhtJpBSK4LylQlefwHoKOEOZvpOij9A5nugDN0RxixBEu0wfAiqYlDEYqYyvYTduN
 Hk3kFShz/5zC9i7SM28NrI7ktDvo0FDDp/4uk1QhcSWaySIhq1y5XB6
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: UJBHe7yyLPMCtDlqilg7iOept-NXg6sw
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f1b6dc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4TMTxM8xbnWuMOlFmbIA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: UJBHe7yyLPMCtDlqilg7iOept-NXg6sw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA3NSBTYWx0ZWRfX1pA6EyLvTr9Y
 FvvTf5EckZrmfwNkYqdR9glfVAuuYcRdl5puwoybiPtEf6THye2b1TLBC5ViZk0jf9SrmIBMHTr
 ly5W+aIVX+vtZDVcum5VFuzM/9yjql4OxvB4J55gwm4aeWYaMNAUFO9TsYt278koWcoAD7V8te6
 J8vNPpTqk7bBFw/ly23TCq31eQ2YzFZ6UMhLmMt3A7V3T5R5BjDwKIBhBSUcCYIJZhjYdVGv0BN
 MRSwrylMa72fUXDzJaUps6d0IGmWlBs9u6JcWlGQaZAO87NmeRhW9XVUvIwg3diul8cEv2O6zAe
 qKBgyIPZ6nzKbcC+shvykhrQFZR0u6Qo/0IZvh4HRWaSglS/rC41KlpxyPtETESh1/yM9TflZ5B
 ySIq+1dWPJDJ+1dwfILI0YlPxg0FuR+M47bYvwrdkFalb7lvXMBdxi85F8j6dE328SUdzM03w+1
 CjsFDqmj4roJl/GcrJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290075
X-Rspamd-Queue-Id: 35DBE490B00
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-59938-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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


