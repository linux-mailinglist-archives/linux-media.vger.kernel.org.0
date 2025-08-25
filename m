Return-Path: <linux-media+bounces-40880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39214B33724
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37FBD480EB7
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 07:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B24C288C81;
	Mon, 25 Aug 2025 07:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SAk+6HGu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B74928467B;
	Mon, 25 Aug 2025 07:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756105292; cv=none; b=hLeluwLKeaw5DCwyDwLQI7vBwGXIgGsREA7k9AxA+KHObDr3lgcGMyzZxRJS3kumZFXBoytRjpckdEVCjP3/EJFhV9wCqcQ6CS/j9SJLdB45zgoeTQhbb4Vi3yM5O3m9XyJvpUKIudPET1LyeAndqjSgvVt8EOwaqctp1nBQzN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756105292; c=relaxed/simple;
	bh=K0lax/6nj7vBVPSu/DUaJ40fPPrhOKSMq+24mYAFEds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Wbt/y8fkcewTMYhVTYmXPdVsCwFQdz+ZGcNDRIIIsnEkkc3GEGl7KNWfEM4ch/J7D2cxyUqz2D6L+zmtSm5KiXtO0LrnFVaUrs03l5jIJrJlEk08oQGWqTNCaGkFGfHVYDVAnTiiKDuTgNjr4VpFezojN78Gdp1vclyG6q0VMbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SAk+6HGu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P0dCbK012844;
	Mon, 25 Aug 2025 07:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P2e0QQUGJwd2RN6vjl6nxw2fOxZkVtlU0rP6f1tvaYs=; b=SAk+6HGulSFRtUq9
	RLuRBMp1/REdduOV91I8dsDkIJ6SNC3hn+bqSpkEABa3kB9ihLs8UQe+TRtiJOLR
	MK3E7oElw1tCtqT7Bok3YCyLZoivj1YqOdPF4LQtSUeli8yW3vEH8gtU3s5oW0HB
	vx511q6tQtT+8GhD6F9t4XY0YVD6Vgi2arqhGud87/Q1stXSU74Ou4FwSXtyopUQ
	QVAHymYSvK2PaeRfsSGMqWlWhrsPW/foanTt8LvShL/8g/Xr4LGAauzWYo4yDbiN
	B+ItJ3luiSRRF4lT3qz28XpkhQSxqjWuBm9wrlsy6FJ6Qlo84+O3T2+9cv0TWojZ
	nsXroQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de4546-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57P71B19003801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 07:01:11 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 25 Aug 2025 00:01:07 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 25 Aug 2025 12:30:31 +0530
Subject: [PATCH v4 07/26] media: iris: Update vbuf flags before
 v4l2_m2m_buf_done
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250825-iris-video-encoder-v4-7-84aa2bc0a46b@quicinc.com>
References: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
In-Reply-To: <20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        "Hans
 Verkuil" <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756105234; l=1690;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=K0lax/6nj7vBVPSu/DUaJ40fPPrhOKSMq+24mYAFEds=;
 b=/zELFTIbmOGORo7iFjAbCQIA+Eu3UNABnowDUnqpyNqFq8f9KxbPMWBPvJ5Y41TzVzXmoXTPi
 tG1cxJ6wiIIBpm3aYYDW7mg+u14ElpXQrDg0Dd1CGsXsovT8R16x/LA
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfX6bztu8BJ3bok
 uhBp2zKxD4DxJgu0EtFYVlvgH9IJrxbotp3tXrIHpaAxvm5Uf8/rB3eBBjVQH40HlfQkQsYgyyH
 FMyub+PSWZxddjYj1OugwDX3iGAv5b5QLoaiDnfotn/SF2VnO+pO9Hm8jMafoS+vdNC2ovuwF6Q
 3h0l13p1oVIgPKCQd9BYLezpIwNec/X4Z1KNFkGg/t96lwkXvyiCmEyff/uYhj61rs9Aeb62xbD
 YVdLa43vGhS2iLTMtXV70FCl8gHhdL+cbLL5P5hz/HvvajAdI46yk6U9h7PubZhN8p8hbnohO/Z
 Ge/BsuFMcoRXEdLLTcYZjWQL1rhs0WqBB831WlLUQ8Ew38RAM+HaC0p/kRvgLhOfiwomgxP0Lja
 Lm9eRdEF
X-Proofpoint-ORIG-GUID: lS4kYzhGds5cldqujQq6jg3VAvSm9UsV
X-Proofpoint-GUID: lS4kYzhGds5cldqujQq6jg3VAvSm9UsV
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68ac0a37 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=MjMrax0v_7cEApFHy6YA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037

Update the vbuf flags appropriately in error cases before calling
v4l2_m2m_buf_done(). Previously, the flag update was skippied in error
scenario, which could result in incorrect state reporting for buffers.

Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 23cac5d1312913b8dac44347ae66cb80a6a15deb..38548ee4749ea7dd1addf2c9d0677cf5217e3546 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -651,6 +651,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 
 	vb2 = &vbuf->vb2_buf;
 
+	vbuf->flags |= buf->flags;
+
 	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
 		state = VB2_BUF_STATE_ERROR;
 		vb2_set_plane_payload(vb2, 0, 0);
@@ -659,8 +661,6 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 		return 0;
 	}
 
-	vbuf->flags |= buf->flags;
-
 	if (V4L2_TYPE_IS_CAPTURE(type)) {
 		vb2_set_plane_payload(vb2, 0, buf->data_size);
 		vbuf->sequence = inst->sequence_cap++;

-- 
2.34.1


