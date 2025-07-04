Return-Path: <linux-media+bounces-36768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE26AF8A2E
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3AAF5A11B7
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 07:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A702877D5;
	Fri,  4 Jul 2025 07:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GIag+0zZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683D32857C9;
	Fri,  4 Jul 2025 07:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615623; cv=none; b=X+mZOVWEqozYLrEyg4pNGBkGt2PQDVRtjW6lQkWLghdigQ3sF/hn+lj/fJJYS+Vi7SM9n56U/fixpDtfB/VKUTlxpJ6v6D7yikuMgN6+y2wW6BCKuGL6c7+jSSd6eNtTJFA8tFWjg+9h/KZYu3yVLE1H2oVIitExG5HXYxRVPvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615623; c=relaxed/simple;
	bh=wHJdsK8MQEBWN+0v8OrbkWnI7FcyAxLzFilTRFaTPOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=h9ZcLeYpFHJnuwIkBOl0yib1SpBZBxdQGtNKX3z+GFKluTFa8uNV1+vfu3pR4GJWnfpTi8VAkqY3jOqi3eNz+eU9xwH5/W8fuaSoW1oSmphZU9vGh+vQJZ5FL3+7QrKtqaE8WyJjOdLKTEjUfx59FXDfpALLE7FVvDbW3MDaZDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GIag+0zZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5643eqg4007093;
	Fri, 4 Jul 2025 07:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2SuE+W08OOlGg/I2V/faD0Je/m3w9qPxGmKEQxe/f0=; b=GIag+0zZSDeQJ7cp
	mp+GSXOEr4eLvsKkGQkl1sEzr9pbY7KzB8xnBHlfTOcv2d6GndXn4oyxfV8xke0p
	Xr9hoJpfBifYuC+ueQhGa19zN1xuDyiiqGBXmd4Gcf7bpFluYaEz4rTZtUQCCvQM
	x7p3J8ih5TsBHXIuY/r4a+2ZXAdmHOlFPkPRU7NPkcOsAGsqDtT6YwDcYgDKNWes
	76lDRRwKt22Zqi4gacvw7xUi9RsBkDIrDnu+jsePWucYlLpr/+vpMIyx1TKxXk8b
	Wtkgm2JgYofO+8hGIqOkO8j+vhHoJdw1YROLi8FgDgUTT/sdqkmnh9prGTGK85ch
	AItSow==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jqgqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 07:53:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5647raHN000356
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 07:53:36 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 4 Jul 2025 00:53:33 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Fri, 4 Jul 2025 13:23:04 +0530
Subject: [PATCH 04/25] media: iris: Fix buffer timestamp handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250704-iris-video-encoder-v1-4-b6ce24e273cf@quicinc.com>
References: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
In-Reply-To: <20250704-iris-video-encoder-v1-0-b6ce24e273cf@quicinc.com>
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
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751615599; l=2551;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=wHJdsK8MQEBWN+0v8OrbkWnI7FcyAxLzFilTRFaTPOY=;
 b=LsntG5aN3F24DI/Vs3meriAfBUd7wM/nwqw9q1xpJb2Loeqho2A6veCNg62xCBPuoCl7zzTdp
 hVcRjwpmFY/BtmS/apRCpYeyMrbNmvSNL2p4wulsHHikNBMxGUBNWBe
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=68678881 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=SLZpxBsjxFweyj1SjAEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: B0PQqBl2eqledDhS0XCPLCiypedhrWgZ
X-Proofpoint-GUID: B0PQqBl2eqledDhS0XCPLCiypedhrWgZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2MCBTYWx0ZWRfXxWuah/IqyuuQ
 mAwpDD2TTM12CDwqnDzEUBqX2OzHFsK0SsgNKJ/JeoHtLT7sXwQuAauWDqvTjlsxgvHHAYEzgkn
 8wTdhSRyPCNA49wgvFg37ak0jXHGcZyecaiIAex7rR8K3yTapfl3RQqWSjShYlKx5twZMcMKR87
 pOKjS+LT5apB3Geyt2fqC0fzWw8mHMiGPn1vhcLiF485G/BiEAdUEHLrX09XEi7YpWe17mubyju
 pnOnGj/A/IQVFZNEyMyDBJPeNX6Up1Sy2SiKuF9DUweZjP1Z/3FPu8LARm+90YnME0KXD+keE2m
 K1dUR41jIjhMU69STva0+u7rAcbW/hTfVnHwBTj7hDwtB5//bYjnhEX3UM4DyJz7gdqYlmQ4Wa+
 jM9cb+X2tpH9kSwsXoQECsrwbYHZXOwiGX0OyBP67EXDcwmRTsumPM05yrbQemskpSG2Wwe2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040060

The internal driver logic operates with timestamps in microseconds
while the buffer timestamp received by vb2 is in nanosecond, this
mismatch in units causing issue in buffer handling.
Update the timestamp handling logic by converting the buffer timestamp
to microseconds before using it internally in driver for all the
timestamp assignments, comparisons, and metadata handling.

Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 6 +++---
 drivers/media/platform/qcom/iris/iris_vdec.c   | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 9f664c241149362d44d3a8fa65e2266f9c2e80e0..809ce77744f996c23dc07ef9ecb3e8e92b709850 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -579,14 +579,14 @@ iris_helper_find_buf(struct iris_inst *inst, u32 type, u32 idx)
 		return v4l2_m2m_dst_buf_remove_by_idx(m2m_ctx, idx);
 }
 
-static void iris_get_ts_metadata(struct iris_inst *inst, u64 timestamp_ns,
+static void iris_get_ts_metadata(struct iris_inst *inst, u64 timestamp_us,
 				 struct vb2_v4l2_buffer *vbuf)
 {
 	u32 mask = V4L2_BUF_FLAG_TIMECODE | V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
 	u32 i;
 
 	for (i = 0; i < ARRAY_SIZE(inst->tss); ++i) {
-		if (inst->tss[i].ts_ns != timestamp_ns)
+		if (inst->tss[i].ts_us != timestamp_us)
 			continue;
 
 		vbuf->flags &= ~mask;
@@ -653,7 +653,7 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 	}
 
 	state = VB2_BUF_STATE_DONE;
-	vb2->timestamp = buf->timestamp;
+	vb2->timestamp = buf->timestamp * NSEC_PER_USEC;
 	v4l2_m2m_buf_done(vbuf, state);
 
 	return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index d670b51c5839d1fad54d34f373cf71d5f3973a96..05340e201e6538b9599387cdd57814005b904e76 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -561,6 +561,7 @@ iris_vdec_vb2_buffer_to_driver(struct vb2_buffer *vb2, struct iris_buffer *buf)
 	buf->data_size = vb2->planes[0].bytesused - vb2->planes[0].data_offset;
 	buf->flags = vbuf->flags;
 	buf->timestamp = vb2->timestamp;
+	do_div(buf->timestamp, NSEC_PER_USEC);
 	buf->attr = 0;
 
 	return 0;

-- 
2.34.1


