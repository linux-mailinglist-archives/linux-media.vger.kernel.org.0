Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49CB51E3348
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 00:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404560AbgEZW5g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 18:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403871AbgEZW5f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 18:57:35 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD44CC061A0F
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 15:57:35 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id d5so14413264ios.9
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 15:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sex9OGzN9WT8EWuepq7JqqNxYg08Gjufj9S0qlNx5LU=;
        b=gMjYs7GiAbye4VSvbyZq3xrxCEmJispCUG7lzSx9jGYP530GAkDHnBbH/hGXxJxSTv
         fV8rgnnHs89C8COJy5QTJ3KEW8nHhEvcWAuG6BiBMenOVLCVcf3NxM0SNfN8Yua6miox
         cvoWidbF6cLgIyWVkPohg41L0eABtK+fazhKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sex9OGzN9WT8EWuepq7JqqNxYg08Gjufj9S0qlNx5LU=;
        b=pANAV42VGDUjr5q+tsrLz2QMVBYQUYZxvz+7oOrVBef+8x9ZFNN04JTplrnGqvaPgc
         3HKKFZ8ZmFqi6txet2cu2c9fVbgTz1YaVPWp58uTCzm1jHKxCMqjCPZ8PgLGNKBOo24d
         ImrbIHOC248twHprCYvGr4oastQ24nbi4NNl/CVrzh9ObbFZTNy9wY2N6qlhZb5FRBS2
         34cjFZgeeFeG/3VPDg4YywULKR+1FNUMZHSGQ5jCuzw4PY1I5zYm2CNRhHTPDczrGkxl
         TVkEC8yxET/rvwJ/JMhhBoev1fdnPGIqLoErMI/ziZZU2Yx8H4jZTeTUIHr3m4mFIJUM
         VOZA==
X-Gm-Message-State: AOAM532GUUt56zhCeATjCSuQS14+spZahCFB3FLHlUI1gbyUjdAbaYwh
        Ak2VG15Iwwhh+8m/9yYPiyEfurCi/L5vJ3dD/HvYbQ==
X-Google-Smtp-Source: ABdhPJwLBbbapXbf0ED+DUqLSjGQpZPZGpk+3HhYLDWqx/9ECPvOQVi320yVJdmvZWTQTA6oUrjtgHEgJhYh3uAwxrA=
X-Received: by 2002:a6b:1448:: with SMTP id 69mr15871189iou.83.1590533855234;
 Tue, 26 May 2020 15:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
 <20200515142952.20163-5-dafna.hirschfeld@collabora.com> <fc4dbc40-ab57-0ca4-4ac7-5ffdb7f0ad81@collabora.com>
In-Reply-To: <fc4dbc40-ab57-0ca4-4ac7-5ffdb7f0ad81@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 27 May 2020 00:57:24 +0200
Message-ID: <CAHD77H=iq3BpwD3=yL1DttUH_=vt8nO-5N_Kiu427BrUHJQ-zQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] media: staging: rkisp1: cap: remove support of
 BGR666 format
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 21, 2020 at 12:35 AM Helen Koike <helen.koike@collabora.com> wrote:
>
>
>
> On 5/15/20 11:29 AM, Dafna Hirschfeld wrote:
> > The rkisp1 supports RGB encoding with 6 bits per
> > color with the following format:
> > - - b5 b4 b3 b2 b1 b0 - - g5 g4 g3 g2 g1 g0 - - r5 r4 r3 r2 r1 r0 - - - - - - - -
>
> Is this the same as V4L2_PIX_FMT_XBGR32 format, but with colors range from 0 to 63 ?
>
> I was wondering what is the usage of such a format. If it is useful, then I'm sad
> to see this being removed from the driver, since this is a v4l2 api limitation, and not
> a hw limitation.

Sounds like some relic of the past. ;)

In general, RGB formats are not very useful in this hardware. One
wastes the precious bandwidth, but doesn't get more color resolution,
since the pipeline uses YUV 4:2:2 internally anyway. The typical usage
scenarios with video or JPEG encoding and preview are much better off
with the available YUV formats.

>
> Regards,
> Helen
>
> >
> > This is not how V4L2_PIX_FMT_BGR666 is defined, so remove
> > this format from the driver's formats list.
> >
> > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > ---
> >  drivers/staging/media/rkisp1/rkisp1-capture.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> > index 61b9ebe577b2..2660e44eda88 100644
> > --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> > +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> > @@ -283,10 +283,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
> >               .fourcc = V4L2_PIX_FMT_RGB565,
> >               .write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> >               .output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB565,
> > -     }, {
> > -             .fourcc = V4L2_PIX_FMT_BGR666,
> > -             .write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> > -             .output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB666,
> >       },
> >  };
> >
> >
