Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A00AB5812DE
	for <lists+linux-media@lfdr.de>; Tue, 26 Jul 2022 14:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238888AbiGZMLX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jul 2022 08:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232677AbiGZMLW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jul 2022 08:11:22 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 665EE2B1AD
        for <linux-media@vger.kernel.org>; Tue, 26 Jul 2022 05:11:21 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id c72so14582337edf.8
        for <linux-media@vger.kernel.org>; Tue, 26 Jul 2022 05:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fje8hLYCxQysVHabBBLpsR2mW8iL7xpKRUwC3/DH3/Y=;
        b=XXoGBQY4n7kj5DXy4hI8NuwbE5o+bf9aMijyUklHnYnsOnH58B1/HKV/y/WGwrstBK
         8Pf92OUB/0ZpAJF5yEraoeR2wqGc491F1dXv12jxYB7qQiCheJ/pSQuxYwqNTJzvnv6k
         WrI+xd3GAxQJ4lnMVMJdi0g1hiaZ9zFK+NbSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fje8hLYCxQysVHabBBLpsR2mW8iL7xpKRUwC3/DH3/Y=;
        b=0NqEsTpXUT3EQ8Dc9TT4pPRgjifO5yhjyn1zfuNGpMLIeM99v3wpZgIiD8/RCT8n3X
         tB9TO/5kAtuoOb7PJm+EF0Fv3QrWu68rL+rtOtvJEV1nfbJOxye6w27WxlW9m8F6idpR
         MY+iIu+Z2lwZ6u+UDlOByM90U5ozhHXqwgV+csf5JWcJNMbrNeo5e4QSz9QE75egWtX4
         GzjcY3UGUpmtN/Gl8LQhEqyq7dABs+F7VvElolL1lkz3SB4F77/MpWWxZ//tbufQxFfX
         ntQningqOesRrEpzp51Z3IU2u8c6JHNLQig8+YOxI/+VleWI7+BjFXMsDwEZybr6ezRr
         +7Ug==
X-Gm-Message-State: AJIora+h/+49YE8+aFiZD1oHbzDxdfTn/2145U3kv1d7aPmapKzs1uj2
        n2xJPxTL9KuAi0VE9ftE/erOaTdfBlRnTQ==
X-Google-Smtp-Source: AGRyM1sceczcBf5Vs0jnbCq1mrskK8LHzHaf3kf0a9h5cTnKdQK4jujVSgjixtxXvwzAEmuvDbr23w==
X-Received: by 2002:a05:6402:11ca:b0:43c:78f:7041 with SMTP id j10-20020a05640211ca00b0043c078f7041mr8900947edw.321.1658837479522;
        Tue, 26 Jul 2022 05:11:19 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id p4-20020a17090653c400b0072fd6e9f707sm2358364ejo.100.2022.07.26.05.11.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 05:11:19 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id fy29so25674189ejc.12
        for <linux-media@vger.kernel.org>; Tue, 26 Jul 2022 05:11:19 -0700 (PDT)
X-Received: by 2002:a17:907:2cd3:b0:72b:5cc2:bc1f with SMTP id
 hg19-20020a1709072cd300b0072b5cc2bc1fmr13571598ejc.574.1658837478788; Tue, 26
 Jul 2022 05:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220718121219.16079-1-laurent.pinchart@ideasonboard.com> <CANiDSCuSW4et50rjNi33z4mwhy6fAnub1cXZFJ2wUKaOObTD8Q@mail.gmail.com>
In-Reply-To: <CANiDSCuSW4et50rjNi33z4mwhy6fAnub1cXZFJ2wUKaOObTD8Q@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 26 Jul 2022 14:11:07 +0200
X-Gmail-Original-Message-ID: <CANiDSCvh0Zy8PbMW5yFWfExjEzPTdvWGjYmGCw=eychHFs0sAw@mail.gmail.com>
Message-ID: <CANiDSCvh0Zy8PbMW5yFWfExjEzPTdvWGjYmGCw=eychHFs0sAw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix invalid pointer in uvc_ctrl_init_ctrl()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Arghh

it seems like the merged version was not the latest version, so yes,
this patch is needed.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

By the way, are you still interested in this:

https://patchwork.linuxtv.org/project/linux-media/patch/20220617235610.321917-5-ribalda@chromium.org/

So I prepare a new version for it.

On Tue, 26 Jul 2022 at 14:00, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Laurent
>
> Is this needed?
>
> It is already part of v8
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20220617235610.321917-3-ribalda@chromium.org/
>
> On Mon, 18 Jul 2022 at 14:12, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > The handling of per-device mappings introduced in commit 86f7ef773156
> > ("media: uvcvideo: Add support for per-device control mapping
> > overrides") overwrote the mapping variable after it was initialized and
> > before it was used, leading to usage of an invalid pointer for devices
> > with per-device mappings. Fix it.
> >
> > Fixes: 86f7ef773156 ("media: uvcvideo: Add support for per-device control mapping overrides")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index e4826a846861..8c208db9600b 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -2413,9 +2413,8 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
> >  {
> >         const struct uvc_control_info *info = uvc_ctrls;
> >         const struct uvc_control_info *iend = info + ARRAY_SIZE(uvc_ctrls);
> > -       const struct uvc_control_mapping *mapping = uvc_ctrl_mappings;
> > -       const struct uvc_control_mapping *mend =
> > -               mapping + ARRAY_SIZE(uvc_ctrl_mappings);
> > +       const struct uvc_control_mapping *mapping;
> > +       const struct uvc_control_mapping *mend;
> >
> >         /*
> >          * XU controls initialization requires querying the device for control
> > @@ -2468,6 +2467,9 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
> >         }
> >
> >         /* Process common mappings next. */
> > +       mapping = uvc_ctrl_mappings;
> > +       mend = mapping + ARRAY_SIZE(uvc_ctrl_mappings);
> > +
> >         for (; mapping < mend; ++mapping) {
> >                 if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> >                     ctrl->info.selector == mapping->selector)
> >
> > base-commit: 8bd1dbf8d580c425605fb8936309a4e9745a7a95
> > prerequisite-patch-id: 89d2dc61eb83afb89fb075a63e161ea0b87fdcc7
> > prerequisite-patch-id: 01354ee4b874fea1acc040a23badff034588362f
> > prerequisite-patch-id: 7ae47f109892b89675acbdc0c6bcc1487436ec78
> > --
> > Regards,
> >
> > Laurent Pinchart
> >
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
