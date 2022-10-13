Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 652AD5FD75B
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 11:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbiJMJwo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 05:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiJMJwm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 05:52:42 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B3E34986
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 02:52:41 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id q9so2835567ejd.0
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 02:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AoKI2vOYc5tZM495OxV5phmfH4KToiq3yYB/CnPAAyI=;
        b=CuF84pvTDI18hDf7JuJ5uEVcQtROmZAPyJNfELFUdNBcjLKf3eKiFtf+aDLxc3MgB/
         pYWw/ZX/wdRnWonXeVMswNc4VgRfMLNW2wesHA/szz4eGkLlF7lOI1/ELDONscuhFt65
         6c/wQDY0SlBsDA/psnvKqpHy7+d+FzD3qAoUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AoKI2vOYc5tZM495OxV5phmfH4KToiq3yYB/CnPAAyI=;
        b=27WqyNMKPFfHKHTCm/hpy0uYelHTju1+d3xD/WmsUT/MXTXKzrjHhalsHUwxwI0iXV
         ngnXEtCXNT49gjfOdErNqd4q4CoajxCCg6nDFFLNjjR00HBHV01OjCar1W2DLNlhSMLD
         j0akBZWKdfiTKFfM+ubuWaPCqUJ5qp+kZvIjt3iAswSMD0CXjUk8hoEgh8FM1Jzt94Sp
         fqM5YC3FOsPr95KjKRRPIvw1NRX0DbYpamz8+bQMSr0AffeI9uRj3vrd2dvEm75LKJ54
         Lxl5y7r4Wgb6KVPCspgV8Zf7qPgZ1R+Fox393TAXHVOTcPIKGxL5rLQF2EpIk+A6i9S5
         7fvQ==
X-Gm-Message-State: ACrzQf1LH0Qb1MeRO1vvCOUVV/AB86mWpS3PAmWRWe9WhmRZih/QX7IB
        6yzqwIM/kv3p0vtyZ7dRJSIEGikfpe30fw==
X-Google-Smtp-Source: AMsMyM59P4Fno3nqmDz68tW7RYoJBqK8HmIA/Oi1WPvDVTwYWv2kFHxidEkJG5V4jgMQ7aWGa5Hf2g==
X-Received: by 2002:a17:907:968e:b0:78d:d4c7:b74f with SMTP id hd14-20020a170907968e00b0078dd4c7b74fmr10125081ejc.727.1665654759670;
        Thu, 13 Oct 2022 02:52:39 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id k21-20020a17090627d500b00738467f743dsm2754968ejc.5.2022.10.13.02.52.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 02:52:39 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id b2so2733654eja.6
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 02:52:38 -0700 (PDT)
X-Received: by 2002:a17:907:7245:b0:78d:ec9c:e743 with SMTP id
 ds5-20020a170907724500b0078dec9ce743mr7550379ejc.466.1665654758301; Thu, 13
 Oct 2022 02:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220929-remove_private_control_check-v1-0-80a304b76269@chromium.org>
 <00c6c05e-de08-5823-2692-fadc65b218a9@xs4all.nl>
In-Reply-To: <00c6c05e-de08-5823-2692-fadc65b218a9@xs4all.nl>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 13 Oct 2022 11:52:27 +0200
X-Gmail-Original-Message-ID: <CANiDSCs-ajz_NUF0ZYbOdrfC5PXy82_iJiE2BsY5i6xF5ote=A@mail.gmail.com>
Message-ID: <CANiDSCs-ajz_NUF0ZYbOdrfC5PXy82_iJiE2BsY5i6xF5ote=A@mail.gmail.com>
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

Hi Hans


On Thu, 13 Oct 2022 at 09:55, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi Yunke,
>
> On 9/29/22 06:11, Yunke Cao wrote:
> > Removing priv_user_controls and its related checks.
> >
> > I suspect this is wrong because:
> >
> > 1. priv_user_controls == priv_user_controls_check is not always true.
> >
> > priv_user_controls counts the number of controls with
> > id >= V4L2_CID_PRIVATE_BASE (0x08000000).
> > priv_user_controls_check uses V4L2_CTRL_DRIVER_PRIV ((id) & 0xffff) >= 0x1000).
> >
> > The private controls defined in V4L2_CID_USER_BASE + 0x1000 will count towards
> > priv_user_controls_check, but not priv_user_controls. For example,
> > V4L2_CID_USER_MEYE_BASE (include/uapi/linux/v4l2-controls.h#n158).
> >
> > 2. Line 205 returns error for id >= V4L2_CID_PRIVATE_BASE. Counting
> > priv_user_controls will not happen.
>
> A long time ago all private controls in a driver started at ID V4L2_CID_PRIVATE_BASE.
> When the control framework was created, all private controls were changed to start
> at a control class base + 0x1000, and to stay compatible with old userspace the
> control framework emulated enumerating such controls from V4L2_CID_PRIVATE_BASE.

The emulated controls are also enumerated with?

qctrl.id = id | V4L2_CTRL_FLAG_NEXT_CTRL | V4L2_CTRL_FLAG_NEXT_COMPOUND; ?

Because if so, they wont pass the test:

if (id >= V4L2_CID_PRIVATE_BASE)
    return fail("no V4L2_CID_PRIVATE_BASE allowed\n");

Thanks!



>
> These compliance tests verify that that emulation is still working correctly.
>
> So this code is OK. If you have an example of where it fails, then that is likely
> to be a bug elsewhere. I would need more information to see what could be the cause
> in that case.
>
> For the record:
>
> Rejected-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>
> Regards,
>
>         Hans
>
> >
> > Signed-off-by: Yunke Cao <yunkec@chromium.org>
> > ---
> > ---
> >  utils/v4l2-compliance/v4l2-test-controls.cpp | 22 +---------------------
> >  1 file changed, 1 insertion(+), 21 deletions(-)
> >
> > diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
> > index 999dbcd7..18c9f638 100644
> > --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> > +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> > @@ -182,7 +182,6 @@ int testQueryExtControls(struct node *node)
> >       __u32 which = 0;
> >       bool found_ctrl_class = false;
> >       unsigned user_controls = 0;
> > -     unsigned priv_user_controls = 0;
> >       unsigned user_controls_check = 0;
> >       unsigned priv_user_controls_check = 0;
> >       unsigned class_count = 0;
> > @@ -299,30 +298,11 @@ int testQueryExtControls(struct node *node)
> >               user_controls++;
> >       }
> >
> > -     for (id = V4L2_CID_PRIVATE_BASE; ; id++) {
> > -             memset(&qctrl, 0xff, sizeof(qctrl));
> > -             qctrl.id = id;
> > -             ret = doioctl(node, VIDIOC_QUERY_EXT_CTRL, &qctrl);
> > -             if (ret && ret != EINVAL)
> > -                     return fail("invalid query_ext_ctrl return code (%d)\n", ret);
> > -             if (ret)
> > -                     break;
> > -             if (qctrl.id != id)
> > -                     return fail("qctrl.id (%08x) != id (%08x)\n",
> > -                                     qctrl.id, id);
> > -             if (checkQCtrl(node, qctrl))
> > -                     return fail("invalid control %08x\n", qctrl.id);
> > -             priv_user_controls++;
> > -     }
> > -
> > -     if (priv_user_controls + user_controls && node->controls.empty())
> > +     if (user_controls && node->controls.empty())
> >               return fail("does not support V4L2_CTRL_FLAG_NEXT_CTRL\n");
> >       if (user_controls != user_controls_check)
> >               return fail("expected %d user controls, got %d\n",
> >                       user_controls_check, user_controls);
> > -     if (priv_user_controls != priv_user_controls_check)
> > -             return fail("expected %d private controls, got %d\n",
> > -                     priv_user_controls_check, priv_user_controls);
> >       return result;
> >  }
> >
> >
> > ---
> > base-commit: 7f560aede797b659b585f063ed1f143f58b03df5
> > change-id: 20220929-remove_private_control_check-ab8cc38a1b9e
> >
> > Best regards,



-- 
Ricardo Ribalda
