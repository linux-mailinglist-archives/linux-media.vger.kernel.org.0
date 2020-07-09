Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA8221A018
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 14:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgGIMdx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jul 2020 08:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgGIMdw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jul 2020 08:33:52 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33C10C061A0B
        for <linux-media@vger.kernel.org>; Thu,  9 Jul 2020 05:33:52 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id o2so1626791wmh.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2020 05:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ml7yu61orPGiyeLHj7KPJdBGRuwIj4VGf7RIdg6+6E=;
        b=FT1zeqK0F6re7x3hxU6WuwKnuhLdZTTGsE6uj0ZmBrbf9TVkVqTK3LOGBYbBEjYddX
         UQxsmufvcNCR+EiwLcPUmPYWFaC5pZ5CGfGNvzGthBXT2lli8Ur+GfzSgeLxXbdC//jm
         w7Dqku33+bwbEzRQvB6e/WItr0k784kTvA0/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ml7yu61orPGiyeLHj7KPJdBGRuwIj4VGf7RIdg6+6E=;
        b=GT3w3s3yltUXcvazdAQPe/XONh2SKAFWTWNS6oEl1etJEdnAF+rNYQqwjKU9hw/GIR
         BC6TMGRC7Jhgqkgc+9TQX7TAjvQyZ4Es+byecRCv+Dosk44tygm2C/CFBFkqkIwrsF2l
         6NNcawhXd0g4/JEq0nob+kxTWIEjNPDBRYAkQyNfRzJDavrKqwBX1UXjTc6TN/6e5hdY
         GD7vuJA2KBGXN9V+X+SHI6yWZZA4Vs8UMoQUw81CLJtuidADk/pu+MPPjhjKPk24Kv1l
         XoAoQZAIrasQWQF/zbHUWR2+nIeD6Z+yEz1JXhdbm6sBB9xZU+Z2k7X2cTLh95FULabD
         jOQg==
X-Gm-Message-State: AOAM5334xMV1ctQGo0iUDqkWF6pw7rCnGFBnpJGktqZDq5sW39ZUHP8b
        e/8iPVCiNsAThUZ5fBflJ5Dieg==
X-Google-Smtp-Source: ABdhPJyW1X39siqvN1tXyO+a5xJDhtYxZB7qgF8t/3W1eiXrhQsMLgXCOAKI1Lx9mgsJn2P0+ZV+SQ==
X-Received: by 2002:a7b:c313:: with SMTP id k19mr14181981wmj.67.1594298030902;
        Thu, 09 Jul 2020 05:33:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id o205sm4925347wme.24.2020.07.09.05.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 05:33:50 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Stone <daniels@collabora.com>,
        Jesse Natalie <jenatali@microsoft.com>,
        Steve Pronovost <spronovo@microsoft.com>,
        Jason Ekstrand <jason@jlekstrand.net>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Mika Kuoppala <mika.kuoppala@intel.com>,
        Thomas Hellstrom <thomas.hellstrom@intel.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        amd-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 1/2] dma-buf.rst: Document why indefinite fences are a bad idea
Date:   Thu,  9 Jul 2020 14:33:38 +0200
Message-Id: <20200709123339.547390-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Comes up every few years, gets somewhat tedious to discuss, let's
write this down once and for all.

What I'm not sure about is whether the text should be more explicit in
flat out mandating the amdkfd eviction fences for long running compute
workloads or workloads where userspace fencing is allowed.

v2: Now with dot graph!

v3: Typo (Dave Airlie)

Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Daniel Stone <daniels@collabora.com>
Cc: Jesse Natalie <jenatali@microsoft.com>
Cc: Steve Pronovost <spronovo@microsoft.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Mika Kuoppala <mika.kuoppala@intel.com>
Cc: Thomas Hellstrom <thomas.hellstrom@intel.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-rdma@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 Documentation/driver-api/dma-buf.rst | 70 ++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index f8f6decde359..100bfd227265 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -178,3 +178,73 @@ DMA Fence uABI/Sync File
 .. kernel-doc:: include/linux/sync_file.h
    :internal:
 
+Indefinite DMA Fences
+~~~~~~~~~~~~~~~~~~~~
+
+At various times &dma_fence with an indefinite time until dma_fence_wait()
+finishes have been proposed. Examples include:
+
+* Future fences, used in HWC1 to signal when a buffer isn't used by the display
+  any longer, and created with the screen update that makes the buffer visible.
+  The time this fence completes is entirely under userspace's control.
+
+* Proxy fences, proposed to handle &drm_syncobj for which the fence has not yet
+  been set. Used to asynchronously delay command submission.
+
+* Userspace fences or gpu futexes, fine-grained locking within a command buffer
+  that userspace uses for synchronization across engines or with the CPU, which
+  are then imported as a DMA fence for integration into existing winsys
+  protocols.
+
+* Long-running compute command buffers, while still using traditional end of
+  batch DMA fences for memory management instead of context preemption DMA
+  fences which get reattached when the compute job is rescheduled.
+
+Common to all these schemes is that userspace controls the dependencies of these
+fences and controls when they fire. Mixing indefinite fences with normal
+in-kernel DMA fences does not work, even when a fallback timeout is included to
+protect against malicious userspace:
+
+* Only the kernel knows about all DMA fence dependencies, userspace is not aware
+  of dependencies injected due to memory management or scheduler decisions.
+
+* Only userspace knows about all dependencies in indefinite fences and when
+  exactly they will complete, the kernel has no visibility.
+
+Furthermore the kernel has to be able to hold up userspace command submission
+for memory management needs, which means we must support indefinite fences being
+dependent upon DMA fences. If the kernel also support indefinite fences in the
+kernel like a DMA fence, like any of the above proposal would, there is the
+potential for deadlocks.
+
+.. kernel-render:: DOT
+   :alt: Indefinite Fencing Dependency Cycle
+   :caption: Indefinite Fencing Dependency Cycle
+
+   digraph "Fencing Cycle" {
+      node [shape=box bgcolor=grey style=filled]
+      kernel [label="Kernel DMA Fences"]
+      userspace [label="userspace controlled fences"]
+      kernel -> userspace [label="memory management"]
+      userspace -> kernel [label="Future fence, fence proxy, ..."]
+
+      { rank=same; kernel userspace }
+   }
+
+This means that the kernel might accidentally create deadlocks
+through memory management dependencies which userspace is unaware of, which
+randomly hangs workloads until the timeout kicks in. Workloads, which from
+userspace's perspective, do not contain a deadlock.  In such a mixed fencing
+architecture there is no single entity with knowledge of all dependencies.
+Thefore preventing such deadlocks from within the kernel is not possible.
+
+The only solution to avoid dependencies loops is by not allowing indefinite
+fences in the kernel. This means:
+
+* No future fences, proxy fences or userspace fences imported as DMA fences,
+  with or without a timeout.
+
+* No DMA fences that signal end of batchbuffer for command submission where
+  userspace is allowed to use userspace fencing or long running compute
+  workloads. This also means no implicit fencing for shared buffers in these
+  cases.
-- 
2.27.0

