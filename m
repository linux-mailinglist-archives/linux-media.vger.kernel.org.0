Return-Path: <linux-media+bounces-32739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34618ABB5D2
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 09:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADC1618985F8
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 07:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602BF26772C;
	Mon, 19 May 2025 07:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JoutV/xO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E711265CCC;
	Mon, 19 May 2025 07:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747638782; cv=none; b=dijiOqKZMU4UXLCJRojN0cbGLzH6Mhm1i4m80JwTz/EFZN2jNdy1PeVQc3GYe2mfQuZj7mRY5kAn+ZpwujU56HyhKrp+D0woEIN0Eep03rFzssccZw9jxDYgLZMs121mI4FqoB5QSSLpIyTFlxSQWGcYUodtCrXG1+yTMqRJ1rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747638782; c=relaxed/simple;
	bh=kZadxQfsU92DWKKFSPvPQU/r0CCsOozfHOnclaDKSXM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=CJoD97VEl69jLVawGr3IO1fW9XU/F76Vd28pzyopNtPJI8jtm2sn23nDZhDD2eTftwOlDul5KKHnZK9v3r4EdA0ReQIt5VgAA4DGlw/ZGDNjoK2Wd0PwGVFudZqPBYCjGVASZPLmcQ7pr/loCk2+l7/Udhjx9fOjh22+X0F3Caw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JoutV/xO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54INFr6o021066;
	Mon, 19 May 2025 07:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PRTx2FGVI0tEulNgLtkFPV
	81bGf/QotBQzuYVb5RGZo=; b=JoutV/xOYE5VLoEepqSlFOmTMOSKjCURQAG1Su
	Y06iirFMlJfjk0qMMCzQ7S77U1mOnFRRmpeCzOnyOebm2TfmC/AmwJTmY5/vWUCD
	TvWQH2Y+ZcqRCNipegTekd/CJ22IOqaAKEjHfs7bfcRkGZwoKKqHqhawX81cRFhq
	cctEb+XQKXKuDX8YPIIgOhU9A/XY5Pk+p5IVGBhvu/PiGldMgnTDk6XliOZTP02+
	0j9JSGsBoCp1GKRP9WLNlp0mDKPXK5VIYO91LFv0ZYJ0OUAxm+LL9QT7dz9J1qQn
	pY+lIbqDXUIy0pvI35miXeLSzRBJuvur6rgcr1E1tStBLG1g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4kds7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 07:12:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54J7CetK013945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 07:12:40 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 May 2025 00:12:37 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: [PATCH v4 0/2] venus driver fixes for vulnerabilities due to
 unexpected firmware payload
Date: Mon, 19 May 2025 12:42:20 +0530
Message-ID: <20250519-venus-fixes-v4-0-3ae91d81443d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANTZKmgC/22MOw7CMBAFrxJtjZE/cRRTcQ+UgtgbsgU2eIkFi
 nJ3TGrKeU8zKzBmQoZTs0LGQkwpVmgPDfj5Gm8oKFQGLbWVVrWiYFxYTPRGFn1wZvQ+uNEFqMY
 j435U4TJUnolfKX/2eDG/9X+nGCGF0dr1tuukUtP5uZCn6I8+3WHYtu0LhOebD6gAAAA=
X-Change-ID: 20250514-venus-fixes-8d93bccd9b9d
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747638757; l=1568;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=kZadxQfsU92DWKKFSPvPQU/r0CCsOozfHOnclaDKSXM=;
 b=i5q0mJKldR5P51arAb+xFV+Y6gRQ1TYjNJCGPh+ryb8e0SWkPnMOXm/tsIL3GJueGCdR6gz/Q
 nSRBdr1BN9gCi51tnzlrHsAwGj+9HXB4Cf2jYVK1z6n67QW5Vfo7QPD
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xzMykBex5nuf__djMtgKRYlTAkylPkFH
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682ad9f8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=44IKDa3BNaFQHKjI_o0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xzMykBex5nuf__djMtgKRYlTAkylPkFH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA2NiBTYWx0ZWRfX/Qyatnq9DA4i
 3ZGWB6OkBdG1i9SwIDQbzsfuMOOEXWrzdLKUkLce8O7Hk80E/SKpYxyFJVqcepSHn5gfgDi9YDT
 tAQpZ8waEgYfGuEqLu2RlkC93srDjBOvW3E7lUaJSiOB/yxqSOhCgIVX6o3bZLBXg1uWeOPniL9
 t2ufquUS+I8USb7uC1QXglgdb5eYQdp0qH+GR8UQbTaxofd9lyaUkXvjM0/1EteWIBmFTt2N+Y/
 8Ev6ufxp3ZS0kSt+LReHezl1l3n9LvvDRa9EFPwFeM+ADfmW25lW3+aiMPxxZc4vTOMlUaBpNXL
 KSi4f8KqEeShziGk+XxokOO3d521Ok9ESWADohzKxNeLZrE6k6UA/Ielq1W31cGw6isjiTsFzUg
 jTLwVrUy5WFyrlhUC76R5o2NwupjOkeUnkHG1plPohGrColz8PD5gurwPKtwToF8ZPDBj2ri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=651 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190066

This series primarily adds check at relevant places in venus driver
where there are possible OOB accesses due to unexpected payload
from venus firmware. The patches describes the specific OOB possibility.

Changes in v4:
- Add validation check after memcpy (Vikash, Bryan)
- Link to v3: https://lore.kernel.org/r/20250514-venus-fixes-v3-0-32298566011f@quicinc.com

Changes in v3:
- Add check for validating the size instead of forcefully updating it (Bryan)
- Reduce duplication of code while handling sequence change event (Vikash)
- Update the inst->error for failure case instead of slienly breaking (Bryan)
- Link to v2: https://lore.kernel.org/lkml/20250215-venus-security-fixes-v2-0-cfc7e4b87168@quicinc.com/

Changes in v2:
- Decompose sequence change event function. 
- Fix repopulating the packet .with the first read during read_queue.
- Link to v1: https://lore.kernel.org/r/20250104-venus-security-fixes-v1-0-9d0dd4594cb4@quicinc.com

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
Vedang Nagar (2):
      media: venus: Add a check for packet size after reading from shared memory
      media: venus: Fix OOB read due to missing payload bound check

 drivers/media/platform/qcom/venus/hfi_msgs.c  | 83 +++++++++++++++++++--------
 drivers/media/platform/qcom/venus/hfi_venus.c |  4 ++
 2 files changed, 62 insertions(+), 25 deletions(-)
---
base-commit: b64b134942c8cf4801ea288b3fd38b509aedec21
change-id: 20250514-venus-fixes-8d93bccd9b9d

Best regards,
-- 
Dikshita Agarwal <quic_dikshita@quicinc.com>


