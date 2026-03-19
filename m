Return-Path: <linux-media+bounces-56313-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNSbB2LBu2n1ngIAu9opvQ
	(envelope-from <linux-media+bounces-56313-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:26:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B58DD2C8A14
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 10:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85FC7303A4B2
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 09:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA893BA253;
	Thu, 19 Mar 2026 09:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dOsDohoc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fxfi3qZ2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB793BA22F
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912262; cv=none; b=QAr5AZu0REBClnz9zxiCECPnrHGZsC7YM7AGdPhD4s8iWi+G/SI9ofCfsEGtCIEWXuyMYzDvKJhPJzBFqdcwtCfhpk5MknVkU1Us6pIz1ersU0hrKAebtLwXaVxvKY2eyamh1QIro2j+aix4qPe94MtpKpro+1hl2iSGIfBTBDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912262; c=relaxed/simple;
	bh=Zg9lmcifY79a8Un6AZk/xfMz8WdGCWi9sZcIyDdPApw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VjaFYAb5Wk5XG0lJAm/5gEc7Ryn7/whVpadKjjmJSVOsiSLfGrmdJMCWSYS1ztlcPtzmqDywuqReXXfAQOqfmhtZEq63QyOHEEjn9niD6ZS7/P/TF90g6ynnD78vJK538CkENZ15hzOAqG4DgwvdGOPrZgFwzEEzdziD3UXx96E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dOsDohoc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fxfi3qZ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73uve1770603
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EO53ulTur0o31/KzMiAB1NJVdCgiA+KDt8dS3rNnu2A=; b=dOsDohoc/7kwtkhG
	oVSBMO/MvmEH/7YoZqsqZSR6e4wqu9wAg+YgFUyw8OR5rJB/1iNB6R2wPoSpvNXb
	7ci3dul4Wdndtn4dPmf99LShcs7bOUO31GJFWfcz6KkiAQbfWrsn2hjPvY+N295w
	iUpK1/v3y1CK/AVsBoQB8H13WJJmteK/BVirmxxkK9BfoVGe44/klQew9LWgIrhK
	GBv4l9eu3+SzwdYQ9E3IXSqbIIc0wtBrgpOx3tWUIHZrlRzUzAFwzA8exYRX/gpI
	KEI2uAH2Q7tXe3I8ybBmn2N4ffv0nkpzM2NMecmTWXG2ule7GDFKqh4CKUJOqyiV
	e7GSWA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75tw5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 09:24:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b05d170cadso16763505ad.0
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 02:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773912260; x=1774517060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EO53ulTur0o31/KzMiAB1NJVdCgiA+KDt8dS3rNnu2A=;
        b=Fxfi3qZ2CpZ9jyrjm0NTwIpFK1YQ3mKSqB6fQsrc75RMdqAG2ancgexphY4Mq9sD6q
         n/8mTZ9IGIZXDehUAJXgOQOq4WFsdnYPXaCczRe4cUWlrvjjaTdCUA2UDS7Pxppe1hpD
         VAF9DY7ekBdRzQlhdSVw3HRTMwcsfOOi49mJZ51R61OIPbz9muBP77XheY2x/3TKHWyA
         QxyXsjV+QZEACgEHxQs4N9Agj75P4HPAOKFkY8W0puSi0UsVva4UgJy/ERKpDTg7+WBB
         MBAMXKcwm7UTgmKWX+7yoHFwFsMlkXjo3kU+4H41ik0P2f1IFh+v6Ajih6O7h7zK7ycR
         rTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773912260; x=1774517060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EO53ulTur0o31/KzMiAB1NJVdCgiA+KDt8dS3rNnu2A=;
        b=BGgtbbXBzdNVq1L37FaMPEcoYwxmGvDQQN+2XIcCtVRj2HEHn/Tswv4jvsnoZKbtLI
         GEDMM0PfM1Jfr/WSwrGzYIV8tbBJDt2EbTD80Zrc1liXnwEHPHQK+sZXv8zQ/Mm/TwVY
         pIgZCTsA9h8+7C9jwt+WU34H+FXBOf0TpklhjmQJohh+XexMfdzflwsUyW68rP3B/lpc
         tcclOONptpyJDYEV4IUy02KIhTumyZEuOKCzTrNNUYjVeLhFGBAAzMdBimgVYcAtOh2m
         IwlDKpCbNPED7PpZgpLGuDgAWmFTV0fXrymbCzdBSR7dFaf0GEOeUgXucHPDYg4jcLTt
         xp+w==
X-Gm-Message-State: AOJu0Yxu0MQkRvSo5b3iVXM/3hnYMDwxGiWXD1RrYpGtic3zFHqTL6B1
	56AZfFNAkpotqHcJ/MDnNpGaaVgdqf7a0DsylrwP0WwNNWjp1mobRDc4N/S/pzn2/vEgmDNPYD/
	7OZVDFEWud9BujwxNCustbXOEPnH6ASKekLJ07EwD1A/27L0AjqDvKQVAL0BjVcee4BF5SEwP9y
	X6
X-Gm-Gg: ATEYQzy6jPBqhBJI52d9b5Bfzaw+tGutHCzLSYPxOUZxe+HenoKAgxF9ERl+F2CrM7p
	IkmWVsWnBnYZSlI9euMeRTkO6WEw/5ygx4WvPayN/KvoKKcHU/zJJzb0OOxne/A23FwBDuvouPo
	mfLkz6Pq4OFz7Ejb9sV/RQjh1i+6NiNdASMHEX5JVr6xuU51kgYuTSfQ6j+09bae/5GNwFNAw0q
	ASkUgRmdximz7WAtLYIVxn1CBriB8Jm8/j42WeN8qVxZDdWqmQpnTkyX7kJcwVVyar4i5lSHtfX
	C1oirjpN9i6CwqGWky61aOjjPiSp2eqkXJWfdBPy9jKsNTFm5HhJbqTZhT3g3MBQsU3e5T16GHS
	MIjXMyrZ1haShvIigZ4cYUXaFV6u5SuqksDWqct+5qvDbtnMrJPREBSKPB3FlzfGp/CzaLwfLw2
	TPpqQI8oLc4d+I/mFbcDqk
X-Received: by 2002:a17:902:d488:b0:2b0:7224:a4f3 with SMTP id d9443c01a7336-2b07224a794mr50449175ad.48.1773912260100;
        Thu, 19 Mar 2026 02:24:20 -0700 (PDT)
X-Received: by 2002:a17:902:d488:b0:2b0:7224:a4f3 with SMTP id d9443c01a7336-2b07224a794mr50448825ad.48.1773912259614;
        Thu, 19 Mar 2026 02:24:19 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0704ccc67sm48391035ad.15.2026.03.19.02.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 02:24:19 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 17:23:56 +0800
Subject: [PATCH v3 4/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-enable_iris_on_purwa-v3-4-bf8f3e9a8c9c@oss.qualcomm.com>
References: <20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com>
In-Reply-To: <20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773912238; l=2376;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Zg9lmcifY79a8Un6AZk/xfMz8WdGCWi9sZcIyDdPApw=;
 b=I1cgFYZ+2YvTyTDP6Ajnd3ex7egSVeNqJMYa+i69pzV0b4YoQMcQ/k/HjaeAvGr44a5SgGb41
 29dQ5VOgSrXAMYfeGW0lHU6WUu9U2kb+m4ZLTbdBmoSIRMEIOjJqc5L
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3NCBTYWx0ZWRfX0wJ7ysA0v6+z
 z1gKs/s1Qmb9Gvgo9rrz39k1ET/lT76R43lZ2IuQxwEMk9GoaztCYsiyznyWXR1XR+rKwVFFSLq
 48eQl1xNjSfiTxeLxUtzYKfVv5mIAqfLIJVyR4sxozbJXmaoQ0IPrlrZrRSqdGV4oVR7xd8EXFc
 youm5pwI5KRx8SPFccXcJ7uiCIcE19+g9FYMi3ekLnwpXHA5yNjf1Qlv+aHvjsUiR/dMRFV0K10
 7J2e0oDwAkL5i1q7vzHYkC+KrZeFxWj3fIqD6KWAioFVEYPtj9vkK0gl7kVZSwIstumZfYyPMYW
 xLQHL39ptir/NYZ6ViIlTiliTaz6Ka0XDUO7OWRWc7n5EWB6wGzZp3h8VduK0RQk4j24q3FLN6U
 KWN01zWLSowxKQ826Ga2bnEZ/gu4gAKLc+FRXAQDb14awKldyNqePYBjBj8GfcnuRisgalsFU8b
 jT3VBguUqH9VzgrlnzQ==
X-Proofpoint-ORIG-GUID: gSsJChkD0YtQJHmfOoiBhpvS1yyY7CZH
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bbc0c5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4TMTxM8xbnWuMOlFmbIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: gSsJChkD0YtQJHmfOoiBhpvS1yyY7CZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-56313-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B58DD2C8A14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


