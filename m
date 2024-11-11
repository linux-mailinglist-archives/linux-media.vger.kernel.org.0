Return-Path: <linux-media+bounces-21267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9799C43EA
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 18:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6C81B2BC0D
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 17:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A941A76D4;
	Mon, 11 Nov 2024 17:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S/onHrg0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EE91A7264;
	Mon, 11 Nov 2024 17:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731346751; cv=none; b=f3P9OsBDup0NIS7j+6CKdNOCBuuhkX08hFBKDHzrSvPgKhWxo0Cr+B6std2HgYC/ixBDMhaRZ8LtmWZe0KLStVwKIhBEUtUYlJs1yqrAER8CWeP2BZICrby6B0fJ6g2n3PBn/v953QFcWG83vYcZIYIy3wZH9aX2rpczKlNknfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731346751; c=relaxed/simple;
	bh=VVUwoWcOmam11kWezPnDtZKNRyLqOTr55qo7zmGAhBU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l+vPbqfpHkikYwDIEXxqENc6mEMfqQipl3uQ1HNBDTiDoI9vrBFsiGb8qbISMfU2wh3q0jBVmCHdFuZLkbKtpEy21yee5ARE/AtXv86Ih83p186Mo3SRDtT6ZWt8SaRMgRdIhI1fussAryYVe0JKFKBKiJEFyfmP2O++c0QQE9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S/onHrg0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABCC4QG008949;
	Mon, 11 Nov 2024 17:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kJLJCkh0quIZoPax5kdjmc
	Qxx3Fu2OxxnGXrP/PwXEE=; b=S/onHrg0HHw+PHbkLeLQB/fcszie+TqJrig3cT
	AcrAZX7omd1/uqzgd6R8FomUR/Fw49Fg/y9lkT+mSTpcM8rUePlCw8DVTN6gbI0D
	xovVm7TiqZKdCfoUgqgIbZRhmP9roBlmvedDZj8dsGT1NA+gEw+1TxGHP9JQX+xO
	Kv/TkpI5behF8m1VdYR4c0GwqYb7yn9DrfScr0rxjOar8bodJf68O9WcjxufQJzD
	Lnf+0CHlS91YuRgOZMJbcmdtsHTHhBW3mKSgJ/JHLvi83ckvqpUmkZJ0ourSTUoW
	lJOxDGhP1q5r/FdWXYq261SO3kPF6ruj7I628rRF6Byoj3mg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t1184ugq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 17:39:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ABHd59I021894
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 17:39:05 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 09:38:59 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>
CC: <quic_vikramsa@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v1 0/1] media: qcom: camss: Re-structure camss_link_entities 
Date: Mon, 11 Nov 2024 23:08:44 +0530
Message-ID: <20241111173845.1773553-1-quic_vikramsa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Jglyu48nl73ux3m61YIshKlrPdLKVHif
X-Proofpoint-GUID: Jglyu48nl73ux3m61YIshKlrPdLKVHif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=556 lowpriorityscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411110143

Refactor the camss_link_entities function by breaking it down into
three distinct functions. Each function will handle the linking of
a specific entity separately, enhancing readability.

  To: Robert Foss <rfoss@kernel.org>
  To: Todor Tomov <todor.too@gmail.com>
  To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
  To: Krzysztof Kozlowski <krzk+dt@kernel.org>
  Cc: linux-arm-msm@vger.kernel.org
  Cc: linux-media@vger.kernel.org
  Cc: linux-kernel@vger.kernel.org
--- 
Test-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Vikram Sharma (1):
  media: qcom: camss: Restructure camss_link_entities

 drivers/media/platform/qcom/camss/camss.c | 159 ++++++++++++++--------
 1 file changed, 105 insertions(+), 54 deletions(-)
---
Best regards,
Vikram Sharma <quic_vikramsa@quicinc.com>
-- 
2.25.1


