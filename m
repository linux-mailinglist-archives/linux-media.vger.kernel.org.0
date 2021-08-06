Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 740E63E225E
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 06:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242405AbhHFEQN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 00:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbhHFEQM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 00:16:12 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC57FC061798
        for <linux-media@vger.kernel.org>; Thu,  5 Aug 2021 21:15:56 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id t18-20020a0cd4120000b02902fbda5d4988so5537463qvh.11
        for <linux-media@vger.kernel.org>; Thu, 05 Aug 2021 21:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=WL3xTLZhfFrhkuc0OkQrHT12omffck/a/CybJO83okg=;
        b=R5gi+wfQozM+tZmJxMGO77+NbPcGSEqShKmY1tmDXb6iXvWLefwje5oDCIr0Oi12TI
         s2WSxUGQMGewK6zp1nesYCPh5Ju/7pZkDZ2NFVDRBbC2oQp9ejMIPzqfVYyb0MOpfvnr
         0SmKzgDLbJBY+J3tyHxpiduBBbftX2KWf1KTG4XKOCEUyvK49508x3muFkf75Pd4VgE0
         6UGaCSvcSzPttBpWBfHDjhrodXR/JAE2nUrttIB/xQfzSHJmWrJx4msrXI1OCbmM8sRd
         eTW4R7eT7ADmyCtNRccrfaLZ0n0CR5N8FgcYjyGw4ykYBR/jwJCtch0SJrJXh0KoMkeW
         USCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=WL3xTLZhfFrhkuc0OkQrHT12omffck/a/CybJO83okg=;
        b=clZQENkcihAq7anqZHT8zo/gNe5NjmAKpa9F9hc0w3WtnH5XVNPCNnV6XCX0WveE6Z
         57YtIObCJRlqZVZ7AKMio89SFiVNXE+3SwjugHhFCjU1fI8sDI4+EB54Xbcv/YqtY+IQ
         S3kAd1KkOEg5yukH9+gmLjpyCJQ5ZejAiCs/t0Tz7lNOgioa6oZSgfXbgbTY2UUunrOr
         T+8RfTErttNh2mxqSQmWoxBh56T+xtxAhRj1q5+5T/vX6o0s/g9d/WBGWeUUt8DKO5Xz
         LFk6I/YPrlQOVOjosEllKgZERctlaUAAw934PwJWJCm/E/aGU9EdYP9uQa8E81s9OfC7
         cqag==
X-Gm-Message-State: AOAM530+iXr9tojolSKsGJm5GglU8sQ0wSksUCE+vOQnSz8Q6Bp/Ec33
        IthpWnChjpSdOj9QO0g4TfJAleS62Gh4
X-Google-Smtp-Source: ABdhPJxBsaIDHmyQ29WaZg2znI4qKV7rxgagb+NJIsfnJzseCynAI4hpCV8igttTVtE9rT4oRwzVuBmDRsN2
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:3001:: with SMTP id
 ke1mr9176750qvb.52.1628223355982; Thu, 05 Aug 2021 21:15:55 -0700 (PDT)
Date:   Fri,  6 Aug 2021 12:15:17 +0800
In-Reply-To: <20210806041530.4170869-1-tzungbi@google.com>
Message-Id: <20210806041530.4170869-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 01/14] media: mtk-vcodec: vdec: Support H264 profile control
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com,
        acourbot@chromium.org
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        dafna.hirschfeld@collabora.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, tzungbi@google.com,
        Hirokazu Honda <hiroh@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hirokazu Honda <hiroh@chromium.org>

Add H264 profiles supported by the MediaTek 8173 decoder.

Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
[acourbot: fix commit log a bit, move to mtk_vcodec_dec.c]
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
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
2.32.0.605.g8dce9f2422-goog

