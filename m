Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D73B38E5F4
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 10:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730682AbfHOILz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 04:11:55 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43610 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfHOILz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 04:11:55 -0400
Received: by mail-ot1-f67.google.com with SMTP id e12so4132153otp.10
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 01:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=asyeXwJ/A/WemRFgcJm/e+KHWu+6mTpZygYAfvXnX7o=;
        b=jF3sC2Se+h3zCZqWPDqseKipLj+ql0z+ckUquPxiHFWtiwrUxN5bBnKBQVSNVzWwPZ
         8NRCOoLxQd8ZsYSe2rzXlFNcI/6JdwtYYriX1MuUaYVfPjbe/4/K32vscO43skC3oN0I
         wSk63LZLnTWdDD/kOYx1hcurDApbSibqooCEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=asyeXwJ/A/WemRFgcJm/e+KHWu+6mTpZygYAfvXnX7o=;
        b=p0ruzoYpBoO7Ad8fVKyhG9v0iFkhON362nBxgNCU6eYIJ8cP2o83FucGTbqKAHAif4
         xwxOTfdJoUm6O9aH2ZYbA4jBc5ChxZzrAo8rP9xZW+3RSnHFbERX/rRlEFQYJygw/DxR
         vQiykCRX56z7Z7iGsnfoyVSsEwbZiy1t4+/OQW/K1Usec2FTcqUe7bDHDkRRaZH4fEwp
         /mVCBHQqY2DRlVEfObQo9DGnQL/SjLg2aUS/pkSF8FTJiCK31TvIXOweE2egxxdMMdVx
         def2J9VuWKQFfbI4hJ12xVS12cSZQaqSmu9pOIAN1jjDmKkmVvhp5YTYA59Oh17JQCSD
         LPDg==
X-Gm-Message-State: APjAAAUpD5B5SQWTXq2yKB8lQtKbEB8XRAiWmOF3Hh5XIcsSf0+WOHH0
        6Js1Cyd2t1gAQNMJgvaZR0McHFywPLw=
X-Google-Smtp-Source: APXvYqy+HnkUMAZ7R4m00puu3L8F7PHMJzVLNV3iceecvQdWjM12fwCQ3vzfSbnhH9SfOfTq6HqtZQ==
X-Received: by 2002:a9d:6c18:: with SMTP id f24mr2319125otq.344.1565856714120;
        Thu, 15 Aug 2019 01:11:54 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id j26sm238740oii.33.2019.08.15.01.11.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2019 01:11:53 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id m24so4109261otp.12
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 01:11:53 -0700 (PDT)
X-Received: by 2002:a05:6830:2094:: with SMTP id y20mr2443411otq.36.1565856712610;
 Thu, 15 Aug 2019 01:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl> <20190812110513.23774-2-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190812110513.23774-2-hverkuil-cisco@xs4all.nl>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 15 Aug 2019 17:11:40 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWtJyCTJwJii-e6O05idwFd2s8yEstCzfnM7b750h56uQ@mail.gmail.com>
Message-ID: <CAPBb6MWtJyCTJwJii-e6O05idwFd2s8yEstCzfnM7b750h56uQ@mail.gmail.com>
Subject: Re: [PATCHv2 01/12] videodev2.h: add V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 12, 2019 at 8:05 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Add an enum_fmt format flag to specifically tag coded formats where
> full bytestream parsing is supported by the device.
>
> Some stateful decoders are capable of fully parsing a bytestream,
> but others require that userspace pre-parses the bytestream into
> frames or fields (see the corresponding pixelformat descriptions
> for details).

Reviewed-by: Alexandre Courbot <acourbot@chromium.org>

This patch does not update the pixelformat descriptions though, are we
planning on doing this?


>
> If this flag is set, then this pre-parsing step is not required
> (but still possible, of course).
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  Documentation/media/uapi/v4l/vidioc-enum-fmt.rst | 8 ++++++++
>  Documentation/media/videodev2.h.rst.exceptions   | 1 +
>  include/uapi/linux/videodev2.h                   | 5 +++--
>  3 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> index 822d6730e7d2..ebc05ce74bdf 100644
> --- a/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-enum-fmt.rst
> @@ -127,6 +127,14 @@ one until ``EINVAL`` is returned.
>        - This format is not native to the device but emulated through
>         software (usually libv4l2), where possible try to use a native
>         format instead for better performance.
> +    * - ``V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM``
> +      - 0x0004
> +      - The hardware decoder for this compressed bytestream format (aka coded
> +       format) is capable of parsing a continuous bytestream. Applications do
> +       not need to parse the bytestream themselves to find the boundaries
> +       between frames/fields. This flag can only be used in combination with
> +       the ``V4L2_FMT_FLAG_COMPRESSED`` flag, since this applies to compressed
> +       formats only. This flag is valid for stateful decoders only.
>
>
>  Return Value
> diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
> index 8e7d3492d248..a0640b6d0f68 100644
> --- a/Documentation/media/videodev2.h.rst.exceptions
> +++ b/Documentation/media/videodev2.h.rst.exceptions
> @@ -180,6 +180,7 @@ replace define V4L2_PIX_FMT_FLAG_PREMUL_ALPHA reserved-formats
>  # V4L2 format flags
>  replace define V4L2_FMT_FLAG_COMPRESSED fmtdesc-flags
>  replace define V4L2_FMT_FLAG_EMULATED fmtdesc-flags
> +replace define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM fmtdesc-flags
>
>  # V4L2 timecode types
>  replace define V4L2_TC_TYPE_24FPS timecode-type
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 2427bc4d8eba..67077d52c59d 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -774,8 +774,9 @@ struct v4l2_fmtdesc {
>         __u32               reserved[4];
>  };
>
> -#define V4L2_FMT_FLAG_COMPRESSED 0x0001
> -#define V4L2_FMT_FLAG_EMULATED   0x0002
> +#define V4L2_FMT_FLAG_COMPRESSED               0x0001
> +#define V4L2_FMT_FLAG_EMULATED                 0x0002
> +#define V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM    0x0004
>
>         /* Frame Size and frame rate enumeration */
>  /*
> --
> 2.20.1
>
