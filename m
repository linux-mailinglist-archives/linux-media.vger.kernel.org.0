Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8B03D6FDE
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 09:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235236AbhG0HFX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 03:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234803AbhG0HFX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 03:05:23 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838E1C061757
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 00:05:23 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso3581459pjf.4
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 00:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aA9KzM1YQpeMy8flwFCJF+abB2VNYPrrTMZe7/kNPGs=;
        b=aDd5cPFiOJD1MYOLMADwtAS2QlfogGnOEPQgTMzb99aWr3VeMZdTAVo8KeO+wRTYGX
         5EWJa4rV6slTdQaxgTnur8K2gZKo0rHsuS1cqREPNoDx1sG5U5nsCAQSFbytUhgOeE44
         hmTXxayBE3CAHh1hAEVu3z6vTnCNMtLPhuIvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aA9KzM1YQpeMy8flwFCJF+abB2VNYPrrTMZe7/kNPGs=;
        b=eP0HEXpnet/1mEK/bbSgRouNTq9VPXcHmxf5su6Pd2L+1HUYaD6ge233lF+BZ8qw5D
         bcAawXROUIh/iKCdfoahs0psHwKC8EEmIDiReqr0qkjKeH1o5apyay3Bg/71SfOe91jB
         g7mJuMCOacczjGPIyhcr22K6Bqoa0+U4w+kdNjcdfZKAda9ir8L3AMk6xLJFm+6Ylk89
         BQ3ykRHoMGKM/OF6YPKr/BKzfLQWZXu6jZiJXVQoQnhr9hiXzw57i/YgqdHxEIa3vHBv
         sGVZjgE8CFmaJwsObbiC4A4SbU8fX6gWMPCAdSEwo8Rf3PaxtLpDSJJ3p2V6ZFfbS14G
         uO3A==
X-Gm-Message-State: AOAM533EWPiQMEUSCX405diMFtwcR/eKLDkMiwRJ7rsJ4bJnntTYFxYS
        avHk8SwoN3RsWO/SIfezG/mtig==
X-Google-Smtp-Source: ABdhPJw0eV7LCImKcYBCHhHCgwQJSFomf7kjjdphAENe/t3wQ//GyhIGFfrbhjvLU0PSnUA7kVu+KQ==
X-Received: by 2002:a65:5c01:: with SMTP id u1mr22166032pgr.181.1627369522989;
        Tue, 27 Jul 2021 00:05:22 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:ba3e:509b:495:ec84])
        by smtp.gmail.com with ESMTPSA id 30sm2343447pgq.31.2021.07.27.00.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 00:05:22 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 0/8] videobuf2: support new noncontiguous DMA API
Date:   Tue, 27 Jul 2021 16:05:09 +0900
Message-Id: <20210727070517.443167-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

	The series adds support for noncontiguous DMA API and
V4L2_MEMORY_FLAG_NON_COHERENT UAPI.

v4:
-- addressed Dafna's feedback

V3: https://lore.kernel.org/lkml/20210709092027.1050834-1-senozhatsky@chromium.org

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
 .../media/common/videobuf2/videobuf2-core.c   | 127 ++++++++-----
 .../common/videobuf2/videobuf2-dma-contig.c   | 176 ++++++++++++++----
 .../media/common/videobuf2/videobuf2-dma-sg.c |  39 ++--
 .../media/common/videobuf2/videobuf2-v4l2.c   |  59 +++---
 .../common/videobuf2/videobuf2-vmalloc.c      |  30 +--
 drivers/media/dvb-core/dvb_vb2.c              |   2 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |   9 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/videobuf2-core.h                |  59 +++---
 include/uapi/linux/videodev2.h                |  11 +-
 13 files changed, 399 insertions(+), 180 deletions(-)

-- 
2.32.0.432.gabb21c7263-goog

