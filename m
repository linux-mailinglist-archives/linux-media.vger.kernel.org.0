Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB72236C6C3
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 15:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236345AbhD0NOf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 09:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236008AbhD0NOf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 09:14:35 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51754C061756
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 06:13:52 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id h7so2277358plt.1
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 06:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S4vbjByssd6HLTgZkW+s/ADJ80oqNfWlaEfAAN9smbw=;
        b=byznHgcOgbWs+gE8oZrFSW+BMJaNUcA+Hdj79LYIArT1bg+n+XnvasozZFP3SlvCz7
         x4x0uNtInRSqsizHYOcZvw/fZP8ntrQK/UV7IsRRX/P3xWDjbn0FQkfv0ml1xdF5tFuv
         LcE92DqnALwM/U9UC/XWkKMZTS5FVgPoV3Oek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S4vbjByssd6HLTgZkW+s/ADJ80oqNfWlaEfAAN9smbw=;
        b=ERGvYuvRbSA30bx1/r5h6l1g5aFv7CCRy6U/UMClYSvlK5OWXMtYJfP7k4WDdpjIf+
         0l87kglLMIHgz/II/2rdMGWhbLjD+7Ua7cjeVLxWxgy5Vxyz4BUx9N7zi2XK55X/uPfF
         gLqHRmYWglbYwsEECqcPEkBBi8mTYkEIRH6NSgvtvi3yi5UB/dDbImI41lK1SwrSl7GH
         yksXsZOw4fnZ6kkosXUSYnPuqkyXLFbQ0qBGMIXbPXMh8+Js2BCltn4W36nCcqhJz72f
         bpGOEnvt+eA8DIp2w2X7UHs2yCrdeab9EFVYhpdLCJpr47CsfChB6Y6EykpDhw24Q6Lw
         y0Gg==
X-Gm-Message-State: AOAM531VINUkOWFMIGM9vJv20sciaVnRMDZZAe8+LBxJiUapEIVsmiok
        O7zbJmCdMKrBMhShx7PTADVDOQ==
X-Google-Smtp-Source: ABdhPJy+dEzuhB24oN0C4EaCl1q6Lb2qHm8d5kdVPEPRg7XRRq5oeu4fSuzc7AHlWscBhrjTudEYdQ==
X-Received: by 2002:a17:90b:1d90:: with SMTP id pf16mr4952762pjb.72.1619529231879;
        Tue, 27 Apr 2021 06:13:51 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:8192:3566:9cd4:8ed7])
        by smtp.gmail.com with ESMTPSA id c8sm2755313pfp.160.2021.04.27.06.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 06:13:51 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2 0/8] videobuf2: support new noncontiguous DMA API
Date:   Tue, 27 Apr 2021 22:13:35 +0900
Message-Id: <20210427131344.139443-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

	The series adds support for noncontiguous DMA API and adds
V4L2_MEMORY_FLAG_NON_COHERENT UAPI.

v2:
-- addressed review feedback [0] (Hans, Tomasz)
-- inverted and renamed vb2_queue.non_coherent_mem member. It's easier
   when we have vb2_queue.coherent_mem instead
-- inverted and renamed the corresponding vb2_dc_buf.non_coherent_mem
   member, for pretty much same reason.

   IOW some semi-intrusive changes.

[0] https://lore.kernel.org/lkml/20210302004624.31294-1-senozhatsky@chromium.org/

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
 .../media/v4l/vidioc-reqbufs.rst              |  17 +-
 .../media/common/videobuf2/videobuf2-core.c   | 127 ++++++++-----
 .../common/videobuf2/videobuf2-dma-contig.c   | 174 ++++++++++++++----
 .../media/common/videobuf2/videobuf2-dma-sg.c |  39 ++--
 .../media/common/videobuf2/videobuf2-v4l2.c   |  56 +++---
 .../common/videobuf2/videobuf2-vmalloc.c      |  30 +--
 drivers/media/dvb-core/dvb_vb2.c              |   2 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |   9 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   5 +-
 include/media/videobuf2-core.h                |  59 +++---
 include/uapi/linux/videodev2.h                |  11 +-
 13 files changed, 395 insertions(+), 181 deletions(-)

-- 
2.31.1.498.g6c1eba8ee3d-goog

