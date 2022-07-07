Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58749569E2A
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 10:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231678AbiGGIz4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 04:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbiGGIzy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 04:55:54 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E83C033E0A
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 01:55:53 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id i7so31394317ybe.11
        for <linux-media@vger.kernel.org>; Thu, 07 Jul 2022 01:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=05aHnLoXIK3deScTLEE0AhZlMbOgkvRmTvbzviJEiKA=;
        b=TXYgar3k58kLxfiC/Z3donzWjAfv9vHhFaoFciNzuJSM0VMvG/fUXWxENiz6YFTsU/
         zLF3cuqrnzcAFQMqQFo+1AllmF3JlLy7xvszW364+Tf7yVenhoi9Y1zCe7ghzyyWmJ9D
         /ZKDK6O4Warf7+wrgRnnXx0m0YXAdP2eox+11K0JQm7uDmzNE2IJa8sZoMm9oyFzkLwS
         05ugQioRZbky+Lr5pEvNF7mdlGhxl2iz0W7w+2Z20Q+b695qAc/nJ0ltyX0eTJoq64ed
         6oUadxUL2VK3uc7fEfyw2Dai6pcYc6AdH84bhcYX1tHR1WG4TjuFeC66g3harVw7v+BX
         Em0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=05aHnLoXIK3deScTLEE0AhZlMbOgkvRmTvbzviJEiKA=;
        b=H4jNSCgE1143t50VCGXnOSwlZsilLB/SEREFgSwNgs/C/iRjgWZhZrMP+oHH1U0uqa
         3Nna0WOFyqFX7i+WR4H4bV76KxG5zT0mDUJz81ExC4ZrXMsyWs3CIynaQ2cyMjJwKjCn
         07SW7xusmKnIvnAWMMHXIABKq8GIh3Ve84ipely4tXzvbDjP6jHMOYX3o+0fN7lOYIUl
         skcGiDlWrC3RInTGqWXhVf/Iy+5yM3APbqrAmVifvXCLprwHrkArpZlgf79L3GtBd44U
         3FYjiHHNWZCTsVhr+VpFkj1vNw7rKWHypTyzztzNHtq3xbQivXItv+3hlWMKRn26wlJK
         iEsg==
X-Gm-Message-State: AJIora+0nxWjO2e5O/WXGS+4g7OC5aAjTzzVw3Ksys/n6lAxS1Pb/Bhk
        SrTSYSGI2iXD4uai8qFNiJ5ILn7AbgRmTwBu7bC1cFZ+zwRZFg==
X-Google-Smtp-Source: AGRyM1vy58hlO7h7SLEKLLotE18zfFHpyy9eVVq9PFkAdMWGq42xIh+5mr7ucGFAmDAlSsAZ6PDEZS+10k2AebowcTw=
X-Received: by 2002:a25:6a57:0:b0:66e:c1bf:4a2 with SMTP id
 f84-20020a256a57000000b0066ec1bf04a2mr1134100ybc.263.1657184152975; Thu, 07
 Jul 2022 01:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220621061532.3108909-1-yunkec@google.com> <CANiDSCutn7RVDgSAfz-sEyAq71z-n7Kkd6Q4ABbXxtKZnyJ8Jg@mail.gmail.com>
 <CANqU6FcMpoOc3Kzy+ALNs-1PvkGdhOeUes1JtCDXRDauScca+Q@mail.gmail.com>
 <YsYdGKXODOqdTpUp@pendragon.ideasonboard.com> <CANqU6FcJmWZp9hmZk+Mv8E_Jt9sx89yG1pMmtM5fdeWKUDqbkA@mail.gmail.com>
 <YsaVY+g+xoE0klAW@pendragon.ideasonboard.com>
In-Reply-To: <YsaVY+g+xoE0klAW@pendragon.ideasonboard.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Thu, 7 Jul 2022 17:55:42 +0900
Message-ID: <CANqU6FexZ9j76POyMt6vUgvETWjK2vdqGBw43t2yneFqZoFNpg@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: user entity get_cur in uvc_ctrl_set
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
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

Thanks Laurent!

Just sent out v3:

Changelog since v2:
-Move the logic of setting ctrl_data to 0 into load_cur.
-Do not initialize ret=0.
-Fix __uvc_ctrl_get() spacing.
-Fix typo in the title.

Best,
Yunke

On Thu, Jul 7, 2022 at 5:12 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Yunke,
>
> On Thu, Jul 07, 2022 at 01:54:52PM +0900, Yunke Cao wrote:
> > On Thu, Jul 7, 2022 at 8:39 AM Laurent Pinchart wrote:
> > > On Mon, Jun 27, 2022 at 10:08:14AM +0900, Yunke Cao wrote:
> > > > On Wed, Jun 22, 2022 at 4:58 AM Ricardo Ribalda wrote:
> > > > >
> > > > > Hi Yunke
> > > > >
> > > > > Thanks for your patch
> > > > >
> > > > > Another way to do it could be:
> > > > >
> > > > > __uvc_ctrl_load_cur() {
> > > > > if (loaded)
> > > > >    return
> > > > >    if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) {
> > > > >        memset
> > > > >        loaded = true;
> > > > >        return
> > > > >   }
> > > > > ...
> > > > > }
> > > > >
> > > > > int __uvc_ctrl_get() {
> > > > > if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> > > > > return -EACCES;
> > > > > ....
> > > > > }
> > > > >
> > > > > Then you could even simplify more the code in uvc_ctrl_set, and limit
> > > > > the m handling of the loaded flag.
> > > > >
> > > > >
> > > > > if ( (ctrl->info.size * 8) != mapping->size)
> > > > >  ___uvc_ctrl_load_cur()
> > > > >
> > > > >
> > > > > But It is probably just a matter of taste ;). It is up to you and
> > > > > Laurent to pick what do you prefer.
> > > > >
> > > > > Regards!
> > > >
> > > > Thanks for the suggestion. This does look cleaner. I like your idea better.
> > > > Laurent, do you have any preference?
> > >
> > > I agree, it looks cleaner.
> > >
> > > Do I understand correctly that this patch will currently have no effect,
> > > given that only the fake GPIO entity has a .get_cur() function, and that
> > > entity doesn't expose any control that can be set ?
> >
> > Yes, That's my understanding as well. Ricardo, please correct me if I'm wrong.
> > Do we still want to merge this? If so, I will send v3 shortly.
>
> It's cleaner and will prevent future problems in case more users of
> .get_cur() appear, so I think the patch has value.
>
> > > > > On Tue, 21 Jun 2022 at 08:15, Yunke Cao <yunkec@google.com> wrote:
> > > > > >
> > > > > > Entity controls should get_cur using an entity-defined function
> > > > > > instead of via a query. Fix this in uvc_ctrl_set.
> > > > > >
> > > > > > Fixes: 65900c581d01 ("media: uvcvideo: Allow entity-defined get_info and get_cur")
> > > > > > Signed-off-by: Yunke Cao <yunkec@google.com>
> > > > > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > ---
> > > > > > Changelog since v1:
> > > > > > -Factored out common logic into __uvc_ctrl_load_cur().
> > > > > >
> > > > > >  drivers/media/usb/uvc/uvc_ctrl.c | 62 ++++++++++++++++++--------------
> > > > > >  1 file changed, 35 insertions(+), 27 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > index 0e78233fc8a0..e25177c95571 100644
> > > > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > > @@ -963,36 +963,48 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
> > > > > >         return value;
> > > > > >  }
> > > > > >
> > > > > > -static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> > > > > > -       struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
> > > > > > -       s32 *value)
> > > > > > +static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
> > > > > > +                              struct uvc_control *ctrl)
> > > > > >  {
> > > > > > -       int ret;
> > > > > > +       int ret = 0;
> > > > > nit :  why do you init to 0?
> > > >
> > > > I will remove it in v3.
> > > >
> > > > > >
> > > > > >         if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> > > > > >                 return -EACCES;
> > > > > >
> > > > > > -       if (!ctrl->loaded) {
> > > > > > -               if (ctrl->entity->get_cur) {
> > > > > nit: is this spaced properly?
> > > >
> > > > This is deleted code or am I looking in the wrong place.
> > > >
> > > > > > -                       ret = ctrl->entity->get_cur(chain->dev,
> > > > > > -                               ctrl->entity,
> > > > > > -                               ctrl->info.selector,
> > > > > > -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > > > > -                               ctrl->info.size);
> > > > > > -               } else {
> > > > > > -                       ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> > > > > > -                               ctrl->entity->id,
> > > > > > -                               chain->dev->intfnum,
> > > > > > -                               ctrl->info.selector,
> > > > > > -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > > > > -                               ctrl->info.size);
> > > > > > -               }
> > > > > > -               if (ret < 0)
> > > > > > -                       return ret;
> > > > > > +       if (ctrl->loaded)
> > > > > > +               return 0;
> > > > > >
> > > > > > -               ctrl->loaded = 1;
> > > > > > +       if (ctrl->entity->get_cur) {
> > > > > > +               ret = ctrl->entity->get_cur(chain->dev,
> > > > > > +                       ctrl->entity,
> > > > > > +                       ctrl->info.selector,
> > > > > > +                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > > > > +                       ctrl->info.size);
> > > > > > +       } else {
> > > > > > +               ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> > > > > > +                                    ctrl->entity->id, chain->dev->intfnum,
> > > > > > +                                    ctrl->info.selector,
> > > > > > +                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > > > > +                                    ctrl->info.size);
> > > > > >         }
> > > > > >
> > > > > > +       if (ret < 0)
> > > > > > +               return ret;
> > > > > > +
> > > > > > +       ctrl->loaded = 1;
> > > > > > +
> > > > > > +       return ret;
> > > > > > +}
> > > > > > +
> > > > > > +static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> > > > > > +       struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
> > > > > > +       s32 *value)
> > > > > > +{
> > > > > nit: Is the alignment correct here?
> > > >
> > > > Will fix it in v3.
> > > >
> > > > > > +       int ret = __uvc_ctrl_load_cur(chain, ctrl);
> > > > > > +
> > > > > > +       if (ret < 0)
> > > > > > +               return ret;
> > > > > > +
> > > > > >         *value = __uvc_ctrl_get_value(mapping,
> > > > > >                                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> > > > > >
> > > > > > @@ -1788,11 +1800,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> > > > > >                         memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > > > >                                 0, ctrl->info.size);
> > > > > >                 } else {
> > > > > > -                       ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> > > > > > -                               ctrl->entity->id, chain->dev->intfnum,
> > > > > > -                               ctrl->info.selector,
> > > > > > -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > > > > -                               ctrl->info.size);
> > > > > > +                       ret = __uvc_ctrl_load_cur(chain, ctrl);
> > > > > >                         if (ret < 0)
> > > > > >                                 return ret;
> > > > > >                 }
>
> --
> Regards,
>
> Laurent Pinchart
