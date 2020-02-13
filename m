Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAD0515B9E2
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 08:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729702AbgBMHIY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 02:08:24 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39101 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbgBMHIY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 02:08:24 -0500
Received: by mail-ed1-f65.google.com with SMTP id m13so5541767edb.6
        for <linux-media@vger.kernel.org>; Wed, 12 Feb 2020 23:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZXCrPbdofUne5OpnOTH4+A4IsQ6aP6l5yadrAQp4F68=;
        b=SV6pNZyT/EPGectN6pXxwiJPU8ZRunYBpTu1FSRW/3ZP6mZsWrm0ksgrhKcZwbi/bF
         THW1P8G6C+/jdQVV+sJBkRvePjRbroiJnkZAPTQI5xHnFLkTXX/FXmYldlBToK/xr8Z1
         Rsf6dTUVJCzQ9mqtFCVYYtEM2cTlcx7YFEQGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZXCrPbdofUne5OpnOTH4+A4IsQ6aP6l5yadrAQp4F68=;
        b=t14l5huAA8Jdm9qzMCPMkoDU1gta8LGZ3h72TW0QMfX6LO15Q4eMcDLa5ZSvvXE40J
         i4WCLVT6U3QmK+57XQn/L/g9zFXo0IDNtVoaHyUm2qc7MPMhuhB/6fV53nYMfjMUQPoy
         v6D3RhouGcyc56EneGC+lKyd+SFwgVQK1UnpSjVqWDQLFLsVqvzt3bO80X4w14RhdPmJ
         JPoZ9ZY/uJvsltDJ6LkbJVqipSa1ZRM6hwFcPEVcVKkkb8b0Oljg9ln65gFd90kvFIBF
         Q9xGptggXwnNxU2MW5ttz6ulqFnWsScQKb/wGlgHOVJumHfxXv4CFFeJEvE7EpL4HU2T
         762A==
X-Gm-Message-State: APjAAAW7Cx/7JtoBMeogchCI0xa02FJNjqqNzD721s3OV0yWhCQ8VG9n
        U6ND3LX8B0DJRo7+C4hOgmyZpZ0Rbbnxag==
X-Google-Smtp-Source: APXvYqym+OIsKo3+tfFa3ZY7m3/iplTOy/3ZcDkSyG+r32YsYiVvCu6Fz7M8/Btj4VwaSHTuFdg9oQ==
X-Received: by 2002:aa7:d94d:: with SMTP id l13mr13307701eds.328.1581577702494;
        Wed, 12 Feb 2020 23:08:22 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id x12sm124557eje.52.2020.02.12.23.08.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2020 23:08:21 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id p9so4950281wmc.2
        for <linux-media@vger.kernel.org>; Wed, 12 Feb 2020 23:08:21 -0800 (PST)
X-Received: by 2002:a05:600c:2215:: with SMTP id z21mr3985579wml.55.1581577700504;
 Wed, 12 Feb 2020 23:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20200204025641.218376-1-senozhatsky@chromium.org> <20200204025641.218376-4-senozhatsky@chromium.org>
In-Reply-To: <20200204025641.218376-4-senozhatsky@chromium.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 13 Feb 2020 16:08:09 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B3NbUO9dD9GjeCE5BCD9d74XLdqoSF5K45hWKLHwJHMA@mail.gmail.com>
Message-ID: <CAAFQd5B3NbUO9dD9GjeCE5BCD9d74XLdqoSF5K45hWKLHwJHMA@mail.gmail.com>
Subject: Re: [RFC][PATCHv2 03/12] videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT
 flag
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 4, 2020 at 11:57 AM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> By setting or clearing V4L2_FLAG_MEMORY_NON_CONSISTENT flag
> user-space should be able to set or clear queue's NON_CONSISTENT
> ->dma_attrs. Queue's ->dma_attrs are passed to the underlying
> allocator in __vb2_buf_mem_alloc(), so thus user-space is able
> to request vb2 buffer's memory to be either consistent (coherent)
> or non-consistent.
>
> Change-Id: Ib333081c482e23c9a89386078293e19c3fd59076
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  Documentation/media/uapi/v4l/buffer.rst | 27 +++++++++++++++++++++++++
>  include/uapi/linux/videodev2.h          |  2 ++
>  2 files changed, 29 insertions(+)
>
> diff --git a/Documentation/media/uapi/v4l/buffer.rst b/Documentation/media/uapi/v4l/buffer.rst
> index 9149b57728e5..af007daf0591 100644
> --- a/Documentation/media/uapi/v4l/buffer.rst
> +++ b/Documentation/media/uapi/v4l/buffer.rst
> @@ -705,6 +705,33 @@ Buffer Flags
>
>  .. c:type:: v4l2_memory
>
> +Memory Consistency Flags
> +========================
> +
> +.. tabularcolumns:: |p{7.0cm}|p{2.2cm}|p{8.3cm}|
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       3 1 4
> +
> +    * .. _`V4L2_FLAG_MEMORY_NON_CONSISTENT`:
> +
> +      - ``V4L2_FLAG_MEMORY_NON_CONSISTENT``
> +      - 0x00000001
> +      - vb2 buffer is allocated either in consistent (it will be automatically
> +       coherent between CPU and bus) or non-consistent memory. The latter
> +       can provide performance gains, for instance CPU cache sync/flush
> +       operations can be avoided if the buffer is accesed by the corresponding
> +       device only and CPU does not read/write to/from that buffer. However,
> +       this requires extra care from the driver -- it must guarantee memory
> +       consistency by issuing cache flush/sync when consistency is needed.
> +       If this flag is set V4L2 will attempt to allocate vb2 buffer in
> +       non-consistent memory. This flag is ignored if queue does not report
> +        :ret:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS` capability.

nit: Should the patch adding the capability flag precede this one?

> +
>  enum v4l2_memory
>  ================
>
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 5f9357dcb060..72efc1c544cd 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -189,6 +189,8 @@ enum v4l2_memory {
>         V4L2_MEMORY_DMABUF           = 4,
>  };
>
> +#define V4L2_FLAG_MEMORY_NON_CONSISTENT                (1 << 0)
> +
>  /* see also http://vektor.theorem.ca/graphics/ycbcr/ */
>  enum v4l2_colorspace {
>         /*
> --
> 2.25.0.341.g760bfbb309-goog
>
