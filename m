Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 105A7404934
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 13:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235265AbhIILZr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 07:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234862AbhIILZr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 07:25:47 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC421C061756
        for <linux-media@vger.kernel.org>; Thu,  9 Sep 2021 04:24:37 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id e16so1497430pfc.6
        for <linux-media@vger.kernel.org>; Thu, 09 Sep 2021 04:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hnlMYFtuS5udBmQ6DYQS75PP75aNeIqLijfz/ObR/fk=;
        b=CaAvlyAKTD6htP2F1nBChs45nV2YE/sgriDjrk3oOhhJ0DfoFm0PTlc/39m7fGI3is
         AOHw4wxXBi3MIedUxP5E2fBruDs6Ts4oOKUYGAk7s2UFGnuER6WkmgJElte1qvNvfFB+
         443DmhaqkwvRuhMQV3HUR5IPTbjf68z5uECOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hnlMYFtuS5udBmQ6DYQS75PP75aNeIqLijfz/ObR/fk=;
        b=Tq8BEg+6c5YWvxkHFS+BTX68Wex8l4JiXp8yy1CVLnyy+WuTq6tOJH9KkiOtI6vQH8
         6oLiQWFmw+QyNlsWDgEO3tZRhYWHu5ADdAm/zxKI932mu9UFSzASpAWohWWq2ZH8T5+B
         ePt18tdlnqLI/mqG8Y5ZO7+ZrrNuUiMXkayLIJnlkpOz3UN+JK0mOzGDc4HYNt4d5mO1
         j24g2jrK23E+zVbQNjUbAcDXUnZTm6ZNpWsIvxcBWxVENVRkh1KYfDEb1Lb+A9QJEGu2
         UO+Pwb5DgPtCdSwkvCzh3TWXh5AZKB0F3qbYoSDJ4zl1lVfXOhi+HfTrHZOGFWSQgjDH
         2GEw==
X-Gm-Message-State: AOAM530AAPKSp3uZvRu3PLkshwOTcvBczJfgVzRg7Pnc4WUlj0SxAfHM
        gg8Sj2BfGjJ3H5SlUOJH2VfV3g==
X-Google-Smtp-Source: ABdhPJxoU91HTa4hlNWlktOs3O0yqCB9tNHblL0pQ+92przwwe9ILO+wosdQdS5y/1BVw1V2hJvOWQ==
X-Received: by 2002:aa7:8702:0:b0:414:8789:12dc with SMTP id b2-20020aa78702000000b00414878912dcmr2723186pfo.28.1631186677485;
        Thu, 09 Sep 2021 04:24:37 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:166b:dcfc:dcf2:bbe2])
        by smtp.gmail.com with ESMTPSA id 141sm2046860pgg.16.2021.09.09.04.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 04:24:36 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv6 0/8] videobuf2: support new noncontiguous DMA API
Date:   Thu,  9 Sep 2021 20:24:22 +0900
Message-Id: <20210909112430.61243-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

        The series adds support for noncontiguous DMA API and
V4L2_MEMORY_FLAG_NON_COHERENT UAPI.

v5:

https://lore.kernel.org/lkml/20210823122235.116189-1-senozhatsky@chromium.org/

-- addressed feedback (Tomasz)
-- reworked prepare/finish functions (Tomasz)

Sergey Senozhatsky (8):
  videobuf2: rework vb2_mem_ops API
  videobuf2: inverse buffer cache_hints flags
  videobuf2: split buffer cache_hints initialisation
  videobuf2: move cache_hints handling to allocators
  videobuf2: add V4L2_MEMORY_FLAG_NON_COHERENT flag
  videobuf2: add queue memory coherency parameter
  videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT flag
  videobuf2: handle non-contiguous DMA allocations

 .../userspace-api/media/v4l/buffer.rst        |  40 +++-
 .../media/v4l/vidioc-create-bufs.rst          |   7 +-
 .../media/v4l/vidioc-reqbufs.rst              |  16 +-
 .../media/common/videobuf2/videobuf2-core.c   | 126 +++++++----
 .../common/videobuf2/videobuf2-dma-contig.c   | 195 ++++++++++++++----
 .../media/common/videobuf2/videobuf2-dma-sg.c |  39 ++--
 .../media/common/videobuf2/videobuf2-v4l2.c   |  59 +++---
 .../common/videobuf2/videobuf2-vmalloc.c      |  30 +--
 drivers/media/dvb-core/dvb_vb2.c              |   2 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |   9 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/videobuf2-core.h                |  59 +++---
 include/uapi/linux/videodev2.h                |  11 +-
 13 files changed, 411 insertions(+), 186 deletions(-)

-- 
2.33.0.153.gba50c8fa24-goog

