Return-Path: <linux-media+bounces-49622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C99CE6067
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 07:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B2F83005BA0
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 06:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31682D23A4;
	Mon, 29 Dec 2025 06:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mvz4dUr4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTnEUKRX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25FD2D0C7A
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766989905; cv=none; b=DGfSDXU+rinyLvqR+oq41QhMR9/27CPLsNPCP79lsnFfPGcOgiGRnq8OW/DerrINXA2bscXGVo9/ySvhq/YJuGsBBKZIUpeRUHLrvDjB7kR8peF/Kg6dxIw+dp26Pso69zmxi5jRTJq1L/eKTc63Hkip4lyilscle7mAva13/wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766989905; c=relaxed/simple;
	bh=NIZo+UdWxMsX7ox29/TZ4OoER1qNAvVTp1tlRL72/j0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LgXIKUdGqvr5la9WkzO8F9azhMGhsYxF8DO0IJ4B61d2w2VSBmgIunlq/E/R8bB6MP7Utspmo+mvACMGgF1EbV+Gk9Hk7La0PUjgXRiHBbNcPamAfNMl6hBT/phfnskrjhAvxDjynxZo8O4jKpFIDIy9UqTMrwNCqGswOnWMO+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mvz4dUr4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTnEUKRX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSNkqJB3998826
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	puyFVl7m3pv6DrUbueGqXDplOqSDhPlOzaE+s3URf88=; b=Mvz4dUr4HANaRmme
	WNVif7l0G2q0e4imL/tBSqN7XYcj27MdROpftwfCLJLhyW8sQCB/i3r/MKLNDw3F
	hBPj9e9dyyoiGH0aRdvGaywFI0jr5AgKYa8VEv9zL4usyKVi7z+F/Vuu3fcTcrSu
	ZFoKXY/1BZ6PoPo9A2VLjuHJW3VxaR0MQzCrLu8lSqLXYvoSsPoWIH/HV7UvYWIE
	zqzCatHD9VMAMEaVuX43ETcmnZJdHP9b+MQCwlLGOZQl1V5y3VgU2hPl9T2n5T6d
	9x+o4GLjbLX8AhSXp39JjoBXvau8YfIn3/xJBQyd8BG4XAZ1frqmBQybDsQMmstD
	oTmdaA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6dr3nxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 06:31:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6097ca315bso16486277a12.3
        for <linux-media@vger.kernel.org>; Sun, 28 Dec 2025 22:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766989902; x=1767594702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puyFVl7m3pv6DrUbueGqXDplOqSDhPlOzaE+s3URf88=;
        b=jTnEUKRXa28A98xnoStzOkt2QX8T0X46jAN9zSTk/BRVVlJoFEiUqWwYBjbN7rzRei
         Q6ByY+xVRhn/svg6zvncaGSNek5QxC28Ps6YUsAH2WXND3zVXECVZA63PmOjsQ8odlU5
         P5KA0C8FZ4li2t5ceSqBWG0CKpQnlTBpHVNum//S8Ydav+vju/hUlmKG7IBvHtXVIRfD
         Ot1I8FJCD0cl2z4WnKwxeSLNOnlL8iXBQY9M51YRswGO2hUjWkYsN+/awNitzoRHJ+hU
         8ewMTcIubK6w3lB+dCuEJJLF7xJtNa8hocKc7C0xUeviy3lF5YmwQkfMHxJJVxSgsaav
         4nGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766989902; x=1767594702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=puyFVl7m3pv6DrUbueGqXDplOqSDhPlOzaE+s3URf88=;
        b=TDAys9nQRyXpKLSLZOGzP+eSL4XyJuxEZKb3oQhcE6Mrfau/0YJ1l0sDlTm9rf2Pa6
         7yPpJpIiS9+2JYf1DOVGNdb/Ur5vXzPYOOvehPE8lKH0bAhETtTScn0OCQiTfwO4VBPM
         pe4qMOoT/D5Ub9/YvV8nYAbdZMYyhx7sZzw6sFOCMGZqv4F3za2seEjOY1qST96iaUZT
         HSNfHXLjjOu79u5lZe5kqgguN3Mh123+vXQ2og6HL1oNnxemA+FPsJTtJGUK9R0UuXYU
         aRtdFcr4OZjuMcOx3KNfaF7TbyzXx4OydlZJlLvJ4x8JSfVvBEKxQ4+YmlaiR/XeMvwR
         cHCA==
X-Gm-Message-State: AOJu0YxaiuvVb67ctCQ5rOFURGlUrMsj/Vo8bp+idIHjAycYSLvAK3R9
	Fc+yuVRz38lhkDCWnKV3kmqj0DpSmexw9BEBlCtenHRs5T/zJtTEZbJo+YJ+aqARFG/oOYFCAax
	pR77x2SW1+TJ0UUsSCnoQZ9hhW7D/iTNOX0cnycpaTqZc+1qKq0UjO5s88G9TXY2xqQ==
X-Gm-Gg: AY/fxX6gnG8hQBSa4TyC7Lz4M4Md3Oy1oplkVyUo0mICDbN4AV3oOxg3T7zIOW+Z6Xt
	08GO/Wh6zBIjSqDWMYjJotHo1MIQ56GrSW7sBq4El8oI2O25n9YdwEsgKnpmdSKxv1wus8/t2Pr
	RQ6ZGryz/uVFNRb7xs7UWeI+RogGeQdNosMVILzjV0SCmbr2lq9+dFgi/nGDNPjbOaWGcAN0cN6
	N7X8vj8718dWfylmy8YiHpJTbi3yzny5Z35vWXmux4mza7ktWprZrDp7fgaoRK24e4yF83KcQXq
	Kw4hrmW8aFAk3upgKJ4agWR9nUqTdgLQ9hXTJNp/rupyU/YUMyZmTmWwJV2AaYjMoVGKeVXCXfC
	hfjrN79nlyCxyJOcynAfvN6O3KLamXxGt/E8u5CCw7jfKUSI=
X-Received: by 2002:a05:6a00:4008:b0:7fd:ec0b:d862 with SMTP id d2e1a72fcca58-7ff66d60f18mr25851934b3a.70.1766989902232;
        Sun, 28 Dec 2025 22:31:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGZQ5cnkKUjD4tXmSK82kKPrjN6ad2VkmLap8XjncOPShkeGs1Z6h1MdvlxjE1Eoa8er9/xA==
X-Received: by 2002:a05:6a00:4008:b0:7fd:ec0b:d862 with SMTP id d2e1a72fcca58-7ff66d60f18mr25851911b3a.70.1766989901806;
        Sun, 28 Dec 2025 22:31:41 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797ab9sm28308962b3a.59.2025.12.28.22.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:31:41 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 12:01:20 +0530
Subject: [PATCH v2 1/6] media: iris: Add buffer to list only after
 successful allocation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-iris-fixes-v2-1-6dce2063d782@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766989894; l=1730;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=NIZo+UdWxMsX7ox29/TZ4OoER1qNAvVTp1tlRL72/j0=;
 b=DKk77KO9RQxdDUQpyxO1gZXFQ77O+KuvCAr8O6tGIiLwVqSriRxZbLQUB8s/+IJx3dh4kwZUC
 vDKPAF4JSywDDaufUWSNEPyIrFNLfai9CtnzZ+TPjVjvVEvDNhkcCxg
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1NyBTYWx0ZWRfX50UHVwEETKeZ
 LIqKIcDcFPoqHCg4wIh802uT0dZtKzrHOBQ9c2JtOTErjH3LGhAX03UlNris0JTKttkQxZzvWAV
 Z7H0sRwGBI6wrKo4KGUvsdFeXwkhUqlmi99rJL9RPKXnXoRJhYHFg2GaNdOOiqhZlxTJpHlJwH6
 RtfAn3OAH/E2UWqr1SA0FkyDpHUxUaF7Br2riOC5vqcCRMn38if9O0ZdKBHZvli10Ui3STmQQw3
 7GbBAsN7v8yiRdq6n7+b/0EDgYLp+oHkLjgnfhnFTtW+/turkZmIHGCv7+uCZi9iMwP2FR+RBo/
 DhAE9q/QMd8PxYpKIkbaEmZN+vX7tD7SsLnaubVpoUFuid2+ri0yhnvGd37cr636njx1loQAdVl
 R1THih6nnK5F0uQ0UhUzhPNPJR56s4uAeXQpPnR5GuUSgh+jRgZlY9vOwSlZYhS/kCGmGlcH95e
 PF+XvH1m1ttbkudjyug==
X-Authority-Analysis: v=2.4 cv=VdP6/Vp9 c=1 sm=1 tr=0 ts=6952204e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=H7qzw8hXFCepVgrFcaUA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: IPyWHleKqyYPKD544OSgb6JzdJPy-yvi
X-Proofpoint-ORIG-GUID: IPyWHleKqyYPKD544OSgb6JzdJPy-yvi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290057

Move `list_add_tail()` to after `dma_alloc_attrs()` succeeds when creating
internal buffers. Previously, the buffer was enqueued in `buffers->list`
before the DMA allocation. If the allocation failed, the function returned
`-ENOMEM` while leaving a partially initialized buffer in the list, which
could lead to inconsistent state and potential leaks.

By adding the buffer to the list only after `dma_alloc_attrs()` succeeds,
we ensure the list contains only valid, fully initialized buffers.

Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index b89b1ee06cce151e7c04a80956380d154643c116..f1f003a787bf22db6f048c9e682ba8ed2f39bc21 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -351,12 +351,15 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 	buffer->index = index;
 	buffer->buffer_size = buffers->size;
 	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
-	list_add_tail(&buffer->list, &buffers->list);
 
 	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
 					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
-	if (!buffer->kvaddr)
+	if (!buffer->kvaddr) {
+		kfree(buffer);
 		return -ENOMEM;
+	}
+
+	list_add_tail(&buffer->list, &buffers->list);
 
 	return 0;
 }

-- 
2.34.1


