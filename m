Return-Path: <linux-media+bounces-39759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3330B245A2
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3255A726AA6
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6205A2F49E3;
	Wed, 13 Aug 2025 09:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Dl5KCadG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DDD2F3C0F;
	Wed, 13 Aug 2025 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755077916; cv=none; b=ZddqHzUJhonFP/ShVwcvJRVGHIj21RVy0wln0qH95zYhemVYVy8mvqv/xUv9m1W12fZd7oK6n7v7VPuj0agMWwB4i+TvufkWCiUGJmdxE/g0dh7vkyqP07T2FV10/JFJ8GMdawzF0mAKLSPt/vvTKgHEAbRv1BAqmLcgx2znrvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755077916; c=relaxed/simple;
	bh=PyOo0OQjzax/JjwOfqqnmHrmcO6UjwACpOvFQztWeA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ea9wsiS0UUwD/nJRJoUiTOKURuSriDJa3/4MY9YhEcFXKUdhiGinXWuHQ94PqPMPDC5+llBk7Uwu8FmdnnR2fmRRwjtjexjKhP05fQECyxbojjmJDmA268HRY4yZX9EhZnwJ1BA6JNhDWLHLZLX7rF/wVWxfZnTAoZpRxeK88sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Dl5KCadG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mIPp020468;
	Wed, 13 Aug 2025 09:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0p3gwdqqlGzgbb10+L5XBnkYHhCzaEg6pBsz1ZETXM8=; b=Dl5KCadG05uH9qWa
	GfHa4uS3gzPZDH04BX0mEzB5jl+6D8mLfWub1JN04XNHlljFVkArKWd8+8+qJhbp
	hlehg3HzhU69zbqve1Im3W1uHJCxlD9VaMPyqlx95jrGVdTHrxhqh9s3+82I3kf+
	UDct2d9TrBPGUImjeOhSCIRu7o01Tl5hcapVETdK59pZmsGl+nCEgKsZWYBHpbAM
	cd/Qi/Q7yJGcONpVlOoM9y2xriBkOQqpITxsHZv4paxYvtK6/hcyD1G0fi9anwtL
	BPOMbFamcWf1xy8xNaBmWh1vuVbcuvsDoopvRx1vPAs2u5LoFyexwXBqj9g8M5sQ
	gssVjA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx9dwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D9cTlY003030
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 09:38:29 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 13 Aug 2025 02:38:25 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Wed, 13 Aug 2025 15:07:52 +0530
Subject: [PATCH v2 02/24] media: iris: Report unreleased PERSIST buffers on
 session close
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250813-iris-video-encoder-v2-2-c725ff673078@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755077896; l=1487;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=PyOo0OQjzax/JjwOfqqnmHrmcO6UjwACpOvFQztWeA8=;
 b=Mfn49Bb5pZzOLyQzw4Ouyu3076y/ood1ZjmplH6nzZteDghtDb+A/ikzHeWvDOgpqsrIIH8K0
 mbyF7Ua/N/jBevvhCu0r/IxkMfL8938EwEZ1IkRVKF8mzAGQ24+AG/s
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX+r7yN/zn2ti9
 bhWkKJ9Vl4sAS/LN2gxenm76lmasYXGjCT2vpiJH+0uWcZce06CoRZ6E1v2m+zoRI3Sqz+CzXi7
 +WuqgQrrp0IuyA3SW2nKn/254+zPqSOW89P5Uz4KWvoV6qKBmyf5hGnJ7EYqtfIU3A11v85KJkC
 +tnAEYZzbYteAQNQunV70fHmIn1vuSVbzLDHpDFuTG5CXKD4PyPN96fBvRLfHGhqJ5UZOzYtG2V
 XWh/bp7mPaoiFFv9NgbDRY75RtxY66OUER3YytjsOpn+ZcmGwUfcajoBK8x9WJ9tNK5KxmAUocw
 4ZbXBCM6lkUVbfkdJWJVh2DDZdnkyLrnMVzVPPKZX+beBxhCS4PBPF+k4lGWThrU81W07RC2KFo
 QQ49Wnp5
X-Proofpoint-GUID: WcLilHr50O5IsNbq8KMW_DX65fdbO54b
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689c5d16 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=r7dkYRASveuLtx3RUUQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: WcLilHr50O5IsNbq8KMW_DX65fdbO54b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

Add error reporting for unreleased PERSIST internal buffers in
iris_check_num_queued_internal_buffers(). This ensures all buffer types
are checked and logged if not freed during session close, helping to
detect memory leaks and improve driver robustness. No change to buffer
lifecycle or allocation logic.

Fixes: d2abb1ff5a3c ("media: iris: Verify internal buffer release on close")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 8285bdaf9466d4bea0f89a3b1943ed7d6c014b7d..96313856a026efaff40da97eaaa63e847172cd57 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -247,6 +247,14 @@ static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 p
 			dev_err(inst->core->dev, "%d buffer of type %d not released",
 				count, internal_buf_type[i]);
 	}
+
+	buffers = &inst->buffers[BUF_PERSIST];
+
+	count = 0;
+	list_for_each_entry_safe(buf, next, &buffers->list, list)
+		count++;
+	if (count)
+		dev_err(inst->core->dev, "%d buffer of type %d not released", count, buf->type);
 }
 
 int iris_close(struct file *filp)

-- 
2.34.1


