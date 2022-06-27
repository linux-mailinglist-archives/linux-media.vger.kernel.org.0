Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2DB255B4E3
	for <lists+linux-media@lfdr.de>; Mon, 27 Jun 2022 03:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiF0BI2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jun 2022 21:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiF0BI1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jun 2022 21:08:27 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2330A26E9
        for <linux-media@vger.kernel.org>; Sun, 26 Jun 2022 18:08:26 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id p7so12791427ybm.7
        for <linux-media@vger.kernel.org>; Sun, 26 Jun 2022 18:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+cQ/A9UrgHlkyg30qgrVPCYaaM6oxInKcZzyqbHV+LQ=;
        b=F2yh+y6/1y5d3o29co6qyNb2ZddjCr2h6M1/iSG3QpzUWxsie7oU5Ojm02ScC8TwoC
         mRjI5ngS2arnN+rAnl5LPvyiQ8jnK7Dt+MBuYDKADhdZf9++nI1ebYB8swBbLZqitga2
         6Z0Rtgq7NDLuw3ojSIPzp3B93tdMsInQzzHNZFoSL9vmzUe1GJIVY4vVMnHE3E6LBcO2
         KxkhfIIvzJHzV22nuMSBB2dPD1NldAuJNwRQrkhy2A49T7HNbjRnHTgoX2bBu4nWHWce
         Is+eHJIh5wXuTaB3ZZ8q/T2bAdn9fgV3nC6UykOuyfr5PQ07nAgAIApVzac8y41XKRgr
         9RQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+cQ/A9UrgHlkyg30qgrVPCYaaM6oxInKcZzyqbHV+LQ=;
        b=07JzjWgC5rGN13xOHpwVamHwa0otlHTxwQ7+yPWByZonyVW2sYOZLkc2LuUETViJ5/
         Q1usaBsZ9lAwKX5EeCvClzkPnxzqptANz6zeeWI6G6Cn7MVu0Sn4xoEbw9n9TMhs9Gdp
         OvO/zVPczWjS32sVcWrpArFpKHfG+JPI3OUarX0XeBJysw1LL1mn6llqoVLzD8fClvhe
         0TwlTRfBUhZXrF5icdEGBOfcRykCPYDyRmCa0GUXGtL6ZtbR40rqhC0Na+eEy6SGUNtm
         n5RZdNivQAj/A7vMnmQka3t56AoTQQG2L9FSJv5/zxyKdTdKfpxX8d3tH6FGmfFqQlPl
         SkQw==
X-Gm-Message-State: AJIora+MkFSTiIm/AJCCBHxu1ggqOOtFRjlb2sY1L6vsmoCAEGKwjWzZ
        lF1n2asMDl3TYU0cKZhsONLfh+Pig/qZcIJrDwWH6EbWUo8RlA==
X-Google-Smtp-Source: AGRyM1sQCahuEsHlCffgqNAd5o84zl/YW3pJMUE6UBxHNUbejLHtKdaDzADKzsBERRJJk8IWFX1a2oNdxmBiZ7ZsKp0=
X-Received: by 2002:a25:b2a8:0:b0:66c:8110:3331 with SMTP id
 k40-20020a25b2a8000000b0066c81103331mr11452174ybj.460.1656292105004; Sun, 26
 Jun 2022 18:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220621061532.3108909-1-yunkec@google.com> <CANiDSCutn7RVDgSAfz-sEyAq71z-n7Kkd6Q4ABbXxtKZnyJ8Jg@mail.gmail.com>
In-Reply-To: <CANiDSCutn7RVDgSAfz-sEyAq71z-n7Kkd6Q4ABbXxtKZnyJ8Jg@mail.gmail.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Mon, 27 Jun 2022 10:08:14 +0900
Message-ID: <CANqU6FcMpoOc3Kzy+ALNs-1PvkGdhOeUes1JtCDXRDauScca+Q@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: user entity get_cur in uvc_ctrl_set
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Ricardo for the review!

On Wed, Jun 22, 2022 at 4:58 AM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Yunke
>
> Thanks for your patch
>
> Another way to do it could be:
>
> __uvc_ctrl_load_cur() {
> if (loaded)
>    return
>    if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) {
>        memset
>        loaded = true;
>        return
>   }
> ...
> }
>
> int __uvc_ctrl_get() {
> if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> return -EACCES;
> ....
> }
>
> Then you could even simplify more the code in uvc_ctrl_set, and limit
> the m handling of the loaded flag.
>
>
> if ( (ctrl->info.size * 8) != mapping->size)
>  ___uvc_ctrl_load_cur()
>
>
> But It is probably just a matter of taste ;). It is up to you and
> Laurent to pick what do you prefer.
>
> Regards!

Thanks for the suggestion. This does look cleaner. I like your idea better.
Laurent, do you have any preference?

>
>
> On Tue, 21 Jun 2022 at 08:15, Yunke Cao <yunkec@google.com> wrote:
> >
> > Entity controls should get_cur using an entity-defined function
> > instead of via a query. Fix this in uvc_ctrl_set.
> >
> > Fixes: 65900c581d01 ("media: uvcvideo: Allow entity-defined get_info and get_cur")
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Changelog since v1:
> > -Factored out common logic into __uvc_ctrl_load_cur().
> >
> >  drivers/media/usb/uvc/uvc_ctrl.c | 62 ++++++++++++++++++--------------
> >  1 file changed, 35 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 0e78233fc8a0..e25177c95571 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -963,36 +963,48 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
> >         return value;
> >  }
> >
> > -static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> > -       struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
> > -       s32 *value)
> > +static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
> > +                              struct uvc_control *ctrl)
> >  {
> > -       int ret;
> > +       int ret = 0;
> nit :  why do you init to 0?

I will remove it in v3.

> >
> >         if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> >                 return -EACCES;
> >
> > -       if (!ctrl->loaded) {
> > -               if (ctrl->entity->get_cur) {
> nit: is this spaced properly?

This is deleted code or am I looking in the wrong place.

> > -                       ret = ctrl->entity->get_cur(chain->dev,
> > -                               ctrl->entity,
> > -                               ctrl->info.selector,
> > -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > -                               ctrl->info.size);
> > -               } else {
> > -                       ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> > -                               ctrl->entity->id,
> > -                               chain->dev->intfnum,
> > -                               ctrl->info.selector,
> > -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > -                               ctrl->info.size);
> > -               }
> > -               if (ret < 0)
> > -                       return ret;
> > +       if (ctrl->loaded)
> > +               return 0;
> >
> > -               ctrl->loaded = 1;
> > +       if (ctrl->entity->get_cur) {
> > +               ret = ctrl->entity->get_cur(chain->dev,
> > +                       ctrl->entity,
> > +                       ctrl->info.selector,
> > +                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > +                       ctrl->info.size);
> > +       } else {
> > +               ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> > +                                    ctrl->entity->id, chain->dev->intfnum,
> > +                                    ctrl->info.selector,
> > +                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > +                                    ctrl->info.size);
> >         }
> >
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       ctrl->loaded = 1;
> > +
> > +       return ret;
> > +}
> > +
> > +static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> > +       struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
> > +       s32 *value)
> > +{
> nit: Is the alignment correct here?

Will fix it in v3.

Best,
Yunke

> > +       int ret = __uvc_ctrl_load_cur(chain, ctrl);
> > +
> > +       if (ret < 0)
> > +               return ret;
> > +
> >         *value = __uvc_ctrl_get_value(mapping,
> >                                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> >
> > @@ -1788,11 +1800,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >                         memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> >                                 0, ctrl->info.size);
> >                 } else {
> > -                       ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> > -                               ctrl->entity->id, chain->dev->intfnum,
> > -                               ctrl->info.selector,
> > -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > -                               ctrl->info.size);
> > +                       ret = __uvc_ctrl_load_cur(chain, ctrl);
> >                         if (ret < 0)
> >                                 return ret;
> >                 }
> > --
> > 2.37.0.rc0.104.g0611611a94-goog
>
>
>
> --
> Ricardo Ribalda
