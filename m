Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59FFD4E6A71
	for <lists+linux-media@lfdr.de>; Thu, 24 Mar 2022 22:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353144AbiCXV62 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Mar 2022 17:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347016AbiCXV6X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Mar 2022 17:58:23 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F9EB7C50
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 14:56:51 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id b15so7182785edn.4
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 14:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vhw38vbXipX7u0NiS9SPzi2ny2npVGnBq44scC9ARHk=;
        b=fE82jSKgfioc5LwK3WEfeXoniU1mEx+i9pOUZcUQHAk/i3Omm20L1YiD9F+oLGK+0z
         xxQPpUStahq3oJN6w8EzYFkt0iiq3wyOTXFHjvp0NRl/EYgGysEBqN4s4ZmzSAZ858Cr
         nM+xA25PIXSxzRwVvJh0B8LSj5OeJ1bN6SOHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vhw38vbXipX7u0NiS9SPzi2ny2npVGnBq44scC9ARHk=;
        b=QITZVm/nDI1iTYbiKKySW5xu9VPs9u9lr7XMottHt+9u3d1NM4ueLBCET/Mok5nm4h
         0ipibOv9l+DThin7duYjnnPE6VTWLKJR9EnB4V+ddjmuVcWTfHSAjoOUecl+CxnKLjkZ
         NlkyJGM0lb0GUIZAArzkfzbDGEIOssB1YBBpWJ93iznMk36MBquSv1xXgo9Da7T1vhlC
         wTlR+zVXNzUsonxmTJEm/Lu6BJ8x+K6TGfLxUSSzarZX5WaRqvLIeQId4dgprNZI3iWu
         dspNjQGkUWdDhbVWJBcE70yL+OWkxq7ynXuQYxYmjJ+nhc/pCsLCmeCWytsyDqMhq3j0
         Ps7Q==
X-Gm-Message-State: AOAM530gOi5A6byujnXRO88YRazOZ8rSpwT8nnXuBTtlvYHLLUNzipvV
        WTPrpAH/Q7LTTqtT5rXdqMvFGuYRL/uFTg==
X-Google-Smtp-Source: ABdhPJxKy6vdEOPkGGBZ+2y+Vy80DaU+FafMC6i6TnOr+MrWlQncZvyaTL8XBgimNPSXCZTxaiRaGg==
X-Received: by 2002:a05:6402:1941:b0:413:2b80:b245 with SMTP id f1-20020a056402194100b004132b80b245mr9308457edz.252.1648159009715;
        Thu, 24 Mar 2022 14:56:49 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id bm24-20020a170906c05800b006d58518e55fsm1572566ejb.46.2022.03.24.14.56.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Mar 2022 14:56:48 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id z92so7144074ede.13
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 14:56:48 -0700 (PDT)
X-Received: by 2002:a05:6402:350b:b0:419:1c11:23ed with SMTP id
 b11-20020a056402350b00b004191c1123edmr9290598edd.8.1648159008224; Thu, 24 Mar
 2022 14:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220215184228.2531386-1-ribalda@chromium.org> <YjzTnlf92rY/X6Lv@pendragon.ideasonboard.com>
In-Reply-To: <YjzTnlf92rY/X6Lv@pendragon.ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 24 Mar 2022 22:56:37 +0100
X-Gmail-Original-Message-ID: <CANiDSCupfHeXk_VcwyqQBbaOBQeb3ProsP=+HGf0g9eXCWAGqw@mail.gmail.com>
Message-ID: <CANiDSCupfHeXk_VcwyqQBbaOBQeb3ProsP=+HGf0g9eXCWAGqw@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Fix handling on Bitmask controls
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

Thanks for your review :) :)

On Thu, 24 Mar 2022 at 21:25, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Tue, Feb 15, 2022 at 06:42:28PM +0000, Ricardo Ribalda wrote:
> > Minimum and step values for V4L2_CTRL_TYPE_BITMASK controls should be 0.
> > There is no need to query the camera firmware about this and maybe get
> > invalid results.
> >
> > Also value should be clamped to the min/max value advertised by the
> > hardware.
> >
> > Fixes v4l2-compliane:
> > Control ioctls (Input 0):
> >                 fail: v4l2-test-controls.cpp(97): minimum must be 0 for a bitmask control
> >       test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
>
> What bitmask control do you have ? The driver has no standard control
> that use the V4L2_CTRL_TYPE_BITMASK type.
>
> UVC doesn't formally define bitmask control type
> (UVC_CTRL_DATA_TYPE_BITMASK). In UVC 1.1 only the UVC_CT_AE_MODE_CONTROL
> control has a bitmap type, and only one bit can be set at a type. It
> thus maps to a V4L2 menu control.
>
> In UVC 1.5 there are other controls documented as bitmap controls,
> which could map to the V4L2 bitmask control type. Those don't support
> GET_MIN and GET_MAX, but use GET_RES to report the list of bits that can
> be set. This should be mapped to the V4L2 control maximum value, which
> isn't handled by this patch. The last hunk is also incorrect, as it
> clamps the value to what is reported by GET_MIN and GET_MAX, instead of
> [0, GET_RES], but more than that, it should not just clamp the value,
> but check that all bits are valid.

I am particularly looking at bmAutoControls from CT_REGION_OF_INTEREST_CONTROL

The doc says that:
"""
 To detect if a device supports a particular Auto Control, use GET_MAX
which returns a mask indicating all supported Auto Controls.
"""

GET_RES does not seem to return the max_value accoring to the uvc
class spec, but I will try to validate tomorrow with real hardware,
maybe we are lucky.

And I definitely have to fix the clamp, thanks for pointing that out :)

>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index b4f6edf968bc0..d8b9ab5b7fb85 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1156,7 +1156,8 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >               break;
> >       }
> >
> > -     if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
> > +     if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN &&
> > +         mapping->v4l2_type != V4L2_CTRL_TYPE_BITMASK)
> >               v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
> >                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
> >
> > @@ -1164,7 +1165,8 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >               v4l2_ctrl->maximum = mapping->get(mapping, UVC_GET_MAX,
> >                                    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
> >
> > -     if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES)
> > +     if (ctrl->info.flags & UVC_CTRL_FLAG_GET_RES &&
> > +         mapping->v4l2_type != V4L2_CTRL_TYPE_BITMASK)
> >               v4l2_ctrl->step = mapping->get(mapping, UVC_GET_RES,
> >                                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
> >
> > @@ -1721,6 +1723,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >       /* Clamp out of range values. */
> >       switch (mapping->v4l2_type) {
> >       case V4L2_CTRL_TYPE_INTEGER:
> > +     case V4L2_CTRL_TYPE_BITMASK:
> >               if (!ctrl->cached) {
> >                       ret = uvc_ctrl_populate_cache(chain, ctrl);
> >                       if (ret < 0)
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
