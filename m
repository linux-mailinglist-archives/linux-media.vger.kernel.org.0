Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC6629DBF2
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 01:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390892AbgJ2ASZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Oct 2020 20:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730715AbgJ2AQ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Oct 2020 20:16:29 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC82C0613CF
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2020 17:16:29 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id r10so871352pgb.10
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2020 17:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jowbCdzh73K/7cntCmnI6UArO+IIJYfiMSLMhZBHvp8=;
        b=BhBEwWL6wnxQTQbk7XBsIYPue0uFzes+fPtIQB7xcgYEdWtbnUqHI0JJfzeSMqfp53
         QQJPgRVUAyouYlKSNbFhUUHCoOM2N5GdD5cvFqQ9CfXyFf/AioCK0ntpEA4wkNe+/EoA
         qA6eQ2a5t3kySA9KX96S2N/ORq+IoDiNidx8wrSL6Zp76DL/k392dVFgNdL5Mo2oPFlr
         W0i8ZBp4ZCCXJmZZJpkhooUGWLscqy+pgS3OGNa0Qd/fQapyli4cuB2jdQI17lpLqArL
         9AWCUZSOLPBFK6S2YfAqYbApt0YABB6tB6x4wnXlE1vxmf1+2wFBtgb9O0Mw12OTjwM3
         +wWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jowbCdzh73K/7cntCmnI6UArO+IIJYfiMSLMhZBHvp8=;
        b=d+21DFSTpckLL4pG+Tjlf4WigQBtRhPmI3vMISOaK2/pD8K78MVHYXP6Ajqetz1sOr
         BwQdosAVKpiq2G4q2QAcqYLRE3NYaZlWOrvbaLUWROmeL+RCMDA+RCvbnY/K2wd+0SCz
         9GUnghjoyXzOhuwavTEcNuRv7mr8ytbsZH/En95buMskEnrLOYlnqe6XAdgJ9RanncnT
         GSuyR/DOuWRR+g5NVNexZs4c/UUgetqGkGWkoKZqoUEw4Z4gjiWSzX+/dK2fWpwaV7g0
         T50rUkqJ/VeLdzmN1PnuupMtIrYj5ZWRIEtuQF23m+6kNZywIEAILDVoZZdLjz65+3Yk
         pLuw==
X-Gm-Message-State: AOAM5322YpZYq4UTvdL8OuzWL046LXQlwnMHxZhsnbZKbHyYrV/adcGC
        00RFMX9FPKgv6n6hWCYNXtlrUA==
X-Google-Smtp-Source: ABdhPJzj43umkzeNqJmTU/ETb7Ac//OIRSrCtAnyXmttJ54tWbfb9z0CPz1oRqMSlVD5VTFmQgLrSg==
X-Received: by 2002:a63:e006:: with SMTP id e6mr1669122pgh.51.1603930588810;
        Wed, 28 Oct 2020 17:16:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id u13sm727407pfl.162.2020.10.28.17.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 17:16:27 -0700 (PDT)
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
Subject: [RESEND][PATCH v4 0/7] dma-buf: Performance improvements for system heap & a system-uncached implementation
Date:   Thu, 29 Oct 2020 00:16:17 +0000
Message-Id: <20201029001624.17513-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey All,
  So just wanted to resend my last revision of my patch series
of performance optimizations to the dma-buf system heap.

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

Next, an optimization to use larger order pages for the system
heap. This change brings us closer to the current performance
of the ION allocation code (though there still is a gap due
to ION using a mix of deferred-freeing and page pools, I'll be
looking at integrating those eventually).

Finally, a reworked version of my uncached system heap
implementation I was submitting a few weeks back. Since it
duplicated a lot of the now reworked system heap code, I
realized it would be much simpler to add the functionality to
the system_heap implementation itself.

While not improving the core allocation performance, the
uncached heap allocations do result in *much* improved
performance on HiKey960 as it avoids a lot of flushing and
invalidating buffers that the cpu doesn't touch often.

Feedback on these would be great!

thanks
-john

New in v4:
* Make sys_heap static (indirectly) Reported-by:
     kernel test robot <lkp@intel.com>
* Spelling fixes suggested by BrianS
* Make sys_uncached_heap static, as
    Reported-by: kernel test robot <lkp@intel.com>
* Fix wrong return value, caught by smatch
    Reported-by: kernel test robot <lkp@intel.com>
    Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
* Ensure we call flush/invalidate_kernel_vmap_range() in the
  uncached cases to try to address feedback about VIVT caches
  from Christoph
* Reorder a few lines as suggested by BrianS
* Avoid holding the initial mapping for the lifetime of the buffer
  as suggested by BrianS
* Fix a unlikely race between allocate and updating the dma_mask
  that BrianS noticed.

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

John Stultz (7):
  dma-buf: system_heap: Rework system heap to use sgtables instead of
    pagelists
  dma-buf: heaps: Move heap-helper logic into the cma_heap
    implementation
  dma-buf: heaps: Remove heap-helpers code
  dma-buf: heaps: Skip sync if not mapped
  dma-buf: system_heap: Allocate higher order pages if available
  dma-buf: dma-heap: Keep track of the heap device struct
  dma-buf: system_heap: Add a system-uncached heap re-using the system
    heap

 drivers/dma-buf/dma-heap.c           |  33 +-
 drivers/dma-buf/heaps/Makefile       |   1 -
 drivers/dma-buf/heaps/cma_heap.c     | 324 +++++++++++++++---
 drivers/dma-buf/heaps/heap-helpers.c | 270 ---------------
 drivers/dma-buf/heaps/heap-helpers.h |  53 ---
 drivers/dma-buf/heaps/system_heap.c  | 488 ++++++++++++++++++++++++---
 include/linux/dma-heap.h             |   9 +
 7 files changed, 747 insertions(+), 431 deletions(-)
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.c
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.h

-- 
2.17.1

