Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF888D9216
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 15:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393496AbfJPNNA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 09:13:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:35874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391688AbfJPNNA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 09:13:00 -0400
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 08FAE20663;
        Wed, 16 Oct 2019 13:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571231579;
        bh=6GG8zdFDGvDo1qQWy36D+1Jipp0x6MbzMPgPTobpQkw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vzGhS4eNYC4y5D4VIwdgigaWt4LpEqp5Nk4oVLKC86OAHEgvPVIkLvAFN7DCBzHk4
         7VqQxjfjfI73apKQM1G6FsvXEagQwi+8Vfwgzd6FJjYa29OMEs70GlvlrGrx9ZMt9X
         56uDTECXtzn3SRfIGFz3uybYyKInWHf39Uevf2H0=
Received: by mail-lf1-f46.google.com with SMTP id u16so4868699lfq.3;
        Wed, 16 Oct 2019 06:12:58 -0700 (PDT)
X-Gm-Message-State: APjAAAUUUCFYIFczfjKerp8kQtL32g3QWkc2wSzOtLXUUdvh+w5w1TQ8
        n6chkUsr+1IqGKMfz3gyJgxJPne2y5m6BsK7Xqw=
X-Google-Smtp-Source: APXvYqzT/N1cgrtXrDQrRHPj8eWvyv0iVr9e24iJo8IYb5hDG7elRD/rbAMkzuCcQ5vyaQZogAGXBJQGD33R9ZUtQHo=
X-Received: by 2002:a19:4f4c:: with SMTP id a12mr1541261lfk.18.1571231577169;
 Wed, 16 Oct 2019 06:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20191014141427.30708-1-ribalda@kernel.org> <f03e39da-2fe0-b1af-c409-8460c2fc5e9f@xs4all.nl>
 <CAPybu_1xBCVdcHKOwDFoM8wkrXWRSuFO1vUuB6Kp0rD6BREs1Q@mail.gmail.com>
 <0e98973c-96a8-dc2e-295f-225ab3b1eae0@xs4all.nl> <CAPybu_1to=P0s491p4pbaZMy+YAG88R5sORsvKQy9gKBL49f_w@mail.gmail.com>
 <77204a05-34a5-f6f1-460f-bddaa8f2bb5c@xs4all.nl>
In-Reply-To: <77204a05-34a5-f6f1-460f-bddaa8f2bb5c@xs4all.nl>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Wed, 16 Oct 2019 15:12:41 +0200
X-Gmail-Original-Message-ID: <CAPybu_3o9LLk2fHJPk7DmwKVB2Fubftdu+7VL=U6TM03rHTTiw@mail.gmail.com>
Message-ID: <CAPybu_3o9LLk2fHJPk7DmwKVB2Fubftdu+7VL=U6TM03rHTTiw@mail.gmail.com>
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

Hi Hans

On Wed, Oct 16, 2019 at 2:43 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wro=
te:
>
> On 10/16/19 2:39 PM, Ricardo Ribalda Delgado wrote:
> > Hi Hans:
> >
> > On Wed, Oct 16, 2019 at 2:32 PM Hans Verkuil <hverkuil-cisco@xs4all.nl>=
 wrote:
> >>
> >> On 10/16/19 2:20 PM, Ricardo Ribalda Delgado wrote:
> >>> Hi Hans
> >>>
> >>> Not that awkward, the user has to use the brand new
> >>> v4l2_ctrl_ptr_create() ;). But if you prefer void * I can make the
> >>> change.
> >>
> >> Well, a struct v4l2_ctrl_config is typically a static const, so you ca=
n't use
> >> v4l2_ctrl_ptr_create().
> >>
> >> Hmm, perhaps it is as easy as:
> >>
> >> static const struct v4l2_area def_area =3D {
> >>         ...
> >> };
> >>
> >> static const struct v4l2_ctrl_config ctrl =3D {
> >>         ...
> >>
> >>         .p_def.p_area =3D &def_area,
> >>         ...
> >> };
> >>
> >> Can you do a quick compile check that I am not overlooking anything?
> >>
> >> If this works, then I'll take this patch.
> >
> > Testing with gcc 9.2.1
> >
> > This works fine, no warning/error:
> >
> > static struct v4l2_area unit_size =3D {
> > .width =3D UNIT_SIZE,
> > .height =3D UNIT_SIZE,
> > };
> > static struct v4l2_ctrl_config area_ctrl =3D {
> > .type =3D V4L2_CTRL_TYPE_AREA,
> > .flags =3D V4L2_CTRL_FLAG_READ_ONLY,
> > .p_def.p_area =3D &unit_size,
> > };
> >
> > but if unit_size is set as CONST:
> > static const struct v4l2_area
> >
> > Then:
> > drivers/qtec/qtec_sony.c: In function =E2=80=98qtec_sony_probe=E2=80=99=
:
> > drivers/qtec/qtec_sony.c:3151:19: warning: initialization discards
> > =E2=80=98const=E2=80=99 qualifier from pointer target type [-Wdiscarded=
-qualifiers]
> >  3151 |   .p_def.p_area =3D &unit_size,
> >       |
>
> Hmm. So we need a const void *p_def instead.
>

If we make p_def in ctrl_config const then this will fail:

drivers/qtec/qtec_sony.c:3273:18: error: assignment of read-only member =E2=
=80=98p_def=E2=80=99
 3273 |  area_ctrl.p_def =3D v4l2_ctrl_ptr_create((void *)&unit_size);


I think we need to leave it as in the proposed patch.

> Regards,
>
>         Hans
>
> >
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>> Regards
> >>>
> >>> On Wed, Oct 16, 2019 at 2:17 PM Hans Verkuil <hverkuil-cisco@xs4all.n=
l> wrote:
> >>>>
> >>>> On 10/14/19 4:14 PM, Ricardo Ribalda Delgado wrote:
> >>>>> This allows setting the default value on compound controls created =
via
> >>>>> v4l2_ctrl_new_custom.
> >>>>>
> >>>>> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> >>>>> ---
> >>>>>  drivers/media/v4l2-core/v4l2-ctrls.c | 2 +-
> >>>>>  include/media/v4l2-ctrls.h           | 2 ++
> >>>>>  2 files changed, 3 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v=
4l2-core/v4l2-ctrls.c
> >>>>> index bf50d37ef6c1..12cf38f73f7b 100644
> >>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> >>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> >>>>> @@ -2583,7 +2583,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct=
 v4l2_ctrl_handler *hdl,
> >>>>>                       type, min, max,
> >>>>>                       is_menu ? cfg->menu_skip_mask : step, def,
> >>>>>                       cfg->dims, cfg->elem_size,
> >>>>> -                     flags, qmenu, qmenu_int, ptr_null, priv);
> >>>>> +                     flags, qmenu, qmenu_int, cfg->p_def, priv);
> >>>>>       if (ctrl)
> >>>>>               ctrl->is_private =3D cfg->is_private;
> >>>>>       return ctrl;
> >>>>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.=
h
> >>>>> index 26205ba3a0a0..2fca5b823961 100644
> >>>>> --- a/include/media/v4l2-ctrls.h
> >>>>> +++ b/include/media/v4l2-ctrls.h
> >>>>> @@ -375,6 +375,7 @@ struct v4l2_ctrl_handler {
> >>>>>   * @max:     The control's maximum value.
> >>>>>   * @step:    The control's step value for non-menu controls.
> >>>>>   * @def:     The control's default value.
> >>>>> + * @p_def:   The control's default value for compound controls.
> >>>>>   * @dims:    The size of each dimension.
> >>>>>   * @elem_size:       The size in bytes of the control.
> >>>>>   * @flags:   The control's flags.
> >>>>> @@ -403,6 +404,7 @@ struct v4l2_ctrl_config {
> >>>>>       s64 max;
> >>>>>       u64 step;
> >>>>>       s64 def;
> >>>>> +     union v4l2_ctrl_ptr p_def;
> >>>>>       u32 dims[V4L2_CTRL_MAX_DIMS];
> >>>>>       u32 elem_size;
> >>>>>       u32 flags;
> >>>>>
> >>>>
> >>>> I'm not sure about this. It might be a bit awkward to initialize p_d=
ef given that it is a union.
> >>>>
> >>>> Perhaps a simple void pointer would be easier?
> >>>>
> >>>> Regards,
> >>>>
> >>>>         Hans
> >>
>
