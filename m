Return-Path: <linux-media+bounces-11066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F3A8BE8DD
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 18:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70480281333
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 16:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4A416C6BF;
	Tue,  7 May 2024 16:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EWrsmasr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D6516C6BD
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 16:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099234; cv=none; b=SrI4rMpzEshVr+iEHDe68W7onj32biueq01CX0QA6dwZvtjtN6q8A12zxctMd1+hW8+KNHe9fxlbXp5PR9g1V5fEJQF5Sz/uFlZqUar4jFwRprLkZUrsocImK68IWjOXib/Vd3jRdcjxN99eAbkiVgs2Zup5G3yH9Yi8qakdL40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099234; c=relaxed/simple;
	bh=gcgfOXZpVAPIhRvVAmX6aT02WeOzRZpm8OajsHdcMqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n8b86wzwoTfnZh5OtBO9FeI52Idc8GqULTbTMC6LsgXDmcEND2LBa2Uy9DOZ4ygBIB/fmnVNAb9NInJ8Y/4xtBviHz0WX+hExoOgi4kPpr3KkANSbzGoP1Sgt5SyXj2YD45A2sVJ7cuSNCONpJoWwwZcX6sFil229LFlT8mA9Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EWrsmasr; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-43b06b803c4so22429511cf.1
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 09:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715099231; x=1715704031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dp/a3NMmYGz+hm8qsmJibF9yTx35ajv4b4FGHxOOJ3Q=;
        b=EWrsmasruJmAsuCQ4HnwOxZv3Sb1Qb+ZKM+FUTvAwpxy1MTn509ain+ehT3gI1Qbgq
         t3Yuh7VCJCzeS5hTdMDxxwB4Aik0qSw0dDgFveURZxjDhdZtEdYcAeSmyCAkoKgY8hS3
         r9QPmJjf6xDUxx+sgkc/JVsYlbRStJjA9npP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099231; x=1715704031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dp/a3NMmYGz+hm8qsmJibF9yTx35ajv4b4FGHxOOJ3Q=;
        b=NvaLYxCD+Nbg9YSusx7wU0a2qFNAX74K2HsunoeB/37Dk+cHs00pGF5bc3aCA+ec60
         KAVooqRaR2hmKVhiHNuR/QpdJr8h4MZFcPeeH/Vcoa7ZhxfPf3jBanhNskfQi/ZVdGZh
         1OWUHN2hsrVuMeu7qJjlUesRbqZW1x0UIM6NxzaAwOkMBdwcIu1bDy8vSTNxBxOm0gpd
         AvF7h/Xhcm2BA3OfsVrIJGPqo9dAt6T/FADQ4YTbmTDhRoRgQGZk++OxFAJoQqtPu+d7
         nl5djGSVSw9Icpl4Lc4Y4bPq7HF4GOgfR4kK0W9V9yGXuhvG/EFSZwsT0rVuHp7Z1pWY
         oTOw==
X-Gm-Message-State: AOJu0Yy/jYuLTUAlPYghGB99WrGVCr8IQ3Jmpm5uimVvWAs+ph3VmjR4
	gkyDytR6qZLqg14V8LBY0oi2x1+APolwZzsokwcjlEQUG8oMD26qEv82ecGckQ==
X-Google-Smtp-Source: AGHT+IEOeHKGmS3SHashwweKO/vUQBNCSRFTe5jpqSXB3JxcQpvTp7L0R+6KghhNE4f3RITfPrM5nw==
X-Received: by 2002:ac8:5753:0:b0:43a:f64f:c2a with SMTP id d75a77b69052e-43dbf853b66mr1566601cf.46.1715099231571;
        Tue, 07 May 2024 09:27:11 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id hf23-20020a05622a609700b0043d1fc9b7d9sm4160597qtb.48.2024.05.07.09.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:10 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 07 May 2024 16:27:07 +0000
Subject: [PATCH v2 02/18] media: xilinx: Refactor struct xvip_dma
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-cocci-flexarray-v2-2-7aea262cf065@chromium.org>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
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


