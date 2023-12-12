Return-Path: <linux-media+bounces-2202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DED9480E553
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 09:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD8D3B20C9D
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 08:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22208179B8;
	Tue, 12 Dec 2023 08:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZKPPbEjA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B658A7
	for <linux-media@vger.kernel.org>; Tue, 12 Dec 2023 00:00:13 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-548ae9a5eeaso6809a12.1
        for <linux-media@vger.kernel.org>; Tue, 12 Dec 2023 00:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702368012; x=1702972812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAC8VnJScx9GtU+cB/12BrTTN5UJUfmBDRVGC9ETOsg=;
        b=ZKPPbEjANraMcR+Jx3eD9fAZpFfV2Hho0Ys44NLenTQ12wJ+OOo5deYduZeoeaFe4C
         vJos4oQhaEKaSFqFisaRww9A9GONk970mDtpaj/dirC3yPsEqZeEdUHcPbSxQJzHJtz0
         MF/bw0oXKu5oTRjrCdKOscvgM7xCz6Bm/uWT1WsNrp4cLhDoidH+slI1OhhTgZKUqWem
         qqnnLcCjTBv7xiM1kYQ3DYPBrS2bcZFfbFQgiGJqi6lRaudeieEn0SgM07Sh5XqEM7uw
         018uz6l7JHlZtGFoEyhWBJmmQBkA5hn9B8iM+g7Vx/LsaFm5yIiHDu4y6k/ljH/Ufvd9
         vBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702368012; x=1702972812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAC8VnJScx9GtU+cB/12BrTTN5UJUfmBDRVGC9ETOsg=;
        b=IbZYCfToC6BKY9UNY9WHR4+dfHYS4wRV4E/b847HNz2GvbRyFQaxB8GZWDo0MIaSFL
         JDfLDM3Pl3KizyPDDZkmS5dYt5s7Zh6rb94PA5MUAwn00uTHa9sJvCGXZDkSLanblV9V
         96I2c8w6tKUMe6UpcmGhPk/xRY3QRmp8A1q7cmWa9Yyxj2bfP3XAs+RbDawdPxJauGwv
         vWyRImDUCPSGOYArC1w6wejQbKHTAgcs5dZvzhseDdwBBhg1OczYke1uesBnKlMGhMpD
         Y3G6jmu3b3yeZDZ8F869fGMVdG/+LOh4u43eTjuS6hgOGzLIWTrNEMHir2rWpwgymxxL
         q/Zw==
X-Gm-Message-State: AOJu0YxEAOzLjOpuZpJzeVMuZnfD+IyTz2TQ7f0+n5S9JzlWAoJFT7fM
	px9/mQrommlK3O4WHi51/dPaVteMwHng5n5fBDZ/Cw==
X-Google-Smtp-Source: AGHT+IFVDFrtLVgFc2CopD8YiYt2Usd7lXAxCv4jjQnD9ctDDr29PPKFPxo0vJm4GhewSARh737/JvvsZdEARTq4evo=
X-Received: by 2002:a50:f618:0:b0:54b:8f42:e3dc with SMTP id
 c24-20020a50f618000000b0054b8f42e3dcmr344950edn.2.1702368011529; Tue, 12 Dec
 2023 00:00:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201071907.3080126-1-yunkec@google.com> <20231201071907.3080126-5-yunkec@google.com>
 <20231208141511.GA22113@pendragon.ideasonboard.com>
In-Reply-To: <20231208141511.GA22113@pendragon.ideasonboard.com>
From: Yunke Cao <yunkec@google.com>
Date: Tue, 12 Dec 2023 16:59:59 +0900
Message-ID: <CANqU6FfgruB7tO6L_wP9zyrkOTEHf27XSuUdisAbocLD=_Eing@mail.gmail.com>
Subject: Re: [PATCH v14 04/11] media: uvcvideo: Split uvc_control_mapping.size
 to v4l2 and data size
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Tomasz Figa <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thanks for the review!


On Fri, Dec 8, 2023 at 11:15=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Yunke,
>
> Thank you for the patch.
>
> On Fri, Dec 01, 2023 at 04:18:55PM +0900, Yunke Cao wrote:
> > Rename the existing size to data_size to represent uvc control data siz=
e,
> > add a separate field for v4l2 control size. v4l2 control size will be
> > used the compound controls.
>
> s/uvc/UVC/ and s/v4l2/V4L2/ in the whole commit message.
>
> > Also modify the uvc driver documents to clarify the size in
> > uvc_xu_control_mapping corresponds to the uvc control data size.
> >
> > Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > ---
> > Changelog since v11:
> > - No change.
> > Changelog since v10:
> > - Added Reviewed-by from Daniel Scally.
> > Changelog since v9:
> > - No change.
> > Changelog since v8:
> > - No change.
> > Changelog since v7:
> > - Newly added patch.
> >
> >  .../userspace-api/media/drivers/uvcvideo.rst  |  2 +-
> >  drivers/media/usb/uvc/uvc_ctrl.c              | 80 +++++++++----------
> >  drivers/media/usb/uvc/uvc_v4l2.c              |  2 +-
> >  drivers/media/usb/uvc/uvcvideo.h              |  6 +-
> >  4 files changed, 47 insertions(+), 43 deletions(-)
> >
> > diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/D=
ocumentation/userspace-api/media/drivers/uvcvideo.rst
> > index a290f9fadae9..aab4304e6bb5 100644
> > --- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
> > +++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
> > @@ -157,7 +157,7 @@ Argument: struct uvc_xu_control_mapping
> >       __u8    name[32]        V4L2 control name
> >       __u8    entity[16]      UVC extension unit GUID
> >       __u8    selector        UVC control selector
> > -     __u8    size            V4L2 control size (in bits)
> > +     __u8    size            UVC control data size (in bits)
>
> The V4L2 and UVC sizes are identical for all controls mapped through
> this mechanism, right ?
>

Yes, I think that's right in the current implementation.
Do you think we need to support UVCIOC_CTRL_MAP for the compound controls?

I wanted to change this because simply we assign
+     map->data_size =3D xmap->size;
in uvc_ioctl_xu_ctrl_map().

Is this okay?

> >       __u8    offset          V4L2 control offset (in bits)
>
> If the size if the "UVC control data size", shouldn't this be the "UVC
> control data offset" ?
>

Ah, right. I will change this in the v15 if we keep the "UVC control data s=
ize".

> >       enum v4l2_ctrl_type
> >               v4l2_type       V4L2 control type
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/u=
vc_ctrl.c
> > index 4a685532f7eb..98254b93eb46 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -464,7 +464,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_BRIGHTNESS,
> >               .entity         =3D UVC_GUID_UVC_PROCESSING,
> >               .selector       =3D UVC_PU_BRIGHTNESS_CONTROL,
> > -             .size           =3D 16,
> > +             .data_size      =3D 16,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_SIGNED,
> > @@ -473,7 +473,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_CONTRAST,
> >               .entity         =3D UVC_GUID_UVC_PROCESSING,
> >               .selector       =3D UVC_PU_CONTRAST_CONTROL,
> > -             .size           =3D 16,
> > +             .data_size      =3D 16,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_UNSIGNED,
> > @@ -482,7 +482,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_HUE,
> >               .entity         =3D UVC_GUID_UVC_PROCESSING,
> >               .selector       =3D UVC_PU_HUE_CONTROL,
> > -             .size           =3D 16,
> > +             .data_size      =3D 16,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_SIGNED,
> > @@ -493,7 +493,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_SATURATION,
> >               .entity         =3D UVC_GUID_UVC_PROCESSING,
> >               .selector       =3D UVC_PU_SATURATION_CONTROL,
> > -             .size           =3D 16,
> > +             .data_size      =3D 16,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_UNSIGNED,
> > @@ -502,7 +502,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_SHARPNESS,
> >               .entity         =3D UVC_GUID_UVC_PROCESSING,
> >               .selector       =3D UVC_PU_SHARPNESS_CONTROL,
> > -             .size           =3D 16,
> > +             .data_size      =3D 16,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_UNSIGNED,
> > @@ -511,7 +511,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_GAMMA,
> >               .entity         =3D UVC_GUID_UVC_PROCESSING,
> >               .selector       =3D UVC_PU_GAMMA_CONTROL,
> > -             .size           =3D 16,
> > +             .data_size      =3D 16,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_UNSIGNED,
> > @@ -520,7 +520,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_BACKLIGHT_COMPENSATION,
> >               .entity         =3D UVC_GUID_UVC_PROCESSING,
> >               .selector       =3D UVC_PU_BACKLIGHT_COMPENSATION_CONTROL=
,
> > -             .size           =3D 16,
> > +             .data_size      =3D 16,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_UNSIGNED,
> > @@ -529,7 +529,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_GAIN,
> >               .entity         =3D UVC_GUID_UVC_PROCESSING,
> >               .selector       =3D UVC_PU_GAIN_CONTROL,
> > -             .size           =3D 16,
> > +             .data_size      =3D 16,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_UNSIGNED,
> > @@ -538,7 +538,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_HUE_AUTO,
> >               .entity         =3D UVC_GUID_UVC_PROCESSING,
> >               .selector       =3D UVC_PU_HUE_AUTO_CONTROL,
> > -             .size           =3D 1,
> > +             .data_size      =3D 1,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_BOOLEAN,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_BOOLEAN,
> > @@ -548,7 +548,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_EXPOSURE_AUTO,
> >               .entity         =3D UVC_GUID_UVC_CAMERA,
> >               .selector       =3D UVC_CT_AE_MODE_CONTROL,
> > -             .size           =3D 4,
> > +             .data_size      =3D 4,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_MENU,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_BITMASK,
> > @@ -561,7 +561,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_EXPOSURE_AUTO_PRIORITY,
> >               .entity         =3D UVC_GUID_UVC_CAMERA,
> >               .selector       =3D UVC_CT_AE_PRIORITY_CONTROL,
> > -             .size           =3D 1,
> > +             .data_size      =3D 1,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_BOOLEAN,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_BOOLEAN,
> > @@ -570,7 +570,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_EXPOSURE_ABSOLUTE,
> >               .entity         =3D UVC_GUID_UVC_CAMERA,
> >               .selector       =3D UVC_CT_EXPOSURE_TIME_ABSOLUTE_CONTROL=
,
> > -             .size           =3D 32,
> > +             .data_size      =3D 32,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_UNSIGNED,
> > @@ -581,7 +581,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_AUTO_WHITE_BALANCE,
> >               .entity         =3D UVC_GUID_UVC_PROCESSING,
> >               .selector       =3D UVC_PU_WHITE_BALANCE_TEMPERATURE_AUTO=
_CONTROL,
> > -             .size           =3D 1,
> > +             .data_size      =3D 1,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_BOOLEAN,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_BOOLEAN,
> > @@ -591,7 +591,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_WHITE_BALANCE_TEMPERATURE,
> >               .entity         =3D UVC_GUID_UVC_PROCESSING,
> >               .selector       =3D UVC_PU_WHITE_BALANCE_TEMPERATURE_CONT=
ROL,
> > -             .size           =3D 16,
> > +             .data_size      =3D 16,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_UNSIGNED,
> > @@ -602,7 +602,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_AUTO_WHITE_BALANCE,
> >               .entity         =3D UVC_GUID_UVC_PROCESSING,
> >               .selector       =3D UVC_PU_WHITE_BALANCE_COMPONENT_AUTO_C=
ONTROL,
> > -             .size           =3D 1,
> > +             .data_size      =3D 1,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_BOOLEAN,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_BOOLEAN,
> > @@ -613,7 +613,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_BLUE_BALANCE,
> >               .entity         =3D UVC_GUID_UVC_PROCESSING,
> >               .selector       =3D UVC_PU_WHITE_BALANCE_COMPONENT_CONTRO=
L,
> > -             .size           =3D 16,
> > +             .data_size      =3D 16,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_SIGNED,
> > @@ -624,7 +624,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_RED_BALANCE,
> >               .entity         =3D UVC_GUID_UVC_PROCESSING,
> >               .selector       =3D UVC_PU_WHITE_BALANCE_COMPONENT_CONTRO=
L,
> > -             .size           =3D 16,
> > +             .data_size      =3D 16,
> >               .offset         =3D 16,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_SIGNED,
> > @@ -635,7 +635,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_FOCUS_ABSOLUTE,
> >               .entity         =3D UVC_GUID_UVC_CAMERA,
> >               .selector       =3D UVC_CT_FOCUS_ABSOLUTE_CONTROL,
> > -             .size           =3D 16,
> > +             .data_size      =3D 16,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_UNSIGNED,
> > @@ -646,7 +646,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_FOCUS_AUTO,
> >               .entity         =3D UVC_GUID_UVC_CAMERA,
> >               .selector       =3D UVC_CT_FOCUS_AUTO_CONTROL,
> > -             .size           =3D 1,
> > +             .data_size      =3D 1,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_BOOLEAN,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_BOOLEAN,
> > @@ -656,7 +656,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_IRIS_ABSOLUTE,
> >               .entity         =3D UVC_GUID_UVC_CAMERA,
> >               .selector       =3D UVC_CT_IRIS_ABSOLUTE_CONTROL,
> > -             .size           =3D 16,
> > +             .data_size      =3D 16,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_UNSIGNED,
> > @@ -665,7 +665,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_IRIS_RELATIVE,
> >               .entity         =3D UVC_GUID_UVC_CAMERA,
> >               .selector       =3D UVC_CT_IRIS_RELATIVE_CONTROL,
> > -             .size           =3D 8,
> > +             .data_size      =3D 8,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_SIGNED,
> > @@ -674,7 +674,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_ZOOM_ABSOLUTE,
> >               .entity         =3D UVC_GUID_UVC_CAMERA,
> >               .selector       =3D UVC_CT_ZOOM_ABSOLUTE_CONTROL,
> > -             .size           =3D 16,
> > +             .data_size      =3D 16,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_UNSIGNED,
> > @@ -683,7 +683,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_ZOOM_CONTINUOUS,
> >               .entity         =3D UVC_GUID_UVC_CAMERA,
> >               .selector       =3D UVC_CT_ZOOM_RELATIVE_CONTROL,
> > -             .size           =3D 0,
> > +             .data_size      =3D 0,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_SIGNED,
> > @@ -694,7 +694,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_PAN_ABSOLUTE,
> >               .entity         =3D UVC_GUID_UVC_CAMERA,
> >               .selector       =3D UVC_CT_PANTILT_ABSOLUTE_CONTROL,
> > -             .size           =3D 32,
> > +             .data_size      =3D 32,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_SIGNED,
> > @@ -703,7 +703,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_TILT_ABSOLUTE,
> >               .entity         =3D UVC_GUID_UVC_CAMERA,
> >               .selector       =3D UVC_CT_PANTILT_ABSOLUTE_CONTROL,
> > -             .size           =3D 32,
> > +             .data_size      =3D 32,
> >               .offset         =3D 32,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_SIGNED,
> > @@ -712,7 +712,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_PAN_SPEED,
> >               .entity         =3D UVC_GUID_UVC_CAMERA,
> >               .selector       =3D UVC_CT_PANTILT_RELATIVE_CONTROL,
> > -             .size           =3D 16,
> > +             .data_size      =3D 16,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_SIGNED,
> > @@ -723,7 +723,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_TILT_SPEED,
> >               .entity         =3D UVC_GUID_UVC_CAMERA,
> >               .selector       =3D UVC_CT_PANTILT_RELATIVE_CONTROL,
> > -             .size           =3D 16,
> > +             .data_size      =3D 16,
> >               .offset         =3D 16,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_INTEGER,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_SIGNED,
> > @@ -734,7 +734,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_PRIVACY,
> >               .entity         =3D UVC_GUID_UVC_CAMERA,
> >               .selector       =3D UVC_CT_PRIVACY_CONTROL,
> > -             .size           =3D 1,
> > +             .data_size      =3D 1,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_BOOLEAN,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_BOOLEAN,
> > @@ -743,7 +743,7 @@ static const struct uvc_control_mapping uvc_ctrl_ma=
ppings[] =3D {
> >               .id             =3D V4L2_CID_PRIVACY,
> >               .entity         =3D UVC_GUID_EXT_GPIO_CONTROLLER,
> >               .selector       =3D UVC_CT_PRIVACY_CONTROL,
> > -             .size           =3D 1,
> > +             .data_size      =3D 1,
> >               .offset         =3D 0,
> >               .v4l2_type      =3D V4L2_CTRL_TYPE_BOOLEAN,
> >               .data_type      =3D UVC_CTRL_DATA_TYPE_BOOLEAN,
> > @@ -754,7 +754,7 @@ const struct uvc_control_mapping uvc_ctrl_power_lin=
e_mapping_limited =3D {
> >       .id             =3D V4L2_CID_POWER_LINE_FREQUENCY,
> >       .entity         =3D UVC_GUID_UVC_PROCESSING,
> >       .selector       =3D UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> > -     .size           =3D 2,
> > +     .data_size      =3D 2,
> >       .offset         =3D 0,
> >       .v4l2_type      =3D V4L2_CTRL_TYPE_MENU,
> >       .data_type      =3D UVC_CTRL_DATA_TYPE_ENUM,
> > @@ -766,7 +766,7 @@ const struct uvc_control_mapping uvc_ctrl_power_lin=
e_mapping_uvc11 =3D {
> >       .id             =3D V4L2_CID_POWER_LINE_FREQUENCY,
> >       .entity         =3D UVC_GUID_UVC_PROCESSING,
> >       .selector       =3D UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> > -     .size           =3D 2,
> > +     .data_size      =3D 2,
> >       .offset         =3D 0,
> >       .v4l2_type      =3D V4L2_CTRL_TYPE_MENU,
> >       .data_type      =3D UVC_CTRL_DATA_TYPE_ENUM,
> > @@ -783,7 +783,7 @@ static const struct uvc_control_mapping uvc_ctrl_po=
wer_line_mapping_uvc15 =3D {
> >       .id             =3D V4L2_CID_POWER_LINE_FREQUENCY,
> >       .entity         =3D UVC_GUID_UVC_PROCESSING,
> >       .selector       =3D UVC_PU_POWER_LINE_FREQUENCY_CONTROL,
> > -     .size           =3D 2,
> > +     .data_size      =3D 2,
> >       .offset         =3D 0,
> >       .v4l2_type      =3D V4L2_CTRL_TYPE_MENU,
> >       .data_type      =3D UVC_CTRL_DATA_TYPE_ENUM,
> > @@ -816,7 +816,7 @@ static inline void uvc_clear_bit(u8 *data, int bit)
> >  }
> >
> >  /*
> > - * Extract the bit string specified by mapping->offset and mapping->si=
ze
> > + * Extract the bit string specified by mapping->offset and mapping->da=
ta_size
> >   * from the little-endian data stored at 'data' and return the result =
as
> >   * a signed 32bit integer. Sign extension will be performed if the map=
ping
> >   * references a signed data type.
> > @@ -824,7 +824,7 @@ static inline void uvc_clear_bit(u8 *data, int bit)
> >  static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
> >       u8 query, const u8 *data)
> >  {
> > -     int bits =3D mapping->size;
> > +     int bits =3D mapping->data_size;
> >       int offset =3D mapping->offset;
> >       s32 value =3D 0;
> >       u8 mask;
> > @@ -847,19 +847,19 @@ static s32 uvc_get_le_value(struct uvc_control_ma=
pping *mapping,
> >
> >       /* Sign-extend the value if needed. */
> >       if (mapping->data_type =3D=3D UVC_CTRL_DATA_TYPE_SIGNED)
> > -             value |=3D -(value & (1 << (mapping->size - 1)));
> > +             value |=3D -(value & (1 << (mapping->data_size - 1)));
> >
> >       return value;
> >  }
> >
> >  /*
> > - * Set the bit string specified by mapping->offset and mapping->size
> > + * Set the bit string specified by mapping->offset and mapping->data_s=
ize
> >   * in the little-endian data stored at 'data' to the value 'value'.
> >   */
> >  static void uvc_set_le_value(struct uvc_control_mapping *mapping,
> >       s32 value, u8 *data)
> >  {
> > -     int bits =3D mapping->size;
> > +     int bits =3D mapping->data_size;
> >       int offset =3D mapping->offset;
> >       u8 mask;
> >
> > @@ -2039,7 +2039,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >        * needs to be loaded from the device to perform the read-modify-=
write
> >        * operation.
> >        */
> > -     if ((ctrl->info.size * 8) !=3D mapping->size) {
> > +     if ((ctrl->info.size * 8) !=3D mapping->data_size) {
> >               ret =3D __uvc_ctrl_load_cur(chain, ctrl);
> >               if (ret < 0)
> >                       return ret;
> > @@ -2546,8 +2546,8 @@ int uvc_ctrl_add_mapping(struct uvc_video_chain *=
chain,
> >       }
> >
> >       /* Validate the user-provided bit-size and offset */
> > -     if (mapping->size > 32 ||
> > -         mapping->offset + mapping->size > ctrl->info.size * 8) {
> > +     if (mapping->data_size > 32 ||
> > +         mapping->offset + mapping->data_size > ctrl->info.size * 8) {
> >               ret =3D -EINVAL;
> >               goto done;
> >       }
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/u=
vc_v4l2.c
> > index 5a88847bfbfe..ff72caf7bc9e 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -122,7 +122,7 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_c=
hain *chain,
> >       }
> >       memcpy(map->entity, xmap->entity, sizeof(map->entity));
> >       map->selector =3D xmap->selector;
> > -     map->size =3D xmap->size;
> > +     map->data_size =3D xmap->size;
> >       map->offset =3D xmap->offset;
> >       map->v4l2_type =3D xmap->v4l2_type;
> >       map->data_type =3D xmap->data_type;
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/u=
vcvideo.h
> > index 5091085fcfb0..7bc41270ed94 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -110,7 +110,11 @@ struct uvc_control_mapping {
> >       u8 entity[16];
> >       u8 selector;
> >
> > -     u8 size;
> > +     /* Size of the v4l2 control. Required for compound controls. */
> > +     u8 v4l2_size;
>
> Let's introduce this field in the patch that uses it. The commit message
> needs to be updated to explain that this patch renames the size field to
> data_size to prepare for adding another size field for compound
> controls.
>

Sounds good.

> > +     /* UVC data size. Required for all controls. */
>
> "UVC data size" is not very clear. Let me attempt to write a more
> precise description:
>
>         /*
>          * Size of the control data in the payload of the UVC control GET=
 and
>          * SET requests, expressed in bits.
>          */
>
> Is this correct ?
>

Yes, that sounds much better indeed.

Best,
Yunke

> > +     u8 data_size;
> > +
> >       u8 offset;
> >       enum v4l2_ctrl_type v4l2_type;
> >       u32 data_type;
>
> --
> Regards,
>
> Laurent Pinchart

