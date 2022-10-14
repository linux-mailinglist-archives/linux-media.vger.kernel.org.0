Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 555AD5FE6E1
	for <lists+linux-media@lfdr.de>; Fri, 14 Oct 2022 04:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbiJNCTB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 22:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbiJNCTA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 22:19:00 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C98FE8C56
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 19:18:58 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id i6so3446396pli.12
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 19:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8hA+KuWB540jAYeiCWL/W3PiNNmWOB6cYTxAVR0olL8=;
        b=YX9tXaSqYvIoT9m5jCVchaBReCejz5qvPalFb7FJaqDBTHSFpruQdUB9b9uH5Wp2lb
         INQRBZ25S1+7AdcdeO2yxBjbcRuXnGt5vUFf0BikSMRVBI5UcY3eidn6wFroRxTIT8aE
         qwxEQOPoO7uzsr3hLWB/X1u0uetckTLtHFVbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8hA+KuWB540jAYeiCWL/W3PiNNmWOB6cYTxAVR0olL8=;
        b=ws4Mo2ig9K1XvSxbtCXDJdUybD+u5dbA5ipPJ6sKHqJKX5hPRttmJ8l1tki5rWLPzU
         nW1jE/48Lets3Stt/GvZbIkH4GRW2/ySawEdasQ/nf/JZtTwu0pfv0VSiFSWJkbBLPCQ
         rST3yEFHOmI/gTVMPVRc2+eR3EDPWF+Udn93Z/CWJZQUjZHEDXq6NABxiaZ3jDUIkbtL
         KKmCYfOuB6fIl4wS1DaHiLZ+YTF5Uez900ZAONHZ6u0vIBu/75vsc5/gtyNzEhptbTho
         jezXqfwyt82y5wZaJGJJ9/lQuMZq6rLlSyHcBRojZg5SEEWnSfHe47xHi6N5EANBqwOc
         6epw==
X-Gm-Message-State: ACrzQf0GCTUvl/gR717IbCRhWABvfiumt+D2DmdMjK+I0kyGcwtJwpvn
        gmU7xVjzcWBwNgFb2F+2t3iFDDuz17Xhp7fYnTOUbA==
X-Google-Smtp-Source: AMsMyM7mbIsdVlv8YP8fGIRHE88H9YMPy2WZ3kf5yL8P52O69UARqCfv2dOxPW5/S4WyM134uHNEhsOdaU1bZVG6SDc=
X-Received: by 2002:a17:903:183:b0:184:8c1a:7a95 with SMTP id
 z3-20020a170903018300b001848c1a7a95mr2990618plg.137.1665713937774; Thu, 13
 Oct 2022 19:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220929-remove_private_control_check-v1-0-80a304b76269@chromium.org>
 <00c6c05e-de08-5823-2692-fadc65b218a9@xs4all.nl> <CANiDSCs-ajz_NUF0ZYbOdrfC5PXy82_iJiE2BsY5i6xF5ote=A@mail.gmail.com>
 <73113af5-7482-0242-52ae-79168c101fdd@xs4all.nl> <CANiDSCudOnnZTijAJbPzZ8-1d4=nn=269SxhgRbwpAwV51hxeg@mail.gmail.com>
 <48e8b244-cee6-2d48-ad5e-1fc203aefe0f@xs4all.nl>
In-Reply-To: <48e8b244-cee6-2d48-ad5e-1fc203aefe0f@xs4all.nl>
From:   Yunke Cao <yunkec@chromium.org>
Date:   Fri, 14 Oct 2022 11:18:46 +0900
Message-ID: <CAEDqmY4kpt+4-U1+3wJ5SXbQJeLXF03hr1+hwG9DtxUROtEWDw@mail.gmail.com>
Subject: Re: [PATCH] Remove priv_user_controls in v4l2-test-controls
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Ricardo,

Thanks for explaining! This makes sense to me now.

V4L2_CID_UVC_REGION_OF_INTEREST_AUTO passes this check now, because
we're using camera base + 0x1000 at the moment (may change after
review?).
The priv_user_control_checks seems to only count user base + 0x1000
but not other control classes
((https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-compliance/v4l2-test-controls.cpp#n222)).

I wonder if it is okay to keep this as it is?
I'm happy to implement and test what Hans suggested above. If it's still needed.

Best,
Yunke

On Thu, Oct 13, 2022 at 7:05 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi Ricardo,
>
> On 10/13/22 11:56, Ricardo Ribalda wrote:
> > On Thu, 13 Oct 2022 at 11:54, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >>
> >>
> >> On 10/13/22 11:52, Ricardo Ribalda wrote:
> >>> Hi Hans
> >>>
> >>>
> >>> On Thu, 13 Oct 2022 at 09:55, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>>>
> >>>> Hi Yunke,
> >>>>
> >>>> On 9/29/22 06:11, Yunke Cao wrote:
> >>>>> Removing priv_user_controls and its related checks.
> >>>>>
> >>>>> I suspect this is wrong because:
> >>>>>
> >>>>> 1. priv_user_controls == priv_user_controls_check is not always true.
> >>>>>
> >>>>> priv_user_controls counts the number of controls with
> >>>>> id >= V4L2_CID_PRIVATE_BASE (0x08000000).
> >>>>> priv_user_controls_check uses V4L2_CTRL_DRIVER_PRIV ((id) & 0xffff) >= 0x1000).
> >>>>>
> >>>>> The private controls defined in V4L2_CID_USER_BASE + 0x1000 will count towards
> >>>>> priv_user_controls_check, but not priv_user_controls. For example,
> >>>>> V4L2_CID_USER_MEYE_BASE (include/uapi/linux/v4l2-controls.h#n158).
> >>>>>
> >>>>> 2. Line 205 returns error for id >= V4L2_CID_PRIVATE_BASE. Counting
> >>>>> priv_user_controls will not happen.
> >>>>
> >>>> A long time ago all private controls in a driver started at ID V4L2_CID_PRIVATE_BASE.
> >>>> When the control framework was created, all private controls were changed to start
> >>>> at a control class base + 0x1000, and to stay compatible with old userspace the
> >>>> control framework emulated enumerating such controls from V4L2_CID_PRIVATE_BASE.
> >>>
> >>> The emulated controls are also enumerated with?
> >>>
> >>> qctrl.id = id | V4L2_CTRL_FLAG_NEXT_CTRL | V4L2_CTRL_FLAG_NEXT_COMPOUND; ?
> >>
> >> No, they are not.
> >>
> >>>
> >>> Because if so, they wont pass the test:
> >>>
> >>> if (id >= V4L2_CID_PRIVATE_BASE)
> >>>     return fail("no V4L2_CID_PRIVATE_BASE allowed\n");
> >>
> >> Exactly: they should never be enumerated that way, if they appear, then the
> >> emulation is broken and this test fails.
> >
> >
> > Gotcha...  I was not aware of that emulation.
> >
> > So that means we have to add that emulation to uvc control framework :(
>
> Ah, now I understand your interest in this!
>
> Hmm. UVC never had it, so there are no userspace apps that rely on this.
>
> I am inclined to patch v4l2-compliance to skip this check for uvc.
> Or more specifically: if it is uvc, then no V4L2_CID_PRIVATE_BASE controls
> should be seen.
>
> Any userspace app that wants to use the new uvc private controls should
> update their code. This is for the ROI, right? It's probably failing due to
> the V4L2_CID_UVC_REGION_OF_INTEREST_AUTO control. But since this only makes
> sense if the application can also use the compound control to obtain the ROI,
> supporting V4L2_CID_PRIVATE_BASE is pretty pointless anyway: that would only
> see the _AUTO control.
>
> Regards,
>
>         Hans
>
> >
> > Thanks!
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>> Thanks!
> >>>
> >>>
> >>>
> >>>>
> >>>> These compliance tests verify that that emulation is still working correctly.
> >>>>
> >>>> So this code is OK. If you have an example of where it fails, then that is likely
> >>>> to be a bug elsewhere. I would need more information to see what could be the cause
> >>>> in that case.
> >>>>
> >>>> For the record:
> >>>>
> >>>> Rejected-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>>>
> >>>> Regards,
> >>>>
> >>>>         Hans
> >>>>
> >>>>>
> >>>>> Signed-off-by: Yunke Cao <yunkec@chromium.org>
> >>>>> ---
> >>>>> ---
> >>>>>  utils/v4l2-compliance/v4l2-test-controls.cpp | 22 +---------------------
> >>>>>  1 file changed, 1 insertion(+), 21 deletions(-)
> >>>>>
> >>>>> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
> >>>>> index 999dbcd7..18c9f638 100644
> >>>>> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> >>>>> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> >>>>> @@ -182,7 +182,6 @@ int testQueryExtControls(struct node *node)
> >>>>>       __u32 which = 0;
> >>>>>       bool found_ctrl_class = false;
> >>>>>       unsigned user_controls = 0;
> >>>>> -     unsigned priv_user_controls = 0;
> >>>>>       unsigned user_controls_check = 0;
> >>>>>       unsigned priv_user_controls_check = 0;
> >>>>>       unsigned class_count = 0;
> >>>>> @@ -299,30 +298,11 @@ int testQueryExtControls(struct node *node)
> >>>>>               user_controls++;
> >>>>>       }
> >>>>>
> >>>>> -     for (id = V4L2_CID_PRIVATE_BASE; ; id++) {
> >>>>> -             memset(&qctrl, 0xff, sizeof(qctrl));
> >>>>> -             qctrl.id = id;
> >>>>> -             ret = doioctl(node, VIDIOC_QUERY_EXT_CTRL, &qctrl);
> >>>>> -             if (ret && ret != EINVAL)
> >>>>> -                     return fail("invalid query_ext_ctrl return code (%d)\n", ret);
> >>>>> -             if (ret)
> >>>>> -                     break;
> >>>>> -             if (qctrl.id != id)
> >>>>> -                     return fail("qctrl.id (%08x) != id (%08x)\n",
> >>>>> -                                     qctrl.id, id);
> >>>>> -             if (checkQCtrl(node, qctrl))
> >>>>> -                     return fail("invalid control %08x\n", qctrl.id);
> >>>>> -             priv_user_controls++;
> >>>>> -     }
> >>>>> -
> >>>>> -     if (priv_user_controls + user_controls && node->controls.empty())
> >>>>> +     if (user_controls && node->controls.empty())
> >>>>>               return fail("does not support V4L2_CTRL_FLAG_NEXT_CTRL\n");
> >>>>>       if (user_controls != user_controls_check)
> >>>>>               return fail("expected %d user controls, got %d\n",
> >>>>>                       user_controls_check, user_controls);
> >>>>> -     if (priv_user_controls != priv_user_controls_check)
> >>>>> -             return fail("expected %d private controls, got %d\n",
> >>>>> -                     priv_user_controls_check, priv_user_controls);
> >>>>>       return result;
> >>>>>  }
> >>>>>
> >>>>>
> >>>>> ---
> >>>>> base-commit: 7f560aede797b659b585f063ed1f143f58b03df5
> >>>>> change-id: 20220929-remove_private_control_check-ab8cc38a1b9e
> >>>>>
> >>>>> Best regards,
> >>>
> >>>
> >>>
> >
> >
> >
