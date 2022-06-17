Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A994C54F8AB
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 15:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382506AbiFQN4J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 09:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382512AbiFQN4H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 09:56:07 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82EA446B2A
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 06:56:06 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id s20-20020a056830439400b0060c3e43b548so3155144otv.7
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 06:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e5h1ea23G6MfoCVqcSwKBATD72U+nN89KaHBq50MRvY=;
        b=bwJn0oGBbUETwFmEs6RHphOXrcOv5pa1DI0tsIHu/qHWFFZdvMNdKq+0WboDCddARZ
         nuaHaD1yqJTLIuR3uHLzSFuDl3/ouskJw9RrYCDqRRWJ9M/JQ611h4IblVipd8M/nTXf
         BTTADR6BYfxH9TrIzIwGDspZrEQwNQxsXDCeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e5h1ea23G6MfoCVqcSwKBATD72U+nN89KaHBq50MRvY=;
        b=CBfg20dE1Rv1i5UnVubhYn4RudCyyE4tbxTdsk4ACa9ZoANP/u0ogS5d6KrqjGFlDa
         9jkRX8enbrGcb4m623Nz8SSiQ0VPLHOyowjISDjAN0RaWcEaBYWyWpO10QQJSgqURW5Q
         id3tgkzqjSypl+yvlMxOoiTWLE8BnOvokJvHEBx6JQpyFV0s8Ryhm9eJNKEFPmwbxnHN
         FiB81MwaOjh92zgq65JD543GWu5ivcqHageANfIn1IutCFLjZOhmajknlyRJLv+sTKyl
         LME0lv3ZkHP5Nch6T8r5vq/npM/uu3pZHaXozCnPziqUGzRCr3USmNUzmt4W4Bngji5V
         ym+g==
X-Gm-Message-State: AJIora9huGdlIco8TtnBOltvJdCZwOUZc6xrlOoZ553kQivIo9aMovzc
        itNUVKE50cbPHZslgO43KJLIGtmXdzq+Pg==
X-Google-Smtp-Source: AGRyM1tagi2Kyy1hbCpgHbqlWTMfrZgMKCMkMFGyZrS7go1zObF9saiRGearwewqnKsailTdH3XS1g==
X-Received: by 2002:a05:6830:14d4:b0:60c:ea5:5a8f with SMTP id t20-20020a05683014d400b0060c0ea55a8fmr4010814otq.131.1655474165651;
        Fri, 17 Jun 2022 06:56:05 -0700 (PDT)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com. [209.85.161.42])
        by smtp.gmail.com with ESMTPSA id 97-20020a9d04ea000000b0060c1798849dsm2445815otm.73.2022.06.17.06.56.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 06:56:04 -0700 (PDT)
Received: by mail-oo1-f42.google.com with SMTP id o23-20020a4ad497000000b0041bd038b4dbso801818oos.4
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 06:56:03 -0700 (PDT)
X-Received: by 2002:a4a:986c:0:b0:40e:94c3:3233 with SMTP id
 z41-20020a4a986c000000b0040e94c33233mr3973460ooi.2.1655474163167; Fri, 17 Jun
 2022 06:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220617103645.71560-1-ribalda@chromium.org> <20220617103645.71560-4-ribalda@chromium.org>
 <YqyGfFK3UXhrBLwK@pendragon.ideasonboard.com>
In-Reply-To: <YqyGfFK3UXhrBLwK@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 17 Jun 2022 15:55:52 +0200
X-Gmail-Original-Message-ID: <CANiDSCvOD08QD-2DKmrr2nNF+uC685tcnjBbMg0gGQc5ktR7qg@mail.gmail.com>
Message-ID: <CANiDSCvOD08QD-2DKmrr2nNF+uC685tcnjBbMg0gGQc5ktR7qg@mail.gmail.com>
Subject: Re: [PATCH v7 3/8] media: uvcvideo: Support minimum for V4L2_CTRL_TYPE_MENU
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, senozhatsky@chromium.org, yunkec@google.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Fri, 17 Jun 2022 at 15:50, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Fri, Jun 17, 2022 at 12:36:40PM +0200, Ricardo Ribalda wrote:
> > Currently all mappings of type V4L2_CTRL_TYPE_MENU, have a minimum of 0,
> > but there are some controls (limited powerline), that start with a value
> > different than 0.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 5 +++--
> >  drivers/media/usb/uvc/uvcvideo.h | 1 +
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 092decfdaa62..3b20b23abd1e 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1144,7 +1144,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >
> >       switch (mapping->v4l2_type) {
> >       case V4L2_CTRL_TYPE_MENU:
> > -             v4l2_ctrl->minimum = 0;
> > +             v4l2_ctrl->minimum = mapping->menu_min;
> >               v4l2_ctrl->maximum = mapping->menu_count - 1;
> >               v4l2_ctrl->step = 1;
> >
> > @@ -1264,7 +1264,8 @@ int uvc_query_v4l2_menu(struct uvc_video_chain *chain,
> >               goto done;
> >       }
> >
> > -     if (query_menu->index >= mapping->menu_count) {
> > +     if (query_menu->index < mapping->menu_min ||
> > +         query_menu->index >= mapping->menu_count) {
> >               ret = -EINVAL;
> >               goto done;
> >       }
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index fff5c5c99a3d..6ceb7f7b964d 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -254,6 +254,7 @@ struct uvc_control_mapping {
> >       u32 data_type;
> >
> >       const struct uvc_menu_info *menu_info;
> > +     u32 menu_min;
> >       u32 menu_count;
>
> That's a bit of a stop-gap measure, could we turn it into a bitmask
> instead ?
Unfortunately that is uAPI :(

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/v4l2-controls.h#n101

We have to keep the control type and its values.

Regards!
>
> >
> >       u32 master_id;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
