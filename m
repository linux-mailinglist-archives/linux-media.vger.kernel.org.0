Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5A7458766C
	for <lists+linux-media@lfdr.de>; Tue,  2 Aug 2022 06:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbiHBEmv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Aug 2022 00:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232111AbiHBEmu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Aug 2022 00:42:50 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BBBDEE3
        for <linux-media@vger.kernel.org>; Mon,  1 Aug 2022 21:42:48 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id d7so8345529pgc.13
        for <linux-media@vger.kernel.org>; Mon, 01 Aug 2022 21:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7FIM0lLLD/hJvFF9jQAZ9LmmvnoaR0r3fL4LzT4Fj8I=;
        b=iPiBkDp6w1Afo63byGzk5OUeQiiaH3XvNJ5xC5RAfdHmKaTYaIUjiTntHiJ51tSZSP
         ucKYD9tnuDTiIkdsBlK9zhca4o5ef+nPB8UQCIj9Bv/93V8CxNa8DI9NKPVwnOFtnDMu
         E/ZpvyygTNLh4F5QSnLywKNSnyUTFpgoe3QRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7FIM0lLLD/hJvFF9jQAZ9LmmvnoaR0r3fL4LzT4Fj8I=;
        b=tSDY8v/YuxHDhHAvJgUY7DrMjRNQNqR+8veJf8yrLx9hc5i6tugb7fTVMnMrJ5PNqb
         f8XiBVjRsbMv4of7t7m6d+dg4kPXRg/E44ON9Dqs/y2w2KFyej+SD1U2G4g+q+Z1ultx
         7K2p1OU1nJHtwd1B4nWqpUsU5gvTwB+iWG5+jcpGwFuttLGNU/8oWwXSimXY3UqkHe59
         f38Om7Miike/SZBCmKXpQAhcpYse1re54ulq5q3lIcG8FaXayuUiooakSOn3RgWs/8KO
         D6hSV7u5WAI//wyRY7/95/dAoOJajnCAfsvyBtGRYk3b9f4cEm2rKhC/40eYhWOtPvOq
         iOhA==
X-Gm-Message-State: AJIora9RbZNy8deq7vWGWIq6NTVpkjOzZq7bl6/balknlX01t9XJFm1U
        gptwNxrL/fPhJWf8Ap2roJykzhPIEL/kHw==
X-Google-Smtp-Source: AGRyM1uMvjv8DLatXjKlvyEmESrjQAGIC1adkcOJd99g7+XpFXVrH2Yfo6b6VXJGTyeQA1vfCcYq/Q==
X-Received: by 2002:a63:5a4d:0:b0:41b:7702:635f with SMTP id k13-20020a635a4d000000b0041b7702635fmr15942636pgm.111.1659415367958;
        Mon, 01 Aug 2022 21:42:47 -0700 (PDT)
Received: from hiroh2.c.googlers.com.com (231.137.80.34.bc.googleusercontent.com. [34.80.137.231])
        by smtp.gmail.com with ESMTPSA id q30-20020a631f5e000000b0041c6541383dsm446321pgm.60.2022.08.01.21.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 21:42:47 -0700 (PDT)
From:   Hirokazu Honda <hiroh@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     Hirokazu Honda <hiroh@chromium.org>
Subject: [PATCH] media: mediatek: vcodec: Skip non CBR bitrate mode
Date:   Tue,  2 Aug 2022 04:42:42 +0000
Message-Id: <20220802044242.1465815-1-hiroh@chromium.org>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2_MPEG_VIDEO_BITRATE_MODE_CBR is the only bitrate mode supported
by the mediatek driver. The other bitrates must be skipped in
QUERY_MENU.

Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
index 25e816863597..ca7c4058f6b8 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
@@ -1403,7 +1403,8 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 			       V4L2_MPEG_VIDEO_VP8_PROFILE_0, 0, V4L2_MPEG_VIDEO_VP8_PROFILE_0);
 	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
 			       V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
-			       0, V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
+                               ~(1 << V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
+			       V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
 
 
 	if (handler->error) {
-- 
2.37.1.455.g008518b4e5-goog

