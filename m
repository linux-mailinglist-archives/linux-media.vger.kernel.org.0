Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6D1F54F8E7
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 16:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382409AbiFQOHg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 10:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233854AbiFQOHf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 10:07:35 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A66E8C3B
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 07:07:33 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-fb6b4da1dfso5706769fac.4
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 07:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dpaZ8e8VGQb+BpielLCrmJsF4upPaG4g9PcgtNKJNx8=;
        b=WZ27kY1CncLf6C6gidqBYDfqwWoYVu7cndc5pjkptu6pXJ8OXdVklLOceW5B5yr05C
         Y6zbok6paHAJSNxOGA39aAnlFw4VTUW35dIyL8BKUgsyvLX2/4hyHYTXLybsw6BjLY+m
         C8FqVNljqoBnokRx5UZzldzcWQiLq4RPYF6Is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dpaZ8e8VGQb+BpielLCrmJsF4upPaG4g9PcgtNKJNx8=;
        b=htzcBNKd3fs0LYaap6HIcPUWN/bOPp3Y8pa/exovxyL+l2NPx7BcU5YZylkgzDe02w
         ffRBmCogk0hnlXFovnsFw6lirOlMWFso914YCswpRFXuDbibBtO92jA/cS+qXvenoMt2
         CGbh0c3r6j1KmwAMRRt6w6lZxWw/xe9byLHZ13n0E8xfp5tGnf9LVUFzUxzgZJ3Vl9J+
         /X/3EHpLl2NM8ok6ya0ugwod+PDxE2VZzVLKGBxRnIlQbk6eqn2wjYqXx4ZjBNmzzBKv
         avqKq3UmDYF9LwY5N3T+8PlkQxFS+Fy7zfdfX+izZlP/jqX14GEZqpBIc3zc8JmdqfmT
         kPyg==
X-Gm-Message-State: AJIora/DQI60GdBzMUx1C/l4LyWhNUsAeFDYCMKe3ExwN2ZWZrxXLXnc
        Wd+i0ZJ01gh7AXLVejqXnzA01h+kYLaEz1Sk
X-Google-Smtp-Source: AGRyM1voQrqFE0bsVseeEPCaohLrAKu8iv6mDN8lJA2xepXFiop+8WujJhGsSXUQwUjh3K/xG3VkMg==
X-Received: by 2002:a05:6870:d194:b0:fe:2199:330a with SMTP id a20-20020a056870d19400b000fe2199330amr5249414oac.119.1655474852755;
        Fri, 17 Jun 2022 07:07:32 -0700 (PDT)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com. [209.85.160.49])
        by smtp.gmail.com with ESMTPSA id bk37-20020a0568081a2500b003289f51c2d7sm2519980oib.34.2022.06.17.07.07.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 07:07:32 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-101b0266185so1577057fac.6
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 07:07:31 -0700 (PDT)
X-Received: by 2002:a05:6870:4799:b0:f1:46f8:6ea4 with SMTP id
 c25-20020a056870479900b000f146f86ea4mr5544524oaq.223.1655474851271; Fri, 17
 Jun 2022 07:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220617103645.71560-1-ribalda@chromium.org> <20220617103645.71560-3-ribalda@chromium.org>
 <YqyFIq8iv/FZ6tNe@pendragon.ideasonboard.com>
In-Reply-To: <YqyFIq8iv/FZ6tNe@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 17 Jun 2022 16:07:20 +0200
X-Gmail-Original-Message-ID: <CANiDSCuZ0O3iv2Kk3b7Ui9ZWYM3PVsZAsF2DAL54XY9MkyHuLg@mail.gmail.com>
Message-ID: <CANiDSCuZ0O3iv2Kk3b7Ui9ZWYM3PVsZAsF2DAL54XY9MkyHuLg@mail.gmail.com>
Subject: Re: [PATCH v7 2/8] media: uvcvideo: Add support for per-device
 control mapping overrides
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, senozhatsky@chromium.org, yunkec@google.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Fri, 17 Jun 2022 at 15:44, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Fri, Jun 17, 2022 at 12:36:39PM +0200, Ricardo Ribalda wrote:
> > Some devices do not implement all their controls in a way that complies
> > with the UVC specification. This is for instance the case for several
> > devices that do not support the disabled mode for the power line
> > frequency control. Add a mechanism to allow per-device control mapping
> > overrides to avoid errors when accessing non-compliant controls.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 35 ++++++++++++++++++++++++++------
> >  drivers/media/usb/uvc/uvcvideo.h |  1 +
> >  2 files changed, 30 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index a709ebbb4d69..092decfdaa62 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -2403,9 +2403,8 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
> >  {
> >       const struct uvc_control_info *info = uvc_ctrls;
> >       const struct uvc_control_info *iend = info + ARRAY_SIZE(uvc_ctrls);
> > -     const struct uvc_control_mapping *mapping = uvc_ctrl_mappings;
> > -     const struct uvc_control_mapping *mend =
> > -             mapping + ARRAY_SIZE(uvc_ctrl_mappings);
> > +     const struct uvc_control_mapping *mapping;
> > +     const struct uvc_control_mapping *mend;
> >
> >       /* XU controls initialization requires querying the device for control
> >        * information. As some buggy UVC devices will crash when queried
> > @@ -2433,14 +2432,38 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
> >       if (!ctrl->initialized)
> >               return;
> >
> > -     /* Process common mappings first. */
> > -     for (; mapping < mend; ++mapping) {
> > +     /*
> > +      * First check if the device provides a custom mapping for this control,
> > +      * used to override standard mappings for non-conformant devices. Don't
> > +      * process standard mappings if a custom mapping is found. This
> > +      * mechanism doesn't support combining standard and custom mappings for
> > +      * a single control.
> > +      */
> > +     if (chain->dev->info->mappings) {
> > +             bool custom = false;
> > +             unsigned int i;
> > +
> > +             for (i = 0; (mapping = chain->dev->info->mappings[i]); ++i) {
> > +                     if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> > +                         ctrl->info.selector == mapping->selector) {
> > +                             __uvc_ctrl_add_mapping(chain, ctrl, mapping);
> > +                             custom = true;
> > +                     }
> > +             }
> > +
> > +             if (custom)
> > +                     return;
> > +     }
> > +
> > +     /* Process common mappings next. */
> > +     mend = mapping + ARRAY_SIZE(uvc_ctrl_mappings);
>
> I don't think mapping has the right value here, it could even be
> uninitialized. Let's make this
>
>         mapping = uvc_ctrl_mappings;
>         mend = mapping + ARRAY_SIZE(uvc_ctrl_mappings);
>
>         for (; mapping < mend; ++mapping) {
>
> to match the code below.

ups, sorry about that :(
. Will send as a new version
>
> > +     for (mapping = uvc_ctrl_mappings; mapping < mend; ++mapping) {
> >               if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> >                   ctrl->info.selector == mapping->selector)
> >                       __uvc_ctrl_add_mapping(chain, ctrl, mapping);
> >       }
> >
> > -     /* And then version-specific mappings. */
> > +     /* Finally process version-specific mappings. */
> >       if (chain->dev->uvc_version < 0x0150) {
> >               mapping = uvc_ctrl_mappings_uvc11;
> >               mend = mapping + ARRAY_SIZE(uvc_ctrl_mappings_uvc11);
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index c5b4febd2d94..fff5c5c99a3d 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -667,6 +667,7 @@ struct uvc_device_info {
> >       u32     quirks;
> >       u32     meta_format;
> >       u16     uvc_version;
> > +     const struct uvc_control_mapping **mappings;
> >  };
> >
> >  struct uvc_device {
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
