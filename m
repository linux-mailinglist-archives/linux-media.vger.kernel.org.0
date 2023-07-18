Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED66B757A40
	for <lists+linux-media@lfdr.de>; Tue, 18 Jul 2023 13:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbjGRLQq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jul 2023 07:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbjGRLQp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jul 2023 07:16:45 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B5F1705;
        Tue, 18 Jul 2023 04:16:43 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-26586e824e7so2840358a91.3;
        Tue, 18 Jul 2023 04:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689679003; x=1692271003;
        h=content-disposition:mime-version:subject:to:date:from:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RDqCEtPP7u4lUuZ9Np/PNRIOxRGuU6kZQY2tiFjWesI=;
        b=R1b13mbfqdYlno1rEzfx5LoSkAJSZ4myTZ4145u7gLU7tIkMZ1H6QkP+AcW+MbaE6T
         c+Dkoeor41D1nkVFvRVfUjUXUWep5edmRb0sWAnhxGUyr0GUblOQPo+m+4SQxOSRxx2S
         rDVuQD0rjNVHptG3czYEL1GTpHsWpeAIF4QL9do43kt2ri2v5Af/qhIOF/+WFbf6rEF9
         UrI92NJo+RAWtgWxqedqpE76x9zyxAcC5bT81uVLVvDnZGjNcFRyOPKJwWvOzdHsOy5m
         sVIrhakF1Tfjg7YmUmKgcP8DU6K8Mc3g54JVP7RSe0HT5JbHvg/i/6BCNGt7TOebLKVS
         1mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689679003; x=1692271003;
        h=content-disposition:mime-version:subject:to:date:from:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RDqCEtPP7u4lUuZ9Np/PNRIOxRGuU6kZQY2tiFjWesI=;
        b=j3FVJoX2ych7RqdDKAXP7fiWVeAbJ967NE2tspMEhDc/NeOSpq0qVZZnpsCqG7dqEO
         9VUrPvDT0d+fdg2ygcWCVAmZJLrPJVQJvfMmaeA/3uBCozCjMKSEW2EdAg0AQdhRSYDP
         zTesHnHPOFhyFU+qiAJx578MCBQgSK6+5vwzgUlX25q2R1pfSpkxKqJl3ts8jFAUngvu
         2aFgzVepPIJ3QMszlmvO7K5o5n0rc2W+y15iGK6stwalcQ+9liQMv+KGUXTgR8CPPECs
         4IcULzYWqMBkTTwbzD9L4kSPJatdn0/ewz9zFu+bquUQ0X1dB/wK85rXelomMK83+O1m
         ys2w==
X-Gm-Message-State: ABy/qLb2c8JpKdqRXgGE6HVgS/ogFT5P2CfL1pwh/MUgL1a4XfM0tC4e
        VZe/PA4WgXQG/pdEWS/XBPE=
X-Google-Smtp-Source: APBJJlEst8u9Az2C8TF7X1huLYbv/7A043tSS9ngGKSY788TupNY8qhUi2D7L/U93exBd4YXJmFbjw==
X-Received: by 2002:a17:90a:62c5:b0:262:d19c:4fee with SMTP id k5-20020a17090a62c500b00262d19c4feemr11645410pjs.19.1689679003309;
        Tue, 18 Jul 2023 04:16:43 -0700 (PDT)
Received: from sie-luc. ([1.85.36.133])
        by smtp.gmail.com with ESMTPSA id 6-20020a17090a194600b00263d3448141sm1329482pjh.8.2023.07.18.04.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 04:16:42 -0700 (PDT)
Message-ID: <64b6749a.170a0220.3acab.2af9@mx.google.com>
X-Google-Original-Message-ID: <20230718111634.GA8462@sie-luc.>
From:   Luc Ma <onion0709@gmail.com>
X-Google-Original-From: Luc Ma <luc@sietium.com>
Date:   Tue, 18 Jul 2023 19:16:34 +0800
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        javierm@redhat.com, onion0709@gmail.com
Subject: [PATCH v2] dma-buf: Fix the typo in DMA-BUF statistics doc
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Luc Ma <luc@sietium.com>

The kernel-doc for DMA-BUF statistics mentions /sys/kernel/dma-buf/buffers
but the correct path is /sys/kernel/dmabuf/buffers instead.

Signed-off-by: Luc Ma <luc@sietium.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/dma-buf/dma-buf-sysfs-stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
index 6cfbbf0720bd..b5b62e40ccc1 100644
--- a/drivers/dma-buf/dma-buf-sysfs-stats.c
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
@@ -33,7 +33,7 @@
  * into their address space. This necessitated the creation of the DMA-BUF sysfs
  * statistics interface to provide per-buffer information on production systems.
  *
- * The interface at ``/sys/kernel/dma-buf/buffers`` exposes information about
+ * The interface at ``/sys/kernel/dmabuf/buffers`` exposes information about
  * every DMA-BUF when ``CONFIG_DMABUF_SYSFS_STATS`` is enabled.
  *
  * The following stats are exposed by the interface:
-- 
2.25.1

