Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7950C569993
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 06:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234990AbiGGEzG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 00:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235055AbiGGEzF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 00:55:05 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBA6B31208
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 21:55:03 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-2ef5380669cso159098687b3.9
        for <linux-media@vger.kernel.org>; Wed, 06 Jul 2022 21:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uA2WAhkiNeXMgVqFkDRYK+0+eXb2Q1BjaehT3JLnlgs=;
        b=VImGAamEp0DMae+MmuPZZg+dESH3ZCLdWw+3VAjW94VzFgU1NTFl84zZryDXxXXICZ
         HKjPmiDuKC+JI2fZLoCyEjJj9ivuF6EvEDzQKTqVY8X8fmsDDk+XcL2HiqCRD+ZKoNdp
         ZtZu02AqJe2yCpRyPl1nRTEE4IhUSy46mRjmhw+DJTmaetWwpKqSuwAL7aMaVduBra5X
         FG6aXV+Cac9S+0p3wtuexQgoJao7d9htpZkOfOxS1wHiahPRnWppjuqodTlZEk5tnIPp
         UOpza5YPdJ5lcm+GEwCpPUivJ4RYA2hVZt9VCDq5R/6WAxRpttiy57Pv1mHQ1qzHkQSK
         WwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uA2WAhkiNeXMgVqFkDRYK+0+eXb2Q1BjaehT3JLnlgs=;
        b=r0WIXDR29xkj9AnDBiMFXknkacOPGS5RP+R4PpejFxwjxklHcHLkTOu8n5LW6aJ0wP
         uTMQC+/b4bVOugzaO8BfDlW4GoKCO6lzPVJz4Syg7ve+MCd9wZUfmptnVclCgivpRrmL
         fT+fQkRgRp3DAQIt52xWjYdMsJs+vtgh3JDxoHItrP6Pf9gdhZthxG6qFRPmk4QYITAD
         vQDHI61sZKGuDInq3cz1IOWH+1zSv/lNkPQdxzHMdEpWN4+LoL6wp4ZeE6AkL9SDowp0
         5lUf26e2if0JZXyH7THy1l8N5ErtD3AVqs61qzLJhDxEd6sJROeWvvbIqhXE2l1IiNiz
         L7OA==
X-Gm-Message-State: AJIora+DdYQyk6LFaE0fKDekClDEqbUDneuphtn1QNJY7lKh8fyZ7AmM
        /58T+kwii4zyrz8iAHRXQZnvRxHFewfC++MEkaabng==
X-Google-Smtp-Source: AGRyM1voMvcXHjepvrb4SKf+W6HEz+XUKUO7gTriM4jx/GBJMABFOQ0Yg5EvhAaZjMdbsYbP6IumrlwbZUue8cMgMKo=
X-Received: by 2002:a81:4c13:0:b0:31c:8bb2:685a with SMTP id
 z19-20020a814c13000000b0031c8bb2685amr25471770ywa.284.1657169702861; Wed, 06
 Jul 2022 21:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220621061532.3108909-1-yunkec@google.com> <CANiDSCutn7RVDgSAfz-sEyAq71z-n7Kkd6Q4ABbXxtKZnyJ8Jg@mail.gmail.com>
 <CANqU6FcMpoOc3Kzy+ALNs-1PvkGdhOeUes1JtCDXRDauScca+Q@mail.gmail.com> <YsYdGKXODOqdTpUp@pendragon.ideasonboard.com>
In-Reply-To: <YsYdGKXODOqdTpUp@pendragon.ideasonboard.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Thu, 7 Jul 2022 13:54:52 +0900
Message-ID: <CANqU6FcJmWZp9hmZk+Mv8E_Jt9sx89yG1pMmtM5fdeWKUDqbkA@mail.gmail.com>
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

Hi Laurent,

Thanks for the feedback.

On Thu, Jul 7, 2022 at 8:39 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Jun 27, 2022 at 10:08:14AM +0900, Yunke Cao wrote:
> > Thanks Ricardo for the review!
> >
> > On Wed, Jun 22, 2022 at 4:58 AM Ricardo Ribalda <ribalda@chromium.org> wrote:
> > >
> > > Hi Yunke
> > >
> > > Thanks for your patch
> > >
> > > Another way to do it could be:
> > >
> > > __uvc_ctrl_load_cur() {
> > > if (loaded)
> > >    return
> > >    if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) {
> > >        memset
> > >        loaded = true;
> > >        return
> > >   }
> > > ...
> > > }
> > >
> > > int __uvc_ctrl_get() {
> > > if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> > > return -EACCES;
> > > ....
> > > }
> > >
> > > Then you could even simplify more the code in uvc_ctrl_set, and limit
> > > the m handling of the loaded flag.
> > >
> > >
> > > if ( (ctrl->info.size * 8) != mapping->size)
> > >  ___uvc_ctrl_load_cur()
> > >
> > >
> > > But It is probably just a matter of taste ;). It is up to you and
> > > Laurent to pick what do you prefer.
> > >
> > > Regards!
> >
> > Thanks for the suggestion. This does look cleaner. I like your idea better.
> > Laurent, do you have any preference?
>
> I agree, it looks cleaner.
>
> Do I understand correctly that this patch will currently have no effect,
> given that only the fake GPIO entity has a .get_cur() function, and that
> entity doesn't expose any control that can be set ?
>

Yes, That's my understanding as well. Ricardo, please correct me if I'm wrong.
Do we still want to merge this? If so, I will send v3 shortly.

Best,
Yunke

> > > On Tue, 21 Jun 2022 at 08:15, Yunke Cao <yunkec@google.com> wrote:
> > > >
> > > > Entity controls should get_cur using an entity-defined function
> > > > instead of via a query. Fix this in uvc_ctrl_set.
> > > >
> > > > Fixes: 65900c581d01 ("media: uvcvideo: Allow entity-defined get_info and get_cur")
> > > > Signed-off-by: Yunke Cao <yunkec@google.com>
> > > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > > Changelog since v1:
> > > > -Factored out common logic into __uvc_ctrl_load_cur().
> > > >
> > > >  drivers/media/usb/uvc/uvc_ctrl.c | 62 ++++++++++++++++++--------------
> > > >  1 file changed, 35 insertions(+), 27 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > index 0e78233fc8a0..e25177c95571 100644
> > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > @@ -963,36 +963,48 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
> > > >         return value;
> > > >  }
> > > >
> > > > -static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> > > > -       struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
> > > > -       s32 *value)
> > > > +static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
> > > > +                              struct uvc_control *ctrl)
> > > >  {
> > > > -       int ret;
> > > > +       int ret = 0;
> > > nit :  why do you init to 0?
> >
> > I will remove it in v3.
> >
> > > >
> > > >         if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> > > >                 return -EACCES;
> > > >
> > > > -       if (!ctrl->loaded) {
> > > > -               if (ctrl->entity->get_cur) {
> > > nit: is this spaced properly?
> >
> > This is deleted code or am I looking in the wrong place.
> >
> > > > -                       ret = ctrl->entity->get_cur(chain->dev,
> > > > -                               ctrl->entity,
> > > > -                               ctrl->info.selector,
> > > > -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > > -                               ctrl->info.size);
> > > > -               } else {
> > > > -                       ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> > > > -                               ctrl->entity->id,
> > > > -                               chain->dev->intfnum,
> > > > -                               ctrl->info.selector,
> > > > -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > > -                               ctrl->info.size);
> > > > -               }
> > > > -               if (ret < 0)
> > > > -                       return ret;
> > > > +       if (ctrl->loaded)
> > > > +               return 0;
> > > >
> > > > -               ctrl->loaded = 1;
> > > > +       if (ctrl->entity->get_cur) {
> > > > +               ret = ctrl->entity->get_cur(chain->dev,
> > > > +                       ctrl->entity,
> > > > +                       ctrl->info.selector,
> > > > +                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > > +                       ctrl->info.size);
> > > > +       } else {
> > > > +               ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> > > > +                                    ctrl->entity->id, chain->dev->intfnum,
> > > > +                                    ctrl->info.selector,
> > > > +                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > > +                                    ctrl->info.size);
> > > >         }
> > > >
> > > > +       if (ret < 0)
> > > > +               return ret;
> > > > +
> > > > +       ctrl->loaded = 1;
> > > > +
> > > > +       return ret;
> > > > +}
> > > > +
> > > > +static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> > > > +       struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
> > > > +       s32 *value)
> > > > +{
> > > nit: Is the alignment correct here?
> >
> > Will fix it in v3.
> >
> > Best,
> > Yunke
> >
> > > > +       int ret = __uvc_ctrl_load_cur(chain, ctrl);
> > > > +
> > > > +       if (ret < 0)
> > > > +               return ret;
> > > > +
> > > >         *value = __uvc_ctrl_get_value(mapping,
> > > >                                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> > > >
> > > > @@ -1788,11 +1800,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> > > >                         memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > >                                 0, ctrl->info.size);
> > > >                 } else {
> > > > -                       ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> > > > -                               ctrl->entity->id, chain->dev->intfnum,
> > > > -                               ctrl->info.selector,
> > > > -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > > -                               ctrl->info.size);
> > > > +                       ret = __uvc_ctrl_load_cur(chain, ctrl);
> > > >                         if (ret < 0)
> > > >                                 return ret;
> > > >                 }
>
> --
> Regards,
>
> Laurent Pinchart
