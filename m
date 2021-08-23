Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66F493F4A82
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 14:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236864AbhHWMX3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 08:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235813AbhHWMX2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 08:23:28 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E05C061757
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 05:22:46 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id u11-20020a17090adb4b00b00181668a56d6so5756197pjx.5
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 05:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EBrLZ/hTuEdFX3I/jxwu3RDKU2SHu+BSyIoX6591D+Q=;
        b=CpNE8kZH0JCdJpJv39anVC8Dvh+OT0TIHS7W19peeoTMlEUQDSVwL7QXJrV+mVdLd9
         rqTW8DoPEvmCRAgcLbJUPeNxS5JQeUbQg6FtF93GC37R/Lms+0s9XesPHMC0O01g41WS
         XXEOlXEO00nAa6XT/37VGpTFhGbZbPyL96f0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EBrLZ/hTuEdFX3I/jxwu3RDKU2SHu+BSyIoX6591D+Q=;
        b=hjiJ4cxWaAQGy72+HXvfmhzg4lAiv/hrUS2BFePavJsnOTlJrCOjityMqnC9S1rwzN
         6bBux7cVtv7AvfXib12BGdhOui1U0XtoXW7Yh+w84esdXWyhXIXkdgUfnBO2qtz3nyoq
         nKTUM2RJgueWbYd6XEWvWnBRTfqgeY5U2Vk9fH0lo1iOycXJtCjxCpfmlbsfHxfgC/5B
         vvH3uwachFZ3BlnhdKxfk4IX5XHAKv5Bc15stviO2N28pir/7c/4JRgTT4NJG7EIHiUa
         HC6oyWXwSsQhskiFS/ruYH/rtAcx+Oiktg5OF1ytzrcqzgh+R7Rd8k7CgdHgBoNaYTYI
         UTqA==
X-Gm-Message-State: AOAM533vD/xkxE2cMmci2YeQ8EVGpe//45UqraWYZuN4Z/jOE/J85VKC
        Q31aaUHOeoy57o3EKPTOveXqTQ==
X-Google-Smtp-Source: ABdhPJxcU4dCbte1s5Vo9ec2RGDARkUrI0UuP+uhs/rvwrdVYNd7Vw4ktta5LROLVqW7o0vwp+gAAg==
X-Received: by 2002:a17:90a:808b:: with SMTP id c11mr2719504pjn.33.1629721365554;
        Mon, 23 Aug 2021 05:22:45 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:8821:8b2f:2912:f9e4])
        by smtp.gmail.com with ESMTPSA id a15sm9035576pfn.219.2021.08.23.05.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 05:22:44 -0700 (PDT)
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
Subject: [PATCHv5 0/8] videobuf2: support new noncontiguous DMA API
Date:   Mon, 23 Aug 2021 21:22:27 +0900
Message-Id: <20210823122235.116189-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

        The series adds support for noncontiguous DMA API and
V4L2_MEMORY_FLAG_NON_COHERENT UAPI.

v5:
https://lore.kernel.org/lkml/20210727070517.443167-1-senozhatsky@chromium.org/

-- addressed feedback from Hans
-- typos and grammar
-- reversed vb2 queue and vb2 non-coherent memory flag

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
 .../common/videobuf2/videobuf2-dma-contig.c   | 198 ++++++++++++++----
 .../media/common/videobuf2/videobuf2-dma-sg.c |  39 ++--
 .../media/common/videobuf2/videobuf2-v4l2.c   |  59 +++---
 .../common/videobuf2/videobuf2-vmalloc.c      |  30 +--
 drivers/media/dvb-core/dvb_vb2.c              |   2 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |   9 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/videobuf2-core.h                |  59 +++---
 include/uapi/linux/videodev2.h                |  11 +-
 13 files changed, 419 insertions(+), 181 deletions(-)

-- 
2.33.0.rc2.250.ged5fa647cd-goog

