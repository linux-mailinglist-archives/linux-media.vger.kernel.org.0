Return-Path: <linux-media+bounces-22199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D64BA9DB257
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 06:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADB7A167DA4
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 05:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B021F13A868;
	Thu, 28 Nov 2024 05:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DrdDbm78"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA7C1FAA;
	Thu, 28 Nov 2024 05:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732770332; cv=none; b=apIHpoBk5QBSeLtcjutr898YSdrRObpPrPCrRgBkcHxzK+A7F0vloFiYAXh9Km8f/WnXLUoW6jWKhYZKCzFqZQVqHeZVZsZ67oY2PXAYionTbs5YQwm+JBA1OzNS4N+q2MbPZ+2/4yn45W83LvHTCjRg5xA7tRSxNcUO9lr5D8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732770332; c=relaxed/simple;
	bh=JoXdclOpAXCa9Tcg/xERw0jHha09R6d9Sfl9SLTUwtc=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=QHbpeoT0ax4e0Uif7xBksSKu8XQwmekHYA7iCACzD6FTozYN4uEbhsSxzKhX1lt/wNctZewiJyqp6uyfF7P1p03rMFb4oadaYkiLSPlULrM4OM7sq0URrDgx5odHBK7x5WvHm+uWIQQJmQQn4OsUEiPPpTr84NYyw6GBv1yGgio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DrdDbm78; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARGRUOZ018966;
	Thu, 28 Nov 2024 05:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J1MjLHK1HnXfB9Qnhsid+s
	8QoX2emh7DYyNGRwddJD8=; b=DrdDbm78tvtDJL93MGRsIHVTYfBlz0WoKW7eIJ
	5qzeMsr0rnzXd/4Z3NZJz8qfUBFZG+OtQnk49/mGxaNH4SOvpZ/Z8d+DqxtpkHXV
	un/3PVX0Ao9YZe787FhWkjQ05+yx1IBvSfQFjNSwSEw58XNo4F4wR6L/rqBA9TFO
	6jmo3Qf9zI4pnq3G468Ih7LQMe1Hq1QLUR7hhIBKnuxGaZM8n/+ooaX2ucpWC4VW
	AIqqCeN/G7sCOUmK8whdSz/XiG/oSdLgIuWZlHY3Q1hJ51kGynk9VbKG5emxztri
	VRhTdGA8rjoDd8ZbWIqZo/2lSTeTLWKSZ2iY23C7FIdrzkRw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366y01cba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 05:05:23 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AS55MiT023225
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 05:05:22 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 27 Nov 2024 21:05:18 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH v2 0/4] Venus driver fixes to avoid possible OOB accesses
Date: Thu, 28 Nov 2024 10:35:10 +0530
Message-ID: <20241128-venus_oob_2-v2-0-483ae0a464b8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAb6R2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxNDQ0NT3bLUvNLi+Pz8pHgjXSNDcwMLI2NLQ3OzRCWgjoKi1LTMCrBp0bG
 1tQAGYINgXQAAAA==
X-Change-ID: 20241115-venus_oob_2-21708239176a
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
CC: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab+samsung@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732770318; l=1450;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=JoXdclOpAXCa9Tcg/xERw0jHha09R6d9Sfl9SLTUwtc=;
 b=sFdYCl83UxXRjCCzr8TPcydHIQ4ULOY5Pm7+8h1xVBmrFm8jO6LLfU1zqjW0dYujbfIGAwMGv
 uFBCsqxWFEWC/yv/u7HQgg+KQ7Y6aQO+UP7iSVBsaPqFjBbPcbSPcpp
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: K8dAgHXMKog_PffVuI1nX1AqmSclFPK4
X-Proofpoint-GUID: K8dAgHXMKog_PffVuI1nX1AqmSclFPK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxlogscore=958 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411280039

v1 -> v2:
- init_codec to always update with latest payload from firmware
  (Dmitry/Bryan)
- Rewrite the logic of packet parsing to consider payload size for 
  different packet type (Bryan)
- Consider reading sfr data till available space (Dmitry)
- Add reviewed-by tags

v1:
https://lore.kernel.org/all/20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com/

This series primarily adds check at relevant places in venus driver where there
are possible OOB accesses due to unexpected payload from venus firmware. The
patches describes the specific OOB possibility.

Please review and share your feedback.

Validated on sc7180(v4) and rb5(v6).

Stan, please help to extend the test on db410c(v1).

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
Vikash Garodia (4):
      media: venus: hfi_parser: add check to avoid out of bound access
      media: venus: hfi_parser: avoid OOB access beyond payload word count
      media: venus: hfi: add check to handle incorrect queue size
      media: venus: hfi: add a check to handle OOB in sfr region

 drivers/media/platform/qcom/venus/hfi_parser.c | 58 +++++++++++++++++++++-----
 drivers/media/platform/qcom/venus/hfi_venus.c  | 15 ++++++-
 2 files changed, 60 insertions(+), 13 deletions(-)
---
base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
change-id: 20241115-venus_oob_2-21708239176a

Best regards,
-- 
Vikash Garodia <quic_vgarodia@quicinc.com>


