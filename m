Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88C574C659
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 06:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbfFTEun (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 00:50:43 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34657 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfFTEun (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 00:50:43 -0400
Received: by mail-oi1-f196.google.com with SMTP id a128so1202978oib.1
        for <linux-media@vger.kernel.org>; Wed, 19 Jun 2019 21:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H7KfXwWshFgYCRp/rB3EC7KJ7aO3/YBFcG4HpA2yrRc=;
        b=invRPHWwsG//4HFgg9KwSVpDmW6VW+E3xuRUlv6jjX+XcUyFbQHVG471IpclLNl2VX
         I3AZlwTuDX0/+rRDEabV4QRS/D9gr1ubU0bH9ZKJTFadXBg0m9J5DXEib9hp+IP5zJRn
         1hMMPiE2UdXow03GY4JfUMU6W21H2egfNnhEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H7KfXwWshFgYCRp/rB3EC7KJ7aO3/YBFcG4HpA2yrRc=;
        b=ehhenwmNYYIv3u/Lx0EXOGCJ1l7BgT/OEb1JDa3tnjNp/I72FbUVaYItoQbCTB2adr
         RvLyMJy6fts9Np6PK34L8R7ykwu+WmoLJbD1/pUUKBFKUjmezgU6OCIzuPbO/wZdIPHs
         4bA+Ni9vo1Fc9t5b4dJQvntt+uGYg/7kPkw4xaNi1WboaNTJ713z7asRjGM4H+K6VHAm
         hiPaKe0kYi1SrIQS0nnVVeb2i2Z9QLi0//yFP67D0Aikkzfo8szizAdTrSRAg7bkRl7O
         UPkN+1DURjifvYidgeL2X77/5fsLSNttO6+4LTln4eEDP2L9cF6Ev1i6Wp6g+aBazor7
         Dc+Q==
X-Gm-Message-State: APjAAAXXeS3SnLJu/reHBDVxMHtB2LULVjDnDMLGckt5sy1kmg2DVUT3
        nGueJiZgzXWphf+Yfcm0YgMFjfW6aAtNvQ==
X-Google-Smtp-Source: APXvYqwCi07vtgc8GcsRm50q4xCgr4XM3siIXdeVhCp5XlLR8iGjKf18wKI/WUB+g9t9FDpsuaEr0w==
X-Received: by 2002:aca:de46:: with SMTP id v67mr4500895oig.167.1561006242678;
        Wed, 19 Jun 2019 21:50:42 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id t15sm8019884oie.34.2019.06.19.21.50.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 21:50:42 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id s20so1458162otp.4
        for <linux-media@vger.kernel.org>; Wed, 19 Jun 2019 21:50:41 -0700 (PDT)
X-Received: by 2002:a9d:711e:: with SMTP id n30mr12204552otj.97.1561006241374;
 Wed, 19 Jun 2019 21:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190612093648.47412-1-tfiga@chromium.org>
In-Reply-To: <20190612093648.47412-1-tfiga@chromium.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 20 Jun 2019 13:50:30 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWaq1W0bCUTmx0ad29vBpH1xOEoe-Q33vQj2b8AvEHoVg@mail.gmail.com>
Message-ID: <CAPBb6MWaq1W0bCUTmx0ad29vBpH1xOEoe-Q33vQj2b8AvEHoVg@mail.gmail.com>
Subject: Re: [PATCH] media: Clarify the meaning of file descriptors in VIDIOC_DQBUF
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hirokazu Honda <hiroh@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 12, 2019 at 6:36 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> When the application calls VIDIOC_DQBUF with the DMABUF memory type, the
> v4l2_buffer structure (or v4l2_plane structures) are filled with DMA-buf
> file descriptors. However, the current documentation does not explain
> whether those are new file descriptors referring to the same DMA-bufs or
> just the same integers as passed to VIDIOC_QBUF back in time. Clarify
> the documentation that it's the latter.
>
> Signed-off-by: Tomasz Figa <tfiga@chromium.org>

That's a welcome precision indeed.

Reviewed-by: Alexandre Courbot <acourbot@chromium.org>

> ---
>  Documentation/media/uapi/v4l/vidioc-qbuf.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/media/uapi/v4l/vidioc-qbuf.rst b/Documentation/media/uapi/v4l/vidioc-qbuf.rst
> index dbf7b445a27b..407302d80684 100644
> --- a/Documentation/media/uapi/v4l/vidioc-qbuf.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-qbuf.rst
> @@ -139,6 +139,14 @@ may continue as normal, but should be aware that data in the dequeued
>  buffer might be corrupted. When using the multi-planar API, the planes
>  array must be passed in as well.
>
> +If the application sets the ``memory`` field to ``V4L2_MEMORY_DMABUF`` to
> +dequeue a :ref:`DMABUF <dmabuf>` buffer, the driver fills the ``m.fd`` field
> +with a file descriptor numerically the same as the one given to ``VIDIOC_QBUF``
> +when the buffer was enqueued. No new file descriptor is created at dequeue time
> +and the value is only for the application convenience. When the multi-planar
> +API is used the ``m.fd`` fields of the passed array of struct
> +:c:type:`v4l2_plane` are filled instead.
> +
>  By default ``VIDIOC_DQBUF`` blocks when no buffer is in the outgoing
>  queue. When the ``O_NONBLOCK`` flag was given to the
>  :ref:`open() <func-open>` function, ``VIDIOC_DQBUF`` returns
> --
> 2.22.0.rc2.383.gf4fbbf30c2-goog
>
