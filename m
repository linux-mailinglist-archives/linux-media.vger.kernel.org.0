Return-Path: <linux-media+bounces-37872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EFEB076E5
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 15:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44A7C584C83
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 13:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9AA1A9B58;
	Wed, 16 Jul 2025 13:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDTLfxoN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E275F1A3167;
	Wed, 16 Jul 2025 13:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752672461; cv=none; b=b14rJp6NVPzwy1R5Spx6a0pbGT5YCWlvLuMIFrmACLWaUEws2ExISV9b4Sjywx+4PUZ+W170d3VVpRZGZIRVjVhLEt70W3G+v3daZFf/RplRn5Aphctx0gSUQ+8ot/JlxWEHgqO7wbtQaVAe3PRa67iEjYLOKVjNhaSwHS1YJuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752672461; c=relaxed/simple;
	bh=mJHH9mrRvoAVJd72qHUHZ+hZUugpZdl/Y3jya6teKPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TAPytlfzGwUJk9i8AZJ/d3QSy9N6pxgtdIwXBYGEYwyodXYisB193lVD6DBRKKMtxQVqyXiSEBV/1nVR4qy0ExKFyz6DSYqNI8K6IzQfLiFfacDhnOAV1Nole3Fk/doxrYMolTT1wJGQ1WA10RHgtxblHiYfOJl0vICtKOSn6Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDTLfxoN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-455d297be1bso1596165e9.3;
        Wed, 16 Jul 2025 06:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752672457; x=1753277257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zGpk1bg/YdLB314AgUTlsNsGVFPtB24F83/5sKWjiec=;
        b=dDTLfxoNymW2eXTiv3U8bl+h3L8gyrkBxk6WYZQpo9UkaRdMB+KZGoRVxKR4FrbFnl
         dCzhBbkAZUVtyWq982P3mpxu1gkQmPZKtSZgZ85zh9yjX34qVnG3skLzcWoNiWQ3tZ2f
         42qNASHeXDHDjaeenDvMeQSNcYJKlTAYOaJR+i6UxqSunOoHhSFqCXA58lwELOfoL0o1
         htVgeELGJgevgtFX55hVICIFEeeDqt62oz28IyAwPpATLIVDZKyGdlwnB+9GBicPHHFJ
         +pbBRacBWachxuHD9Npkln+RRq2CwfxDquv/hrLP4jMmiRhylUHJIe6jL8HzMo/KFpuG
         a6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752672457; x=1753277257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGpk1bg/YdLB314AgUTlsNsGVFPtB24F83/5sKWjiec=;
        b=HHsC4XCo/Rdss2Gv2q1RRPeZZy0z49c/ycS2z9+RKKabTNz6LIb3cAPDQbyX0Ch+9M
         QK9MtUz/v3/jXyPj/mB/DTGFNFK0mGfnFVGo9mZldKQ5AEzlvzUAoqi53OuIDEgJDRfx
         yuco0O86CIGoOfk1YEp3UxEsDP4aayl7j4vwJcs1H9WVlMpZGO/WZiVJWtVRg1O008RK
         ptNPQIhE/DznFLuhI1GlaZQaSe/4FRXB51apl6pn7oZ8rTGRTfY+dJxYcm4aGgqf9u6i
         C3JT/PBLDqjq1bWEJ2KByrc0z+xV/UfyS6IjXhh0aXiAZgwa8EddqD8TVSNbc3GO3r9O
         rc0g==
X-Forwarded-Encrypted: i=1; AJvYcCUl0VG5gIY8PEq0SSBqCPfdwBSiRD3AOzrR13X9K7VvzK9Ud+QP7Z4z4Ihv9Y0WOAoYQhNFqPt/ww35bVg=@vger.kernel.org, AJvYcCWjBLbW3qLcEtPhn8GduIsAGWG1LWmoO6/2jTeBiynLncYWq0df1EM+VnKSyZHyOkDztSxGF3Jh4mnTDgk=@vger.kernel.org, AJvYcCX83H6T1sEiMwcQOUtzgbUr9VZ4F4BogL872KHDiiRp3Geg1MFtkkrpqVImL9NaJFYQt0tM50oy@vger.kernel.org
X-Gm-Message-State: AOJu0YyzMGuhjbSHRt5FRdSjoEi+bTHFDd3dUsYDc6q/3UUHrhsuAXRI
	hRUClFqQZZHmb5esrXYE9c2PN9UtodMmoF8W0Mc9Ylom2ukMcaTXH/x5
X-Gm-Gg: ASbGncvI/Q/alEA33anxOjcRDJcTf4csyFsw9WcB/Ow+iYlaw0IxCJ8eY/d5BEjkl7/
	F7xSSPPwDtYXSzOSFEWM7sgV0ixudfiRAKs+xGT1x6nD+01AieqaJyQia4j7hGZ0ef2OWeTk081
	EqLyPOllibLFUazj8GjPrbp1CCUc+8vaXbC+3fidbLqblfC3B005dnAMu9EgRdNcnx0piMpWBiA
	6XLwAflrMxKkdFaWid82pVyhm3tCjmXbwxvX4M/GKpgqPHHDYvaWIObvLPc8UJq9oZm+9/OkeKJ
	kJCJjxOtvI7S+kKBs2lZdhF/KI+AVqltQHflz3Mhp/Q4W8qodec2AK+CpybwSeladwmhHH7k+bT
	V/le2edULB4U0roVSkaz5uVcOV5qEUrMxBOd2G2Yyno/yKSp/bTA=
X-Google-Smtp-Source: AGHT+IF9t65SNW+85rJdxahcYlGLTJQenTaWNUtv7/7R8pqD2DlxzFF3ETQWrt/M5EbxZZV+z4Q6Hg==
X-Received: by 2002:a05:600c:620b:b0:456:12a9:e92 with SMTP id 5b1f17b1804b1-4562e2797e4mr11755725e9.5.1752672456786;
        Wed, 16 Jul 2025 06:27:36 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:1dbb:ef25:3e5c:8636])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4562e819e04sm21483625e9.18.2025.07.16.06.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 06:27:36 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	John P Harvey <john.p.harvey@btinternet.com>,
	Kevin Thayer <nufan_wfk@yahoo.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ian Armstrong <ian@iarmst.demon.co.uk>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: pci: ivtv: Add missing check after DMA map
Date: Wed, 16 Jul 2025 15:26:30 +0200
Message-ID: <20250716132631.75780-2-fourier.thomas@gmail.com>
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

Fixes: 1a0adaf37c30 ("V4L/DVB (5345): ivtv driver for Conexant cx23416/cx23415 MPEG encoder/decoder")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
v1 -> v2:
  - Fix Fixes: line
  - Add Cc: stable

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


