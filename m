Return-Path: <linux-media+bounces-2289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7734C810B9E
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 08:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF0CCB213C9
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 07:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF28C199A7;
	Wed, 13 Dec 2023 07:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="evABdSB7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEACDBD
	for <linux-media@vger.kernel.org>; Tue, 12 Dec 2023 23:38:53 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c3963f9fcso26625e9.1
        for <linux-media@vger.kernel.org>; Tue, 12 Dec 2023 23:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702453132; x=1703057932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLWJ1nJJMwbwhtoKkhTWoCIMLBpFKkGiZcm1cGNRmTY=;
        b=evABdSB7tFAFc8NX29Klitt61qvUdwnTo9FBI6ASdxR/4+d0JJpqBrFS+rGNSROJbP
         KhjnSd7VQIsthOyxNl1cZTBzpI9NXn9KiQkBfWmIbSNdSiYi3+AzmfyQBEP+Al+zPe7V
         tc9W4CLYtuuFI4JW2LoBS4arRW/RBy/IxBai5IsCuEXNO83SovRN1H2hjvP7MUhKBpV4
         +64Zl/kz0iV2/0WaaDMEI34/tJ2I8g9ecgRFvf0bZX/HYRy0nBwOCL2JwNGzA5uKUbES
         oJDX3IgrZuikq6hz61R9dhmGMLFJIY31CaQRs5ehh+lPlEIt/EmUnLTioVOLlYMH8LFi
         ny6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702453132; x=1703057932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLWJ1nJJMwbwhtoKkhTWoCIMLBpFKkGiZcm1cGNRmTY=;
        b=LPGwj1saVyDKqL1PXDpkGcj5d33ogf0ak1a8C/69p6cPFsGza3dzWGPAO/7GKRiRKY
         7gUQZmN4KNz2bWSSyizkyB4Lcj7dE6RFJai6bEYtCLanhhnECIN4w7NGpyX2/OfHPgZh
         PJBgL5QI8gQqeVmyikFrhZSVTNp9fVBaBj/SlTig32yCp64JdGZpUZ4BbhLoQA4ri6T4
         OOP0xGPzr9ZR8OmBcaIUVOpG4q0hsF/vuGnLt78kHeCyfRg01M3qX41rUDWv9QYlpMjL
         nfmiN7L4L0stCDdvAA4zNDVVI1YeJPmSmluKCM4lbZAK/N5/Koqw4pd7qcDHQOT6RVSo
         +qRQ==
X-Gm-Message-State: AOJu0YzVKpirlDmiBipG8140e5cnNi8hptq3WojpgnvflCjaOZ6ceKxm
	cKJRKaOrBMGUUvU3SeETICFUIapRUUbRCAZ4PNWHjg==
X-Google-Smtp-Source: AGHT+IFxC9E6JjPH5SHnU9ewmgq+zFgtQ3bKu5lh/zTi6m9kLcyj9oKG60F5TKwc7lU78hxLmolWFPATDWZmpFXwwbA=
X-Received: by 2002:a05:600c:3648:b0:3f7:3e85:36a with SMTP id
 y8-20020a05600c364800b003f73e85036amr374246wmq.7.1702453131929; Tue, 12 Dec
 2023 23:38:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201071907.3080126-1-yunkec@google.com> <20231201071907.3080126-6-yunkec@google.com>
 <20231208150713.GB22113@pendragon.ideasonboard.com>
In-Reply-To: <20231208150713.GB22113@pendragon.ideasonboard.com>
From: Yunke Cao <yunkec@google.com>
Date: Wed, 13 Dec 2023 16:38:40 +0900
Message-ID: <CANqU6Fd1W-jcRGEM4ObkGqxNYhuX2KCb-LE1QGuaN_EjsCwFdw@mail.gmail.com>
Subject: Re: [PATCH v14 05/11] media: uvcvideo: Add support for compound controls
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review!

On Sat, Dec 9, 2023 at 12:07=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Yunke,
>
> Thank you for the patch.
>
> On Fri, Dec 01, 2023 at 04:18:56PM +0900, Yunke Cao wrote:
> > Supports getting/setting current value.
> > Supports getting default value.
> > Handles V4L2_CTRL_FLAG_NEXT_COMPOUND.
>
> Please write a better commit message.
>
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > ---
> > Changelog since v11:
> > - No change.
> > Changelog since v10:
> > - Rewrite some logic in __uvc_find_control().
> > - Remove a duplicate check in __uvc_ctrl_get_compound_cur().
> > - Thanks, Daniel!
> > Changelog since v9:
> > - Make __uvc_ctrl_set_compound() static.
> > Changelog since v8:
> > - No change.
> > Changelog since v7:
> > - Fixed comments styles, indentation and a few other style issues.
> > - Renamed uvc_g/set_array() to uvc_g/set_compound().
> > - Moved size check to __uvc_ctrl_add_mapping().
> > - After setting a new value, copy it back to user.
> > - In __uvc_ctrl_set_compound(), check size before allocating.
> >
> >  drivers/media/usb/uvc/uvc_ctrl.c | 179 +++++++++++++++++++++++++++----
> >  drivers/media/usb/uvc/uvcvideo.h |   4 +
> >  2 files changed, 164 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/u=
vc_ctrl.c
> > index 98254b93eb46..aae2480496b7 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -884,6 +884,28 @@ static void uvc_set_le_value(struct uvc_control_ma=
pping *mapping,
> >       }
> >  }
> >
> > +/*
> > + * Extract the byte array specified by mapping->offset and mapping->da=
ta_size
> > + * stored at 'data' to the output array 'data_out'.
> > + */
> > +static int uvc_get_compound(struct uvc_control_mapping *mapping, const=
 u8 *data,
> > +                         u8 *data_out)
> > +{
> > +     memcpy(data_out, data + mapping->offset / 8, mapping->data_size /=
 8);
> > +     return 0;
> > +}
> > +
> > +/*
> > + * Copy the byte array 'data_in' to the destination specified by mappi=
ng->offset
> > + * and mapping->data_size stored at 'data'.
> > + */
> > +static int uvc_set_compound(struct uvc_control_mapping *mapping,
> > +                         const u8 *data_in, u8 *data)
> > +{
> > +     memcpy(data + mapping->offset / 8, data_in, mapping->data_size / =
8);
> > +     return 0;
> > +}
> > +
>
> I may be missing something, but isn't this essentially dead code ? This
> series adds support for a single compound control, with custom get/set
> handlers, so these two default handlers will never be called.
>
> I don't think it makes sense to have default handlers for compound
> controls, I don't foresee any use case where a simple mempcy() will do
> the right thing.
>

Yes, they are dead code. I thought they would be useful for some
controls. I will remove them in v15.

> >  static bool
> >  uvc_ctrl_mapping_is_compound(const struct uvc_control_mapping *mapping=
)
> >  {
> > @@ -906,7 +928,7 @@ static int uvc_entity_match_guid(const struct uvc_e=
ntity *entity,
> >
> >  static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2_id,
> >       struct uvc_control_mapping **mapping, struct uvc_control **contro=
l,
> > -     int next)
> > +     int next, int next_compound)
> >  {
> >       struct uvc_control *ctrl;
> >       struct uvc_control_mapping *map;
> > @@ -921,14 +943,16 @@ static void __uvc_find_control(struct uvc_entity =
*entity, u32 v4l2_id,
> >                       continue;
> >
> >               list_for_each_entry(map, &ctrl->info.mappings, list) {
> > -                     if ((map->id =3D=3D v4l2_id) && !next) {
> > +                     if (map->id =3D=3D v4l2_id && !next && !next_comp=
ound) {
> >                               *control =3D ctrl;
> >                               *mapping =3D map;
> >                               return;
> >                       }
> >
> >                       if ((*mapping =3D=3D NULL || (*mapping)->id > map=
->id) &&
> > -                         (map->id > v4l2_id) && next) {
> > +                         (map->id > v4l2_id) &&
> > +                         (uvc_ctrl_mapping_is_compound(map) ?
> > +                          next_compound : next)) {
> >                               *control =3D ctrl;
> >                               *mapping =3D map;
> >                       }
> > @@ -942,6 +966,7 @@ static struct uvc_control *uvc_find_control(struct =
uvc_video_chain *chain,
> >       struct uvc_control *ctrl =3D NULL;
> >       struct uvc_entity *entity;
> >       int next =3D v4l2_id & V4L2_CTRL_FLAG_NEXT_CTRL;
> > +     int next_compound =3D v4l2_id & V4L2_CTRL_FLAG_NEXT_COMPOUND;
> >
> >       *mapping =3D NULL;
> >
> > @@ -950,12 +975,13 @@ static struct uvc_control *uvc_find_control(struc=
t uvc_video_chain *chain,
> >
> >       /* Find the control. */
> >       list_for_each_entry(entity, &chain->entities, chain) {
> > -             __uvc_find_control(entity, v4l2_id, mapping, &ctrl, next)=
;
> > -             if (ctrl && !next)
> > +             __uvc_find_control(entity, v4l2_id, mapping, &ctrl, next,
> > +                                next_compound);
> > +             if (ctrl && !next && !next_compound)
> >                       return ctrl;
> >       }
> >
> > -     if (ctrl =3D=3D NULL && !next)
> > +     if (!ctrl && !next && !next_compound)
> >               uvc_dbg(chain->dev, CONTROL, "Control 0x%08x not found\n"=
,
> >                       v4l2_id);
> >
> > @@ -1101,12 +1127,59 @@ static int __uvc_ctrl_get_std(struct uvc_video_=
chain *chain,
> >       return 0;
> >  }
> >
> > +static int __uvc_ctrl_get_compound(struct uvc_control_mapping *mapping=
,
> > +                                struct uvc_control *ctrl,
> > +                                int id,
> > +                                struct v4l2_ext_control *xctrl)
> > +{
> > +     u8 size;
> > +     u8 *data;
> > +     int ret;
> > +
> > +     size =3D mapping->v4l2_size / 8;
> > +     if (xctrl->size < size) {
> > +             xctrl->size =3D size;
> > +             return -ENOSPC;
> > +     }
> > +
> > +     data =3D kmalloc(size, GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     ret =3D mapping->get_compound(mapping, uvc_ctrl_data(ctrl, id), d=
ata);
> > +     if (ret < 0)
> > +             goto out;
> > +
> > +     ret =3D copy_to_user(xctrl->ptr, data, size) ? -EFAULT : 0;
> > +
> > +out:
> > +     kfree(data);
> > +     return ret;
> > +}
> > +
> > +static int __uvc_ctrl_get_compound_cur(struct uvc_video_chain *chain,
> > +                                    struct uvc_control *ctrl,
> > +                                    struct uvc_control_mapping *mappin=
g,
> > +                                    struct v4l2_ext_control *xctrl)
> > +{
> > +     int ret;
> > +
> > +     ret =3D __uvc_ctrl_load_cur(chain, ctrl);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return __uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_CURRE=
NT,
> > +                                    xctrl);
> > +}
> > +
> >  static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u32 r=
eq_id,
> >                                 u32 found_id)
> >  {
> > -     bool find_next =3D req_id & V4L2_CTRL_FLAG_NEXT_CTRL;
> >       unsigned int i;
> >
> > +     bool find_next =3D req_id &
> > +             (V4L2_CTRL_FLAG_NEXT_CTRL | V4L2_CTRL_FLAG_NEXT_COMPOUND)=
;
> > +
> >       req_id &=3D V4L2_CTRL_ID_MASK;
> >
> >       for (i =3D 0; i < ARRAY_SIZE(uvc_control_classes); i++) {
> > @@ -1194,7 +1267,7 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain=
 *chain, u32 v4l2_id,
> >       }
> >
> >       __uvc_find_control(ctrl->entity, mapping->master_id, &master_map,
> > -                        &master_ctrl, 0);
> > +                        &master_ctrl, 0, 0);
> >
> >       if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG_GET=
_CUR))
> >               return 0;
> > @@ -1262,7 +1335,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video=
_chain *chain,
> >
> >       if (mapping->master_id)
> >               __uvc_find_control(ctrl->entity, mapping->master_id,
> > -                                &master_map, &master_ctrl, 0);
> > +                                &master_map, &master_ctrl, 0, 0);
> >       if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_C=
UR)) {
> >               s32 val =3D 0;
> >               int ret;
> > @@ -1278,6 +1351,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_vide=
o_chain *chain,
> >                               v4l2_ctrl->flags |=3D V4L2_CTRL_FLAG_INAC=
TIVE;
> >       }
> >
> > +     if (v4l2_ctrl->type >=3D V4L2_CTRL_COMPOUND_TYPES) {
> > +             v4l2_ctrl->flags |=3D V4L2_CTRL_FLAG_HAS_PAYLOAD;
> > +             v4l2_ctrl->default_value =3D 0;
> > +             v4l2_ctrl->minimum =3D 0;
> > +             v4l2_ctrl->maximum =3D 0;
> > +             v4l2_ctrl->step =3D 0;
> > +             return 0;
> > +     }
> > +
> >       if (!ctrl->cached) {
> >               int ret =3D uvc_ctrl_populate_cache(chain, ctrl);
> >               if (ret < 0)
> > @@ -1533,7 +1615,7 @@ static void uvc_ctrl_send_slave_event(struct uvc_=
video_chain *chain,
> >       u32 changes =3D V4L2_EVENT_CTRL_CH_FLAGS;
> >       s32 val =3D 0;
> >
> > -     __uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0);
> > +     __uvc_find_control(master->entity, slave_id, &mapping, &ctrl, 0, =
0);
> >       if (ctrl =3D=3D NULL)
> >               return;
> >
> > @@ -1843,7 +1925,7 @@ static int uvc_ctrl_find_ctrl_idx(struct uvc_enti=
ty *entity,
> >
> >       for (i =3D 0; i < ctrls->count; i++) {
> >               __uvc_find_control(entity, ctrls->controls[i].id, &mappin=
g,
> > -                                &ctrl_found, 0);
> > +                                &ctrl_found, 0, 0);
> >               if (uvc_control =3D=3D ctrl_found)
> >                       return i;
> >       }
> > @@ -1891,7 +1973,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain,
> >               return -EINVAL;
> >
> >       if (uvc_ctrl_mapping_is_compound(mapping))
> > -             return -EINVAL;
> > +             return __uvc_ctrl_get_compound_cur(chain, ctrl, mapping, =
xctrl);
> >       else
> >               return __uvc_ctrl_get_std(chain, ctrl, mapping, &xctrl->v=
alue);
> >  }
> > @@ -1912,6 +1994,22 @@ static int __uvc_ctrl_get_boundary_std(struct uv=
c_video_chain *chain,
> >       return 0;
> >  }
> >
> > +static int __uvc_ctrl_get_boundary_compound(struct uvc_video_chain *ch=
ain,
> > +                                         struct uvc_control *ctrl,
> > +                                         struct uvc_control_mapping *m=
apping,
> > +                                         struct v4l2_ext_control *xctr=
l)
> > +{
> > +     int ret;
> > +
> > +     if (!ctrl->cached) {
> > +             ret =3D uvc_ctrl_populate_cache(chain, ctrl);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
> > +     return __uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_DEF, =
xctrl);
> > +}
> > +
> >  int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
> >                         struct v4l2_ext_control *xctrl)
> >  {
> > @@ -1929,7 +2027,8 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain =
*chain,
> >       }
> >
> >       if (uvc_ctrl_mapping_is_compound(mapping))
> > -             ret =3D -EINVAL;
> > +             ret =3D __uvc_ctrl_get_boundary_compound(chain, ctrl, map=
ping,
> > +                                                    xctrl);
> >       else
> >               ret =3D __uvc_ctrl_get_boundary_std(chain, ctrl, mapping,=
 xctrl);
> >
> > @@ -1938,6 +2037,34 @@ int uvc_ctrl_get_boundary(struct uvc_video_chain=
 *chain,
> >       return ret;
> >  }
> >
> > +static int __uvc_ctrl_set_compound(struct uvc_control_mapping *mapping=
,
> > +                                struct v4l2_ext_control *xctrl,
> > +                                struct uvc_control *ctrl)
> > +{
> > +     u8 *data;
> > +     int ret;
> > +
> > +     if (xctrl->size !=3D mapping->v4l2_size / 8)
> > +             return -EINVAL;
> > +
> > +     data =3D kmalloc(xctrl->size, GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     ret =3D copy_from_user(data, xctrl->ptr, xctrl->size);
> > +     if (ret < 0)
> > +             goto out;
> > +
> > +     ret =3D mapping->set_compound(mapping, data,
> > +                     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> > +
> > +     __uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_CURRENT, xct=
rl);
>
> Why do you need to call __uvc_ctrl_get_compound() here ?
>

I was trying to copy the clamped control value back to the user.
I guess we should do it in uvc_ctrl_set() after the refactor.

> > +
> > +out:
> > +     kfree(data);
> > +     return ret;
> > +}
> > +
> >  int uvc_ctrl_set(struct uvc_fh *handle,
> >       struct v4l2_ext_control *xctrl)
> >  {
> > @@ -2052,13 +2179,14 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >                      ctrl->info.size);
> >       }
> >
> > -     if (uvc_ctrl_mapping_is_compound(mapping))
> > -             return -EINVAL;
> > -     else
> > +     if (uvc_ctrl_mapping_is_compound(mapping)) {
> > +             ret =3D __uvc_ctrl_set_compound(mapping, xctrl, ctrl);
> > +             if (ret < 0)
> > +                     return ret;
> > +     } else
> >               mapping->set(mapping, value,
> >                            uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
>
> I really don't like how handling of compound controls is scattered
> everywhere :-( That makes the code difficult to read, and thus more
> error-prone.
>
> Could this be refactored to simplify the implementation ? In particular,
> I'm thinking about
>
> - Moving the copy_from_user() and copy_to_user() towards the top of the
>   call stack, directly in uvc_ctrl_get(), uvc_ctrl_get_boundary() and
>   uvc_ctrl_set()
>

Sorry, I'm not sure I understand it.
For the uvc_ctrl_get() case, do you mean we should get rid of
__uvc_ctrl_get_compound_cur()
and call __uvc_ctrl_load_cur(), mapping->get() and copy_to_user()
directly in uvc_ctrl_get()?

Best,
Yunke


> - Merging the .[gs]et() and .[gs]et_compound() functions (see below)
>
> - Moving the value clamping from uvc_set_compound_rect() to
>   uvc_ctrl_set(), with the rest of the clamping code
>
> >
> > -
> >       if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> >               ctrl->handle =3D handle;
> >
> > @@ -2468,10 +2596,23 @@ static int __uvc_ctrl_add_mapping(struct uvc_vi=
deo_chain *chain,
> >                       goto err_nomem;
> >       }
> >
> > -     if (map->get =3D=3D NULL)
> > +     if (uvc_ctrl_mapping_is_compound(map)) {
> > +             if (map->data_size !=3D map->v4l2_size)
> > +                     return -EINVAL;
>
> If the two values have to be the same, why do we have two fields ?
>
> > +
> > +             /* Only supports byte-aligned data. */
> > +             if (WARN_ON(map->offset % 8 || map->data_size % 8))
> > +                     return -EINVAL;
> > +     }
> > +
> > +     if (!map->get && !uvc_ctrl_mapping_is_compound(map))
> >               map->get =3D uvc_get_le_value;
> > -     if (map->set =3D=3D NULL)
> > +     if (!map->set && !uvc_ctrl_mapping_is_compound(map))
> >               map->set =3D uvc_set_le_value;
> > +     if (!map->get_compound && uvc_ctrl_mapping_is_compound(map))
> > +             map->get_compound =3D uvc_get_compound;
> > +     if (!map->set_compound && uvc_ctrl_mapping_is_compound(map))
> > +             map->set_compound =3D uvc_set_compound;
> >
> >       for (i =3D 0; i < ARRAY_SIZE(uvc_control_classes); i++) {
> >               if (V4L2_CTRL_ID2WHICH(uvc_control_classes[i]) =3D=3D
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/u=
vcvideo.h
> > index 7bc41270ed94..11805b729c22 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -129,8 +129,12 @@ struct uvc_control_mapping {
> >
> >       s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
> >                  const u8 *data);
> > +     int (*get_compound)(struct uvc_control_mapping *mapping, const u8=
 *data,
> > +                         u8 *data_out);
> >       void (*set)(struct uvc_control_mapping *mapping, s32 value,
> >                   u8 *data);
> > +     int (*set_compound)(struct uvc_control_mapping *mapping, const u8=
 *data_in,
> > +                         u8 *data);
>
> Instead of adding new functions, I think we could modify the existing
> .get() and .set() handlers to be usable for compound controls.
>
>         int (*get)(struct uvc_control_mapping *mapping, u8 query,
>                    const u8 *data_in, void *data_out);
>         void (*set)(struct uvc_control_mapping *mapping, const void *data=
_in,
>                     u8 *data_out);
>
> For additional safety, you could pass the size of the void * buffer to
> the functions.
>
> >  };
> >
> >  struct uvc_control {
>
> --
> Regards,
>
> Laurent Pinchart

