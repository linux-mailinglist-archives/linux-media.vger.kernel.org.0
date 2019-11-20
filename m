Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 846DC103A48
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 13:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbfKTMoZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 07:44:25 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44737 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728313AbfKTMoZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 07:44:25 -0500
Received: by mail-ed1-f68.google.com with SMTP id a67so20101114edf.11
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 04:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HviZfN2k+Zd+emwLWrTA9g1CfuiJpYrc79Znlkyezqg=;
        b=arwFzBSZNJjQt0kefLROlBKMg+mng7y5GKdI5zvN0OlBIofxb3lFWA8mRhlROMiwq0
         bq+o2vP9tLQgVaGN4HqFRUG3Io0JKJm8afxoYL/BLyddunjpqiL1wTIZKPFR+zHp7C2o
         wfYhXWhUwQHbtDAR4TSyeUkQeN7E3E9nwDpTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HviZfN2k+Zd+emwLWrTA9g1CfuiJpYrc79Znlkyezqg=;
        b=FlrtsKU+DBCRZyVXbwjxVxiBIGDxtpdbmhA7J1HSFbBG48mWHNDEqejw0e3g7yieIi
         bT7oRdiYt5jnq7u9QcwoeGiSqh73wQdr65kDNrMe+TITki59KZcQF4QwBSZlH91YwxEO
         XgjbCzv7hDaSyfiCr3SBfiytB6qTF2uSmUWdLJ3BuoQdzUwX1LoGZSSl/evFD76ieaLT
         U2HXe5W2tGoUPA57ByA/GwvmBZq7/qXakWuNFgcYiwjlsMFWyCz23VUasv2g1ecoX2Cz
         UUmbw1Y7yo05FG91ktftOf5W0FJ6Kg9wXPsk45Wa0x7vXR7heQBVP8WBb3TG4lrrJoJl
         y1uw==
X-Gm-Message-State: APjAAAWpgsGZUu+sOOVIBUot9cIu5O4DhdkzpOP+0hbYGcBjkHvdHXql
        tPgOcgQUebiGSpnQib8YJ0+X408hrXycRw==
X-Google-Smtp-Source: APXvYqykbtyVRlGwlVfwdHMu1v2hMNmwj8qJQWKlYWtFC7KEVnEfpB1EOJQIAte5KXZLw/7iT7iVLg==
X-Received: by 2002:a17:906:3019:: with SMTP id 25mr5229384ejz.280.1574253862730;
        Wed, 20 Nov 2019 04:44:22 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id ay27sm63816edb.52.2019.11.20.04.44.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2019 04:44:22 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id t26so1099037wmi.0
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 04:44:21 -0800 (PST)
X-Received: by 2002:a1c:7fd8:: with SMTP id a207mr3051203wmd.10.1574253861317;
 Wed, 20 Nov 2019 04:44:21 -0800 (PST)
MIME-Version: 1.0
References: <HE1PR06MB4011EDD5F2686A05BC35F61CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20191106223408.2176-1-jonas@kwiboo.se> <HE1PR06MB4011FF930111A869E4645C8CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB4011FF930111A869E4645C8CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 20 Nov 2019 21:44:09 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CSWea=DNjySJxZmVi+2c5U4EKVPa1mf3vHh70+YrAQCA@mail.gmail.com>
Message-ID: <CAAFQd5CSWea=DNjySJxZmVi+2c5U4EKVPa1mf3vHh70+YrAQCA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] media: hantro: Reduce H264 extra space for motion vectors
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonas,

On Thu, Nov 7, 2019 at 7:34 AM Jonas Karlman <jonas@kwiboo.se> wrote:
>
> A decoded 8-bit 4:2:0 frame need memory for up to 448 bytes per
> macroblock with additional 32 bytes on multi-core variants.
>
> Memory layout is as follow:
>
> +---------------------------+
> | Y-plane   256 bytes x MBs |
> +---------------------------+
> | UV-plane  128 bytes x MBs |
> +---------------------------+
> | MV buffer  64 bytes x MBs |
> +---------------------------+
> | MC sync          32 bytes |
> +---------------------------+
>
> Reduce the extra space allocated now that motion vector buffer offset no
> longer is based on the extra space.
>
> Only allocate extra space for 64 bytes x MBs of motion vector buffer
> and 32 bytes for multi-core sync.
>
> Fixes: a9471e25629b ("media: hantro: Add core bits to support H264 decoding")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v3:
>   - add memory layout to code comment (Boris)
> Changes in v2:
>   - updated commit message
> ---
>  drivers/staging/media/hantro/hantro_v4l2.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>

Thanks for the patch!

What platform did you test it on and how? Was it tested with IOMMU enabled?

Best regards,
Tomasz

> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> index 3dae52abb96c..c8c896a06f58 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -240,14 +240,30 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
>                 v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, pix_mp->width,
>                                     pix_mp->height);
>                 /*
> +                * A decoded 8-bit 4:2:0 NV12 frame may need memory for up to
> +                * 448 bytes per macroblock with additional 32 bytes on
> +                * multi-core variants.
> +                *
>                  * The H264 decoder needs extra space on the output buffers
>                  * to store motion vectors. This is needed for reference
>                  * frames.
> +                *
> +                * Memory layout is as follow:
> +                *
> +                * +---------------------------+
> +                * | Y-plane   256 bytes x MBs |
> +                * +---------------------------+
> +                * | UV-plane  128 bytes x MBs |
> +                * +---------------------------+
> +                * | MV buffer  64 bytes x MBs |
> +                * +---------------------------+
> +                * | MC sync          32 bytes |
> +                * +---------------------------+
>                  */
>                 if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE)
>                         pix_mp->plane_fmt[0].sizeimage +=
> -                               128 * DIV_ROUND_UP(pix_mp->width, 16) *
> -                                     DIV_ROUND_UP(pix_mp->height, 16);
> +                               64 * MB_WIDTH(pix_mp->width) *
> +                                    MB_WIDTH(pix_mp->height) + 32;
>         } else if (!pix_mp->plane_fmt[0].sizeimage) {
>                 /*
>                  * For coded formats the application can specify
> --
> 2.17.1
>
