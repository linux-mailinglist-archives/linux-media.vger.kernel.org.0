Return-Path: <linux-media+bounces-37869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EF6B07536
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 13:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E671E1AA15E6
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 11:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D723D2F3C39;
	Wed, 16 Jul 2025 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jD0Tm/5t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94682248B5;
	Wed, 16 Jul 2025 11:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752667145; cv=none; b=uf0S1t/m5N0rmHiWk06KQLL3qVAuvycT8rgfTmtB2b2lCNKd2k4YS6qHziAgWytckfZpLyXqeW51Cdv4Yhs+ETQfxLs6sJFPPJUc1Furhodr8s3xUHh071788lyi5yZQcR9tEdHWFPP6ogiqXoybRVa367KIYlKWpcZ7LsFS5cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752667145; c=relaxed/simple;
	bh=3L/FDVcgI5RVk0+TjIGTXEIWyy4DEOqWl8wsq3JUWzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jaJYxBJHyXsNv55FVbZlfDD4BaXcKyGt2KBtCEzaBhnp48AYJKRotBVNQtYbZmT7kw9xUps9nccyaZrAalv9FiKiRAwiqtdEizoJdLstuVwYpMnS5LEMvq6fQjHi2dzydnFTi6hfBI9p4xlQT9fV6gr41bCEesFysFPDWp/801k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jD0Tm/5t; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4f64cdc2dso936209f8f.1;
        Wed, 16 Jul 2025 04:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752667142; x=1753271942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bw2xFmNta465mg0BZVj3kVzQhBMe5dGgIkaJ9O6M9Js=;
        b=jD0Tm/5tm/wdSKJx2/YKEK+2Qk+f/Ne2fFefGC0XekkNmEAXO5FGlb2EyeOKLXeSg2
         /hR+7YQLyfne6ZVy2zrxBswzb3/wQ97tcJ6gJM7cahkuEEGOz+mDFEVPVRvKMD55NGBD
         YzG6IzwPGJ5ez47ydU/5LyyJq39CeakAp4BimVRrnZRINQpeOB4Sv79tzGfS7msAbcg3
         hwaxwC5Kud50pLD08Msi1yHclErVd3q4NYILAPgKwZK28NM6kVnFY/FpMiqFY0lvE6+f
         Io6xUmPs6dRlbbemSQ4tndmMp8A95+7nVgKTfYm/oHEmD4KNHwptNP5nLpOeVa7j10t7
         Hhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752667142; x=1753271942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bw2xFmNta465mg0BZVj3kVzQhBMe5dGgIkaJ9O6M9Js=;
        b=opOL9h2l2RsU7mWh0gyhWqB+yBz+AiFVUO7QIH/NYjTIZjajJCJYDT3n0ME5sn8M3W
         y9a1jWrFOMbMqo24ZiRwOHLOX1uimFCzeU/PvdwEcx4SHwZKPM/0ziByoow9cwam/u1z
         o/aMRiSGUAJ5Zz7a0fgS61Tm5bX9EgNgzeV1aqQZBc/2NKE+tzI/VOYr+4TPp8F7W3Y8
         WT2ExEQIgf0Et5CdBf5lILe9ilhWuB+m5GRygOG7bFJhRNsfQzvhzx5lbG+7pINQ3Nb7
         +GyMzxVVvPM3STFYh4rSQ756HALcGHYJAcet52NeITFzYvPjGWBeCXLW2pnSAm6Ul/7F
         JIFw==
X-Forwarded-Encrypted: i=1; AJvYcCVTxafoMzvDu2uQ968SeaS1N6RdjUtn0/3M9MJdpoq2EPxC7njkZQinj4dejoJ57c7p50b3kS/Op/WQoh0=@vger.kernel.org, AJvYcCXToOWz8xROWRJZBwi51PaoXGYagkzRidtwDbXr5jxFz1ybflmYDqfVmXlLO2LpV+In4HJz6KN1sdPj0Po=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBhcB6s+8Ha3/gNDEIBJSKqHCpKILREK6XoSrdNhxybHGonKDz
	6UZV7v9WvuKQW45CvEcisv3WKyYovpm856G2k+g/5LGyYMadhhJeeUKC
X-Gm-Gg: ASbGncsBHbxfAZbbJTtLeOyx125rqQrf+woKBccoJ5Ci1g0cOgxefiRPILNThfXk3C2
	R6GRxvlGvtW8/w8N1q6nt/OleJeP6WL9LFKj0C8IP42xTXhidxc2vjT0G9wKq0vIG1gRkhStTQ+
	lW505lEiaYCR6tyqlcqF1S/SmF1POM91/A6Z7d4/RhMNrCyn/wMlv80U2yAPh51Il0/2gs9s9sL
	NaUqv8tGCIfUpMbOR5nsnLqbEYojX559j06jVnVSvifZ5EsQyrazU3LHzFIb2Foln0HPXSCXUMh
	DUj41Aky4tV5gGGjVro0kM+6orqrFhGrx27L9LY6GYVpzt5X4nU+m1Vf6t1oKo/D3LziEQCI4cw
	eemhOiBLNtuBPg+tKXw5tqAZztOD4eD6WXQk4I+Ed2DGz1hk6aWg=
X-Google-Smtp-Source: AGHT+IEAPIHSh4hgJXxkGM/gbVDS+wKRULShkohKvDVmhlrfqOr4uXmfMr893MaJQjRUWFri0I9k1g==
X-Received: by 2002:a05:600c:4f0c:b0:453:76e2:5b16 with SMTP id 5b1f17b1804b1-4562dfc10ddmr11124195e9.0.1752667141765;
        Wed, 16 Jul 2025 04:59:01 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:1dbb:ef25:3e5c:8636])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b60e3ed902sm1719981f8f.91.2025.07.16.04.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 04:59:01 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chris Kennedy <c@groovy.org>,
	Kevin Thayer <nufan_wfk@yahoo.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ian Armstrong <ian@iarmst.demon.co.uk>,
	John P Harvey <john.p.harvey@btinternet.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: pci: ivtv: Add missing check after DMA map
Date: Wed, 16 Jul 2025 13:57:46 +0200
Message-ID: <20250716115758.58962-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA map functions can fail and should be tested for errors.
If the mapping fails, free blanking_ptr and set it to 0.  As 0 is a
valid DMA address, use blanking_ptr to test if the DMA address
is set.

Fixes: 1a0adaf37c30  ("V4L/DVB (5345): ivtv driver for Conexant cx23416/cx23415 MPEG encoder/decoder")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/media/pci/ivtv/ivtv-irq.c | 2 +-
 drivers/media/pci/ivtv/ivtv-yuv.c | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-irq.c b/drivers/media/pci/ivtv/ivtv-irq.c
index 748c14e87963..4d63daa01eed 100644
--- a/drivers/media/pci/ivtv/ivtv-irq.c
+++ b/drivers/media/pci/ivtv/ivtv-irq.c
@@ -351,7 +351,7 @@ void ivtv_dma_stream_dec_prepare(struct ivtv_stream *s, u32 offset, int lock)
 
 	/* Insert buffer block for YUV if needed */
 	if (s->type == IVTV_DEC_STREAM_TYPE_YUV && f->offset_y) {
-		if (yi->blanking_dmaptr) {
+		if (yi->blanking_ptr) {
 			s->sg_pending[idx].src = yi->blanking_dmaptr;
 			s->sg_pending[idx].dst = offset;
 			s->sg_pending[idx].size = 720 * 16;
diff --git a/drivers/media/pci/ivtv/ivtv-yuv.c b/drivers/media/pci/ivtv/ivtv-yuv.c
index 2d9274537725..71f040106647 100644
--- a/drivers/media/pci/ivtv/ivtv-yuv.c
+++ b/drivers/media/pci/ivtv/ivtv-yuv.c
@@ -125,7 +125,7 @@ static int ivtv_yuv_prep_user_dma(struct ivtv *itv, struct ivtv_user_dma *dma,
 	ivtv_udma_fill_sg_array(dma, y_buffer_offset, uv_buffer_offset, y_size);
 
 	/* If we've offset the y plane, ensure top area is blanked */
-	if (f->offset_y && yi->blanking_dmaptr) {
+	if (f->offset_y && yi->blanking_ptr) {
 		dma->SGarray[dma->SG_length].size = cpu_to_le32(720*16);
 		dma->SGarray[dma->SG_length].src = cpu_to_le32(yi->blanking_dmaptr);
 		dma->SGarray[dma->SG_length].dst = cpu_to_le32(IVTV_DECODER_OFFSET + yuv_offset[frame]);
@@ -929,6 +929,12 @@ static void ivtv_yuv_init(struct ivtv *itv)
 		yi->blanking_dmaptr = dma_map_single(&itv->pdev->dev,
 						     yi->blanking_ptr,
 						     720 * 16, DMA_TO_DEVICE);
+		if (dma_mapping_error(&itv->pdev->dev, yi->blanking_dmaptr)) {
+			kfree(yi->blanking_ptr);
+			yi->blanking_ptr = NULL;
+			yi->blanking_dmaptr = 0;
+			IVTV_DEBUG_WARN("Failed to dma_map yuv blanking buffer\n");
+		}
 	} else {
 		yi->blanking_dmaptr = 0;
 		IVTV_DEBUG_WARN("Failed to allocate yuv blanking buffer\n");
-- 
2.43.0


