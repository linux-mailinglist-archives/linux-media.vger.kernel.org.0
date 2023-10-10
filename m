Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16C647BF576
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 10:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442525AbjJJIQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 04:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379437AbjJJIQu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 04:16:50 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B28F97
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 01:16:49 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4063bfc6c03so181095e9.0
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 01:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696925807; x=1697530607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n68TBGRMFs7Ast0Ek6d2Qt/Bdc98t4wFTnApyxWWodI=;
        b=YY3hbrVKYLNGJgRquY+/QHGCjq1cJdStbpCfgF54d6ZDcvzD+3ALdSBNJLMrAqittB
         luiGWjIik1TLaWhpfYdLVuEU/tjL3M/VaCU2w8XfiP/hb7jnaEArG7FTvfpiDV8w5We1
         GFKqleGfs+9BAHZdBHGtbaEs1cdmJNDCA2jmuWQVZ3zSFi/uOoq6Et0Cj2pMqIA614Es
         s2KVivTJHbdBiLs85Y0jApBmZc5UKI/EmuJnHfVEt5Ntxpe1bhU1r3XOwCCU4pVTxCMO
         a9mkb0ypmtvrsngYjwXZsXo9ttbufPb6KWuoz6nJgChxECbDMyrh1g9q2t7G774FpbsV
         Tzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696925807; x=1697530607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n68TBGRMFs7Ast0Ek6d2Qt/Bdc98t4wFTnApyxWWodI=;
        b=MzCt9hpDfIPnIEMD7OHN1g+MiOMm9cISzfBTE8ds6Ps+Vx032MNFV81xMz5Esq4DTn
         WL/Kim+8W7xCbJqkRSm8Y06j22KvXZMHgurjPwQW+AQcvUUHTlxVTFxaTvNf+EARktrz
         oR6kX1zyqjgm5dvktBGl1RN5+ubuUZ1uH3Jm3QQqdnpSTCrUzaqdCx710XeMnXbaeCp1
         raMyBaDL+qYnRF54rbHMitbbFYtE74KwVWMlY7ilF81zhU6ocYxAinGcuoDKWw4S6Azk
         fAC6VKBV2FXPch7l0MQTP3/fbcCVlCDFV3FrXCCMiqLl84j9rvH+aCOTK5PxkYVHC58u
         mcPg==
X-Gm-Message-State: AOJu0YwAMw5yH8jCI7bmEnQj1Rblfg8Th1frkRB61CxDr33fjQBunDDX
        plYtrMNfyphlv06WSJeK7fWtEnqV2iFp4NPs4HSKtA==
X-Google-Smtp-Source: AGHT+IH1j3vrNdbyuwEgPSZYARWUbRvpCjZ59Brb3e2QmiD54cuBa47AO53yQg/K7NZYmRy+5InqcMmqtV/0t7MTJdI=
X-Received: by 2002:a05:600c:188f:b0:3f7:3e85:36a with SMTP id
 x15-20020a05600c188f00b003f73e85036amr426352wmp.7.1696925807363; Tue, 10 Oct
 2023 01:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231010022136.1504015-1-yunkec@google.com> <20231010022136.1504015-8-yunkec@google.com>
 <4f13e0e5-3650-4f81-9c14-367d4f46ecf7@xs4all.nl>
In-Reply-To: <4f13e0e5-3650-4f81-9c14-367d4f46ecf7@xs4all.nl>
From:   Yunke Cao <yunkec@google.com>
Date:   Tue, 10 Oct 2023 17:16:35 +0900
Message-ID: <CANqU6FddYka1V9mwnbh+RsFZe2335-2GtQ0acfm1p+HeFxhznA@mail.gmail.com>
Subject: Re: [PATCH v13 07/11] media: vivid: Add an rectangle control
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 10, 2023 at 5:05=E2=80=AFPM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> On 10/10/23 04:21, Yunke Cao wrote:
> > This control represents a generic read/write rectangle.
> > It supports V4L2_CTRL_WHICH_MIN/MAX_VAL.
>
> No SOB!

Oops.. Thanks for catching it!

Yunke

>
> With that added:
>
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>
> Regards,
>
>         Hans
>
> > ---
> >  .../media/test-drivers/vivid/vivid-ctrls.c    | 34 +++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/m=
edia/test-drivers/vivid/vivid-ctrls.c
> > index f2b20e25a7a4..27a1173c7734 100644
> > --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> > +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> > @@ -38,6 +38,7 @@
> >  #define VIVID_CID_U8_PIXEL_ARRAY     (VIVID_CID_CUSTOM_BASE + 14)
> >  #define VIVID_CID_S32_ARRAY          (VIVID_CID_CUSTOM_BASE + 15)
> >  #define VIVID_CID_S64_ARRAY          (VIVID_CID_CUSTOM_BASE + 16)
> > +#define VIVID_CID_RECT                       (VIVID_CID_CUSTOM_BASE + =
17)
> >
> >  #define VIVID_CID_VIVID_BASE         (0x00f00000 | 0xf000)
> >  #define VIVID_CID_VIVID_CLASS                (0x00f00000 | 1)
> > @@ -357,6 +358,38 @@ static const struct v4l2_ctrl_config vivid_ctrl_ro=
_int32 =3D {
> >       .step =3D 1,
> >  };
> >
> > +static const struct v4l2_rect rect_def =3D {
> > +     .top =3D 100,
> > +     .left =3D 200,
> > +     .width =3D 300,
> > +     .height =3D 400,
> > +};
> > +
> > +static const struct v4l2_rect rect_min =3D {
> > +     .top =3D 0,
> > +     .left =3D 0,
> > +     .width =3D 1,
> > +     .height =3D 1,
> > +};
> > +
> > +static const struct v4l2_rect rect_max =3D {
> > +     .top =3D 0,
> > +     .left =3D 0,
> > +     .width =3D 1000,
> > +     .height =3D 2000,
> > +};
> > +
> > +static const struct v4l2_ctrl_config vivid_ctrl_rect =3D {
> > +     .ops =3D &vivid_user_gen_ctrl_ops,
> > +     .id =3D VIVID_CID_RECT,
> > +     .name =3D "Rect",
> > +     .type =3D V4L2_CTRL_TYPE_RECT,
> > +     .flags =3D V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX,
> > +     .p_def.p_const =3D &rect_def,
> > +     .p_min.p_const =3D &rect_min,
> > +     .p_max.p_const =3D &rect_max,
> > +};
> > +
> >  /* Framebuffer Controls */
> >
> >  static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
> > @@ -1677,6 +1710,7 @@ int vivid_create_controls(struct vivid_dev *dev, =
bool show_ccs_cap,
> >       dev->int_menu =3D v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_=
int_menu, NULL);
> >       dev->ro_int32 =3D v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_=
ro_int32, NULL);
> >       v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
> > +     v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_rect, NULL);
> >       v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
> >       v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NUL=
L);
> >       v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
>
