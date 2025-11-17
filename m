Return-Path: <linux-media+bounces-47232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CA8C66273
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 21:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sto.lore.kernel.org (Postfix) with ESMTPS id D7CEE24252
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 20:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB4532B9A0;
	Mon, 17 Nov 2025 20:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUMuCDdq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F096D3191A7
	for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 20:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763412908; cv=none; b=hy6CLv+9rIlVvhhPBX69SQt5lfPJRATvI0nrKow17ux5devmJLow8BKFtG74HojAlj6yLSD6DmUQPK6EP/eXW7//5T7ndPnQqMRINu7XOqpGV1HoBevYhxuLnBN9BI5OUVyzsjzeJSmgz467Wayv20cEXtGv26R1syT7ibHOLtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763412908; c=relaxed/simple;
	bh=MPJxeFMncmmWYIM9zDNl+erDvmc/KudaidoK95TWSww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLeuACWLQMrxHPGNbaWYZ5wZSugPgcpofUmmynat4saVnZK3cABpAFO4ZDdAqa70PCNd8u3b69wBZnfLttAXTsfHMd5xeQLTdQB9b+g3JMn1EfMQziD9WWFlcA0scG8lz7d0dpZNxft647ae+mVPZVQV/7fQS/2BTAlzy+W/z3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUMuCDdq; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5dfd2148bf3so1112011137.1
        for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 12:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763412904; x=1764017704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0TJCoUJ0BIlh25j+JVWYAJTJ6NLeGluXa177SPvLDY=;
        b=HUMuCDdq2w0WtRkKbnvptzP7YdnAKe6Fywyhb/Z+xtfKei5y7mbtaXYYVvTT5kq6aw
         nK5flxo92bOD1MIzYwvRi24tBDHw6fuETSl98VqP5qBROLHd1LS81MyCHJ7/N1k9xiu7
         TOsq6GbnuIDA2z/i9e4m3Rz23/YKYPCeg50vVXPKJzQ2HpugVIHotyji/FWEFspQo2lm
         Fu9DsYcBuN4VBl2RD3yZy5eVc6Rlu8TetKMi1H9JHSu0yLLSuScfOFY5XuOPgVk1XN9k
         VV/Sz8KbIi6vA6OlJZ5a255soRImn3G4HU3th40lDD80NqozAmyma0D1MtcIFSp1UfPX
         2PlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763412904; x=1764017704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M0TJCoUJ0BIlh25j+JVWYAJTJ6NLeGluXa177SPvLDY=;
        b=Cte70PRVB998OPGhXrZE6C7Q2il83qKMl7xfXcbs8vxEKwMqoceCL6guevl7uSN9fN
         zuI7Ly9ZvDK/pmJE/G3s06saRk3biNIqRA5+0GRIaD6Bi2dJUzGmIl/mFWgeHbW7tvLg
         gGrR/MnKvoTZLWJTiLYHzCLPG8QGZcWwJ31OAMhyWhrUIXGUpaFIdZHmnuHQ0Ic2ZasY
         lX3fRitqTBmBWsmX4VDcfScuF96Q3FbOyOkPgr8+ZnwaMNLzZSgzoA46Qv4ZM4JFZD3f
         Ng9yYcnrAdkbxRi/P+UwnyZnz9ABvk1ZJuA51NDZ9b5Vyt5MY6l8bAofkSkNn+FbSkSM
         +Ctg==
X-Forwarded-Encrypted: i=1; AJvYcCVRNKO/vfwgx5XouykKImw9+mGR/gQCiZeQjTTOaS09T8+4CxPQMkRLNPAZgvshunKTQmiX56W+F6WfGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSxaSRGtyrgsZ3E5ClLlNPfRrACmLQv9cfVtF2Tna2uGfPvOYy
	4ufjFt+sh2884DmdXbU8gri2CKFmG3ZdmXwFRbkZtUm6ZI9GH/8/b0N373lHetsPZOayyyVAXCM
	0MQwZ6gkRo/2sU+gb3rSc9bD3RDi+WtM=
X-Gm-Gg: ASbGncvygX+cl4sMTkcNIPRLCaA8GgmQygyY8KpZ5QfUEMtSe5Qu/R1DERw7QtlrPUN
	co4CM/NN1olXSJhmLTrmTS7SmtEjoQCgO8Hn6YFB7eCuJlJbeGBhs7pwaOcX/DQ0FvMvJPNQjno
	lXAzp4PkyEsOaAriwx7Jr3Jc0diYTyOvvjz2a2+sSzVhcqX7KXZN9i1Fi7Evw4YOBqDqNrEOwt+
	JIIwSEce8+uqCMhH1r6qpg9u5tybVJQnVEym3kLEG/5EbUhDilxvxbNTYPMBqXarw+DxKd8l9jt
	kaGdroHaRK9EVuoH5P0MC8OVwA==
X-Google-Smtp-Source: AGHT+IHIgQTczMwF1AM9XGLuVF1VIlcFQEtn32kNIFRL5YwF+dXg3IlrSluHiCXmTueQYY2YIEJircmM3GmA9uMkfDY=
X-Received: by 2002:a05:6102:548b:b0:5df:b5d4:e463 with SMTP id
 ada2fe7eead31-5dfc5c05deemr4229858137.43.1763412903485; Mon, 17 Nov 2025
 12:55:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115013007.4842-1-soyer@irl.hu>
In-Reply-To: <20251115013007.4842-1-soyer@irl.hu>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 17 Nov 2025 21:54:46 +0100
X-Gm-Features: AWmQ_bnEEuepaOuqcxYe3ME28jPrP8Wg8mJ0kgtZLIBmfMPZ9Vki_li-47h-h4c
Message-ID: <CAPybu_1HEpqfXqQFrwxs7cwerrNb1YMf-hgg4WYmK3VC4wsbrA@mail.gmail.com>
Subject: Re: [PATCH v5] media: uvcvideo: UVC minimum relative pan/tilt/zoom
 speed fix.
To: Gergo Koteles <soyer@irl.hu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, John Bauer <johnebgood@securitylive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gergo

Thanks for reposting the patch, Could you mention what device you have
used to test it? If you include a lsusb -v from the device that would
be extra awesome.

On Sat, Nov 15, 2025 at 2:30=E2=80=AFAM Gergo Koteles <soyer@irl.hu> wrote:
>
> From: John Bauer <johnebgood@securitylive.com>
>
> For relative PTZ controls, UVC_GET_MIN for b(Pan|Tilt|Zoom)Speed
> returns the minimum speed of the movement in direction specified
> in the sign field.
>
nit: What about this extra clarification in the commit message?

In Video4Linux, a negative value in V4L2_CID_ZOOM_CONTINUOUS,
V4L2_CID_PAN_SPEED and V4L2_CID_TILT_SPEED indicates a movement in the
"opposite" direction to the standard direction.

Currently, we were using -UVC_GET_MIN as the negative value, which
resulted in the camera moving in the slowest possible speed.

Quirk the driver to return -UVC_GET_MAX for the affected controls.

Note that the get/set function from the mapping cannot be used for
this, because we need to use the information from GET_MAX for GET_MIN
and hacking uvc_ctrl_populate_cache seems like a worse alternative.


> So in the negative direction, only the slowest speed can be used
> at the moment.
>
> For minimum value, use maximum speed but in negative direction.
>
> Signed-off-by: John Bauer <johnebgood@securitylive.com>
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v5:
> - Rebased on 6.18
> - Link to v4: https://lore.kernel.org/all/cover.1718835633.git.soyer@irl.=
hu/
>
> Changes in v4:
> - Based on Ricardo's suggestion, only query the min value in uvc_ctrl_set
>   if necessary
> - Rename is_relative_ptz_ctrl function to uvc_ctrl_is_relative_ptz for
>   consistency
> - Rename 'relative speed implementation' to 'relative PTZ controls' in
>   comments
> - Fix indentation of comments
> - Reduce the length of the new lines to 80
> - Link to v3: https://lore.kernel.org/all/cover.1718726777.git.soyer@irl.=
hu/
>
> Changes in v3:
> - Based on Ricardo's suggestion, I squashed the two patches.
> - Link to v2: https://lore.kernel.org/all/20240405-uvc-fix-relative-ptz-s=
peed-v1-0-c32cdb2a899d@securitylive.com/
>
> Changes in v2:
> - Made recommended changes, moved control check to helper function and re=
moved dead code.
> - Link to v1: https://lore.kernel.org/all/20240326-uvc-relative-ptz-speed=
-fix-v1-1-453fd5ccfd37@securitylive.com/
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 52 +++++++++++++++++++++++++-------
>  1 file changed, 41 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc=
_ctrl.c
> index 2905505c240c..38a7d71526c2 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -526,8 +526,6 @@ static int uvc_ctrl_get_rel_speed(struct uvc_control_=
mapping *mapping,
>                 *out =3D (sign =3D=3D 0) ? 0 : (sign > 0 ? value : -value=
);
>                 return 0;
>         case UVC_GET_MIN:
nit: Add comment. (and if you add it also to uvc_ctrl_get_zoom, it
would be even better)
            /* Not used, we use -UVC_GET_MAX */
> -               *out =3D -value;
> -               return 0;
>         case UVC_GET_MAX:
>         case UVC_GET_RES:
>         case UVC_GET_DEF:
> @@ -1517,6 +1515,17 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control =
*ctrl,
>         return ~0;
>  }
>
> +static bool uvc_ctrl_is_relative_ptz(__u32 ctrl_id)
> +{
> +       switch (ctrl_id) {
> +       case V4L2_CID_ZOOM_CONTINUOUS:
> +       case V4L2_CID_PAN_SPEED:
> +       case V4L2_CID_TILT_SPEED:
> +               return true;
> +       }
> +       return false;
> +}
> +
>  /*
>   * Maximum retry count to avoid spurious errors with controls. Increasin=
g this
>   * value does no seem to produce better results in the tested hardware.
> @@ -1576,18 +1585,28 @@ static int __uvc_queryctrl_boundaries(struct uvc_=
video_chain *chain,
>                 break;
>         }
>
> -       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
> -               v4l2_ctrl->minimum =3D uvc_mapping_get_s32(mapping, UVC_G=
ET_MIN,
> -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> -       else
> -               v4l2_ctrl->minimum =3D 0;
> -
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
>                 v4l2_ctrl->maximum =3D uvc_mapping_get_s32(mapping, UVC_G=
ET_MAX,
>                                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
>         else
>                 v4l2_ctrl->maximum =3D 0;
>
> +       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) {
> +               /*
> +                * For relative PTZ controls, UVC_GET_MIN for
> +                * b(Pan|Tilt|Zoom)Speed returns the minimum speed of the
> +                * movement in direction specified in the sign field.
nit: mention 4.2.2.1.15 in the comment
> +                * For minimum value, use maximum speed but in negative d=
irection.
> +                */
> +               if (uvc_ctrl_is_relative_ptz(v4l2_ctrl->id))
> +                       v4l2_ctrl->minimum =3D -v4l2_ctrl->maximum;
> +               else
> +                       v4l2_ctrl->minimum =3D uvc_mapping_get_s32(mappin=
g,
> +                               UVC_GET_MIN, uvc_ctrl_data(ctrl, UVC_CTRL=
_DATA_MIN));
> +       } else {
> +               v4l2_ctrl->minimum =3D 0;
> +       }
> +
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
>                 v4l2_ctrl->step =3D uvc_mapping_get_s32(mapping, UVC_GET_=
RES,
>                                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
> @@ -2449,6 +2468,7 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32=
 which,
>
>  static int uvc_ctrl_clamp(struct uvc_video_chain *chain,
>                           struct uvc_control *ctrl,
> +                         u32 v4l2_id,
>                           struct uvc_control_mapping *mapping,
>                           s32 *value_in_out)
>  {
> @@ -2466,10 +2486,20 @@ static int uvc_ctrl_clamp(struct uvc_video_chain =
*chain,
>                                 return ret;
>                 }
>
> -               min =3D uvc_mapping_get_s32(mapping, UVC_GET_MIN,
> -                                         uvc_ctrl_data(ctrl, UVC_CTRL_DA=
TA_MIN));
>                 max =3D uvc_mapping_get_s32(mapping, UVC_GET_MAX,
>                                           uvc_ctrl_data(ctrl, UVC_CTRL_DA=
TA_MAX));
> +               /*
> +                * For relative PTZ controls, UVC_GET_MIN for
> +                * b(Pan|Tilt|Zoom)Speed returns the minimum speed of the
> +                * movement in direction specified in the sign field.
> +                * For minimum value, use maximum speed but in negative d=
irection.
> +                */
nit: Mention 4.2.2.1.15
> +               if (uvc_ctrl_is_relative_ptz(v4l2_id))
> +                       min =3D -max;
> +               else
> +                       min =3D uvc_mapping_get_s32(mapping, UVC_GET_MIN,
> +                                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA=
_MIN));
> +
>                 step =3D uvc_mapping_get_s32(mapping, UVC_GET_RES,
>                                            uvc_ctrl_data(ctrl, UVC_CTRL_D=
ATA_RES));
>                 if (step =3D=3D 0)
> @@ -2583,7 +2613,7 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2=
_ext_control *xctrl)
>         if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
>                 return -EACCES;
>
> -       ret =3D uvc_ctrl_clamp(chain, ctrl, mapping, &xctrl->value);
> +       ret =3D uvc_ctrl_clamp(chain, ctrl, xctrl->id, mapping, &xctrl->v=
alue);
>         if (ret)
>                 return ret;
>         /*
> --
> 2.51.1
>
>


--=20
Ricardo Ribalda

