Return-Path: <linux-media+bounces-52733-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPooOlcmj2lNKAEAu9opvQ
	(envelope-from <linux-media+bounces-52733-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:25:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 684231365EC
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF99B30F5777
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 13:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27716361DDE;
	Fri, 13 Feb 2026 13:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZjOoJL+M"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783EA36073D;
	Fri, 13 Feb 2026 13:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770988915; cv=none; b=JmsoXblmmwJrCGQxPFFcfPfzJzbTMEo5hJMTWTECODYKWiy+A/uc/cy604wx58QysoIDEFd4BtPFmWN9E1nqFAvfRiBr19Dj4JshYD3tns5sPs6tFETx2aZLXdYEAYMB2YRWbOm1EOh9weUWxxaPVuHmveToDDaScp+drhKYYAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770988915; c=relaxed/simple;
	bh=pd8WkE6/yMIfykvW3Ur0jroLdqxCzEaiaHt0j8DiImk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mJ2pqnvsPwoHuXpDggMFSCtgj6ZXWzZruYODajFzs2LfnFDA7Hn81zElfKO3/D3/ORrWLsfDvrZUAqB7zYAuMhInnrTPmDPg7jMfHsRUmrWCd0RD2W5yuSJs5V1+A9AvdtN6Jrz+JFbtMpYGUdRRNrjBJd/bj38Bl/M8KSUIVaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZjOoJL+M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D7r5a81642266;
	Fri, 13 Feb 2026 13:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VNmYPUQ1Beg3xyuEY08al6EAHJrIotyUSx2B1TIL+3s=; b=ZjOoJL+M81J6Y/eP
	I3ywLHXlZ5W1o+ManPXT26HYeyHkky4DcrxmV0ydojaecSMvk60nqefwx4+DPBR3
	nbQwfpFuut+18VSy9T4H7y+0FdbVl3LqhY4hMGGoQX32gnxSukP6XVA8oOXljZoW
	1GaPl9XghKFbblMwK78kA8UJqJHNRjuB/531ydc22OmyZ8fXStebGyt39WdGwEub
	Hdzlv36UM20HS/eX3ItI/AFmn/H8v7sIipJMmzo73HMfJOqpANl2UVu37r33yxz3
	oTprOg9NTtzDR8PQaEIbfqw1T30z+gpgewHOmmDvok7lVW0nSLt0y0Cn9JHprWMk
	q6HT0A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ptv2vpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 13:21:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 61DDLnUR003869
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 13:21:49 GMT
Received: from hu-nihalkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 13 Feb 2026 05:21:43 -0800
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <loic.poulain@oss.qualcomm.com>, <rfoss@kernel.org>,
        <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>
CC: <quic_svankada@quicinc.com>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v10 4/5] arm64: dts: qcom: monaco-evk: Add camera AVDD regulators
Date: Fri, 13 Feb 2026 18:50:57 +0530
Message-ID: <20260213132058.521474-5-quic_nihalkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260213132058.521474-1-quic_nihalkum@quicinc.com>
References: <20260213132058.521474-1-quic_nihalkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yN20NBe-e_ZrowAPxKDQb2wEyQQWHFn4
X-Authority-Analysis: v=2.4 cv=eaowvrEH c=1 sm=1 tr=0 ts=698f256e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Hb6zVQicbaT5ZpT1lQ4A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEwMyBTYWx0ZWRfX8yfzE9rL0JyW
 Pa/8E882gQOEZxOo/nr77+ktr+o7RU9855OilckDJ77ZTH/62MgIeft6ftL0TBXzxLAYUBS+HEp
 b301lkap4i5T9RML85MYIgsSVqX3GINyfQwYz10MKmoCwgzv/V/hxL95DQex6oaDM+Yzdr0HS1W
 bkkxebUD4oCk1AHs7rYkU6ZfuqR34O7yt3OwCmKYZNszxZq8YQ7mdvXQxlu/+p7ZOhxo72kszD4
 JKTykwHtyc4T958w8Xo2r1mt+7JrCDUxCaFATIxqd9L8m+SKVgEwNo6QL+LZGi2RmvwU/lmRWCi
 fcEFlFIt+rshadu2rbcA8czFQCxnM+OVexXRkLHB3TZaIc/Lti51Bxgw0xl+EYAZ0NCYUNDiKvz
 1flppmqEAQM2yWNdzQRf+/nizTNo+AB1ULGV6kGSRqEZEvvZwLdqlRkynQF7o7CflhAGD23w1wg
 uNYj7J/qeY9mnKV/WOw==
X-Proofpoint-ORIG-GUID: yN20NBe-e_ZrowAPxKDQb2wEyQQWHFn4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_02,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,xs4all.nl,oss.qualcomm.com,vger.kernel.org,chromium.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52733-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_nihalkum@quicinc.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,quicinc.com:mid,quicinc.com:dkim,quicinc.com:email,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 684231365EC
X-Rspamd-Action: no action

Define three fixed regulators for camera AVDD rails, each gpio-controlled
with corresponding pinctrl definitions.

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 63 +++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 565418b86b2a..bfd727c745c6 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -77,6 +77,48 @@ platform {
 			};
 		};
 	};
+
+	vreg_cam0_2p8: vreg-cam0-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam0_2p8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		startup-delay-us = <10000>;
+
+		gpio = <&tlmm 73 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam0_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
+
+	vreg_cam1_2p8: vreg-cam1-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam1_2p8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		startup-delay-us = <10000>;
+
+		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam1_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
+
+	vreg_cam2_2p8: vreg-cam2-2p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam2_2p8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		startup-delay-us = <10000>;
+
+		gpio = <&tlmm 75 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam2_avdd_2v8_en_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &apps_rsc {
@@ -564,6 +606,27 @@ perst-pins {
 		};
 	};
 
+	cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
+		pins = "gpio73";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam1_avdd_2v8_en_default: cam1-avdd-2v8-en-state {
+		pins = "gpio74";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam2_avdd_2v8_en_default: cam2-avdd-2v8-en-state {
+		pins = "gpio75";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	qup_i2c15_default: qup-i2c15-state {
 		pins = "gpio91", "gpio92";
 		function = "qup1_se7";
-- 
2.34.1


