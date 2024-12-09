Return-Path: <linux-media+bounces-22856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F879E8DD0
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 09:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ED0F1885A37
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 08:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB7C21570C;
	Mon,  9 Dec 2024 08:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oIhVpDWs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1998621519C
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 08:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733734217; cv=none; b=Far0yEq90Qt/jjEphpg8upCEEHDXkj6SlTTrK+Zv0QaP+8WN5X1Ibtjv7+dVzprIBTeaVKtn0PuVdkyDY8/2F5ZkQm8dO5yI1t5CuU/1R0aeHeyNKdqbDApXLU/igNVx0sld7n5mdoOIaH8BCR2XIdemnAcanTM8qYyQkgEjlHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733734217; c=relaxed/simple;
	bh=T4b+ji9SVkwFmZRWjeu90j8UGfEk2Hy1e4CtseExXUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYYgQZYnNvyNWRKn/sw9n9bYwyDMLoq/qYDTMItRW08NG2Te5ese+7bgGsCk0Kps7zCm5j+lrA3K2n1347D/IT9IxIetaAsaHcy0UiIbbfO8x1SoB+yRDRKMQ/CJi2eUGQqFAmkgauoz+1vNlDlNJQ5+mX6vw+p3lfNIDooX8Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oIhVpDWs; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ef7f8d4f30so30991037b3.1
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 00:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733734215; x=1734339015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrJCCNlNKEIA+w8v6d10SqTkaned1Cc+l0gF4uXibSo=;
        b=oIhVpDWstpUMhx2Nxkli/vp+7fmPWSzycf7K8KEluKxyL9hIoRb92pfzrS/BqxYSeh
         zLJHeJco6UtQmIyIIZWhSxDShl8IPuMQFnSc+CohLXQHghkEo37eeO8xJ45Dnpqn7ZuS
         Ab1fl3wlTJgYqwMFTQRTS6Dj9sQyRcy8x92VI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733734215; x=1734339015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrJCCNlNKEIA+w8v6d10SqTkaned1Cc+l0gF4uXibSo=;
        b=wR7Cqkd60Xn851vs1VuchxUuFPzYb7MxLIQFj1az5bd8Hz8Xl0Qe8bnV56w0LI6J6l
         PGZ8U+u7lOW1fFVIow88tzYw8d4Opxu9LYqx59aoxm+W0AV4IzJ1iTOiVxudYxNpdT8A
         IpQTyml5hI0jKpetIUHLMKZUqaMq2/9PiKI9PxDfw3XWX5OjUo7VnDWWb/3fcjopNzHd
         g/iuh+VqqyvWyEZJbPvfaYadjUNxZ19W0PbSNib6U0kfU8pjcKz6mjFfQJUjd9Y1c7z6
         BVqoiSqAVmuWtjKf/8Pk7pNm+ejSrbcOFGDFDocQcQIaagjG+zVGAqxPsDdRyC8wYBYy
         trdA==
X-Forwarded-Encrypted: i=1; AJvYcCUfKXQZMBfCWWL3rN0JaR2uxnC0zLBCKJG9vMwtik8HUBMS/vTEpc3MCbIqHY2WDJMhRKwQRmCPvONBWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+nDBLQcQswmFliEBQxgXu4/f/r3+71oFfBE5bhMG1VJuP+t1j
	vPRPuBmWLjAVr2llCkN1gVZhzOhr+1X1Yr06ojPFlMpZ+EDE9MIftkTN3tWvI1T/w6mBLhIeSPV
	oFxpOX0eAzy+n8fcRgyeeRC1itIbChIdf0UPyvIj7OaM2478ksA==
X-Gm-Gg: ASbGncsPDOdlcWYVws0ao6c82bIVr03jGt3l27RsM+BC8kfeLDEgPVb6Vvjlt60iGWa
	h6HpTAVa2SajJH6ZQvqkTtrurvbVGHvQ=
X-Google-Smtp-Source: AGHT+IEH7Fum8yJpYSGqnSIjpyKOqJZxqe1l1KINGV6AyWziAUOMgIXmhvMkAU9yOzFkYSF4xynrgAaa14qh/hh5260=
X-Received: by 2002:a05:690c:9b01:b0:6ef:7290:d478 with SMTP id
 00721157ae682-6efe3cbe76cmr96993917b3.40.1733734215106; Mon, 09 Dec 2024
 00:50:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org> <20241114-uvc-roi-v15-10-64cfeb56b6f8@chromium.org>
In-Reply-To: <20241114-uvc-roi-v15-10-64cfeb56b6f8@chromium.org>
From: Yunke Cao <yunkec@chromium.org>
Date: Mon, 9 Dec 2024 17:50:04 +0900
Message-ID: <CAEDqmY5CUt-SpF3bLpnk1XTQcq0SkxL4OuoCWZ_LYZ5x9pQbBw@mail.gmail.com>
Subject: Re: [PATCH v15 10/19] media: uvcvideo: Factor out clamping from uvc_ctrl_set
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
> Move the logic to a separated function. Do not expect any change.
> This is a preparation for supporting compound controls.
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 82 +++++++++++++++++++++-------------=
------
>  1 file changed, 44 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc=
_ctrl.c
> index 6d5167eb368d..893d12cd3f90 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2002,28 +2002,17 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u=
32 which,
>         return -EINVAL;
>  }
>
> -int uvc_ctrl_set(struct uvc_fh *handle,
> -       struct v4l2_ext_control *xctrl)
> +static int uvc_ctrl_clamp(struct uvc_video_chain *chain,
> +                         struct uvc_control *ctrl,
> +                         struct uvc_control_mapping *mapping,
> +                         s32 *value_in_out)
>  {
> -       struct uvc_video_chain *chain =3D handle->chain;
> -       struct uvc_control *ctrl;
> -       struct uvc_control_mapping *mapping;
> -       s32 value;
> +       s32 value =3D *value_in_out;
>         u32 step;
>         s32 min;
>         s32 max;
>         int ret;
>
> -       if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >=3D 0)
> -               return -EACCES;
> -
> -       ctrl =3D uvc_find_control(chain, xctrl->id, &mapping);
> -       if (ctrl =3D=3D NULL)
> -               return -EINVAL;
> -       if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> -               return -EACCES;
> -
> -       /* Clamp out of range values. */
>         switch (mapping->v4l2_type) {
>         case V4L2_CTRL_TYPE_INTEGER:
>                 if (!ctrl->cached) {
> @@ -2041,14 +2030,13 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                 if (step =3D=3D 0)
>                         step =3D 1;
>
> -               xctrl->value =3D min + DIV_ROUND_CLOSEST((u32)(xctrl->val=
ue - min),
> -                                                       step) * step;
> +               value =3D min + DIV_ROUND_CLOSEST((u32)(value - min), ste=
p) * step;
>                 if (mapping->data_type =3D=3D UVC_CTRL_DATA_TYPE_SIGNED)
> -                       xctrl->value =3D clamp(xctrl->value, min, max);
> +                       value =3D clamp(value, min, max);
>                 else
> -                       xctrl->value =3D clamp_t(u32, xctrl->value, min, =
max);
> -               value =3D xctrl->value;
> -               break;
> +                       value =3D clamp_t(u32, value, min, max);
> +               *value_in_out =3D value;
> +               return 0;
>
>         case V4L2_CTRL_TYPE_BITMASK:
>                 if (!ctrl->cached) {
> @@ -2057,21 +2045,20 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                                 return ret;
>                 }
>
> -               xctrl->value &=3D uvc_get_ctrl_bitmap(ctrl, mapping);
> -               value =3D xctrl->value;
> -               break;
> +               value &=3D uvc_get_ctrl_bitmap(ctrl, mapping);
> +               *value_in_out =3D value;
> +               return 0;
>
>         case V4L2_CTRL_TYPE_BOOLEAN:
> -               xctrl->value =3D clamp(xctrl->value, 0, 1);
> -               value =3D xctrl->value;
> -               break;
> +               *value_in_out =3D clamp(value, 0, 1);
> +               return 0;
>
>         case V4L2_CTRL_TYPE_MENU:
> -               if (xctrl->value < (ffs(mapping->menu_mask) - 1) ||
> -                   xctrl->value > (fls(mapping->menu_mask) - 1))
> +               if (value < (ffs(mapping->menu_mask) - 1) ||
> +                   value > (fls(mapping->menu_mask) - 1))
>                         return -ERANGE;
>
> -               if (!test_bit(xctrl->value, &mapping->menu_mask))
> +               if (!test_bit(value, &mapping->menu_mask))
>                         return -EINVAL;
>
>                 /*
> @@ -2079,8 +2066,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                  * UVC controls that support it.
>                  */
>                 if (mapping->data_type =3D=3D UVC_CTRL_DATA_TYPE_BITMASK)=
 {
> -                       int val =3D uvc_mapping_get_menu_value(mapping,
> -                                                            xctrl->value=
);
> +                       int val =3D uvc_mapping_get_menu_value(mapping, v=
alue);
>                         if (!ctrl->cached) {
>                                 ret =3D uvc_ctrl_populate_cache(chain, ct=
rl);
>                                 if (ret < 0)
> @@ -2090,14 +2076,34 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                         if (!(uvc_get_ctrl_bitmap(ctrl, mapping) & val))
>                                 return -EINVAL;
>                 }
> -               value =3D xctrl->value;
> -               break;
> +               return 0;
>
>         default:
> -               value =3D xctrl->value;
> -               break;
> +               return 0;
>         }
>
> +       return 0;
> +}
> +
> +int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
> +{
> +       struct uvc_video_chain *chain =3D handle->chain;
> +       struct uvc_control_mapping *mapping;
> +       struct uvc_control *ctrl;
> +       int ret;
> +
> +       if (__uvc_query_v4l2_class(chain, xctrl->id, 0) >=3D 0)
> +               return -EACCES;
> +
> +       ctrl =3D uvc_find_control(chain, xctrl->id, &mapping);
> +       if (!ctrl)
> +               return -EINVAL;
> +       if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> +               return -EACCES;
> +
> +       ret =3D uvc_ctrl_clamp(chain, ctrl, mapping, &xctrl->value);
> +       if (ret)
> +               return ret;
>         /*
>          * If the mapping doesn't span the whole UVC control, the current=
 value
>          * needs to be loaded from the device to perform the read-modify-=
write
> @@ -2116,7 +2122,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                        ctrl->info.size);
>         }
>
> -       uvc_mapping_set_s32(mapping, value,
> +       uvc_mapping_set_s32(mapping, xctrl->value,
>                             uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
>
>         if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>
> --
> 2.47.0.338.g60cca15819-goog
>

