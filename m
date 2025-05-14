Return-Path: <linux-media+bounces-32490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9AEAB6CEA
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 15:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C45367A60FD
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 13:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4F727B4EE;
	Wed, 14 May 2025 13:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ReZ+Dktb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D6E27A935;
	Wed, 14 May 2025 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747229925; cv=none; b=mZWo9sjXrF9oW11vJlTNcyDJ0vupVJhPKeuTfw/GiE1XlYn1CkZ5OBacu/KhblrJxBDc6cyY810BbxmBXrwEOg7kHOxWJ7+lPuO3qPGABBac6scoz/+QdpKL/I0qAkoW2oFtkCRfjVA92r8hNenD4lNxiuxZ3zf1M++zEr4w+4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747229925; c=relaxed/simple;
	bh=nY6K1+SlaQ+UADUK/kGAaS+/8C1BO4lwh1dwV6WoJPU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=kwTG4Ne20z6Sxz+oGzEhrXDiXoQWg5bENqEj7el4E3WhAfNzb38S6woZWw4/wvw+tVsbxBn0bS9IqBLV85jQHMFjW6rWModw5U8V0q5NAwdMkYUYPXJwMgcxOq3GG4bxuPbq7bnEf3vNgrH1WG1P1c+zvsYoXQkKEhRJn8ynY6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ReZ+Dktb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuvrR015169;
	Wed, 14 May 2025 13:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DZtXnReqna5qM33bP9XOTM
	zSwUOAxxMOxIwtJZ4jlTc=; b=ReZ+DktbpKOIhZC1r39ZpkJZJxfv45up8A2u4u
	e3+kadwljY8kwXl3gFclGdbeliwMWKl25NObV8Rt/P0gnsvLvaWCQKdKxLwkUc2e
	p0CTOgmuLH2DkweD2ONNFdx1jaQVuvRoj+ms6hAND9Inbf8cjbjEmKvmDixqvsbW
	T8CDCbCiz/vbGLRrdpfyiYUXdvnlH/IyQI+sNer3OPdLbrTjerlz1EjbCxnkzXWg
	5QQ8m7MXXkIH8uq5AAgVxw/taUAtHeWwTqYyUCI4rT0OGfxwpbK72hicr3nt1+oP
	KjEjLnSpPBbbiKaksyiyrueoRqedzrWskeRrGuHt5h2tKhKQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr2rgk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 13:38:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54EDcV6O004653
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 13:38:31 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 14 May 2025 06:38:28 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: [PATCH v3 0/2] venus driver fixes for vulnerabilities due to
 unexpected firmware payload
Date: Wed, 14 May 2025 19:08:07 +0530
Message-ID: <20250514-venus-fixes-v3-0-32298566011f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL+cJGgC/x3LQQqAIBBA0avIrBNME7KrRIvUqWZj4ZAE0t2Tl
 o/Pr8CYCRkmUSFjIaYzNZhOQDjWtKOk2AxaaatsP8iC6Wa50YMsx+iMDyE67yK048r4hzbMy/t
 +sscnmF0AAAA=
X-Change-ID: 20250514-venus-fixes-8d93bccd9b9d
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil
	<hans.verkuil@cisco.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vedang Nagar <quic_vnagar@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747229908; l=1408;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=nY6K1+SlaQ+UADUK/kGAaS+/8C1BO4lwh1dwV6WoJPU=;
 b=a2ZQCgz6UaunrlyF6VU1k7/gJyB9vUXeW1QKxwinmfvXir6UBHYSpobl0CO0tyLwR5Df6hAlX
 OrXOlyrcp0NAMCM0DiVn4vO03y7qaYljf4vc4OCts0nW/+E5syRYfYQ
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EcONL-KDY1NJl8tIJ3a8IJdHrMfyIOCi
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=68249cd8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=44IKDa3BNaFQHKjI_o0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EcONL-KDY1NJl8tIJ3a8IJdHrMfyIOCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEyMSBTYWx0ZWRfXwMxr/dURS+Kb
 1guXLvCPwqlqijOmu6RGC371AbbLwt59G0cQM4bWNMbVg1OzPWLdzRoqHnZCodBxSpSrK+PulAy
 kH//MDEe+1stEGq0soO9t4pR+cVbe2UC2Tv1rtgBuHN3hOdJFhYSprWyPf0+Rzy/gM7Q1vWTrhp
 Bnh9eAQFimnVaggtuknWwT9s4ESlXPjW0mVMeBzrYMkMfS31Tb0nSBSat6Ob8YBnhNLfLeTJhqE
 MHs0jIirVv2ujrE2iXNdSjCVu0/n4PGKcJr0CAdTv8n3BmXPgTrozg6rse4Vpo4MmfTdGpUnjcf
 foSXBq7tX7uUInKwoIeEpRNdbMksY0ken8nEoc39KL9XQPj+0Vgyy6a8t8Ep17Mc3tMYjZjNsNq
 F8e/Utet16LgBE9VK3Hndk0wvVavz69Rs0epXpDWPQ4v048R7vihRQZ3eXg4qBG5f01NJAop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=769
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140121

This series primarily adds check at relevant places in venus driver
where there are possible OOB accesses due to unexpected payload
from venus firmware. The patches describes the specific OOB possibility.

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
      media: venus: fix TOCTOU vulnerability when reading packets from shared memory
      media: venus: Fix OOB read due to missing payload bound check

 drivers/media/platform/qcom/venus/hfi_msgs.c  | 83 +++++++++++++++++++--------
 drivers/media/platform/qcom/venus/hfi_venus.c |  3 +
 2 files changed, 61 insertions(+), 25 deletions(-)
---
base-commit: b64b134942c8cf4801ea288b3fd38b509aedec21
change-id: 20250514-venus-fixes-8d93bccd9b9d

Best regards,
-- 
Dikshita Agarwal <quic_dikshita@quicinc.com>


