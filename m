Return-Path: <linux-media+bounces-42521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0975B5710E
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 09:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B17B1898E58
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 07:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2B22D46CE;
	Mon, 15 Sep 2025 07:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T6xbMHRl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9258A1311AC
	for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 07:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757920731; cv=none; b=qhQRKvRyITjY8kOXUKOKM+lnF5K4j7uETUY4D4MDqkb6+vHy/kqKinj6siB/zp6fQj9lsnDOOTIZl9xHyYYi2UY8qTesThMp0uQUrZkyTY3YXL0xER6md/4S4pgPTs3vYcZoAWjd7JZ2CG/CKix2yWWFaqVrfEfBq6+FODQTCTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757920731; c=relaxed/simple;
	bh=N+aPabF4Hwc+ssipHtzxdYT8V6ZYevI0V4qEa4nH6Xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XUKyYTE5XKollakvpPczBduKC9G9H+b4j1jsSNGRpjXGLj2RuZ/uihtSauKUt/6C2GUFmrxOfKIfYzG3IEQnmJMvM9OQG8KYYseI2L4TNaoO0piOHgUfXwE+y27L3eClDKD3ZwWgneS5inZtPadoyEB3x1aXOOsrLirVDxsxY08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T6xbMHRl; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f720ffe34so4350623e87.1
        for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 00:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757920727; x=1758525527; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O5YQjHTlBTsN+6yBGhPL1nppIP0vBI5RNEgHYignDxI=;
        b=T6xbMHRlu7mcdZrpKTr9mj0u9T0DZYbABUMCVw+Yga/zQ7zD3c5JBkQJoP0LD4s8Rz
         EorXvqH9pqpGEDxwqK+3nLZ59FbDQXZiOrCx1xs0tCwy0FjkOX6Es1dwLerKenMj/S45
         Ey+cwDbcsAsIm9SjwaJtscxyUnXC3rRIMMRbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757920727; x=1758525527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5YQjHTlBTsN+6yBGhPL1nppIP0vBI5RNEgHYignDxI=;
        b=PrGxbuRQLAEEgRmZcpP+wYky6gtTkwadIVDXWs/HlKTqi9rutMJKiZIxCCNT1vvWf3
         hWjDyeD818tMkDd5NnMCbNfMJqVpvXXZxZWvhDFhyid7xT6PP+mMBeaigr1zXaCv/Hb/
         uSWxeQqVbA38GTl9fDJH06W25Lbkq53yagTqg/gXIQ2+U3v8eHZUdlNadNDl6/jgOeaJ
         tx8J6ZLkuv9HZwRDpRYPpoId8MTjsArxQ70wR7ZvYNP9+REFesYVUCRYAfYm34B62zQ7
         HDg5IB9Thh8ZFpKPoxzzJldoguzQO7w8n+stonmQ9xI7A5eVUFOimJxZ7ibyb851lxQ/
         5ryA==
X-Forwarded-Encrypted: i=1; AJvYcCVKGJzYxo9C7B+81GFerqkTyJNR3+rjZFc4fq8VdWmInYP+tL3sonrieyCsqicabmM9lle+Na7ekiZTag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbrq2Zaol0s0PkEVZvjoNKHDGI2ezuyizPaqEDDL0Jm2NoAFk8
	cSezvWb6eUoqNEYM5ul7CR9ihQ7z8zegBiB3sKSGIvEdYQ3xCJBp1QB7gsSWrooV4bNbR/3h+lb
	QWoE=
X-Gm-Gg: ASbGncuqCnH6moXRaqTuk6Dwo2Ya2IK3dJR3EnzXezG0kcDxxTHbjyPqRStBZpeZrwM
	u7u8iLNUqvwy7/FH5hZ0PZwaCfEAB3UpIJldzgsOgjnpqoBrOfuBx9jPTaH/e00kCQHYfDdxvtw
	tkDZqKmUnZ3EItBqZmA/Rflgf9eQlxjAH/8uZH9m70WBE80vg25wcnEFCQK3kEO9NjnAbqmlvy0
	EvgZDFExeMaRpz1SjJIziNA08gvt0rIBLeYAvO5N64CuWYRhBaqUSA+SXNYUev47ynRyvvSs2lX
	rDCqZ5t97lWghHuFUiBvPIMVnmF9/zWjGj3ZjcG3FT6ikE+k8sLI36BZbfz2whGJDIfSNw3Funj
	gQWk0ba+SU9EszketddNMacBZUZ/NrmmtXN/8ZgfwIw8QNqNoLk0cACP0Q1pM
X-Google-Smtp-Source: AGHT+IHbmxrVpwQK2q+0yrmudJ0yUqY8SnZ12UxCIPxPg2uXpSXTPwzXDHOx617c2E147hzu/Df8xQ==
X-Received: by 2002:a05:6512:1047:b0:55f:3c0b:9ca9 with SMTP id 2adb3069b0e04-5705be232c4mr3531590e87.1.1757920727277;
        Mon, 15 Sep 2025 00:18:47 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e661dbc29sm3419305e87.147.2025.09.15.00.18.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 00:18:46 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57263febd12so1185114e87.1
        for <linux-media@vger.kernel.org>; Mon, 15 Sep 2025 00:18:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpCRlUwbWuWP556jwJT9W6JyyGtpXlQ//u694DRnO7IcpOD+Gjjsk/5ohXJH529gZ2ww1oW+nhtBI0Vg==@vger.kernel.org
X-Received: by 2002:a05:6512:10d4:b0:554:e7ce:97f8 with SMTP id
 2adb3069b0e04-570601d3f6fmr3574906e87.15.1757920726308; Mon, 15 Sep 2025
 00:18:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
 <20250818-uvc-iq-switch-v1-4-f7ea5e740ddd@chromium.org> <20250913140628.GB10328@pendragon.ideasonboard.com>
In-Reply-To: <20250913140628.GB10328@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Sep 2025 09:18:33 +0200
X-Gmail-Original-Message-ID: <CANiDSCtsFYoDdQPakhX=mvkYCFpP-U82FBhDwdGJwOME-hFYQg@mail.gmail.com>
X-Gm-Features: Ac12FXzF2wjrlcTq-ZWxQ0b0FPhh0zsXbdbEJWeUXxxUiBB8xNFTd0o9yHoc-kY
Message-ID: <CANiDSCtsFYoDdQPakhX=mvkYCFpP-U82FBhDwdGJwOME-hFYQg@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: uvcvideo: Support UVC_CROSXU_CONTROL_IQ_PROFILE
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Sat, 13 Sept 2025 at 16:06, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Aug 18, 2025 at 08:15:39PM +0000, Ricardo Ribalda wrote:
> > The ChromeOS XU provides a control to change the IQ profile for a camera.
> > It can be switched from VIVID (a.k.a. standard) to NONE (a.k.a. natural).
> >
> > Wire it up to the standard v4l2 control.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 32 ++++++++++++++++++++++++++++++++
> >  include/linux/usb/uvc.h          |  5 +++++
> >  2 files changed, 37 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index ff975f96e1325532e2299047c07de5d1b9cf09db..8766a441ad1d8554c0daaed3f87758321684246b 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -376,6 +376,15 @@ static const struct uvc_control_info uvc_ctrls[] = {
> >                               | UVC_CTRL_FLAG_GET_DEF
> >                               | UVC_CTRL_FLAG_AUTO_UPDATE,
> >       },
> > +     {
> > +             .entity         = UVC_GUID_CHROMEOS_XU,
> > +             .selector       = UVC_CROSXU_CONTROL_IQ_PROFILE,
> > +             .index          = 3,
> > +             .size           = 1,
> > +             .flags          = UVC_CTRL_FLAG_SET_CUR
> > +                             | UVC_CTRL_FLAG_GET_RANGE
> > +                             | UVC_CTRL_FLAG_RESTORE,
> > +     },
> >  };
> >
> >  static const u32 uvc_control_classes[] = {
> > @@ -384,6 +393,17 @@ static const u32 uvc_control_classes[] = {
> >  };
> >
> >  static const int exposure_auto_mapping[] = { 2, 1, 4, 8 };
> > +static const int cros_colorfx_mapping[] = { 1, // V4L2_COLORFX_NONE
> > +                                         -1, // V4L2_COLORFX_BW
> > +                                         -1, // V4L2_COLORFX_SEPIA
> > +                                         -1, // V4L2_COLORFX_NEGATIVE
> > +                                         -1, // V4L2_COLORFX_EMBOSS
> > +                                         -1, // V4L2_COLORFX_SKETCH
> > +                                         -1, // V4L2_COLORFX_SKY_BLUE
> > +                                         -1, // V4L2_COLORFX_GRASS_GREEN
> > +                                         -1, // V4L2_COLORFX_SKIN_WHITEN
> > +                                         0}; // V4L2_COLORFX_VIVID};
>
> Extar '};' at the end of the line. The indentation also looks a bit
> weird. I'll replace it with
>
> static const int cros_colorfx_mapping[] = {
>         1,      /* V4L2_COLORFX_NONE */
>         -1,     /* V4L2_COLORFX_BW */
>         -1,     /* V4L2_COLORFX_SEPIA */
>         -1,     /* V4L2_COLORFX_NEGATIVE */
>         -1,     /* V4L2_COLORFX_EMBOSS */
>         -1,     /* V4L2_COLORFX_SKETCH */
>         -1,     /* V4L2_COLORFX_SKY_BLUE */
>         -1,     /* V4L2_COLORFX_GRASS_GREEN */
>         -1,     /* V4L2_COLORFX_SKIN_WHITEN */
>         0,      /* V4L2_COLORFX_VIVID */
> };
>
> > +
> >
> >  static bool uvc_ctrl_mapping_is_compound(struct uvc_control_mapping *mapping)
> >  {
> > @@ -975,6 +995,18 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> >               .data_type      = UVC_CTRL_DATA_TYPE_BITMASK,
> >               .name           = "Region of Interest Auto Ctrls",
> >       },
> > +     {
> > +             .id             = V4L2_CID_COLORFX,
> > +             .entity         = UVC_GUID_CHROMEOS_XU,
> > +             .selector       = UVC_CROSXU_CONTROL_IQ_PROFILE,
> > +             .size           = 8,
> > +             .offset         = 0,
> > +             .v4l2_type      = V4L2_CTRL_TYPE_MENU,
> > +             .data_type      = UVC_CTRL_DATA_TYPE_ENUM,
> > +             .menu_mapping   = cros_colorfx_mapping,
> > +             .menu_mask      = BIT(V4L2_COLORFX_VIVID) |
> > +                               BIT(V4L2_COLORFX_NONE),
> > +     },
> >  };
> >
> >  /* ------------------------------------------------------------------------
> > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > index 12a57e1d34674a3a264ed7f88bed43926661fcd4..22e0dab0809e296e089940620ae0e8838e109701 100644
> > --- a/include/linux/usb/uvc.h
> > +++ b/include/linux/usb/uvc.h
> > @@ -29,6 +29,9 @@
> >  #define UVC_GUID_EXT_GPIO_CONTROLLER \
> >       {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> >        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> > +#define UVC_GUID_CHROMEOS_XU \
> > +     {0x24, 0xe9, 0xd7, 0x74, 0xc9, 0x49, 0x45, 0x4a, \
> > +      0x98, 0xa3, 0xc8, 0x07, 0x7e, 0x05, 0x1c, 0xa3}
>
> I'd like to add a link to the documentation, but searching for the GUID
> didn't turn up any meaningful result. Where can I find documentation for
> this XU ?

It is not public yet. Not because there is anything secret about it,
but because of the "making documentation process".

Once there is a public document I will add a link.

Regards!
>
> The link can be added later, so
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> >  #define UVC_GUID_MSXU_1_5 \
> >       {0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
> >        0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
> > @@ -50,6 +53,8 @@
> >  #define UVC_MSXU_CONTROL_FIELDOFVIEW2_CONFIG 0x0f
> >  #define UVC_MSXU_CONTROL_FIELDOFVIEW2                0x10
> >
> > +#define UVC_CROSXU_CONTROL_IQ_PROFILE                0x04
> > +
> >  #define UVC_GUID_FORMAT_MJPEG \
> >       { 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
> >        0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

