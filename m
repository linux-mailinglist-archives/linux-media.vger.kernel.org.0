Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E431D35CD
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 18:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgENQCH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 12:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENQCG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 12:02:06 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F26C061A0E;
        Thu, 14 May 2020 09:02:05 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id r10so1417388pgv.8;
        Thu, 14 May 2020 09:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ys6uruWLmmajm881cZgrjF9W81hQdSvS46fmomUyzjo=;
        b=CgWXF/MXwCn2w3TSRNi2r+wFdBkV0K1VgxC817ni5dQmY3U58163CbXnrvQ64GbSMo
         FZiugkdh4SofkruOZwivkScwqcH+1AwjhXWnuY2EGXDr1C+tl9LlyApxu1BEpn5oqmFe
         4JAhSnL6O7AOqgJbjbi0SoKNTE5X78u6TmYIRxgmDaQEv2wWTPmgbHtVz5zH1e3b42Mh
         MGdS9/kL6mZ6nvfsCnFjwQ8Uv0+broFoaVt/B1uLa/9+OnHjAd8pM7WPVCQUtgvEQqoL
         +ZYtjzzqx5Z/cXeiiiRjHZQLQSUQ8g7wt+WViiGJWeGGynGFElaCOcxLBXM6M4FOQwZm
         Rd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ys6uruWLmmajm881cZgrjF9W81hQdSvS46fmomUyzjo=;
        b=VEOqR09R4LVJ/1XCQiGAJl3Yzm44Aw1f2UgW2JX+qnYuOjb8atUwnBaaMi+YXCXr/k
         4GQUqfNp+weyOU1i+GfrAKnc9k2lDd6V2DdhrkpYdS/B0h0iK18iALi3CcLwAfKEbxRD
         lU2FggrhSVPwFjPN+nZ0e2k3VCrLLpZo9b6mn1R3QpBGqY6Dmtf8GT2NMW5C//R45OM4
         f3kqwqaGOFi3d8eFKL73DHchV2wMuEY6HJGWkmPysypsUezhFmDbqq69XYUO+LfCR6LD
         r94gYvS2JuVa133HMCOd+9K8iznKoIPji/M+JpN16ehMyGJxfSClVTxDOJJCTSzgJkI6
         01Qg==
X-Gm-Message-State: AOAM531Zi6mfLRpuUq5tTmDCYLRZViO1j7u/y44Ghph3h0RPnKHC9mdV
        mM5Sy6suznrlVK85qUEBFH+O7MeP
X-Google-Smtp-Source: ABdhPJyza+VXEqoRG2/lL5TjJj3s2szUktetaGac8j7OOrwcoJ9sr5LjmxrR8NTZX9OtppMW7wEzRA==
X-Received: by 2002:a62:7912:: with SMTP id u18mr4774754pfc.239.1589472124662;
        Thu, 14 May 2020 09:02:04 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id y6sm18178691pjw.15.2020.05.14.09.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 09:02:02 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCH v6 00/14] Implement V4L2_BUF_FLAG_NO_CACHE_* flags
Date:   Fri, 15 May 2020 01:01:39 +0900
Message-Id: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello

v6 changes:
The design has been slightly reworked. The cache-hints capability has
been renamed to SUPPORTS_MMAP_CACHE_HINTS and is reported for all queues
that support MMAP and allow cache hints. However, the actual hints and
memory consistency are ignored unless the queue is used for the MMAP
streaming I/O. Plus some cleanups, documentation updates, and so on.

Previous versions:
v5 link: https://lore.kernel.org/lkml/20200424092920.4801-1-sergey.senozhatsky@gmail.com
v4 link: https://lore.kernel.org/lkml/20200302041213.27662-1-senozhatsky@chromium.org/
v3 link: https://lore.kernel.org/lkml/20200226111529.180197-1-senozhatsky@chromium.org
v2 link: https://lore.kernel.org/lkml/20200204025641.218376-1-senozhatsky@chromium.org/
v1 link: https://lore.kernel.org/lkml/20191217032034.54897-1-senozhatsky@chromium.org/

Series Intro
========================================================================

        This is a reworked version of the vb2 cache hints
(V4L2_BUF_FLAG_NO_CACHE_INVALIDATE / V4L2_BUF_FLAG_NO_CACHE_CLEAN)
support patch series which previsouly was developed by Sakari and
Laurent [0].

The patch set attempts to preserve the existing behvaiour - cache
sync is performed in ->prepare() and ->finish() (unless the buffer
is DMA exported). User space can request “default behavior” override
with cache management hints, which are handled on a per-buffer basis
and should be supplied with v4l2_buffer ->flags during buffer
preparation. There are two possible hints:

- V4L2_BUF_FLAG_NO_CACHE_INVALIDATE
        No cache sync on ->finish()

- V4L2_BUF_FLAG_NO_CACHE_CLEAN
        No cache sync on ->prepare()

In order to keep things on the safe side, we also require driver
to explicitly state which of its queues (if any) support user space
cache management hints (such queues should have ->allow_cache_hints
bit set).

The patch set also (to some extent) simplifies allocators' ->prepare()
and ->finish() callbacks. Namely, we move cache management decision
making to the upper - core - layer. For example, if, previously, we
would have something like this

        vb2_buffer_done()
          vb2_dc_finish()
            if (buf->db_attach)
              return;

where each allocators' ->finish() callback would either bail
out (DMA exported buffer, for instance) or sync, now that "bail
out or sync" decision is made before we call into the allocator.

Along with cache management hints, user space is also able to
adjust queue's memory consistency attributes. Memory consistency
attribute (dma_attrs) is per-queue, yet it plays its role on the
allocator level, when we allocate buffers’ private memory (planes).
For the time being, only one consistency attribute is supported:
DMA_ATTR_NON_CONSISTENT.

[0] https://www.mail-archive.com/linux-media@vger.kernel.org/msg112459.html

Sergey Senozhatsky (14):
  videobuf2: use explicit unsigned int in vb2_queue
  videobuf2: add cache management members
  videobuf2: handle V4L2 buffer cache flags
  videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT flag
  videobuf2: add queue memory consistency parameter
  videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT flag
  videobuf2: factor out planes prepare/finish functions
  videobuf2: do not sync caches when we are allowed not to
  videobuf2: check ->synced flag in prepare() and finish()
  videobuf2: add begin/end cpu_access callbacks to dma-contig
  videobuf2: add begin/end cpu_access callbacks to dma-sg
  videobuf2: don't test db_attach in dma-contig prepare and finish
  videobuf2: remove redundant if-statement
  media: vivid: add cache_hints module param

 Documentation/admin-guide/media/vivid.rst     |   9 ++
 .../userspace-api/media/v4l/buffer.rst        |  40 +++++-
 .../media/v4l/vidioc-create-bufs.rst          |   7 +-
 .../media/v4l/vidioc-reqbufs.rst              |  21 ++-
 .../media/common/videobuf2/videobuf2-core.c   | 121 +++++++++++++-----
 .../common/videobuf2/videobuf2-dma-contig.c   |  44 ++++++-
 .../media/common/videobuf2/videobuf2-dma-sg.c |  38 ++++--
 .../media/common/videobuf2/videobuf2-v4l2.c   |  72 ++++++++++-
 drivers/media/dvb-core/dvb_vb2.c              |   2 +-
 drivers/media/test-drivers/vivid/vivid-core.c |   9 ++
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  10 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   5 +-
 include/media/videobuf2-core.h                |  47 +++++--
 include/uapi/linux/videodev2.h                |  14 +-
 14 files changed, 366 insertions(+), 73 deletions(-)

-- 
2.26.2

