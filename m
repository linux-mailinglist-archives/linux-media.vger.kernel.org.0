Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 146C5D9123
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 14:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393131AbfJPMjf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 08:39:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:51830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726796AbfJPMjf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 08:39:35 -0400
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB97F205F4;
        Wed, 16 Oct 2019 12:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571229574;
        bh=mj5WsNm9zjatXEtFvEvg0QZ/Wf0AqG4dY1SSmXX3o6E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Y31L2fAjcOjOt2+MGpHexpF1WV8RDkdapU7Pk2zmBLBx5xzM7oSPSPEkUVhOULWFj
         MKOO5NlTfpoZ4Hip87mpA8fU/CpSNwM/6AFrL1rWULXy2n1/Q/dB2PnIBSVyzyFnEV
         kur0MKAule2YxXdnrrGR4G7hGZGsW7Id1rUW6Mn4=
Received: by mail-lf1-f43.google.com with SMTP id u16so4771384lfq.3;
        Wed, 16 Oct 2019 05:39:33 -0700 (PDT)
X-Gm-Message-State: APjAAAUpmDED6NyPgYUnJHkt7iljZLWiJ6F/gXVyseDhkDzMp+xp4zYS
        39C/dm8GLh1eswdvYeb7QfRNzlabPAtaePaNy1w=
X-Google-Smtp-Source: APXvYqyYy2rtlW10V22SOn04X4VTrR/pYnl5tunFa5HNmu+gYjPAYmneFKctgrNqN61CrHvgkH92kNZxeIy3bdUFZWU=
X-Received: by 2002:ac2:4845:: with SMTP id 5mr24190084lfy.191.1571229572131;
 Wed, 16 Oct 2019 05:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191014141427.30708-1-ribalda@kernel.org> <f03e39da-2fe0-b1af-c409-8460c2fc5e9f@xs4all.nl>
 <CAPybu_1xBCVdcHKOwDFoM8wkrXWRSuFO1vUuB6Kp0rD6BREs1Q@mail.gmail.com> <0e98973c-96a8-dc2e-295f-225ab3b1eae0@xs4all.nl>
In-Reply-To: <0e98973c-96a8-dc2e-295f-225ab3b1eae0@xs4all.nl>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Wed, 16 Oct 2019 14:39:15 +0200
X-Gmail-Original-Message-ID: <CAPybu_1to=P0s491p4pbaZMy+YAG88R5sORsvKQy9gKBL49f_w@mail.gmail.com>
Message-ID: <CAPybu_1to=P0s491p4pbaZMy+YAG88R5sORsvKQy9gKBL49f_w@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-ctrl: Add p_def to v4l2_ctrl_config
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans:

On Wed, Oct 16, 2019 at 2:32 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wro=
te:
>
> On 10/16/19 2:20 PM, Ricardo Ribalda Delgado wrote:
> > Hi Hans
> >
> > Not that awkward, the user has to use the brand new
> > v4l2_ctrl_ptr_create() ;). But if you prefer void * I can make the
> > change.
>
> Well, a struct v4l2_ctrl_config is typically a static const, so you can't=
 use
> v4l2_ctrl_ptr_create().
>
> Hmm, perhaps it is as easy as:
>
> static const struct v4l2_area def_area =3D {
>         ...
> };
>
> static const struct v4l2_ctrl_config ctrl =3D {
>         ...
>
>         .p_def.p_area =3D &def_area,
>         ...
> };
>
> Can you do a quick compile check that I am not overlooking anything?
>
> If this works, then I'll take this patch.

Testing with gcc 9.2.1

This works fine, no warning/error:

static struct v4l2_area unit_size =3D {
.width =3D UNIT_SIZE,
.height =3D UNIT_SIZE,
};
static struct v4l2_ctrl_config area_ctrl =3D {
.type =3D V4L2_CTRL_TYPE_AREA,
.flags =3D V4L2_CTRL_FLAG_READ_ONLY,
.p_def.p_area =3D &unit_size,
};

but if unit_size is set as CONST:
static const struct v4l2_area

Then:
drivers/qtec/qtec_sony.c: In function =E2=80=98qtec_sony_probe=E2=80=99:
drivers/qtec/qtec_sony.c:3151:19: warning: initialization discards
=E2=80=98const=E2=80=99 qualifier from pointer target type [-Wdiscarded-qua=
lifiers]
 3151 |   .p_def.p_area =3D &unit_size,
      |

>
> Regards,
>
>         Hans
>
> >
> > Regards
> >
> > On Wed, Oct 16, 2019 at 2:17 PM Hans Verkuil <hverkuil-cisco@xs4all.nl>=
 wrote:
> >>
> >> On 10/14/19 4:14 PM, Ricardo Ribalda Delgado wrote:
> >>> This allows setting the default value on compound controls created vi=
a
> >>> v4l2_ctrl_new_custom.
> >>>
> >>> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> >>> ---
> >>>  drivers/media/v4l2-core/v4l2-ctrls.c | 2 +-
> >>>  include/media/v4l2-ctrls.h           | 2 ++
> >>>  2 files changed, 3 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l=
2-core/v4l2-ctrls.c
> >>> index bf50d37ef6c1..12cf38f73f7b 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> >>> @@ -2583,7 +2583,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v=
4l2_ctrl_handler *hdl,
> >>>                       type, min, max,
> >>>                       is_menu ? cfg->menu_skip_mask : step, def,
> >>>                       cfg->dims, cfg->elem_size,
> >>> -                     flags, qmenu, qmenu_int, ptr_null, priv);
> >>> +                     flags, qmenu, qmenu_int, cfg->p_def, priv);
> >>>       if (ctrl)
> >>>               ctrl->is_private =3D cfg->is_private;
> >>>       return ctrl;
> >>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> >>> index 26205ba3a0a0..2fca5b823961 100644
> >>> --- a/include/media/v4l2-ctrls.h
> >>> +++ b/include/media/v4l2-ctrls.h
> >>> @@ -375,6 +375,7 @@ struct v4l2_ctrl_handler {
> >>>   * @max:     The control's maximum value.
> >>>   * @step:    The control's step value for non-menu controls.
> >>>   * @def:     The control's default value.
> >>> + * @p_def:   The control's default value for compound controls.
> >>>   * @dims:    The size of each dimension.
> >>>   * @elem_size:       The size in bytes of the control.
> >>>   * @flags:   The control's flags.
> >>> @@ -403,6 +404,7 @@ struct v4l2_ctrl_config {
> >>>       s64 max;
> >>>       u64 step;
> >>>       s64 def;
> >>> +     union v4l2_ctrl_ptr p_def;
> >>>       u32 dims[V4L2_CTRL_MAX_DIMS];
> >>>       u32 elem_size;
> >>>       u32 flags;
> >>>
> >>
> >> I'm not sure about this. It might be a bit awkward to initialize p_def=
 given that it is a union.
> >>
> >> Perhaps a simple void pointer would be easier?
> >>
> >> Regards,
> >>
> >>         Hans
>
