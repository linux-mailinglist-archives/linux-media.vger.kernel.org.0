Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB6A78E8DA
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 12:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730768AbfHOKOl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 06:14:41 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33855 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfHOKOl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 06:14:41 -0400
Received: by mail-ed1-f66.google.com with SMTP id s49so1719340edb.1
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 03:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AmKNhcBcz+A981onr4gAty4gwBrKdQXwD5SM/0QOmm0=;
        b=SMng4Bj9S+A+bwKn7CeyiOSh0aehioYNyAjqmGBExy2DMOPRse/0yMHnWiFwXcVS0W
         HqswZ9AP4zOmki8LswKDlfuQ5i6+WGxaspV0L3In/UjZ55zaDTe/5zG4M8GREDq+DA66
         9PMk7TyS1GWp+IqdF9ikMwK2Jnm/5NXZNYVwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AmKNhcBcz+A981onr4gAty4gwBrKdQXwD5SM/0QOmm0=;
        b=tHlB9SCQ3YaijhyWhow4G9ZcxwOcM9O4xZep7QqQ8yVFfutCr3V2t7kQ13kwNnFwWB
         8601mLk5LB18yBwhXaLu77J5SGO5JWnzZdREPLFVm30DQvgNq2ifqozlbm6uG0M8N200
         iUzDTJXlph8h4Xd3mp7VWL/s++JcROuURiaOJdmSRmorDntqZ+9vPQ/2rDxx1e4ORBfk
         NWCZ/y4LmOYzSPHOabPDLTsYPxhxuD50Q9NnLyPLUtDMbmhlp/gF+YrM0GYgyr67nJqH
         vWelAT7g9V/wWuW64CLRbgZirh411io3ScU88QxVwLhYjISDVyrmSXSZZzS6jvNDsUmq
         T6cw==
X-Gm-Message-State: APjAAAVt+l+8AsmPsFLkdmzxw1mOMA168/szwRusp3AW1zVONN3p1W5F
        Q/1FfUNL9vBgjM43po1KlAoJWLrFoxys1Q==
X-Google-Smtp-Source: APXvYqzYPSNpWNssJAoybwIEfgX2l+BLkJat97hXI+pFu9IPU4eet+7MML1mRtgv8TYmKI/d/Mr9kA==
X-Received: by 2002:a50:b825:: with SMTP id j34mr4625958ede.58.1565864078191;
        Thu, 15 Aug 2019 03:14:38 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id h9sm477600edv.75.2019.08.15.03.14.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 03:14:37 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id b16so1740363wrq.9
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 03:14:37 -0700 (PDT)
X-Received: by 2002:a05:6000:110f:: with SMTP id z15mr4382671wrw.162.1565864076682;
 Thu, 15 Aug 2019 03:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl> <20190812110513.23774-5-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190812110513.23774-5-hverkuil-cisco@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 15 Aug 2019 19:14:25 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DQ_oAmsqBWVDWrCiTNxGH5PJ0OdX5Qk_=M+RKnbr=-_g@mail.gmail.com>
Message-ID: <CAAFQd5DQ_oAmsqBWVDWrCiTNxGH5PJ0OdX5Qk_=M+RKnbr=-_g@mail.gmail.com>
Subject: Re: [PATCHv2 04/12] media: s5p_mfc_dec: set flags for OUTPUT coded formats
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Maxime Jourdan <mjourdan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Aug 12, 2019 at 8:05 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> From: Maxime Jourdan <mjourdan@baylibre.com>
>
> Tag all the coded formats where the s5p_mfc decoder supports dynamic
> resolution switching or has a bytestream parser.
>

I believe it depends on the MFC hardware version. v5 might have some
additional restrictions.

Let me add some more folks to figure out.

> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> [hverkuil-cisco@xs4all.nl: added CONTINUOUS_BYTESTREAM]
> ---
>  .../media/platform/s5p-mfc/s5p_mfc_common.h    |  1 +
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c   | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
> index 96d1ecd1521b..31b133af91eb 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
> @@ -723,6 +723,7 @@ struct s5p_mfc_fmt {
>         enum s5p_mfc_fmt_type type;
>         u32 num_planes;
>         u32 versions;
> +       u32 flags;
>  };
>
>  /**
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> index 61e144a35201..1423c33c70cb 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> @@ -62,6 +62,8 @@ static struct s5p_mfc_fmt formats[] = {
>                 .type           = MFC_FMT_DEC,
>                 .num_planes     = 1,
>                 .versions       = MFC_V5PLUS_BITS,
> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION |
> +                                 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>         },
>         {
>                 .fourcc         = V4L2_PIX_FMT_H264_MVC,
> @@ -69,6 +71,8 @@ static struct s5p_mfc_fmt formats[] = {
>                 .type           = MFC_FMT_DEC,
>                 .num_planes     = 1,
>                 .versions       = MFC_V6PLUS_BITS,
> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION |
> +                                 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>         },
>         {
>                 .fourcc         = V4L2_PIX_FMT_H263,
> @@ -76,6 +80,7 @@ static struct s5p_mfc_fmt formats[] = {
>                 .type           = MFC_FMT_DEC,
>                 .num_planes     = 1,
>                 .versions       = MFC_V5PLUS_BITS,
> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION,
>         },
>         {
>                 .fourcc         = V4L2_PIX_FMT_MPEG1,
> @@ -83,6 +88,8 @@ static struct s5p_mfc_fmt formats[] = {
>                 .type           = MFC_FMT_DEC,
>                 .num_planes     = 1,
>                 .versions       = MFC_V5PLUS_BITS,
> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION |
> +                                 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>         },
>         {
>                 .fourcc         = V4L2_PIX_FMT_MPEG2,
> @@ -90,6 +97,8 @@ static struct s5p_mfc_fmt formats[] = {
>                 .type           = MFC_FMT_DEC,
>                 .num_planes     = 1,
>                 .versions       = MFC_V5PLUS_BITS,
> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION |
> +                                 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>         },
>         {
>                 .fourcc         = V4L2_PIX_FMT_MPEG4,
> @@ -97,6 +106,8 @@ static struct s5p_mfc_fmt formats[] = {
>                 .type           = MFC_FMT_DEC,
>                 .num_planes     = 1,
>                 .versions       = MFC_V5PLUS_BITS,
> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION |
> +                                 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>         },
>         {
>                 .fourcc         = V4L2_PIX_FMT_XVID,
> @@ -104,6 +115,7 @@ static struct s5p_mfc_fmt formats[] = {
>                 .type           = MFC_FMT_DEC,
>                 .num_planes     = 1,
>                 .versions       = MFC_V5PLUS_BITS,
> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION,
>         },
>         {
>                 .fourcc         = V4L2_PIX_FMT_VC1_ANNEX_G,
> @@ -111,6 +123,7 @@ static struct s5p_mfc_fmt formats[] = {
>                 .type           = MFC_FMT_DEC,
>                 .num_planes     = 1,
>                 .versions       = MFC_V5PLUS_BITS,
> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION,
>         },
>         {
>                 .fourcc         = V4L2_PIX_FMT_VC1_ANNEX_L,
> @@ -118,6 +131,7 @@ static struct s5p_mfc_fmt formats[] = {
>                 .type           = MFC_FMT_DEC,
>                 .num_planes     = 1,
>                 .versions       = MFC_V5PLUS_BITS,
> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION,
>         },
>         {
>                 .fourcc         = V4L2_PIX_FMT_VP8,
> @@ -125,6 +139,7 @@ static struct s5p_mfc_fmt formats[] = {
>                 .type           = MFC_FMT_DEC,
>                 .num_planes     = 1,
>                 .versions       = MFC_V6PLUS_BITS,
> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION,
>         },
>         {
>                 .fourcc         = V4L2_PIX_FMT_HEVC,
> @@ -132,6 +147,8 @@ static struct s5p_mfc_fmt formats[] = {
>                 .type           = MFC_FMT_DEC,
>                 .num_planes     = 1,
>                 .versions       = MFC_V10_BIT,
> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION |
> +                                 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
>         },
>         {
>                 .fourcc         = V4L2_PIX_FMT_VP9,
> @@ -139,6 +156,7 @@ static struct s5p_mfc_fmt formats[] = {
>                 .type           = MFC_FMT_DEC,
>                 .num_planes     = 1,
>                 .versions       = MFC_V10_BIT,
> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION,
>         },
>  };
>
> --
> 2.20.1
>
