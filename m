Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B39BC7CD591
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 09:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbjJRHlA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 03:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbjJRHk5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 03:40:57 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03425FF;
        Wed, 18 Oct 2023 00:40:55 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6b20a48522fso4172816b3a.1;
        Wed, 18 Oct 2023 00:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697614854; x=1698219654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0c9Xgu3uYqyEjnVJFwKD4KzaY8VpildpRVCGb9xxX8s=;
        b=F/auiJ+WYlbPAWE3RvulS5C5CeyV6EOdsqo+u9noxj/ckyn+MGl2d3mo9EDXMrF42S
         HpzjARR+uOT895kff572e2XsA9isenicYPw6i7israHKYJkP8zWd8GL6oq3YrxztGhRy
         ipszDJP3PRTgS73Yx4mTqFfzLPSq/Y1BM5WOH/CHnSjDQxIs4ZThfmbsxC3kKuxL3cLt
         Fho9Au9f1n5pWlrip2HQHeqe0x8sLNlHCTt4u/UOrfot5JGoKBmSENzLekbcKNUFvyGf
         FLDOdLGz9JBqMlfn4Ls/ad2pzzjdIPk4pt2lzKWfs5hl55nQKxlyGwnYzZ0PZBc+XGys
         kUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697614854; x=1698219654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0c9Xgu3uYqyEjnVJFwKD4KzaY8VpildpRVCGb9xxX8s=;
        b=kfbVNslJogRKivyt9AGtPdS+9U721PJ8tjCnouuKdYt03iDe/GaUZkSKyXqkK4MS6R
         yySlCRKdzvb0vlZj5V7RlAG8oC+NFW3Gs4vQ3HM1EOy7Bhkew62YMuk52UmfUkcpi4j9
         IYgehIgBcJM7QAidjVuTdm9q64vfjPROkSUR0hhOilFS1Mg8Y8VTh0eNpisPnmpM8vIK
         x/TWxDU1Kp+I2wjVYi7wL1nlQj3S16K1PlvknYzRyippKObxjiUwx/3DAsuATRFEFfal
         PMFyUA87MkQaG33GD/uV3NVaUyhs9460tFDoN0PZQeDQysFoD+dDAvfbGCIuDpTHrjo+
         dgIA==
X-Gm-Message-State: AOJu0YzQ8VZHsaqrlE5VgXrbVhCQVfSeP5puORHJn/xFIIG2N8iiuJvY
        r7YqU8baFIraZOaIKpQke+Z0wYHIPc9Em0nvlB0=
X-Google-Smtp-Source: AGHT+IFtVwZpxVMeutpWrG/OiXhi96Yt7OwGBlDumQA3qnGrD2yaEVi24BtQl6QwKGpoNH6uML5wxLPhxUXRHUEyUts=
X-Received: by 2002:a05:6a20:441a:b0:140:c838:2b2e with SMTP id
 ce26-20020a056a20441a00b00140c8382b2emr4931185pzb.22.1697614854309; Wed, 18
 Oct 2023 00:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
 <1697185865-27528-10-git-send-email-shengjiu.wang@nxp.com>
 <a0dfe959-3b32-4d03-9f1b-8f3c1054ecf7@xs4all.nl> <CAA+D8AP1a-Vioy2Cr7dZ4wErXpkm7g9Caw-yPKc9jbWpPnN0JQ@mail.gmail.com>
 <0ae6d9e1-bdd9-45ab-9749-8b0cb5c624ff@xs4all.nl> <CAA+D8AMa9tpMq08XsUuAtV0DLWbLOwsfYjd30NJ3OBezkTs5YA@mail.gmail.com>
 <CAA+D8AOJ=Akp5AmE4PCy=O=TGYaP3Cn0jLveL-aoqV3tFAVPSg@mail.gmail.com> <36360a55-4cb4-4494-aa69-96837ba7750d@xs4all.nl>
In-Reply-To: <36360a55-4cb4-4494-aa69-96837ba7750d@xs4all.nl>
From:   Shengjiu Wang <shengjiu.wang@gmail.com>
Date:   Wed, 18 Oct 2023 15:40:43 +0800
Message-ID: <CAA+D8APMRpWXPy3VHPev5A+g8o6m5Tj4BKivSGk_SZAZsMoBAw@mail.gmail.com>
Subject: Re: [RFC PATCH v6 09/11] media: uapi: Add audio rate controls support
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
        tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, alsa-devel@alsa-project.org,
        linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 18, 2023 at 3:31=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 18/10/2023 09:23, Shengjiu Wang wrote:
> > On Wed, Oct 18, 2023 at 10:27=E2=80=AFAM Shengjiu Wang <shengjiu.wang@g=
mail.com> wrote:
> >>
> >> On Tue, Oct 17, 2023 at 9:37=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.=
nl> wrote:
> >>>
> >>> On 17/10/2023 15:11, Shengjiu Wang wrote:
> >>>> On Mon, Oct 16, 2023 at 9:16=E2=80=AFPM Hans Verkuil <hverkuil@xs4al=
l.nl> wrote:
> >>>>>
> >>>>> Hi Shengjiu,
> >>>>>
> >>>>> On 13/10/2023 10:31, Shengjiu Wang wrote:
> >>>>>> Fixed point controls are used by the user to configure
> >>>>>> the audio sample rate to driver.
> >>>>>>
> >>>>>> Add V4L2_CID_ASRC_SOURCE_RATE and V4L2_CID_ASRC_DEST_RATE
> >>>>>> new IDs for ASRC rate control.
> >>>>>>
> >>>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>>>> ---
> >>>>>>  .../userspace-api/media/v4l/common.rst        |  1 +
> >>>>>>  .../media/v4l/ext-ctrls-fixed-point.rst       | 36 ++++++++++++++=
+++++
> >>>>>>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 +++
> >>>>>>  .../media/v4l/vidioc-queryctrl.rst            |  7 ++++
> >>>>>>  .../media/videodev2.h.rst.exceptions          |  1 +
> >>>>>>  drivers/media/v4l2-core/v4l2-ctrls-core.c     |  5 +++
> >>>>>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 +++
> >>>>>>  include/media/v4l2-ctrls.h                    |  2 ++
> >>>>>>  include/uapi/linux/v4l2-controls.h            | 13 +++++++
> >>>>>>  include/uapi/linux/videodev2.h                |  3 ++
> >>>>>>  10 files changed, 76 insertions(+)
> >>>>>>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrl=
s-fixed-point.rst
> >>>>>>
> >>>>>> diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Do=
cumentation/userspace-api/media/v4l/common.rst
> >>>>>> index ea0435182e44..35707edffb13 100644
> >>>>>> --- a/Documentation/userspace-api/media/v4l/common.rst
> >>>>>> +++ b/Documentation/userspace-api/media/v4l/common.rst
> >>>>>> @@ -52,6 +52,7 @@ applicable to all devices.
> >>>>>>      ext-ctrls-fm-rx
> >>>>>>      ext-ctrls-detect
> >>>>>>      ext-ctrls-colorimetry
> >>>>>> +    ext-ctrls-fixed-point
> >>>>>
> >>>>> Rename this to ext-ctrls-audio-m2m.
> >>>>>
> >>>>>>      fourcc
> >>>>>>      format
> >>>>>>      planar-apis
> >>>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fixed=
-point.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-fixed-point.rs=
t
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..2ef6e250580c
> >>>>>> --- /dev/null
> >>>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fixed-point.=
rst
> >>>>>> @@ -0,0 +1,36 @@
> >>>>>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> >>>>>> +
> >>>>>> +.. _fixed-point-controls:
> >>>>>> +
> >>>>>> +***************************
> >>>>>> +Fixed Point Control Reference
> >>>>>
> >>>>> This is for audio controls. "Fixed Point" is just the type, and it =
doesn't make
> >>>>> sense to group fixed point controls. But it does make sense to grou=
p the audio
> >>>>> controls.
> >>>>>
> >>>>> V4L2 controls can be grouped into classes. Basically it is a way to=
 put controls
> >>>>> into categories, and for each category there is also a control that=
 gives a
> >>>>> description of the class (see 2.15.15 in
> >>>>> https://linuxtv.org/downloads/v4l-dvb-apis-new/driver-api/v4l2-cont=
rols.html#introduction)
> >>>>>
> >>>>> If you use e.g. 'v4l2-ctl -l' to list all the controls, then you wi=
ll see that
> >>>>> they are grouped based on what class of control they are.
> >>>>>
> >>>>> So I think it would be a good idea to create a new control class fo=
r M2M audio controls,
> >>>>> instead of just adding them to the catch-all 'User Controls' class.
> >>>>>
> >>>>> Search e.g. for V4L2_CTRL_CLASS_COLORIMETRY and V4L2_CID_COLORIMETR=
Y_CLASS to see how
> >>>>> it is done.
> >>>>>
> >>>>> M2M_AUDIO would probably be a good name for the class.
> >>>>>
> >>>>>> +***************************
> >>>>>> +
> >>>>>> +These controls are intended to support an asynchronous sample
> >>>>>> +rate converter.
> >>>>>
> >>>>> Add ' (ASRC).' at the end to indicate the common abbreviation for
> >>>>> that.
> >>>>>
> >>>>>> +
> >>>>>> +.. _v4l2-audio-asrc:
> >>>>>> +
> >>>>>> +``V4L2_CID_ASRC_SOURCE_RATE``
> >>>>>> +    sets the resampler source rate.
> >>>>>> +
> >>>>>> +``V4L2_CID_ASRC_DEST_RATE``
> >>>>>> +    sets the resampler destination rate.
> >>>>>
> >>>>> Document the unit (Hz) for these two controls.
> >>>>>
> >>>>>> +
> >>>>>> +.. c:type:: v4l2_ctrl_fixed_point
> >>>>>> +
> >>>>>> +.. cssclass:: longtable
> >>>>>> +
> >>>>>> +.. tabularcolumns:: |p{1.5cm}|p{5.8cm}|p{10.0cm}|
> >>>>>> +
> >>>>>> +.. flat-table:: struct v4l2_ctrl_fixed_point
> >>>>>> +    :header-rows:  0
> >>>>>> +    :stub-columns: 0
> >>>>>> +    :widths:       1 1 2
> >>>>>> +
> >>>>>> +    * - __u32
> >>>>>
> >>>>> Hmm, shouldn't this be __s32?
> >>>>>
> >>>>>> +      - ``integer``
> >>>>>> +      - integer part of fixed point value.
> >>>>>> +    * - __s32
> >>>>>
> >>>>> and this __u32?
> >>>>>
> >>>>> You want to be able to use this generic type as a signed value.
> >>>>>
> >>>>>> +      - ``fractional``
> >>>>>> +      - fractional part of fixed point value, which is Q31.
> >>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ct=
rls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >>>>>> index f9f73530a6be..1811dabf5c74 100644
> >>>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> >>>>>> @@ -295,6 +295,10 @@ still cause this situation.
> >>>>>>        - ``p_av1_film_grain``
> >>>>>>        - A pointer to a struct :c:type:`v4l2_ctrl_av1_film_grain`.=
 Valid if this control is
> >>>>>>          of type ``V4L2_CTRL_TYPE_AV1_FILM_GRAIN``.
> >>>>>> +    * - struct :c:type:`v4l2_ctrl_fixed_point` *
> >>>>>> +      - ``p_fixed_point``
> >>>>>> +      - A pointer to a struct :c:type:`v4l2_ctrl_fixed_point`. Va=
lid if this control is
> >>>>>> +        of type ``V4L2_CTRL_TYPE_FIXED_POINT``.
> >>>>>>      * - void *
> >>>>>>        - ``ptr``
> >>>>>>        - A pointer to a compound type which can be an N-dimensiona=
l array
> >>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctr=
l.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> >>>>>> index 4d38acafe8e1..9285f4f39eed 100644
> >>>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> >>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> >>>>>> @@ -549,6 +549,13 @@ See also the examples in :ref:`control`.
> >>>>>>        - n/a
> >>>>>>        - A struct :c:type:`v4l2_ctrl_av1_film_grain`, containing A=
V1 Film Grain
> >>>>>>          parameters for stateless video decoders.
> >>>>>> +    * - ``V4L2_CTRL_TYPE_FIXED_POINT``
> >>>>>> +      - n/a
> >>>>>> +      - n/a
> >>>>>> +      - n/a
> >>>>>> +      - A struct :c:type:`v4l2_ctrl_fixed_point`, containing para=
meter which has
> >>>>>> +        integer part and fractional part, i.e. audio sample rate.
> >>>>>> +
> >>>>>>
> >>>>>>  .. raw:: latex
> >>>>>>
> >>>>>> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exc=
eptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >>>>>> index e61152bb80d1..2faa5a2015eb 100644
> >>>>>> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >>>>>> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> >>>>>> @@ -167,6 +167,7 @@ replace symbol V4L2_CTRL_TYPE_AV1_SEQUENCE :c:=
type:`v4l2_ctrl_type`
> >>>>>>  replace symbol V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY :c:type:`v4l2_=
ctrl_type`
> >>>>>>  replace symbol V4L2_CTRL_TYPE_AV1_FRAME :c:type:`v4l2_ctrl_type`
> >>>>>>  replace symbol V4L2_CTRL_TYPE_AV1_FILM_GRAIN :c:type:`v4l2_ctrl_t=
ype`
> >>>>>> +replace symbol V4L2_CTRL_TYPE_FIXED_POINT :c:type:`v4l2_ctrl_type=
`
> >>>>>>
> >>>>>>  # V4L2 capability defines
> >>>>>>  replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
> >>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/m=
edia/v4l2-core/v4l2-ctrls-core.c
> >>>>>> index a662fb60f73f..7a616ac91059 100644
> >>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> >>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> >>>>>> @@ -1168,6 +1168,8 @@ static int std_validate_compound(const struc=
t v4l2_ctrl *ctrl, u32 idx,
> >>>>>>               if (!area->width || !area->height)
> >>>>>>                       return -EINVAL;
> >>>>>>               break;
> >>>>>> +     case V4L2_CTRL_TYPE_FIXED_POINT:
> >>>>>> +             break;
> >>>>>
> >>>>> Hmm, this would need this patch 'v4l2-ctrls: add support for V4L2_C=
TRL_WHICH_MIN/MAX_VAL':
> >>>>>
> >>>>> https://patchwork.linuxtv.org/project/linux-media/patch/20231010022=
136.1504015-7-yunkec@google.com/
> >>>>>
> >>>>> since min and max values are perfectly fine for a fixed point value=
.
> >>>>>
> >>>>> Even a step value (currently not supported in that patch) would mak=
e sense.
> >>>>>
> >>>>> But I wonder if we couldn't simplify this: instead of creating a v4=
l2_ctrl_fixed_point,
> >>>>> why not represent the fixed point value as a Q31.32. Then the stand=
ard
> >>>>> minimum/maximum/step values can be used, and it acts like a regular=
 V4L2_TYPE_INTEGER64.
> >>>>>
> >>>>> Except that both userspace and drivers need to multiply it with 2^-=
32 to get the actual
> >>>>> value.
> >>>>>
> >>>>> So in enum v4l2_ctrl_type add:
> >>>>>
> >>>>>         V4L2_CTRL_TYPE_FIXED_POINT =3D 10,
> >>>>>
> >>>>> (10, because it is no longer a compound type).
> >>>>
> >>>> Seems we don't need V4L2_CTRL_TYPE_FIXED_POINT, just use V4L2_TYPE_I=
NTEGER64?
> >>>>
> >>>> The reason I use the 'integer' and 'fractional' is that I want
> >>>> 'integer' to be the normal sample
> >>>> rate, for example 48kHz.  The 'fractional' is the difference with
> >>>> normal sample rate.
> >>>>
> >>>> For example, the rate =3D 47998.12345.  so integer =3D 48000,  fract=
ional=3D -1.87655.
> >>>>
> >>>> So if we use s64 for rate, then in driver need to convert the rate t=
o
> >>>> the closed normal
> >>>> sample rate + fractional.
> >>>
> >>> That wasn't what the documentation said :-)
> >>>
> >>> So this is really two controls: one for the 'normal sample rate' (wha=
tever 'normal'
> >>> means in this context) and the offset to the actual sample rate.
> >>>
> >>> Presumably the 'normal' sample rate is set once, while the offset cha=
nges
> >>> regularly.
> >>>
> >>> But why do you need the 'normal' sample rate? With audio resampling I=
 assume
> >>> you resample from one rate to another, so why do you need a third 'no=
rmal'
> >>> rate?
> >>>
> >>
> >> 'Normal' rate is used to select the prefilter table.
> >>
> >
> > Currently I think we may define
> > V4L2_CID_M2M_AUDIO_SOURCE_RATE
> > V4L2_CID_M2M_AUDIO_DEST_RATE
>
> That makes sense.
>
> > V4L2_CID_M2M_AUDIO_ASRC_RATIO_MOD
>
> OK, can you document this control? Just write it down in the reply, I jus=
t want
> to understand how the integer value you set here is used.
>

It is Q31 value.   It is equal to:
in_rate_new / out_rate_new -  in_rate_old / out_rate_old

Best regards
Wang shengjiu

> Regards,
>
>         Hans
>
> >
> > All of them can be V4L2_CTRL_TYPE_INTEGER.
> >
> > RATIO_MOD was defined in the very beginning version.
> > I think it is better to let users calculate this value.
> >
> > The reason is:
> > if we define the offset for source rate and dest rate in
> > driver separately,  when offset of source rate is set,
> > driver don't know if it needs to wait or not the dest rate
> > offset,  then go to calculate the ratio_mod.
> >
> > best regards
> > wang shengjiu
> >
> >> Best regards
> >> Wang Shengjiu
> >>
> >>> Regards,
> >>>
> >>>         Hans
> >>>
> >>>>
> >>>> best regards
> >>>> wang shengjiu
> >>>>
> >>>>>
> >>>>>>
> >>>>>>       default:
> >>>>>>               return -EINVAL;
> >>>>>> @@ -1868,6 +1870,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struc=
t v4l2_ctrl_handler *hdl,
> >>>>>>       case V4L2_CTRL_TYPE_AREA:
> >>>>>>               elem_size =3D sizeof(struct v4l2_area);
> >>>>>>               break;
> >>>>>> +     case V4L2_CTRL_TYPE_FIXED_POINT:
> >>>>>> +             elem_size =3D sizeof(struct v4l2_ctrl_fixed_point);
> >>>>>> +             break;
> >>>>>>       default:
> >>>>>>               if (type < V4L2_CTRL_COMPOUND_TYPES)
> >>>>>>                       elem_size =3D sizeof(s32);
> >>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/m=
edia/v4l2-core/v4l2-ctrls-defs.c
> >>>>>> index 8696eb1cdd61..d8f232df6b6a 100644
> >>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>>>>> @@ -1602,6 +1602,10 @@ void v4l2_ctrl_fill(u32 id, const char **na=
me, enum v4l2_ctrl_type *type,
> >>>>>>       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
> >>>>>>               *type =3D V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
> >>>>>>               break;
> >>>>>> +     case V4L2_CID_ASRC_SOURCE_RATE:
> >>>>>> +     case V4L2_CID_ASRC_DEST_RATE:
> >>>>>> +             *type =3D V4L2_CTRL_TYPE_FIXED_POINT;
> >>>>>> +             break;
> >>>>>>       default:
> >>>>>>               *type =3D V4L2_CTRL_TYPE_INTEGER;
> >>>>>>               break;
> >>>>>> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls=
.h
> >>>>>> index 59679a42b3e7..645e4cccafc7 100644
> >>>>>> --- a/include/media/v4l2-ctrls.h
> >>>>>> +++ b/include/media/v4l2-ctrls.h
> >>>>>> @@ -56,6 +56,7 @@ struct video_device;
> >>>>>>   * @p_av1_tile_group_entry:  Pointer to an AV1 tile group entry s=
tructure.
> >>>>>>   * @p_av1_frame:             Pointer to an AV1 frame structure.
> >>>>>>   * @p_av1_film_grain:                Pointer to an AV1 film grain=
 structure.
> >>>>>> + * @p_fixed_point:           Pointer to a struct v4l2_ctrl_fixed_=
point.
> >>>>>>   * @p:                               Pointer to a compound value.
> >>>>>>   * @p_const:                 Pointer to a constant compound value=
.
> >>>>>>   */
> >>>>>> @@ -89,6 +90,7 @@ union v4l2_ctrl_ptr {
> >>>>>>       struct v4l2_ctrl_av1_tile_group_entry *p_av1_tile_group_entr=
y;
> >>>>>>       struct v4l2_ctrl_av1_frame *p_av1_frame;
> >>>>>>       struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
> >>>>>> +     struct v4l2_ctrl_fixed_point *p_fixed_point;
> >>>>>>       void *p;
> >>>>>>       const void *p_const;
> >>>>>>  };
> >>>>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/lin=
ux/v4l2-controls.h
> >>>>>> index c3604a0a3e30..91096259e3ea 100644
> >>>>>> --- a/include/uapi/linux/v4l2-controls.h
> >>>>>> +++ b/include/uapi/linux/v4l2-controls.h
> >>>>>> @@ -112,6 +112,8 @@ enum v4l2_colorfx {
> >>>>>>
> >>>>>>  /* last CID + 1 */
> >>>>>>  #define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44=
)
> >>>>>> +#define V4L2_CID_ASRC_SOURCE_RATE            (V4L2_CID_BASE + 45)
> >>>>>> +#define V4L2_CID_ASRC_DEST_RATE                      (V4L2_CID_BA=
SE + 46)
> >>>>>
> >>>>> This patch needs to be split in three parts:
> >>>>>
> >>>>> 1) Add the new M2M_AUDIO control class,
> >>>>> 2) Add the new V4L2_CTRL_TYPE_FIXED_POINT type,
> >>>>> 3) Add the new controls.
> >>>>>
> >>>>> These are all independent changes, so separating them makes it easi=
er to
> >>>>> review.
> >>>>>
> >>>>>>
> >>>>>>  /* USER-class private control IDs */
> >>>>>>
> >>>>>> @@ -3488,4 +3490,15 @@ struct v4l2_ctrl_av1_film_grain {
> >>>>>>  #define V4L2_CID_MPEG_MFC51_BASE        V4L2_CID_CODEC_MFC51_BASE
> >>>>>>  #endif
> >>>>>>
> >>>>>> +/**
> >>>>>> + * struct v4l2_ctrl_fixed_point - fixed point parameter.
> >>>>>> + *
> >>>>>> + * @rate_integer: integer part of fixed point value.
> >>>>>> + * @rate_fractional: fractional part of fixed point value
> >>>>>> + */
> >>>>>> +struct v4l2_ctrl_fixed_point {
> >>>>>> +     __u32 integer;
> >>>>>
> >>>>> __s32?
> >>>>>
> >>>>>> +     __u32 fractional;
> >>>>>> +};
> >>>>>> +
> >>>>>>  #endif
> >>>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/v=
ideodev2.h
> >>>>>> index 2ac7b989394c..3ef32c09c2fa 100644
> >>>>>> --- a/include/uapi/linux/videodev2.h
> >>>>>> +++ b/include/uapi/linux/videodev2.h
> >>>>>> @@ -1888,6 +1888,7 @@ struct v4l2_ext_control {
> >>>>>>               struct v4l2_ctrl_av1_tile_group_entry __user *p_av1_=
tile_group_entry;
> >>>>>>               struct v4l2_ctrl_av1_frame __user *p_av1_frame;
> >>>>>>               struct v4l2_ctrl_av1_film_grain __user *p_av1_film_g=
rain;
> >>>>>> +             struct v4l2_ctrl_fixed_point __user *p_fixed_point;
> >>>>>>               void __user *ptr;
> >>>>>>       };
> >>>>>>  } __attribute__ ((packed));
> >>>>>> @@ -1966,6 +1967,8 @@ enum v4l2_ctrl_type {
> >>>>>>       V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY =3D 0x281,
> >>>>>>       V4L2_CTRL_TYPE_AV1_FRAME            =3D 0x282,
> >>>>>>       V4L2_CTRL_TYPE_AV1_FILM_GRAIN       =3D 0x283,
> >>>>>> +
> >>>>>> +     V4L2_CTRL_TYPE_FIXED_POINT          =3D 0x290,
> >>>>>>  };
> >>>>>>
> >>>>>>  /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
> >>>>>
> >>>>> Regards,
> >>>>>
> >>>>>         Hans
> >>>
>
