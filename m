Return-Path: <linux-media+bounces-21965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2699D837B
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 11:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2501F286B89
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 10:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C926A192B90;
	Mon, 25 Nov 2024 10:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g0TOAXfr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CE9192B62;
	Mon, 25 Nov 2024 10:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732530925; cv=none; b=EPa9oOHYUOwL1itThrSyPDGgqKCtHU43lFvMqVgnNcRZ3PgNCaW4ipD9QMDSHwI9UWS/rI6grNiILmfDTnFwlsHp30Pe++pmD63TJ46fB40BHNEmtwPi0TIfESxarhCnya0ae0UylKYsyRTx1bvQCtW7Urr4GtXPeP4Kd8pnaxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732530925; c=relaxed/simple;
	bh=e35rBwlWVNP/CYPTgBl221mozY3dgsTmIAJNCVsSV+k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c7v9lh9NQ45jz93pWhW5RRIprh4pER1WO8lzdvyflABxMA34nxzJF9O4jslePwJgIzNCfmKi9oSRUw4o8SnlhzJ10V8Mu5j2LVEY8bsbuk91ilVFq2pyo09LSWp+1O3+UTPU995v7Wt1pNueCNbFIb2nCgkuNxDc+ZWWY3sDQkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g0TOAXfr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOMhLQR030866;
	Mon, 25 Nov 2024 10:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Eql2OnDDZHv+9I/l/WQSCm
	g9Xz9LCJHK+UYQbGJkEOE=; b=g0TOAXfrNPaIRe5DCMk7LAGnEiKfcziZ7neD6F
	6WliCd5euixST1pbgeaKRPSa//SCvRjQZB3fkvZe93pVGABKzYAuTZbEb8Dtrf7Q
	9jppicZgQAKjkP3961UMfTsU+Ss93m/+D+NZ6df351a6EOxeBLBGDVPqrsdbFRGu
	TxXgf/OgBJOjoLyjMdzWCwIVbMdXc3lCALqZaqpAe9hPMZNi+Tqx0RKt3nAgqRJD
	+xUW2bTjmTwbszQ+YWdK7BTOBS3UJ75FuIEp8C/qpJMslGaNvrovjuDEPBIpKW08
	XyNjYLCo+4aiysl0WcM1LYUkvWPmtxzrwtUqbbghl5V06mrw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4337tjc77c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 10:35:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APAZJXg022053
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 10:35:19 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 02:35:14 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v3 0/2] media: qcom: camss: Re-structure camss_link_entities
Date: Mon, 25 Nov 2024 16:04:55 +0530
Message-ID: <20241125103457.1970608-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-GUID: v1zmdOFMdf2dGlcMfqnYjRpnRRixKy73
X-Proofpoint-ORIG-GUID: v1zmdOFMdf2dGlcMfqnYjRpnRRixKy73
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=746 adultscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411250090

Refactor the camss_link_entities function by breaking it down into
three distinct functions. Each function will handle the linking of
a specific entity separately, enhancing readability.

Changes in V3:
- Broke down the change in 2 patches. first one to functionally
decompose link error message. second to restrcture the link
function.
- Removed the declarion of camss_link_error from header file.
- Link to v2: https://lore.kernel.org/linux-arm-msm/20241112133846.2397017-1-quic_vikramsa@quicinc.com/

Changes in V2:
- Declared variables in reverse christmas tree order.
- Functionally decomposed link error message.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20241111173845.1773553-1-quic_vikramsa@quicinc.com/ 

  To: Robert Foss <rfoss@kernel.org>
  To: Todor Tomov <todor.too@gmail.com>
  To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  Cc: linux-media@vger.kernel.org
  Cc: linux-kernel@vger.kernel.org

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Vikram Sharma (2):
  media: qcom: camss: reducing the repitious error message string
  media: qcom: camss: Restructure camss_link_entities

 drivers/media/platform/qcom/camss/camss.c | 195 ++++++++++++++--------
 1 file changed, 130 insertions(+), 65 deletions(-)

-- 
2.25.1


