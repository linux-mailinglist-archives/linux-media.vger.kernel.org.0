Return-Path: <linux-media+bounces-49627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9343CE6094
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 07:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7429D303A1BE
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 06:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41E42D0608;
	Mon, 29 Dec 2025 06:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVNi23eL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F1ruviQZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAC72D0635
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766989925; cv=none; b=Pa9hyiiYC1/X/Nfz6qrgs7zvcEkt1PshTERDRBnwQz0UBd33tzidi1/J0MmrZ18KWmqD+g8l8XglICWSW9GhKZnTHcsQRBDcHdAY50jdFxImG4WxS3ONhcSMvxU2EZc7lW3ir2kuz7+ztOVavpDj65A5peFTj4GoKNzj0mmVD9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766989925; c=relaxed/simple;
	bh=veRINet6awseWXYxyYZwNw5ZPUP0TfC17AyTv/ndWhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AajPRwPKVc+lGNd196vRh/67x20HqB1Zq/dBfL/9q4YzH387H56EzIXdwl3LACvmSnmNo8RcLAIO7M5Zznm1/ZUziAyPqHbT2s2MDdEzIy4t16ml9hXEoK+Cf/FSdgclu6x1hRS39RblM6RXyjSX9h8z6PlWCSxlnvc3Iin32wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVNi23eL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F1ruviQZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSNMK2T4099801
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNmr2Qd+7VE+ZXIXnd9eWAuqPwXoo5DhvxtgK5dWg7k=; b=QVNi23eL1jVD6PLB
	+PZR4NtMBlXbBD0TX/zDtQzoJZMgMKebRr1UqbyW0CWco22dtHdq69PVTDrnuT+J
	8qIpabcrzvOa6mUJRKAWqEldyPrz54TlldXp7SHk9BMrosf42XE/zvSCVSTYgV/d
	GRWv1gGb0VgfWQ1iTUI5P6nZY9Z03oR3PtLf7RAROZtdqMPfC11UGVX4R12N+MSY
	didDoE3lkrA/t9OVMcO+dPMwuEb+8qGmNna+v+G1Zx0e//xklshYxHxMpKX1kn0y
	2QhGr73hCDDayv6OblFZaY3Dz4zJKaEkHf/J11oiAGlNgVbSlnz/PO19uQsLJ9Ao
	BUZR8w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87bujah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:32:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7ba9c366057so22931727b3a.1
        for <linux-media@vger.kernel.org>; Sun, 28 Dec 2025 22:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766989921; x=1767594721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNmr2Qd+7VE+ZXIXnd9eWAuqPwXoo5DhvxtgK5dWg7k=;
        b=F1ruviQZ9IDZQ7+MNAUZMCGHMYmWr2gq0ZYU2ybWXqdq5qTUmhQoXMm7quMiGq13E2
         WBLHnIPzgEfsodLLUQdKZHV84NY5uVvKgmC/Q37rMsAWRJBcIZvYJwCw0qQe1jB1SxLL
         RFyoB7i8o+rOFaqEJSyXrBCBXGeLa3Qe5NcDaerm9OQX8FiNiG03qSiCnWsObEQQ2ci3
         MoDfYNr/CK45alVID9KfpQcL8ttIeaBhwsHnJiPy3PkyyJisYNm24LSqwDmLxCB2+TrB
         ONg3iL5tH6cg/0b1faX6CFse5UmlU4c11TGDwPTcVWxxrHoyiT/jF6X0pj7kguDhElcO
         uJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766989921; x=1767594721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uNmr2Qd+7VE+ZXIXnd9eWAuqPwXoo5DhvxtgK5dWg7k=;
        b=aNECoR6I/WJcjCVQOXNIwprG4vOM29ARmt98q3s3Z2Z4F6LO/j9Wp1HkXdNM/pWVMV
         aNvhHfHGyUDEO1FFURy/XjbfGHZbNIqGfWANOaEPYKJZFJtg3dzDY4nY6ifoHHrZ+ObH
         T53VdrBFUmg9jocdqU+kdvccMi0Q10sGRR1KY1K/Qd4ZI888qnvNjotqJJmAk94Y+anT
         fQ1sUxSAq2MakSZd3+LUq09RlOQxqWTatDaMR+cFOHOeCo9jdXvGWux3q/OWu/OaMVSE
         WUuo8BfFT1HKyVVH6NzGuEwWQzbwCSu/MzJPUsurYNd+kb4qVQGUSQAMrnzu/xKmghIT
         j7vQ==
X-Gm-Message-State: AOJu0YxKP+JSU3eHUWIHK1LrseT+KMjqJ0Bhkgtdr39jr9L7lIkU+Nzf
	FTJENZMvLuWhKhCiaEeZu5Xj7VveyxeLuYDxvCVRciy62Gzok4S8s43E8Ax46d0ws3vib6V5zpp
	6R/mmS1thwFuDxQdP7NhLERkECljQzoyjw2QLlkOXlik1eyynCOikTFKuxRB07pU2qw==
X-Gm-Gg: AY/fxX5dXLbUTf8Iw8zdzByQh653MSLnE+MbkjpWtirRvq71zrwjWz5l2LePEAbn08k
	XF+YVL3oPVkb6KoqiWUBFDHy4XIt25bmFRv5HAzZ+nQeWpGZgapVzkjSE6/5vUFVV/Zsg6/YKpX
	UAm4+36EUejFOLlYHqUax94RkMM+gnSdNnRTAgCXTOX1SN/Tl7Ge6yiUsfyODihsOT5XKvtdgz+
	ZcjqSymk5eonUQEsOkw2aqYA775IiFIrwsdAmVMrYUS0qdqThd92JXswzaiGtirMF/N86gDxix9
	rIZaN5hPVSs5zpgNHc3cLV6Uts93XTzLFBiQhFn2C7u24XU6+sw4ecnAwk5eNRkGdTZuD4nByvH
	qo+An+VJxz4efcqCITetJfgpkmu5dHHDjTLM6xJ9O1T8da9c=
X-Received: by 2002:a05:6a00:8014:b0:7aa:e5f2:617d with SMTP id d2e1a72fcca58-7ff651c3519mr28501208b3a.30.1766989921256;
        Sun, 28 Dec 2025 22:32:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuWNnJoqqmKSK7EBdRRCNpr9qpD2VwNZsE7kTp8/v1msgyAvsObPIWGy+/LSRKXlLFzuuqKQ==
X-Received: by 2002:a05:6a00:8014:b0:7aa:e5f2:617d with SMTP id d2e1a72fcca58-7ff651c3519mr28501191b3a.30.1766989920730;
        Sun, 28 Dec 2025 22:32:00 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797ab9sm28308962b3a.59.2025.12.28.22.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:32:00 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:01:25 +0530
Subject: [PATCH v2 6/6] media: iris: Prevent output buffer queuing before
 stream-on completes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-iris-fixes-v2-6-6dce2063d782@oss.qualcomm.com>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
In-Reply-To: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766989894; l=2070;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=ToSP8yw7UHrhfrl6kjhmcJJUW4s5zMFqgwQlqSSUXTg=;
 b=BBGTPZuqvbZVANhDb1b6tnEdSuZz3vjpRe1l8N0jbAO4T0nOyAX42ahp0+jMiyrVleaN7FZiT
 F7wbzFHue8kBksFbC4KBNJeQf3YQurHCrnGVmD3tnkzh15mCx6Lzefj
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-ORIG-GUID: gdB-2KfUG86e75lBCHxdDl7zi0FOlRFo
X-Proofpoint-GUID: gdB-2KfUG86e75lBCHxdDl7zi0FOlRFo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1NyBTYWx0ZWRfX8xu+REpUDXEI
 x0u82+keoRd43fNNMNzYrKqO29KKesMbZ5rgwZEN6r+eKYQErc0o+own2L7u36VMwZjYpmZYfDq
 iLleGpVa+PhQEL6D+TejAWDkKVZvgd82pqPQKlu9QpkqTm8YPfd4DNz07MQ+tPVWaftKAzpPQKi
 a7w+upYGbQN9qve0N8Y6GDiDOS7nDIOO/e9IVXtyAWpFseON+OyPKG54E399lsWdlYBYlz9YH1K
 6taiuLH1jYT1f4ECv/5z1bjOFGaZ2gekd5fuuZpvJkuW/052zqgixoCl3wQaHP/3crb5/fZyNCz
 EzCf12t/I/oCuFmkr0iBaur879oAjHG5Hrl7VJsByVROXUQWnQ9KySXDLngUxhut/NeGnWpYSG5
 1SmTGdqXiytfcUrP291MoyKoRG+Kg4xfGzpE5v4XfcGzJn9dBhLWtpGyX59orqyF1HzT0besoGK
 +3UskkHzmOY8cYEOSMA==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=69522062 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=k0qMZAR7W_WzNVtuHNoA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290057

From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

During normal playback, stream-on for input is followed by output, and
only after input stream-on does actual streaming begin. However, when
gst-play performs a seek, both input and output streams are stopped,
and on restart, output stream-on occurs first. At this point, firmware
has not yet started streaming. Queuing output buffers before the firmware
begins streaming causes it to process buffers in an invalid state, leading
to an error response. These buffers are returned to the driver as errors,
forcing the driver into an error state and stopping playback.

Fix this by deferring output buffer queuing until stream-on completes.
Input buffers can still be queued before stream-on as required.

Fixes: 92e007ca5ab6 ("media: iris: Add V4L2 streaming support for encoder video device")
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vb2.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 139b821f7952feb33b21a7045aef9e8a4782aa3c..bf0b8400996ece5c9d449b99609a302da726bf9a 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -193,10 +193,14 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 	buf_type = iris_v4l2_type_to_driver(q->type);
 
 	if (inst->domain == DECODER) {
-		if (inst->state == IRIS_INST_STREAMING)
+		if (buf_type == BUF_INPUT)
+			ret = iris_queue_deferred_buffers(inst, BUF_INPUT);
+
+		if (!ret && inst->state == IRIS_INST_STREAMING) {
 			ret = iris_queue_internal_deferred_buffers(inst, BUF_DPB);
-		if (!ret)
-			ret = iris_queue_deferred_buffers(inst, buf_type);
+			if (!ret)
+				ret = iris_queue_deferred_buffers(inst, BUF_OUTPUT);
+		}
 	} else {
 		if (inst->state == IRIS_INST_STREAMING) {
 			ret = iris_queue_deferred_buffers(inst, BUF_INPUT);

-- 
2.34.1


