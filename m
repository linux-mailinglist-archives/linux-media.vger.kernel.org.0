Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67F5265378A
	for <lists+linux-media@lfdr.de>; Wed, 21 Dec 2022 21:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234755AbiLUUWQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Dec 2022 15:22:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234843AbiLUUWN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Dec 2022 15:22:13 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F0B3211
        for <linux-media@vger.kernel.org>; Wed, 21 Dec 2022 12:22:12 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id t2so16674614ply.2
        for <linux-media@vger.kernel.org>; Wed, 21 Dec 2022 12:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7JQzBuqQyM2bTW0pqa4hSElcl3luIuOaQMKiXDLdBn8=;
        b=hKQh81V+MzFiymVWz6rtZlab7Cr9d+sBbn/n1QH16YEoI7deFojOt5BVHc3B3ERSWc
         IsVZFyZevXFSERzuv/av+ZXimR7obxCopHzQyM6SMDU1+L82400Pt5qCNl4d+6Os5DqC
         K5LYrW3YApou3fcA2Uyy2WGfWbyHPSzQVqwhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JQzBuqQyM2bTW0pqa4hSElcl3luIuOaQMKiXDLdBn8=;
        b=AogvU3OjHVlxp+hTcfuoBK5IODin3zDPDqpzgT5YZCQxT8GNHpCV1ITPvpQuwBwkr8
         dkr8axsVwh7je1VZkOMyFPg36VuFs1lJQWXf5zQBh3bvpoT0RCdeQWJIhvtY8GL4XPoM
         KwLj69LX4SlpDS3WKJcpmTGGjkq5ee+LxSVDRzybK6ZqX4vFICsnZCgxdDUwV0mi+moR
         uMiU5bKaE2eH+3l8uAym/LOjDAg5V7GuKt2vzIF/lk2LaYVRKyP1t6dIy3raAzJF21Dn
         LK7BE9l8BpfCEtosAYdj16ykmAlAjMuVJMZJjp2pDaCqAkL/9x8V2ZzGgyYBlSkkamaB
         HUvg==
X-Gm-Message-State: AFqh2koe9z6O+UWrbAnhaH7FD0kgtaGbVHTrW6yF8jIxtHdClgEp8G2g
        piZtIfr1d9rJaBVJHSbqDnSX5W9vi4Ea9CvQjbA=
X-Google-Smtp-Source: AMrXdXsYiBsuuSVACZhLRgTqo6dQL//WIRtRw+aZlxSJLDRS2M3NfBsYiJfYBhvBv+xEMdu7qZNE/A==
X-Received: by 2002:a05:6a20:9589:b0:9d:efbf:785f with SMTP id iu9-20020a056a20958900b0009defbf785fmr4233517pzb.20.1671654131461;
        Wed, 21 Dec 2022 12:22:11 -0800 (PST)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id h5-20020a656385000000b0045ff216a0casm10327937pgv.3.2022.12.21.12.22.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 12:22:09 -0800 (PST)
Received: by mail-pj1-f41.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so3562871pjj.2
        for <linux-media@vger.kernel.org>; Wed, 21 Dec 2022 12:22:09 -0800 (PST)
X-Received: by 2002:a17:902:934b:b0:191:2a9b:ec94 with SMTP id
 g11-20020a170902934b00b001912a9bec94mr218738plp.8.1671654128657; Wed, 21 Dec
 2022 12:22:08 -0800 (PST)
MIME-Version: 1.0
References: <20220920-resend-meta-v4-0-3ac355b66723@chromium.org>
 <20220920-resend-meta-v4-3-3ac355b66723@chromium.org> <Y45tnp0naosOrYCY@pendragon.ideasonboard.com>
 <CANiDSCtRoVQ2+asPmOacarvC2VrJYTbU67+wKJq1ciuMrwguPg@mail.gmail.com>
 <CANiDSCtav5U6759tvt7Hm0nR+8Hz22qfWft3OEFOotSeHpxnAA@mail.gmail.com>
 <Y6LmJGgBYfSMBsj+@pendragon.ideasonboard.com> <CANiDSCs3dd7uzts6jgAd-G9pkH5mszxNm2-61T_yAeXBWj6LNw@mail.gmail.com>
 <Y6LsrH9pOVqt6ZXr@pendragon.ideasonboard.com>
In-Reply-To: <Y6LsrH9pOVqt6ZXr@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 21 Dec 2022 21:21:57 +0100
X-Gmail-Original-Message-ID: <CANiDSCumQ3a-vYKGpEYYLxUSL55M4BxqFJRfN=dNdUELhhknEw@mail.gmail.com>
Message-ID: <CANiDSCumQ3a-vYKGpEYYLxUSL55M4BxqFJRfN=dNdUELhhknEw@mail.gmail.com>
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

Hi Laurent

On Wed, 21 Dec 2022 at 12:23, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Wed, Dec 21, 2022 at 11:57:48AM +0100, Ricardo Ribalda wrote:
> > On Wed, 21 Dec 2022 at 11:55, Laurent Pinchart wrote:
> > > On Wed, Dec 21, 2022 at 12:00:58AM +0100, Ricardo Ribalda wrote:
> > > > On Tue, 6 Dec 2022 at 00:02, Ricardo Ribalda wrote:
> > > > > On Mon, 5 Dec 2022 at 23:16, Laurent Pinchart wrote:
> > > > > > On Fri, Dec 02, 2022 at 06:08:19PM +0100, Ricardo Ribalda wrote:
> > > > > > > Some cameras have multiple data inputs (i.e. IR sensor and RGB sensor),
> > >
> > > Did you mean "data outputs" by the way ?
> > >
> > > > > > > append a unique number to the device name.
> > > > > > >
> > > > > > > Fixes v4l2-compliance:
> > > > > > >     Media Controller ioctls:
> > > > > > >          fail: v4l2-test-media.cpp(205): v2_entity_names_set.find(key) != v2_entity_names_set.end()
> > > > > > >        test MEDIA_IOC_G_TOPOLOGY: FAIL
> > > > > > >          fail: v4l2-test-media.cpp(394): num_data_links != num_links
> > > > > > >        test MEDIA_IOC_ENUM_ENTITIES/LINKS: FAIL
> > > > > > >
> > > > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > > > ---
> > > > > > >  drivers/media/usb/uvc/uvc_driver.c | 3 ++-
> > > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > index 215fb483efb0..f4032ebb3689 100644
> > > > > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > > > > @@ -1963,7 +1963,8 @@ int uvc_register_video_device(struct uvc_device *dev,
> > > > > > >               break;
> > > > > > >       }
> > > > > > >
> > > > > > > -     strscpy(vdev->name, dev->name, sizeof(vdev->name));
> > > > > > > +     snprintf(vdev->name, sizeof(vdev->name), "%s %u", dev->name,
> > > > > > > +              stream->header.bTerminalLink);
> > > > > >
> > > > > > This won't be perfect as the string is not guaranteed to fit in
> > > > > > vdev->name, but I suppose it will help as a quick fix for some devices.
> > > > > > How about the other devices ? Won't they still exhibit the above
> > > > > > v4l2-compliance failure ? Isn't that something that will still affect
> > > > > > Chrome OS devices ?
> > > > >
> > > > > We could place the id first... but that will look bad: Eg:
> > > > >
> > > > > 1- My favorite camera
> > > > >
> > > > > Another option is to remove the last chars to fit the id. Eg:
> > > > >
> > > > > My favorite came-1
> > > > >
> > > > > If you prefer any of those options or have a better idea I can implement that.
> > > >
> > > > @Laurent
> > > >
> > > > Any preference here?
> > >
> > > I think the latter is better. Could we do so only when there are
> > > multiple video capture devices (excluding the metadata device) though ?
> > > That way we won't have a weird "-n" suffix in the majority of use cases.
> > >
> > > > > > The change should not cause any regression as big as in patch 1/3.
> > > > > > However, unless I'm mistaken users will notice a device name change,
> > > > > > especially when selecting a device in their web browser. Could that be a
> > > > > > problem ?
> > > > >
> > > > > I think the only side effect is that the first time that the kernel
> > > > > changes the naming convention, if there are more than one camera on
> > > > > the system, the video conference might pick a different camera.
> > > > > The good news is that the user will be presented with cameras with
> > > > > different names. Now some cameras show very confusing names:
> > > > >
> > > > > ribalda@alco:~/work/linux$ for a in /dev/video* ; do yavta -l $a| grep
> > > > > "Dell Webcam"; done
> > > > > Device `Dell Webcam WB7022' on `usb-0000:2d:00.0-1.2.3.1' (driver
> > > > > 'uvcvideo') supports video, capture, without mplanes.
> > > > > Device `Dell Webcam WB7022' on `usb-0000:2d:00.0-1.2.3.1' (driver
> > > > > 'uvcvideo') supports meta-data, capture, without mplanes.
> > > > > Device `Dell Webcam WB7022' on `usb-0000:2d:00.0-1.2.3.1' (driver
> > > > > 'uvcvideo') supports video, capture, without mplanes.
> > > > > Device `Dell Webcam WB7022' on `usb-0000:2d:00.0-1.2.3.1' (driver
> > > > > 'uvcvideo') supports meta-data, capture, without mplanes.
> > >
> > > I'm tempted to add a new model read-only string control to overcome the
> > > length limitation. It could then be combined with other information
> > > (such as the location and supported pixel formats) to create a
> > > user-friendly camera name by applications.
> >
> > Adding the vid:pid would be really useful! Mapping a /dev/videoX to
> > vid:pid is kind of complicated now.
>
> libcamera can help there ;-) We already extract the vendor and product
> ID. They are only used to create the camera ID at the moment, they are
> not exposed to applications independently. That would be a good
> addition.
>
> Overall, device naming is something that we have decided *not* to handle
> in libcamera. We provide information to applications to help them
> construct a meaningful name, but don't create the name ourselves. This
> was decided because naming schemes are dependent on application use
> cases, and in many cases should be localized (e.g. "Front camera" and
> "Back camera" vs. "Etukamera" and "Takakamera").

Thanks for the explanation!

My use case is: vendor apps for doing provisioning or low level
testing. Libcamera would be a bit too much for that ;)

Most of the time they do not get an image, but set fancy controls.


Regards!


>
> > > > > > >       /*
> > > > > > >        * Set the driver data before calling video_register_device, otherwise
> > > > > > >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
