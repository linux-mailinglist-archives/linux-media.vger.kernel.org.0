Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00AB233C702
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 20:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232628AbhCOTpa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 15:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233699AbhCOTo7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 15:44:59 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36EC8C06174A
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 12:44:59 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id a9so32875848qkn.13
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 12:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nNFBPyWNsjgTv94JljI0Zef/+sdF3szhoHu6JVvvVBk=;
        b=YpzD1UvnEO89P0xMmuo01iQsExJa+I4e0mGeGRxZuecJ3tJlZdrE+AKWxU50jddw92
         YZZ3i1lFaQTw7s/slytGERcw4wqUMJ7P5IeTxOFcY7mW/9fcOKYyBRbuNQ05/OTA5l0s
         J5qz1EJt1EFgSA4TugeYG1h5sR3t8nbX4EuOauXc1E/ZJKDD1sCvTY1fgYVYi8plHcx0
         dwR5pZqHFU0TqWRDV5EeE+y3j8RwUPV61HvLlfPTjzVyXbANHOTmmMRtYXG9cUGZvxSB
         g5eDEZRT2ivFCjUTuIxv74dBdMdyStfD6MDMJXdKOnIDewsX+sXdUbEZSG2BXSLHAuGV
         6Lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nNFBPyWNsjgTv94JljI0Zef/+sdF3szhoHu6JVvvVBk=;
        b=Nqlbz3a9arEfnYXvWRpwlN3IOb5oC310ZJycQxVFgFrg5CdabS3bpX3bjFQ0nClUuj
         H93iiMRck1WmuRdjePTb4EuOCafe1vPDd2uSTTJrVHPSUV4QI+fVjuZGzUeF2ic5WN7m
         i+Nhl9E/JsqJzKR4iX8Hw53Pi+3p9H6bAAdAHxiOa4iY92Kt2UKEjrEvaBO20Czhh/6W
         dEKSOs9akcFY29cxJSmr6kCy4GCPjNUhe0FTvwLS+sAOdpY+D/p2uPgDGYDF7fwZWH1B
         vICY8Xz+O4maJ/Ziyc3Ir1I9pnvgO5W+KlWgqmbQ1WMnKwE7oVdOTsJN97IZULeO2YA0
         3uPQ==
X-Gm-Message-State: AOAM5339gel4Ey5wU0GRUzs/GKWy5efpm7AENMBscD2ZPhJyIkj8pc63
        f9snln4CTvlRC2XQnAPGxbI=
X-Google-Smtp-Source: ABdhPJy2WT2lym/AX7wwDjuIZGjm4PFiqEPdh0PzgJuxKtGwTT8W1K2/d3u4FN/apxZJuqsIi8xNGg==
X-Received: by 2002:a05:620a:16b0:: with SMTP id s16mr4054452qkj.115.1615837498477;
        Mon, 15 Mar 2021 12:44:58 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919::1000])
        by smtp.gmail.com with ESMTPSA id z8sm7468576qtn.12.2021.03.15.12.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 12:44:58 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil@xs4all.nl
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] media: camera-mx3: Remove unused header file
Date:   Mon, 15 Mar 2021 16:44:46 -0300
Message-Id: <20210315194446.183453-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315194446.183453-1-festevam@gmail.com>
References: <20210315194446.183453-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx3 camera driver has been removed a long time ago, so get
rid of this unused header file.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../linux/platform_data/media/camera-mx3.h    | 43 -------------------
 1 file changed, 43 deletions(-)
 delete mode 100644 include/linux/platform_data/media/camera-mx3.h

diff --git a/include/linux/platform_data/media/camera-mx3.h b/include/linux/platform_data/media/camera-mx3.h
deleted file mode 100644
index 781c004e5596..000000000000
--- a/include/linux/platform_data/media/camera-mx3.h
+++ /dev/null
@@ -1,43 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * mx3_camera.h - i.MX3x camera driver header file
- *
- * Copyright (C) 2008, Guennadi Liakhovetski, DENX Software Engineering, <lg@denx.de>
- */
-
-#ifndef _MX3_CAMERA_H_
-#define _MX3_CAMERA_H_
-
-#include <linux/device.h>
-
-#define MX3_CAMERA_CLK_SRC	1
-#define MX3_CAMERA_EXT_VSYNC	2
-#define MX3_CAMERA_DP		4
-#define MX3_CAMERA_PCP		8
-#define MX3_CAMERA_HSP		0x10
-#define MX3_CAMERA_VSP		0x20
-#define MX3_CAMERA_DATAWIDTH_4	0x40
-#define MX3_CAMERA_DATAWIDTH_8	0x80
-#define MX3_CAMERA_DATAWIDTH_10	0x100
-#define MX3_CAMERA_DATAWIDTH_15	0x200
-
-#define MX3_CAMERA_DATAWIDTH_MASK (MX3_CAMERA_DATAWIDTH_4 | MX3_CAMERA_DATAWIDTH_8 | \
-				   MX3_CAMERA_DATAWIDTH_10 | MX3_CAMERA_DATAWIDTH_15)
-
-struct v4l2_async_subdev;
-
-/**
- * struct mx3_camera_pdata - i.MX3x camera platform data
- * @flags:	MX3_CAMERA_* flags
- * @mclk_10khz:	master clock frequency in 10kHz units
- * @dma_dev:	IPU DMA device to match against in channel allocation
- */
-struct mx3_camera_pdata {
-	unsigned long flags;
-	unsigned long mclk_10khz;
-	struct device *dma_dev;
-	struct v4l2_async_subdev **asd;	/* Flat array, arranged in groups */
-	int *asd_sizes;			/* 0-terminated array of asd group sizes */
-};
-
-#endif
-- 
2.25.1

