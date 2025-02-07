Return-Path: <linux-media+bounces-25782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AD3A2BDD3
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 09:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E150B7A10D4
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 08:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744651CEAD6;
	Fri,  7 Feb 2025 08:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QVTVqgOY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEF61B07AE;
	Fri,  7 Feb 2025 08:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738916727; cv=none; b=fECX7IwOAFy2Gh88U9NxPx20GoM9kgKrneAxKOlYPtLG4SBGZGgUZz3TWVl680CnrRXD/XzgFW3zXBPtUz4B82p25S8JfYC9QDvjq4FjrFuLicBf7yXhpXkAewMFyhTHDWwBXoIoh4T83pY0NHcqIZyvkaia6JDqtDgOIQTxsQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738916727; c=relaxed/simple;
	bh=d1EJPRelGRZ/y+2eSJnekbHxmzSDvkl0vvJwA32wPR4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=mLwScnY9c+KQxZ7wQZt/CkEN1yzLa+pklT+Tjd8h5hr9JJ3M8wBAv5nWS6gGl4kR2bSPwbVlbEKgGckO9DnRST7oTRS5MU1idNrgCd0BN2HCDNljDR+hh2u9AKyDE2OOrp5ozYw1X3U331w+ypTGEB6/ZXghDRQp2gRIqO9Bkcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QVTVqgOY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5172ImsY003550;
	Fri, 7 Feb 2025 08:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PW1Ivqzxh+OkyRP2CJ6dX9
	EKyZpAXYRaOi2lWW9lKEo=; b=QVTVqgOY4lQev8EB2O6IeoRG8tlRl8TtGBT++S
	6oV0Q/NUtGRBOC+2xmfpg0dRFY26L2kOwFku1RjLBaB2Xy0a3qvnwVF/L3qrqOZt
	ZIhLg9YvlhsD0gwy9zG4m+IxfInIcooVC/dShNwvxElgg12zUJwi3MbARSxCawqn
	bs7nDnjiz0waCeFBx17SWV+uDEorXRUOZoz11yf1N24xioYoyoDjmxZlj/WrDgEy
	H6WBVXVfBNHsvny50F5HKDSAds1wTFyuSqUlz/e7EuQPlbuKtBlYIDeRoXz2SLwq
	WEXQuWfM/JQ1G0cDozq7f2hV/cIGOHi9phv3v4hB3Rtv+07Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n99e8spm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 08:25:21 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5178PCi6013346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 08:25:12 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 7 Feb 2025 00:25:08 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH v4 0/4] Venus driver fixes to avoid possible OOB accesses
Date: Fri, 7 Feb 2025 13:54:48 +0530
Message-ID: <20250207-venus_oob_2-v4-0-522da0b68b22@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFDDpWcC/2XMQQ7CIBCF4asY1mJgoC268h7GNJSOdhYWBUs0T
 e8ubXShLt9L/m9kEQNhZLvVyAImiuT7PPR6xVxn+zNyavNmIEBLKQuesB9i7X1TAwdZCQNqK6v
 SslxcA57osWiHY94dxbsPzwVPML9vB8yXk4ALro2yKKwudWP2t4Ec9W7j/IXNUlKfuhB/tcq1k
 FqjQyxN+1NP0/QCc52ok+YAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738916708; l=1892;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=d1EJPRelGRZ/y+2eSJnekbHxmzSDvkl0vvJwA32wPR4=;
 b=MJCCRq9VUW1stdbU+2adrvUhqJ9xzXm6ih1zJMVavcqju2zMh3vV+iGg4jNHdy7XJi3pKK1Lu
 chFLAGPZlyeBcSSSoSUID0ogYDLz9o7kixaeYhTpftJpDK7fc/3wiwo
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vKxJfEV4UmYYXxmedgXvWkgGt4lIZAbP
X-Proofpoint-GUID: vKxJfEV4UmYYXxmedgXvWkgGt4lIZAbP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_04,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070063

This series primarily adds check at relevant places in venus driver 
where there are possible OOB accesses due to unexpected payload from 
venus firmware. The patches describes the specific OOB possibility.

Please review and share your feedback.

Validated on sc7180(v4), rb5(v6) and db410c(v1).

Changes in v4:
- fix an uninitialize variable(media ci)
- Link to v3: https://lore.kernel.org/r/20250128-venus_oob_2-v3-0-0144ecee68d8@quicinc.com

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

 drivers/media/platform/qcom/venus/hfi_parser.c | 96 +++++++++++++++++++-------
 drivers/media/platform/qcom/venus/hfi_venus.c  | 15 +++-
 2 files changed, 83 insertions(+), 28 deletions(-)
---
base-commit: c7ccf3683ac9746b263b0502255f5ce47f64fe0a
change-id: 20241115-venus_oob_2-21708239176a

Best regards,
-- 
Vikash Garodia <quic_vgarodia@quicinc.com>


