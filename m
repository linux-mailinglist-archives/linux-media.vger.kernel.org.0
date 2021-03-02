Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F028C32A844
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349746AbhCBRX7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:23:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377435AbhCBArR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 19:47:17 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02CEFC061756
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 16:46:37 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id k22so10993154pll.6
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 16:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xBIqUTlZOBZINOUNGtSn+xvDmEUXrSLVCj5Dld52WaA=;
        b=WqKRU8G9m6+hjFzaQl0Ff4GENaIY/pOEomZeI+c8AzA2bLtUon8shJ5csfwJVEiJwE
         ch/0LDkTjxzATPWXoqr1K14NBZ94Px7Tm8qIzfbG6HUkgKDLBUV94sZ9a5vGBSkrhRo5
         Nzjr0MACCqZ7jRrM/SL1OwR+flF1VDZJ4+3eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xBIqUTlZOBZINOUNGtSn+xvDmEUXrSLVCj5Dld52WaA=;
        b=j3giXTOnGHmSXdBoo7EwOWfBAm+VhSOEyo4/RSET2H3NjnHL76TBxMzU61Ytnsm/Bz
         9XvRBYCxEgSvj8Jdb/BmBzLpFNzB02lm5l7L5Jhp3Z/e4d/3QMgqZ0Iw8/1CnF4OW50v
         h0mAEnrpV3s5Yi+ZIBV+NfJBv2UEA07vEHe5b3rIa009EkApq9O+Tv7x0asmd5PYc0/z
         mX0IlY1f8o3njVrbI6wT7OJuUqdBt0qbJ2o23Sh1cXCVoFPuxKmPUMME86f54oX32PgY
         Rhh1lIXU0gq1ldj4KcoYiWgeOP2QemqbfrfVbJZyust2/U0pcW7MJZqloLE3qyjn/K8V
         CYGg==
X-Gm-Message-State: AOAM5309cj1qNiPGelwVLfMiw/0UO5eZYpv7JwAOjuzeojoU1E0d0zZn
        v/A/gFFhO14D2Y71Tx2j6BWAUKhSXEn/sA==
X-Google-Smtp-Source: ABdhPJwPHuB95QHizieojD4FLuANspU8EvNm9a6/omFjwCtr7WRgLl+jEJA5dU3+q7gvl1lZYp6UdA==
X-Received: by 2002:a17:902:6ac7:b029:e4:28f8:b463 with SMTP id i7-20020a1709026ac7b02900e428f8b463mr17838026plt.62.1614645996583;
        Mon, 01 Mar 2021 16:46:36 -0800 (PST)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:d5d7:1a61:2cdf:273c])
        by smtp.gmail.com with ESMTPSA id b14sm678881pji.14.2021.03.01.16.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 16:46:36 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 0/8] videobuf2: support new noncontiguous DMA API
Date:   Tue,  2 Mar 2021 09:46:16 +0900
Message-Id: <20210302004624.31294-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

	RFC

	The series adds support for new noncontiguous DMA API [0] and
adds V4L2_FLAG_MEMORY_NON_COHERENT UAPI. This is similar to previous
V4L2_FLAG_MEMORY_NON_CONSISTENT (which was renamed), but the patch set
goes a bit further this time and also does some videobuf2 API
refactroings along the way.

A corresponding v4l2-compliance patch will be posted shortly.

[0] https://lore.kernel.org/lkml/20210301085236.947011-2-hch@lst.de/

Sergey Senozhatsky (8):
  videobuf2: rework vb2_mem_ops API
  videobuf2: inverse buffer cache_hints flags
  videobuf2: split buffer cache_hints initialisation
  videobuf2: move cache_hints handling to allocators
  videobuf2: add V4L2_FLAG_MEMORY_NON_COHERENT flag
  videobuf2: add queue memory coherency parameter
  videobuf2: handle V4L2_FLAG_MEMORY_NON_COHERENT flag
  videobuf2: handle non-contiguous DMA allocations

 .../userspace-api/media/v4l/buffer.rst        |  40 +++-
 .../media/v4l/vidioc-create-bufs.rst          |   7 +-
 .../media/v4l/vidioc-reqbufs.rst              |  16 +-
 .../media/common/videobuf2/videobuf2-core.c   | 135 +++++++++-----
 .../common/videobuf2/videobuf2-dma-contig.c   | 175 ++++++++++++++----
 .../media/common/videobuf2/videobuf2-dma-sg.c |  39 ++--
 .../media/common/videobuf2/videobuf2-v4l2.c   |  47 ++---
 .../common/videobuf2/videobuf2-vmalloc.c      |  30 +--
 drivers/media/dvb-core/dvb_vb2.c              |   2 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |   9 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   5 +-
 include/media/videobuf2-core.h                |  57 +++---
 include/uapi/linux/videodev2.h                |  13 +-
 13 files changed, 396 insertions(+), 179 deletions(-)

-- 
2.30.1.766.gb4fecdf3b7-goog

