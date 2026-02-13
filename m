Return-Path: <linux-media+bounces-52729-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDy2AIYlj2lNKAEAu9opvQ
	(envelope-from <linux-media+bounces-52729-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:22:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 715ED136537
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A803306072F
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 13:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24D436073C;
	Fri, 13 Feb 2026 13:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mZT+vRYk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277E730DEB7;
	Fri, 13 Feb 2026 13:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770988891; cv=none; b=UwEbcHOQZ6R0oKhmPvpCHrDcbuD9mhKpiNhfm0x2rJg9CWEQq2qVRnCNx1/BitsAE1m7VLDZbsnQl9yJSCGXyGGz1XzpkTz4VCo0jP82WCf5gUpamnJVzNNjBX9BvCscODQAf4maTofcU4sGwFl8n28r4h+nX74wZ+oQBaG4wBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770988891; c=relaxed/simple;
	bh=F4aFcvfNYZTbs5ywtSD4gg1Yvr5uIfitcxlE4+F3iEU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jX2i0khJloZ+NJacyk+vYCeV0bBnfCBydKu+20sDLCuaddhhO98JOZL8Tw+CSBj6I2/YHce6T/YUsPwtVVyTm/kgGZ7wdUCD1enFx/t3mPsWtl+bAEznL4DUwwQ6b6M/GnF0FHH4Bx+w3WTkYrP4iyjHwbatRwij+cV62T1gCNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mZT+vRYk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DACENB3259044;
	Fri, 13 Feb 2026 13:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Yinge5czc+yAYP7fgynAxd
	7X4/E791Hkh5gfsJ+xqyU=; b=mZT+vRYket2ii7d/6yDysEsTZb74kEJnN6mdcI
	43AjcqaRjqDc20ABUFjoGzIz1OCgZycKXX5Q+P4aunaeQ76ng/AkqtqJhivPRNkz
	zyViRoxeUzd7Ic83rinzfy6IsWOZmLSbEy72osvQVoXo5tloG4n/j8rwQ0ikfLVX
	n1J/TFvGt7z80JSa4V1ZO2KZt2AgETD1qgOL9r6vjkvC8/YTwsPeomWEmUwdqhr6
	ImPNBrRsGYAyq1hKjKrGDY1SPMrFGLv6e2B8EJZ+xsP7jEcJO/yhGrbMYY7PTETH
	FITDh2jWyFYqmvfISYUoS04WZ5fErmaRfB6PxERGaprF673A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ptv2vna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 13:21:24 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 61DDLOPJ005256
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 13:21:24 GMT
Received: from hu-nihalkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 13 Feb 2026 05:21:18 -0800
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <loic.poulain@oss.qualcomm.com>, <rfoss@kernel.org>,
        <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>
CC: <quic_svankada@quicinc.com>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 0/5] Add CCI and imx577 sensor support for monaco evk
Date: Fri, 13 Feb 2026 18:50:53 +0530
Message-ID: <20260213132058.521474-1-quic_nihalkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: JS8Ilk_cv5R0P2E4qG6HX6Y1CKA9kU4J
X-Authority-Analysis: v=2.4 cv=eaowvrEH c=1 sm=1 tr=0 ts=698f2554 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ETi28isEjJcgAAb20b0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEwMyBTYWx0ZWRfX6mn+jeaQS94h
 WRcmcQFoZDcdLlt9INQG8Y0ypkGMNA+e0n/x3zLXHy4sh2HY1a9SJjwnEtTla0aHPnG5EZe3oCH
 pRRWQkpQ9JFIJsRMonqo6Bn0U1U5LFs5HRARwJDbd6i+Mg9Gx4cRT7GnwI1zqpk1IXiCmVYDL6w
 92gck/cGFOENCPGoi+apwDaJ6pUgFj0YvY6G5sdznSkWslvuRXvCxM2KASJ8ZlM1+3F2kMtZV2D
 tytnewzGha7hIW8KOl24/cMMBvTTdwX33zIJAXaO5LB2HDrIVOjgmgqpcdcmIJWiYsG1G0PGp5P
 rXTAc3FfzLir0S/SiIQ1Orx2plO9gEoX56giPzZmRMnYCQasGVbY3g5oFK5E3u6JI7Hn42+Wnq3
 aPOBnM2EvXDWXcRw1QV1+snWpnDhNnF6iQW7DsE89QGrZVVqlGQ+s7dUMec//DjbNml1OqfKvVU
 Gnotuuy9U0PkYYSLpKg==
X-Proofpoint-ORIG-GUID: JS8Ilk_cv5R0P2E4qG6HX6Y1CKA9kU4J
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,xs4all.nl,oss.qualcomm.com,vger.kernel.org,chromium.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52729-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_nihalkum@quicinc.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,quicinc.com:mid,quicinc.com:dkim,quicinc.com:email,qualcomm.com:email,checkpatch.pl:url];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 715ED136537
X-Rspamd-Action: no action

From: Nihal Kumar Gupta <nihalkum@qti.qualcomm.com>

Monaco EVK is a single-board computer based on the Qualcomm QCS8300 SoC.
It lacks a camera sensor in its default configuration.
This series adds CCI support and enables the IMX577 sensor via CSIPHY1
through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl --reset
- media-ctl -V '"imx577 3-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video1
---
Changes in v10:
- Fix DCO chain - Krzysztof
- Fixed build-process warnings reported by Rob - Krzysztof
  Rename "cpas_ahb" to "ahb" to align the DTS with the existing binding.
- Added regulator-min-microvolt and regulator-max-microvolt properties to all 
  three regulators - Vladimir
- Link to v9:
  https://lore.kernel.org/all/20260121183142.1867199-1-quic_nihalkum@quicinc.com

Changes in v9:
- Added i2c maintainers and linux-i2c mailing list for the qcom,i2c-cci.yaml 
  dt-bindings patch - Bryan
- Rebased onto the latest master.
- Link to v8:
  https://lore.kernel.org/all/20251222095914.1995041-1-quic_nihalkum@quicinc.com

Changes in v8:
- Removed clock-lanes property from CAMSS node - Vladimir
- Changed data-lanes property to <1 2 3 4> on sensor node - Vladimir
- Sorted regulator entries with respect to the pin index - Konrad
- Link to v7:
  https://lore.kernel.org/all/20251216062223.2474216-1-quic_nihalkum@quicinc.com

Changes in v7:
- Define MCLK pinctrl definitions in monaco.dtsi - Konrad and Vladimir
- Define fixed regulators for camera AVDD rails in monaco-evk.dts - Konrad
- Link to v6:
  https://lore.kernel.org/all/20251126081057.4191122-1-quic_vikramsa@quicinc.com

Changes in v6:
- Fixed ordering of property-n and property-names in vreg_cam1_2p8 - Konrad 
- Moved vreg_cam1_2p8 defintion to monaco-evk.dts - Konrad
- Removed description of pins with MCLK and Regulators function - Konrad
- Added pin hardware description for MCLK, regulators in monaco.dtsi - Konrad
- Link to v5:
  https://lore.kernel.org/all/20251114064541.446276-1-quic_vikramsa@quicinc.com

Changes in v5:
- Rename cciX_i2cY_* to cciX_Y_* to shorten the labels - Vladimir 
- Added description of pins with MCLK function - Vladimir 
- Link to v4:
  https://lore.kernel.org/all/20251015131303.2797800-1-quic_vikramsa@quicinc.com

Changes in v4:
- Remove the AXI source clock from the CCI node - Konrad
- Updated the qcs8300-camss device tree binding.
- Link to v3:
  https://lore.kernel.org/all/20250917130647.1701883-1-quic_vikramsa@quicinc.com

Changes in v3:
- Updated and Wrapped commit messages for [PATCH v2 1/3] and [PATCH v2 2/3] - Rob
- Link to v2:
  https://lore.kernel.org/all/20250912141134.2799078-1-quic_vikramsa@quicinc.com

Changes in v2:
- Remove the patch that adds PHY supply documentation in the qcs8300 CAMSS. 
  bindings. This change should be submitted together with the qcs8300 bindings patch.
- Fix indentation and regulator node name - Krzysztof.
- Update commit message as suggested - Dmitry.
- Link to v1:
  https://lore.kernel.org/lkml/20250909114241.840842-1-quic_vikramsa@quicinc.com

Used following tools for the sanity check of these changes.
- make -j32 W=1
- checkpatch.pl
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml dt_binding_check
- make CHECK_DTBS=y W=1 dtbs
- make CHECK_DTBS=y W=1 qcom/monaco-evk-camera-imx577.dtb

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>

Nihal Kumar Gupta (5):
  dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
  arm64: dts: qcom: monaco: Add CCI definitions
  arm64: dts: qcom: monaco: Add camera MCLK pinctrl
  arm64: dts: qcom: monaco-evk: Add camera AVDD regulators
  arm64: dts: qcom: monaco-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../dts/qcom/monaco-evk-camera-imx577.dtso    |  66 ++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       |  63 ++++
 arch/arm64/boot/dts/qcom/monaco.dtsi          | 324 ++++++++++++++++++
 5 files changed, 459 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso


base-commit: 132737e360b4c0daa7f473faf0f55cb04ee3e15c
-- 
2.34.1


