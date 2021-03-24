Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA713477E5
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 13:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbhCXMJe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 08:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbhCXMJQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 08:09:16 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0E1C061763
        for <linux-media@vger.kernel.org>; Wed, 24 Mar 2021 05:09:15 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id bt4so11613592pjb.5
        for <linux-media@vger.kernel.org>; Wed, 24 Mar 2021 05:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZBGtzvtsuw1vjRHfCa12Orzx/yecEgKmyn3FEoadqwA=;
        b=N/35SZmFQme8ehg/eor6MBPg8HHUy/zJi8qFyxuGNTmff3W1iwuT7wZAhYkc+GGi7M
         +KSpaGz+uzquEOv3qbFfHV4ios6abghkd3EOuSQtLSWP1X4wOJhebubQn6LFxmTMLz9a
         5ICLv+8Vh2MJL+DZKWZGMUo4HWuCH59YukgVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZBGtzvtsuw1vjRHfCa12Orzx/yecEgKmyn3FEoadqwA=;
        b=YdlcPjpgSZk5V9PDW12FSFgLzZdtOgr55/npRKvhtYjRPaxCfl0Gjw1p2ejCbKtXQ8
         caWvu4e0uHB4nLBcTNidrB3K1/gc+b7AcjYvumsibr6gIW4hYZnuucJcQss0BaK2fuH+
         Z28rldJT4jIetJiLhgcIRJhoQQwvGaGzPtDS9gBY0apoDt4yHrJOdHEZ5rvvbvBFAqDZ
         Fe0t7AhwoeauBmq+GJwif9E09yVQkCoZhL+bjmm+3YMkR1JFVqWZpH5UClzp6wfgWQwg
         xQD0pRnrLRLnLQpXybwwE6ejmkLj6y87mfx9IIYHsNfN5OIQslFKCwqwQOaeGRJFo7k1
         E2kQ==
X-Gm-Message-State: AOAM531BdnEVjE3VFZm6O1m6AI/nTq2fDuWgNfqIhSL4aj13yTguqnPc
        dDFWY7S68RoYP6UpGz2WDjAHKQ==
X-Google-Smtp-Source: ABdhPJw1XkU9QQN4Lla9pj9RkZaeaw4sjn+e7ykXkSoGm+vp2EzW3+SRmhY0QkALDii3GytCWFaehg==
X-Received: by 2002:a17:90a:ea91:: with SMTP id h17mr3167264pjz.66.1616587755276;
        Wed, 24 Mar 2021 05:09:15 -0700 (PDT)
Received: from chromium.org ([2401:fa00:8f:2:9cb3:4047:113:3430])
        by smtp.gmail.com with ESMTPSA id i20sm2202105pgg.65.2021.03.24.05.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:09:15 -0700 (PDT)
Date:   Wed, 24 Mar 2021 21:09:12 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] videobuf2: support new noncontiguous DMA API
Message-ID: <YFsr6EKFqIS9AjRI@chromium.org>
References: <20210302004624.31294-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302004624.31294-1-senozhatsky@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey,

On Tue, Mar 02, 2021 at 09:46:16AM +0900, Sergey Senozhatsky wrote:
> Hello,
> 
> 	RFC
> 
> 	The series adds support for new noncontiguous DMA API [0] and
> adds V4L2_FLAG_MEMORY_NON_COHERENT UAPI. This is similar to previous
> V4L2_FLAG_MEMORY_NON_CONSISTENT (which was renamed), but the patch set
> goes a bit further this time and also does some videobuf2 API
> refactroings along the way.
> 
> A corresponding v4l2-compliance patch will be posted shortly.
> 
> [0] https://lore.kernel.org/lkml/20210301085236.947011-2-hch@lst.de/
> 
> Sergey Senozhatsky (8):
>   videobuf2: rework vb2_mem_ops API
>   videobuf2: inverse buffer cache_hints flags
>   videobuf2: split buffer cache_hints initialisation
>   videobuf2: move cache_hints handling to allocators
>   videobuf2: add V4L2_FLAG_MEMORY_NON_COHERENT flag
>   videobuf2: add queue memory coherency parameter
>   videobuf2: handle V4L2_FLAG_MEMORY_NON_COHERENT flag
>   videobuf2: handle non-contiguous DMA allocations
> 
>  .../userspace-api/media/v4l/buffer.rst        |  40 +++-
>  .../media/v4l/vidioc-create-bufs.rst          |   7 +-
>  .../media/v4l/vidioc-reqbufs.rst              |  16 +-
>  .../media/common/videobuf2/videobuf2-core.c   | 135 +++++++++-----
>  .../common/videobuf2/videobuf2-dma-contig.c   | 175 ++++++++++++++----
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  39 ++--
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  47 ++---
>  .../common/videobuf2/videobuf2-vmalloc.c      |  30 +--
>  drivers/media/dvb-core/dvb_vb2.c              |   2 +-
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |   9 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   5 +-
>  include/media/videobuf2-core.h                |  57 +++---
>  include/uapi/linux/videodev2.h                |  13 +-
>  13 files changed, 396 insertions(+), 179 deletions(-)
> 
> -- 
> 2.30.1.766.gb4fecdf3b7-goog
> 

Just some minor nits for patch 8. Otherwise, with Hans's comments
addressed:

Acked-by: Tomasz Figa <tfiga@chromium.org>

Thanks for the great job.

Best regards,
Tomasz

