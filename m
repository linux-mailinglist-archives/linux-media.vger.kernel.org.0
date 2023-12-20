Return-Path: <linux-media+bounces-2676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C058196CC
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 03:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E995B24981
	for <lists+linux-media@lfdr.de>; Wed, 20 Dec 2023 02:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DFB8489;
	Wed, 20 Dec 2023 02:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KH9vAYFl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F381014AA0
	for <linux-media@vger.kernel.org>; Wed, 20 Dec 2023 02:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-553e36acfbaso277a12.0
        for <linux-media@vger.kernel.org>; Tue, 19 Dec 2023 18:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703039344; x=1703644144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whhw0GLxcm1fn/RsvcHCgHU4JBz+FpX2KpEqar9QQAQ=;
        b=KH9vAYFlch5B142wPn2AJ1tJtI5oAaInmQqnLGE3+3w3jb7ma7iEXTspK+mF8H/TKu
         Z2brZlWxM8pmSaLi/DDaKhNYn2Nu4mMoOnYmkWyrsdkU3gMuIQs9t89Yept7pZMZ9Tsf
         dYOo+qe0MKvX3robEe+DeFgllTmzAobGxRaqNC21IgMOHgtfFx5NyEuW3IbD8lxHFsxY
         F2EsHrHkc/oGk1WYcL334UfIcFMA73cFAQGfXafoqjoTcsynTYl5ek0V3695GgJ2LO99
         Ww9shMf9XCMujHq4U5/7ckMOoAXVIZW/X2Yfd3RFSVTIbdA8ikZyofAdiyX/c0vW1RQ6
         IBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703039344; x=1703644144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whhw0GLxcm1fn/RsvcHCgHU4JBz+FpX2KpEqar9QQAQ=;
        b=o6gYdzhrSHzKcU4ziUQ4cdTSaWQcXX0ZZiJJtrC7cFXK8qe3o1HrUks8RQ3fDIwjAB
         gJHKvVdjgOcDzti+lZoMV5n6A2CNKIaTdQq5qvkHWwESOiZ6AQCLFCvAzXV1RRGFOV+4
         NpgcDJoaPEtcYK+/sX7SBQqPpkjRb3N60SnIJ8PV+/mwaGj31QCa8qs0+pgymNX9m+8M
         FPMk5ldWkEhikaY2QeA9iK/cdM13UefRXksFUzpCZXmXYeQOAv/fehbWciXwJnCZn28V
         L/cW0Yepbjqwx7I3rB3+5PjePhxOdap4DRkzQpZtDj4oQgrWQB+wPETiwmaXU6WkOAvr
         jKoA==
X-Gm-Message-State: AOJu0YxvoWfDcqIXBs88O/yVQX4dmLn+Z10jc/3sKboc8wZxYjo6ZwGe
	Ga6Wlhjr7LKkdpOI+Oofwy/mx4QMsjiheKk5hesbUxjYBd98
X-Google-Smtp-Source: AGHT+IHF5QImIY7SzmNjdmtQ91RL549GCc7yNiGBDLdtw1RcoyzPyh1V9JE6B2UuLvNwVKRKZxj5qEFsb5EquCPZRyw=
X-Received: by 2002:a50:9e09:0:b0:553:62b4:5063 with SMTP id
 z9-20020a509e09000000b0055362b45063mr77784ede.4.1703039343961; Tue, 19 Dec
 2023 18:29:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201071907.3080126-1-yunkec@google.com> <20231201071907.3080126-6-yunkec@google.com>
 <20231208150713.GB22113@pendragon.ideasonboard.com> <CANqU6Fd1W-jcRGEM4ObkGqxNYhuX2KCb-LE1QGuaN_EjsCwFdw@mail.gmail.com>
 <20231218032735.GM5290@pendragon.ideasonboard.com>
In-Reply-To: <20231218032735.GM5290@pendragon.ideasonboard.com>
From: Yunke Cao <yunkec@google.com>
Date: Wed, 20 Dec 2023 11:28:51 +0900
Message-ID: <CANqU6Feo_VmWcN9mDWjp6Tz3Y3OSgQ0mdr7SyEkS5zYHTwosig@mail.gmail.com>
Subject: Re: [PATCH v14 05/11] media: uvcvideo: Add support for compound controls
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Mon, Dec 18, 2023 at 12:27=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Yunke,
>
> On Wed, Dec 13, 2023 at 04:38:40PM +0900, Yunke Cao wrote:
> > On Sat, Dec 9, 2023 at 12:07=E2=80=AFAM Laurent Pinchart wrote:
> > > On Fri, Dec 01, 2023 at 04:18:56PM +0900, Yunke Cao wrote:
> > > > Supports getting/setting current value.
> > > > Supports getting default value.
> > > > Handles V4L2_CTRL_FLAG_NEXT_COMPOUND.
> > >
> > > Please write a better commit message.
> > >
> > > > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > Signed-off-by: Yunke Cao <yunkec@google.com>
> > > > ---
> > > > Changelog since v11:
> > > > - No change.
> > > > Changelog since v10:
> > > > - Rewrite some logic in __uvc_find_control().
> > > > - Remove a duplicate check in __uvc_ctrl_get_compound_cur().
> > > > - Thanks, Daniel!
> > > > Changelog since v9:
> > > > - Make __uvc_ctrl_set_compound() static.
> > > > Changelog since v8:
> > > > - No change.
> > > > Changelog since v7:
> > > > - Fixed comments styles, indentation and a few other style issues.
> > > > - Renamed uvc_g/set_array() to uvc_g/set_compound().
> > > > - Moved size check to __uvc_ctrl_add_mapping().
> > > > - After setting a new value, copy it back to user.
> > > > - In __uvc_ctrl_set_compound(), check size before allocating.
> > > >
> > > >  drivers/media/usb/uvc/uvc_ctrl.c | 179 +++++++++++++++++++++++++++=
----
> > > >  drivers/media/usb/uvc/uvcvideo.h |   4 +
> > > >  2 files changed, 164 insertions(+), 19 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/u=
vc/uvc_ctrl.c
> > > > index 98254b93eb46..aae2480496b7 100644
> > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > @@ -884,6 +884,28 @@ static void uvc_set_le_value(struct uvc_contro=
l_mapping *mapping,
> > > >       }
> > > >  }
> > > >
> > > > +/*
> > > > + * Extract the byte array specified by mapping->offset and mapping=
->data_size
> > > > + * stored at 'data' to the output array 'data_out'.
> > > > + */
> > > > +static int uvc_get_compound(struct uvc_control_mapping *mapping, c=
onst u8 *data,
> > > > +                         u8 *data_out)
> > > > +{
> > > > +     memcpy(data_out, data + mapping->offset / 8, mapping->data_si=
ze / 8);
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +/*
> > > > + * Copy the byte array 'data_in' to the destination specified by m=
apping->offset
> > > > + * and mapping->data_size stored at 'data'.
> > > > + */
> > > > +static int uvc_set_compound(struct uvc_control_mapping *mapping,
> > > > +                         const u8 *data_in, u8 *data)
> > > > +{
> > > > +     memcpy(data + mapping->offset / 8, data_in, mapping->data_siz=
e / 8);
> > > > +     return 0;
> > > > +}
> > > > +
> > >
> > > I may be missing something, but isn't this essentially dead code ? Th=
is
> > > series adds support for a single compound control, with custom get/se=
t
> > > handlers, so these two default handlers will never be called.
> > >
> > > I don't think it makes sense to have default handlers for compound
> > > controls, I don't foresee any use case where a simple mempcy() will d=
o
> > > the right thing.
> >
> > Yes, they are dead code. I thought they would be useful for some
> > controls. I will remove them in v15.
> >
> > > >  static bool
> > > >  uvc_ctrl_mapping_is_compound(const struct uvc_control_mapping *map=
ping)
> > > >  {
> > > > @@ -906,7 +928,7 @@ static int uvc_entity_match_guid(const struct u=
vc_entity *entity,
> > > >
> > > >  static void __uvc_find_control(struct uvc_entity *entity, u32 v4l2=
_id,
> > > >       struct uvc_control_mapping **mapping, struct uvc_control **co=
ntrol,
> > > > -     int next)
> > > > +     int next, int next_compound)
> > > >  {
> > > >       struct uvc_control *ctrl;
> > > >       struct uvc_control_mapping *map;
> > > > @@ -921,14 +943,16 @@ static void __uvc_find_control(struct uvc_ent=
ity *entity, u32 v4l2_id,
> > > >                       continue;
> > > >
> > > >               list_for_each_entry(map, &ctrl->info.mappings, list) =
{
> > > > -                     if ((map->id =3D=3D v4l2_id) && !next) {
> > > > +                     if (map->id =3D=3D v4l2_id && !next && !next_=
compound) {
> > > >                               *control =3D ctrl;
> > > >                               *mapping =3D map;
> > > >                               return;
> > > >                       }
> > > >
> > > >                       if ((*mapping =3D=3D NULL || (*mapping)->id >=
 map->id) &&
> > > > -                         (map->id > v4l2_id) && next) {
> > > > +                         (map->id > v4l2_id) &&
> > > > +                         (uvc_ctrl_mapping_is_compound(map) ?
> > > > +                          next_compound : next)) {
> > > >                               *control =3D ctrl;
> > > >                               *mapping =3D map;
> > > >                       }
> > > > @@ -942,6 +966,7 @@ static struct uvc_control *uvc_find_control(str=
uct uvc_video_chain *chain,
> > > >       struct uvc_control *ctrl =3D NULL;
> > > >       struct uvc_entity *entity;
> > > >       int next =3D v4l2_id & V4L2_CTRL_FLAG_NEXT_CTRL;
> > > > +     int next_compound =3D v4l2_id & V4L2_CTRL_FLAG_NEXT_COMPOUND;
> > > >
> > > >       *mapping =3D NULL;
> > > >
> > > > @@ -950,12 +975,13 @@ static struct uvc_control *uvc_find_control(s=
truct uvc_video_chain *chain,
> > > >
> > > >       /* Find the control. */
> > > >       list_for_each_entry(entity, &chain->entities, chain) {
> > > > -             __uvc_find_control(entity, v4l2_id, mapping, &ctrl, n=
ext);
> > > > -             if (ctrl && !next)
> > > > +             __uvc_find_control(entity, v4l2_id, mapping, &ctrl, n=
ext,
> > > > +                                next_compound);
> > > > +             if (ctrl && !next && !next_compound)
> > > >                       return ctrl;
> > > >       }
> > > >
> > > > -     if (ctrl =3D=3D NULL && !next)
> > > > +     if (!ctrl && !next && !next_compound)
> > > >               uvc_dbg(chain->dev, CONTROL, "Control 0x%08x not foun=
d\n",
> > > >                       v4l2_id);
> > > >
> > > > @@ -1101,12 +1127,59 @@ static int __uvc_ctrl_get_std(struct uvc_vi=
deo_chain *chain,
> > > >       return 0;
> > > >  }
> > > >
> > > > +static int __uvc_ctrl_get_compound(struct uvc_control_mapping *map=
ping,
> > > > +                                struct uvc_control *ctrl,
> > > > +                                int id,
> > > > +                                struct v4l2_ext_control *xctrl)
> > > > +{
> > > > +     u8 size;
> > > > +     u8 *data;
> > > > +     int ret;
> > > > +
> > > > +     size =3D mapping->v4l2_size / 8;
> > > > +     if (xctrl->size < size) {
> > > > +             xctrl->size =3D size;
> > > > +             return -ENOSPC;
> > > > +     }
> > > > +
> > > > +     data =3D kmalloc(size, GFP_KERNEL);
> > > > +     if (!data)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     ret =3D mapping->get_compound(mapping, uvc_ctrl_data(ctrl, id=
), data);
> > > > +     if (ret < 0)
> > > > +             goto out;
> > > > +
> > > > +     ret =3D copy_to_user(xctrl->ptr, data, size) ? -EFAULT : 0;
> > > > +
> > > > +out:
> > > > +     kfree(data);
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int __uvc_ctrl_get_compound_cur(struct uvc_video_chain *cha=
in,
> > > > +                                    struct uvc_control *ctrl,
> > > > +                                    struct uvc_control_mapping *ma=
pping,
> > > > +                                    struct v4l2_ext_control *xctrl=
)
> > > > +{
> > > > +     int ret;
> > > > +
> > > > +     ret =3D __uvc_ctrl_load_cur(chain, ctrl);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     return __uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_C=
URRENT,
> > > > +                                    xctrl);
> > > > +}
> > > > +
> > > >  static int __uvc_query_v4l2_class(struct uvc_video_chain *chain, u=
32 req_id,
> > > >                                 u32 found_id)
> > > >  {
> > > > -     bool find_next =3D req_id & V4L2_CTRL_FLAG_NEXT_CTRL;
> > > >       unsigned int i;
> > > >
> > > > +     bool find_next =3D req_id &
> > > > +             (V4L2_CTRL_FLAG_NEXT_CTRL | V4L2_CTRL_FLAG_NEXT_COMPO=
UND);
> > > > +
> > > >       req_id &=3D V4L2_CTRL_ID_MASK;
> > > >
> > > >       for (i =3D 0; i < ARRAY_SIZE(uvc_control_classes); i++) {
> > > > @@ -1194,7 +1267,7 @@ int uvc_ctrl_is_accessible(struct uvc_video_c=
hain *chain, u32 v4l2_id,
> > > >       }
> > > >
> > > >       __uvc_find_control(ctrl->entity, mapping->master_id, &master_=
map,
> > > > -                        &master_ctrl, 0);
> > > > +                        &master_ctrl, 0, 0);
> > > >
> > > >       if (!master_ctrl || !(master_ctrl->info.flags & UVC_CTRL_FLAG=
_GET_CUR))
> > > >               return 0;
> > > > @@ -1262,7 +1335,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_v=
ideo_chain *chain,
> > > >
> > > >       if (mapping->master_id)
> > > >               __uvc_find_control(ctrl->entity, mapping->master_id,
> > > > -                                &master_map, &master_ctrl, 0);
> > > > +                                &master_map, &master_ctrl, 0, 0);
> > > >       if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_G=
ET_CUR)) {
> > > >               s32 val =3D 0;
> > > >               int ret;
> > > > @@ -1278,6 +1351,15 @@ static int __uvc_query_v4l2_ctrl(struct uvc_=
video_chain *chain,
> > > >                               v4l2_ctrl->flags |=3D V4L2_CTRL_FLAG_=
INACTIVE;
> > > >       }
> > > >
> > > > +     if (v4l2_ctrl->type >=3D V4L2_CTRL_COMPOUND_TYPES) {
> > > > +             v4l2_ctrl->flags |=3D V4L2_CTRL_FLAG_HAS_PAYLOAD;
> > > > +             v4l2_ctrl->default_value =3D 0;
> > > > +             v4l2_ctrl->minimum =3D 0;
> > > > +             v4l2_ctrl->maximum =3D 0;
> > > > +             v4l2_ctrl->step =3D 0;
> > > > +             return 0;
> > > > +     }
> > > > +
> > > >       if (!ctrl->cached) {
> > > >               int ret =3D uvc_ctrl_populate_cache(chain, ctrl);
> > > >               if (ret < 0)
> > > > @@ -1533,7 +1615,7 @@ static void uvc_ctrl_send_slave_event(struct =
uvc_video_chain *chain,
> > > >       u32 changes =3D V4L2_EVENT_CTRL_CH_FLAGS;
> > > >       s32 val =3D 0;
> > > >
> > > > -     __uvc_find_control(master->entity, slave_id, &mapping, &ctrl,=
 0);
> > > > +     __uvc_find_control(master->entity, slave_id, &mapping, &ctrl,=
 0, 0);
> > > >       if (ctrl =3D=3D NULL)
> > > >               return;
> > > >
> > > > @@ -1843,7 +1925,7 @@ static int uvc_ctrl_find_ctrl_idx(struct uvc_=
entity *entity,
> > > >
> > > >       for (i =3D 0; i < ctrls->count; i++) {
> > > >               __uvc_find_control(entity, ctrls->controls[i].id, &ma=
pping,
> > > > -                                &ctrl_found, 0);
> > > > +                                &ctrl_found, 0, 0);
> > > >               if (uvc_control =3D=3D ctrl_found)
> > > >                       return i;
> > > >       }
> > > > @@ -1891,7 +1973,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chai=
n,
> > > >               return -EINVAL;
> > > >
> > > >       if (uvc_ctrl_mapping_is_compound(mapping))
> > > > -             return -EINVAL;
> > > > +             return __uvc_ctrl_get_compound_cur(chain, ctrl, mappi=
ng, xctrl);
> > > >       else
> > > >               return __uvc_ctrl_get_std(chain, ctrl, mapping, &xctr=
l->value);
> > > >  }
> > > > @@ -1912,6 +1994,22 @@ static int __uvc_ctrl_get_boundary_std(struc=
t uvc_video_chain *chain,
> > > >       return 0;
> > > >  }
> > > >
> > > > +static int __uvc_ctrl_get_boundary_compound(struct uvc_video_chain=
 *chain,
> > > > +                                         struct uvc_control *ctrl,
> > > > +                                         struct uvc_control_mappin=
g *mapping,
> > > > +                                         struct v4l2_ext_control *=
xctrl)
> > > > +{
> > > > +     int ret;
> > > > +
> > > > +     if (!ctrl->cached) {
> > > > +             ret =3D uvc_ctrl_populate_cache(chain, ctrl);
> > > > +             if (ret < 0)
> > > > +                     return ret;
> > > > +     }
> > > > +
> > > > +     return __uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_D=
EF, xctrl);
> > > > +}
> > > > +
> > > >  int uvc_ctrl_get_boundary(struct uvc_video_chain *chain,
> > > >                         struct v4l2_ext_control *xctrl)
> > > >  {
> > > > @@ -1929,7 +2027,8 @@ int uvc_ctrl_get_boundary(struct uvc_video_ch=
ain *chain,
> > > >       }
> > > >
> > > >       if (uvc_ctrl_mapping_is_compound(mapping))
> > > > -             ret =3D -EINVAL;
> > > > +             ret =3D __uvc_ctrl_get_boundary_compound(chain, ctrl,=
 mapping,
> > > > +                                                    xctrl);
> > > >       else
> > > >               ret =3D __uvc_ctrl_get_boundary_std(chain, ctrl, mapp=
ing, xctrl);
> > > >
> > > > @@ -1938,6 +2037,34 @@ int uvc_ctrl_get_boundary(struct uvc_video_c=
hain *chain,
> > > >       return ret;
> > > >  }
> > > >
> > > > +static int __uvc_ctrl_set_compound(struct uvc_control_mapping *map=
ping,
> > > > +                                struct v4l2_ext_control *xctrl,
> > > > +                                struct uvc_control *ctrl)
> > > > +{
> > > > +     u8 *data;
> > > > +     int ret;
> > > > +
> > > > +     if (xctrl->size !=3D mapping->v4l2_size / 8)
> > > > +             return -EINVAL;
> > > > +
> > > > +     data =3D kmalloc(xctrl->size, GFP_KERNEL);
> > > > +     if (!data)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     ret =3D copy_from_user(data, xctrl->ptr, xctrl->size);
> > > > +     if (ret < 0)
> > > > +             goto out;
> > > > +
> > > > +     ret =3D mapping->set_compound(mapping, data,
> > > > +                     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> > > > +
> > > > +     __uvc_ctrl_get_compound(mapping, ctrl, UVC_CTRL_DATA_CURRENT,=
 xctrl);
> > >
> > > Why do you need to call __uvc_ctrl_get_compound() here ?
> >
> > I was trying to copy the clamped control value back to the user.
> > I guess we should do it in uvc_ctrl_set() after the refactor.
>
> I think the code would be easier to understand that way, yes.
>
> > > > +
> > > > +out:
> > > > +     kfree(data);
> > > > +     return ret;
> > > > +}
> > > > +
> > > >  int uvc_ctrl_set(struct uvc_fh *handle,
> > > >       struct v4l2_ext_control *xctrl)
> > > >  {
> > > > @@ -2052,13 +2179,14 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> > > >                      ctrl->info.size);
> > > >       }
> > > >
> > > > -     if (uvc_ctrl_mapping_is_compound(mapping))
> > > > -             return -EINVAL;
> > > > -     else
> > > > +     if (uvc_ctrl_mapping_is_compound(mapping)) {
> > > > +             ret =3D __uvc_ctrl_set_compound(mapping, xctrl, ctrl)=
;
> > > > +             if (ret < 0)
> > > > +                     return ret;
> > > > +     } else
> > > >               mapping->set(mapping, value,
> > > >                            uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURREN=
T));
> > >
> > > I really don't like how handling of compound controls is scattered
> > > everywhere :-( That makes the code difficult to read, and thus more
> > > error-prone.
> > >
> > > Could this be refactored to simplify the implementation ? In particul=
ar,
> > > I'm thinking about
> > >
> > > - Moving the copy_from_user() and copy_to_user() towards the top of t=
he
> > >   call stack, directly in uvc_ctrl_get(), uvc_ctrl_get_boundary() and
> > >   uvc_ctrl_set()
> >
> > Sorry, I'm not sure I understand it.
> > For the uvc_ctrl_get() case, do you mean we should get rid of
> > __uvc_ctrl_get_compound_cur()
> > and call __uvc_ctrl_load_cur(), mapping->get() and copy_to_user()
> > directly in uvc_ctrl_get()?
>
> What I meant is that the copy_from_user() and copy_to_user() calls are
> hidden deep in the call stack. Would it be possible to move
> copy_to_user() to the end of uvc_ctrl_get() and uvc_ctrl_set(), to avoid
> dealing with __user pointers anywhere but at the top level ? I don't
> mind keeping __uvc_ctrl_get_compound_cur() if it makes sense.
>
Ah, I see. Let me give it a try.

Thanks!
Yunke

> > > - Merging the .[gs]et() and .[gs]et_compound() functions (see below)
> > >
> > > - Moving the value clamping from uvc_set_compound_rect() to
> > >   uvc_ctrl_set(), with the rest of the clamping code
> > >
> > > >
> > > > -
> > > >       if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> > > >               ctrl->handle =3D handle;
> > > >
> > > > @@ -2468,10 +2596,23 @@ static int __uvc_ctrl_add_mapping(struct uv=
c_video_chain *chain,
> > > >                       goto err_nomem;
> > > >       }
> > > >
> > > > -     if (map->get =3D=3D NULL)
> > > > +     if (uvc_ctrl_mapping_is_compound(map)) {
> > > > +             if (map->data_size !=3D map->v4l2_size)
> > > > +                     return -EINVAL;
> > >
> > > If the two values have to be the same, why do we have two fields ?
> > >
> > > > +
> > > > +             /* Only supports byte-aligned data. */
> > > > +             if (WARN_ON(map->offset % 8 || map->data_size % 8))
> > > > +                     return -EINVAL;
> > > > +     }
> > > > +
> > > > +     if (!map->get && !uvc_ctrl_mapping_is_compound(map))
> > > >               map->get =3D uvc_get_le_value;
> > > > -     if (map->set =3D=3D NULL)
> > > > +     if (!map->set && !uvc_ctrl_mapping_is_compound(map))
> > > >               map->set =3D uvc_set_le_value;
> > > > +     if (!map->get_compound && uvc_ctrl_mapping_is_compound(map))
> > > > +             map->get_compound =3D uvc_get_compound;
> > > > +     if (!map->set_compound && uvc_ctrl_mapping_is_compound(map))
> > > > +             map->set_compound =3D uvc_set_compound;
> > > >
> > > >       for (i =3D 0; i < ARRAY_SIZE(uvc_control_classes); i++) {
> > > >               if (V4L2_CTRL_ID2WHICH(uvc_control_classes[i]) =3D=3D
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/u=
vc/uvcvideo.h
> > > > index 7bc41270ed94..11805b729c22 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -129,8 +129,12 @@ struct uvc_control_mapping {
> > > >
> > > >       s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
> > > >                  const u8 *data);
> > > > +     int (*get_compound)(struct uvc_control_mapping *mapping, cons=
t u8 *data,
> > > > +                         u8 *data_out);
> > > >       void (*set)(struct uvc_control_mapping *mapping, s32 value,
> > > >                   u8 *data);
> > > > +     int (*set_compound)(struct uvc_control_mapping *mapping, cons=
t u8 *data_in,
> > > > +                         u8 *data);
> > >
> > > Instead of adding new functions, I think we could modify the existing
> > > .get() and .set() handlers to be usable for compound controls.
> > >
> > >         int (*get)(struct uvc_control_mapping *mapping, u8 query,
> > >                    const u8 *data_in, void *data_out);
> > >         void (*set)(struct uvc_control_mapping *mapping, const void *=
data_in,
> > >                     u8 *data_out);
> > >
> > > For additional safety, you could pass the size of the void * buffer t=
o
> > > the functions.
> > >
> > > >  };
> > > >
> > > >  struct uvc_control {
>
> --
> Regards,
>
> Laurent Pinchart

