Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC5D84E6A88
	for <lists+linux-media@lfdr.de>; Thu, 24 Mar 2022 23:13:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353273AbiCXWPD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Mar 2022 18:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbiCXWPC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Mar 2022 18:15:02 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E44A03B2B7
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 15:13:27 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id yy13so11938926ejb.2
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 15:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K+o5rMHg3ZFddFxDoURxP/j1YEQq+lDBC8vLPZgNNEI=;
        b=Wq3sd91tJe6BvxwfmLrnBD0lb8LN32Qd+RO+jFJPRE1KHAgpVeEJutUg1kBL/UwgRT
         TQO0mC2dQtIw6E/9f2g5iqj8L3nJlTNkPi2jR4MZw4Ezjlq+04emMyo5AEXQbWfeL4As
         zA61//YCysAMpDKVwiBxRSHZuMWm10Ez/G72M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K+o5rMHg3ZFddFxDoURxP/j1YEQq+lDBC8vLPZgNNEI=;
        b=xSQ6E3S+qhlmXuL3LAQCiq1yqPDKRJ+kZNXTJgnLlmDbGNTjvVGaIDwgqUYqov0Lu/
         3IJ72+niHyXCFHyp+gUaWVs4++xLcdm9AnnKPSprl0Ikkkdqu5h1YWdsADYnNTt5R8bZ
         X92aYlOgs6SeucB/SNwXj1ZEhe+7Pi6MsBtHiMLNXOH1lUIkPpXnFsS475AC7pUE0Ce+
         7D57p2mT++fkSfUkqE1Gfc+hSwo6bi3VO8P039xaJQxCNzt0Sr/QYRFai6dpy4TCC2jx
         Qcz/oFaOs1LX7vrdQV2OwORvgZniNPCYyIcBB4z/UZmpJgzvDVjy77UDZH3ImL3PIj2h
         yA5w==
X-Gm-Message-State: AOAM5321AMFHJmoT9w8/xzx8D1yzLGxm1BTHOgwxJQZEzZvqY2MT0KBo
        F7r6hVxN2/gA1df6eyjUmxnIZ5jyIUFFSw==
X-Google-Smtp-Source: ABdhPJwNEHv1v+0p8mYhUShj7oK2xeP4ruW/n9xoa6xzJv/UJwsGKDEBvsIl6N+S6ufHGqlpjae/wA==
X-Received: by 2002:a17:906:1384:b0:6df:c7d0:9131 with SMTP id f4-20020a170906138400b006dfc7d09131mr8061612ejc.134.1648160006334;
        Thu, 24 Mar 2022 15:13:26 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id m20-20020a056402431400b00419315cc3e2sm2017334edc.61.2022.03.24.15.13.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Mar 2022 15:13:25 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id bi12so11948135ejb.3
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 15:13:25 -0700 (PDT)
X-Received: by 2002:a17:907:72c5:b0:6da:e99e:226c with SMTP id
 du5-20020a17090772c500b006dae99e226cmr8192590ejc.515.1648160005074; Thu, 24
 Mar 2022 15:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211008120914.69175-1-ribalda@chromium.org> <YjzUuKxG5jJ8M0CH@pendragon.ideasonboard.com>
In-Reply-To: <YjzUuKxG5jJ8M0CH@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 24 Mar 2022 23:13:14 +0100
X-Gmail-Original-Message-ID: <CANiDSCvA0cZuLq_szj8yXSR16BRs=awgpe5n+0DV=fOWgD2kJw@mail.gmail.com>
Message-ID: <CANiDSCvA0cZuLq_szj8yXSR16BRs=awgpe5n+0DV=fOWgD2kJw@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Fix memory leak if
 uvc_ctrl_add_mapping fails
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, Colin King <colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

Thanks for your review

On Thu, 24 Mar 2022 at 21:29, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Fri, Oct 08, 2021 at 02:09:14PM +0200, Ricardo Ribalda wrote:
> > If the mapping fails, the name field is not freed on exit.
> > Take the same approach as with the menu_info and have two different
> > allocations with two different life cycles.
> >
> > Fixes: 07adedb5c606 ("media: uvcvideo: Use control names from framework")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > To be applied after [PATCH][next] media: uvcvideo: Fix memory leak of object map on error exit path
> >
> > Changelog v2: use kstrdup functions
> >
> >  drivers/media/usb/uvc/uvc_ctrl.c | 10 ++++++++++
> >  drivers/media/usb/uvc/uvc_v4l2.c | 12 +++++++-----
> >  2 files changed, 17 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 30bfe9069a1f..6bd7c30dfb75 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -2188,11 +2188,21 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
> >       if (map == NULL)
> >               return -ENOMEM;
> >
> > +     /* For UVCIOC_CTRL_MAP custom controls */
> > +     if (mapping->name) {
> > +             map->name = kstrdup(mapping->name, GFP_KERNEL);
> > +             if (!map->name) {
> > +                     kfree(map);
> > +                     return -ENOMEM;
> > +             }
> > +     }
> > +
> >       INIT_LIST_HEAD(&map->ev_subs);
> >
> >       size = sizeof(*mapping->menu_info) * mapping->menu_count;
> >       map->menu_info = kmemdup(mapping->menu_info, size, GFP_KERNEL);
> >       if (map->menu_info == NULL) {
> > +             kfree(map->name);
> >               kfree(map);
> >               return -ENOMEM;
> >       }
>
> Looks good to me.
>
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 711556d13d03..43bd8809241c 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -42,8 +42,8 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
> >       map->id = xmap->id;
> >       /* Non standard control id. */
> >       if (v4l2_ctrl_get_name(map->id) == NULL) {
> > -             map->name = kmemdup(xmap->name, sizeof(xmap->name),
> > -                                 GFP_KERNEL);
> > +             map->name = kstrndup(xmap->name, sizeof(xmap->name),
> > +                                  GFP_KERNEL);
> >               if (!map->name) {
> >                       ret = -ENOMEM;
> >                       goto free_map;
>
> But do we actually have to duplicate the name here, can't we set
>
>                 map->name = xmap->name;
>
> ? We probably want to also set
>
>                 xmap->name[sizeof(xmap->name) - 1] = '\0';

Can we securely do this?  xmap comes from the ioctl. I was trying to
avoid writing to user without put_user()

Thanks
>
> > @@ -69,14 +69,14 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
> >               if (xmap->menu_count == 0 ||
> >                   xmap->menu_count > UVC_MAX_CONTROL_MENU_ENTRIES) {
> >                       ret = -EINVAL;
> > -                     goto free_map;
> > +                     goto free_map_name;
> >               }
> >
> >               size = xmap->menu_count * sizeof(*map->menu_info);
> >               map->menu_info = memdup_user(xmap->menu_info, size);
> >               if (IS_ERR(map->menu_info)) {
> >                       ret = PTR_ERR(map->menu_info);
> > -                     goto free_map;
> > +                     goto free_map_name;
> >               }
> >
> >               map->menu_count = xmap->menu_count;
> > @@ -86,12 +86,14 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
> >               uvc_dbg(chain->dev, CONTROL,
> >                       "Unsupported V4L2 control type %u\n", xmap->v4l2_type);
> >               ret = -ENOTTY;
> > -             goto free_map;
> > +             goto free_map_name;
> >       }
> >
> >       ret = uvc_ctrl_add_mapping(chain, map);
> >
> >       kfree(map->menu_info);
> > +free_map_name:
> > +     kfree(map->name);
> >  free_map:
> >       kfree(map);
> >
> > --
> > 2.33.0.882.g93a45727a2-goog
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
