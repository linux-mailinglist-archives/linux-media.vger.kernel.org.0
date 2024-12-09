Return-Path: <linux-media+bounces-22857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C820E9E8DD2
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 09:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 842C4281276
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 08:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA9D215708;
	Mon,  9 Dec 2024 08:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CDSUwvFY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B76A2156E4
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 08:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733734244; cv=none; b=WQ0MxR5cokm5oRX9apUl5oTo8yRmjzETlWftyNqoB+DvRytBiOnZ0DzoDVhyyFENmTmgnkm8LdOokq7s+Er11WeOPW+x+isPvkAE5FLqrxDwABPLs8b1kUM+zBqqR16XGd/62eC00XbyjmHkLgraOe8zdA+CH88VhgJiv4dglSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733734244; c=relaxed/simple;
	bh=0CnSKW5mh5z1zK8Fctao7D+gl7B3VqHqOZ2nJ7WPLkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Stpdn1m++LBcqD4Q4JTm5xOYAu2ilvy1Sz402E920dJVYwhrzHFxOHMcz1nHPK5WTdILd85Fuk5n3VHryY7M633/oolvSSIiXpCkL2HpTcMHZ4stIfyCRmnGV1pUChMjehMhNIgHSq9PZ3Y4r7xX4UMiDYk6wKULx7+hbhazvsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CDSUwvFY; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6ef66fd2183so36668597b3.1
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 00:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733734242; x=1734339042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqYIk8AFpShAW12PLaEd8+eoNby3AuBsY18Mk1gxdF0=;
        b=CDSUwvFY+v/6kv2NIMeP7LbBeZM/zEhrv4zpb5nRdUxydKzq13f7UVNE3HQdfhQaAF
         irYGauZfybGBzvrDKZ7LiCAAOOOofjpSC0wdIMxKGFyNZ1FubTC4NsRlVXN2+oo+siTm
         lIiOu68Lx9t2h7NRYn8Olvf0gvioMvCZvo1zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733734242; x=1734339042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqYIk8AFpShAW12PLaEd8+eoNby3AuBsY18Mk1gxdF0=;
        b=eIt9/ayvSEvzxOQVVgm1RJMdseFi802b/zNXyxsNI811PqenY8zi0k9ciSKJGKX7EX
         +kS4jX4AMQMAhTQlNbn/DMQweEjKpeunnChBRZ1hyqJg4WSxhNqcIPE7/3/NuedjJMl9
         o60QMzlAyah6zJRZBGBS4V6RI8e72YPub/QbwE7D7LNkWFQSn3DGnurnYUmYKEuFCtxf
         QNTnigFBU7VLTUb0hGOEhD/97UwcaTV4iwJ+VfIAr8hiRLZvBW+5iFEjmr9JCLSfeYas
         eKQTYzl/tchXGLM9rwPOuAPgCe6q/RSJaJ2mzOUMc3lOod3WdvVO5v/ahrG5nXULfemO
         slIg==
X-Forwarded-Encrypted: i=1; AJvYcCVGFQs24zxR3xjIojOZ35Nsa5uRFT9MoKcMMc1GMJShMLw0xDyIcY198JIL2jFF2blz+z6GcGKGAGdkmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx996rmfZaWR7OEqTP8K5pXlbJILtr0L2BFqyGS5LKATNqsEdge
	AjBN6uCGriA+mK0JvdNZ2BdtXKnA93EE2EEEaXNaxWRIf/HZFMhNGW1Zcvxs1HoQt/dQ9hzaFXr
	F+Bj0sC0EVMJYj1rnviy4GobuV9Mns/lrEyvi
X-Gm-Gg: ASbGncv3IZx9gnlgmZ3cxnAhYZKGfKyWj/Zce6vPuUx6oMFZAEFkJi82uUyJ0BzuZKl
	tv95TAvnprWEmFd5jGsc+doVIE+WnKGk=
X-Google-Smtp-Source: AGHT+IHC1UoQ/MOloCs3wI065OcljyeG2uL/5Z1iWZY7OrxiZ/U4OR3SzAyanwZ0VoVzI8OUyhxFW3airjRUOcsV5HI=
X-Received: by 2002:a05:690c:9b01:b0:6e2:1527:446b with SMTP id
 00721157ae682-6efe3bcf5eemr125496137b3.3.1733734242272; Mon, 09 Dec 2024
 00:50:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org> <20241114-uvc-roi-v15-12-64cfeb56b6f8@chromium.org>
In-Reply-To: <20241114-uvc-roi-v15-12-64cfeb56b6f8@chromium.org>
From: Yunke Cao <yunkec@chromium.org>
Date: Mon, 9 Dec 2024 17:50:31 +0900
Message-ID: <CAEDqmY7+sCpa30cEqoiWN91YBiOxMtfym=8pcc-ODBrfvN+C1Q@mail.gmail.com>
Subject: Re: [PATCH v15 12/19] media: uvcvideo: Factor out query_boundaries
 from query_ctrl
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Ricardo Ribalda <ribalda@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,

This patch looks good to me.

Reviewed-by: Yunke Cao <yunkec@google.com>

Thanks,
Yunke

On Fri, Nov 15, 2024 at 4:10=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> Split the function in two parts. queryctrl_boundaries will be used in
> future patches.
>
> No functional change expected from this patch.
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 106 ++++++++++++++++++++++-----------=
------
>  1 file changed, 60 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc=
_ctrl.c
> index e51cd0a2228a..b591d7fddc37 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1367,53 +1367,11 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control=
 *ctrl,
>         return ~0;
>  }
>
> -static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> -       struct uvc_control *ctrl,
> -       struct uvc_control_mapping *mapping,
> -       struct v4l2_queryctrl *v4l2_ctrl)
> +static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
> +                                     struct uvc_control *ctrl,
> +                                     struct uvc_control_mapping *mapping=
,
> +                                     struct v4l2_queryctrl *v4l2_ctrl)
>  {
> -       struct uvc_control_mapping *master_map =3D NULL;
> -       struct uvc_control *master_ctrl =3D NULL;
> -
> -       memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
> -       v4l2_ctrl->id =3D mapping->id;
> -       v4l2_ctrl->type =3D mapping->v4l2_type;
> -       strscpy(v4l2_ctrl->name, uvc_map_get_name(mapping),
> -               sizeof(v4l2_ctrl->name));
> -       v4l2_ctrl->flags =3D 0;
> -
> -       if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
> -               v4l2_ctrl->flags |=3D V4L2_CTRL_FLAG_WRITE_ONLY;
> -       if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> -               v4l2_ctrl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> -
> -       if (mapping->master_id)
> -               __uvc_find_control(ctrl->entity, mapping->master_id,
> -                                  &master_map, &master_ctrl, 0, 0);
> -       if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_C=
UR)) {
> -               s32 val;
> -               int ret;
> -
> -               if (WARN_ON(uvc_ctrl_mapping_is_compound(master_map)))
> -                       return -EIO;
> -
> -               ret =3D __uvc_ctrl_get(chain, master_ctrl, master_map, &v=
al);
> -               if (ret < 0)
> -                       return ret;
> -
> -               if (val !=3D mapping->master_manual)
> -                               v4l2_ctrl->flags |=3D V4L2_CTRL_FLAG_INAC=
TIVE;
> -       }
> -
> -       if (v4l2_ctrl->type >=3D V4L2_CTRL_COMPOUND_TYPES) {
> -               v4l2_ctrl->flags |=3D V4L2_CTRL_FLAG_HAS_PAYLOAD;
> -               v4l2_ctrl->default_value =3D 0;
> -               v4l2_ctrl->minimum =3D 0;
> -               v4l2_ctrl->maximum =3D 0;
> -               v4l2_ctrl->step =3D 0;
> -               return 0;
> -       }
> -
>         if (!ctrl->cached) {
>                 int ret =3D uvc_ctrl_populate_cache(chain, ctrl);
>                 if (ret < 0)
> @@ -1456,18 +1414,74 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video=
_chain *chain,
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
>                 v4l2_ctrl->minimum =3D uvc_mapping_get_s32(mapping, UVC_G=
ET_MIN,
>                                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> +       else
> +               v4l2_ctrl->minimum =3D 0;
>
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
>                 v4l2_ctrl->maximum =3D uvc_mapping_get_s32(mapping, UVC_G=
ET_MAX,
>                                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> +       else
> +               v4l2_ctrl->maximum =3D 0;
>
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
>                 v4l2_ctrl->step =3D uvc_mapping_get_s32(mapping, UVC_GET_=
RES,
>                                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
> +       else
> +               v4l2_ctrl->step =3D 0;
>
>         return 0;
>  }
>
> +static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> +                                struct uvc_control *ctrl,
> +                                struct uvc_control_mapping *mapping,
> +                                struct v4l2_queryctrl *v4l2_ctrl)
> +{
> +       struct uvc_control_mapping *master_map =3D NULL;
> +       struct uvc_control *master_ctrl =3D NULL;
> +
> +       memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
> +       v4l2_ctrl->id =3D mapping->id;
> +       v4l2_ctrl->type =3D mapping->v4l2_type;
> +       strscpy(v4l2_ctrl->name, uvc_map_get_name(mapping),
> +               sizeof(v4l2_ctrl->name));
> +       v4l2_ctrl->flags =3D 0;
> +
> +       if (!(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
> +               v4l2_ctrl->flags |=3D V4L2_CTRL_FLAG_WRITE_ONLY;
> +       if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> +               v4l2_ctrl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +
> +       if (mapping->master_id)
> +               __uvc_find_control(ctrl->entity, mapping->master_id,
> +                                  &master_map, &master_ctrl, 0, 0);
> +       if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_C=
UR)) {
> +               s32 val;
> +               int ret;
> +
> +               if (WARN_ON(uvc_ctrl_mapping_is_compound(master_map)))
> +                       return -EIO;
> +
> +               ret =3D __uvc_ctrl_get(chain, master_ctrl, master_map, &v=
al);
> +               if (ret < 0)
> +                       return ret;
> +
> +               if (val !=3D mapping->master_manual)
> +                       v4l2_ctrl->flags |=3D V4L2_CTRL_FLAG_INACTIVE;
> +       }
> +
> +       if (v4l2_ctrl->type >=3D V4L2_CTRL_COMPOUND_TYPES) {
> +               v4l2_ctrl->flags |=3D V4L2_CTRL_FLAG_HAS_PAYLOAD;
> +               v4l2_ctrl->default_value =3D 0;
> +               v4l2_ctrl->minimum =3D 0;
> +               v4l2_ctrl->maximum =3D 0;
> +               v4l2_ctrl->step =3D 0;
> +               return 0;
> +       }
> +
> +       return __uvc_queryctrl_boundaries(chain, ctrl, mapping, v4l2_ctrl=
);
> +}
> +
>  int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
>         struct v4l2_queryctrl *v4l2_ctrl)
>  {
>
> --
> 2.47.0.338.g60cca15819-goog
>

