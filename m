Return-Path: <linux-media+bounces-32879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB02ABD281
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A50657B2E7A
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 08:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A054B266B6C;
	Tue, 20 May 2025 08:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TIxv0VX1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C263262815;
	Tue, 20 May 2025 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731446; cv=none; b=UcMMBAsIeGjMqdaR789IxSWFUsPO+PoJf0McXz3wrw0kOBhmYR2G+Y8yP5doT3p0XyfxdUr6PZiN8WZIgQbWKzJ2lqb3Xgs80PUfKL2WEb2wU1lr0Ljt8B+gCa+n/gQE6tVv0dDdiZuUWUEa+yJ3v4FKe1PpgNqRyl6MYz6ZOm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731446; c=relaxed/simple;
	bh=VHy0SVogWeHY2IfpU+OPOWiglTZ5eYL637S51TLiNUc=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=VaAER2NgiYKMWvIFTeW0b4MI1y6gNw6rHzOrkhy6CBaDC/kMNm7Cih0YePdnNOUF7iXtvcSZHv9wRH40SkrrWI/ma0zNSK77qIPK9NCNomqBBQCQj9RRfM3h/67sXoqf0CbqpOTI7u/efzTQUSmSwGBau8v4Q3yqfRsqEBdbbZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TIxv0VX1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K8RpYg013665;
	Tue, 20 May 2025 08:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F15XSMFY8hy5TUYxx3Prr5
	Oz1cZgvdXnfoeCEe3JgbE=; b=TIxv0VX17QwMpQM1ud+wBXcI1mSXnDWfo0lFk9
	PAtk181F1QpNaCVW7kxu5pL8FBmye0LdT3zLX2Nx1Tg643DQjkEn213W6RyfwOAo
	cnpA666kixwOArowF9Lo75nGOZa2JahBJk2Ij3rG0oDsst2yt2edyayJxusHXhPy
	LlxYaE7c6AqzpmyAflsGpcnfYyRj3+h9sTOuJ3ByEzG5ynq7QuRWXQ7z4mLPen9A
	5X3MD8gYkGMnTwgHZ5j/8NRvR/mYgfx5c8uekW+m1TkKauqS10qRjDjiGkCVBs0m
	/APOLiHADD4EpKIcJM+8tA9YRy/9ON+Xkebep9M/0BQjCSOw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyq8k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 08:57:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54K8vIVJ019846
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 08:57:18 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 May 2025 01:57:14 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
Subject: [PATCH 0/2] arm64: dts: qcom: qcs615: Add support for camss
Date: Tue, 20 May 2025 16:56:50 +0800
Message-ID: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANNDLGgC/x3MPQqAMAxA4atIZgNptYJeRRxKjJrBvwZEEO9uc
 fyG9x4wSSoGXfFAkktN9y3DlQXwErdZUMds8OQDBU94sjUuYBwPjJqQ42qGtaN2Ys9SVwQ5PZJ
 Mev/bfnjfD0dh96ZmAAAA
X-Change-ID: 20250520-qcs615-adp-air-camss-4109fc2ce430
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <bryan.odonoghue@linaro.org>,
        <todor.too@gmail.com>, <rfoss@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Wenmeng Liu <quic_wenmliu@quicinc.com>,
        <linux-media@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747731434; l=1411;
 i=quic_wenmliu@quicinc.com; s=20250211; h=from:subject:message-id;
 bh=VHy0SVogWeHY2IfpU+OPOWiglTZ5eYL637S51TLiNUc=;
 b=YAZQ1tZZbvbmL9pQ8EQS5NG9KO4jZK0h349Z1SdfVYJGlUOvwNT6z9XXlvyxbf/MLt+LD/K6p
 NFNYqz7dcyQAk3auYcQB0r25nkcYEyeErCTSRDgS651TL8jpuwasV87
X-Developer-Key: i=quic_wenmliu@quicinc.com; a=ed25519;
 pk=PTegr3w0f1C9dOSL6CUdJR5+u+X/4vsW7VMfwIMeMXQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zTUkMQLX6o410DHZqAGzGOVbhYKVIl3K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA3MiBTYWx0ZWRfXxdU81e8EkX9M
 FiSg9VDq+x6hlzRgF//fLjEbtUU4Ffnyvkvymm42Gm4jRC+YBReheEEmYJkaiRZwBwFaK1abBlR
 AkrmGV0ZiFFedABAJ3SjKvEokt58mttqiWuu7wEMXKN8d91otifmoDw6OPLR+ls9+Sn02hdpjxj
 kZjLv5YVVzuXIuVX8ranO8ryuWvN4beLlSjvjkarcG3iB8m7kxbmT72zE3X/KdrfsQOT1MI2FP4
 G0STkGOafOjLoh7EGcBqNNjmmZyZxP7a1ItDPS5FVZ2pKJzVLGE9/9EXF9qUR4jls2QuR1R05Ss
 N9drd1mQ6PRgo+fOzTF5as1zRKbH8bOND4UwYpFIRi4gYRoKyRrVidbTQaDERM7rDoLpgQheb5V
 jLxMgAyF3QbGweYKVDPpmJ5AiCv3sMtMxsN2WZW/iAi+F2DXrMUSjmXESzdLreH0I35EpjgL
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682c43ef cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=WuS4yPkh8SfIzpwGxFYA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zTUkMQLX6o410DHZqAGzGOVbhYKVIl3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=651 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200072

This series adds support to bring up the CSIPHY, CSID, VFE/RDI interfaces 
in QCS615. Tested this on QCS615 ADP AIR board with CSID TPG.

Tested with following commands:
media-ctl --reset
v4l2-ctl -d /dev/v4l-subdev3 -c test_pattern=0
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/1920x1080 field:none]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/1920x1080 field:none]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
v4l2-ctl -d /dev/v4l-subdev3 -c test_pattern=9
yavta -B capture-mplane -n 5 -f SRGGB10P -s 1920x1080 /dev/video0 --capture=7

This patch series depends on patch series:
https://lore.kernel.org/all/20250518-qcs615_camss-v1-0-12723e26ea3e@quicinc.com/
https://lore.kernel.org/all/20250518-qcs615_camss-v1-0-12723e26ea3e@quicinc.com/
https://lore.kernel.org/all/20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com/

Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
---
Wenmeng Liu (2):
      arm64: dts: qcom: qcs615: Add support for camss
      arm64: dts: qcom: qcs615: Enable camss for qcs615-adp-air

 arch/arm64/boot/dts/qcom/qcs615-ride.dts |   7 ++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 133 +++++++++++++++++++++++++++++++
 2 files changed, 140 insertions(+)
---
base-commit: 5840726e19bb6e86566a9fa68c2dc21ed64761d4
change-id: 20250520-qcs615-adp-air-camss-4109fc2ce430

Best regards,
-- 
Wenmeng Liu <quic_wenmliu@quicinc.com>


