Return-Path: <linux-media+bounces-26149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A43A35AF3
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 10:57:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E54F3A8BE5
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 09:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9F4255E42;
	Fri, 14 Feb 2025 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L15cYguN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9E02505C2;
	Fri, 14 Feb 2025 09:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526995; cv=none; b=uLoj/w2vBoK7mwAi4XJOAveQWzBa+CmmZMRzFnP0I2za9PhQKozlm0g/7QTMwhkT14yzy5Bw6dh+NGg2TVBKu30F5GLOHBnROGEN0XFTfo8pfGbiU2eJLLOqYEWHdFmoGNMrShI1HUIs8YOBcT981QLy+VRg1mKHH8GMegdqaqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526995; c=relaxed/simple;
	bh=Oc3CPskuF4SJ0lcT8B/+DBqNgT7AELX1UbpGKBnfgcU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PZpA6jZXBZRAA03Auduzjb4dH7TN2BQrAxbO/sdb+di3dMhdSHZFEuNG/kqmFUToNw4yXfQRPjPKHKNkywRGwnxJAwpl/zfVnJ6PjEqV6K9lC2HHKqgbJ6L/U9dJcRL/CFyt+7gQxeeG9cE8kfu4DlgPBy4HeUceYAYvkS7JlO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L15cYguN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E8WboX020903;
	Fri, 14 Feb 2025 09:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GrcQVPWHR1eDMyhilPLTVg
	q3K3Ua7XZ2TdBtfWxlO4E=; b=L15cYguNHlwC/Wa854JEKjuKitFYfXczFFj6bt
	zU4q+xACwklzwQ34JIlKDlD1ZoiKVw8f7V/sBswrOZ7+i8RnJXOYdz/7Qw7fHT1L
	330FL52H28dQazKcSKUgcwpyQmVU+DQG6KVwQgOB0KVdUwYSAWdp8oAzg22L+zTi
	dd8AM2txu1s2tk4l6srZCgMV1ZK4FbZnmVeaejV5CcxLlXkc7xHjKMBdF4HlLq9l
	BHQdTWJ0llDF3TM+XputMlSIk6AG/2gWvT4pY44WNEMqVb+w+o/vmjR4p8Y+TnEK
	UzQzCn8L9BMjaz0OioM5bstFNjaQOaLoevj3+QuhMP1vWmTQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sdyxub7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 09:56:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51E9uSg5000624
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 09:56:28 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 01:56:25 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_svankada@quicinc.com>
Subject: [PATCH v1 0/5] media: qcom: camss: Add qcs8300 camss support
Date: Fri, 14 Feb 2025 15:26:06 +0530
Message-ID: <20250214095611.2498950-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jkHx_haGpYgfUnNvCFq5MbClO30lofAr
X-Proofpoint-GUID: jkHx_haGpYgfUnNvCFq5MbClO30lofAr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140071

QCS8300 is a Qualcomm SoC. This series adds driver changes to bring up
CSIPHY, TPG, CSID, VFE/RDI interfaces in QCS8300.

QCS8300 provides
- 2 x VFE, 3 RDI per VFE
- 5 x VFE Lite, 6 RDI per VFE
- 2 x CSID
- 5 x CSID Lite
- 3 x TPG
- 3 x CSIPHY

Dependencies:
I took below patch series as dependency to test these changes.
- https://lore.kernel.org/all/20250210155605.575367-1-quic_vikramsa@quicinc.com/
- https://lore.kernel.org/all/20250210162843.609337-1-quic_vikramsa@quicinc.com/
- https://lore.kernel.org/all/20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com/
- https://lore.kernel.org/all/20250214094747.2483058-1-quic_vikramsa@quicinc.com

We have tested this on qcs8300-ride board with 'Test Pattern Generator'
TPG driver support will be posted in a follow up series.

Tested with following commands:
- media-ctl -d /dev/media0 --reset
- yavta --no-query -w '0x009f0903 0' /dev/v4l-subdev0
- media-ctl -d /dev/media0 -V '"msm_tpg0":0[fmt:SRGGB10/1920x1080
  field:none]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/1920x1080
  field:none]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/1920x1080
  field:none]'
- media-ctl -d /dev/media0 -l '"msm_tpg0":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta --no-query -w '0x009f0903 9' /dev/v4l-subdev0
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 1920x1080 /dev/video0
  --capture=7

Used following tools for the sanity check of these changes.

- make -j32 W=1
- ./scripts/checkpatch.pl

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Vikram Sharma (5):
  media: qcom: camss: Add qcs8300 compatible
  media: qcom: camss: Add support for CSIPHY QCS8300
  media: qcom: camss: Add CSID support for QCS8300
  media: qcom: camss: Add VFE support for QCS8300
  media: qcom: camss: Enumerate resources for QCS8300

 .../qcom/camss/camss-csiphy-3ph-1-0.c         |   2 +
 .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
 .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 392 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 6 files changed, 403 insertions(+)

-- 
2.25.1


