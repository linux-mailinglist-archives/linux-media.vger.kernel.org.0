Return-Path: <linux-media+bounces-39011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDF2B1D56F
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 12:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5184566349
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 10:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C40622FE15;
	Thu,  7 Aug 2025 10:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NRn9XqJ2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A5379E1;
	Thu,  7 Aug 2025 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754561086; cv=none; b=ECxMhM270R4TKlv7Ziwu2ZiGPF1FaRqGenzXtWYl3AmnzEZ85KyV1hDZxhkjXxha+JlgkFx9btpNn7n0J+KNG1Aw/PNSmx7dpEmkpb0NUEwHaohHeJgMsKBRLF4aHR+467pfP/hhticpg3GbPMvFHCQP09xDPtMfmpODzgkPLOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754561086; c=relaxed/simple;
	bh=Mvsmdpdd0oup14gFiJcofHJbuAXnnMeW/M/iNSFGzuE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UcPA2vdLbRnrO5QzH5AY6+FfQNfomEvbcd9cArxnB2JkdBfKbtQEkSOGxJzqzz0uCnKy7Uc29D8mHp88mO6IPUdUYvuQ4y//pIe7nE/+0wRSsy3Ievyat9uL8ALGpTf4woZfSMP2Dbd2fu40oaEQloTDFwi764v9Oc8IFubumyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NRn9XqJ2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779CvwV019237;
	Thu, 7 Aug 2025 10:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dDpX1+IEl+FXlp5JtBlux6
	YoEf6Ff0wepUK6I5GiLXw=; b=NRn9XqJ2dH6l3VFcRW4EEbZbNgFwl+PJMdoqXP
	p3okzsdpkKqCpJvyjU7x61PLnrqUAIvUXE/Vx/ysEqPPxXZYriCkJyqfdq2shZEK
	6RDQ5Dq5lDtweD09kPM4qblSjEU2bqMBxYkJZ1fcMCeVV/4/Jzam2d9Q9vjkVpxb
	h9tTi4D8tIqL0n1b3XYxP22Z4CrKagSU2FtxNLvNtXrGjtBUenfPWSI3xPnDw3jv
	zZy4X4a+d8JQeFcgHHC1kf2OR6e3DeNIgYpuuZKtX08bhF/c+lwfyqSEfQUvDTHU
	KvJTQYVVd3gjGxD5bj00sZKIQvoyQZQsffGuZkPxNO5FiQ1Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2wx9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 10:04:36 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 577A4ZlG032385
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Aug 2025 10:04:35 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 7 Aug 2025 03:04:31 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <thierry.escande@linaro.org>,
        <quic_vgattupa@quicinc.com>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>, Ling Xu <quic_lxu5@quicinc.com>
Subject: [PATCH v3 0/4] Add missing fixes to FastRPC driver
Date: Thu, 7 Aug 2025 15:34:16 +0530
Message-ID: <20250807100420.1163967-1-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=68947a34 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=YlbaB52rY0KjSQttpCIA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: lOKuDWKq_iS68PtYMvxouuzzp3iohNP3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX9d9GJnteMlxz
 ics4QaCcKbwiZu/KX5uelAEPfBr7uIMfrnB/gMMUg9OMA1rJt4bvtPZGupHAALM09lVXjUo5Io6
 JsfZ9f+j9k/XAltENrqoYA/iX9v2zlIEdxgx+Ll9xgdEjA91f6QoGquX3zdWofDFr9rlapv5F34
 rx5g/WSJ+b2MSDOEaND1EW+MRDeHOttyOB2lAiJcpDN/Eq5oePUOB5XaTEcDon2P+NUxbo3B8li
 bGdK8i4sButjO3ELVxVb6cf2qhNefcbr0ZHrUA7ulFf5q1gjmP4H40PfhJSaul0kd3RgaaATHkL
 V+hZx14Dg/DZ6A3c2Xw1M8MfyKa/DeZD4h6DclUYwt+QEWV67Nzy2ZrB/3aYIK+5QBeYVlODSsM
 hyH4Ma2l
X-Proofpoint-GUID: lOKuDWKq_iS68PtYMvxouuzzp3iohNP3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

This patch series adds the listed bug fixes that have been missing
in upstream fastRPC driver.
- Store actual size of map and check it against the user passed size.
- Consider map buf for map lookup.
- Fix possible map leak in fastrpc_put_args.
- Skip refcount increment for DMA handles.
Patch [v2]: https://lore.kernel.org/linux-arm-msm/20250806115114.688814-1-quic_lxu5@quicinc.com/

Changes in v3:
  - Remove the unused line.
Changes in v2:
  - Fix possible map leak in fastrpc_put_args.
  - Remove take_ref argument.

Ling Xu (4):
  misc: fastrpc: Save actual DMA size in fastrpc_map structure
  misc: fastrpc: Fix fastrpc_map_lookup operation
  misc: fastrpc: fix possible map leak in fastrpc_put_args
  misc: fastrpc: Skip reference for DMA handles

 drivers/misc/fastrpc.c | 89 +++++++++++++++++++++++++++---------------
 1 file changed, 58 insertions(+), 31 deletions(-)

-- 
2.34.1


