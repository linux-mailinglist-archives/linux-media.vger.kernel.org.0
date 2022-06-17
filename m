Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF0754F903
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 16:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382498AbiFQOQJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 10:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382636AbiFQOQI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 10:16:08 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52ABD4755C
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 07:16:04 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1014b2752c1so5712687fac.11
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 07:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A4LYt6kN9SB/9kBxCNUpMPu2fI4vD/suYfh2TVYyskI=;
        b=cOJ/J/xt3xT5Nm6zugfLaV8uiuwc34n1s20n+kUDtU+w3RRB4TXnZJVtuSWHAq+akG
         U/8wufHV+Cph3ouPDgeVM6W+iYq4WwFTW8ynlUS8wujYfnYhIIzuSwZOl0693+olIcKu
         rDJ80nzguFhLGxbe6rkBjhRiif4ADz241ZMd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A4LYt6kN9SB/9kBxCNUpMPu2fI4vD/suYfh2TVYyskI=;
        b=tH2rv1FeJswxklUYLAzfAMUT4nRWK9pxm53IoOqqI29Fbm/FPrk4YMcIAf2DV8nCHG
         r8SL94fAzjH1blmtEP0+lmdngYXgtavfVbeNi6HnMPIfWXNkzheq8S+SFmIVpu7rnJEI
         I3WMsVFvVjnPWvM7WqSTTXueuPUt9Azeo71Js4MDuZv+BJb1vTnezGFkDRwxYOJGDpjf
         13CkqW7FQ2n63bBhOBbmSm7wL03CGIynYnS9JMlQbZcL/iBWsc6jTAoLz3yosTS8H0Zv
         uugf1tT97+dBGjWKUqEkMB/JkKb3iDigk0uQIegPyIHlKZsf9dckACWauJDWKKupjj29
         +ibA==
X-Gm-Message-State: AJIora+Olbd4Hfkz34Jgql7xWTudEW0eEToamvJpctqL+I46rhj2f4R3
        SwnnFnDmiOqWCMpKEY6owTe7FB1u8PMSW0zp
X-Google-Smtp-Source: AGRyM1sKppVyP/dEtmp7r698M8moC03lOVBmB7X+wy/etfH5Ocgd6Idi2Ugjp9GO6AAY/n+SuXeKOg==
X-Received: by 2002:a05:6870:b022:b0:f2:7975:3420 with SMTP id y34-20020a056870b02200b000f279753420mr5424003oae.87.1655475363361;
        Fri, 17 Jun 2022 07:16:03 -0700 (PDT)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com. [209.85.167.175])
        by smtp.gmail.com with ESMTPSA id m9-20020a9d7ac9000000b0060c030fae2asm2456997otn.54.2022.06.17.07.16.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 07:16:02 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id s124so5613199oia.0
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 07:16:01 -0700 (PDT)
X-Received: by 2002:a05:6808:1896:b0:32f:6cec:af9f with SMTP id
 bi22-20020a056808189600b0032f6cecaf9fmr5132064oib.223.1655475360951; Fri, 17
 Jun 2022 07:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220617103645.71560-1-ribalda@chromium.org> <20220617103645.71560-4-ribalda@chromium.org>
 <YqyGfFK3UXhrBLwK@pendragon.ideasonboard.com> <CANiDSCvOD08QD-2DKmrr2nNF+uC685tcnjBbMg0gGQc5ktR7qg@mail.gmail.com>
 <YqyLfw5Pa5ZMdYX0@pendragon.ideasonboard.com>
In-Reply-To: <YqyLfw5Pa5ZMdYX0@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 17 Jun 2022 16:15:49 +0200
X-Gmail-Original-Message-ID: <CANiDSCuh4TmD_MVvTyoadi40jhdvsMKNLpdaPmGarfS=PK4xkw@mail.gmail.com>
Message-ID: <CANiDSCuh4TmD_MVvTyoadi40jhdvsMKNLpdaPmGarfS=PK4xkw@mail.gmail.com>
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

On Fri, 17 Jun 2022 at 16:11, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Fri, Jun 17, 2022 at 03:55:52PM +0200, Ricardo Ribalda wrote:
> > On Fri, 17 Jun 2022 at 15:50, Laurent Pinchart wrote:
> > > On Fri, Jun 17, 2022 at 12:36:40PM +0200, Ricardo Ribalda wrote:
> > > > Currently all mappings of type V4L2_CTRL_TYPE_MENU, have a minimum of 0,
> > > > but there are some controls (limited powerline), that start with a value
> > > > different than 0.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_ctrl.c | 5 +++--
> > > >  drivers/media/usb/uvc/uvcvideo.h | 1 +
> > > >  2 files changed, 4 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > index 092decfdaa62..3b20b23abd1e 100644
> > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > @@ -1144,7 +1144,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> > > >
> > > >       switch (mapping->v4l2_type) {
> > > >       case V4L2_CTRL_TYPE_MENU:
> > > > -             v4l2_ctrl->minimum = 0;
> > > > +             v4l2_ctrl->minimum = mapping->menu_min;
> > > >               v4l2_ctrl->maximum = mapping->menu_count - 1;
> > > >               v4l2_ctrl->step = 1;
> > > >
> > > > @@ -1264,7 +1264,8 @@ int uvc_query_v4l2_menu(struct uvc_video_chain *chain,
> > > >               goto done;
> > > >       }
> > > >
> > > > -     if (query_menu->index >= mapping->menu_count) {
> > > > +     if (query_menu->index < mapping->menu_min ||
> > > > +         query_menu->index >= mapping->menu_count) {
> > > >               ret = -EINVAL;
> > > >               goto done;
> > > >       }
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index fff5c5c99a3d..6ceb7f7b964d 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -254,6 +254,7 @@ struct uvc_control_mapping {
> > > >       u32 data_type;
> > > >
> > > >       const struct uvc_menu_info *menu_info;
> > > > +     u32 menu_min;
> > > >       u32 menu_count;
> > >
> > > That's a bit of a stop-gap measure, could we turn it into a bitmask
> > > instead ?
> >
> > Unfortunately that is uAPI :(
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/v4l2-controls.h#n101
> >
> > We have to keep the control type and its values.
>
> Sure, I didn't mean changing that, but replacing menu_min and menu_count
> in uvc_control_mapping with a menu_mask that stores a bitmask of all
> supported values. This will allow skipping the first value in the power
> line frequency control case, but will also support skipping other menu
> entries for other controls in the future.

Ahh gotcha. Will implement that in the next version.

Thanks!

>
> > > >
> > > >       u32 master_id;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
