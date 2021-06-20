Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB7723AE01A
	for <lists+linux-media@lfdr.de>; Sun, 20 Jun 2021 21:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbhFTTtP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Jun 2021 15:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbhFTTtO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Jun 2021 15:49:14 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9EF4C061574;
        Sun, 20 Jun 2021 12:47:00 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id f8so14675381lfu.6;
        Sun, 20 Jun 2021 12:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QJJTRUSYjIQLxUFD4qYl8I2m6+/94h3/V5V1FUIXn7g=;
        b=b8acL7uZ5TxeRsArHX8WqS6j0/RXMgOHE91CxKAydAh8kONnLql2O6OxzNYeiq+r2d
         GWgNUWVrGpBeJE1dSX4gXBpo1zJHTkg//m2hWzxFx9+G7PLZFz/OeeSCoEkF6vjp++fM
         fP/gldhOLvEkONnEFKJAPoQ0zDmlXrEEFHyiT6OqSzYoBx3V+J91tikhXItSd2oAMsMR
         xeEK4OdNfCEu97KiT3HgALveb++g7gUauRVaQLtybw4AyxKTI9EGH6pW4BC5yb/mTAwQ
         jRy7FccBZrIsMlAeLAI012bexOTDE8WXJDHWKvD/IEt+Jphd7ASgoSL9TPoudN2xogLZ
         gWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QJJTRUSYjIQLxUFD4qYl8I2m6+/94h3/V5V1FUIXn7g=;
        b=oZb4QiLUcCAdGeA2dOMbxRF+nI/nJJKvJdBMQadaz3COGUj7c+5feaanwbaf3sYamE
         a1djIzUnRC30o5okXCy86hZ4mjpJGHIyG1TjE09UaldhJLIoCjnHW/mo5AdFe3TSh+CP
         di4QnR9wcuYzNaWNZ6Ol3B1Zx3bKnSa55DQIu4d7FHazJus7h/tTrMTsBQ33m38xPpZl
         hYFNYGEMIlUr3BVxvBCDSKiqECzil0Xqe6reYuNE9Im240B05+bNNVGPcO7WijeKJmNP
         6QJyIFCb4MRVNJtsQeCzhgKOcyW0zZGbTfEglDgCvGMmGvpjgq9dyAQIsw61Qdln/ZQY
         +xWw==
X-Gm-Message-State: AOAM531jrb8FL5kKcxxhvv/y/sb0CgXV4hIc+MIItx0YsRvccte9LLXr
        +IaCqLJg1fILpZ0/4ic6z9c=
X-Google-Smtp-Source: ABdhPJwzYshMhSsoaGotMT/TySkoxzGc91M+bm7SwyHt2W60/WTUbBMK0DVzN2UO49EI9B7madp+GA==
X-Received: by 2002:a05:6512:1326:: with SMTP id x38mr11199748lfu.62.1624218419263;
        Sun, 20 Jun 2021 12:46:59 -0700 (PDT)
Received: from localhost.localdomain ([94.103.229.24])
        by smtp.gmail.com with ESMTPSA id z13sm1031271ljn.92.2021.06.20.12.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 12:46:58 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org, oneukum@suse.com,
        gregkh@suse.de
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH 2/2] media: go7007: remove redundant initialization
Date:   Sun, 20 Jun 2021 22:45:42 +0300
Message-Id: <dc1bd4f8df4e07263e7c3ff7e1853ee3dec95df8.1624217907.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1624217907.git.paskripkin@gmail.com>
References: <cover.1624217907.git.paskripkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In go7007_alloc() kzalloc() is used for struct go7007
allocation. It means that there is no need in zeroing
any members, because kzalloc will take care of it.

Removing these reduntant initialization steps increases
execution speed a lot:

	Before:
		+ 86.802 us   |    go7007_alloc();
	After:
		+ 29.595 us   |    go7007_alloc();

Fixes: 866b8695d67e8 ("Staging: add the go7007 video driver")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/media/usb/go7007/go7007-driver.c | 26 ------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/media/usb/go7007/go7007-driver.c b/drivers/media/usb/go7007/go7007-driver.c
index f1767be9d868..6650eab913d8 100644
--- a/drivers/media/usb/go7007/go7007-driver.c
+++ b/drivers/media/usb/go7007/go7007-driver.c
@@ -691,49 +691,23 @@ struct go7007 *go7007_alloc(const struct go7007_board_info *board,
 						struct device *dev)
 {
 	struct go7007 *go;
-	int i;
 
 	go = kzalloc(sizeof(struct go7007), GFP_KERNEL);
 	if (go == NULL)
 		return NULL;
 	go->dev = dev;
 	go->board_info = board;
-	go->board_id = 0;
 	go->tuner_type = -1;
-	go->channel_number = 0;
-	go->name[0] = 0;
 	mutex_init(&go->hw_lock);
 	init_waitqueue_head(&go->frame_waitq);
 	spin_lock_init(&go->spinlock);
 	go->status = STATUS_INIT;
-	memset(&go->i2c_adapter, 0, sizeof(go->i2c_adapter));
-	go->i2c_adapter_online = 0;
-	go->interrupt_available = 0;
 	init_waitqueue_head(&go->interrupt_waitq);
-	go->input = 0;
 	go7007_update_board(go);
-	go->encoder_h_halve = 0;
-	go->encoder_v_halve = 0;
-	go->encoder_subsample = 0;
 	go->format = V4L2_PIX_FMT_MJPEG;
 	go->bitrate = 1500000;
 	go->fps_scale = 1;
-	go->pali = 0;
 	go->aspect_ratio = GO7007_RATIO_1_1;
-	go->gop_size = 0;
-	go->ipb = 0;
-	go->closed_gop = 0;
-	go->repeat_seqhead = 0;
-	go->seq_header_enable = 0;
-	go->gop_header_enable = 0;
-	go->dvd_mode = 0;
-	go->interlace_coding = 0;
-	for (i = 0; i < 4; ++i)
-		go->modet[i].enable = 0;
-	for (i = 0; i < 1624; ++i)
-		go->modet_map[i] = 0;
-	go->audio_deliver = NULL;
-	go->audio_enabled = 0;
 
 	return go;
 }
-- 
2.32.0

