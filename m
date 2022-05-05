Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFDA851CC73
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 01:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386566AbiEEXIK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 19:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386561AbiEEXIG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 19:08:06 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 055CB60070
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 16:04:25 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id t6so7879670wra.4
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 16:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1ODFWTPgqE1W4ZeXLlzmSDrqxPKsWiY7mz/SYbLjvDI=;
        b=otOvwaiP0QaJLgJ7jOvwhlFrjV38w9IC8bMt/LIKjdeXOctCrWH7GHpuKKkl+qE5c8
         8zQi+PJ/MVwXirMubdj2EKzLu0ynWWZheOME6irrrOMVotd9rXomyhGdrWPexuJupNQl
         rI8kR7W0hLfmE/yz/jvn8veM+iFGTnkRXbSdcJbDX3fbHdlC3NWd9rs/NqgL4shXE/30
         IxXawZaujOe1zYB7NTrD2mgbBZts/cGjWZFd+pDxm4mhG+sJkQwOYOoXJY5dgCaDfRk6
         NMx/VZ4F60MTPhmljXz8U5NcUEonXz4b14En2OKGMLCyo+CNyHCeMtRs8oJPiyIokv9B
         U39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1ODFWTPgqE1W4ZeXLlzmSDrqxPKsWiY7mz/SYbLjvDI=;
        b=EP5Y7kz49/2hYJGWWGjkA9d8m1EqeCsdS7GRAonJqixBh0ErLwB9Wes9chM9N/6Q8U
         wpbngxDOBAhPNyIgIKcnqV65gj5VVeHX+BS9XVI5mlQ/3VSlNwuNnxlAf/5DOlV9uT2/
         NQIF1EmsZG0uufaDo6DbOavBgj2kRyXBMGiUuHFkIoxmlBGe8hPSjQ0RuC5JsJuYyN9k
         3lrrS2rFUy+XA4orAVYwGrkVwbLXvw0PfPd8i6QBlpbc/dvnqJngcm64XwG9WbnGiCLN
         FNMcLyU+o3tZhs+nmMyuZKh8ApP8V3SZ/P9KSnIbUzBrwY41twhKqbwpYwKqUyQbNDj0
         byrg==
X-Gm-Message-State: AOAM530Age4+ipxeKyai/wGlHYTztxgDHbOHqACLqKCupZuF6MtEmJbX
        d/XvM0XKVjIkSt1FXRnsEsO7bnR/qbA=
X-Google-Smtp-Source: ABdhPJyrBg3CYhGteniO5KfTlLg6IaHhIJb0/JjFVC59n1XZfpM4zZJtViZonUzFTSdKnl0TG/9HlQ==
X-Received: by 2002:a5d:6d8b:0:b0:20c:7022:7504 with SMTP id l11-20020a5d6d8b000000b0020c70227504mr288237wrs.183.1651791864573;
        Thu, 05 May 2022 16:04:24 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c339400b003942a244f33sm6782130wmp.12.2022.05.05.16.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 16:04:24 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v4 14/15] media: i2c: Add hblank control to ov7251
Date:   Fri,  6 May 2022 00:04:01 +0100
Message-Id: <20220505230402.449643-15-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505230402.449643-1-djrscally@gmail.com>
References: <20220505230402.449643-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a hblank control to the ov7251 driver. This necessitates setting
a default mode, for which I am simply picking the first available.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v4:

	- None

Changes in v3:

	- New patch

 drivers/media/i2c/ov7251.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index e50514bbb345..20591d8227c9 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -61,6 +61,8 @@
 #define OV7251_ACTIVE_WIDTH		648
 #define OV7251_ACTIVE_HEIGHT		488
 
+#define OV7251_FIXED_PPL		928
+
 struct reg_value {
 	u16 reg;
 	u8 val;
@@ -139,6 +141,7 @@ struct ov7251 {
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *gain;
+	struct v4l2_ctrl *hblank;
 
 	/* Cached register values */
 	u8 aec_pk_manual;
@@ -1488,6 +1491,7 @@ static int ov7251_detect_chip(struct ov7251 *ov7251)
 static int ov7251_init_ctrls(struct ov7251 *ov7251)
 {
 	s64 pixel_rate;
+	int hblank;
 
 	v4l2_ctrl_handler_init(&ov7251->ctrls, 7);
 	ov7251->ctrls.lock = &ov7251->lock;
@@ -1522,6 +1526,13 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 	if (ov7251->pixel_clock)
 		ov7251->pixel_clock->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
+	hblank = OV7251_FIXED_PPL - ov7251->current_mode->width;
+	ov7251->hblank = v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
+					   V4L2_CID_HBLANK, hblank, hblank, 1,
+					   hblank);
+	if (ov7251->hblank)
+		ov7251->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	ov7251->sd.ctrl_handler = &ov7251->ctrls;
 
 	if (ov7251->ctrls.error) {
@@ -1617,6 +1628,7 @@ static int ov7251_probe(struct i2c_client *client)
 
 	mutex_init(&ov7251->lock);
 
+	ov7251->current_mode = &ov7251_mode_info_data[0];
 	ret = ov7251_init_ctrls(ov7251);
 	if (ret) {
 		dev_err_probe(dev, ret, "error during v4l2 ctrl init\n");
-- 
2.25.1

