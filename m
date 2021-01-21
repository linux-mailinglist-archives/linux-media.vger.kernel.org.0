Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C503D2FF4E6
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 20:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbhAUTnU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 14:43:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbhAUTmT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 14:42:19 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99FE4C061788
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 11:41:04 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id m2so2476569wmm.1
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 11:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bNL6e0QN+ZR4/EOKF9FDIwkALm5IXytT641Xe0UFkrY=;
        b=P8ric9b+DEzkRUmhpyp5fhDfW46TI86b2poNLqGZYj3qS6U4sSUnJwXO9DgIU1/7ZD
         CKZ09IYRErEY3NX1DdvOp/F2B/sSE5opK29JNAgoq/QvIMRF/IILJk/sK4rN/fvGW4Rt
         XJN9Hiir+rV1rDeOdFpzPu2UqlLf+V1J1aL2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bNL6e0QN+ZR4/EOKF9FDIwkALm5IXytT641Xe0UFkrY=;
        b=UhsQBxVgUJTBTLGf3cSNzFfU39ymIP8qXLn/lrJKA4x9A/kf45LjN/ya00piqd//Do
         RHC4TpCgvK0XhtQU3qdAyvvrQXMZMDtiBlGRbCHFLfr89YLesvcXIL/p8zDDwz8pY6hE
         ysp/npvrSXiKBbg8aEjY9AzudXTZhrCapvKpabBksKdc6pIzVGScHrzpY/I5psfHWi/j
         y/plucZG/frudS43MrvTd432aDhcB7x7+B4jjXhn04w47zArXy/HrbZfV18G9J8fLDuq
         Jze4IhBESAlVDc+Og2MwJrcCT9IpzFEVNerGReJEFBusyWgIanOGly2/ab6ZYQI7NC5W
         Putw==
X-Gm-Message-State: AOAM532QHuV8DX5r8CoEvUWfpBvlTb3QWtTl97/+9yxq5r0E+Nj3HkmA
        NJcrdUYeSaDnoA8X1hytxzAgmg==
X-Google-Smtp-Source: ABdhPJz6Ns3zXzoWHuN08CkftiUhSBJXsmHiP4wjoMie+1Gc9+2oPhLWgZ/NzGFdQrNkELplFRSVpw==
X-Received: by 2002:a1c:a9ce:: with SMTP id s197mr854645wme.146.1611258063360;
        Thu, 21 Jan 2021 11:41:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w13sm9605935wrt.52.2021.01.21.11.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 11:41:02 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Jerome Glisse <jglisse@redhat.com>,
        Felix Kuehling <felix.kuehling@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] RFC: dma-fence: Document recoverable page fault implications
Date:   Thu, 21 Jan 2021 20:40:56 +0100
Message-Id: <20210121194056.1734409-1-daniel.vetter@ffwll.ch>
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
document the conclusions a bit.

References: https://lore.kernel.org/dri-devel/20210107030127.20393-1-Felix.Kuehling@amd.com/
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Jerome Glisse <jglisse@redhat.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
--
I'll be away next week, but figured I'll type this up quickly for some
comments and to check whether I got this all roughly right.

Critique very much wanted on this, so that we can make sure hw which
can't preempt (with pagefaults pending) like gfx10 has a clear path to
support page faults in upstream. So anything I missed, got wrong or
like that would be good.
-Daniel
---
 Documentation/driver-api/dma-buf.rst | 66 ++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index a2133d69872c..e924c1e4f7a3 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -257,3 +257,69 @@ fences in the kernel. This means:
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
+Linus rely on DMA fences, which means without an entirely new userspace stack
+built on top of userspace fences, they cannot benefit from recoverable page
+faults. The exception is when page faults are only used as migration hints and
+never to on-demand fill a memory request. For now this means recoverable page
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
+There are a few ways to prevent this problem:
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

