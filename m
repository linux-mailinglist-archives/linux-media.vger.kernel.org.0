Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDA23BB6CE
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 07:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbhGEFgC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 01:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbhGEFgB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jul 2021 01:36:01 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC27AC061574
        for <linux-media@vger.kernel.org>; Sun,  4 Jul 2021 22:33:23 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id u14so17214619pga.11
        for <linux-media@vger.kernel.org>; Sun, 04 Jul 2021 22:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F1jUXTbb2humu9f+3tIoHXLsI0UX1WeqPyARYAXIpkA=;
        b=T7YovlKMB542pbmQgFgtJcmwmIiCKxX85ZjUZwDy6QflB9FtLiWMtnINkgtyw2r+XU
         oPEYgcHFzqd1gmhvvt4JFqmRJ1BxgASduUHy8/CNnm0V9uKRf9GPqzTp5uWh4VuuFbNW
         mulGA2pmgaoRhA2xcsM1zcBri/RaCN6R8Oa9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F1jUXTbb2humu9f+3tIoHXLsI0UX1WeqPyARYAXIpkA=;
        b=dQ5Y+/+8gjtEnD54/VekLeVR84IN3roDThqpkS5WQ4X7/tN7tiCDm7vD5YhB5+HzMg
         7bBG0XkRN2YpoUPJn0Lyk9mBscCvkN0n+CiQ0UtyioI/KNyxNz7Kvc5kLLAj6geue3nP
         SDxIrbyJ8Z1ASuahWPz3QCeqKEroxcRnKwQx5/jzoH/ZRn6W0f9ZvrO2c1cLvIEHS44u
         caPKlBXGnXs6uIsONVxoqMx5+cJYrbIa65XwMMSRhBCfdYsqaFCY9UPoWvydCtebbRMS
         4uRfyl96Smr4hJLvcC823bzJbBnOH71kYz3eDeSGbit7fplTKFfTJ5iVZJmJO4eRFXmW
         /9Tg==
X-Gm-Message-State: AOAM533aPMmLQd9qw2dNDo+TFvS6/J8vzJEz//NbyxBUP2M5hUaHZMbB
        2as8L67aK7MIAURAbB450gFRFw==
X-Google-Smtp-Source: ABdhPJzlWymH7+YINF63PEFOvj//RlI7o8Rqvfxc/UfVgEwtyd7SZYkSwgjVwRzndX3uHQtRKHy6XQ==
X-Received: by 2002:a65:57cb:: with SMTP id q11mr13716173pgr.430.1625463203533;
        Sun, 04 Jul 2021 22:33:23 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:3fed:7130:60f:265a])
        by smtp.gmail.com with ESMTPSA id x19sm6805245pfp.115.2021.07.04.22.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 22:33:23 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Hirokazu Honda <hiroh@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tzung-Bi Shih <tzungbi@google.com>
Subject: [PATCH v6 01/14] media: mtk-vcodec: vdec: Support H264 profile control
Date:   Mon,  5 Jul 2021 14:32:45 +0900
Message-Id: <20210705053258.1614177-2-acourbot@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210705053258.1614177-1-acourbot@chromium.org>
References: <20210705053258.1614177-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hirokazu Honda <hiroh@chromium.org>

Add H264 profiles supported by the MediaTek 8173 decoder.

Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
[acourbot: fix commit log a bit, move to mtk_vcodec_dec.c]
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 56d86e59421e..8df8bcfe5e9c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -1421,6 +1421,16 @@ int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 				V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
 				V4L2_MPEG_VIDEO_VP9_PROFILE_0,
 				0, V4L2_MPEG_VIDEO_VP9_PROFILE_0);
+	/*
+	 * H264. Baseline / Extended decoding is not supported.
+	 */
+	v4l2_ctrl_new_std_menu(&ctx->ctrl_hdl,
+			       &mtk_vcodec_dec_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+			       BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+			       BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
+			       V4L2_MPEG_VIDEO_H264_PROFILE_MAIN);
 
 	if (ctx->ctrl_hdl.error) {
 		mtk_v4l2_err("Adding control failed %d",
-- 
2.32.0.93.g670b81a890-goog

