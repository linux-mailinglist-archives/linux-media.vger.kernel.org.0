Return-Path: <linux-media+bounces-11005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E37B8BE3BA
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F92E1C20B19
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 13:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E0416ABFF;
	Tue,  7 May 2024 13:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MWJbM/cX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3D616ABEA
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 13:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087914; cv=none; b=XIa+7DS++KMKv7OXE/cs0KtgYcbP9iBNPPlJ8J0cq20R1zYjNmiqcaJA2+Hx+JFQ3A/Uow8sVr7Keqom09NJ3yZrq5iuN0PimBpOTpIXfbMZ/K6/2o9Tya3lWAiG60/27AJ+9oWOLKepyAk04gK+eZyPUmqCydA6/fLE22kpoug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087914; c=relaxed/simple;
	bh=gcgfOXZpVAPIhRvVAmX6aT02WeOzRZpm8OajsHdcMqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CkmZHrOH5qC6izoobd2NYV0zH6Wyx4AvqYZ5dxSjuU7qyfUkaEgF/6nTGRcbBEj3cX+Ft3Z4b0hDoxPAn/aacGZQPKnduobZJchDKk/ay/ocOqe7zfTo5qcuS1n6SSQKsMpwOw3V4hAKn/NROXZW/RHH9FPr2c867zoiKdD2iWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MWJbM/cX; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-43ca9047bd2so39274551cf.1
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715087912; x=1715692712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dp/a3NMmYGz+hm8qsmJibF9yTx35ajv4b4FGHxOOJ3Q=;
        b=MWJbM/cX7EbscSOPeHi/T/KKwADPqBpUfpm1yZrj4iUqPCtvd+t42nlAPO9NPrmOYX
         KnIiVWe1kx+fUQxOGxOUmEQcVseVkRygoeWapSt/jJ1loCYt5eZDYHXyRIGpkDlVoR5m
         sFdHDl3h+mvVWCRLFCbQDC5H899GR2PYS3WJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087912; x=1715692712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dp/a3NMmYGz+hm8qsmJibF9yTx35ajv4b4FGHxOOJ3Q=;
        b=Dq3rq5IWNBEbTa1v+s/ATytOYLh0L2tQCqAtooZU0XGj1VVAhGyqDIOndbcra5i0id
         VCGenIfV8fiDrU6S9oJ607g8ecJMxzDJiFtAHWv982Hyq06ebDyuRvna6lIfHYacZP3m
         EmWVuIFyIPuXEzwmXFHB9XVNRnm6JIFEdn3nl5EC3gvHwpmnuCZfVyk3ZRr2Q/+gJcOM
         9GTuND1HNjg0Ty0bmJCQzyER3XvCq5hQmBoMZa2PRu5OBgasnwGfDlbhoSJgMzsOaRUP
         jdbgzMqouilmFBnY468G1OosFXh4SsOB2WfBQNfBhc2VeasT+J7/TkIQSUrMMeHeMsLH
         aFzw==
X-Gm-Message-State: AOJu0Yx3hs1r2DDqiMBzjvKVX7EmOMqxMBqoHegmPACWkI81YeDo2Gfo
	drGGhOSonpyaRGYxgpNCzH/qsmjERO1VhhaKBAIhP0Y5YMWVwXw2jPTnPWs+cQ==
X-Google-Smtp-Source: AGHT+IEDglfo4F9kZks6VdwXO2dFsis27euicA9VsC2TmfkNWeTSlqrnmzGMgOLPrUCqKhp03xspNw==
X-Received: by 2002:ad4:5ca8:0:b0:6a0:c242:16d0 with SMTP id q8-20020ad45ca8000000b006a0c24216d0mr4441213qvh.31.1715087911865;
        Tue, 07 May 2024 06:18:31 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id t15-20020a05621405cf00b006a0d19c3139sm4655105qvz.118.2024.05.07.06.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:18:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 13:18:28 +0000
Subject: [PATCH 02/18] media: xilinx: Refactor struct xvip_dma
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v1-2-4a421c21fd06@chromium.org>
References: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org>
To: Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Replace a single element array with a single field.

The following cocci warning is fixed:
drivers/media/platform/xilinx/xilinx-dma.h:100:19-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/xilinx/xilinx-dma.c | 4 ++--
 drivers/media/platform/xilinx/xilinx-dma.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index a96de5d388a1..a1687b868a44 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -348,8 +348,8 @@ static void xvip_dma_buffer_queue(struct vb2_buffer *vb)
 	}
 
 	dma->xt.frame_size = 1;
-	dma->sgl[0].size = dma->format.width * dma->fmtinfo->bpp;
-	dma->sgl[0].icg = dma->format.bytesperline - dma->sgl[0].size;
+	dma->sgl.size = dma->format.width * dma->fmtinfo->bpp;
+	dma->sgl.icg = dma->format.bytesperline - dma->sgl.size;
 	dma->xt.numf = dma->format.height;
 
 	desc = dmaengine_prep_interleaved_dma(dma->dma, &dma->xt, flags);
diff --git a/drivers/media/platform/xilinx/xilinx-dma.h b/drivers/media/platform/xilinx/xilinx-dma.h
index 9c6d4c18d1a9..18f77e1a7b39 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.h
+++ b/drivers/media/platform/xilinx/xilinx-dma.h
@@ -97,7 +97,7 @@ struct xvip_dma {
 	struct dma_chan *dma;
 	unsigned int align;
 	struct dma_interleaved_template xt;
-	struct data_chunk sgl[1];
+	struct data_chunk sgl;
 };
 
 #define to_xvip_dma(vdev)	container_of(vdev, struct xvip_dma, video)

-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


