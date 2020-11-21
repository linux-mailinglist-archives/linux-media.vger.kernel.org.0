Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A72C2BC2B9
	for <lists+linux-media@lfdr.de>; Sun, 22 Nov 2020 00:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgKUXuI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Nov 2020 18:50:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbgKUXuH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Nov 2020 18:50:07 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC2C0C0613CF
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2020 15:50:05 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id t8so11424931pfg.8
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2020 15:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZdyhTvyVNa2fhAy8X/NHf9i/vBLLU68LSfcoVNt03w8=;
        b=hPqnU3xOMWcdHJxE2WBRuowx+pM6mR9po/NLZ2+HG9as2e0p2M4myMeqQ/bGXW7Mbf
         UAWBA5y72Sp07u1lRw3WoZlKIL9cb+4evqy3TEfUDr+clyQZCY7zsQbuRU6b0ZPQQQvA
         IkkCVaWOdcm2RvBBlh4m/JbjuoP/iltPQqln9mW4DeT6sIfVW08ry4X6SFhunJGoIO9t
         oK5HD1kteNpl83ql4n46c9fETkwM61Yq2I0ezzIHwzUvVDHR+AOmki884xaCWssQzM0M
         rtWP6LIGU/d8apzl2D0Ah64PN4+rZ4kV5GBpA4JUlGTfYIPpcFCYhBUP1fYJetSy9l/w
         jOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZdyhTvyVNa2fhAy8X/NHf9i/vBLLU68LSfcoVNt03w8=;
        b=U2FhNFJ3PkHHQUHVjVr25878vSPy/glQwZYH1d3aWmxUrKxfIzyb80EAnpAI3DkgzW
         tsWTYwYUpmYYfGae2IC88RGRJaaoiK1u93YYSjXEIibXiwnzcaf0kpej441dTSEy9ns7
         Pboxv9kGxdN8Z0K+7yRD+ufdgn+dSn+LYEworZGXYfrVLlxSsh5jPMkBtc8PeF+UELTF
         T2hJguMyYtCXwECJLYgLp1vZHC27uqFuZEycBAcjvuGEv00lCh81n2g9UkKZD300wGKO
         f0PF+y4WXwisN3h5Z/6O1zo4FKQtNn1WNUs6wotR/dAhytrj9BdWFQOfRARWZ+sYfo0I
         7PSA==
X-Gm-Message-State: AOAM533jpq+cJzoGbNEJcGudUoPMf318/T4nhDW3LM68HIWhnZ0yXv9i
        TGJIf7NVetEBMzZy4Wm27rgQeA==
X-Google-Smtp-Source: ABdhPJzR7eE8aKla6W64xhedCSmbj1FTLdSO3fp593xPplEFC+UFeaGglpeDqZNua7/tdBZdBDBHuw==
X-Received: by 2002:a17:90a:1d47:: with SMTP id u7mr17839921pju.49.1606002605188;
        Sat, 21 Nov 2020 15:50:05 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id v126sm7882525pfb.137.2020.11.21.15.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 15:50:04 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/5] dma-buf: Code rework and performance improvements for system heap
Date:   Sat, 21 Nov 2020 23:49:57 +0000
Message-Id: <20201121235002.69945-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey All,
  So Sumit noted a flub I made in adapting the last series to
the new dma-buf-map code that is in drm-misc-next. Thus I wanted
to send this (hopefully) last revision of my patch series of
performance optimizations to the dma-buf system heap, once again
against drm-misc-next.

This series reworks the system heap to use sgtables, and then
consolidates the pagelist method from the heap-helpers into the
CMA heap. After which the heap-helpers logic is removed (as it
is unused). I'd still like to find a better way to avoid some of
the logic duplication in implementing the entire dma_buf_ops
handlers per heap. But unfortunately that code is tied somewhat
to how the buffer's memory is tracked. As more heaps show up I
think we'll have a better idea how to best share code, so for
now I think this is ok.

After this, the series introduces an optimization that
Ørjan Eide implemented for ION that avoids calling sync on
attachments that don't have a mapping.

Finally, an optimization to use larger order pages for the system
heap. This change brings us closer to the current performance
of the ION allocation code (though there still is a gap due
to ION using a mix of deferred-freeing and page pools, I'll be
looking at integrating those eventually).

This version of the series does not include the system-uncached
heap as Daniel wanted further demonstration that it is useful
with devices that use the mesa stack. I'm working on such a
justification but I don't want to hold up these rework patches
in the meantime.

thanks
-john

New in v7:
* Fixed the incorrect adaptation to the dma-buf-map usage

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org


John Stultz (5):
  dma-buf: system_heap: Rework system heap to use sgtables instead of
    pagelists
  dma-buf: heaps: Move heap-helper logic into the cma_heap
    implementation
  dma-buf: heaps: Remove heap-helpers code
  dma-buf: heaps: Skip sync if not mapped
  dma-buf: system_heap: Allocate higher order pages if available

 drivers/dma-buf/heaps/Makefile       |   1 -
 drivers/dma-buf/heaps/cma_heap.c     | 329 +++++++++++++++++----
 drivers/dma-buf/heaps/heap-helpers.c | 274 ------------------
 drivers/dma-buf/heaps/heap-helpers.h |  53 ----
 drivers/dma-buf/heaps/system_heap.c  | 414 ++++++++++++++++++++++++---
 5 files changed, 647 insertions(+), 424 deletions(-)
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.c
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.h

-- 
2.17.1

