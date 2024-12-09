Return-Path: <linux-media+bounces-22861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA34F9E8E4E
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 10:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD50B1887548
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 09:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0724521765F;
	Mon,  9 Dec 2024 08:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e+3dAamM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C7D21660F
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 08:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733734592; cv=none; b=NnyNWEFZnvwk+4JySYURVgdd720zBIe0P5MCmfpK0NTbhEhZBMVCY0Mc0aJRgk4wtzOygcDKCpWukNX7s/49gX7v7kFnZS7l1Xp/cWD6a5UV4pnPDMw4JDeKi5Pxk6cuLDBgSUKrqOLo4AsVKUgSq09aVJ5BKl9q4nD8qHZ4Us0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733734592; c=relaxed/simple;
	bh=rwGCj6H6zmbVBwIQZldV2ZrhpgSz4a7JnapYyDmrEgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fXeEZZ5BXYCOIVJ7R7LoSuhjwhUuoFL33XhfqQIW7Op8uoKKSaqkhDURzlP8vnoiVFojE4XCJqsssUog3iXEzsT48hgV4cC+JTtAOBIirHLLAStEXUti3Qj0lCqq1i5jyM48ZT3/tfdE4tBkxjWBYBm1JK6ctP8huoGp5d8E19c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e+3dAamM; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6eff5f6fe07so12109687b3.1
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 00:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733734589; x=1734339389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhK1NpvQPDm7PNhwk+RkV2qz6pZANllkUePKrhOwToE=;
        b=e+3dAamMKLnBVLgXsJty6yLKe6TY9Wf3MKsfcLUPYOgq5bgTm1ePwFFvcHmH3uIh4n
         H9AKQMgbwf1PpgE4IWPfL7wQWTcxce/afZuiDeVC356XvPeMIjPNduE88XalQvXCmVKn
         UItxiLsZqq/kenLL7MMZAd3z668g01eF3mJsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733734589; x=1734339389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhK1NpvQPDm7PNhwk+RkV2qz6pZANllkUePKrhOwToE=;
        b=wdSRuTDzZ2e8n0QGwSfRKmFhlSiGL6/9qKDLm+5f32tH7qxLr4sGBA7/wgkEujWUTp
         Kpydq8cYBsUbTPbGrR40jb4LYyncpiGCBbWB+zerrza869zRiLVQ9mc02myVUr1GZwpM
         uWH2DTcJSPWST9wFrxrr4dPYB4sQU29et/EnfRxwhXVd2blqlgH114CEG0T/Y1+FrP5E
         958SVmboR66uDjb+gIFAMcUw8P6+Ha2cvdpZiJOUYqkYxiQBZVQvJyBxRcRSLEiVCiSv
         xU7GMCLDiRYfmS2X0vJx460Bha3w+/wfd8x6tciuwoW9IaCK6Ff8ZbUuZ0vOnSgfsL9x
         v2IA==
X-Forwarded-Encrypted: i=1; AJvYcCWoYIi57AXJqRecfjnE+me0SSB1XwpQsfCNgq5dWc30cmrq06CVg/DwkTR23AUjIFP19nBCX8UiVIAA4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxejfv4sybBdcBSdXpiM6qxGWvs7UKzrvpuZ66/B2THMGw8ZrmW
	C1xX8UyXEu6ZGg6JC4SUp9+UXlGTMCPyv1Ug/oVXTuydUA/HPgGj97mEDgE8rBU6JC3CYATX0Fc
	K2ZT8NxhqnHQfUhGrxbD5JUzBdN3oiBiPlmqs
X-Gm-Gg: ASbGncv2miHAZ7ixQYC5GAjveKKAqUez1ASNnwtKRtFOlxi7S2is0PneOHkwdqCN2qi
	3z3EnxjxgLjC7zPQgBejk6j92pi3l/8E=
X-Google-Smtp-Source: AGHT+IG2g6DRS6v3eO4hr+YxWggXdBc83Kts7p5uaoFCAa8dOKzDXT8Nnkt8bCwLpG1zK0sZdVyp+GQXHWafbWDmWiQ=
X-Received: by 2002:a05:690c:7082:b0:6ee:40f0:ddc9 with SMTP id
 00721157ae682-6efe38e7561mr90376827b3.12.1733734589409; Mon, 09 Dec 2024
 00:56:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org> <20241114-uvc-roi-v15-9-64cfeb56b6f8@chromium.org>
In-Reply-To: <20241114-uvc-roi-v15-9-64cfeb56b6f8@chromium.org>
From: Yunke Cao <yunkec@chromium.org>
Date: Mon, 9 Dec 2024 17:56:18 +0900
Message-ID: <CAEDqmY7EN0B6mpbCEQ-f9mMb5He3=bGit_pLxFogpdbtC_BjrA@mail.gmail.com>
Subject: Re: [PATCH v15 09/19] media: uvcvideo: Support any size for mapping get/set
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
> Right now, we only support mappings for v4l2 controls with a max size of
> s32. This patch modifies the prototype of get/set so it can support any
> size.
>
> This is done to prepare for compound controls.
>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 183 +++++++++++++++++++++++++++------=
------
>  drivers/media/usb/uvc/uvcvideo.h |   8 +-
>  2 files changed, 130 insertions(+), 61 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc=
_ctrl.c
> index d6afa131a5e1..6d5167eb368d 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -367,6 +367,22 @@ static const u32 uvc_control_classes[] =3D {
>
>  static const int exposure_auto_mapping[] =3D { 2, 1, 4, 8 };
>
> +static s32 uvc_mapping_get_s32(struct uvc_control_mapping *mapping,
> +                              u8 query, const void *data_in)
> +{
> +       s32 data_out;
> +
> +       mapping->get(mapping, query, data_in, sizeof(data_out), &data_out=
);
> +
> +       return data_out;
> +}
> +
> +static void uvc_mapping_set_s32(struct uvc_control_mapping *mapping,
> +                               s32 data_in, void *data_out)
> +{
> +       mapping->set(mapping, sizeof(data_in), &data_in, data_out);
> +}
> +
>  /*
>   * This function translates the V4L2 menu index @idx, as exposed to user=
space as
>   * the V4L2 control value, to the corresponding UVC control value used b=
y the
> @@ -405,58 +421,93 @@ uvc_mapping_get_menu_name(const struct uvc_control_=
mapping *mapping, u32 idx)
>         return v4l2_ctrl_get_menu(mapping->id)[idx];
>  }
>
> -static s32 uvc_ctrl_get_zoom(struct uvc_control_mapping *mapping,
> -       u8 query, const u8 *data)
> +static int uvc_ctrl_get_zoom(struct uvc_control_mapping *mapping, u8 que=
ry,
> +                            const void *uvc_in, size_t v4l2_size,
> +                            void *v4l2_out)
>  {
> -       s8 zoom =3D (s8)data[0];
> +       u8 value =3D ((u8 *)uvc_in)[2];
> +       s8 sign =3D ((s8 *)uvc_in)[0];
> +       s32 *out =3D v4l2_out;
> +
> +       if (WARN_ON(v4l2_size !=3D sizeof(s32)))
> +               return -EINVAL;
>
>         switch (query) {
>         case UVC_GET_CUR:
> -               return (zoom =3D=3D 0) ? 0 : (zoom > 0 ? data[2] : -data[=
2]);
> +               *out =3D (sign =3D=3D 0) ? 0 : (sign > 0 ? value : -value=
);
> +               return 0;
>
>         case UVC_GET_MIN:
>         case UVC_GET_MAX:
>         case UVC_GET_RES:
>         case UVC_GET_DEF:
>         default:
> -               return data[2];
> +               *out =3D value;
> +               return 0;
>         }
>  }
>
> -static void uvc_ctrl_set_zoom(struct uvc_control_mapping *mapping,
> -       s32 value, u8 *data)
> +static int uvc_ctrl_set_zoom(struct uvc_control_mapping *mapping,
> +                            size_t v4l2_size, const void *v4l2_in,
> +                            void *uvc_out)
>  {
> -       data[0] =3D value =3D=3D 0 ? 0 : (value > 0) ? 1 : 0xff;
> -       data[2] =3D min((int)abs(value), 0xff);
> +       u8 *out =3D uvc_out;
> +       s32 value;
> +
> +       if (WARN_ON(v4l2_size !=3D sizeof(s32)))
> +               return -EINVAL;
> +
> +       value =3D *(u32 *)v4l2_in;
> +       out[0] =3D value =3D=3D 0 ? 0 : (value > 0) ? 1 : 0xff;
> +       out[2] =3D min_t(int, abs(value), 0xff);
> +
> +       return 0;
>  }
>
> -static s32 uvc_ctrl_get_rel_speed(struct uvc_control_mapping *mapping,
> -       u8 query, const u8 *data)
> +static int uvc_ctrl_get_rel_speed(struct uvc_control_mapping *mapping,
> +                                 u8 query, const void *uvc_in,
> +                                 size_t v4l2_size, void *v4l2_out)
>  {
>         unsigned int first =3D mapping->offset / 8;
> -       s8 rel =3D (s8)data[first];
> +       u8 value =3D ((u8 *)uvc_in)[first + 1];
> +       s8 sign =3D ((s8 *)uvc_in)[first];
> +       s32 *out =3D v4l2_out;
> +
> +       if (WARN_ON(v4l2_size !=3D sizeof(s32)))
> +               return -EINVAL;
>
>         switch (query) {
>         case UVC_GET_CUR:
> -               return (rel =3D=3D 0) ? 0 : (rel > 0 ? data[first+1]
> -                                                : -data[first+1]);
> +               *out =3D (sign =3D=3D 0) ? 0 : (sign > 0 ? value : -value=
);
> +               return 0;
>         case UVC_GET_MIN:
> -               return -data[first+1];
> +               *out =3D -value;
> +               return 0;
>         case UVC_GET_MAX:
>         case UVC_GET_RES:
>         case UVC_GET_DEF:
>         default:
> -               return data[first+1];
> +               *out =3D value;
> +               return 0;
>         }
>  }
>
> -static void uvc_ctrl_set_rel_speed(struct uvc_control_mapping *mapping,
> -       s32 value, u8 *data)
> +static int uvc_ctrl_set_rel_speed(struct uvc_control_mapping *mapping,
> +                                 size_t v4l2_size, const void *v4l2_in,
> +                                 void *uvc_out)
>  {
>         unsigned int first =3D mapping->offset / 8;
> +       u8 *out =3D uvc_out;
> +       s32 value;
> +
> +       if (WARN_ON(v4l2_size !=3D sizeof(s32)))
> +               return -EINVAL;
>
> -       data[first] =3D value =3D=3D 0 ? 0 : (value > 0) ? 1 : 0xff;
> -       data[first+1] =3D min_t(int, abs(value), 0xff);
> +       value =3D *(u32 *)v4l2_in;
> +       out[first] =3D value =3D=3D 0 ? 0 : (value > 0) ? 1 : 0xff;
> +       out[first + 1] =3D min_t(int, abs(value), 0xff);
> +
> +       return 0;
>  }
>
>  static const struct uvc_control_mapping uvc_ctrl_power_line_mapping_limi=
ted =3D {
> @@ -887,14 +938,20 @@ static s32 uvc_menu_to_v4l2_menu(struct uvc_control=
_mapping *mapping, s32 val)
>   * a signed 32bit integer. Sign extension will be performed if the mappi=
ng
>   * references a signed data type.
>   */
> -static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
> -       u8 query, const u8 *data)
> +static int uvc_get_le_value(struct uvc_control_mapping *mapping,
> +                           u8 query, const void *uvc_in, size_t v4l2_siz=
e,
> +                           void *v4l2_out)
>  {
> -       int bits =3D mapping->size;
>         int offset =3D mapping->offset;
> +       int bits =3D mapping->size;
> +       const u8 *data =3D uvc_in;
> +       s32 *out =3D v4l2_out;
>         s32 value =3D 0;
>         u8 mask;
>
> +       if (WARN_ON(v4l2_size !=3D sizeof(s32)))
> +               return -EINVAL;
> +
>         data +=3D offset / 8;
>         offset &=3D 7;
>         mask =3D ((1LL << bits) - 1) << offset;
> @@ -916,29 +973,40 @@ static s32 uvc_get_le_value(struct uvc_control_mapp=
ing *mapping,
>                 value |=3D -(value & (1 << (mapping->size - 1)));
>
>         /* If it is a menu, convert from uvc to v4l2. */
> -       if (mapping->v4l2_type !=3D V4L2_CTRL_TYPE_MENU)
> -               return value;
> +       if (mapping->v4l2_type !=3D V4L2_CTRL_TYPE_MENU) {
> +               *out =3D value;
> +               return 0;
> +       }
>
>         switch (query) {
>         case UVC_GET_CUR:
>         case UVC_GET_DEF:
> -               return uvc_menu_to_v4l2_menu(mapping, value);
> +               *out =3D uvc_menu_to_v4l2_menu(mapping, value);
> +               return 0;
>         }
>
> -       return value;
> +       *out =3D value;
> +       return 0;
>  }
>
>  /*
>   * Set the bit string specified by mapping->offset and mapping->size
>   * in the little-endian data stored at 'data' to the value 'value'.
>   */
> -static void uvc_set_le_value(struct uvc_control_mapping *mapping,
> -       s32 value, u8 *data)
> +static int uvc_set_le_value(struct uvc_control_mapping *mapping,
> +                           size_t v4l2_size, const void *v4l2_in,
> +                           void *uvc_out)
>  {
> -       int bits =3D mapping->size;
>         int offset =3D mapping->offset;
> +       int bits =3D mapping->size;
> +       u8 *data =3D uvc_out;
> +       s32 value;
>         u8 mask;
>
> +       if (WARN_ON(v4l2_size !=3D sizeof(s32)))
> +               return -EINVAL;
> +
> +       value =3D *(s32 *)v4l2_in;
>         if (mapping->v4l2_type =3D=3D V4L2_CTRL_TYPE_MENU)
>                 value =3D uvc_mapping_get_menu_value(mapping, value);
>         /*
> @@ -960,6 +1028,8 @@ static void uvc_set_le_value(struct uvc_control_mapp=
ing *mapping,
>                 bits -=3D 8 - offset;
>                 offset =3D 0;
>         }
> +
> +       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
---
> @@ -1141,8 +1211,8 @@ static int __uvc_ctrl_get(struct uvc_video_chain *c=
hain,
>         if (ret < 0)
>                 return ret;
>
> -       *value =3D mapping->get(mapping, UVC_GET_CUR,
> -                             uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT))=
;
> +       *value =3D uvc_mapping_get_s32(mapping, UVC_GET_CUR,
> +                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CU=
RRENT));
>
>         return 0;
>  }
> @@ -1275,12 +1345,12 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control=
 *ctrl,
>          * as supported.
>          */
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
> -               return mapping->get(mapping, UVC_GET_RES,
> -                                   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES=
));
> +               return uvc_mapping_get_s32(mapping, UVC_GET_RES,
> +                                          uvc_ctrl_data(ctrl, UVC_CTRL_D=
ATA_RES));
>
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
> -               return mapping->get(mapping, UVC_GET_MAX,
> -                                   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX=
));
> +               return uvc_mapping_get_s32(mapping, UVC_GET_MAX,
> +                                          uvc_ctrl_data(ctrl, UVC_CTRL_D=
ATA_MAX));
>
>         return ~0;
>  }
> @@ -1324,10 +1394,9 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_=
chain *chain,
>                         return ret;
>         }
>
> -       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
> -               v4l2_ctrl->default_value =3D mapping->get(mapping, UVC_GE=
T_DEF,
> -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
> -       }
> +       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF)
> +               v4l2_ctrl->default_value =3D uvc_mapping_get_s32(mapping,
> +                               UVC_GET_DEF, uvc_ctrl_data(ctrl, UVC_CTRL=
_DATA_DEF));
>
>         switch (mapping->v4l2_type) {
>         case V4L2_CTRL_TYPE_MENU:
> @@ -1359,16 +1428,16 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video=
_chain *chain,
>         }
>
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
> -               v4l2_ctrl->minimum =3D mapping->get(mapping, UVC_GET_MIN,
> -                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MI=
N));
> +               v4l2_ctrl->minimum =3D uvc_mapping_get_s32(mapping, UVC_G=
ET_MIN,
> +                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
>
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
> -               v4l2_ctrl->maximum =3D mapping->get(mapping, UVC_GET_MAX,
> -                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MA=
X));
> +               v4l2_ctrl->maximum =3D uvc_mapping_get_s32(mapping, UVC_G=
ET_MAX,
> +                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
>
>         if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
> -               v4l2_ctrl->step =3D mapping->get(mapping, UVC_GET_RES,
> -                                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES))=
;
> +               v4l2_ctrl->step =3D uvc_mapping_get_s32(mapping, UVC_GET_=
RES,
> +                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
>
>         return 0;
>  }
> @@ -1581,7 +1650,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *=
chain,
>         ctrl->handle =3D NULL;
>
>         list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> -               s32 value =3D mapping->get(mapping, UVC_GET_CUR, data);
> +               s32 value =3D uvc_mapping_get_s32(mapping, UVC_GET_CUR, d=
ata);
>
>                 /*
>                  * handle may be NULL here if the device sends auto-updat=
e
> @@ -1925,8 +1994,8 @@ int uvc_ctrl_get(struct uvc_video_chain *chain, u32=
 which,
>                         if (ret < 0)
>                                 return ret;
>                 }
> -               xctrl->value =3D mapping->get(mapping, UVC_GET_DEF,
> -                                           uvc_ctrl_data(ctrl, UVC_CTRL_=
DATA_DEF));
> +               xctrl->value =3D uvc_mapping_get_s32(mapping, UVC_GET_DEF=
,
> +                                                  uvc_ctrl_data(ctrl, UV=
C_CTRL_DATA_DEF));
>                 return 0;
>         }
>
> @@ -1963,12 +2032,12 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                                 return ret;
>                 }
>
> -               min =3D mapping->get(mapping, UVC_GET_MIN,
> -                                  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN)=
);
> -               max =3D mapping->get(mapping, UVC_GET_MAX,
> -                                  uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX)=
);
> -               step =3D mapping->get(mapping, UVC_GET_RES,
> -                                   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES=
));
> +               min =3D uvc_mapping_get_s32(mapping, UVC_GET_MIN,
> +                                         uvc_ctrl_data(ctrl, UVC_CTRL_DA=
TA_MIN));
> +               max =3D uvc_mapping_get_s32(mapping, UVC_GET_MAX,
> +                                         uvc_ctrl_data(ctrl, UVC_CTRL_DA=
TA_MAX));
> +               step =3D uvc_mapping_get_s32(mapping, UVC_GET_RES,
> +                                          uvc_ctrl_data(ctrl, UVC_CTRL_D=
ATA_RES));
>                 if (step =3D=3D 0)
>                         step =3D 1;
>
> @@ -2047,8 +2116,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>                        ctrl->info.size);
>         }
>
> -       mapping->set(mapping, value,
> -               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> +       uvc_mapping_set_s32(mapping, value,
> +                           uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
>
>         if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>                 ctrl->handle =3D handle;
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvc=
video.h
> index 6ebaabd11443..3d32a56c5ff8 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -131,10 +131,10 @@ struct uvc_control_mapping {
>         const struct uvc_control_mapping *(*filter_mapping)
>                                 (struct uvc_video_chain *chain,
>                                 struct uvc_control *ctrl);
> -       s32 (*get)(struct uvc_control_mapping *mapping, u8 query,
> -                  const u8 *data);
> -       void (*set)(struct uvc_control_mapping *mapping, s32 value,
> -                   u8 *data);
> +       int (*get)(struct uvc_control_mapping *mapping, u8 query,
> +                  const void *uvc_in, size_t v4l2_size, void *v4l2_out);
> +       int (*set)(struct uvc_control_mapping *mapping, size_t v4l2_size,
> +                  const void *v4l2_in, void *uvc_out);
>  };
>
>  struct uvc_control {
>
> --
> 2.47.0.338.g60cca15819-goog
>

