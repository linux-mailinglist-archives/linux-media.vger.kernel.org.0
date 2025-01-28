Return-Path: <linux-media+bounces-25328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78630A207C5
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 10:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99C0F18892A0
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 09:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5591C19CD17;
	Tue, 28 Jan 2025 09:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aJwcdpar"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDD217A586;
	Tue, 28 Jan 2025 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738058225; cv=none; b=SNQpD9y0Eaxsdc4AlezFt3r/6Nw+ZrS6n5ADdn6aRXflKe7fMDNsOqYPJZ9Ny9YluQF/cLGRhgKZw2nE3qxkC8hdSMN3y2XQaCn/i0qyiYWO56Te3c8lQNdkL7iVx7EtfhR8plSbcWuua6VfuTbPXD65+rJEH8FAZvV44tiIQtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738058225; c=relaxed/simple;
	bh=sh1B0xxfaJlDQ/irOvLIlZFc1OnhXug78b7/e1/LOGM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Rv7kP2uBDdQwzEZRtBcO8MqZC9Hxwj2NMVHTfo5mV61KpJ9N3b8WKszGsoahOCqlmaII7q4HwK8lvEVnzJAxAiqSakVU2oVojX2igrmaB3A2TP8nH9XHDmo5BzaVwYyiW974xHxzOZyHwtd02trQPcm5rtrhSPRRfr6NJ86T+oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aJwcdpar; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S4uwpD000454;
	Tue, 28 Jan 2025 09:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=srWv/W1ibLfDnY784bhvrX
	3DTt/bGp/DirBmRlFItmM=; b=aJwcdparuh8iW1aUP1o0SEFQlNZphP7BS8UAcH
	oRU54SVA7IAx6XWFAzjqMXbC4IdoXizHes6pxdw+es/veUY71mzBzrWMwsImDmFJ
	pJUudsie8T7fxWjK9U4jw/G/BEslqJwz47bu3eR1niNs96sfJmW5/Hxn8+YehXbe
	xSrRC6w5nxA5kiP+5rze9EQollujI1UpD9wZ/eApE4++LWxFpJkpiIPSpCV5SOBR
	onh0gAHGuk78ThLCPxrqsRrCxCa9nvneB7ZQ4KJMGZxMvqNY3hpKbb2VMLFSpKk0
	wXDJwNMsmB8IJRWBnxmS6+33GRhv1ppUrV7edbzRXG3wcgEw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ernkrm4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 09:56:58 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50S9uvBB022232
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 09:56:57 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 01:56:53 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH v3 0/4] Venus driver fixes to avoid possible OOB accesses
Date: Tue, 28 Jan 2025 15:24:35 +0530
Message-ID: <20250128-venus_oob_2-v3-0-0144ecee68d8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFupmGcC/1XMQQ7CIBCF4as0sxYDU2zRlfcwTUNxtLMQFCzRN
 L272Lhx+b/kfTMkikwJDtUMkTInDr5EvanAjdZfSfC5NKBErZTaiUx+Sn0IQ48CVSsN1nvVNhb
 K4x7pwq9VO3WlR07PEN8rnvG7/hw0f05GIYU2tSVpdaMHc3xM7Ni7rQs36JZl+QDIqz2jqAAAA
 A==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738058213; l=1740;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=sh1B0xxfaJlDQ/irOvLIlZFc1OnhXug78b7/e1/LOGM=;
 b=Y3RNJ0lapzC4KFkb8F33WSXFZfbJH4jEbeCIdTgzGUVrgYwo/tFHIWZqTPPJWZeaObQWHL57F
 biw34Fy1dcECdX1mvmbWOOV63eiRmuaulkW+/Kx9gXCcYvoKwliBW35
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kQIAwA89OflUS1wV-WVl-13JAdFH0gwZ
X-Proofpoint-ORIG-GUID: kQIAwA89OflUS1wV-WVl-13JAdFH0gwZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280077

This series primarily adds check at relevant places in venus driver 
where there are possible OOB accesses due to unexpected payload from 
venus firmware. The patches describes the specific OOB possibility.

Please review and share your feedback.

Validated on sc7180(v4), rb5(v6) and db410c(v1).

Changes in v3:
- update the packet parsing logic in hfi_parser. The utility parsing api 
  now returns the size of data parsed, accordingly the parser adjust the 
  remaining bytes, taking care of OOB scenario as well (Bryan)
- Link to v2: 
  https://lore.kernel.org/r/20241128-venus_oob_2-v2-0-483ae0a464b8@quicinc.com

Changes in v2:
- init_codec to always update with latest payload from firmware
  (Dmitry/Bryan)
- Rewrite the logic of packet parsing to consider payload size for
  different packet type (Bryan)
- Consider reading sfr data till available space (Dmitry)
- Add reviewed-by tags
- Link to v1: 
  https://lore.kernel.org/all/20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com/

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
Vikash Garodia (4):
      media: venus: hfi_parser: add check to avoid out of bound access
      media: venus: hfi_parser: refactor hfi packet parsing logic
      media: venus: hfi: add check to handle incorrect queue size
      media: venus: hfi: add a check to handle OOB in sfr region

 drivers/media/platform/qcom/venus/hfi_parser.c | 94 +++++++++++++++++++-------
 drivers/media/platform/qcom/venus/hfi_venus.c  | 15 +++-
 2 files changed, 82 insertions(+), 27 deletions(-)
---
base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
change-id: 20241115-venus_oob_2-21708239176a

Best regards,
-- 
Vikash Garodia <quic_vgarodia@quicinc.com>


