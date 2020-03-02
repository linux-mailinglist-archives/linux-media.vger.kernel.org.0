Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE13175279
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 05:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgCBEMY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Mar 2020 23:12:24 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34456 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgCBEMX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Mar 2020 23:12:23 -0500
Received: by mail-pg1-f194.google.com with SMTP id t3so4759135pgn.1
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2020 20:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B8nUcMBqmV2MqPtUQIaeg61WlAypNvWpr/qBj0Tv7NQ=;
        b=H9TZNADJiJ+TG4xU1inFGhGNnlHK9zgdyeHHXngKzbZiQQDPAejY1YTA63cGSgjhIa
         nIVy1G2Jh6kDLjrImrx5PDxJINTnmpwsRaw5nAxB4BKlb64ZEtNRveNJvBdkA3Q63rZg
         h4Gy+BJ5W4yd9JhJhJ9xE/w7k590FrBcyhceM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B8nUcMBqmV2MqPtUQIaeg61WlAypNvWpr/qBj0Tv7NQ=;
        b=Jz3o3UXjzIq1TKuK+oKEc7i4Tm6IjhIT8jDx+ay3UiRXs9TIVjicZzbb30LZjbt0YZ
         EZtVrBV1tc1EwKvKyhoyDcr6wxNx/kJo4OzaqfUhVmBElgL9SHMosr+AGJ5hwbEpEvu+
         3L+D1AP+d4Bqn5xEDAaPXUDrCmO6qU5pE+btJpNIADoIn9ObESYNu6buPJ63lMf5qx8B
         4HyJaLaDKeCh2ztKtwG8+x/CJvwhNCIRbVauc1xvdjW5+79sLy32BQLtdEQ0+YEdlwo6
         v3d4Yj/Rrk2T2c+LiidNzFEwPlv/sBHHvTbI/1B/yEv+xqEGzOmPQ/loi7Fprpqkr/wa
         S0Ig==
X-Gm-Message-State: APjAAAXMvY97zPk1X/goyjZCuxPQsvpUS2jfLp4wHGU1S+qqak09E4Ox
        n7lINMN1PnunVNykkKWSEbhcnA==
X-Google-Smtp-Source: APXvYqx5IVVGmhE21w/I3CEw5NMLpL868xHNe0N+DRcF8FJsK86WdNxQZUgVYcoaMl1J1+PB3lxLYQ==
X-Received: by 2002:a63:565e:: with SMTP id g30mr17254989pgm.206.1583122342748;
        Sun, 01 Mar 2020 20:12:22 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id d82sm1698114pfd.187.2020.03.01.20.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 20:12:22 -0800 (PST)
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
Subject: [PATCHv4 00/11] Implement V4L2_BUF_FLAG_NO_CACHE_* flags
Date:   Mon,  2 Mar 2020 13:12:02 +0900
Message-Id: <20200302041213.27662-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

	v4 of the series. Typos and grammar fixes.

Previous series:
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
 .../media/uapi/v4l/vidioc-create-bufs.rst     |   7 +-
 .../media/uapi/v4l/vidioc-reqbufs.rst         |  18 ++-
 .../media/common/videobuf2/videobuf2-core.c   | 110 +++++++++++++-----
 .../common/videobuf2/videobuf2-dma-contig.c   |  39 ++++++-
 .../media/common/videobuf2/videobuf2-dma-sg.c |  36 ++++--
 .../media/common/videobuf2/videobuf2-v4l2.c   |  82 ++++++++++++-
 drivers/media/dvb-core/dvb_vb2.c              |   2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   5 +-
 include/media/videobuf2-core.h                |  28 ++++-
 include/uapi/linux/videodev2.h                |  11 +-
 11 files changed, 310 insertions(+), 57 deletions(-)

-- 
2.25.0.265.gbab2e86ba0-goog

