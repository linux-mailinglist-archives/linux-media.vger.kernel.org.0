Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98D4E585417
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 19:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238247AbiG2RCE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 13:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238186AbiG2RCC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 13:02:02 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267535C36F
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 10:02:02 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3238de26fb1so38865947b3.8
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 10:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=getcruise.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=hwpIg+MnulsggLQzSIG+0NM0rkaz9Ox4TaytrNEyCYg=;
        b=VWyt6dcjqXBzho1EscTayG6lDOHmNtNV1t+Hz1I61wSNouD367+DmUQsOXNw73mom4
         b9dVIDe8/v0BXJp5i32LNSJZM1U5RcFFgAGffu7RvT2IXLFBKlrRnsYxdWH3Ih5raQwt
         WYxwzhsCUN/gVpQFyIK4M348X9m7Kl7qoRRFEk/GIDtSyUlBn9+ackuRo2QlmJSa6i88
         3tcQqPBeLxu0wCYEZulw8RPCA3mEOphnzXm1jfPugqkV2CU3co4YrhS0dgTlqo+HWnZN
         rOh7FlX/qNTLv7E+o4x70ZeyX88kHHmR1jSD+H/x6OJeWpSNmHRPiainOLI1qOLbJw7S
         dJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=hwpIg+MnulsggLQzSIG+0NM0rkaz9Ox4TaytrNEyCYg=;
        b=WikR74IX18MYDp579hFUe7qXR+Me4INDL/SlLSMf++lsHNHspHO3DbrVSE8h2ZjAvL
         IkuvgoJKAorQjnxokJnSL8wkEDnPWyeQxDDi825lGu4h+lQ6Oys8pPlJ/4feYZtvYIh1
         mdHtJRSRSUVSD+OasI1IoFzmmGO18wDIiNba6L65fqYvfRXYLFqYXAGJOexZad0yvR4b
         SJZTMnWi0nrbCS3p0HVo3rJ5bxc+xm2oxbsKtH9Lokbg5AGpd27ecMnCEZcAtdsxpxLe
         /Z9abnsRGxJJSSlIDAjtjVaZNzD4d3jJRJ+IrcJ5z/kOtMTcW7T4Fj38927/Bv2Uu4e7
         VqQg==
X-Gm-Message-State: ACgBeo1pGOiIxN6BlLBWTe/Ew4tO0fhRMqZq2rXYyWJIo1Va1PW+EsQm
        Lr1wNgB9KKiRtXAVzaUqPac9n/6xdkfVogueI5PHSQ==
X-Google-Smtp-Source: AA6agR5SE/kpgluWABBxQIUlg2Hg6h05Ns0nsn0R5mzM197eRd/SbeGzJBVIBylPqaxbqUkReFtcYPsey31+EjLrFA0=
X-Received: by 2002:a81:6744:0:b0:31f:5850:8a95 with SMTP id
 b65-20020a816744000000b0031f58508a95mr3820033ywc.40.1659114121125; Fri, 29
 Jul 2022 10:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-21-tomi.valkeinen@ideasonboard.com>
 <CAG0LG94pP4=ifCqt_swta2Av6hx9uMGizmOpwq_g7zKFtt2G=A@mail.gmail.com> <44c3a308-8755-dcb6-b8c4-dc1c36c724aa@ideasonboard.com>
In-Reply-To: <44c3a308-8755-dcb6-b8c4-dc1c36c724aa@ideasonboard.com>
From:   Satish Nagireddy <satish.nagireddy@getcruise.com>
Date:   Fri, 29 Jul 2022 10:01:50 -0700
Message-ID: <CAG0LG94zCaA0T1CKGEk556Bzm83E5q3HYdAV-0+3j6CfTEtspw@mail.gmail.com>
Subject: Re: [EXT] Re: [EXT] [PATCH v12 20/30] media: subdev: add streams to
 v4l2_subdev_get_fmt() helper function
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 29, 2022 at 3:30 AM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> On 29/07/2022 12:16, Satish Nagireddy wrote:
> > Hi Tomi,
> >
> > Thanks for the patch.
> >
> > On Wed, Jul 27, 2022 at 3:37 AM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >>
> >> Add streams support to v4l2_subdev_get_fmt() helper function. Subdev
> >> drivers that do not need to do anything special in their get_fmt op can
> >> use this helper directly for v4l2_subdev_pad_ops.get_fmt.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/media/v4l2-core/v4l2-subdev.c | 10 +++++++---
> >>   1 file changed, 7 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> >> index 0dd612f09f35..95fd2e07d69f 100644
> >> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >> @@ -1455,10 +1455,14 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> >>   {
> >>          struct v4l2_mbus_framefmt *fmt;
> >>
> >> -       if (format->pad >= sd->entity.num_pads)
> >> -               return -EINVAL;
> >> +       if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
> >> +               fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
> >> +                                                         format->stream);
> >> +       else if (format->pad < sd->entity.num_pads && format->stream == 0)
> >> +               fmt = v4l2_subdev_get_pad_format(sd, state, format->pad);
> >> +       else
> >> +               fmt = NULL;
> >
> > fmt can be initialized to NULL at the declaration, so that the above 2
> > lines can be removed.
>
> That is true, but I personally like the above better, as it handles all
> the cases in the same if-else-sequence.
>
>   Tomi

Sure.

- Satish
