Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7AF743F9E
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 18:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232449AbjF3QVR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 12:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232302AbjF3QVR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 12:21:17 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31CDF3ABC
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 09:21:16 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c0d62f4487cso1933001276.0
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 09:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688142075; x=1690734075;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tmI1or0XTS7Hn6WBYUj9O4F+BRUYRNflOyMy4FV7LJM=;
        b=Wl2L6CE38QgBvIOu5iEIjH1dP66LLE6Ms7p8AfxgJ0snRicrG3kjNt5lF/w/oYArpt
         snZHK2JWiwKS1vQx/3eCgThyxArpAuKoJ7mDJtjQrfP6AYk6/pPEMsEDGAhnR6uoa5zF
         mKTGKUQmqz6eBx4jb9FRuD/3TMadTlPhYL39dXT0XLIwLcUBv2V3r+FZ2J+ua4UpSl9F
         b3gF2oAF/bW+84N2cy4PdiNse71SUaZwtxO6U5N6J1YyTXWDWm5f3M0fyNms5gJFwZoX
         9A1lgtm1u0UFRsMW+oMy1/UC52IZlHh+5j2QcoEsSh/UdfYlVJT0TtS55byoHtaee9Z9
         PbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688142075; x=1690734075;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tmI1or0XTS7Hn6WBYUj9O4F+BRUYRNflOyMy4FV7LJM=;
        b=HM0IiaKd3AoR5W8KW5PnRpC++9Sl8XNOECcUqcoRf1TNUGLfb+/Byf46+AK8BDdV/z
         WqXpJ7+N9QxaP5NmWHNg8ejVwZPRsIEnByg0cfB15uu2+iE/xKCvesL7z4CURMu2/zKV
         5LtFQZOmvs3xMLtLY5wkzJYVhkPU58Vn4e/YBt2Jm9pelqprZznUnAbTUCYocrMWlU7k
         G1WYHJi0UqS06IyKAqg3aeGyP81gTdysKdihUJgh9qJd6L1WKVRAihZtKgDblzTqUb7s
         yP6EZJxNYXe3W6rZcYtOh1FjSUA5LPiXy4ZtRsPt5JNPcLHCQdG3R8la6k2RjcjBsbYd
         jWdA==
X-Gm-Message-State: ABy/qLazbabyY7FXRuvmjLVhJbAEw6JIcfmqn89L6JGMFG3wysGZoMKL
        SgGTul6NzWVsZs+mh14wxtnA7VrEovo=
X-Google-Smtp-Source: APBJJlHD9CFDbrXlL1q/Tx0IjaqkF0QgIxLv3w4dEKVcSLFdBqoW9yS9DDKgdFV6JkUafSPiOI3r9J/kKFKe
X-Received: from jstultz-noogler2.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:600])
 (user=jstultz job=sendgmr) by 2002:a25:6b12:0:b0:c24:7d1c:6145 with SMTP id
 g18-20020a256b12000000b00c247d1c6145mr27237ybc.2.1688142075426; Fri, 30 Jun
 2023 09:21:15 -0700 (PDT)
Date:   Fri, 30 Jun 2023 16:20:33 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230630162111.3051783-1-jstultz@google.com>
Subject: [PATCH] MAINTAINERS: Remove Laura Abbott from DMA-BUF HEAPS FRAMEWORK
From:   John Stultz <jstultz@google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     John Stultz <jstultz@google.com>,
        Laura Abbott <labbott@kernel.org>,
        "T . J . Mercier" <tjmercier@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laura's email address has not been valid for quite awhile now,
so wanted to clean up the reviewer list here.

I reached out to Laura who said it made sense to drop her from
the list, so this patch does that.

I do want to recognize Laura's long time contribution to this
area and her previous ION maintainership, as this couldn't
have gone upstream without her prior efforts. Many thanks!

Cc: Laura Abbott <labbott@kernel.org>
Cc: T.J. Mercier <tjmercier@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: John Stultz <jstultz@google.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: kernel-team@android.com
Acked-by: Laura Abbott <labbott@kernel.org>
Signed-off-by: John Stultz <jstultz@google.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f4e92b968ed7..6b28b59cbdb9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6181,7 +6181,6 @@ F:	kernel/dma/
 DMA-BUF HEAPS FRAMEWORK
 M:	Sumit Semwal <sumit.semwal@linaro.org>
 R:	Benjamin Gaignard <benjamin.gaignard@collabora.com>
-R:	Laura Abbott <labbott@redhat.com>
 R:	Brian Starkey <Brian.Starkey@arm.com>
 R:	John Stultz <jstultz@google.com>
 R:	T.J. Mercier <tjmercier@google.com>
-- 
2.41.0.255.g8b1d071c50-goog

