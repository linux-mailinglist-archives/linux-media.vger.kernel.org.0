Return-Path: <linux-media+bounces-24438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4366A05F13
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 15:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3C9D7A3022
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 14:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5173E201027;
	Wed,  8 Jan 2025 14:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J3ZWT6Xl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23541201016;
	Wed,  8 Jan 2025 14:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736347163; cv=none; b=GSnYeybI4da2SEz/6nWr5i0vT5BLpcBMCUjRsf0mjVjQxg7PPFTnTtJyN5DZRO1pLwsCw01AX7AXrgdpy3mA0TQPN8r1KXU5z/1sgE1nP0gd+/j7Ss1sO0TUxsc4Pvs5qPGM4DHSSgGnCMupkQHHX+TlQKTHlRgOkcyPuUi+dhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736347163; c=relaxed/simple;
	bh=ueSVVcZVsYUxgSioegpuYn2att8jDl6Oh2OIpyQ4jc4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CGcvcTRHibfgjqPtwXDUGxAd10WcLHtaZHsNGw0jsNLgSchkDGPpS7GDZ6zwkHQROtY6Xt+FWAgv9XKiRe0VlS46DiazCZ0KVkWtwi+Xe6XQlmePs5hw6XKZK2Ep35vh9Y5rF/ov+erq/Q35iR2wGEgnKECht700vAA7rtTB60o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J3ZWT6Xl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508BkUYd004914;
	Wed, 8 Jan 2025 14:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OyiirhuoakkNu9IBMseuni5rZsvXyXoHuIbiK21X+c8=; b=J3ZWT6XlRl9Crl0B
	kBNpLcs/wWgiIpTadbtYG7jeQyfl2GLEgqLC9gOMjFsCvcRKmRglJtcnmjeusmAB
	rBRiSs+LYe83Se4Bq+777+R8szkttI3uV1iBBHqdMxC69r9UVjUqXQyklpWonB/e
	nuBiTAh/oZLL5UDx3L/t6yK1dwJ2Fp3XYPl3WG/xzqTsjeXtNEGJi2B8/H1Pqwvs
	7N1m1Nef5ZV2vvqpgLwcll9lsVuuaBecMeuuo/awN5yTq9YJFLHPlqvUf/jr8JCR
	c4ATJOWGZibRJgk/t9EKubx/cIrRxZL6YSevHto03rQjDnxxBleOOaYPb074sIvw
	vHwb8w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441ms7h3qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 14:39:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508EdGBE004284
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 14:39:16 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 06:39:10 -0800
From: Depeng Shao <quic_depengs@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vladimir.zapolskiy@linaro.org>,
        <hverkuil@xs4all.nl>
CC: <quic_eberman@quicinc.com>, <quic_depengs@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v8 11/16] media: qcom: camss: csid: Only add TPG v4l2 ctrl if TPG hardware is available
Date: Wed, 8 Jan 2025 20:07:28 +0530
Message-ID: <20250108143733.2761200-12-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108143733.2761200-1-quic_depengs@quicinc.com>
References: <20250108143733.2761200-1-quic_depengs@quicinc.com>
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
X-Proofpoint-GUID: srhwtXIjATKy0ImE_pgTW_Dba5NJI2_I
X-Proofpoint-ORIG-GUID: srhwtXIjATKy0ImE_pgTW_Dba5NJI2_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080121

There is no CSID TPG on some SoCs, so the v4l2 ctrl in CSID driver
shouldn't be registered. Checking the supported TPG modes to indicate
if the TPG hardware exists or not and only registering v4l2 ctrl for
CSID only when the TPG hardware is present.

Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
 .../media/platform/qcom/camss/camss-csid.c    | 60 +++++++++++--------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 6cf8e434dc05..e26a69a454a7 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -760,11 +760,13 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 	int ret;
 
 	if (enable) {
-		ret = v4l2_ctrl_handler_setup(&csid->ctrls);
-		if (ret < 0) {
-			dev_err(csid->camss->dev,
-				"could not sync v4l2 controls: %d\n", ret);
-			return ret;
+		if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED) {
+			ret = v4l2_ctrl_handler_setup(&csid->ctrls);
+			if (ret < 0) {
+				dev_err(csid->camss->dev,
+					"could not sync v4l2 controls: %d\n", ret);
+				return ret;
+			}
 		}
 
 		if (!csid->testgen.enabled &&
@@ -838,7 +840,8 @@ static void csid_try_format(struct csid_device *csid,
 		break;
 
 	case MSM_CSID_PAD_SRC:
-		if (csid->testgen_mode->cur.val == 0) {
+		if (csid->testgen.nmodes == CSID_PAYLOAD_MODE_DISABLED ||
+		    csid->testgen_mode->cur.val == 0) {
 			/* Test generator is disabled, */
 			/* keep pad formats in sync */
 			u32 code = fmt->code;
@@ -888,7 +891,8 @@ static int csid_enum_mbus_code(struct v4l2_subdev *sd,
 
 		code->code = csid->res->formats->formats[code->index].code;
 	} else {
-		if (csid->testgen_mode->cur.val == 0) {
+		if (csid->testgen.nmodes == CSID_PAYLOAD_MODE_DISABLED ||
+		    csid->testgen_mode->cur.val == 0) {
 			struct v4l2_mbus_framefmt *sink_fmt;
 
 			sink_fmt = __csid_get_format(csid, sd_state,
@@ -1267,7 +1271,8 @@ static int csid_link_setup(struct media_entity *entity,
 
 		/* If test generator is enabled */
 		/* do not allow a link from CSIPHY to CSID */
-		if (csid->testgen_mode->cur.val != 0)
+		if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED &&
+		    csid->testgen_mode->cur.val != 0)
 			return -EBUSY;
 
 		sd = media_entity_to_v4l2_subdev(remote->entity);
@@ -1360,24 +1365,27 @@ int msm_csid_register_entity(struct csid_device *csid,
 		 MSM_CSID_NAME, csid->id);
 	v4l2_set_subdevdata(sd, csid);
 
-	ret = v4l2_ctrl_handler_init(&csid->ctrls, 1);
-	if (ret < 0) {
-		dev_err(dev, "Failed to init ctrl handler: %d\n", ret);
-		return ret;
-	}
+	if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED) {
+		ret = v4l2_ctrl_handler_init(&csid->ctrls, 1);
+		if (ret < 0) {
+			dev_err(dev, "Failed to init ctrl handler: %d\n", ret);
+			return ret;
+		}
 
-	csid->testgen_mode = v4l2_ctrl_new_std_menu_items(&csid->ctrls,
-				&csid_ctrl_ops, V4L2_CID_TEST_PATTERN,
-				csid->testgen.nmodes, 0, 0,
-				csid->testgen.modes);
+		csid->testgen_mode =
+			v4l2_ctrl_new_std_menu_items(&csid->ctrls,
+						     &csid_ctrl_ops, V4L2_CID_TEST_PATTERN,
+						     csid->testgen.nmodes, 0, 0,
+						     csid->testgen.modes);
 
-	if (csid->ctrls.error) {
-		dev_err(dev, "Failed to init ctrl: %d\n", csid->ctrls.error);
-		ret = csid->ctrls.error;
-		goto free_ctrl;
-	}
+		if (csid->ctrls.error) {
+			dev_err(dev, "Failed to init ctrl: %d\n", csid->ctrls.error);
+			ret = csid->ctrls.error;
+			goto free_ctrl;
+		}
 
-	csid->subdev.ctrl_handler = &csid->ctrls;
+		csid->subdev.ctrl_handler = &csid->ctrls;
+	}
 
 	ret = csid_init_formats(sd, NULL);
 	if (ret < 0) {
@@ -1408,7 +1416,8 @@ int msm_csid_register_entity(struct csid_device *csid,
 media_cleanup:
 	media_entity_cleanup(&sd->entity);
 free_ctrl:
-	v4l2_ctrl_handler_free(&csid->ctrls);
+	if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED)
+		v4l2_ctrl_handler_free(&csid->ctrls);
 
 	return ret;
 }
@@ -1421,7 +1430,8 @@ void msm_csid_unregister_entity(struct csid_device *csid)
 {
 	v4l2_device_unregister_subdev(&csid->subdev);
 	media_entity_cleanup(&csid->subdev.entity);
-	v4l2_ctrl_handler_free(&csid->ctrls);
+	if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED)
+		v4l2_ctrl_handler_free(&csid->ctrls);
 }
 
 inline bool csid_is_lite(struct csid_device *csid)
-- 
2.34.1


