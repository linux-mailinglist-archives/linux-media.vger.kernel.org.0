Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 437DE65298E
	for <lists+linux-media@lfdr.de>; Wed, 21 Dec 2022 00:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234145AbiLTXBP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Dec 2022 18:01:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234052AbiLTXBN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Dec 2022 18:01:13 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F28E01F2D3
        for <linux-media@vger.kernel.org>; Tue, 20 Dec 2022 15:01:12 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso344429pjt.0
        for <linux-media@vger.kernel.org>; Tue, 20 Dec 2022 15:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KkiJ1ANycOXXcLUSQunU9hEFpqvc/70bYGXZQhbyeNg=;
        b=Ar3IxXrjO3+TRdtQqazvIuXU9c0ET//xY/lBbKAynjrFCGSMq0S0raOICgiIBgfMHk
         Ls1drrCWCUgsW30MOqT17Stk/RSeQMMMhw5pAjaJ70VNxzDplCKkMrO6GNHUYQNuEydV
         /uuVMSIB8Fg8u60HXSBg9llVzl1QDNbUgF1kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkiJ1ANycOXXcLUSQunU9hEFpqvc/70bYGXZQhbyeNg=;
        b=HOOOnBFNKs1OuPgUNTUEvA7xcOxMVvCsjYV7zag54x0AjXXMMM98J+8oHUIdKHtFzV
         h06PTabTp9Jduh2hZpwQwGIfAdeLpyItPRbjbudZBdhSUv4ZT6K8tV27J8jH/HD0ilCj
         PK2NKtoyqNOHSr1/+vL9qyP02GzM5u49nOAUaz5wFfVpNP6rWeXjMb6QVPDwuvBj532J
         QJwaKLwgFaY60/i7QDsg8l7BS7Gk0ZvzYVSVpwH9zEhndImkkZZ/+YwV4rVSrumRqB2d
         JNYrqlFHIGI+vQUNj2YurW9RmEYv+/KbsAMg3mbgbPGZDC8989SOufLc2fJF8c56Bjii
         IKOw==
X-Gm-Message-State: AFqh2kowHynhrw7IbAEn5I0lhu2aB8XEfdWKLS5gzEXyEE8f36Z+Rq/V
        X23pLQy/4wDSgfeZbkm/H2LHWdu7XuUgYAGtr7Q=
X-Google-Smtp-Source: AMrXdXtKinAAAX0vvdy6JdLT0Ah/0jkcqqG5sTl5vWDMiuOcZG05T61WMMoWJCG6vJjNe877/6O5aA==
X-Received: by 2002:a17:902:dad0:b0:191:3b7b:3c2c with SMTP id q16-20020a170902dad000b001913b7b3c2cmr3888707plx.22.1671577272259;
        Tue, 20 Dec 2022 15:01:12 -0800 (PST)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com. [209.85.214.174])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090264c200b00189667acf19sm9896885pli.95.2022.12.20.15.01.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 15:01:11 -0800 (PST)
Received: by mail-pl1-f174.google.com with SMTP id 4so13791778plj.3
        for <linux-media@vger.kernel.org>; Tue, 20 Dec 2022 15:01:10 -0800 (PST)
X-Received: by 2002:a17:90b:1489:b0:219:8132:70db with SMTP id
 js9-20020a17090b148900b00219813270dbmr2555154pjb.183.1671577269523; Tue, 20
 Dec 2022 15:01:09 -0800 (PST)
MIME-Version: 1.0
References: <20220920-resend-meta-v4-0-3ac355b66723@chromium.org>
 <20220920-resend-meta-v4-3-3ac355b66723@chromium.org> <Y45tnp0naosOrYCY@pendragon.ideasonboard.com>
 <CANiDSCtRoVQ2+asPmOacarvC2VrJYTbU67+wKJq1ciuMrwguPg@mail.gmail.com>
In-Reply-To: <CANiDSCtRoVQ2+asPmOacarvC2VrJYTbU67+wKJq1ciuMrwguPg@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 21 Dec 2022 00:00:58 +0100
X-Gmail-Original-Message-ID: <CANiDSCtav5U6759tvt7Hm0nR+8Hz22qfWft3OEFOotSeHpxnAA@mail.gmail.com>
Message-ID: <CANiDSCtav5U6759tvt7Hm0nR+8Hz22qfWft3OEFOotSeHpxnAA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] media: uvcvideo: Add a unique suffix to camera names
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Yunke Cao <yunkec@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On Tue, 6 Dec 2022 at 00:02, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Laurent
>
> On Mon, 5 Dec 2022 at 23:16, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Ricardo,
> >
> > Thank you for the patch.
> >
> > On Fri, Dec 02, 2022 at 06:08:19PM +0100, Ricardo Ribalda wrote:
> > > Some cameras have multiple data inputs (i.e. IR sensor and RGB sensor),
> > > append a unique number to the device name.
> > >
> > > Fixes v4l2-compliance:
> > >     Media Controller ioctls:
> > >          fail: v4l2-test-media.cpp(205): v2_entity_names_set.find(key) != v2_entity_names_set.end()
> > >        test MEDIA_IOC_G_TOPOLOGY: FAIL
> > >          fail: v4l2-test-media.cpp(394): num_data_links != num_links
> > >        test MEDIA_IOC_ENUM_ENTITIES/LINKS: FAIL
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index 215fb483efb0..f4032ebb3689 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -1963,7 +1963,8 @@ int uvc_register_video_device(struct uvc_device *dev,
> > >               break;
> > >       }
> > >
> > > -     strscpy(vdev->name, dev->name, sizeof(vdev->name));
> > > +     snprintf(vdev->name, sizeof(vdev->name), "%s %u", dev->name,
> > > +              stream->header.bTerminalLink);
> >
> > This won't be perfect as the string is not guaranteed to fit in
> > vdev->name, but I suppose it will help as a quick fix for some devices.
> > How about the other devices ? Won't they still exhibit the above
> > v4l2-compliance failure ? Isn't that something that will still affect
> > Chrome OS devices ?
>
> We could place the id first... but that will look bad: Eg:
>
> 1- My favorite camera
>
> Another option is to remove the last chars to fit the id. Eg:
>
> My favorite came-1
>
> If you prefer any of those options or have a better idea I can implement that.

@Laurent

Any preference here?

Thanks!

>
>
> >
> > The change should not cause any regression as big as in patch 1/3.
> > However, unless I'm mistaken users will notice a device name change,
> > especially when selecting a device in their web browser. Could that be a
> > problem ?
>
> I think the only side effect is that the first time that the kernel
> changes the naming convention, if there are more than one camera on
> the system, the video conference might pick a different camera.
> The good news is that the user will be presented with cameras with
> different names. Now some cameras show very confusing names:
>
> ribalda@alco:~/work/linux$ for a in /dev/video* ; do yavta -l $a| grep
> "Dell Webcam"; done
> Device `Dell Webcam WB7022' on `usb-0000:2d:00.0-1.2.3.1' (driver
> 'uvcvideo') supports video, capture, without mplanes.
> Device `Dell Webcam WB7022' on `usb-0000:2d:00.0-1.2.3.1' (driver
> 'uvcvideo') supports meta-data, capture, without mplanes.
> Device `Dell Webcam WB7022' on `usb-0000:2d:00.0-1.2.3.1' (driver
> 'uvcvideo') supports video, capture, without mplanes.
> Device `Dell Webcam WB7022' on `usb-0000:2d:00.0-1.2.3.1' (driver
> 'uvcvideo') supports meta-data, capture, without mplanes.
>
>
>
> >
> > >       /*
> > >        * Set the driver data before calling video_register_device, otherwise
> > >
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
