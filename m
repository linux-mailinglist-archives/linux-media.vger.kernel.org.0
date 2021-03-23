Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34953345FE7
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 14:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbhCWNlJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 09:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231379AbhCWNk5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 09:40:57 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D28BC0613D9
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 06:40:57 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id b16so23515850eds.7
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 06:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bWnwL0ZcjEdnfAaSRAFj18yj0nciW8rO6g63xs68f0I=;
        b=UusK0uE1BnnxrgAkJcosy9NdDXlFZ5AlsBnQwjIfrXGz6sOl/xkAUR9LsJn03uKVZZ
         1O6p92+BjLQsfg6HMLJo7ihUk6emG0+M91CkGvPUoH7mEwZINk/Tsy3+yItQFKZdLNfu
         pTc/9uySiOEzJ+THfXjoh4NnmqRCX3rlztfnV+hhwphklqUQLrX7TbWzr59Sndk9GCdf
         JH2QqLa7v0Z+2PZOllvxyNZaOkhc6f+RPV8p3SeTR/FDqNyXuy/eNnIn6nBAl5qrKf4H
         7TqzId6wFXj4dBTEW9DtekAxrw+kBkMP/iU1/Nr0l9hGGNSWLhVqbP3eQUoaAv966lpB
         5FJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bWnwL0ZcjEdnfAaSRAFj18yj0nciW8rO6g63xs68f0I=;
        b=eyh2p2/7Jx3pVKc88QpByyzRjI74us7STrN32H/3TRghOsO7thjBECtGys5qgUp9LG
         wcHNlEqk7Rm0UmhnrF7urrAxyFcQe1mEAoRLt364xZOMt3Cr9xGbeumyjsNE2B0QNQQ9
         sDpjTx6LuNtc6kuoXpYdFuOLH6qcJhZK4PZdFxLs/NANZFc6QIfDwhBq/1NnyhR/z9Yq
         ehTTsytjEEbKVFRYPhu2Ws3uyOPA8Y7Psh3J0iEVThECkw9FYmF5RgwC/J6NeKcX8VCs
         6e6KbM71nba1FIA9vpPUSDAH4wpSptKwc6OY46wwoNzO8euJFnidRKQoag6Lek7oYCie
         PJCw==
X-Gm-Message-State: AOAM530le9J5GkRU6sWfCX0bM2uEeYiIVVBKd7m9Nyjfc9O6LrZdzTj/
        F4sUqSXObxgnuiNezK8OysExFxHEIvwDMYYG
X-Google-Smtp-Source: ABdhPJzJHlZ0HrkMHHDjfRzjHYkRXrN13rouvf/dquUtVFKu+NRHOOU7+qO25fW6O2cFWX8vHqMllQ==
X-Received: by 2002:a05:6402:1c86:: with SMTP id cy6mr4603404edb.276.1616506855521;
        Tue, 23 Mar 2021 06:40:55 -0700 (PDT)
Received: from localhost.localdomain (hst-221-13.medicom.bg. [84.238.221.13])
        by smtp.gmail.com with ESMTPSA id r10sm11207317eju.66.2021.03.23.06.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 06:40:55 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, ezequiel@collabora.com,
        nicolas.dufresne@collabora.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v6 1/5] v4l: Add new Colorimetry Class
Date:   Tue, 23 Mar 2021 15:40:36 +0200
Message-Id: <20210323134040.943757-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323134040.943757-1-stanimir.varbanov@linaro.org>
References: <20210323134040.943757-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add Colorimetry control class for colorimetry controls

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 7 ++++++-
 include/uapi/linux/v4l2-controls.h   | 4 ++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index ca50e21e2838..41ded74c6764 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1204,6 +1204,10 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_STATELESS_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
 	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
 	case V4L2_CID_STATELESS_FWHT_PARAMS:			return "FWHT Stateless Parameters";
+
+	/* Colorimetry controls */
+	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
+	case V4L2_CID_COLORIMETRY_CLASS:	return "Colorimetry Controls";
 	default:
 		return NULL;
 	}
@@ -1395,8 +1399,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_RF_TUNER_CLASS:
 	case V4L2_CID_DETECT_CLASS:
 	case V4L2_CID_CODEC_STATELESS_CLASS:
+	case V4L2_CID_COLORIMETRY_CLASS:
 		*type = V4L2_CTRL_TYPE_CTRL_CLASS;
-		/* You can neither read not write these */
+		/* You can neither read nor write these */
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY;
 		*min = *max = *step = *def = 0;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 6f8c08507bf4..038c722ca4d2 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -66,6 +66,7 @@
 #define V4L2_CTRL_CLASS_RF_TUNER	0x00a20000	/* RF tuner controls */
 #define V4L2_CTRL_CLASS_DETECT		0x00a30000	/* Detection controls */
 #define V4L2_CTRL_CLASS_CODEC_STATELESS 0x00a40000	/* Stateless codecs controls */
+#define V4L2_CTRL_CLASS_COLORIMETRY	0x00a50000	/* Colorimetry controls */
 
 /* User-class control IDs */
 
@@ -1661,6 +1662,9 @@ struct v4l2_ctrl_fwht_params {
 	__u32 quantization;
 };
 
+#define V4L2_CID_COLORIMETRY_CLASS_BASE	(V4L2_CTRL_CLASS_COLORIMETRY | 0x900)
+#define V4L2_CID_COLORIMETRY_CLASS	(V4L2_CTRL_CLASS_COLORIMETRY | 1)
+
 /* MPEG-compression definitions kept for backwards compatibility */
 #ifndef __KERNEL__
 #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
-- 
2.25.1

