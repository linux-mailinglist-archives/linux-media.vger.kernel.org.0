Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5FF40696A
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 12:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbhIJKCY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 06:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbhIJKCX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 06:02:23 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E5A0C061756
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 03:01:12 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id dc3so3088632ejb.10
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 03:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QAz0PRehc9psyfyZMa6l+L0qrVAxjGHmAKvCjO5mIfI=;
        b=VtpLDTlPj53qzEVmIiHQDF5veditbzC39li94eqwuxd0HpaSIqPsAS/tQmL7JyNaAy
         kCLvp84CinhsbF+SEaIENJ7jJwTkg4gw/ViHABydmoRPncxnY1Hlj4njBDO8lUHzRPKy
         KbVZKOe7xo2FuWt4jwBV6zHZj6vCC7ltokGyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QAz0PRehc9psyfyZMa6l+L0qrVAxjGHmAKvCjO5mIfI=;
        b=PS7YRarmoy4OepFJxX6JrmPU2cUXa0+UyusAp2n/JdUEfZlnE5t1SYVyTYYonAPZcM
         7fkUTtiXzbxtNDshjNmiqMa1AkVYInJ7C9dnQHKIC2fBQHrEq03iyz16PI+mZdJ0EWoT
         0R111cc6ZezbuV5jxzr+vpsEXavy/sqkVBQ/x3nGvvFnDh5POX7TFWerCEt8bsn/Ax3P
         0lIdQUaBdSrrG/bt3OIowbem6q3zBkmlVWFq2Peluu9JQxKc6BDjWbYsXfLl/edGwz8k
         02xvgpiQTdfCmPL7o0tdR2N9ZyEQVwz+tQZvDqwL6RQ6iO89UKXowQFJLtDDWvYAKO+o
         7Oyw==
X-Gm-Message-State: AOAM533CC9UPl6KGdEfFOgs8ylGh1A3cd59sx36tWajSk9jBjRP/40qX
        AP0sVbg8kOtIJgFPmWW1DgHuwafAXk8ZIQ==
X-Google-Smtp-Source: ABdhPJytQft+guS5x92uBFsA2xG/cs5nhLMWm0+xJ6X5Hwg3Xv23suuHvES4m/dGILyfYtRL/10f3A==
X-Received: by 2002:a17:906:32c9:: with SMTP id k9mr8664175ejk.218.1631268070279;
        Fri, 10 Sep 2021 03:01:10 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id s26sm2466988edt.41.2021.09.10.03.01.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 03:01:09 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id d6so1788086wrc.11
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 03:01:09 -0700 (PDT)
X-Received: by 2002:adf:ea90:: with SMTP id s16mr8772371wrm.235.1631268068593;
 Fri, 10 Sep 2021 03:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210909112430.61243-1-senozhatsky@chromium.org>
In-Reply-To: <20210909112430.61243-1-senozhatsky@chromium.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 10 Sep 2021 19:00:57 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D9fgq7WGydXR344fscHSgKMCgwpotSMRszR_v2kX8q0A@mail.gmail.com>
Message-ID: <CAAFQd5D9fgq7WGydXR344fscHSgKMCgwpotSMRszR_v2kX8q0A@mail.gmail.com>
Subject: Re: [PATCHv6 0/8] videobuf2: support new noncontiguous DMA API
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey,

On Thu, Sep 9, 2021 at 8:24 PM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Hello,
>
>         The series adds support for noncontiguous DMA API and
> V4L2_MEMORY_FLAG_NON_COHERENT UAPI.
>
> v5:
>
> https://lore.kernel.org/lkml/20210823122235.116189-1-senozhatsky@chromium.org/
>
> -- addressed feedback (Tomasz)
> -- reworked prepare/finish functions (Tomasz)
>
> Sergey Senozhatsky (8):
>   videobuf2: rework vb2_mem_ops API
>   videobuf2: inverse buffer cache_hints flags
>   videobuf2: split buffer cache_hints initialisation
>   videobuf2: move cache_hints handling to allocators
>   videobuf2: add V4L2_MEMORY_FLAG_NON_COHERENT flag
>   videobuf2: add queue memory coherency parameter
>   videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT flag
>   videobuf2: handle non-contiguous DMA allocations
>
>  .../userspace-api/media/v4l/buffer.rst        |  40 +++-
>  .../media/v4l/vidioc-create-bufs.rst          |   7 +-
>  .../media/v4l/vidioc-reqbufs.rst              |  16 +-
>  .../media/common/videobuf2/videobuf2-core.c   | 126 +++++++----
>  .../common/videobuf2/videobuf2-dma-contig.c   | 195 ++++++++++++++----
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  39 ++--
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  59 +++---
>  .../common/videobuf2/videobuf2-vmalloc.c      |  30 +--
>  drivers/media/dvb-core/dvb_vb2.c              |   2 +-
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |   9 +-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
>  include/media/videobuf2-core.h                |  59 +++---
>  include/uapi/linux/videodev2.h                |  11 +-
>  13 files changed, 411 insertions(+), 186 deletions(-)

Thanks a lot for working on this. This version looks good to me.

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
