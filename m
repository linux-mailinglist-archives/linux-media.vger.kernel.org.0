Return-Path: <linux-media+bounces-44685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 84634BE1EA7
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 09:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 636434F86F1
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 07:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D152E36FB;
	Thu, 16 Oct 2025 07:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTYxcLiX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9172D46B2
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 07:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760599530; cv=none; b=CMNLYD9fXMjN5dxd6dGf1tq47F8cbFrkeyjq7aMTxWPbT4SZQ/5J+APRy0vqZDOJ37CN9voqCuZhTvfDyFZoPyjbKSgXFp8q2mvTT7mj+3ChnOxCxLr+MRMjbZDYwa5bP3e1AHes6efF6QO5CIClds1KFOR+GRPnxS8+IzdbmF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760599530; c=relaxed/simple;
	bh=UL1DxIhLTDNdEMRngw5CUum4btc2pYG9yp7myJlu1xM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RshBsuxmZOPU7egR6uCo75QaewN9J8mwG7itX4j+vqf+v7D3WOvIFyb21qJN44PegQJPE510w7rUl7FP8VITK8QLXWBmzyyQtFcMW/IRnZf+FaLsleOktVBIjHSoD5SoR9LAOpm1Qs85hXfzQsm45oIFzppR95cRC8m/6zEItXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTYxcLiX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FJx7VT010015
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 07:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PYLX8mTWQSyaQ2t9hxMxmjQVF4OOp3VkZF2
	bVL4kQk4=; b=cTYxcLiXmgVfohQr2jgxpETSOxsQb4atb7aq8BmMeFHdDHB12Bv
	7oHURSVfikjORwLj5vGtwxQV0PLra3knbcjZEOW2o7/Rx8po+lhoaEAo8RAJ9mIE
	lEE/AHHbUn4itY5lZmFvyLbir64XNI+bdvsjfUn0nf6M5XTlnWYpSRzvddPDWJTY
	w9nQqLf0RWWVWjEMbPZQ8qFYteN5oi/ClLF9bbXVao5qpag7Kfo/rkM9saWHFZWE
	UEX6qCT0iVePJwOlC+/BAOLzjXtKXveg5VpeTO/taMCvmtTlhmIY8RA4zXiZB1R9
	dpbX+5H+vdknUkdVzQMjsE4wrnwzSoS2nVQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c78yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 07:25:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33428befc08so1030573a91.2
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 00:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760599527; x=1761204327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYLX8mTWQSyaQ2t9hxMxmjQVF4OOp3VkZF2bVL4kQk4=;
        b=Fy+AbMo9D20213Mb8+8DREcBlpDIPwfKY3C/GxLA2xnpv+RdBaBmfmAtmjD6UYagW7
         4N+XrWou1ln76H1NaPj+trwkCwosJRP/S2/oaOc1a51YeYe9g1Gz+7Q8viwgaqWvzQr1
         vyA+8pyjpyS1JemO1FLXn+VXWKpd8By2I3ZmFd5xCA3PR6se0zAINdIg33Bj0Qy3gPGK
         qIDPNA7zZi8bMqNZEQPUTvo0bCW45ytrOhfbCP0nIlgbW6r4zpp3qJQqGhBWQGBd9UhB
         h0RkUjVjYLnhC0mu9TGpUrlkWidmPGmT9vE+PraFwdAhrOTN4aQNW2+Fpbgm/4YrHtWQ
         03yA==
X-Gm-Message-State: AOJu0YwEMx+WXx6IAAwaivjqBEbVIwWWUQkmVx7MDQEGovZEndCpl7i0
	reWW4G2jh/zjiG2WFAd3TO4nFefCpCDIqiu8Ud9K3kj2wtl9ztzshtHtHXA2Ye8ARHE8gT1HKp8
	PJxJL+LL6OSyjENgaDOZ6sQ5zmhoEWGwIEaRFnDPxRguI1XhM6YgbLwSwahKI16DqnQ==
X-Gm-Gg: ASbGncuUoDErIlMzIrVkORkmMa4iDc39i0320Lezfb8IKUKKrt1TP8+UZf6n0trntA9
	/fb56TYI1axcDrXQi1/acayobbmVNjTaoY5D2UNrf/5NHkug/8a0WokOlfhb0ndRS0DCemFXZoi
	EEuEGvHawk/E9lTvT9ThUzZzVhRLj3cjdgH149k7sNVAnOutsHSX1qgpu7qzY0/bC9hG81QdrdT
	o2a+Rf6S/59gMqrP4990jUecgyOP2pgovgoZTnBY+QQxrC2+9s7EPhP9woT7KK6D/Q9laKsGrqk
	SU0GUG+ZgKMByj5SRNtFBeoMYWyaonrXC8oLppfSyHODt5ZRnlT5pcFTHaC7spT3Z1WwqdbaroM
	oXig1nTjlNddsCXjaNDKGY+JK1nrcJXQ6ooQ6Igc2j0B8SGDHXMIvCmaOJ3J1JfTcRyDMkw==
X-Received: by 2002:a17:90a:e7c4:b0:33b:8b82:98cc with SMTP id 98e67ed59e1d1-33b8b829c10mr12376895a91.14.1760599527391;
        Thu, 16 Oct 2025 00:25:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8EKOUJ8xGsupmOiisrAsUTMSki73ipiDYPVq89pIraBuMMaoKj84FJrrdjz62zznsHQL1Vw==
X-Received: by 2002:a17:90a:e7c4:b0:33b:8b82:98cc with SMTP id 98e67ed59e1d1-33b8b829c10mr12376874a91.14.1760599526961;
        Thu, 16 Oct 2025 00:25:26 -0700 (PDT)
Received: from WANGAOW-LAB01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb663f591sm725450a91.21.2025.10.16.00.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 00:25:26 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
To: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com, Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v1] media: qcom: iris: Add sanity check for stop streaming
Date: Thu, 16 Oct 2025 15:25:17 +0800
Message-ID: <20251016072517.4845-1-wangao.wang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: b9A1efxl7dZufFQuZQ9DzbGfFJpeKcA1
X-Proofpoint-ORIG-GUID: b9A1efxl7dZufFQuZQ9DzbGfFJpeKcA1
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f09de8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=cYsYxGlOpVVTreCKc7QA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX71BSUYnSm/mC
 GRthHfDgmzHBnPS3CQjgrvyws5C4sm6E3A0aI6DYFuC0g7aepMV5lRPOSHCEoa8dfirv/N2LZT7
 6YKXUsdv/ajPfFhA5/J1R7cEFLqhJRznZgen7ahl7dEsUr2beMpZDi94po4Wz9wkPDEJmBVwBhw
 SODbRbfWPzlMOIE3hFm0b6WXtZMcu1AOMSYB/2JovADvF6cyr0YP471gPCKtOAoFGVoZOmG3B++
 FUuP68WGZT1vYnRIorP6UHITYLhnEnsDGUqR7R4BuPQLzz1cl35JJ6ekXuz0KX+EbNvJIwViBwz
 vpahvDbR2LC6hexZfIyfgoj41AbEF0cr43dPOOtHFOf9Hexgl8tZoFf3Wu5Wp1ajHk5JPBSCekp
 prQMYQwajyGN4WerZQOCYhFaPC1P7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

Add sanity check in iris_vb2_stop_streaming. If inst->state is
already IRIS_INST_ERROR, we should skip the stream_off operation
because it would still send packets to the firmware.

In iris_vdec_kill_session, inst->state is set to IRIS_INST_ERROR
and session_close is executed, which will kfree(inst_hfi_gen2->packet).
If stop_streaming is called afterward, it will cause a crash.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vb2.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 139b821f7952..c1647fb4f0cc 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -231,16 +231,20 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
 		return;
 
 	mutex_lock(&inst->lock);
+	if (inst->state == IRIS_INST_ERROR) {
+		ret = -EBUSY;
+		goto error;
+	}
 
 	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
 	    !V4L2_TYPE_IS_CAPTURE(q->type))
-		goto exit;
+		goto error;
 
 	ret = iris_session_streamoff(inst, q->type);
 	if (ret)
-		goto exit;
+		goto error;
 
-exit:
+error:
 	iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
 	if (ret)
 		iris_inst_change_state(inst, IRIS_INST_ERROR);
-- 
2.43.0


