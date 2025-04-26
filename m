Return-Path: <linux-media+bounces-31095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A67CAA9DD0B
	for <lists+linux-media@lfdr.de>; Sat, 26 Apr 2025 22:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 017611B66C42
	for <lists+linux-media@lfdr.de>; Sat, 26 Apr 2025 20:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41A31F2361;
	Sat, 26 Apr 2025 20:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHecRaCx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947E617E4;
	Sat, 26 Apr 2025 20:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745698547; cv=none; b=aIGOB3wHE0/0XBYk/cUzwBaM5mSh3A9CR9m6p2fvt5rZqKKRo0OUECa0zHkUKZHb9oGh3xGKbdq3CeqEV94DI0JIptTpc+QZZryLcHuHiYCIq8ZwmY8tjlJ107Y/tqVDfi4OUj58UfQJR+tDR4qL0zuYOsnjY/Pmx9hCCKmGxHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745698547; c=relaxed/simple;
	bh=oQI2Vlcq+Do2XX0ueKuIVwWTWrjJ/Mpedkekpl8YqUg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZucEtkYx15bcRhukSxRu8GKthN2pcp2g4KWtHfQr7+4QVWI6AMlZk7erfVh3uuqN2wTukzCd016/3XT98zaluzRjR4IivXRg1xBqYFlvQCWFPrAsn9UWWXn4F3eFh55pXWqyhggadloZWBCBR8ZI05BPftbCETEFtQ3O9uXwcE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHecRaCx; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso5518345a12.1;
        Sat, 26 Apr 2025 13:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745698544; x=1746303344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SA3kbs8doy++bBhyIV82eRDJHhYXZx0+209uQTZFZ5o=;
        b=UHecRaCx8D06J3DggcnKuTZ3qlmv2be0Ot0wHzUlF2YUSpn1OZKX5zvWHrpgxpguz4
         axF97c4S4pwIoGTNmskHPPfNLeGBVQtkSy3pTE1bEgO77kNYHZw61lLAdnOT4spGxdCD
         6DuH1WiQUnqzXZm3N3XcaP7bUoeNcE29DRfPtU011T0wkmYiXsj3TbBrBZOpzG6VNT6z
         7TcpidFLiSDTKukwUhf05xyGjScoTjDVnIj/E7Swtq4+0xRaxDfrifkxOxjDdl2CRPHw
         YOi6qkAJaoOEM5R++VePzNWNpNKExOmiUzwW6mP8JJ9NibP7g23wCOjYXb+RaTCovCAE
         dfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745698544; x=1746303344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SA3kbs8doy++bBhyIV82eRDJHhYXZx0+209uQTZFZ5o=;
        b=n8tjAiXOWBYnfBguk1Ed7Ms0FPq0iXokpWsshqjVczsI1zgfblacIGRLIUpy75/Qhq
         7018LNIo3d3Zol/H8cknQSdE8QSu1PMviSqjan0CTdk9BFF/C6r8Jp7KTuvbqTTeYErx
         beieOgrAhLf6EERliaF4s0hfeotCfFvFuDi50Y2tw/VoU2uXLp51MEkiqUQzyUmnrSzh
         00uZ4LOWxo5RoJqT4tN3hLVPL06lJPwcn5a2igPUFnHNwN65TPYj0B1kcctBF9mz0pSL
         0rPuujmrKEoYgCGibHJnUN/2fXyUywIAM5XBSZwWPJ4EJyf37RJzI5x48lEKnoZ4o1I5
         Orgg==
X-Forwarded-Encrypted: i=1; AJvYcCXZTpvzXsdA/QKE4vwZpBiARVtmqpVHHWbPHANmAdO0hhvezZR0MdkWkZ4Y0cbxo7MgUQ4hJCBw0SSQ0GQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiiEWCKz8eeL9x6f1IHuONavEcornFmID3jXSvtnUMCYUm4of4
	OfqD0s0qAE/lCsQswlAmAxyCEHKVtoSZSynvauXF3WhVjaCytnFpcd0wAG62RdiqZw==
X-Gm-Gg: ASbGncuuT/04KgB8ZSK3H/7cycXl/q4rpNQzg8MPiT/lj0+tHmuOYHD9xqMT6quB+Ou
	aai7PjBPxUrO5MBimeN7eqL3fH09612VLK8/2SilG4e6P0mWRrr/dWmMJV1j9NTaOhjkAUZMVqj
	6cGYUme867PfcoukfxumOn7LtOMFjwl6DtyKT10Pu2MTQJ6UfEWmmk12HgAWkrnUUqJEC7xjnHR
	pE9X8G47MgGTWFi5y6D8++XBrIa1jpGqOTbB4/G0LQG/0y2w5Y8Pa2Rfvs8e3UzfUp9uM5FoxPf
	wr4dkZdSRaFWJegxgA4d+wYi57OHBMxv/yL2Df24u3ByD57YH1wJrTFn32igOyxd62TZNFYARta
	NLmqKwtvzJGyoVvygqX2HRNtamqs+eTFmeDCF/86p8wyIBJowDg8O/xX//DT+PpnJyeKxiaemJa
	awp5s5uR+xENra
X-Google-Smtp-Source: AGHT+IHSxI2OpEowghVxOjDGVFRGURz+LYyOygcmh6W2OqXBDlb0eIjEZe5Q7f5TL5Mwxz/StBd3Cg==
X-Received: by 2002:a17:907:26c9:b0:acb:5adb:bd37 with SMTP id a640c23a62f3a-ace710c6dc9mr637864766b.23.1745698543460;
        Sat, 26 Apr 2025 13:15:43 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-4b21-a36c-f1bf-ef25.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:4b21:a36c:f1bf:ef25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc62sm333457966b.25.2025.04.26.13.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 13:15:43 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: andy@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 2/2] Staging: media: atomisp: style corrections
Date: Sat, 26 Apr 2025 22:15:08 +0200
Message-Id: <20250426201508.522222-1-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrected consistent spacing around '*' and braces positions

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 5a8e8e67aa13..77c7245091bb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -333,9 +333,9 @@ static struct sh_css_hmm_buffer_record
 				   enum ia_css_buffer_type type);
 
 static unsigned int get_crop_lines_for_bayer_order(const struct
-	ia_css_stream_config *config);
+	ia_css_stream_config * config);
 static unsigned int get_crop_columns_for_bayer_order(const struct
-	ia_css_stream_config *config);
+	ia_css_stream_config * config);
 static void get_pipe_extra_pixel(struct ia_css_pipe *pipe,
 				 unsigned int *extra_row, unsigned int *extra_column);
 
@@ -2260,8 +2260,7 @@ alloc_continuous_frames(struct ia_css_pipe *pipe, bool init_time)
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "alloc_continuous_frames() IA_CSS_FRAME_FORMAT_RAW_PACKED\n");
 		ref_info.format = IA_CSS_FRAME_FORMAT_RAW_PACKED;
-	} else
-	{
+	} else {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "alloc_continuous_frames() IA_CSS_FRAME_FORMAT_RAW\n");
 		ref_info.format = IA_CSS_FRAME_FORMAT_RAW;
@@ -7889,8 +7888,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 
 	/* check if mipi size specified */
 	if (stream_config->mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
-		if (!IS_ISP2401 || !stream_config->online)
-		{
+		if (!IS_ISP2401 || !stream_config->online) {
 			unsigned int port = (unsigned int)stream_config->source.port.port;
 
 			if (port >= N_MIPI_PORT_ID) {
-- 
2.34.1


