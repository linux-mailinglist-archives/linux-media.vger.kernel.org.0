Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 921F27433C0
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 06:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjF3ExA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 00:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjF3Ew6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 00:52:58 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6548268F
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 21:52:57 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1b7f04caf5eso9922755ad.1
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 21:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688100777; x=1690692777;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QMopF0yt6SNtXURrQJLWhNgsWSeXqZOwln5eBV7VSyg=;
        b=X0Nlx2LfwFLDoIreU6J/7nCFcprP8zXSy4BxreWWpmLt4DmeFREe1gl/cooDVrO5uc
         QvfY2Cbb1PQsTS1vCHzruuFKJFgZT4o/rEBTiTTuI19w3kh2dNLNlnCtLlAOMOukieA1
         ZJ38X6tokAgCiMV300QArFfYtblOiB+cgTo6Cv1/mSKKV1g5KsbxMKb0LDp8/UKgYjmX
         O4mNSebBakv5tTr3K5HipZ4wOpIN2KIqlVbwTV147KpuJJhFWrw6eZanI7EWuXcbJEJ2
         YFSYjRYsRWlbBpq6SsWcGytlzaik5q2Z19hTce/BKQ8N4XwlNB7lOnCpcebUkw3N5buX
         wvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688100777; x=1690692777;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QMopF0yt6SNtXURrQJLWhNgsWSeXqZOwln5eBV7VSyg=;
        b=XOcBRpLXn8+GFcz3Yy8ynRPigzIiUoRlU1zEU/UFt59xQLVxz6Af76W68WBUeYgA2x
         bEd1yMdQkyHhaYv9l974eSY6/ErRcibIFW9x9PZTZ5PLGm6VxnVBOTKEzHW/0ekzjFnq
         +qa9UCp2QxkC2LFIS4Y6HDB3/kfTH6VMUxcSEnXJfqZvCL0Po0vITMhmXxNVDPu3RRKR
         ZyEsLLbmFsxMltIijPiP98xs9tVfoozWhh8UC0VgzfHVop818LqmNNP9m05/rO3ZNMVQ
         HgXRGwCprMn8g+sEsdyf0AsvXzz1Bc/GA943oqLGMoWLGBqBq+x4kfCKVyGdR4xWMOcB
         Mzaw==
X-Gm-Message-State: ABy/qLZuvgoB52NvfwsgF1UFavu9+h8BkMjWHys58x1bRkncqGv0bVGj
        Hfp9F/aqB8xlay+FJSo6aTKCS0vUjDU=
X-Google-Smtp-Source: APBJJlEV+O7siKol/DY7iCP6fmNhLuKbzWPu98PuLcJd0QPskucrT7s+QKRfycseJlSmVxoSK0wgrz7omUNv
X-Received: from jstultz-noogler2.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:600])
 (user=jstultz job=sendgmr) by 2002:a17:903:2041:b0:1b8:fd7:cb0c with SMTP id
 q1-20020a170903204100b001b80fd7cb0cmr873422pla.5.1688100777397; Thu, 29 Jun
 2023 21:52:57 -0700 (PDT)
Date:   Fri, 30 Jun 2023 04:52:23 +0000
In-Reply-To: <CABdmKX0A8mqz5cS4+CqjRgpQQKuSp=3SvE1KJ_di09VjJQVoGg@mail.gmail.com>
Mime-Version: 1.0
References: <CABdmKX0A8mqz5cS4+CqjRgpQQKuSp=3SvE1KJ_di09VjJQVoGg@mail.gmail.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230630045246.1674919-1-jstultz@google.com>
Subject: [PATCH] MAINTAINERS: Add T.J. Mercier as reviewer for DMA-BUF HEAPS FRAMEWORK
From:   John Stultz <jstultz@google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     John Stultz <jstultz@google.com>,
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
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T.J. has been responsible for dmab-buf items on the Android team
for awhile now, so it would be great to have him on as a reviewer.

Cc: T.J. Mercier <tjmercier@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: John Stultz <jstultz@google.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: kernel-team@android.com
Signed-off-by: John Stultz <jstultz@google.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cb075f52d97b..f4e92b968ed7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6184,6 +6184,7 @@ R:	Benjamin Gaignard <benjamin.gaignard@collabora.com>
 R:	Laura Abbott <labbott@redhat.com>
 R:	Brian Starkey <Brian.Starkey@arm.com>
 R:	John Stultz <jstultz@google.com>
+R:	T.J. Mercier <tjmercier@google.com>
 L:	linux-media@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
-- 
2.41.0.255.g8b1d071c50-goog

