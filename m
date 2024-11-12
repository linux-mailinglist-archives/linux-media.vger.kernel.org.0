Return-Path: <linux-media+bounces-21318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 719119C594E
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 14:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A3571F21898
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 13:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E55415383F;
	Tue, 12 Nov 2024 13:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CLPs44Cy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D00146588;
	Tue, 12 Nov 2024 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731418754; cv=none; b=RN3eFiSCrvGgEb4+WAONfokxbUne9TfCszxw7B2hrloBkT1fqKRUS+yGhKM4TP9twAk9uFZflsSFZY74tV3hjdvlTwYc9Au2VodGTfqAa5ZY5vknPH6WtjBNO0UxIDQ8/RtodqMBot33XIu4E4/SUJAhUkFu6wtzb1n0jygvn+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731418754; c=relaxed/simple;
	bh=QWqvc1LvXeG+SmqZ+bxT10cWUO4NqhHVKuykl2vk67c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZiknC7k1P9TdLBUk+e3YfeVWlNFIrjaZLWfAmKIIZ2w/WdlAJcftrlzOX6JmRmnwypRAluqmNWxDNmK/4uBxvVLLhOK9I7d5MSVvnixNriCAYxicEIQIcMObFat6dMBSGxEWAx7JFQ6YkUnMQ5Gs6+gJHXPMnkCt/3cPwNX6Zxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CLPs44Cy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACC5fYG024633;
	Tue, 12 Nov 2024 13:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3CUTZrt1mOHGDtCBesRayO
	vBKBMMBt3I9DYvj+AcyT8=; b=CLPs44CyFjqLaD0+LrqKXIhVz3+E+YL+iewgHw
	CFdPOX9y8Chd3BQD5rvZZQ/47gKzoUZSd3d95r0zIda7jXeawFxYQI5yHCG27VCJ
	ZsYJ2ImmHSELtqJoyN2fM+dAOALsaU+D4Ppa746A4afT5PZAy4SF80CUAYN8UYFJ
	JZudlikNIPGBANUOe32Yeyra8CwoQPx8o9gkuJ5T3LheICfrpkTo+uuovgyac3dJ
	dFxY25uWnnxshht3j10zFRUXGDbBEN8A6odUQI00TEbDX3qdWyOark+YD1KXTMP2
	HxSWw0hbl7UQ/0tssX/JjuwCQUSEXEz3ayXFJrDzA1CnoGAA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0gkyar9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 13:39:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACDd8rm023814
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 13:39:08 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 05:39:02 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>
CC: <quic_vikramsa@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v2 0/1] media: qcom: camss: Re-structure camss_link_entities 
Date: Tue, 12 Nov 2024 19:08:45 +0530
Message-ID: <20241112133846.2397017-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: G34tJmpS5oxOELAXmS2FWHsZl9_WbRU0
X-Proofpoint-GUID: G34tJmpS5oxOELAXmS2FWHsZl9_WbRU0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=642 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120109

Refactor the camss_link_entities function by breaking it down into
three distinct functions. Each function will handle the linking of
a specific entity separately, enhancing readability.

Changes in V2:
- Declared variables in reverse christmas tree order.
- Functionally decomposed link error message.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20241111173845.1773553-1-quic_vikramsa@quicinc.com/ 

  To: Robert Foss <rfoss@kernel.org>
  To: Todor Tomov <todor.too@gmail.com>
  To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  To: Krzysztof Kozlowski <krzk+dt@kernel.org>
  Cc: linux-arm-msm@vger.kernel.org
  Cc: linux-media@vger.kernel.org
  Cc: linux-kernel@vger.kernel.org

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Vikram Sharma (1):
  media: qcom: camss: Restructure camss_link_entities

 drivers/media/platform/qcom/camss/camss-vfe.c |   6 +-
 drivers/media/platform/qcom/camss/camss.c     | 196 ++++++++++++------
 drivers/media/platform/qcom/camss/camss.h     |   4 +
 3 files changed, 138 insertions(+), 68 deletions(-)

-- 
2.25.1


