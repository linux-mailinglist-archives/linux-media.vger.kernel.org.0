Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA3D2BBD0C
	for <lists+linux-media@lfdr.de>; Sat, 21 Nov 2020 05:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgKUEuD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 23:50:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgKUEuD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 23:50:03 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C2CC0613CF
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 20:50:01 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id i13so9132514pgm.9
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 20:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1dCpwtABCBAjt0w8Zd+Ad9bD2W4r2bOOZVX2c+Uu5fs=;
        b=dWZndGYY+uUFnjhTHmwgKC5kbCrdYmubSee+8hTXlbn/lIbOxvZ5Ttleyy46be1rVp
         qkjr2mvMwk7LjJWmsfxi3Q4PR6eFA0UA3aAUKtM4P2ZPe+0LcvmlhQcOgYPLkEdCIIzz
         wNJSVJ0EXPQ/HxHgOwIoeCjJqHxvAtGHQ7F4d2xt/aZfo3mkP4hHGzWSvOr7iTEJHtAj
         z93hcZeMjn9tZGTzsGiq6KvXp61nQQynOsvheETm4xBNBIa2RT0/JqqAsRTb3j63Rqx/
         EMV0tlo39IeO6+VXs+9xIUNUCyxfoLQCYVohHcREV5xp0jF1u+vbO4uW4WRMeIFG5ZTl
         vHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1dCpwtABCBAjt0w8Zd+Ad9bD2W4r2bOOZVX2c+Uu5fs=;
        b=dOe/fQsNRszoJtCIXbsik5eY9cBEb+3+aw0Deafwn9pJYq49OaER/KAu01CwwGHwZ+
         jg3n4cDvQYZIWFZv7iZ6mgoADKpYAsX2RU8Ov2bCdxSxSBh++k1KFyoINZ8dQvP+tYpM
         gKP6dnJPm74hNqQpSO3ZBYV18pm5eVjOmLHkCZKMwCQEPu7l/nfFnjnnIvVVaqznisn7
         qIWTfp7eSS9bOLn38PKRCQemzhY6U6oSdaYWS1GCfC55vvorLHgxDQ2TPEBeDu73bR33
         a0Zjst5IQW3bTkUAGTefPGP1nVA/nvUQniCrqfA7q2kgvg2Lom8W+8j1bhMkmanU3hn5
         LtnA==
X-Gm-Message-State: AOAM533nBpQxpdFjZtgmQhypzIUIVDAQe1aJtl2UL5xmFzvIQ/5ZForN
        LMSlSppVQCcBeSRlVpL0Xe3VsQ==
X-Google-Smtp-Source: ABdhPJyRE/0jIW/09/jq9G1nAs4OeW/5voPWRhKLPi853CLU1nhono7tAJRPn8bBZ4NkUjbxQj1OVQ==
X-Received: by 2002:a17:90a:c003:: with SMTP id p3mr13414860pjt.221.1605934200086;
        Fri, 20 Nov 2020 20:50:00 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id w196sm5407692pfd.177.2020.11.20.20.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 20:49:59 -0800 (PST)
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
Subject: [PATCH v6 0/5] dma-buf: Code rework and performance improvements for system heap
Date:   Sat, 21 Nov 2020 04:49:50 +0000
Message-Id: <20201121044955.58215-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey All,
  So just wanted to send another revision of my patch series
of performance optimizations to the dma-buf system heap, this
time against drm-misc-next.

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

New in v6:
* Dropped the system-uncached heap submission for now
* Rebased onto drm-misc-next

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
 drivers/dma-buf/heaps/cma_heap.c     | 325 +++++++++++++++++----
 drivers/dma-buf/heaps/heap-helpers.c | 274 ------------------
 drivers/dma-buf/heaps/heap-helpers.h |  53 ----
 drivers/dma-buf/heaps/system_heap.c  | 411 ++++++++++++++++++++++++---
 5 files changed, 640 insertions(+), 424 deletions(-)
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.c
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.h

-- 
2.17.1

