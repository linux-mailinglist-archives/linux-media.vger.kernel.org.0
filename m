Return-Path: <linux-media+bounces-12026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE938D0F0A
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 23:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCB431C21377
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 21:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA2C168C31;
	Mon, 27 May 2024 21:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RV7PK34Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947891667C0
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 21:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716844141; cv=none; b=pXfU6ENiEK4uRgywb6a9dQhKi4BR+eF2G/e1SIlHRyCD+B0k2qhCYslQkq5IlFhff6klBM35/BCuf7gFR7hpWMGCZFoYM799SX7MuzoifzVCzUxcF6vLmldu0feLlPdPqagNlE+wcyuGgjozP7oaiAskSckcWzkdBd5KsMvLTZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716844141; c=relaxed/simple;
	bh=l4ha/0a+V3zQpjJj+OdaNyFeTKQdUeyLJ3IwjP6bE0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lUkKEClg00ix+NigRUNTWCy39H4ZwskDKjq6bYBXsxMKXORLXjhF8agofIAWIfPKAGdugS3JDwWMi++J8pKzreE/ETZJMKLibvQjFXbaDyt29ROc8ODP3/bkp5N3xzMLTxqAmvUMRJ191DZzPki1XgGH9cOE/ytMUCwLvirWr5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RV7PK34Z; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d1bf479c62so124290b6e.1
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 14:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716844138; x=1717448938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5FDS0KOQ47jasj32zxHr7JlmfKM7TOOvG63h142TVQ=;
        b=RV7PK34Zn42jnI/yj40PvajTa6lh7ousj6GsYOOGUnfBpYHt4umMWs036iQ39Iud2r
         DycUOKooXbE9sGAlPkg5ZI4oMg0b7RSj/E55bKmYjGQONnR4p7zPWNBmdAM8YDYP2Wf2
         d02FOT8r6PL/1lT1jgs9OGWDnB+meFLSFpJbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716844138; x=1717448938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5FDS0KOQ47jasj32zxHr7JlmfKM7TOOvG63h142TVQ=;
        b=gnrJ7mxBZ+6FOv+1omMYkxoQzVVPA5Gj7eVNvrX6WA5hi4BccyTIgZLbsyDknkcU+Y
         5/rV0MqL2eGt4nwzLU8SdPr90jsmFFHA5wBLH6/pFbuylkiJ1FVm896WHfAz1k0Uw1yj
         csaTOYHPDaxkvIszUoPmOsYoILZkmSVdFxtIagaHdEkjuqcmlNjMCBBEH6LB8e5IggIr
         Bls/wyGv8DRilRKt8JSLSDVfXlNrJ0nneJJ+fqTyc+4n+3i00QdaJg15Y23eQIy8d+au
         rBbwfqi7eiyGHrkHkMGoMBAk/oERg1UCOaWlFIsmrlMOEeU5YEoqb64s4f8cXB2Hj0b6
         ZzpQ==
X-Gm-Message-State: AOJu0YzjuHDCMO3NT19OdHCwOitbpCcWLsBo1uy2cJC9GgOOQUuAgkTD
	IdoYart/NP0ls9MmwyufpZnngTAzZQFiMALWlnWL3oB73TiTkpf9CeWPpwElIA==
X-Google-Smtp-Source: AGHT+IGS4IcyWoHtoHLxYqVJXwNRWKOLERShKBdO4wfCuEj/TaqRAsEdR15fcRh4okWrTQcoQrX82A==
X-Received: by 2002:a05:6808:1507:b0:3c9:949c:cc02 with SMTP id 5614622812f47-3d1a707df19mr15970807b6e.42.1716844136147;
        Mon, 27 May 2024 14:08:56 -0700 (PDT)
Received: from denia.c.googlers.com (125.135.86.34.bc.googleusercontent.com. [34.86.135.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad850a6dc7sm9511866d6.93.2024.05.27.14.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 14:08:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 27 May 2024 21:08:52 +0000
Subject: [PATCH v3 02/18] media: xilinx: Refactor struct xvip_dma
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-cocci-flexarray-v3-2-cda09c535816@chromium.org>
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
In-Reply-To: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
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
2.45.1.288.g0e0cd299f1-goog


