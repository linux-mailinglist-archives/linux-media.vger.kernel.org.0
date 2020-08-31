Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8CA2579F0
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 15:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgHaNCh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 09:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHaNCg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 09:02:36 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C4FC061573
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2020 06:02:36 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id e41so1962127uad.6
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2020 06:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zhGudJS1sItOpvCc1PbpWtn00AV8r9ffPyumERO6U7c=;
        b=AQEg0DPOoYVAQagmVh5OdPtkGnhUwAuSaSAXodsVDYzZN4L1k9IN5k2ZfHs2Bu4Bj1
         oF069sp3aA/5hN/iX4wxQemHxwDSTHW3BFXtOeAtprOz3L9/qORaSHCRi/J0bq/Ph5Xt
         vM/9EVyBFFlKv2Fdje/plGoBfpCuAMJTueGOY10qST68AHJcYJFisfKEaLWs8zMWy+EU
         baE/akFODFvfylj0cQZ0TpJLYuN4tEa+n4TFvNZBbMMbAAc0xtH50QnqNCYzaArxwARP
         Ww/FY6oWR5AIqau5YX3+KkrGzGFOBcpWxdHWLHuTsdOcEOST07ZH06OJtZb0wgtUgxGQ
         0kXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zhGudJS1sItOpvCc1PbpWtn00AV8r9ffPyumERO6U7c=;
        b=pzJ2Yp5fyS0hstXN0zvVWtvvrklBdKaAOQOQD/yTgU1piaDmTV1DhvoFVEYn5496bn
         uLewxFiDdYWv4RMARvv0VtfAka+3WYnyAVExF+iQ9lbz7w1FtHtY+m6bcOklVXZbOW2c
         UgWv1eK4ZoV0PWb4IMMRhXDvQaP/5c3ANTZDagIfaFKfoR4aSpGz+U3PBtygHsftvmGY
         nZT5a5l50bEypaTR8bwGv6J6Q6V79w+x1wK2P3rM0A6ZE/2IS7Ok5Y97vvBSpgjkhcnD
         uaYZ0qdz0Kv+pAEZqAtaxKwFdGGjlxbsD+xJoU+HncdhCCsBfXSkEbTMQ+q2AKfFwr8B
         YTcw==
X-Gm-Message-State: AOAM531pPXKdBqhpEB4RnNQVT4RiekJKbZYgF9474/B3aIKXCydllYvm
        vCLzl+Ned9sJat3Qa4+LVMeY4syxhR74jTsm9Kk=
X-Google-Smtp-Source: ABdhPJzAYSTtuiEDEzf2FvEBB+WDA/TKVWL2+S25CtHepHciU9BYVOwuiVUfcM+wvCNuNduFicILzsI8CHDoSF6YN3Y=
X-Received: by 2002:a9f:29e4:: with SMTP id s91mr576800uas.44.1598878955300;
 Mon, 31 Aug 2020 06:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
 <20200723132014.4597-7-dafna.hirschfeld@collabora.com> <20200830144302.GA3265406@chromium.org>
In-Reply-To: <20200830144302.GA3265406@chromium.org>
From:   Dafna Hirschfeld <dafna3@gmail.com>
Date:   Mon, 31 Aug 2020 15:02:19 +0200
Message-ID: <CAJ1myNQCXZNYXHuwa9Z7w-uj_DgXx7b5ftzQQ7=VHSGu2Aq5iA@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] media: staging: rkisp1: add a helper function to
 enumerate supported mbus formats on capture
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(resending as plain text)

On Sun, Aug 30, 2020 at 4:43 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> Hi Dafna,
>
> On Thu, Jul 23, 2020 at 03:20:10PM +0200, Dafna Hirschfeld wrote:
> > Add a function 'rkisp1_cap_enum_mbus_codes' that receive
> > a pointer to 'v4l2_subdev_mbus_code_enum' and returns the
> > next supported mbus format of the capture. The function
> > assumes that pixel formats with identical 'mbus' are grouped
> > together in the hardcoded arrays, therefore the order of the
> > entries in the array 'rkisp1_sp_fmts' are adjusted.
> > This function is a helper for the media bus enumeration of
> > the source pad of the resizer entity.
> >
> > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > ---
> >  drivers/staging/media/rkisp1/rkisp1-capture.c | 77 ++++++++++++-------
> >  drivers/staging/media/rkisp1/rkisp1-common.h  |  8 ++
> >  2 files changed, 58 insertions(+), 27 deletions(-)
> >
>
> Thank you for the patch. Please see my comments inline.
>
> > diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> > index 5dd91b5f82a4..4dabd07a3da9 100644
> > --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> > +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> > @@ -112,6 +112,13 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
> >               .write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> >               .mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >       },
> > +     /* yuv400 */
> > +     {
> > +             .fourcc = V4L2_PIX_FMT_GREY,
> > +             .uv_swap = 0,
> > +             .write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
> > +             .mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> > +     },
> >       /* yuv420 */
> >       {
> >               .fourcc = V4L2_PIX_FMT_NV21,
> > @@ -144,13 +151,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
> >               .write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> >               .mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
> >       },
> > -     /* yuv400 */
> > -     {
> > -             .fourcc = V4L2_PIX_FMT_GREY,
> > -             .uv_swap = 0,
> > -             .write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
> > -             .mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> > -     },
> >       /* raw */
> >       {
> >               .fourcc = V4L2_PIX_FMT_SRGGB8,
> > @@ -236,6 +236,26 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
> >               .output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> >               .mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> >       },
> > +     /* yuv400 */
> > +     {
> > +             .fourcc = V4L2_PIX_FMT_GREY,
> > +             .uv_swap = 0,
> > +             .write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
> > +             .output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
> > +             .mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> > +     },
> > +     /* rgb */
> > +     {
> > +             .fourcc = V4L2_PIX_FMT_XBGR32,
> > +             .write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> > +             .output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB888,
> > +             .mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> > +     }, {
> > +             .fourcc = V4L2_PIX_FMT_RGB565,
> > +             .write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> > +             .output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB565,
> > +             .mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> > +     },
>
> Is there any reason to move RGB formats here rather than keeping them at
> the end of the list, after all YUV formats?

Hi,
yes, the new function 'rkisp1_cap_enum_mbus_codes' assumes that
pixelformats with
identical mbus codes are grouped together. It uses it to iterate the
formats and increment
a counter when encountering a new mbus.

>
> >       /* yuv420 */
> >       {
> >               .fourcc = V4L2_PIX_FMT_NV21,
> > @@ -274,26 +294,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
> >               .output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
> >               .mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
> >       },
> > -     /* yuv400 */
> > -     {
> > -             .fourcc = V4L2_PIX_FMT_GREY,
> > -             .uv_swap = 0,
> > -             .write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
> > -             .output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
> > -             .mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> > -     },
> > -     /* rgb */
> > -     {
> > -             .fourcc = V4L2_PIX_FMT_XBGR32,
> > -             .write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> > -             .output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB888,
> > -             .mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> > -     }, {
> > -             .fourcc = V4L2_PIX_FMT_RGB565,
> > -             .write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> > -             .output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB565,
> > -             .mbus = MEDIA_BUS_FMT_YUYV8_2X8,
> > -     },
> >  };
> >
> >  static const struct rkisp1_capture_config rkisp1_capture_config_mp = {
> > @@ -334,6 +334,29 @@ rkisp1_vdev_to_node(struct video_device *vdev)
> >       return container_of(vdev, struct rkisp1_vdev_node, vdev);
> >  }
> >
> > +int rkisp1_cap_enum_mbus_codes(struct rkisp1_capture *cap,
> > +                            struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +     const struct rkisp1_capture_fmt_cfg *fmts = cap->config->fmts;
> > +     u32 curr_mbus = fmts[0].mbus;
> > +     int i, n = 0;
> > +
> > +     if (code->index == 0) {
> > +             code->code = fmts[0].mbus;
> > +             return 0;
> > +     }
> > +
> > +     for (i = 1; i < cap->config->fmt_size; i++)
>
> How about just initializing curr_mbus to MEDIA_BUS_FMT_FIXED? This is not
> supposed to be found in the array, so is a safe initial value, which would
> allow removing the explicit handling of index == 0.

yes, I'll do that.

>
> > +             if (fmts[i].mbus != curr_mbus) {
>
> As Helen mentioned, we could use the continue keyword to skip the iteration
> early and make it obvious that rest of the loop is entirely for the case
> where mbus != curr_mbus, removing one level of nesting.
>

that too,

> > +                     curr_mbus = fmts[i].mbus;
> > +                     if (++n == code->index) {
> > +                             code->code = curr_mbus;
> > +                             return 0;
> > +                     }
> > +             }
>
> According to the kernel coding style guidelines [1], this for loop should
> have braces.
>
> [1] https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-braces-and-spaces
>
thanks, I didn't know that.



Thanks,
Dafna

> Best regards,
> Tomasz
