Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6939D9225
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 15:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbfJPNOW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 09:14:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:36418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727501AbfJPNOW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 09:14:22 -0400
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5E3E1218DE;
        Wed, 16 Oct 2019 13:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571231661;
        bh=OkpyrBkJIXbaSNvKjQJkOy7C5Fn2emjt3NqdXP7x+aU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kWUtalegu4JVULTW2nyUziLX05LzhfxcvmKjp3OoEFvV8sB/QenWbsixd238HzJk7
         jm5oq90WMVzxoHIllH8ahYL4vmKbI8H6CAcQPn99OyN/YB7ldYK1453NwdNLLrUgEm
         XZVhAJJSo4NMFo6EP6rQiqybySMttqs1j8nDMCYc=
Received: by mail-lj1-f172.google.com with SMTP id y3so23989603ljj.6;
        Wed, 16 Oct 2019 06:14:21 -0700 (PDT)
X-Gm-Message-State: APjAAAU9iYV3cF8faUFyoeCvlU/sXHtRGe3UQH+Yx1e+1IW9TVW1lRXI
        0/SpG+prx4fXdgQcGwa08CkqkKcfE+HQNlwYj2U=
X-Google-Smtp-Source: APXvYqyqIqe+Qn5GyzkkMK+AKvhzH8Jh17Uh8LiekkX1CdDmu/Jhjym6s7jgIk+uQ3D0iaAt+dRPiL+f5j8dJZvGHZ0=
X-Received: by 2002:a2e:99cc:: with SMTP id l12mr25001811ljj.175.1571231659454;
 Wed, 16 Oct 2019 06:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20191014141427.30708-1-ribalda@kernel.org> <f03e39da-2fe0-b1af-c409-8460c2fc5e9f@xs4all.nl>
 <CAPybu_1xBCVdcHKOwDFoM8wkrXWRSuFO1vUuB6Kp0rD6BREs1Q@mail.gmail.com>
 <0e98973c-96a8-dc2e-295f-225ab3b1eae0@xs4all.nl> <CAPybu_1to=P0s491p4pbaZMy+YAG88R5sORsvKQy9gKBL49f_w@mail.gmail.com>
 <77204a05-34a5-f6f1-460f-bddaa8f2bb5c@xs4all.nl> <3768e962-9c6b-1d32-c968-569c15c5f5bf@xs4all.nl>
In-Reply-To: <3768e962-9c6b-1d32-c968-569c15c5f5bf@xs4all.nl>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Wed, 16 Oct 2019 15:14:03 +0200
X-Gmail-Original-Message-ID: <CAPybu_1U5sKQudh2p3j1nNTTs4Rhz86zbbYpMqX2E4D9NVNZbQ@mail.gmail.com>
Message-ID: <CAPybu_1U5sKQudh2p3j1nNTTs4Rhz86zbbYpMqX2E4D9NVNZbQ@mail.gmail.com>
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

On Wed, Oct 16, 2019 at 2:57 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wro=
te:
>
> On 10/16/19 2:43 PM, Hans Verkuil wrote:
> > On 10/16/19 2:39 PM, Ricardo Ribalda Delgado wrote:
> >> Hi Hans:
> >>
> >> On Wed, Oct 16, 2019 at 2:32 PM Hans Verkuil <hverkuil-cisco@xs4all.nl=
> wrote:
> >>>
> >>> On 10/16/19 2:20 PM, Ricardo Ribalda Delgado wrote:
> >>>> Hi Hans
> >>>>
> >>>> Not that awkward, the user has to use the brand new
> >>>> v4l2_ctrl_ptr_create() ;). But if you prefer void * I can make the
> >>>> change.
> >>>
> >>> Well, a struct v4l2_ctrl_config is typically a static const, so you c=
an't use
> >>> v4l2_ctrl_ptr_create().
> >>>
> >>> Hmm, perhaps it is as easy as:
> >>>
> >>> static const struct v4l2_area def_area =3D {
> >>>         ...
> >>> };
> >>>
> >>> static const struct v4l2_ctrl_config ctrl =3D {
> >>>         ...
> >>>
> >>>         .p_def.p_area =3D &def_area,
> >>>         ...
> >>> };
> >>>
> >>> Can you do a quick compile check that I am not overlooking anything?
> >>>
> >>> If this works, then I'll take this patch.
> >>
> >> Testing with gcc 9.2.1
> >>
> >> This works fine, no warning/error:
> >>
> >> static struct v4l2_area unit_size =3D {
> >> .width =3D UNIT_SIZE,
> >> .height =3D UNIT_SIZE,
> >> };
> >> static struct v4l2_ctrl_config area_ctrl =3D {
> >> .type =3D V4L2_CTRL_TYPE_AREA,
> >> .flags =3D V4L2_CTRL_FLAG_READ_ONLY,
> >> .p_def.p_area =3D &unit_size,
> >> };
> >>
> >> but if unit_size is set as CONST:
> >> static const struct v4l2_area
> >>
> >> Then:
> >> drivers/qtec/qtec_sony.c: In function =E2=80=98qtec_sony_probe=E2=80=
=99:
> >> drivers/qtec/qtec_sony.c:3151:19: warning: initialization discards
> >> =E2=80=98const=E2=80=99 qualifier from pointer target type [-Wdiscarde=
d-qualifiers]
> >>  3151 |   .p_def.p_area =3D &unit_size,
> >>       |
> >
> > Hmm. So we need a const void *p_def instead.
>
> Ah, v4l2_ctrl_ptr_create() expects a non-const pointer.
>
> What happens if union v4l2_ctrl_ptr p_def; in struct v4l2_ctrl changes
> to const union v4l2_ctrl_ptr p_def; ?
>
> You'll need to add const elsewhere as well, but since the default value
> is const, this might work.
>
> I'm not entirely sure this is correct code, though, but it's worth trying
> it.
>

This might be tricky. p_def needs to be allocated "in run time", and
we need to set p_def afterwards.
I am afraid we will get a  " assignment of read-only member" error

> Regards,
>
>         Hans
>
> >
> > Regards,
> >
> >       Hans
> >
> >>
> >>>
> >>> Regards,
> >>>
> >>>         Hans
> >>>
> >>>>
> >>>> Regards
> >>>>
> >>>> On Wed, Oct 16, 2019 at 2:17 PM Hans Verkuil <hverkuil-cisco@xs4all.=
nl> wrote:
> >>>>>
> >>>>> On 10/14/19 4:14 PM, Ricardo Ribalda Delgado wrote:
> >>>>>> This allows setting the default value on compound controls created=
 via
> >>>>>> v4l2_ctrl_new_custom.
> >>>>>>
> >>>>>> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> >>>>>> ---
> >>>>>>  drivers/media/v4l2-core/v4l2-ctrls.c | 2 +-
> >>>>>>  include/media/v4l2-ctrls.h           | 2 ++
> >>>>>>  2 files changed, 3 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/=
v4l2-core/v4l2-ctrls.c
> >>>>>> index bf50d37ef6c1..12cf38f73f7b 100644
> >>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> >>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> >>>>>> @@ -2583,7 +2583,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struc=
t v4l2_ctrl_handler *hdl,
> >>>>>>                       type, min, max,
> >>>>>>                       is_menu ? cfg->menu_skip_mask : step, def,
> >>>>>>                       cfg->dims, cfg->elem_size,
> >>>>>> -                     flags, qmenu, qmenu_int, ptr_null, priv);
> >>>>>> +                     flags, qmenu, qmenu_int, cfg->p_def, priv);
> >>>>>>       if (ctrl)
> >>>>>>               ctrl->is_private =3D cfg->is_private;
> >>>>>>       return ctrl;
> >>>>>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls=
.h
> >>>>>> index 26205ba3a0a0..2fca5b823961 100644
> >>>>>> --- a/include/media/v4l2-ctrls.h
> >>>>>> +++ b/include/media/v4l2-ctrls.h
> >>>>>> @@ -375,6 +375,7 @@ struct v4l2_ctrl_handler {
> >>>>>>   * @max:     The control's maximum value.
> >>>>>>   * @step:    The control's step value for non-menu controls.
> >>>>>>   * @def:     The control's default value.
> >>>>>> + * @p_def:   The control's default value for compound controls.
> >>>>>>   * @dims:    The size of each dimension.
> >>>>>>   * @elem_size:       The size in bytes of the control.
> >>>>>>   * @flags:   The control's flags.
> >>>>>> @@ -403,6 +404,7 @@ struct v4l2_ctrl_config {
> >>>>>>       s64 max;
> >>>>>>       u64 step;
> >>>>>>       s64 def;
> >>>>>> +     union v4l2_ctrl_ptr p_def;
> >>>>>>       u32 dims[V4L2_CTRL_MAX_DIMS];
> >>>>>>       u32 elem_size;
> >>>>>>       u32 flags;
> >>>>>>
> >>>>>
> >>>>> I'm not sure about this. It might be a bit awkward to initialize p_=
def given that it is a union.
> >>>>>
> >>>>> Perhaps a simple void pointer would be easier?
> >>>>>
> >>>>> Regards,
> >>>>>
> >>>>>         Hans
> >>>
> >
>
