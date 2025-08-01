Return-Path: <linux-media+bounces-38726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3190BB1855C
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 18:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B13D81891C4F
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 16:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C8828BA81;
	Fri,  1 Aug 2025 16:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADx08I9p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11B428B513;
	Fri,  1 Aug 2025 16:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754064062; cv=none; b=dTpLAlCrLgk64tuOxeiM0gjWwS1fSFd7O/hBEu8tPOcghvqAbjxrY+1XcijDclDFDZlLtjgA/bRTzhNIqJvdfh5wvvJ0inFzCXQxYCfhDgFe6tYkFGxIK+awwgjL2s2rcFrmLER+apCOZlP5c+cRaMYwo2omxkSaqUD7R8BjmIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754064062; c=relaxed/simple;
	bh=gxbyO/nRf/1euIk2zGL39AVfBifO9dw5pC4STJtJJe4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V7wBh+NcqH+PD4y30mUsM8wv5bAAMS5K3MYPfSc6jexl169LAMYGPD+96/f9GctJuKK5MyXNy/M9Z8G872HlvTBsxTBG0N4U6/t98sMpkCtzWPXaMAgidT2s7In1sGoHYPWEfYrsO/rKRTBuTiKNu4KKEE/XK2Po8uDMZ5vmX5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADx08I9p; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-455b00283a5so9949555e9.0;
        Fri, 01 Aug 2025 09:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754064059; x=1754668859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u4xW5Buo0/4Bn0zJX3iGqHwSKxl50sPUyBxGezBYQu0=;
        b=ADx08I9pKarnGT+WMkhfaQzgZ/XcbgtChjRvi0CJXU1tHrS40SCU0VzhCU13Dqd+Ho
         +tp1/RLbmwv1WvSCAt4R1ESkVyj0fOMQH6O+0znkByjR7npmWxbJwTBSzd8wCBItSdpQ
         WhS3AdW5VxgsIQEn+if+HDZy2FKTrqsY/4ezz1grXQNCMD0/JAk6bX7LdEaNxYe797E9
         XY3Yh1U8EqXjKMqsr+mOywydscTMHhW/KhchLO9daDDiCaKQqwlhVA33N/u074s/WgrL
         ONlcEnGdh5dGJeUobNzyxq7U6FT5s+yiOuHgV2IOlliwAYytDMMFAh7s/TouPPrNtw77
         1Nug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754064059; x=1754668859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4xW5Buo0/4Bn0zJX3iGqHwSKxl50sPUyBxGezBYQu0=;
        b=YSuBKYXs4LEq43fxJ37/0GSq7hzCGL375h6xFnK/xMTcAs0PJ9ngZwyZWt3QnqVk9Q
         QZNWK+flh1nV1s5/f6TldU59sBX6JAhk4mRJP65IU0HvFIkIlfiQyD1j/ZX0gA2FmLaE
         5NyBjzmjjdEhSyL/LsvIKB4gxH3YxRBcmPrsaeqFK17VfE0NGqvZO9h3bLC2kgViTeEa
         IjNsl/IXQ5BIhenkFHaxPJkNI1oIHy18GpP4+jtlaOajIT16w6IkxS/mUV2vxvCqIvxM
         W8lj8RYO2DYycZLM4tkb+EkFCOPms2BKDDmprip3tNlWyuLAgtxTb2UucTGZz+lG6pEY
         Ti4w==
X-Forwarded-Encrypted: i=1; AJvYcCULWuEG//JgiN6Sfok5OXBc2QjZ+hqLCPqrHMh6g6oXjdPNZ3NVnWU1lYvDppnLYx5vRx0EGvCavSIPcyQ=@vger.kernel.org, AJvYcCXTYzTNx3j0tH5Xr5HaN76xemQEc4caV08l57FRyDnqxoDt9PfueoMEIFFAiFBFHObS26Rgn+WIV2HBnbU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrb1z+/ug87Xc+dLcUdm/IMbjSOImPnjWFDX+Httgt6phxtVfW
	IdEMURnHDeZUhjyfRPNx1rirCgnaIjq77YjFT+VJ1dbMzrdljdg9s0Ox
X-Gm-Gg: ASbGnctVZWbgro9PrAXwxgRY//rTTCDaTkllVNqx/ZY5J9llNygGLcA0TnBCz/g/aRi
	zjtzn2s0++3qxTgHOwM54C64cVpAM41db+o/1Pv7qpNWx0IhLg6m3dh2rqReQdsZQKjsdVBG0Ks
	gtdzU4MBQnNqxv7gm3zfA89mPRAsgaKPWMPCywT8KybL8r/Yvxw7gxVrX2NpVOCCq3DRL/f2uYb
	NBp5z+LO4AzBVFLtjwcvdoENmhWIQVny4ekHKFtirkbhtFXuq7bPwruJ2N+m73+E5R8P2jo7aFl
	SaJ6H5UDdE+Ir0HJXiglDm740W+7NxYGr5/UkMgj0g59dagRADkNe932KAlOM0MNm+NsP9f83aL
	skQWGtyQM3tXkoE4wUP9r
X-Google-Smtp-Source: AGHT+IF9JwLpR1JPS1Ju0IJ8Bt8BrxT04aZO/d6OuQjLQr1C7i8RtgkGdUSbXUCIePYULDMObludzQ==
X-Received: by 2002:a05:600c:8b63:b0:456:475b:7af6 with SMTP id 5b1f17b1804b1-45892b931ecmr101032855e9.7.1754064058758;
        Fri, 01 Aug 2025 09:00:58 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c4534b3sm6249748f8f.47.2025.08.01.09.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 09:00:58 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: atomisp: Fix incorrect snprintf format specifiers for signed integers
Date: Fri,  1 Aug 2025 17:00:23 +0100
Message-ID: <20250801160023.2434130-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are incorrect %u format specifiers being used to for signed integers,
fix this by using %d instead.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
index bda35614c862..0f0d16f4ce7c 100644
--- a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
+++ b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
@@ -497,7 +497,7 @@ void ia_css_bufq_dump_queue_info(void)
 	for (i = 0; i < SH_CSS_MAX_SP_THREADS; i++) {
 		for (j = 0; j < SH_CSS_MAX_NUM_QUEUES; j++) {
 			snprintf(prefix, BUFQ_DUMP_FILE_NAME_PREFIX_SIZE,
-				 "host2sp_buffer_queue[%u][%u]", i, j);
+				 "host2sp_buffer_queue[%d][%d]", i, j);
 			bufq_dump_queue_info(prefix,
 					     &css_queues.host2sp_buffer_queue_handles[i][j]);
 		}
@@ -505,7 +505,7 @@ void ia_css_bufq_dump_queue_info(void)
 
 	for (i = 0; i < SH_CSS_MAX_NUM_QUEUES; i++) {
 		snprintf(prefix, BUFQ_DUMP_FILE_NAME_PREFIX_SIZE,
-			 "sp2host_buffer_queue[%u]", i);
+			 "sp2host_buffer_queue[%d]", i);
 		bufq_dump_queue_info(prefix,
 				     &css_queues.sp2host_buffer_queue_handles[i]);
 	}
-- 
2.50.0


