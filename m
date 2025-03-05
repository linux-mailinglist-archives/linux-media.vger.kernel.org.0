Return-Path: <linux-media+bounces-27588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A91A4FC80
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D65753B01C9
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB0420CCE3;
	Wed,  5 Mar 2025 10:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ewLhR7Ov"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFE62066F3;
	Wed,  5 Mar 2025 10:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741171473; cv=none; b=ne72R7eeNR6HhBJdDNkeSy7pR0bXx91KUb9m4DpbGmIL48cPiCj0TnJKKeXKPRgEI+7He71QqKPA28FeUQKj8B32eT8r5GPybaUFNDFyD61/ZK0d3Tae3F/KGC8KProiohA2fmtDbAMqj/Z1TRJ8LJnjHtqIG0r3HHG+oagkx00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741171473; c=relaxed/simple;
	bh=/OYfXaBPrkoa14cxdMWTGkLSKxQbTY1GqVh8e14rxBA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cZ0we3jksE7B1h/W37yrxTvpKVpUp9CzB8xyAQTQQ/aGGBa/gCiEJe13PtKaxqrEQ9y8vucAJjJgURYvcEiUIsQEk6agsuvQj9Px+fL2ZyS4XcrUGrXWzw9Bbp6UpQ4oIOb/9BioU+YERYdIBzFaDh68Bhc9RzPuBgSNA0fZL1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ewLhR7Ov; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NAbFZ027880;
	Wed, 5 Mar 2025 10:44:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Uyqzo+cNiMRXmYzSgNRL10
	Oc1Cs45lIbNAMtMMlQhAU=; b=ewLhR7OvP3Gz8oEHi87sLA6rkrmeMBI+NiA/9A
	SSU3SujxZamlxJun3gKIpUvGWBGMNAK/SMh958YaDLUfKuwSG03M9bbelfHVpZ42
	w3XxDnvnou4CUKcG176f7qgpEWeLqnNciWPPaUcEYtt6UDH2vd5fMk/C/jFq+hHt
	OtVYHm0B9XEjfsAUMyoietNR48liV82jUC6TV4mtTsBy/VSPhkVqBeH2KR3WN0fu
	JrtIAS0Hz3BwMU3ld6g6in6ynIlJV9Ky59OJ57zGhvp/Mhh5mvjEY+wqnIWZt8kS
	qxQgFeyH+3/n/dVj/869muKaA9d6U/6BSJOBMUOB/qNzPctA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tw1ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 10:44:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 525AiRKJ013545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 10:44:27 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Mar 2025 02:44:23 -0800
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
To: <quic_vgarodia@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <mchehab@kernel.org>, <quic_dikshita@quicinc.com>
CC: <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 00/12] Add support for HEVC and VP9 codecs in decoder 
Date: Wed, 5 Mar 2025 16:13:23 +0530
Message-ID: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z__YNv9APdeHcw_-cMr_pmkDV9dfwlT4
X-Proofpoint-ORIG-GUID: Z__YNv9APdeHcw_-cMr_pmkDV9dfwlT4
X-Authority-Analysis: v=2.4 cv=Sf4NduRu c=1 sm=1 tr=0 ts=67c82b0c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=HO69U94CIm5YmXkL_XkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050086

Hi all,

This patch series adds initial support for the HEVC(H.265) and VP9
codecs in iris decoder. The objective of this work is to extend the 
decoder's capabilities to handle HEVC and VP9 codec streams,
including necessary format handling and buffer management.
In addition, the series also includes a set of fixes to address issues
identified during testing of these additional codecs.

I'm sharing this series as an RFC because compliance and conformance
testing are still in progress.
While initial functional tests show positive results, I would
appreciate early feedback on the design, implementation, and fixes
before moving to a formal submission.

I plan to submit a formal patch series after completing all compliance
checks. Meanwhile, any feedback or suggestion to improve this work are
very welcome.

Thanks,
Dikshita

Dikshita Agarwal (12):
  media: iris: Add HEVC and VP9 formats for decoder
  media: iris: Add platform capabilities for HEVC and VP9 decoders
  media: iris: Set mandatory properties for HEVC and VP9 decoders.
  media: iris: Add internal buffer calculation for HEVC and VP9 decoders
  media: iris: Skip destroying internal buffer if not dequeued
  media: iris: Update CAPTURE format info based on OUTPUT format
  media: iris: Add handling for corrupt and drop frames
  media: iris: Avoid updating frame size to firmware during reconfig
  media: iris: Avoid sending LAST flag multiple times
  media: iris: Send V4L2_BUF_FLAG_ERROR for buffers with 0 filled length
  media: iris: Fix handling of eos buffer during drain
  media: iris: Add handling for no show frames

 .../media/platform/qcom/iris/iris_buffer.c    |  22 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c |  28 +-
 .../platform/qcom/iris/iris_hfi_common.h      |   1 +
 .../qcom/iris/iris_hfi_gen1_command.c         |  38 +-
 .../qcom/iris/iris_hfi_gen1_defines.h         |   4 +
 .../qcom/iris/iris_hfi_gen1_response.c        |  11 +
 .../qcom/iris/iris_hfi_gen2_command.c         | 129 +++++-
 .../qcom/iris/iris_hfi_gen2_defines.h         |   5 +
 .../qcom/iris/iris_hfi_gen2_response.c        |  56 ++-
 .../media/platform/qcom/iris/iris_instance.h  |   6 +
 .../platform/qcom/iris/iris_platform_common.h |  25 +-
 .../platform/qcom/iris/iris_platform_sm8250.c |   4 +-
 .../platform/qcom/iris/iris_platform_sm8550.c | 141 ++++++-
 drivers/media/platform/qcom/iris/iris_vb2.c   |   3 +-
 drivers/media/platform/qcom/iris/iris_vdec.c  |  80 +++-
 drivers/media/platform/qcom/iris/iris_vdec.h  |  11 +
 drivers/media/platform/qcom/iris/iris_vidc.c  |   3 -
 .../platform/qcom/iris/iris_vpu_buffer.c      | 397 +++++++++++++++++-
 .../platform/qcom/iris/iris_vpu_buffer.h      |  46 +-
 19 files changed, 931 insertions(+), 79 deletions(-)

-- 
2.34.1


