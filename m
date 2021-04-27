Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A71636C4DA
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 13:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237738AbhD0LRB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 07:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235980AbhD0LQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 07:16:52 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9379C061760
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 04:16:07 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id b17so5082442pgh.7
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 04:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6wyv4G/lQ/EHY+nAhCaUf35r1FQBf2AesHuDPMoclw8=;
        b=EbDbUiG+s/5bKjIABss2BCP8TiPWspaaME+mSIBSYp3DybGob+DWyGvrhulQRVeADI
         rAg5U8NNWmpFbJk532ChdfH6hzLsJZ6kGlsdiWvKCO4RPDDodrz7wm6lKyScbKYpERGd
         9YJG/n/VxxcJ9zfCW6bpu+qkojFg1iJ4FoI/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6wyv4G/lQ/EHY+nAhCaUf35r1FQBf2AesHuDPMoclw8=;
        b=bJMsOyvpKGd7mPPTmXeo9w5RHQnZgygv0dKeNX0qN0HYaB7YnDZiH/DxtipJ4fYiRM
         Bq+HiK593hGmrDSYfsbyNMRcNwYYoQasZoiYSAI2SV+3EWzQkP9MDD3+nKcL1TM0yNOR
         RXrEWLj0s8psHa5P/8ac0QkgRhq+4R8/Vv6Li2UKpIUzpt6ZDxnXDQWObVQqX/10pq/9
         iB26HARwbAIJgNMiyZdkFm84maXF4QPeui/muoX6eQaEOK9i43zQz2JXY8Pu6NDd9zSz
         y4TjLSanqBG6k7bD79Q4tvTceKvDPxkVtk0KSxSgKCHeHTDJqNqBeHrm9dnZeU/yD2Uf
         ns/Q==
X-Gm-Message-State: AOAM531XR5UTT1T+7rC8ixD2kP9LOO9nElb8EmjbEQXxdaQXexAGgj06
        +rZIcjYdtKVE6UpeYfXpLFcchw==
X-Google-Smtp-Source: ABdhPJxaFfZSnDofdrzYmCyzQRCADWHb3fdCONPpxa6HA2xpTld/7zf54fUs0nthxozgfrBcJR/Cqg==
X-Received: by 2002:a05:6a00:170c:b029:225:8851:5b3c with SMTP id h12-20020a056a00170cb029022588515b3cmr22453831pfc.0.1619522167429;
        Tue, 27 Apr 2021 04:16:07 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:b182:d363:32d0:53a2])
        by smtp.gmail.com with ESMTPSA id c21sm2347210pfc.165.2021.04.27.04.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 04:16:07 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Hirokazu Honda <hiroh@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 11/15] media: mtk-vcodec: vdec: Support H264 profile control
Date:   Tue, 27 Apr 2021 20:15:22 +0900
Message-Id: <20210427111526.1772293-12-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427111526.1772293-1-acourbot@chromium.org>
References: <20210427111526.1772293-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hirokazu Honda <hiroh@chromium.org>

Add H264 profiles supported by the MediaTek 8173 decoder.

Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
[acourbot: fix commit log a bit]
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_stateful.c     | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
index c5538fcfc9a5..d815125c81a4 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
@@ -611,7 +611,16 @@ static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 				V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
 				V4L2_MPEG_VIDEO_VP9_PROFILE_0,
 				0, V4L2_MPEG_VIDEO_VP9_PROFILE_0);
-
+	/*
+	 * H264. Baseline / Extended decoding is not supported.
+	 */
+	v4l2_ctrl_new_std_menu(&ctx->ctrl_hdl,
+			&mtk_vcodec_dec_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
+			V4L2_MPEG_VIDEO_H264_PROFILE_MAIN);
 	if (ctx->ctrl_hdl.error) {
 		mtk_v4l2_err("Adding control failed %d",
 				ctx->ctrl_hdl.error);
-- 
2.31.1.498.g6c1eba8ee3d-goog

