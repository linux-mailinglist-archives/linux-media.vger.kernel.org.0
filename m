Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A063055E0C6
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbiF0GA0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 02:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbiF0GAZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 02:00:25 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5912AC0
        for <linux-media@vger.kernel.org>; Sun, 26 Jun 2022 23:00:24 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id m24-20020a0568301e7800b00616b5c114d4so4855568otr.11
        for <linux-media@vger.kernel.org>; Sun, 26 Jun 2022 23:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6A0u+qq9TXrht92ylN6CQywzvd5XXYLdpAMj4Ax5i/g=;
        b=M5KpxNfRZFPoRMDeWPStgFJftaUM6zvwdXx0gOc3/nBHgBsDyKCfNJv37OhPvRiJ8m
         SneatcJAjZOO5UqOzHXJORcazUhr+RO8isWuWqeIdd5bEB14dvODqRRXUcXZLLpDSF6n
         B1gIblYf4Di5kGetCCwrKU/4iozlRTVC2NMGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6A0u+qq9TXrht92ylN6CQywzvd5XXYLdpAMj4Ax5i/g=;
        b=qqZMI5wQL5pLnmG56+Nxvb+lLv006jXXikyGJraAdHQGjCShA1WUCkUSS6suia783o
         IbqbTdDUTqahCWxHqB6PY3lsB5RyDDdebt4QsADqfFPMBMz8eABEEovNqfcD/MKv+6tk
         gleBGgqeD8QTIue8hBgIzkMT9jyheiI704nYYNWjMG/zXkbCXUzAE5ZrfkjC2BjlZl0L
         vSzVroVdCPprAntyNurYpTxFFE7gvW4olnnfY5mXq32fJKn0NzFz90Tbu2YQ1aJ6/r6n
         YX+l6C3nCqwzx3lOmZQ3LbDrHy8BiGtH6zYou0yIvMhgNE7BtPYtfJjZlJeNjkYvV3US
         w93Q==
X-Gm-Message-State: AJIora8Lx/90TxZkkHhnMkzh3x8Pz5QSDCYBYxq/Tgf6TmUo2KR1ndMK
        TQz+Qz+hmCcgah8cc5I8z/HzZuYh4WXJXg==
X-Google-Smtp-Source: AGRyM1tbrg10aoaCRgDS+aBbVpX+6apCJzJBwCXhjw248GiE5g+KskvYLF6HtQedhoRWJioVnkH45Q==
X-Received: by 2002:a9d:754a:0:b0:616:bd96:a37e with SMTP id b10-20020a9d754a000000b00616bd96a37emr4236278otl.325.1656309623554;
        Sun, 26 Jun 2022 23:00:23 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id z18-20020a056808065200b0032ba1b363d2sm4838191oih.55.2022.06.26.23.00.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 23:00:22 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id s124so11617872oia.0
        for <linux-media@vger.kernel.org>; Sun, 26 Jun 2022 23:00:22 -0700 (PDT)
X-Received: by 2002:a05:6808:1896:b0:32f:6cec:af9f with SMTP id
 bi22-20020a056808189600b0032f6cecaf9fmr6765749oib.223.1656309622245; Sun, 26
 Jun 2022 23:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220621061532.3108909-1-yunkec@google.com> <CANiDSCutn7RVDgSAfz-sEyAq71z-n7Kkd6Q4ABbXxtKZnyJ8Jg@mail.gmail.com>
 <CANqU6FcMpoOc3Kzy+ALNs-1PvkGdhOeUes1JtCDXRDauScca+Q@mail.gmail.com>
In-Reply-To: <CANqU6FcMpoOc3Kzy+ALNs-1PvkGdhOeUes1JtCDXRDauScca+Q@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 27 Jun 2022 08:00:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCukO5DcMSKLPAYyriCx4xjPSCWmBvfCqsAnJ1r1b-_LLA@mail.gmail.com>
Message-ID: <CANiDSCukO5DcMSKLPAYyriCx4xjPSCWmBvfCqsAnJ1r1b-_LLA@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: user entity get_cur in uvc_ctrl_set
To:     Yunke Cao <yunkec@google.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 27 Jun 2022 at 03:08, Yunke Cao <yunkec@google.com> wrote:
>
> Thanks Ricardo for the review!
>
> On Wed, Jun 22, 2022 at 4:58 AM Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
> > Hi Yunke
> >
> > Thanks for your patch
> >
> > Another way to do it could be:
> >
> > __uvc_ctrl_load_cur() {
> > if (loaded)
> >    return
> >    if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) {
> >        memset
> >        loaded = true;
> >        return
> >   }
> > ...
> > }
> >
> > int __uvc_ctrl_get() {
> > if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> > return -EACCES;
> > ....
> > }
> >
> > Then you could even simplify more the code in uvc_ctrl_set, and limit
> > the m handling of the loaded flag.
> >
> >
> > if ( (ctrl->info.size * 8) != mapping->size)
> >  ___uvc_ctrl_load_cur()
> >
> >
> > But It is probably just a matter of taste ;). It is up to you and
> > Laurent to pick what do you prefer.
> >
> > Regards!
>
> Thanks for the suggestion. This does look cleaner. I like your idea better.
> Laurent, do you have any preference?
>
> >
> >
> > On Tue, 21 Jun 2022 at 08:15, Yunke Cao <yunkec@google.com> wrote:
> > >
> > > Entity controls should get_cur using an entity-defined function
> > > instead of via a query. Fix this in uvc_ctrl_set.
> > >
> > > Fixes: 65900c581d01 ("media: uvcvideo: Allow entity-defined get_info and get_cur")
> > > Signed-off-by: Yunke Cao <yunkec@google.com>
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > > Changelog since v1:
> > > -Factored out common logic into __uvc_ctrl_load_cur().
> > >
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 62 ++++++++++++++++++--------------
> > >  1 file changed, 35 insertions(+), 27 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 0e78233fc8a0..e25177c95571 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -963,36 +963,48 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
> > >         return value;
> > >  }
> > >
> > > -static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> > > -       struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
> > > -       s32 *value)
> > > +static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
> > > +                              struct uvc_control *ctrl)
> > >  {
> > > -       int ret;
> > > +       int ret = 0;
> > nit :  why do you init to 0?
>
> I will remove it in v3.
>
> > >
> > >         if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> > >                 return -EACCES;
> > >
> > > -       if (!ctrl->loaded) {
> > > -               if (ctrl->entity->get_cur) {
> > nit: is this spaced properly?
>
> This is deleted code or am I looking in the wrong place.
I probably screwed up, sorry ;(
>
> > > -                       ret = ctrl->entity->get_cur(chain->dev,
> > > -                               ctrl->entity,
> > > -                               ctrl->info.selector,
> > > -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > -                               ctrl->info.size);
> > > -               } else {
> > > -                       ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> > > -                               ctrl->entity->id,
> > > -                               chain->dev->intfnum,
> > > -                               ctrl->info.selector,
> > > -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > -                               ctrl->info.size);
> > > -               }
> > > -               if (ret < 0)
> > > -                       return ret;
> > > +       if (ctrl->loaded)
> > > +               return 0;
> > >
> > > -               ctrl->loaded = 1;
> > > +       if (ctrl->entity->get_cur) {
> > > +               ret = ctrl->entity->get_cur(chain->dev,
> > > +                       ctrl->entity,
> > > +                       ctrl->info.selector,
> > > +                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > +                       ctrl->info.size);
> > > +       } else {
> > > +               ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> > > +                                    ctrl->entity->id, chain->dev->intfnum,
> > > +                                    ctrl->info.selector,
> > > +                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > +                                    ctrl->info.size);
> > >         }
> > >
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > > +       ctrl->loaded = 1;
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> > > +       struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
> > > +       s32 *value)
> > > +{
> > nit: Is the alignment correct here?
>
> Will fix it in v3.
>
> Best,
> Yunke
>
> > > +       int ret = __uvc_ctrl_load_cur(chain, ctrl);
> > > +
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > >         *value = __uvc_ctrl_get_value(mapping,
> > >                                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> > >
> > > @@ -1788,11 +1800,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> > >                         memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > >                                 0, ctrl->info.size);
> > >                 } else {
> > > -                       ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> > > -                               ctrl->entity->id, chain->dev->intfnum,
> > > -                               ctrl->info.selector,
> > > -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > -                               ctrl->info.size);
> > > +                       ret = __uvc_ctrl_load_cur(chain, ctrl);
> > >                         if (ret < 0)
> > >                                 return ret;
> > >                 }
> > > --
> > > 2.37.0.rc0.104.g0611611a94-goog
> >
> >
> >
> > --
> > Ricardo Ribalda



-- 
Ricardo Ribalda
