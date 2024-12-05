Return-Path: <linux-media+bounces-22730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C63F79E5A70
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 16:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D23A168ABF
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 15:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F84226EFB;
	Thu,  5 Dec 2024 15:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ce9+XgTy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE78D226EE3;
	Thu,  5 Dec 2024 15:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733414201; cv=none; b=NICKeSTrg2kJ506Ez9YhVtkVjEFY5wKvK2C/y/5Yz5/7V5c8zEUjuqpMnHtMV5VI3Cx7GRchqAjbHAxy2aP0swzG+nJHa2QE/HM8ssrIeG0Z3MDEYkTne/s2quY9ASmPqq8mOPyvznBKsenZ97cpHjzK1Zl6xsY3Jk4PoEO3x6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733414201; c=relaxed/simple;
	bh=r3DUKb5gJAexpFVe2TxnIAZv5ha35iq6BgJDCsg3iQA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kb4xMCf/4FHNHihV6GQm1e0C/Ol0rj25HSAa1vJgGEw6TRvJ0z/HNZhUdPNE0lbtQer70NfhOBU/a+KJEGgQzKBnEq3Fq4XDjTGDW3to9aGDdE4l8SUCc1QZ7AmeH3r4ekZEV5eqHiZaQc22ULHP0y8Y33MPgbXe5ibVhF/XvI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ce9+XgTy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5EW3pH015930;
	Thu, 5 Dec 2024 15:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LcDsVVWubDS5q0raJS0bWF0PIZI0QW1BdKI0cqj9toU=; b=Ce9+XgTyr3xtrZfF
	9+RASC+sGTKqEeqL3xNY+sSthHze63cG3Uyn3q+TboAUtW4KdudhP8asNB4FKBjb
	5869HfwXeLwo8rAuQ4Ir8kN2Vrbb+KsFaqwEUPIXIbO+OjwPOwnYoPwqSxOCKgF7
	1g3A9SnlE0yAyTHxY/Ny5zQCyRqgYqfN10kXDKy7zMMb8vYsj4L0Thl2Y1BTxvte
	7Lq9mPQWDHBVjQ3oOHhIRtc2QxcEa8DP/5+yy6c5I8ziAOE+Yu2/1sg9Ps8d1eNP
	+T5ngM2hUzYMY8OILJFHrlaqAHqvQtXM4v++t0VMh1SfYka/7D06KIBjh/GAL2Oo
	+o668g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43be1707sh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 15:56:35 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5FuYv6012132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 15:56:34 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 07:56:28 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH 08/16] media: qcom: camss: csid: Make TPG optional
Date: Thu, 5 Dec 2024 21:25:30 +0530
Message-ID: <20241205155538.250743-9-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205155538.250743-1-quic_depengs@quicinc.com>
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: p5LUHL0mqQgD3K0KjZUViCkxTQgtHgK7
X-Proofpoint-ORIG-GUID: p5LUHL0mqQgD3K0KjZUViCkxTQgtHgK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050116

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The Test Pattern Generator TPG has been moved out of the CSID and into a
standalone silicon block at the same level as a regular CSIPHY.

Make the TPG calls optional to reflect the fact some CSID blocks will now
not implement this feature.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-csid.c    | 33 ++++++++++++-------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 6cf8e434dc05..2cb8c37982f8 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -838,7 +838,7 @@ static void csid_try_format(struct csid_device *csid,
 		break;
 
 	case MSM_CSID_PAD_SRC:
-		if (csid->testgen_mode->cur.val == 0) {
+		if (!csid->testgen_mode || csid->testgen_mode->cur.val == 0) {
 			/* Test generator is disabled, */
 			/* keep pad formats in sync */
 			u32 code = fmt->code;
@@ -1042,6 +1042,7 @@ static int csid_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 static int csid_set_test_pattern(struct csid_device *csid, s32 value)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
+	const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
 
 	/* If CSID is linked to CSIPHY, do not allow to enable test generator */
 	if (value && media_pad_remote_pad_first(&csid->pads[MSM_CSID_PAD_SINK]))
@@ -1049,7 +1050,10 @@ static int csid_set_test_pattern(struct csid_device *csid, s32 value)
 
 	tg->enabled = !!value;
 
-	return csid->res->hw_ops->configure_testgen_pattern(csid, value);
+	if (hw_ops->configure_testgen_pattern)
+		return -EOPNOTSUPP;
+	else
+		return hw_ops->configure_testgen_pattern(csid, value);
 }
 
 /*
@@ -1267,7 +1271,7 @@ static int csid_link_setup(struct media_entity *entity,
 
 		/* If test generator is enabled */
 		/* do not allow a link from CSIPHY to CSID */
-		if (csid->testgen_mode->cur.val != 0)
+		if (csid->testgen_mode && csid->testgen_mode->cur.val != 0)
 			return -EBUSY;
 
 		sd = media_entity_to_v4l2_subdev(remote->entity);
@@ -1366,15 +1370,20 @@ int msm_csid_register_entity(struct csid_device *csid,
 		return ret;
 	}
 
-	csid->testgen_mode = v4l2_ctrl_new_std_menu_items(&csid->ctrls,
-				&csid_ctrl_ops, V4L2_CID_TEST_PATTERN,
-				csid->testgen.nmodes, 0, 0,
-				csid->testgen.modes);
-
-	if (csid->ctrls.error) {
-		dev_err(dev, "Failed to init ctrl: %d\n", csid->ctrls.error);
-		ret = csid->ctrls.error;
-		goto free_ctrl;
+	if (csid->res->hw_ops->configure_testgen_pattern) {
+		csid->testgen_mode =
+			v4l2_ctrl_new_std_menu_items(&csid->ctrls,
+						     &csid_ctrl_ops,
+						     V4L2_CID_TEST_PATTERN,
+						     csid->testgen.nmodes, 0,
+						     0, csid->testgen.modes);
+
+		if (csid->ctrls.error) {
+			dev_err(dev, "Failed to init ctrl: %d\n",
+				csid->ctrls.error);
+			ret = csid->ctrls.error;
+			goto free_ctrl;
+		}
 	}
 
 	csid->subdev.ctrl_handler = &csid->ctrls;
-- 
2.34.1


