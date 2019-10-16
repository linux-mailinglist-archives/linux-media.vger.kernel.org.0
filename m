Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7AAD90AA
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 14:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392932AbfJPMVH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 08:21:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:47608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389042AbfJPMVH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 08:21:07 -0400
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9A283218DE;
        Wed, 16 Oct 2019 12:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571228466;
        bh=CeJ4OFaEFPLw3ihfH/hKtlqnZhGpg3+vkKM+rY149p0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lK1We6Lmi97XkGiE/MEp3HZsTdoBnl5FJowPRopClnI5Eme8siVxkyOU2+OKGGie7
         NMVYJ0To1IU6xM5KK58z4H9YNWjARbAOWxY+iPIQQeome6NuOdFpRHYPMWvv8NPeH0
         xLNNw+ZuL3fb6a4ODvh+YARSA/hsNxV+p6sYpFLo=
Received: by mail-lf1-f42.google.com with SMTP id r22so17330317lfm.1;
        Wed, 16 Oct 2019 05:21:05 -0700 (PDT)
X-Gm-Message-State: APjAAAUjIdcTFWO4/3tiRnxevEmP77yM5x+KDMOOjrTM5n+mL8vXGplP
        hSPXXc+v3ZRtLi4uML4+Giw7FXvKt6nPffxUfS0=
X-Google-Smtp-Source: APXvYqyCdHTpq1tJW1xZhlVB32lqSSRbrks1Qn6qW2WOIZZ4YErk+tAL87CwQULw8+QcHDEGBDkRvD+94zlk2mZ0bx4=
X-Received: by 2002:a19:4f4c:: with SMTP id a12mr1366518lfk.18.1571228463791;
 Wed, 16 Oct 2019 05:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20191014141427.30708-1-ribalda@kernel.org> <f03e39da-2fe0-b1af-c409-8460c2fc5e9f@xs4all.nl>
In-Reply-To: <f03e39da-2fe0-b1af-c409-8460c2fc5e9f@xs4all.nl>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Wed, 16 Oct 2019 14:20:47 +0200
X-Gmail-Original-Message-ID: <CAPybu_1xBCVdcHKOwDFoM8wkrXWRSuFO1vUuB6Kp0rD6BREs1Q@mail.gmail.com>
Message-ID: <CAPybu_1xBCVdcHKOwDFoM8wkrXWRSuFO1vUuB6Kp0rD6BREs1Q@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-ctrl: Add p_def to v4l2_ctrl_config
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

Not that awkward, the user has to use the brand new
v4l2_ctrl_ptr_create() ;). But if you prefer void * I can make the
change.

Regards

On Wed, Oct 16, 2019 at 2:17 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 10/14/19 4:14 PM, Ricardo Ribalda Delgado wrote:
> > This allows setting the default value on compound controls created via
> > v4l2_ctrl_new_custom.
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls.c | 2 +-
> >  include/media/v4l2-ctrls.h           | 2 ++
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> > index bf50d37ef6c1..12cf38f73f7b 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > @@ -2583,7 +2583,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
> >                       type, min, max,
> >                       is_menu ? cfg->menu_skip_mask : step, def,
> >                       cfg->dims, cfg->elem_size,
> > -                     flags, qmenu, qmenu_int, ptr_null, priv);
> > +                     flags, qmenu, qmenu_int, cfg->p_def, priv);
> >       if (ctrl)
> >               ctrl->is_private = cfg->is_private;
> >       return ctrl;
> > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > index 26205ba3a0a0..2fca5b823961 100644
> > --- a/include/media/v4l2-ctrls.h
> > +++ b/include/media/v4l2-ctrls.h
> > @@ -375,6 +375,7 @@ struct v4l2_ctrl_handler {
> >   * @max:     The control's maximum value.
> >   * @step:    The control's step value for non-menu controls.
> >   * @def:     The control's default value.
> > + * @p_def:   The control's default value for compound controls.
> >   * @dims:    The size of each dimension.
> >   * @elem_size:       The size in bytes of the control.
> >   * @flags:   The control's flags.
> > @@ -403,6 +404,7 @@ struct v4l2_ctrl_config {
> >       s64 max;
> >       u64 step;
> >       s64 def;
> > +     union v4l2_ctrl_ptr p_def;
> >       u32 dims[V4L2_CTRL_MAX_DIMS];
> >       u32 elem_size;
> >       u32 flags;
> >
>
> I'm not sure about this. It might be a bit awkward to initialize p_def given that it is a union.
>
> Perhaps a simple void pointer would be easier?
>
> Regards,
>
>         Hans
