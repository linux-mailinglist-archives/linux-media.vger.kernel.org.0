Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FFEC16FD12
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 12:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbgBZLPl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 06:15:41 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37589 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727882AbgBZLPl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 06:15:41 -0500
Received: by mail-pg1-f196.google.com with SMTP id z12so1154287pgl.4
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 03:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8yVtxijvwpIfyab7nC3bTr6CbnAeL2kHyHCvA71vkPY=;
        b=jX/1eUsUXdA0g99KC2MjHBtBs7GlFRwL0UrNtmsejsFYTf5XxR6PFh3shD31qb6Q6O
         GuX3MjoOr3Y2brruSyQYNAT8zIgQ2Zfy5QUn1hteowuDXsTV6S6bEvNkHdp/dqGDw6ml
         hfwz7GA5LgdGdC5PxrAKanQsQT1S6bIAEZcrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8yVtxijvwpIfyab7nC3bTr6CbnAeL2kHyHCvA71vkPY=;
        b=Ydjy0xPIrZbM/HMY80EMN6HBZK92hjFN9m1PGe7Q5b7hmsTlmCFqYCa+uF3HXZ7ULh
         gjAPogiMN7oh9OMc0bc7Dlo3ExWhF8XuCiUhhHW5eMmb1Exn3TQCGOkVbGurVon/CHQC
         NeVlV/gS1fi/x9GqPUKVOlUWzf8DVQyB/nvvcWAfvslOpaUSy1dXCaWUVhoxTQYF9Mx/
         5+CALLmVmoSj02TnlG+J5tKvX5eSZ2QAw+rKV2mPD/IxFQXtOKxcNw6vqEAzVtqh9lO6
         QuAsFiQ1kpU7cvpuACsME0OzYDkiODMcU3KZMoAul/RithosqwVNZj2yxM7pYum8ZZ6x
         pdmg==
X-Gm-Message-State: APjAAAUCIg/SUhZ63vgQL0bezU1RX9SIuTOIo7355f++N2QSt8DHN8L7
        CcTLYf7MCBIGcJKxHTiqWTOYhg==
X-Google-Smtp-Source: APXvYqxvS6SFxRvwoyIB2vbUbaiKqIL+GpTYmOQr1R6lHimO5JdtLNvUVSof4SvWs7kEOWkcPk7qyQ==
X-Received: by 2002:a63:af53:: with SMTP id s19mr3311309pgo.175.1582715737859;
        Wed, 26 Feb 2020 03:15:37 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id o22sm2429993pgj.58.2020.02.26.03.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 03:15:37 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 00/11] Implement V4L2_BUF_FLAG_NO_CACHE_* flags
Date:   Wed, 26 Feb 2020 20:15:18 +0900
Message-Id: <20200226111529.180197-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

	V3 of the patchset, reshuffled and updated.

- Most notable changes:

a) Added a simple helper function vb2_queue_allows_cache_hints(),
   which return true if queue has ->allow_cache_hints and when
   ->memory is VB2_MEMORY_MMAP.
   That is - user space cache and memory consistency hints are now
   specifically for MMAP buffers and queues that support hints.

b) Set V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS capability bit only when queue
   has ->allow_cache_hints and ->io_modes has VB2_MMAP bit set

c) Clear "incompatible" request's flags when queue does not permit
   cache and memory consistency hints (IOW, when vb2_queue_allows_cache_hints()
   return false)


Minor changes:

- Squashed V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS and V4L2_FLAG_MEMORY_NON_CONSISTENT
  patches.

- Added more documentation and code comments.


Previous series:
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

Sergey Senozhatsky (11):
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

 Documentation/media/uapi/v4l/buffer.rst       |  29 +++++
 .../media/uapi/v4l/vidioc-create-bufs.rst     |   8 +-
 .../media/uapi/v4l/vidioc-reqbufs.rst         |  22 +++-
 .../media/common/videobuf2/videobuf2-core.c   | 110 +++++++++++++-----
 .../common/videobuf2/videobuf2-dma-contig.c   |  39 ++++++-
 .../media/common/videobuf2/videobuf2-dma-sg.c |  36 ++++--
 .../media/common/videobuf2/videobuf2-v4l2.c   |  82 ++++++++++++-
 drivers/media/dvb-core/dvb_vb2.c              |   2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   5 +-
 include/media/videobuf2-core.h                |  28 ++++-
 include/uapi/linux/videodev2.h                |  11 +-
 11 files changed, 314 insertions(+), 58 deletions(-)

-- 
2.25.0.265.gbab2e86ba0-goog

