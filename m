Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4895569CCF
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 10:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233053AbiGGIMz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 04:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235427AbiGGIMs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 04:12:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1EE4B6C
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 01:12:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5815D326;
        Thu,  7 Jul 2022 10:12:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657181565;
        bh=9oQlqjB8cZA3m2KxbNkrUxAkxRVNFCFNMpV4+qosPF4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z4GXomKrBJAVV3yTZ5LAVPRb6SwHvxV3Q+IaO9llwbTT2xmLtQw7BFyRdkuvg/+Vd
         M6PnEg94DrWxdGQNQe2S/0Glh84fQJyFYzjGt6Unl5I+TFonzvQ8eGcYlT3+r78IQi
         z5fDAEcHfW9pzA6Yh1lCf7SOL4K11oTFYXvzeCUo=
Date:   Thu, 7 Jul 2022 11:12:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yunke Cao <yunkec@google.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: uvcvideo: user entity get_cur in uvc_ctrl_set
Message-ID: <YsaVY+g+xoE0klAW@pendragon.ideasonboard.com>
References: <20220621061532.3108909-1-yunkec@google.com>
 <CANiDSCutn7RVDgSAfz-sEyAq71z-n7Kkd6Q4ABbXxtKZnyJ8Jg@mail.gmail.com>
 <CANqU6FcMpoOc3Kzy+ALNs-1PvkGdhOeUes1JtCDXRDauScca+Q@mail.gmail.com>
 <YsYdGKXODOqdTpUp@pendragon.ideasonboard.com>
 <CANqU6FcJmWZp9hmZk+Mv8E_Jt9sx89yG1pMmtM5fdeWKUDqbkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANqU6FcJmWZp9hmZk+Mv8E_Jt9sx89yG1pMmtM5fdeWKUDqbkA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke,

On Thu, Jul 07, 2022 at 01:54:52PM +0900, Yunke Cao wrote:
> On Thu, Jul 7, 2022 at 8:39 AM Laurent Pinchart wrote:
> > On Mon, Jun 27, 2022 at 10:08:14AM +0900, Yunke Cao wrote:
> > > On Wed, Jun 22, 2022 at 4:58 AM Ricardo Ribalda wrote:
> > > >
> > > > Hi Yunke
> > > >
> > > > Thanks for your patch
> > > >
> > > > Another way to do it could be:
> > > >
> > > > __uvc_ctrl_load_cur() {
> > > > if (loaded)
> > > >    return
> > > >    if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) {
> > > >        memset
> > > >        loaded = true;
> > > >        return
> > > >   }
> > > > ...
> > > > }
> > > >
> > > > int __uvc_ctrl_get() {
> > > > if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> > > > return -EACCES;
> > > > ....
> > > > }
> > > >
> > > > Then you could even simplify more the code in uvc_ctrl_set, and limit
> > > > the m handling of the loaded flag.
> > > >
> > > >
> > > > if ( (ctrl->info.size * 8) != mapping->size)
> > > >  ___uvc_ctrl_load_cur()
> > > >
> > > >
> > > > But It is probably just a matter of taste ;). It is up to you and
> > > > Laurent to pick what do you prefer.
> > > >
> > > > Regards!
> > >
> > > Thanks for the suggestion. This does look cleaner. I like your idea better.
> > > Laurent, do you have any preference?
> >
> > I agree, it looks cleaner.
> >
> > Do I understand correctly that this patch will currently have no effect,
> > given that only the fake GPIO entity has a .get_cur() function, and that
> > entity doesn't expose any control that can be set ?
> 
> Yes, That's my understanding as well. Ricardo, please correct me if I'm wrong.
> Do we still want to merge this? If so, I will send v3 shortly.

It's cleaner and will prevent future problems in case more users of
.get_cur() appear, so I think the patch has value.

> > > > On Tue, 21 Jun 2022 at 08:15, Yunke Cao <yunkec@google.com> wrote:
> > > > >
> > > > > Entity controls should get_cur using an entity-defined function
> > > > > instead of via a query. Fix this in uvc_ctrl_set.
> > > > >
> > > > > Fixes: 65900c581d01 ("media: uvcvideo: Allow entity-defined get_info and get_cur")
> > > > > Signed-off-by: Yunke Cao <yunkec@google.com>
> > > > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > ---
> > > > > Changelog since v1:
> > > > > -Factored out common logic into __uvc_ctrl_load_cur().
> > > > >
> > > > >  drivers/media/usb/uvc/uvc_ctrl.c | 62 ++++++++++++++++++--------------
> > > > >  1 file changed, 35 insertions(+), 27 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > index 0e78233fc8a0..e25177c95571 100644
> > > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > > @@ -963,36 +963,48 @@ static s32 __uvc_ctrl_get_value(struct uvc_control_mapping *mapping,
> > > > >         return value;
> > > > >  }
> > > > >
> > > > > -static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> > > > > -       struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
> > > > > -       s32 *value)
> > > > > +static int __uvc_ctrl_load_cur(struct uvc_video_chain *chain,
> > > > > +                              struct uvc_control *ctrl)
> > > > >  {
> > > > > -       int ret;
> > > > > +       int ret = 0;
> > > > nit :  why do you init to 0?
> > >
> > > I will remove it in v3.
> > >
> > > > >
> > > > >         if ((ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) == 0)
> > > > >                 return -EACCES;
> > > > >
> > > > > -       if (!ctrl->loaded) {
> > > > > -               if (ctrl->entity->get_cur) {
> > > > nit: is this spaced properly?
> > >
> > > This is deleted code or am I looking in the wrong place.
> > >
> > > > > -                       ret = ctrl->entity->get_cur(chain->dev,
> > > > > -                               ctrl->entity,
> > > > > -                               ctrl->info.selector,
> > > > > -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > > > -                               ctrl->info.size);
> > > > > -               } else {
> > > > > -                       ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> > > > > -                               ctrl->entity->id,
> > > > > -                               chain->dev->intfnum,
> > > > > -                               ctrl->info.selector,
> > > > > -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > > > -                               ctrl->info.size);
> > > > > -               }
> > > > > -               if (ret < 0)
> > > > > -                       return ret;
> > > > > +       if (ctrl->loaded)
> > > > > +               return 0;
> > > > >
> > > > > -               ctrl->loaded = 1;
> > > > > +       if (ctrl->entity->get_cur) {
> > > > > +               ret = ctrl->entity->get_cur(chain->dev,
> > > > > +                       ctrl->entity,
> > > > > +                       ctrl->info.selector,
> > > > > +                       uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > > > +                       ctrl->info.size);
> > > > > +       } else {
> > > > > +               ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> > > > > +                                    ctrl->entity->id, chain->dev->intfnum,
> > > > > +                                    ctrl->info.selector,
> > > > > +                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > > > +                                    ctrl->info.size);
> > > > >         }
> > > > >
> > > > > +       if (ret < 0)
> > > > > +               return ret;
> > > > > +
> > > > > +       ctrl->loaded = 1;
> > > > > +
> > > > > +       return ret;
> > > > > +}
> > > > > +
> > > > > +static int __uvc_ctrl_get(struct uvc_video_chain *chain,
> > > > > +       struct uvc_control *ctrl, struct uvc_control_mapping *mapping,
> > > > > +       s32 *value)
> > > > > +{
> > > > nit: Is the alignment correct here?
> > >
> > > Will fix it in v3.
> > >
> > > > > +       int ret = __uvc_ctrl_load_cur(chain, ctrl);
> > > > > +
> > > > > +       if (ret < 0)
> > > > > +               return ret;
> > > > > +
> > > > >         *value = __uvc_ctrl_get_value(mapping,
> > > > >                                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> > > > >
> > > > > @@ -1788,11 +1800,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> > > > >                         memset(uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > > >                                 0, ctrl->info.size);
> > > > >                 } else {
> > > > > -                       ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR,
> > > > > -                               ctrl->entity->id, chain->dev->intfnum,
> > > > > -                               ctrl->info.selector,
> > > > > -                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
> > > > > -                               ctrl->info.size);
> > > > > +                       ret = __uvc_ctrl_load_cur(chain, ctrl);
> > > > >                         if (ret < 0)
> > > > >                                 return ret;
> > > > >                 }

-- 
Regards,

Laurent Pinchart
