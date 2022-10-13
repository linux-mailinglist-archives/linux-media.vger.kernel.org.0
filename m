Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E792A5FD4FB
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 08:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiJMGj6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 02:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbiJMGjz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 02:39:55 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D011E0E6
        for <linux-media@vger.kernel.org>; Wed, 12 Oct 2022 23:39:53 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so4063742pjq.3
        for <linux-media@vger.kernel.org>; Wed, 12 Oct 2022 23:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=906+lu/eobNMfAAOvn/O6br1LSsM3HEJnSjf2zgLSgw=;
        b=LdvDfsNaCWnprovuRikB3UdTcqYuh6H1UVaklrLzOMtJg7PK7y3yfNU7cGU7X8nW4d
         o3WihSqVYdPH+1k2rum/IQPo0V5Y8EKl4y/40OfAPV9Wmg/ByjqTwDQWZvqw/veSdi8E
         JXU/xjPGhsuYUkQ/TWLwfvojNbYHnFoXB24EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=906+lu/eobNMfAAOvn/O6br1LSsM3HEJnSjf2zgLSgw=;
        b=YTj2iQO9RWbMOhqmrkxp7pGSP41rEvpwWQX92CpRL1IbJJSrGtp14o+NtNs4/Tjcyv
         QZftByfl5LOy0eKOk1y76nlmDNeyUHOrCLxnwEpauTs+K9hHg7sdM22v6J34W/3KaXjf
         +SdIUkWq252zvOLsDR0DsFKRy09XcCi/bXSDLKFSXNScLh25WxmUQpqy3X9oOQFKm0Dq
         THfu6UpMIu84aQhHvOcECo//TZWjg84mPpnY5a67dD8bokYkScXLBhGNpxduydWiVMD8
         P2uZ4LLdhbGGxFRe9kYChnU23jKGmcmykf8Gv+XeRupWJdShF7ddTTNg1gwSaQhm+Tjv
         RmvQ==
X-Gm-Message-State: ACrzQf34kQHYsAkCGbI8kUHpKgxXj0NbhffazQ9aGaJVGJScphYq5ZEh
        c4mbwda6gqLPuv3YLJS52QAV1zePzqYC42UeYAnhVF3u/7ah9Q==
X-Google-Smtp-Source: AMsMyM43YO4Wwuzj4Ch/CI7JPJU2WJUWCaRCN4t2XV4W0NHgNAXQTZqaKqT0cmusALqwmwOHSKv6Z0u3ja7eZL/TThQ=
X-Received: by 2002:a17:90a:b00b:b0:203:a6de:5b0f with SMTP id
 x11-20020a17090ab00b00b00203a6de5b0fmr9397861pjq.134.1665643192782; Wed, 12
 Oct 2022 23:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220929-remove_private_control_check-v1-0-80a304b76269@chromium.org>
 <CANiDSCuWSnTQsU2B-Uk14jDp9BXgcohwyjvCJ7-sX=bdU68oGw@mail.gmail.com>
In-Reply-To: <CANiDSCuWSnTQsU2B-Uk14jDp9BXgcohwyjvCJ7-sX=bdU68oGw@mail.gmail.com>
From:   Yunke Cao <yunkec@chromium.org>
Date:   Thu, 13 Oct 2022 15:39:41 +0900
Message-ID: <CAEDqmY40aYg1deCXWWWsHrOoCkjYRZTyY+x4mDDVXGEx7avc7Q@mail.gmail.com>
Subject: Re: [PATCH] Remove priv_user_controls in v4l2-test-controls
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 29, 2022 at 3:24 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> nit: mention in the subject that the change is for v4l2-compliance
Ricardo, thanks for the review!

Hans, can you kindly take a look when you have time and let us know if
this makes sense?

Best,
Yunke

>
>
>
> On Thu, 29 Sept 2022 at 06:12, Yunke Cao <yunkec@chromium.org> wrote:
> >
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
> >
> > Signed-off-by: Yunke Cao <yunkec@chromium.org>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
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
> >         __u32 which = 0;
> >         bool found_ctrl_class = false;
> >         unsigned user_controls = 0;
> > -       unsigned priv_user_controls = 0;
> >         unsigned user_controls_check = 0;
> >         unsigned priv_user_controls_check = 0;
> >         unsigned class_count = 0;
> > @@ -299,30 +298,11 @@ int testQueryExtControls(struct node *node)
> >                 user_controls++;
> >         }
> >
> > -       for (id = V4L2_CID_PRIVATE_BASE; ; id++) {
> > -               memset(&qctrl, 0xff, sizeof(qctrl));
> > -               qctrl.id = id;
> > -               ret = doioctl(node, VIDIOC_QUERY_EXT_CTRL, &qctrl);
> > -               if (ret && ret != EINVAL)
> > -                       return fail("invalid query_ext_ctrl return code (%d)\n", ret);
> > -               if (ret)
> > -                       break;
> > -               if (qctrl.id != id)
> > -                       return fail("qctrl.id (%08x) != id (%08x)\n",
> > -                                       qctrl.id, id);
> > -               if (checkQCtrl(node, qctrl))
> > -                       return fail("invalid control %08x\n", qctrl.id);
> > -               priv_user_controls++;
> > -       }
> > -
> > -       if (priv_user_controls + user_controls && node->controls.empty())
> > +       if (user_controls && node->controls.empty())
> >                 return fail("does not support V4L2_CTRL_FLAG_NEXT_CTRL\n");
> >         if (user_controls != user_controls_check)
> >                 return fail("expected %d user controls, got %d\n",
> >                         user_controls_check, user_controls);
> > -       if (priv_user_controls != priv_user_controls_check)
> > -               return fail("expected %d private controls, got %d\n",
> > -                       priv_user_controls_check, priv_user_controls);
> >         return result;
> >  }
> >
> >
> > ---
> > base-commit: 7f560aede797b659b585f063ed1f143f58b03df5
> > change-id: 20220929-remove_private_control_check-ab8cc38a1b9e
> >
> > Best regards,
> > --
> > Yunke Cao <yunkec@chromium.org>
>
>
> Thanks!
> --
> Ricardo Ribalda
