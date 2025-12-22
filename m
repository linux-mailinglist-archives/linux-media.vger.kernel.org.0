Return-Path: <linux-media+bounces-49325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87774CD56CD
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 10:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7960F3027A7A
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDD130EF7C;
	Mon, 22 Dec 2025 09:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ap+QPzqs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E9D221265;
	Mon, 22 Dec 2025 09:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397586; cv=none; b=su+5sRpu0zt91c3KZ7CTPokPlVdzuuHgCRBT+ih8xJmjefYvGaQAWTGS+2g1lc/fr0czJJs0azaff94tO7hbRDS9gqHhzWTq+hws/xx6weirNUNpbFlR+La1LK896VgS1YQDmMGDUXd5gBndO01BmyHC8u/koPKRylF1SEF+Hug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397586; c=relaxed/simple;
	bh=Gnibut1uyhoJUrX7xTKQHUv5ef1RlyUZHh/qWfpU8eQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Esl9HsJ5eon/xAU2LS8J/if/8OzymPCV7Jn4L4sSEG9LDyeaitclEUl1RGBWzUhZOCIAOADLlbwRxMab+SeaImoDI3YmnIy/zV/a+B/nKXw2Tlc3W0ES/6YTH5Z/SdoGNvIYvMXIUbdhugY2mY/Fvm1Q7FR3A8tjxkmM9JYLRHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ap+QPzqs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM84YT03755813;
	Mon, 22 Dec 2025 09:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BDj0M16a8ef1twSbxJFBtT
	JXW5/3MfLFH3V5iRZnthg=; b=ap+QPzqs8DVpmyiL4CooSsJdHxFoET1/guRlaX
	/NYFbvxAbNJGSGax9ZLxTXDB5qiEISYtA83fSzxXX86kTYWHqurcZWijrNaEAsIz
	N1Aum7soGcujW4EYnqnZfV4ly70RG4auZmHl1QsvsJehgQm3nNynYUrAS0tBSD0m
	qN9efrQShsNcLmeBnBXTd+5j/9msxPBk7UY7I5I+UfP6sw5tHrBXvZx+Cc9/ZzKe
	jLh7/PTwJtHUb9cJIgK8uNIAe021e4TPx8VVZ7Uu81V0O3hUKkTT4kTySSieIbzQ
	RMFtn34tggij6dDfnHT9rQFRBoJcaBsi93T4CZ/QwXPk2OVw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b69ahjvch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 09:59:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BM9xXNs020918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 09:59:33 GMT
Received: from hu-nihalkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Dec 2025 01:59:28 -0800
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 0/5] Add CCI and imx577 sensor support for monaco evk
Date: Mon, 22 Dec 2025 15:29:09 +0530
Message-ID: <20251222095914.1995041-1-quic_nihalkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Authority-Analysis: v=2.4 cv=JuH8bc4C c=1 sm=1 tr=0 ts=69491686 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=8Klq50kBDcst_TYr8YYA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5aUPeaqYQhGnfxyrqRFFopy9K0TcsW63
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5MCBTYWx0ZWRfX2XtNuz3giO3J
 KfFQ7AfTmNEI3Z3msOzYEJUgmYt6/bmVqwiE45UYg56f3OILagMEa+y4PWOASdLfiS1ZIsAeiY/
 +md1a33cSOgUYnQ9+BFxa/SQr31BiCd3taDj3OYee6+gdwT2ebwoP+wjkdggJg2L8+aOcVQ02U9
 HCGKNgW71ZUWeGv2ELdUUztfbs5X45YQ0oxADNIR2RMCu8HHFaVNQf8VvuU8z6vrZNCRh0LeDw/
 rJ7HAJjDF/5VaUzWpQixzUZu1kxy+XEYTljPjhjCklJSxHmO9XYpUGkNYZagUAgT3K9UNQ6fuF8
 500l7anOtf+45+yjRjTqmKtt0ZjyUHy3jMPNrFxwg76cui/SF+iRLsqDtKVR+gZy7jFTvU/bDvi
 XtdlwpVSC/+avF1yRUnZxqSkVfj57UJKBAo4fB/YXxPjvMb5wNBSpyUNbWXTfXXzFs8WlcELR8+
 5Zc6DeCB35SmPBzt8Qg==
X-Proofpoint-GUID: 5aUPeaqYQhGnfxyrqRFFopy9K0TcsW63
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220090

From: nihalkum <nihalkum@qti.qualcomm.com>

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

This patch series depends on patch series:
https://lore.kernel.org/all/20251107162521.511536-1-quic_vikramsa@quicinc.com

Bindings for Supplies are added by below patch:
https://lore.kernel.org/all/20251107162521.511536-1-quic_vikramsa@quicinc.com

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
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml dt_binding_check
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Nihal Kumar Gupta (5):
  dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
  arm64: dts: qcom: monaco: Add CCI definitions
  arm64: dts: qcom: monaco: Add camera MCLK pinctrl
  arm64: dts: qcom: monaco-evk: Add camera AVDD regulators
  arm64: dts: qcom: monaco-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../dts/qcom/monaco-evk-camera-imx577.dtso    |  66 ++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       |  51 +++
 arch/arm64/boot/dts/qcom/monaco.dtsi          | 324 ++++++++++++++++++
 5 files changed, 447 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso

-- 
2.34.1


