Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBE8B53ABFC
	for <lists+linux-media@lfdr.de>; Wed,  1 Jun 2022 19:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355110AbiFARd6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jun 2022 13:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354976AbiFARd5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jun 2022 13:33:57 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 098038B0B2
        for <linux-media@vger.kernel.org>; Wed,  1 Jun 2022 10:33:56 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id f4so2468076iov.2
        for <linux-media@vger.kernel.org>; Wed, 01 Jun 2022 10:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=jLaUrdx25t3GCyQ0wZRoescioueVrwZh619Ff29RWqY=;
        b=fJm7d+9A2e486Flnp9XxXkQW/pJdZw107Sn4PmQ0vN9naz2oXXsZo3plWN4ehOvuJJ
         T8tlef+9SvckXj99RLI0QmfmRzA+/Ixkg0LUR/JnfM9aWtkYtrVN4gTnNYvPLWv6mCwg
         bjkgI1slY6/wr12FrZCp2G9q0i4269JkDkJrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=jLaUrdx25t3GCyQ0wZRoescioueVrwZh619Ff29RWqY=;
        b=07ZhN7jtkXXU64jmnJODxek0g1JvowSDsxcwcispMs5YNt2RUblGHFo6E/nPAK1lSp
         v3wDqeej1DQLvWNRPwFPqJFXo3ieI6QaGy+c0QTApryOobr5QUQLVKBKPTFZf8T448Ta
         TxZ8GF4huFskrFPmN1mYnkrVlw2eywzmDrzD7XfPtOGFEvG6ZkH7a+DEW/8/gMG2MSj8
         +aYIAIEDQwzjtlIB6Ly4nxyZ75UMz1xmc5xeGgG7zp8s7PAGB9SbFSBvR1rl2epsaFP5
         82ybcx0a/1JPtnKxrpP7jU2dLf/evuZWMeTa8d9ZIgXbYGnjgJuDY+OiGcK7cswDaFoQ
         91lg==
X-Gm-Message-State: AOAM532ktuch4+dezlDVVUCHssRhQtiXzONHa86DwdnZhP5a3DpwkxWu
        ixOA4A62K0ftYB+5ZtJvkoyGRl4WshGJcv/cNSBV077zBXReEfhRjY+Inw==
X-Google-Smtp-Source: ABdhPJwRMCbKQiN4Aqj2rgwxDXEhJ4QrXOHN58/kfsyq4galsMcHm5mOmijhiLqSO3OdhYxupSK7s6OwhtjttBvgvvM=
X-Received: by 2002:a05:6638:1392:b0:32e:c78f:37d3 with SMTP id
 w18-20020a056638139200b0032ec78f37d3mr692925jad.290.1654104835367; Wed, 01
 Jun 2022 10:33:55 -0700 (PDT)
MIME-Version: 1.0
From:   Justin Green <greenjustin@chromium.org>
Date:   Wed, 1 Jun 2022 13:33:44 -0400
Message-ID: <CAHC42RcUnqEZDsShzzKa=7WKjaH6kt25K4tVY-ncWZaVaBPkkg@mail.gmail.com>
Subject: [PATCH v2] mediatek/vcodec: Enable incoherent buffer allocation
To:     linux-media@vger.kernel.org
Cc:     "tiffany.lin@mediatek.com" <tiffany.lin@mediatek.com>,
        "andrew-ct.chen@mediatek.com" <andrew-ct.chen@mediatek.com>,
        mchehab@kernel.org,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
detiling MM21 video frames in software.

This change should be safe from race conditions since videobuf2 already
invalidates or flushes the appropriate cache lines in its prepare() and
finish() methods.

Tested on a MT8183 SoC. Resulted in both correct detiling and a 10X
speedup.

Signed-off-by: Justin Green <greenjustin@chromium.org>
Suggested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 52e5d36aa912..46f891f0104b 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -938,6 +938,7 @@ int mtk_vcodec_dec_queue_init(void *priv, struct
vb2_queue *src_vq,
  src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
  src_vq->lock = &ctx->dev->dev_mutex;
  src_vq->dev             = &ctx->dev->plat_dev->dev;
+ src_vq->allow_cache_hints = 1;

  ret = vb2_queue_init(src_vq);
  if (ret) {
@@ -953,6 +954,7 @@ int mtk_vcodec_dec_queue_init(void *priv, struct
vb2_queue *src_vq,
  dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
  dst_vq->lock = &ctx->dev->dev_mutex;
  dst_vq->dev             = &ctx->dev->plat_dev->dev;
+ dst_vq->allow_cache_hints = 1;

  ret = vb2_queue_init(dst_vq);
  if (ret)
-- 
2.36.1.255.ge46751e96f-goog
