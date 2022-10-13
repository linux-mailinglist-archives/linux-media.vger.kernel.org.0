Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E89E5FD762
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 11:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiJMJ4Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 05:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiJMJ4X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 05:56:23 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F20A188
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 02:56:22 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id l22so1857523edj.5
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 02:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A4dh0HFJlkveN//K6RJjgzpXmTNIMLEhG8tryU7ITss=;
        b=axXkLVbQrq8W+rHzvIo4ez2SN87lR5nSwYasLjyVfCFlgAWPKt+gMxAMpgY4cqU5YJ
         6SWj601uq71rqswc0F0zHjaZKdpBchhJOPXpkbnGj0eJM6uiRg8p1ATwQavahs8wrunZ
         LtEN8wbrS7yN40utmxyZnLsYKaG6FXL6iFuT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4dh0HFJlkveN//K6RJjgzpXmTNIMLEhG8tryU7ITss=;
        b=r41AC5U+tJoQ7dAjRQjPxk3q+oMDISroVIl1qKvpbThLKobuQG/SOQtHLl/gRGSTdj
         0OPT6+L7iEBjC+2lK3rwjqH9IM2UWptTZnuoU9rvt9by60t1lwTJhUZGSLaQc2ULchrG
         YnWBTy5JJLVCKZZDicc9lJwlaNMqtJws3qxSztDSYAIvka814q7n1IttKwQum27yETP5
         VGiWZU8fz48XqfdSZ04gkhwhayBWunFhKbw+uTHimcMZuEMuqeohMbmg3tn1Y2YEUKxv
         i7JTfIz7OPUhh8dRVEZvx6Wp9j5UJZWYmSsZyCs0NuH8l8lLxCVaMuUR8dfF8XdPSdI5
         SEkw==
X-Gm-Message-State: ACrzQf3JyJNGLmae+Q9reZORg59IOOgqZruSQj9RUC2WablAROI22e89
        Zm02j11wsctUwVyCjjWxpt7mhnUROluyBA==
X-Google-Smtp-Source: AMsMyM79JKsrJ5OY5gEApLJYhBdpdN44kIdRL5Mgsb9QnGIPeyjv44Fo+qWE+t7Dm/733/mUk1sZyQ==
X-Received: by 2002:a05:6402:1bc6:b0:45c:7611:d86e with SMTP id ch6-20020a0564021bc600b0045c7611d86emr11675482edb.194.1665654980356;
        Thu, 13 Oct 2022 02:56:20 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id h9-20020a170906854900b0078d3f96d293sm2729834ejy.30.2022.10.13.02.56.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 02:56:19 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id d26so2728491ejc.8
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 02:56:19 -0700 (PDT)
X-Received: by 2002:a17:907:31c1:b0:742:28a3:5d08 with SMTP id
 xf1-20020a17090731c100b0074228a35d08mr25879745ejb.112.1665654979518; Thu, 13
 Oct 2022 02:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220929-remove_private_control_check-v1-0-80a304b76269@chromium.org>
 <00c6c05e-de08-5823-2692-fadc65b218a9@xs4all.nl> <CANiDSCs-ajz_NUF0ZYbOdrfC5PXy82_iJiE2BsY5i6xF5ote=A@mail.gmail.com>
 <73113af5-7482-0242-52ae-79168c101fdd@xs4all.nl>
In-Reply-To: <73113af5-7482-0242-52ae-79168c101fdd@xs4all.nl>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 13 Oct 2022 11:56:08 +0200
X-Gmail-Original-Message-ID: <CANiDSCudOnnZTijAJbPzZ8-1d4=nn=269SxhgRbwpAwV51hxeg@mail.gmail.com>
Message-ID: <CANiDSCudOnnZTijAJbPzZ8-1d4=nn=269SxhgRbwpAwV51hxeg@mail.gmail.com>
Subject: Re: [PATCH] Remove priv_user_controls in v4l2-test-controls
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 13 Oct 2022 at 11:54, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
>
>
> On 10/13/22 11:52, Ricardo Ribalda wrote:
> > Hi Hans
> >
> >
> > On Thu, 13 Oct 2022 at 09:55, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> Hi Yunke,
> >>
> >> On 9/29/22 06:11, Yunke Cao wrote:
> >>> Removing priv_user_controls and its related checks.
> >>>
> >>> I suspect this is wrong because:
> >>>
> >>> 1. priv_user_controls == priv_user_controls_check is not always true.
> >>>
> >>> priv_user_controls counts the number of controls with
> >>> id >= V4L2_CID_PRIVATE_BASE (0x08000000).
> >>> priv_user_controls_check uses V4L2_CTRL_DRIVER_PRIV ((id) & 0xffff) >= 0x1000).
> >>>
> >>> The private controls defined in V4L2_CID_USER_BASE + 0x1000 will count towards
> >>> priv_user_controls_check, but not priv_user_controls. For example,
> >>> V4L2_CID_USER_MEYE_BASE (include/uapi/linux/v4l2-controls.h#n158).
> >>>
> >>> 2. Line 205 returns error for id >= V4L2_CID_PRIVATE_BASE. Counting
> >>> priv_user_controls will not happen.
> >>
> >> A long time ago all private controls in a driver started at ID V4L2_CID_PRIVATE_BASE.
> >> When the control framework was created, all private controls were changed to start
> >> at a control class base + 0x1000, and to stay compatible with old userspace the
> >> control framework emulated enumerating such controls from V4L2_CID_PRIVATE_BASE.
> >
> > The emulated controls are also enumerated with?
> >
> > qctrl.id = id | V4L2_CTRL_FLAG_NEXT_CTRL | V4L2_CTRL_FLAG_NEXT_COMPOUND; ?
>
> No, they are not.
>
> >
> > Because if so, they wont pass the test:
> >
> > if (id >= V4L2_CID_PRIVATE_BASE)
> >     return fail("no V4L2_CID_PRIVATE_BASE allowed\n");
>
> Exactly: they should never be enumerated that way, if they appear, then the
> emulation is broken and this test fails.


Gotcha...  I was not aware of that emulation.

So that means we have to add that emulation to uvc control framework :(

Thanks!
>
> Regards,
>
>         Hans
>
> >
> > Thanks!
> >
> >
> >
> >>
> >> These compliance tests verify that that emulation is still working correctly.
> >>
> >> So this code is OK. If you have an example of where it fails, then that is likely
> >> to be a bug elsewhere. I would need more information to see what could be the cause
> >> in that case.
> >>
> >> For the record:
> >>
> >> Rejected-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>> Signed-off-by: Yunke Cao <yunkec@chromium.org>
> >>> ---
> >>> ---
> >>>  utils/v4l2-compliance/v4l2-test-controls.cpp | 22 +---------------------
> >>>  1 file changed, 1 insertion(+), 21 deletions(-)
> >>>
> >>> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
> >>> index 999dbcd7..18c9f638 100644
> >>> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> >>> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> >>> @@ -182,7 +182,6 @@ int testQueryExtControls(struct node *node)
> >>>       __u32 which = 0;
> >>>       bool found_ctrl_class = false;
> >>>       unsigned user_controls = 0;
> >>> -     unsigned priv_user_controls = 0;
> >>>       unsigned user_controls_check = 0;
> >>>       unsigned priv_user_controls_check = 0;
> >>>       unsigned class_count = 0;
> >>> @@ -299,30 +298,11 @@ int testQueryExtControls(struct node *node)
> >>>               user_controls++;
> >>>       }
> >>>
> >>> -     for (id = V4L2_CID_PRIVATE_BASE; ; id++) {
> >>> -             memset(&qctrl, 0xff, sizeof(qctrl));
> >>> -             qctrl.id = id;
> >>> -             ret = doioctl(node, VIDIOC_QUERY_EXT_CTRL, &qctrl);
> >>> -             if (ret && ret != EINVAL)
> >>> -                     return fail("invalid query_ext_ctrl return code (%d)\n", ret);
> >>> -             if (ret)
> >>> -                     break;
> >>> -             if (qctrl.id != id)
> >>> -                     return fail("qctrl.id (%08x) != id (%08x)\n",
> >>> -                                     qctrl.id, id);
> >>> -             if (checkQCtrl(node, qctrl))
> >>> -                     return fail("invalid control %08x\n", qctrl.id);
> >>> -             priv_user_controls++;
> >>> -     }
> >>> -
> >>> -     if (priv_user_controls + user_controls && node->controls.empty())
> >>> +     if (user_controls && node->controls.empty())
> >>>               return fail("does not support V4L2_CTRL_FLAG_NEXT_CTRL\n");
> >>>       if (user_controls != user_controls_check)
> >>>               return fail("expected %d user controls, got %d\n",
> >>>                       user_controls_check, user_controls);
> >>> -     if (priv_user_controls != priv_user_controls_check)
> >>> -             return fail("expected %d private controls, got %d\n",
> >>> -                     priv_user_controls_check, priv_user_controls);
> >>>       return result;
> >>>  }
> >>>
> >>>
> >>> ---
> >>> base-commit: 7f560aede797b659b585f063ed1f143f58b03df5
> >>> change-id: 20220929-remove_private_control_check-ab8cc38a1b9e
> >>>
> >>> Best regards,
> >
> >
> >



-- 
Ricardo Ribalda
