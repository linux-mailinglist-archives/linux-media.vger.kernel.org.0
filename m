Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 390D12B2D82
	for <lists+linux-media@lfdr.de>; Sat, 14 Nov 2020 14:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgKNNz6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Nov 2020 08:55:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgKNNz6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Nov 2020 08:55:58 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E012C0613D1;
        Sat, 14 Nov 2020 05:55:56 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id gv24so1638724pjb.3;
        Sat, 14 Nov 2020 05:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=d/szZjULTAjsEsq2Yq06mdSsvdNo5/aKhBUAL0woJ5c=;
        b=eITRCN4TEr7aKjvH4QMAZRnL+5gbOQB4lvW352kF+QC/BQk39eeAe/JI/Y7z1CXe2l
         Fbcjq6vLgj+qvqBEz8QaRAYF51rkrJMEUbSaf1m384xXOXWT+eHeeLCsR+ieVigUjwRW
         QEnqTuoQUYDhhhBa41rBkmbMQxIxTmpWLvx75OjihWiMMLGK4PzGDvdKIqUBvcEkGM4+
         KXXTQ2+43WmiCnYhkWqfpA1cJi+xFshIStmpUML0Xz395tc7I4b1Zsb04IPsm/upXYTq
         tgbzhIg5lWsXcCYLjYRKoI381rjUfi83lRH5Vp9zMfbPkEphZbID1n5Xb3s+5G+Ft9BC
         Ws5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=d/szZjULTAjsEsq2Yq06mdSsvdNo5/aKhBUAL0woJ5c=;
        b=MjGmbhOxcB6+iMzVdpvvkYnc9WLOh+w/z5yjyB9tKR5SCMS1Z8Q/fh3132sWdrRMQl
         q9EqtzsvZcT2ooluKoXA/5H1tlQwKMsTmI9J02i/Jt98UusW+G72b11zxW2lDOAvTq7m
         7uOHQjt5JM07PBRT7kXRT+U9pp3utNn06FYrZryJ0VRHRvgeDrDrKmPb+Nk0ckKqYr0+
         Gjqf6jwzLTxTYM8rRj5V+sYPy0XwkHsIRiWMqrh0kkPNHecD19V/kKVSeMqO9F9oZMyC
         /dCUlcqEVQ2cgVUUcCmSxXv4wyJKPS9hy3yRyUdE0T7q6B8w9BTcm2tHaAMO48v/qEpY
         TwAg==
X-Gm-Message-State: AOAM531M9M8EHcjxsc8l8veG6azchOnmn9zvHw/z5bhmSwM95KWmx6v0
        EZZxh4lv6LeWPKkdeqXEcA==
X-Google-Smtp-Source: ABdhPJxOVYMR98/bd5FiqeVBpA/FGzOkv0qpNdhBzNGuQ7H6ElMabcL0EOJLQTyocOSb6g+7IGN2mQ==
X-Received: by 2002:a17:90a:1157:: with SMTP id d23mr6750198pje.1.1605362156005;
        Sat, 14 Nov 2020 05:55:56 -0800 (PST)
Received: from he-cluster.localdomain (67.216.221.250.16clouds.com. [67.216.221.250])
        by smtp.gmail.com with ESMTPSA id j20sm11314950pgk.59.2020.11.14.05.55.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Nov 2020 05:55:55 -0800 (PST)
From:   xiakaixu1987@gmail.com
X-Google-Original-From: kaixuxia@tencent.com
To:     mchehab@kernel.org, mchehab+huawei@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kaixu Xia <kaixuxia@tencent.com>
Subject: [PATCH] media: atomisp: make atomisp_css_continuous_set_num_raw_frames() void
Date:   Sat, 14 Nov 2020 21:55:50 +0800
Message-Id: <1605362150-11401-1-git-send-email-kaixuxia@tencent.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Kaixu Xia <kaixuxia@tencent.com>

The return value of atomisp_css_continuous_set_num_raw_frames() function
is always 0, so there's no reason for a return value. In addition, the
__enable_continuous_mode() checked the return value for possible error
which is unnecessary. Convert atomisp_css_continuous_set_num_raw_frames()
to a void function.

Reported-by: Tosk Robot <tencent_os_robot@tencent.com>
Signed-off-by: Kaixu Xia <kaixuxia@tencent.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c          | 7 ++-----
 drivers/staging/media/atomisp/pci/atomisp_compat.h       | 6 +++---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 7 +++----
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 592ea990d4ca..b787171906a9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -5083,11 +5083,8 @@ static int __enable_continuous_mode(struct atomisp_sub_device *asd,
 	atomisp_css_enable_continuous(asd, enable);
 	atomisp_css_enable_cvf(asd, asd->continuous_viewfinder->val);
 
-	if (atomisp_css_continuous_set_num_raw_frames(asd,
-		asd->continuous_raw_buffer_size->val)) {
-		dev_err(isp->dev, "css_continuous_set_num_raw_frames failed\n");
-		return -EINVAL;
-	}
+	atomisp_css_continuous_set_num_raw_frames(asd,
+		asd->continuous_raw_buffer_size->val);
 
 	if (!enable) {
 		atomisp_css_enable_raw_binning(asd, false);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat.h b/drivers/staging/media/atomisp/pci/atomisp_compat.h
index 4aea6702467e..a60551450c45 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat.h
@@ -250,9 +250,9 @@ void atomisp_destroy_pipes_stream_force(struct atomisp_sub_device *asd);
 void atomisp_css_stop(struct atomisp_sub_device *asd,
 		      enum ia_css_pipe_id pipe_id, bool in_reset);
 
-int atomisp_css_continuous_set_num_raw_frames(
-    struct atomisp_sub_device *asd,
-    int num_frames);
+void atomisp_css_continuous_set_num_raw_frames(
+     struct atomisp_sub_device *asd,
+     int num_frames);
 
 int atomisp_css_copy_configure_output(struct atomisp_sub_device *asd,
 				      unsigned int stream_index,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 9bf3f5fa4b0d..485eb349e354 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2190,9 +2190,9 @@ void atomisp_css_stop(struct atomisp_sub_device *asd,
 	memset(&asd->params.css_param, 0, sizeof(asd->params.css_param));
 }
 
-int atomisp_css_continuous_set_num_raw_frames(
-    struct atomisp_sub_device *asd,
-    int num_frames)
+void atomisp_css_continuous_set_num_raw_frames(
+     struct atomisp_sub_device *asd,
+     int num_frames)
 {
 	if (asd->enable_raw_buffer_lock->val) {
 		asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
@@ -2216,7 +2216,6 @@ int atomisp_css_continuous_set_num_raw_frames(
 
 	asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
 	.stream_config.target_num_cont_raw_buf = num_frames;
-	return 0;
 }
 
 static enum ia_css_pipe_mode __pipe_id_to_pipe_mode(
-- 
2.20.0

