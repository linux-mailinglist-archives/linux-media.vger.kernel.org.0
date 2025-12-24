Return-Path: <linux-media+bounces-49448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1780BCDB7CD
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 07:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08CAE30517D1
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 06:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17061329E61;
	Wed, 24 Dec 2025 06:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dEUfFOoB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7rQD75u"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDC7314D28
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766557676; cv=none; b=OAY3unGKqiHzUJy9LU+9/OoXvj3D0BX+/GmmZNyshNO/w3jDnZgjtgvl4fFk+hOpdXjt43tKTf6gCn3lbdb/av+a+XMH1IEcNQraNtwXDMT/jvpF35UovveAIRC+phiTK/svhVtBDYtArdSWIs4ffxiDNpbLNOOBCvZcPezF20g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766557676; c=relaxed/simple;
	bh=qA+l1roSDvF8QnwYQFNCqTpQl+PJ4sUmEwy75Q26KmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EjGMRi9koT6ItkO3aPTDxAx/7O/KLO7NvJGf6puMP9dzSQESuCdugQhLVEe07WSNzDAZtqZDLVZSqtcYfe1Qk+OyYScUsjITcqO8OtZ4pX4BKLo+9aOOHb6PTDArYL6Hq7TNfvxKQZ0BQX9rJtHytLxAW+TdWkaALAChbOABDyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dEUfFOoB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U7rQD75u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNJD0421056453
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ypIgmCzf00K7UtNXJUrQyHTLyHr8uHJIyxEN5WEnw/M=; b=dEUfFOoB+KcJZjoM
	44hcEEsxXnTxJvHXQC6QH4qLVdy2vQysk9p5askBekr0CfM9AlM26SPgvgG9frgt
	O3SN+FdDjRnpJOkGi4kTDTwViiKWEsH0Gq1exnW3uNZ7Vnj3e/Pn2K38PcIQ9JXk
	rcLvmunar534h6blRUpmR3iVdt5At4AGdqUwB3oQtIKdKP+KRMV9S3zFY3bhcTDD
	m2p5gafy4RpABDFSUhb5ZNYXU9kDd6hNcIcHrOYJWbNMyPXvqjfx5zIHQyZl0kg1
	vlpobqczLvuxD5oAAbDZ3Ge8IVfqAvZxWHDIbpHqWGIotuyfchVtKtkZPQOIbzf3
	VYzpyA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v1j5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 06:27:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b9208e1976so10636339b3a.1
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 22:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766557671; x=1767162471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypIgmCzf00K7UtNXJUrQyHTLyHr8uHJIyxEN5WEnw/M=;
        b=U7rQD75uWBDUmg0jLxFqYnheT3pWyfQ7FjmfjKOCD8s/3xc9CPXMVTLWDw7BDXFHiv
         nUyCqF5avBgwRn9Pb2jI4Vq88R2dBKJ7h5fYaQMW/FKQSRAAVUkeMpN79HxH4iUY433Y
         eLhlc1ea2wUohGadMvjNHQxaICUyZIlGNYW6Tn+hoSo8F7HxXPhmpB0uMyiDAfymAtdr
         LGmFwlpG6vxZSbINNAc8KlINiL233UW4FfyMZwrppXKoJr0ktgTS2ElMG9562k33ztR9
         IgeojyWMhw19J8Jy496B8gfXaB3y7TLXk4/AQh5tqgwkl4+VXeISAjDUCm26PFI4bhCk
         XNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766557671; x=1767162471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ypIgmCzf00K7UtNXJUrQyHTLyHr8uHJIyxEN5WEnw/M=;
        b=vh1tK0a6R4g3qqgcJvMIsGyFnlrxFhaT8KDgJxqiSBMZLyEopbJ2mVjfNpnunWyter
         Hrw3mZIBiP+dNw1ikmo6ri0DtfVkMWvozfrc6DzCCuENOrbAAQo41ZssZiSZKjr8mcrk
         rhu+NWBpdewU90QarNwLYHDx4c5IB+WGo9R+S+M/M6kVQmjcPvaetPXYgg+OLFevhbFR
         DZli6GeUa6nuFgmpMMSSy6I37eeuew0vI6mIYKLPH6BAwJ42jejGfpcZVoZd45yM5BUb
         sb6LvOQTZ1mXe9i2HF6+1t46kDH9fQB7yl626xJqLkO1LgwvNInW5WdEYxtyG7W6sV0t
         VKsA==
X-Gm-Message-State: AOJu0YywzY4lGJrKqTBbCI4WP2itlWHVmokeWSftOvAujmBq0Tec8q2z
	Al0PVnOVxILQeNUQRGZyIrixKmPVUuPsLmBiwOW1ld7AQkZ0Kq0EGcM32xdQ1J9Bwb+QYn1dhEh
	VXL7XhM4T2DamgiyKo80HgXM6WqUfRQVgasvZU11uS0oEv3iMB+zVGS1wxbU6RYChwiId+zBbbw
	==
X-Gm-Gg: AY/fxX5lkjeJReG718r0AHaJFnl5K0nbpa6YUBaLY1mBu2iFgIBQNWYq4UXUjgZ2q3e
	LbFOm/e6YtQx5txVHk2aHEWVsl/1ryuMj3dWk2BHD7Sol6ql77yuOmSZa2w/E0W6pV+ZU2SceFf
	ig1wh4mR7iroN81CUDRxty2XQ7XY3V82ONEaiw43SeqqJYVMUTvIyvuqQ2FR2lUM4iuTKFyux8A
	znG85dFCm7jNGVWWHHGZMfC/hlb+h/oC0guLeGJfiTe+PY4MIB++90CvzRdygkPw6ye69IUCpeb
	wN38+4ZCii2pl6fFcKm8ada+sjFM/RKYqIv4JELi41pysX7KCr4T16iWFFTDwEpOQ3R/iXsMikl
	chDndtyb+iSnziHuIlRNXrgzr685C4WgWtbrWjmbqjY83qJ4=
X-Received: by 2002:a05:6a00:35c9:b0:7f1:7b2a:ab5b with SMTP id d2e1a72fcca58-7ff648eba2emr15297558b3a.27.1766557670977;
        Tue, 23 Dec 2025 22:27:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERd9gZJsgRboJknguvEDyJwJ92XfoPc1+sklI7e3Z/QkLW8qtfQi/FUXm40kxWvF7338gOOg==
X-Received: by 2002:a05:6a00:35c9:b0:7f1:7b2a:ab5b with SMTP id d2e1a72fcca58-7ff648eba2emr15297548b3a.27.1766557670454;
        Tue, 23 Dec 2025 22:27:50 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7eb85f15sm15618908b3a.68.2025.12.23.22.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:27:50 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 11:57:10 +0530
Subject: [PATCH 1/6] media: iris: Add buffer to list only after successful
 allocation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-iris-fixes-v1-1-5f79861700ec@oss.qualcomm.com>
References: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
In-Reply-To: <20251224-iris-fixes-v1-0-5f79861700ec@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766557663; l=1596;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=qA+l1roSDvF8QnwYQFNCqTpQl+PJ4sUmEwy75Q26KmQ=;
 b=uq8U5GZqyt0tNm83lHFOvYWN3rYnmiCpbhUrkEKgEagj6qkunVPKRbZtcObT8uFQRcVVDDdSg
 U70XKdUvrm2DQaDUjGFR+asUaXlMMO4/2WFj8sx8PQNSIRWCgtdiQez
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1MyBTYWx0ZWRfX4wajTky8uBxN
 byHvPOadAqdxgjE4k6nS3LbhptX5zNIwv9Yx8wt311wP3NZ3fTLvZlCX4aGKfmeANNlPBbTtmNR
 3vlgILFAE4xYBumgIkmWPuZegt+CO6bOKF1h5JWvgjGVtSfUgs0iu4iIn+4NQTN2PrHSPzu7nIa
 movyz1DdDrrAi14fIeqGfGWLfHO5DXRElqvFXiayBn+EDAJjpp0OmSgmr9z7MYrQtmJBqYcw3Bx
 PIbrPDkh8rVtJ3QM+9ociVYZrgjhHZzwS41DRtLQm6pU95IneKyxf9M5k7eZRO9sSGP3clCcX0j
 c/bHNSTtVK/EgobCQRt1V+kAPSvs+s5MN0K6cgI2Uxq3lD529jFWzqNlPHj4HRf2mkpizinaFSS
 BbNpdDaem37bLRH/OcclUtOwoOfCwb/zoatcs0696/jj6h6JA8HOFVdlN6QUKPcZbudVa0qJgA8
 9z6TVfD61JfX/cpmvfQ==
X-Proofpoint-ORIG-GUID: W4-1LK3xTotaOxVjBxMhWRWcjuorqxYV
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694b87e7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=H7qzw8hXFCepVgrFcaUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: W4-1LK3xTotaOxVjBxMhWRWcjuorqxYV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240053

Move `list_add_tail()` to after `dma_alloc_attrs()` succeeds when creating
internal buffers. Previously, the buffer was enqueued in `buffers->list`
before the DMA allocation. If the allocation failed, the function returned
`-ENOMEM` while leaving a partially initialized buffer in the list, which
could lead to inconsistent state and potential leaks.

By adding the buffer to the list only after `dma_alloc_attrs()` succeeds,
we ensure the list contains only valid, fully initialized buffers.

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


