Return-Path: <linux-media+bounces-26177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 692EAA36FBA
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 18:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D9FF170233
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 17:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5271EDA10;
	Sat, 15 Feb 2025 17:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nZi1tzdp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89ED1C7011;
	Sat, 15 Feb 2025 17:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739640003; cv=none; b=c9AsESU7wDSdauDgBiQ/mLgT2KdcpWyaS1e5V4jWT/P/qtSjpTCp88CVSDbLnvTB2jldGM39x77YM2yvpZAjagD+GNylNRoF4x6DI84YJKzHcgMGc9tSiAlPIghSzviX7sBRTV/L7bhtEFuDbNEC/bQ8X3PM0cM3CvJhIQyamuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739640003; c=relaxed/simple;
	bh=wjMtty1P/TZeJwZqk+ZTs2YapwDSfXFL1ffdETjYSeE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=I5bopOuJ6NMCnMrAIcPpve+iTGTj9ji2B+9agyKZx+IPj4ytHSx3IP2AzA5nuDD8nxbOy4npBQmyaNCa23SGxXvPy1KPW1lS6n09beWf6dqPb7tDSv47I6hyghMwtmKa9KzmFV+fZLvgh0J7Grb34chqD4dmLCxpSt14BFdvtTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nZi1tzdp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51FFtxYH014424;
	Sat, 15 Feb 2025 17:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GSpMxkuAD8/H93jnPMckPT
	Mev7qkO4tSzrd5dTYZfho=; b=nZi1tzdpkv1k1p2qF2MMzWN1NniC2XB53QTJPX
	DZLFbQaNaa/VlIjSkJuxkyPcoSWvHgV9jaPvXnxE8kFl7vuCE9yOrzI77RIT+YHw
	4aDj7soYH5GWewUbMNpJUFW5HCVK9zq1B6COpG3/Y+6z4UgnxDe+Er91nuga/wC9
	bBfQVbZi142YwKxfy9FJ08rj7buwiyBmBTE6n0DeG5MFmfSS2IF2JKwXy9UpgahT
	EiZVWDOT5XK7DMmJDzcemCf1wgwjeivwBsHSICI6lANsLbkAfyiBezXjRKqxrAK2
	bXzi1VbR1Om0CoA7OL6JGc5Oo1EiC7UEcKcSETwteG7hso4A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44tktf8tum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 17:19:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51FHJhkl010763
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 17:19:43 GMT
Received: from [10.213.96.105] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 15 Feb
 2025 09:19:40 -0800
From: Vedang Nagar <quic_vnagar@quicinc.com>
Subject: [PATCH v2 0/2] venus driver fixes to avoid possible OOB read
 access
Date: Sat, 15 Feb 2025 22:49:31 +0530
Message-ID: <20250215-venus-security-fixes-v2-0-cfc7e4b87168@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKPMsGcC/22NsQ7CMAxEf6XKjFFiJUhl4j9QB3AM9UAKcRtRV
 f130s6M707vbjHKWVjNuVlM5iIqQ6qAh8ZQf0tPBomVDVr0Dp2DwmlSUKYpyzjDQ76sECwhMoa
 Tj8FU9Z15L6p57Sr3ouOQ5/2luC3dBoN11v8fLA4stNHG6EPr6e4vn0lIEh1peJluXdcfX9UFc
 LoAAAA=
X-Change-ID: 20241211-venus-security-fixes-50c22e2564d5
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739639980; l=1037;
 i=quic_vnagar@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=wjMtty1P/TZeJwZqk+ZTs2YapwDSfXFL1ffdETjYSeE=;
 b=GrIfzgozeGn5OBMoFJ71tCI2A/dPOXn/BjwnTxtSdoNUSfRG5iulzhbnsT0uaYK0KDXTXszkR
 d9YowtNInH6Cr5EpPD195uvlMb76NRXlcdvr6yEmFnSqdeTAjPZJza4
X-Developer-Key: i=quic_vnagar@quicinc.com; a=ed25519;
 pk=GHqLT8NPue4v+CDHbZork8Ps39CBHq345GQKvCZ1glE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: azLACqECN641a7bDtj3ZUr4oOKkFD_55
X-Proofpoint-GUID: azLACqECN641a7bDtj3ZUr4oOKkFD_55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-15_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxlogscore=776 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502150153

This series primarily adds check at relevant places in venus driver
where there are possible OOB accesses due to unexpected payload
from venus firmware. The patches describes the specific OOB possibility.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
---
Changes in v2:
- Decompose sequence change event function. 
- Fix repopulating the packet .with the first read during read_queue.
- Link to v1: https://lore.kernel.org/r/20250104-venus-security-fixes-v1-0-9d0dd4594cb4@quicinc.com

---
Vedang Nagar (2):
      media: venus: fix OOB read issue due to double read
      media: venus: fix OOB access issue while reading sequence changed events

 drivers/media/platform/qcom/venus/hfi_msgs.c  | 72 +++++++++++++++++++++++----
 drivers/media/platform/qcom/venus/hfi_venus.c |  1 +
 2 files changed, 63 insertions(+), 10 deletions(-)
---
base-commit: 91e71d606356e50f238d7a87aacdee4abc427f07
change-id: 20241211-venus-security-fixes-50c22e2564d5

Best regards,
-- 
Vedang Nagar <quic_vnagar@quicinc.com>


