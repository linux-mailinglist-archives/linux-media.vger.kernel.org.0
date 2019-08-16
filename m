Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D13AC900F0
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 13:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfHPLra (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 07:47:30 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:37380 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbfHPLra (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 07:47:30 -0400
Received: by mail-ed1-f68.google.com with SMTP id f22so4889778edt.4
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2019 04:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dNLP0WJIe0UQ9ne1SBcKG025vz+6cLBZjd7vzxwrobE=;
        b=At6YFUbXiaTu8PXgKrroKxrvvb9iNP6zifNyf4TmGt+dAXsO7wlsdg7OaDL7Elzzh4
         SF4HVniF569X+o3IubSYmVbYZ6wkqKY9NuzGHauTg/WZ6+HrY7hpBDWdYtGiKSeHsEH4
         0dovHymceX/VleF+BWgBi1viacttVBtYKv0Hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dNLP0WJIe0UQ9ne1SBcKG025vz+6cLBZjd7vzxwrobE=;
        b=b3fJ8NNs62Cl4slW7vUU6eVp0tfZ6iRoEpFO6XJnRp4oFGLhEEunFUmNqyMXljzRbP
         QNkruWq4F67upX4Z1EOhOqnTmkHs0daPBdi4rpYFq4TyRnLinXItrEkHByTTnIuqTIWG
         Hux+75tKBGY6Dzq5yApktUrASRfdhb8wOpGJ8cLwqUGPMn4eH+8vzW62njntJFPDRxfl
         kOaOpbIAngponZ5FUWpTjxRvirrBPKuaRkaH7rOShxoAuVhf69Hpwc5M4VK6yqeY4hHy
         qdHjjXMZIRNNAGa2yo1OX/LajDZomghu0lsOPQl6vfeFQFOlQdZXI4d7aS3hCaUorted
         kPRQ==
X-Gm-Message-State: APjAAAVf3TPQz2/DCI60yTRbnsTgYUajYr9OgrOqPQzdUb9frBg4+TCe
        y3wzG/G9hohBO9cDNmKw+EZd+XJ19f5VuQ==
X-Google-Smtp-Source: APXvYqweZuN8rBnu5DzY4TPxrsP0p4Wpd/dzV9bqkN8p/zJMGkYLHQm5dNUGvyLX0g7EqPkXTDBYtQ==
X-Received: by 2002:a17:906:bcf5:: with SMTP id op21mr8828176ejb.190.1565956047790;
        Fri, 16 Aug 2019 04:47:27 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id g8sm789117ejk.85.2019.08.16.04.47.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2019 04:47:27 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id v15so3809931wml.0
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2019 04:47:26 -0700 (PDT)
X-Received: by 2002:a05:600c:2111:: with SMTP id u17mr7366280wml.64.1565956046317;
 Fri, 16 Aug 2019 04:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
 <20190812110513.23774-5-hverkuil-cisco@xs4all.nl> <CGME20190815101443epcas2p15d0bf21de17dabe882fb5d526829fa26@epcas2p1.samsung.com>
 <CAAFQd5DQ_oAmsqBWVDWrCiTNxGH5PJ0OdX5Qk_=M+RKnbr=-_g@mail.gmail.com> <563e44c1-afed-4b08-b7f9-ebe30c17d522@samsung.com>
In-Reply-To: <563e44c1-afed-4b08-b7f9-ebe30c17d522@samsung.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 16 Aug 2019 20:47:13 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DOPqBm9WL_BX52sPXfsSrjRYVBM7A6RE598i9Sm7JigQ@mail.gmail.com>
Message-ID: <CAAFQd5DOPqBm9WL_BX52sPXfsSrjRYVBM7A6RE598i9Sm7JigQ@mail.gmail.com>
Subject: Re: [PATCHv2 04/12] media: s5p_mfc_dec: set flags for OUTPUT coded formats
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Maxime Jourdan <mjourdan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

On Fri, Aug 16, 2019 at 8:37 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Tomasz,
>
> On 2019-08-15 12:14, Tomasz Figa wrote:
> > Hi Hans,
> >
> > On Mon, Aug 12, 2019 at 8:05 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >> From: Maxime Jourdan <mjourdan@baylibre.com>
> >>
> >> Tag all the coded formats where the s5p_mfc decoder supports dynamic
> >> resolution switching or has a bytestream parser.
> >>
> > I believe it depends on the MFC hardware version. v5 might have some
> > additional restrictions.
> >
> > Let me add some more folks to figure out.
>
> IIRC MFC v5 also supported resolution change.
>

Right, I'm not worried about that part, but rather the
CONTINUOUS_BYTESTREAM flag. I know that the MFC on daisy and peach
indeed handled H.264 in that manner, but not sure about the earlier
revisions.

Best regards,
Tomasz

> >> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> [hverkuil-cisco@xs4all.nl: added CONTINUOUS_BYTESTREAM]
> >> ---
> >>   .../media/platform/s5p-mfc/s5p_mfc_common.h    |  1 +
> >>   drivers/media/platform/s5p-mfc/s5p_mfc_dec.c   | 18 ++++++++++++++++++
> >>   2 files changed, 19 insertions(+)
> >>
> >> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
> >> index 96d1ecd1521b..31b133af91eb 100644
> >> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
> >> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
> >> @@ -723,6 +723,7 @@ struct s5p_mfc_fmt {
> >>          enum s5p_mfc_fmt_type type;
> >>          u32 num_planes;
> >>          u32 versions;
> >> +       u32 flags;
> >>   };
> >>
> >>   /**
> >> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> >> index 61e144a35201..1423c33c70cb 100644
> >> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> >> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> >> @@ -62,6 +62,8 @@ static struct s5p_mfc_fmt formats[] = {
> >>                  .type           = MFC_FMT_DEC,
> >>                  .num_planes     = 1,
> >>                  .versions       = MFC_V5PLUS_BITS,
> >> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION |
> >> +                                 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
> >>          },
> >>          {
> >>                  .fourcc         = V4L2_PIX_FMT_H264_MVC,
> >> @@ -69,6 +71,8 @@ static struct s5p_mfc_fmt formats[] = {
> >>                  .type           = MFC_FMT_DEC,
> >>                  .num_planes     = 1,
> >>                  .versions       = MFC_V6PLUS_BITS,
> >> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION |
> >> +                                 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
> >>          },
> >>          {
> >>                  .fourcc         = V4L2_PIX_FMT_H263,
> >> @@ -76,6 +80,7 @@ static struct s5p_mfc_fmt formats[] = {
> >>                  .type           = MFC_FMT_DEC,
> >>                  .num_planes     = 1,
> >>                  .versions       = MFC_V5PLUS_BITS,
> >> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION,
> >>          },
> >>          {
> >>                  .fourcc         = V4L2_PIX_FMT_MPEG1,
> >> @@ -83,6 +88,8 @@ static struct s5p_mfc_fmt formats[] = {
> >>                  .type           = MFC_FMT_DEC,
> >>                  .num_planes     = 1,
> >>                  .versions       = MFC_V5PLUS_BITS,
> >> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION |
> >> +                                 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
> >>          },
> >>          {
> >>                  .fourcc         = V4L2_PIX_FMT_MPEG2,
> >> @@ -90,6 +97,8 @@ static struct s5p_mfc_fmt formats[] = {
> >>                  .type           = MFC_FMT_DEC,
> >>                  .num_planes     = 1,
> >>                  .versions       = MFC_V5PLUS_BITS,
> >> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION |
> >> +                                 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
> >>          },
> >>          {
> >>                  .fourcc         = V4L2_PIX_FMT_MPEG4,
> >> @@ -97,6 +106,8 @@ static struct s5p_mfc_fmt formats[] = {
> >>                  .type           = MFC_FMT_DEC,
> >>                  .num_planes     = 1,
> >>                  .versions       = MFC_V5PLUS_BITS,
> >> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION |
> >> +                                 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
> >>          },
> >>          {
> >>                  .fourcc         = V4L2_PIX_FMT_XVID,
> >> @@ -104,6 +115,7 @@ static struct s5p_mfc_fmt formats[] = {
> >>                  .type           = MFC_FMT_DEC,
> >>                  .num_planes     = 1,
> >>                  .versions       = MFC_V5PLUS_BITS,
> >> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION,
> >>          },
> >>          {
> >>                  .fourcc         = V4L2_PIX_FMT_VC1_ANNEX_G,
> >> @@ -111,6 +123,7 @@ static struct s5p_mfc_fmt formats[] = {
> >>                  .type           = MFC_FMT_DEC,
> >>                  .num_planes     = 1,
> >>                  .versions       = MFC_V5PLUS_BITS,
> >> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION,
> >>          },
> >>          {
> >>                  .fourcc         = V4L2_PIX_FMT_VC1_ANNEX_L,
> >> @@ -118,6 +131,7 @@ static struct s5p_mfc_fmt formats[] = {
> >>                  .type           = MFC_FMT_DEC,
> >>                  .num_planes     = 1,
> >>                  .versions       = MFC_V5PLUS_BITS,
> >> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION,
> >>          },
> >>          {
> >>                  .fourcc         = V4L2_PIX_FMT_VP8,
> >> @@ -125,6 +139,7 @@ static struct s5p_mfc_fmt formats[] = {
> >>                  .type           = MFC_FMT_DEC,
> >>                  .num_planes     = 1,
> >>                  .versions       = MFC_V6PLUS_BITS,
> >> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION,
> >>          },
> >>          {
> >>                  .fourcc         = V4L2_PIX_FMT_HEVC,
> >> @@ -132,6 +147,8 @@ static struct s5p_mfc_fmt formats[] = {
> >>                  .type           = MFC_FMT_DEC,
> >>                  .num_planes     = 1,
> >>                  .versions       = MFC_V10_BIT,
> >> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION |
> >> +                                 V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM,
> >>          },
> >>          {
> >>                  .fourcc         = V4L2_PIX_FMT_VP9,
> >> @@ -139,6 +156,7 @@ static struct s5p_mfc_fmt formats[] = {
> >>                  .type           = MFC_FMT_DEC,
> >>                  .num_planes     = 1,
> >>                  .versions       = MFC_V10_BIT,
> >> +               .flags          = V4L2_FMT_FLAG_DYN_RESOLUTION,
> >>          },
> >>   };
> >>
> >> --
> >> 2.20.1
> >>
> >
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
