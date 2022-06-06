Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA6353ECFB
	for <lists+linux-media@lfdr.de>; Mon,  6 Jun 2022 19:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiFFRYU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jun 2022 13:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiFFRYU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jun 2022 13:24:20 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11DBA719EC
        for <linux-media@vger.kernel.org>; Mon,  6 Jun 2022 10:24:18 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id l1so10666313qvh.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jun 2022 10:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4AKbv0rfSr7La1DjgMOJ1LhMyfXFcLO+8wAAKOaaw4=;
        b=JEl3GBLZOJFTu6ohIPM2lzGaEfxo6sc4010AKMw9b1hv9Ueuk9CidJ9ORY7I2T6IVZ
         PrkYWA2Frwv3oZ1dzXrf6x5tH3TjksGhX9FLak/Nwjg1kc8WhrXhxjkskiEycMUTQhnx
         U991HB80k74o1l6nQcxdxQp98bROIvN6fmZDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4AKbv0rfSr7La1DjgMOJ1LhMyfXFcLO+8wAAKOaaw4=;
        b=WmjQICl95gCCEv3EOBNWgjCdcBTNGBgLPM3HPsp6XG4rcmsUfgMKxfDkJWxJSCTbcF
         PZShkkNRR9xSFLFJ9/xnUBOI0/P5whOL/xHzGueXhfpyiVhS7Df9+Mi+x1xxj39nDpKq
         VHN1Y2zdjTBhUzP2gvXd70pymYC7ZIg2uAdWtTSU55OC4mpB0FDmr854XiD6PVD2tQAR
         d+hxS1RqNJ38KSxAuIZo4w6tWrXwRZSWv2CVAKJiqhhfU4kiNq1O7d0oPVNGw44URP4t
         +7OAuwze64bhK1ZtGB0etwjMyElG/+OGvueq+pb8YJCOJwWeziob07j0YWq6KGKJW/xP
         Q2GQ==
X-Gm-Message-State: AOAM532t1TbLg3FNdzFfkMgXAivj5M9DhV1UsJ9iLhbPGaYQL9PMe6cR
        M9dt2BL7Ah7Y0kzrUFTdPuknet/QawMycA==
X-Google-Smtp-Source: ABdhPJx8s9ojxp+Y9Tc43Od5hCZEEbYYB1C0tP9zUjqEND/pglORuUtfhWB18++OWSxHAzb1SNmeKw==
X-Received: by 2002:a05:6214:19ec:b0:464:6aaa:8e98 with SMTP id q12-20020a05621419ec00b004646aaa8e98mr21841412qvc.45.1654536256969;
        Mon, 06 Jun 2022 10:24:16 -0700 (PDT)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:7ff2:f0cc:bda9:2f99])
        by smtp.gmail.com with ESMTPSA id k23-20020ac84757000000b00304eda87219sm2034867qtp.31.2022.06.06.10.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 10:24:16 -0700 (PDT)
From:   Justin Green <greenjustin@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        mchehab@kernel.org, matthias.bgg@gmail.com,
        nicolas.dufresne@collabora.com, senozhatsky@chromium.org,
        Justin Green <greenjustin@chromium.org>
Subject: [PATCH v3] mediatek/vcodec: Enable incoherent buffer allocation
Date:   Mon,  6 Jun 2022 13:24:11 -0400
Message-Id: <20220606172411.2418052-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set allow_cache_hints to 1 for the vb2_queue source and destination queues
in the mediatek vcodec V4L2 driver. This allows us to allocate buffers
with the V4L2_MEMORY_FLAG_NON_COHERENT set. On Mediatek SoCs, this enables
caching for this memory, which vastly improves performance when being read
from CPU. Read performance for these buffers is in turn important for
detiling MM21 video frames in userspace software, such as libyuv or
gstreamer.

This change should be safe from race conditions since videobuf2 already
invalidates or flushes the appropriate cache lines in its prepare() and
finish() methods.

Tested on a MT8183 SoC. Resulted in both correct detiling and a 10X
speedup.

Signed-off-by: Justin Green <greenjustin@chromium.org>
Suggested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
Changelog since v2:
- fix formatting issues with email client
Changelog since v1:
- reduce commit to just functional changes

 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 52e5d36aa912..46f891f0104b 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -938,6 +938,7 @@ int mtk_vcodec_dec_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->lock		= &ctx->dev->dev_mutex;
 	src_vq->dev             = &ctx->dev->plat_dev->dev;
+	src_vq->allow_cache_hints = 1;
 
 	ret = vb2_queue_init(src_vq);
 	if (ret) {
@@ -953,6 +954,7 @@ int mtk_vcodec_dec_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock		= &ctx->dev->dev_mutex;
 	dst_vq->dev             = &ctx->dev->plat_dev->dev;
+	dst_vq->allow_cache_hints = 1;
 
 	ret = vb2_queue_init(dst_vq);
 	if (ret)
-- 
2.36.1.255.ge46751e96f-goog

