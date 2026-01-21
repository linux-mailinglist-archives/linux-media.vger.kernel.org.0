Return-Path: <linux-media+bounces-51294-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAmWL5k5cWnKfQAAu9opvQ
	(envelope-from <linux-media+bounces-51294-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 21:39:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D5A5D6E9
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 21:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C937B7E3279
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 18:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1D73C1FCC;
	Wed, 21 Jan 2026 18:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="owgP19BC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D06341077;
	Wed, 21 Jan 2026 18:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020359; cv=none; b=hm3Ur8lEpyd+TPZrIKw05YJ52btuCGGZ3MvUNqunM/OIQRndOy94zwN8E7mxfafHfcZ0NenbaaFZypobv6PkCf9gJU7Zzn6xEcVb27dnxgHW8J1VpKEH4PKqhWSI+wTbZqkMtWAcL2ypjHcj6PmsAIZxS3XQdOEQ7X4JxnE4YFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020359; c=relaxed/simple;
	bh=Ic+OJzNvpElvh/ZOPgr0wb3gNN2umGEsKLMv0SviAqM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nff+br22w7mjwAArnU2rOtN/iqtoKHoXZEjD8x75fPUVSRuBipzoxd4xzoAE8lQB5xmtopnhsjOuj2dQfqqK18GHvFitTjX/pUmCp8+FkvT8rWHDkEZzVTscOy7J/cBx6K8+D4h6GrGSOHOx/OtzhxJa3bVyDQxyEVoQcltSZjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=owgP19BC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LI71wm2452389;
	Wed, 21 Jan 2026 18:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CRiEcc9HdWvBzNC+YmvdTZHKmtM4N5iTe/YMrSNOU/k=; b=owgP19BCVMrCS4w6
	hQtZYBsSjemSL5WJT3CzhjgaVyqXe7ajucSGp0esaMKW60hfb+G1w6mZHKQOF6Za
	PmaCC+OL/t8M5NnE+WYAoP7XKMTkFOrnEVlLPdRqiXvKTmmH+r1f8ZvUNTBO5wrO
	TkvDoWXq0ggVX8EqFUZsgthVgAUsdw9xj2oR9dn2CVBi8HYD6g03dJHq5QtWVSvT
	TBHlLa2m3iCpESZYA9WcuHdmvejIUdWIJLfQjzeiIdP8nYkwmFRl2dTjqfOrovs1
	u+UfJZaNCXI7IOLdy1Mdm026IbQLZe2ySIngblVw3qG0v40GjSUD9LzRErGZ8pzt
	oMVhnA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btvhqhpc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 18:32:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 60LIWWWY021133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 18:32:32 GMT
Received: from hu-nihalkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 21 Jan 2026 10:32:27 -0800
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <loic.poulain@oss.qualcomm.com>, <rfoss@kernel.org>,
        <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>
CC: <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
Subject: [PATCH v9 3/5] arm64: dts: qcom: monaco: Add camera MCLK pinctrl
Date: Thu, 22 Jan 2026 00:01:40 +0530
Message-ID: <20260121183142.1867199-4-quic_nihalkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121183142.1867199-1-quic_nihalkum@quicinc.com>
References: <20260121183142.1867199-1-quic_nihalkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE1NCBTYWx0ZWRfX9JB8EfuVxJg2
 KF/BGccvd4edTm4DeN51/KfzByfOfQ9he8j6E/9PRAXxKZXphqlz2K9JPAdpF++4Z4V3UwW9mIc
 ULC835VWUNVblBeNhjgE583YyXqZma/mQhiMzmkWye58pZEqUETtzvXLOMmhOxQxoehiii1FxF8
 bKC6bMn/rWLyZMFLKXcvxWoWRmgOFvSKnAux1S9WclMwAJaB67FgnEY7Mae7OjTOxnorjmTv9pP
 6oaRTQJ0srXltj+F078a+QpaaiNYTaDAEGU0QmFlEdkBfn9/xhi4rP5jBSAmM0Ck5LYsyGs+Srn
 y4g9ytFVgls/zSw8bOE7rVqeF5OKQONyT+HO2Q8MvGqXEduE4TSAMJbOsq78Olh/8K8isJrWDEU
 QsO3fuLdb9tRFLG3FTKAkxvbB+/5u5l3meRie/iApWdultXxbi0oY79yzCaE2R7I3aCZrlingLm
 Nay93ToBjPMY5eRB+pg==
X-Authority-Analysis: v=2.4 cv=S5bUAYsP c=1 sm=1 tr=0 ts=69711bc1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=tfCBMw9KTM5U2-pTabYA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: PfX6rh2bURhkpm4DvaXRD_13f9gcBRfU
X-Proofpoint-GUID: PfX6rh2bURhkpm4DvaXRD_13f9gcBRfU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210154
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,xs4all.nl,oss.qualcomm.com,vger.kernel.org,chromium.org];
	TAGGED_FROM(0.00)[bounces-51294-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[quicinc.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_nihalkum@quicinc.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,f100000:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,quicinc.com:email,quicinc.com:dkim,quicinc.com:mid,qualcomm.com:email];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 81D5A5D6E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Define pinctrl definitions to enable camera master clocks on Monaco.

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 634337611012..0c0d7fa09cfb 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5987,6 +5987,27 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio67";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio68";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio69";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio57";
-- 
2.34.1


