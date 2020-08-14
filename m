Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 355D82445F7
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 09:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgHNHuB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 03:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbgHNHuB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 03:50:01 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B46BC061383
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 00:50:01 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id v6so6887239ota.13
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 00:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Fs3fI55T620G7RUHx4Z8MRHOXcmdrTyik5fDdnH7MY=;
        b=S8NhgYa/Q2mxawDJWveoTzRMUDtNptaMz+MKJVLmLoZbC2xtxQHZ4iCvlXFacHZdIn
         9B4qUGNKKNzICGjO9G6TJRx6Rgg2WyfWdcbFiTXrZT/dqOFOTPUMoFu2w9Wuxv7T3ics
         1AmC69wTcW7oGDAUoxYA7SHL3o39UgHOLEiWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Fs3fI55T620G7RUHx4Z8MRHOXcmdrTyik5fDdnH7MY=;
        b=BydO5qMBwGBydUW2nPVpjcf+yIAn9B2Iy52YuZ8il6uxHs0Mwfqon/01uEIRPnoIrA
         vLIDTzAiohILvVic3v3C4VLiymxSmKhKmmtbSNKeymS0OJdgOY0DMQ6wXOiHI+P/sFnI
         r7CY1/FdivtGOyC8pJDgt8cAdGhhvX1ep9/VKoAsgtPO+6aJsd7QX23hMSNryLGSU+bR
         4mvnEcgiECSUKPRk5Q3WISTyRI7fHLRZ7Xq8DhgRgYWt8BcfNseBHGgUZJS2boUgTnhj
         Q8ytptTF/SYL3wISnqoH3sYqJKckx52cvHMM0x9K7woIp75D18OfcfGD2stErGh04CbP
         YpwQ==
X-Gm-Message-State: AOAM530Q/g6HM95eBUsNoMfErSmCS0rCAEu0TTVF9G8X+K22Hsy7amY5
        l/xeL2Jxk5s7Tb6/9f6QxUH5Fyw6E/oOaw==
X-Google-Smtp-Source: ABdhPJwqiCmA5ys88vPYow15t9Rm14yzgJnuTqu23leNoC0P7E9QacLIDXC7C2K0x50PpJtnB0HwuA==
X-Received: by 2002:a05:6830:310d:: with SMTP id b13mr1104919ots.328.1597391399637;
        Fri, 14 Aug 2020 00:49:59 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id w11sm1571048oog.33.2020.08.14.00.49.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2020 00:49:58 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id h22so6899365otq.11
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 00:49:58 -0700 (PDT)
X-Received: by 2002:a9d:170c:: with SMTP id i12mr1059302ota.36.1597391397791;
 Fri, 14 Aug 2020 00:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200804192939.2251988-1-helen.koike@collabora.com> <20200804192939.2251988-5-helen.koike@collabora.com>
In-Reply-To: <20200804192939.2251988-5-helen.koike@collabora.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 14 Aug 2020 16:49:46 +0900
X-Gmail-Original-Message-ID: <CAPBb6MW4zbhfkrG0P8VA-xgMMt0Wt7+mo6SZRDekRKiS0Q1xhA@mail.gmail.com>
Message-ID: <CAPBb6MW4zbhfkrG0P8VA-xgMMt0Wt7+mo6SZRDekRKiS0Q1xhA@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] media: mediabus: Add helpers to convert a ext_pix
 format to/from a mbus_fmt
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Brian Starkey <Brian.Starkey@arm.com>, kernel@collabora.com,
        narmstrong@baylibre.com, LKML <linux-kernel@vger.kernel.org>,
        frkoenig@chromium.org, Maxime Jourdan <mjourdan@baylibre.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 5, 2020 at 4:32 AM Helen Koike <helen.koike@collabora.com> wrote:
>
> Just a new version of v4l2_fill_mbus_format() and v4l2_fill_ext_pix_format()
> to deal with the new v4l2_ext_pix_format struct.
> This is needed to convert the VIMC driver to the EXT_FMT/EXT_BUF iocts.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> Changes in v4:
> - Add helper v4l2_fill_ext_pix_format()
> - Rebased on top of media/master (post 5.8-rc1)
>
> Changes in v3:
> - Rebased on top of media/master (post 5.4-rc1)
>
> Changes in v2:
> - New patch
> ---
>  include/media/v4l2-mediabus.h | 42 +++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> index 45f88f0248c4e..8133407377f7d 100644
> --- a/include/media/v4l2-mediabus.h
> +++ b/include/media/v4l2-mediabus.h
> @@ -119,6 +119,26 @@ v4l2_fill_pix_format(struct v4l2_pix_format *pix_fmt,
>         pix_fmt->xfer_func = mbus_fmt->xfer_func;
>  }
>
> +/**
> + * v4l2_fill_ext_pix_format - Ancillary routine that fills a &struct

I feel the names of these functions are maybe too generic - maybe they
should carry the fact that the source is a mbus or ext_pix format?


> + *     v4l2_ext_pix_format fields from a &struct v4l2_mbus_framefmt.
> + *
> + * @pix_fmt:   pointer to &struct v4l2_ext_pix_format to be filled
> + * @mbus_fmt:  pointer to &struct v4l2_mbus_framefmt to be used as model
> + */
> +static inline void
> +v4l2_fill_ext_pix_format(struct v4l2_ext_pix_format *pix_fmt,
> +                    const struct v4l2_mbus_framefmt *mbus_fmt)
> +{
> +       pix_fmt->width = mbus_fmt->width;
> +       pix_fmt->height = mbus_fmt->height;
> +       pix_fmt->field = mbus_fmt->field;
> +       pix_fmt->colorspace = mbus_fmt->colorspace;
> +       pix_fmt->ycbcr_enc = mbus_fmt->ycbcr_enc;
> +       pix_fmt->quantization = mbus_fmt->quantization;
> +       pix_fmt->xfer_func = mbus_fmt->xfer_func;
> +}
> +
>  /**
>   * v4l2_fill_pix_format - Ancillary routine that fills a &struct
>   *     v4l2_mbus_framefmt from a &struct v4l2_pix_format and a
> @@ -182,4 +202,26 @@ v4l2_fill_mbus_format_mplane(struct v4l2_mbus_framefmt *mbus_fmt,
>         mbus_fmt->xfer_func = pix_mp_fmt->xfer_func;
>  }
>
> +/**
> + * v4l2_fill_mbus_format_ext - Ancillary routine that fills a &struct
> + *     v4l2_mbus_framefmt from a &struct v4l2_ext_pix_format.
> + *
> + * @mbus_fmt:  pointer to &struct v4l2_mbus_framefmt to be filled
> + * @pix_fmt:   pointer to &struct v4l2_ext_pix_format to be used as model
> + * @code:      data format code (from &enum v4l2_mbus_pixelcode)
> + */
> +static inline void
> +v4l2_fill_mbus_format_ext(struct v4l2_mbus_framefmt *mbus_fmt,
> +                         const struct v4l2_ext_pix_format *pix_fmt, u32 code)
> +{
> +       mbus_fmt->width = pix_fmt->width;
> +       mbus_fmt->height = pix_fmt->height;
> +       mbus_fmt->field = pix_fmt->field;
> +       mbus_fmt->colorspace = pix_fmt->colorspace;
> +       mbus_fmt->ycbcr_enc = pix_fmt->ycbcr_enc;
> +       mbus_fmt->quantization = pix_fmt->quantization;
> +       mbus_fmt->xfer_func = pix_fmt->xfer_func;
> +       mbus_fmt->code = code;
> +}
> +
>  #endif
> --
> 2.28.0.rc2
>
