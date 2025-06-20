Return-Path: <linux-media+bounces-35455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE65AE1201
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 06:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FACF19E305D
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 04:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578751E835B;
	Fri, 20 Jun 2025 04:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g+z/8JuW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D3118024;
	Fri, 20 Jun 2025 04:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750392496; cv=none; b=nIEe0i79jKMko3nStd04adupVxUtr+SMmsClOrOsLwm+RfYPe7VtzcteHGy8A0091mrkF6kvfAadMHvsb7sNmx7mNS0qYAezarpMf8k+7n/1/ID6xA5n2+4kMVDX0vlCp8Qlf07VMf74BhAMIkHFZeNGCUs+/zooRsFwiH3IkQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750392496; c=relaxed/simple;
	bh=7JkcwPGNxgH1LvLwJizKR2M15gLV4I6zqw4s4RwpCJo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FuFyzWWn5fIqRn84BCe0og67Iya3wbsds+iKpgk4OzjPTy0Ef2tB5jvRqA8dG+Y2rBcM9Qj8HJ/gEccVGTzHtzPKh0xZeKXJp40Bil553jWlJ9nZwZalTqafuhy6pzLTnSj8i9WI7Mq+TjY/0FK4W4MzMaJ8bM25Wx3CJMO4LYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g+z/8JuW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JIeZjb004996;
	Fri, 20 Jun 2025 04:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=osXx2yeYQBpkRudhyrzx2G
	8o6ewUMFwFvVT5nW9IZ44=; b=g+z/8JuWdDymOFpd9G/5Rh28qmx5kuy+ySpG4k
	aFrqOk/sv4D9tI3HXag17R8XthDOr5c38EMploiRxKtlUJI/09IUgdQ99ALva+LW
	AX+8pzidN0Xm3uqoJKLjbTQnCCExiRRbp5GYMAQ1vI91ygd3eVdPm5VCn1XuucD3
	2YpXLV4THwDFl2+mBn66uM6/PkXXbht2kabNA/55jpXuD696XNh2agpUtdZ46RWZ
	W9MY93tKFq9tXlWZtonRUTnJ97PmnMrsDrVadTJTqkWEouy976G/p7kJHbQU/zrj
	RXvg12Dl/naXHFNhDQzRhoiTfsMxfpSat/Yfk9AJ3cIxnKWg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928msuph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 04:08:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55K48357008325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 04:08:03 GMT
Received: from cse-cd01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 19 Jun 2025 21:07:58 -0700
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <akapatra@quicinc.com>,
        <hariramp@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_svankada@quicinc.com>, <quic_depengs@quicinc.com>,
        <quic_vikramsa@quicinc.com>, <quic_wenmliu@quicinc.com>
Subject: [RFC PATCH 0/3] Add current load setting for qcom camss csiphy
Date: Fri, 20 Jun 2025 12:07:33 +0800
Message-ID: <20250620040736.3032667-1-quic_wenmliu@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAyOSBTYWx0ZWRfX8rFA5esmRSHG
 mYOtRvp9KXPMr2h7Xt6lEgcH1794XmrYKPilk7X+o7+hdvJVGC1+BvtxOoC33OnP6FcJUUKuKW8
 djXvo4juvkMuwJ7nLJXIQa7JceCWjJli353nBqQrLfNmIvfin1UbcMt55CyA9Orau0lGelbAqEX
 Bao/IAyzB5jkD0keyOV6h4H2w8BZhZDKNVb/S4AI2YQzjTL9LJX+i7KuRYXoDJOSa8zMHP/s2Ix
 jji8G6De2CSA8DTuEQwboJnKJOmsj2lciHUsln2IUPIObyPGIGI/oXfApFh0QMdaDQRtEFcl84T
 /BKMNFjm7Hm6+RqmzNsJE7APqELPufiGQwpXMYWNW9kEPIyOGwkARTqh9zjezZt6IDj1g+nVahi
 Dx7iR4hgu5B43WAo9H7ax0tPnZNNh6Lhzp7wU6/F5vTsaW97uZVqU4xE08I6TsdZZKz8ZZ7M
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6854dea4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=5PY4Jy_kNzdOWRqGdsgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: PfYBADR1N-702LMNksSQxQmI3w713Jso
X-Proofpoint-ORIG-GUID: PfYBADR1N-702LMNksSQxQmI3w713Jso
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=982 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200029

Currently qcom camss csiphy drivers don’t set regulator’s currents
load properly using Linux regulator framework. This causes every 
regulator’s initial mode set as HPM (high current mode), 
which may have higher power consumption.
To address this issue, add current configuration for CSIPHY.

Wenmeng Liu (3):
  media: dt-bindings: Add regulator current load
  media: qcom: camss: csiphy: Add regulator current load setting
  arm64: dts: qcom: qcs6490-rb3gen2: Add csiphy current support

 .../bindings/media/qcom,sc7280-camss.yaml     |  6 ++++
 .../qcs6490-rb3gen2-vision-mezzanine.dtso     |  1 +
 .../media/platform/qcom/camss/camss-csiphy.c  | 29 +++++++++++++++++++
 .../media/platform/qcom/camss/camss-csiphy.h  |  1 +
 4 files changed, 37 insertions(+)

-- 
2.34.1


