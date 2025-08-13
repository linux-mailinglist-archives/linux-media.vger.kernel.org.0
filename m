Return-Path: <linux-media+bounces-39764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EABDAB245B8
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5B1788127C
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60332F83BA;
	Wed, 13 Aug 2025 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dAS07lWK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28622F7453;
	Wed, 13 Aug 2025 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077938; cv=none; b=MNRnGPBsmKJxD0Uyt3hXGYbE/hQk510wW5XDPUwWECZfIfarGbPX8JnwYJMKekd5VUR+dv03nPa8lpSjISz546Xf9I7KQ5HkxlUzKdWrxIO0xM9grhwjaqNb82NiCuuEkRplwEr4a8g9c9WyRquDZ/YZPHtp3lMgbgCcyXbk3l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077938; c=relaxed/simple;
	bh=o9P/9HeF/vLTZ3+bj+e5bl4rRfh//8dSON5O9MVx71M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NcZ8xnMv3kZPZFkIz9vw3niONFzg1VNavQceKtvPlP8rLhZsyZkxsxdMZXsrXXQl+05ADOqdT5p2GvST+CuR/bbUYNECXs45K8HbdcLrjTUnx4U5l0vmXZcjITY1laAMufVoMspRDH0WU4A4xzCQ8rDFcwnLrnAEY40WU1pTz5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dAS07lWK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mHWx019405;
	Wed, 13 Aug 2025 09:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fvtyGThhSYIdmk4E4kgyqIOxe5mu65oao5CAetzcC48=; b=dAS07lWKTmMIDRko
	WXWsWuzXD4YH8ATfnZgOx8IeLGYxMo2yhicxLdPgteTY2lQjUQA96q6b2C6n0Eol
	FC5iKrI+h9bKCAYGg02iFTFZFAGAtGgcjYOrZ0T9WgBKm4wAVdYAg+1lnB9Qx0hH
	1gQOnIeXm/Rrnt6c2Xb1jTetJzNc08/wnp40srJn/V4NEDeUeiZvBsdovbRQDZFk
	aMlRN6EEEwi1kgqZhwPaBuHJq4ZEGFBfobSmc+mV2DQumArt17IivP04DvIg74d1
	Hpu8+1mMOyoUR3TkmII9JvsKn9TbYxzKjVh8Ay9dM1Y/37Y7WemgajzSpjAiy529
	SOjOLw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6q5r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9ci1n019505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:44 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 02:38:40 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 13 Aug 2025 15:07:56 +0530
Subject: [PATCH v2 06/24] media: iris: Always destroy internal buffers on
 firmware release response
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-iris-video-encoder-v2-6-c725ff673078@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
In-Reply-To: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077896; l=2068;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=o9P/9HeF/vLTZ3+bj+e5bl4rRfh//8dSON5O9MVx71M=;
 b=L7cmjGYb9wnxmn0AnAORdzb0vj92dI8tVxg2n7pIOxEl2k3XChOJyNURTLS26+oK7J5P59o9i
 Df8ViNgkiWECuPq2Ritd/4pBDGdq1nEODt8xx24gxhyUtiVO0znz50m
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX3pTWWK4HWujk
 A2MBDqIJHJB0j0L1JEQQHPhA6kcpE31+lfCFTHKCe4bU7v8EZ1DDrlmm/jlmgi6++sOTCpLwr8V
 aabXdESjdvjEp844wTefygiJyHc1MuydRmD/TOI1XKSAGGPRlLgRpgoKu89Fr0JCETyUBoXDQ7U
 sIAF/iHJCXhAjwOCiFpELFgNFn6MGGuyjMJKiCkHDc44sl+rEWwS3XwlnkT1ZEdAMnoqZkyC4v/
 ifTR8/5B4I+T3gdxWV4h/0LucgSvDmb8Q8D8WE7ajzsNGhypINfazaKVgr+wjpgAhWO/vUL1vRM
 REBwD2MJR6cIo3nv0/iCRIaX0xS9aQQEiE9PWlx+YG9vNJCZoYG3pIW1a4iozBtZe79R0JE/bYn
 KQlPti4V
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689c5d25 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=Xei55S-jlXPzQILQ8u0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4oZim8qVojmWk5sZBRbog1lfp9JjqvY8
X-Proofpoint-ORIG-GUID: 4oZim8qVojmWk5sZBRbog1lfp9JjqvY8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

Currently, internal buffers are destroyed only if 'PENDING_RELEASE' flag
is set when a release response is received from the firmware, which is
incorrect. Internal buffers should always be destroyed when the firmware
explicitly releases it, regardless of whether the 'PENDING_RELEASE' flag
was set by the driver. This is specially important during force-stop
scenarios, where the firmware may release buffers without driver marking
them for release.
Fix this by removing the incorrect check and ensuring all buffers are
properly cleaned up.

Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index a8c30fc5c0d0668cc9980f2fcfcf21072cf9ef0a..dda775d463e916f70da0b879702d96df18ea8bf7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -424,7 +424,6 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
 	struct iris_buffers *buffers = &inst->buffers[buf_type];
 	struct iris_buffer *buf, *iter;
 	bool found = false;
-	int ret = 0;
 
 	list_for_each_entry(iter, &buffers->list, list) {
 		if (iter->device_addr == buffer->base_address) {
@@ -437,10 +436,8 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
 		return -EINVAL;
 
 	buf->attr &= ~BUF_ATTR_QUEUED;
-	if (buf->attr & BUF_ATTR_PENDING_RELEASE)
-		ret = iris_destroy_internal_buffer(inst, buf);
 
-	return ret;
+	return iris_destroy_internal_buffer(inst, buf);
 }
 
 static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,

-- 
2.34.1


