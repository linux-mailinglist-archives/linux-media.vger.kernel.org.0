Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBE74122279
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 04:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfLQDUo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 22:20:44 -0500
Received: from mail-pg1-f174.google.com ([209.85.215.174]:38392 "EHLO
        mail-pg1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfLQDUo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 22:20:44 -0500
Received: by mail-pg1-f174.google.com with SMTP id a33so4855618pgm.5
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2019 19:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8OIkbBGm2/UIWBdt/4gwjBTwZSPsO7hELscBafMhK08=;
        b=nJg1EkAd+ybAc6ZVbt6WYAZhn496n6O8pCjF99UpEZqCsit12oo2aWCdEA5q3vCptt
         DjW3f1lXd8ueQyTxe1kcmll7UpvHQZKpHuaq7b/PGmL5GpRChdp/6n94XfA7LH6YliAF
         kQvcfuaJ6EdK/iL1qU1n5DtD2dza2rvZjsB2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8OIkbBGm2/UIWBdt/4gwjBTwZSPsO7hELscBafMhK08=;
        b=bRmIq5FoGd2/a3KsqwHH6NCLB3xAHOc8A60onyGjy56DVf8a4edNkq1ONeLkKVfqba
         as1XCExveomSATCVdv6yVJnNYcaJ6LlrlehCobb5VYH6OSvu/WfTkfGKqFvC6jLroggV
         xLZBTJ1r1kKI0rKJORcki57if0isdw/AHMtV/px1+O50m4hh/tbon8CoujjlgDuLn6qG
         X6wEUgWyUGHUu5PY61MCQ/bUoZdrRVHOGHOHeooazOdObLy0waxvKVSo5qwANRTg+t+7
         aTzSJAdcKtVPCht2zSlkS8QKiBvqKpxBBe5slC52AbNstSwx71QjXAzhRNKPTCMmwjhY
         G1NQ==
X-Gm-Message-State: APjAAAWnoxhezmQohSOK+s2cuGDllDv4lt2DNQvh3BlFtcrPkj2ndbqb
        LTfA/hgOH9hRY6CrxyUEXjB9nA==
X-Google-Smtp-Source: APXvYqy2vER++9HLpfOhE1FDCXib9wTZt6yt1GUjs+8EGFMHkytRVF6m4bcdXYLUJlDpk+/M6P/GuA==
X-Received: by 2002:a65:4c82:: with SMTP id m2mr21937460pgt.432.1576552843221;
        Mon, 16 Dec 2019 19:20:43 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
        by smtp.gmail.com with ESMTPSA id j3sm24387455pfi.8.2019.12.16.19.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 19:20:42 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [RFC][PATCH 00/15] Implement V4L2_BUF_FLAG_NO_CACHE_* flags
Date:   Tue, 17 Dec 2019 12:20:19 +0900
Message-Id: <20191217032034.54897-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

	RFC

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

Sergey Senozhatsky (15):
  videobuf2: add cache management members
  videobuf2: handle V4L2 buffer cache flags
  videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT flag
  videobuf2: add queue memory consistency parameter
  videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT in REQBUFS
  videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT in CREATE_BUFS
  videobuf2: factor out planes prepare/finish functions
  videobuf2: do not sync caches when we are allowed not to
  videobuf2: check ->synced flag in prepare() and finish()
  videobuf2: let user-space know when driver supports cache hints
  videobuf2: add begin/end cpu_access callbacks to dma-contig
  videobuf2: add begin/end cpu_access callbacks to dma-sg
  videobuf2: do not sync buffers for DMABUF queues
  videobuf2: don't test db_attach in dma-contig prepare and finish
  videobuf2: don't test db_attach in dma-sg prepare and finish

 Documentation/media/uapi/v4l/buffer.rst       |  19 ++++
 .../media/uapi/v4l/vidioc-create-bufs.rst     |   8 +-
 .../media/uapi/v4l/vidioc-reqbufs.rst         |  19 +++-
 .../media/common/videobuf2/videobuf2-core.c   | 107 +++++++++++++-----
 .../common/videobuf2/videobuf2-dma-contig.c   |  39 ++++++-
 .../media/common/videobuf2/videobuf2-dma-sg.c |  30 +++--
 .../media/common/videobuf2/videobuf2-v4l2.c   |  59 +++++++++-
 drivers/media/dvb-core/dvb_vb2.c              |   2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   5 +-
 include/media/videobuf2-core.h                |  17 ++-
 include/uapi/linux/videodev2.h                |  11 +-
 11 files changed, 259 insertions(+), 57 deletions(-)

-- 
2.24.1.735.g03f4e72817-goog

