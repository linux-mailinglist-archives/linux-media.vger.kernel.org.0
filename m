Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A15FC3C2160
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 11:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbhGIJXR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 05:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231875AbhGIJXR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 05:23:17 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A08BC0613DD
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 02:20:33 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id v7so9372725pgl.2
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 02:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m/swc7+7lVySzof/sdsgYxUu7VJv77g13+MHhwmBBDU=;
        b=EmV1PAszCqukIh3y5z7Bseav0IcZCCrOmEALNPI6ANACUfZ4k6jXhebEj4j/3FLhM1
         d0CBDZIPRHv9zY/J2BiyUdbNW9/lnXT6NMh8LF4HD5T5EcJJJVw6uQXzfJSWD17dOk43
         jeAB5bzEgtLzNTPlN34+W9cdyqyeU+ngUKjKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m/swc7+7lVySzof/sdsgYxUu7VJv77g13+MHhwmBBDU=;
        b=OJ3uD3AQiA8xqk06b7zFcgTSEdkleENt2b9Vslx/7Wup/7F7w/VQdRU60svLZaIHVM
         k8xonBdpp/3dmwW9MezAU66lOy6B6LjlRmzZnjF5hgcx3B/BcCH1YuzqSqKoT6ttKWX3
         VgvQGgkOP5o3WsfXVAQsSwXCL3mJe833FgVQ7AGsgJ/jAHTk1nKOc8O7D9J0K8yewKCJ
         lq3495Ou9IMMlRYh1sVN856hJ25QeVso1rnD/LNjtz5m5rI3eTF65MtwDZ67+c2cE6ne
         ImvmygQSinfVw0D2n4xE/V2nYcoLUNUy2pckHgI1m1oI/++OiKn0oOJVG/zNgPdHKaIR
         Kf2w==
X-Gm-Message-State: AOAM5315bi0guVejaIc9dCxN7af+dQBLP8SG2lDcFQutFoyMsBOCX3b+
        MyOjPPtO3Ws4gh9Jege88gDPWQ==
X-Google-Smtp-Source: ABdhPJw6wUc6kkUNtsJHgPuQ3GzNhExxzX4unjdeTvzUWOFQ3Mtmd+O3U8tZKxAhb4E7u7YhgihvAQ==
X-Received: by 2002:a05:6a00:23c7:b029:323:3d55:68c0 with SMTP id g7-20020a056a0023c7b02903233d5568c0mr19683849pfc.2.1625822433149;
        Fri, 09 Jul 2021 02:20:33 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:a30d:fc4:7834:ee08])
        by smtp.gmail.com with ESMTPSA id e24sm5496539pfn.127.2021.07.09.02.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 02:20:32 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 0/8] videobuf2: support new noncontiguous DMA API
Date:   Fri,  9 Jul 2021 18:20:19 +0900
Message-Id: <20210709092027.1050834-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

        The series adds support for noncontiguous DMA API and
V4L2_MEMORY_FLAG_NON_COHERENT UAPI.

V2: https://lore.kernel.org/lkml/20210427131344.139443-1-senozhatsky@chromium.org/

v3:
-- addressed review feedback

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
 .../common/videobuf2/videobuf2-dma-contig.c   | 173 ++++++++++++++----
 .../media/common/videobuf2/videobuf2-dma-sg.c |  39 ++--
 .../media/common/videobuf2/videobuf2-v4l2.c   |  59 +++---
 .../common/videobuf2/videobuf2-vmalloc.c      |  30 +--
 drivers/media/dvb-core/dvb_vb2.c              |   2 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |   9 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/videobuf2-core.h                |  59 +++---
 include/uapi/linux/videodev2.h                |  11 +-
 13 files changed, 396 insertions(+), 180 deletions(-)

-- 
2.32.0.93.g670b81a890-goog

