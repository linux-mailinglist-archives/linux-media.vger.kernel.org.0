Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90D3E30DE39
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 16:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233847AbhBCPc0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 10:32:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234352AbhBCPa2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Feb 2021 10:30:28 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1BEC061352
        for <linux-media@vger.kernel.org>; Wed,  3 Feb 2021 07:29:29 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id c4so22120192wru.9
        for <linux-media@vger.kernel.org>; Wed, 03 Feb 2021 07:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dX5VWhzdyCSXKOkzbFh/rppPL8SS0wtBsuXFORopB0E=;
        b=XopLrHKZbh8IvKLagLigdfsTrY8sxR+m6Xie6uCiR53EextjydiFKe5V6Zo+ctkjqU
         TM2/sYWjHi7tScNkKM4zbwFzfqrGn+XBtdHx+y27ZOUIXFJvowhu2Yw3RsI7uMPl/j+z
         tw0mjJGsjsICgamEykClEFgk+oHPA/vn3vJv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dX5VWhzdyCSXKOkzbFh/rppPL8SS0wtBsuXFORopB0E=;
        b=EKAjQnSRu8hjBtfPTcsyf1L4lzqouwSnDvcWGg4Adwdwu5qtuTF+EgsgKs6f9Wr+xL
         +/dDZfvPRKLR4BF/QwVwkyJI6v7QMEoJr9yORzL1pxvYQvc28M8NUTOnqTSt4YZkny8k
         /ozbuEumd91JNliiMcCqyvecO65PO04/Tnh8nOhoqw1hBIe2j3Mtm40b3jt+7lqOXonZ
         8qHJemynptLxpMHo+AxN5cQyYIAaNmvlXWoUpZi/SWieYUBTr+c0TbTBvuMnZB5prE71
         d4piw6bmG5fRqiaoawP+s6GBhfakj5FZoOySzwc6zzKSpB+Xp47i0ZsHerhyKHT3N9UO
         mrzA==
X-Gm-Message-State: AOAM5329/DyEkKnV6fVriahzvvUgukxkOrlA6g39tQjYNoHuWiRVfR/1
        A9NDuJVKIRud/llll8wYqmtHXw==
X-Google-Smtp-Source: ABdhPJzVLJmtYENS2YgeQZySm5SoeXYyzpaLIlSonXEHkElg5fxVGgKG2F6eexgXJaLvEh8wld5viA==
X-Received: by 2002:adf:83a6:: with SMTP id 35mr4126060wre.274.1612366167884;
        Wed, 03 Feb 2021 07:29:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l1sm2779528wmq.17.2021.02.03.07.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 07:29:27 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Dave Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Jerome Glisse <jglisse@redhat.com>,
        Felix Kuehling <felix.kuehling@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-fence: Document recoverable page fault implications
Date:   Wed,  3 Feb 2021 16:29:21 +0100
Message-Id: <20210203152921.2429937-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Recently there was a fairly long thread about recoreable hardware page
faults, how they can deadlock, and what to do about that.

While the discussion is still fresh I figured good time to try and
document the conclusions a bit. This documentation section explains
what's the potential problem, and the remedies we've discussed,
roughly ordered from best to worst.

v2: Linus -> Linux typoe (Dave)

v3:
- Make it clear drivers only need to implement one option (Christian)
- Make it clearer that implicit sync is out the window with exclusive
  fences (Christian)
- Add the fairly theoretical option of segementing the memory (either
  statically or through dynamic checks at runtime for which piece of
  memory is managed how) and explain why it's not a great idea (Felix)

References: https://lore.kernel.org/dri-devel/20210107030127.20393-1-Felix.Kuehling@amd.com/
Cc: Dave Airlie <airlied@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Jerome Glisse <jglisse@redhat.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 Documentation/driver-api/dma-buf.rst | 76 ++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index a2133d69872c..7f37ec30d9fd 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -257,3 +257,79 @@ fences in the kernel. This means:
   userspace is allowed to use userspace fencing or long running compute
   workloads. This also means no implicit fencing for shared buffers in these
   cases.
+
+Recoverable Hardware Page Faults Implications
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Modern hardware supports recoverable page faults, which has a lot of
+implications for DMA fences.
+
+First, a pending page fault obviously holds up the work that's running on the
+accelerator and a memory allocation is usually required to resolve the fault.
+But memory allocations are not allowed to gate completion of DMA fences, which
+means any workload using recoverable page faults cannot use DMA fences for
+synchronization. Synchronization fences controlled by userspace must be used
+instead.
+
+On GPUs this poses a problem, because current desktop compositor protocols on
+Linux rely on DMA fences, which means without an entirely new userspace stack
+built on top of userspace fences, they cannot benefit from recoverable page
+faults. Specifically this means implicit synchronization will not be possible.
+The exception is when page faults are only used as migration hints and never to
+on-demand fill a memory request. For now this means recoverable page
+faults on GPUs are limited to pure compute workloads.
+
+Furthermore GPUs usually have shared resources between the 3D rendering and
+compute side, like compute units or command submission engines. If both a 3D
+job with a DMA fence and a compute workload using recoverable page faults are
+pending they could deadlock:
+
+- The 3D workload might need to wait for the compute job to finish and release
+  hardware resources first.
+
+- The compute workload might be stuck in a page fault, because the memory
+  allocation is waiting for the DMA fence of the 3D workload to complete.
+
+There are a few options to prevent this problem, one of which drivers need to
+ensure:
+
+- Compute workloads can always be preempted, even when a page fault is pending
+  and not yet repaired. Not all hardware supports this.
+
+- DMA fence workloads and workloads which need page fault handling have
+  independent hardware resources to guarantee forward progress. This could be
+  achieved through e.g. through dedicated engines and minimal compute unit
+  reservations for DMA fence workloads.
+
+- The reservation approach could be further refined by only reserving the
+  hardware resources for DMA fence workloads when they are in-flight. This must
+  cover the time from when the DMA fence is visible to other threads up to
+  moment when fence is completed through dma_fence_signal().
+
+- As a last resort, if the hardware provides no useful reservation mechanics,
+  all workloads must be flushed from the GPU when switching between jobs
+  requiring DMA fences or jobs requiring page fault handling: This means all DMA
+  fences must complete before a compute job with page fault handling can be
+  inserted into the scheduler queue. And vice versa, before a DMA fence can be
+  made visible anywhere in the system, all compute workloads must be preempted
+  to guarantee all pending GPU page faults are flushed.
+
+- Only a fairly theoretical option would be to untangle these dependencies when
+  allocating memory to repair hardware page faults, either through separate
+  memory blocks or runtime tracking of the full dependency graph of all DMA
+  fences. This results very wide impact on the kernel, since resolving the page
+  on the CPU side can itself involve a page fault. It is much more feasible and
+  robust to limit the impact of handling hardware page faults to the specific
+  driver.
+
+Note that workloads that run on independent hardware like copy engines or other
+GPUs do not have any impact. This allows us to keep using DMA fences internally
+in the kernel even for resolving hardware page faults, e.g. by using copy
+engines to clear or copy memory needed to resolve the page fault.
+
+In some ways this page fault problem is a special case of the `Infinite DMA
+Fences` discussions: Infinite fences from compute workloads are allowed to
+depend on DMA fences, but not the other way around. And not even the page fault
+problem is new, because some other CPU thread in userspace might
+hit a page fault which holds up a userspace fence - supporting page faults on
+GPUs doesn't anything fundamentally new.
-- 
2.30.0

