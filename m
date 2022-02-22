Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0905D4BFE2A
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 17:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233661AbiBVQLv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 11:11:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbiBVQLt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 11:11:49 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7BB165C1B
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 08:11:23 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id i11so36417964eda.9
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 08:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=87fAIqLGJKg7h+7A3/aTvenwek4aqsrfxKde2VVzR60=;
        b=D+la2cK4gQYjNDeoZ+thnaOqFOgEGO7g8S5efu2QAOO4yYjFPUhlWzSHyxqJnBlD19
         LXTGb4aCfCObxAwyHl4W8ZlwfYgqbSyC0rOFFzPyVs5/mOC4ztEthPmGRrigM0KQ8WxX
         VG7eXRfqG3ZcM9zrb1aL2GV1c1pK0yxVTa/8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=87fAIqLGJKg7h+7A3/aTvenwek4aqsrfxKde2VVzR60=;
        b=Z5+ROPPveRkgD0wjLiSFPMy7I+cos1jiLzTxzOpdM9XDm8ZB8CStA+64DJkX5rWGVc
         d80V9nwJkoPip6UlCYcY2OgbBNlwyg0k2wQe16F7NgghVaeVP58aGpXwIwOdAeVfOk9V
         9wGu5arND1HeIGF8Pof0ngDh7kdBVEl/3mc19RI506pd6DWH9DmSEy0T0b3p3jUuHZhq
         jMf1ermADkRwhOd4xErBSwCImyeFzDs3lzTwsj5GWubOa9fu6tchHEFbTTTSRhyh5QrR
         inf1D7q4+M2hdOimZyxeV6O1+bo/hvgh57p6SiLFmtMb7O9sArOsNHDdRJ+kba3v4yx9
         5+9A==
X-Gm-Message-State: AOAM531XXhhTrfE7sJBd5wZk+MwAib2OLT8S5TYa+9AEmIr3+qkK21Do
        Qh1JNIAVnak2jIVaYBh+pahMCdGO4WRlH+sy
X-Google-Smtp-Source: ABdhPJxwMYVwtLkNVlwtEedkGHR255uAE5rpp6Y/TNRxG2SdE1L+4AxuqCq50SJg/4Ry0FElfBQXpg==
X-Received: by 2002:aa7:dbd6:0:b0:408:4a31:97a5 with SMTP id v22-20020aa7dbd6000000b004084a3197a5mr27539625edt.186.1645546281729;
        Tue, 22 Feb 2022 08:11:21 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id f14sm6373663ejj.213.2022.02.22.08.11.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 08:11:21 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id l2-20020a7bc342000000b0037fa585de26so1148896wmj.1
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 08:11:21 -0800 (PST)
X-Received: by 2002:a05:600c:2b88:b0:34d:e6bb:8143 with SMTP id
 j8-20020a05600c2b8800b0034de6bb8143mr3954614wmc.93.1645546280685; Tue, 22 Feb
 2022 08:11:20 -0800 (PST)
MIME-Version: 1.0
References: <b5c170e2-dbdf-fc08-31e2-112d2973017f@linaro.org>
 <fff5d698-99b3-3d92-5fc3-23e217554a79@xs4all.nl> <CAMfZQbwRc0vcbzC42bYYASc_L0Sh+MizPH-LvrURBprNTao90w@mail.gmail.com>
 <ff8c7cf1-3c96-2ba0-2c42-ad1557e7bcea@xs4all.nl>
In-Reply-To: <ff8c7cf1-3c96-2ba0-2c42-ad1557e7bcea@xs4all.nl>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Tue, 22 Feb 2022 11:11:08 -0500
X-Gmail-Original-Message-ID: <CAMfZQbx6LrDqR_gT_u92TmKnegW_-G=PsvK4kjZVSgaEQeF0_Q@mail.gmail.com>
Message-ID: <CAMfZQbx6LrDqR_gT_u92TmKnegW_-G=PsvK4kjZVSgaEQeF0_Q@mail.gmail.com>
Subject: Re: Venus v4l2-compliance failures
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Fritz Koenig <frkoenig@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Feb 22, 2022 at 10:50 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Fritz,
>
> On 2/22/22 16:10, Fritz Koenig wrote:
> > On Thu, Feb 17, 2022 at 9:35 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> On 17/02/2022 15:12, Stanimir Varbanov wrote:
> >>> Hi Hans,
> >>>
> >>> Presently we have two failures while running v4l2-compliance on venus
> >>> stateful decoder:
> >>>
> >>> 1. fail: v4l2-compliance.cpp(753): !ok
> >>>         test for unlimited opens: FAIL
> >>>
> >>> 2. fail: v4l2-test-formats.cpp(1668): IS_DECODER(node)
> >>>         test Cropping: FAIL
> >>>    fail: v4l2-test-codecs.cpp(104): node->function !=
> >>> MEDIA_ENT_F_PROC_VIDEO_DECODER
> >>>         test VIDIOC_(TRY_)DECODER_CMD: FAIL
> >>>
> >>> Failure #1 is related to the limitation we made in decoder open(). The
> >>> maximum parallel decoding sessions is limited to 16 and the check
> >>> for this maximum is made in decoder open() because the clients wanted to
> >>> know that earlier. For example, Chromium browser can open 16 hw
> >>> accelerated decoder sessions (in separate Tabs) and from 17 and upward
> >>> it will fallback to sw decoder. I wonder how that failure can be fixed.
> >>
> >> I'm wondering if this isn't better done via a read-only control that
> >> reports the max number of parallel sessions.
> >>
> > Do you see this as a constant value?  It would be burdensome if the
> > client had to keep track of how many contexts are in use.  Or do you
> > see this as a number of currently available contexts?
>
> I haven't really thought about it. It probably depends on the HW design:
> i.e. it might be a hard limit as per the number of instances, or more
> of a resource (bandwidth/memory) limitation that also depends on the
> bitrate etc. From what I gather it is a hard limit to the number of
> instances in the case of the venus driver. So here it would be a read-only
> control that has a constant value.
>
I might be misunderstanding you here.  In my mind a constant value
read-only control would be difficult to use with a multiprocess
system.  The client would read how many contexts could be open, but
wouldn't be easily able to track how many are currently in use.

I see a control that could return the number of contexts currently in
use, and the maximum number available.  I think that would be
preferable to a control that only returns the number of currently
available contexts.  But maybe that is a nuance of the client or the
driver doing the subtraction.

-Fritz

> >
> >> I really hate artificial open() limitations, it's very much against the
> >> v4l2 philosophy.
> >>
> > From a client stand point it just seems like extra round trips.
> > Everytime the device is opened another call needs to be made right
> > away to check and see if there are resources available.
> >
> > If that's the philosophy, the client can adapt.  If the control was
> > queried and it returned 0 for the number of available contexts, then
> > the handle could be closed and then a sw codec could be used instead.
> >
> >> Reporting it with a standard control makes it also much easier for software
> >> to anticipate when it needs to switch to SW en/decoding.
> >>
> > I think you are talking about the codec controls[1], correct? I didn't
> > see an existing control present that would report the number of
> > currently open contexts and/or the number of maximum contexts.
>
> Yes, this would be a new codec control.
>
> Regards,
>
>         Hans
>
> >
> > [1]: https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-codec.html
> >>>
> >>>
> >>> Failure #2 is related to a commit [1] which add checks for
> >>> MEDIA_ENT_F_PROC_VIDEO_ENCODER, I think this entity flag is applicable
> >>> for stateless encoders (Request API) but Venus driver has no use of
> >>> media-controller API. Did I miss something?
> >>
> >> For item 2, can you try the patch below?
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >> -----------------------------------------------------------------------
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> ---
> >> diff --git a/utils/v4l2-compliance/v4l2-test-codecs.cpp b/utils/v4l2-compliance/v4l2-test-codecs.cpp
> >> index 22175eef..3f06070f 100644
> >> --- a/utils/v4l2-compliance/v4l2-test-codecs.cpp
> >> +++ b/utils/v4l2-compliance/v4l2-test-codecs.cpp
> >> @@ -29,9 +29,10 @@ int testEncoder(struct node *node)
> >>  {
> >>         struct v4l2_encoder_cmd cmd;
> >>         bool is_encoder = node->codec_mask & (STATEFUL_ENCODER | JPEG_ENCODER);
> >> +       bool is_stateless_encoder = node->codec_mask & STATELESS_ENCODER;
> >>         int ret;
> >>
> >> -       if (IS_ENCODER(node))
> >> +       if (is_stateless_encoder)
> >>                 fail_on_test(node->function != MEDIA_ENT_F_PROC_VIDEO_ENCODER);
> >>         memset(&cmd, 0xff, sizeof(cmd));
> >>         memset(&cmd.raw, 0, sizeof(cmd.raw));
> >> @@ -98,9 +99,10 @@ int testDecoder(struct node *node)
> >>  {
> >>         struct v4l2_decoder_cmd cmd;
> >>         bool is_decoder = node->codec_mask & (STATEFUL_DECODER | JPEG_DECODER);
> >> +       bool is_stateless_decoder = node->codec_mask & STATELESS_DECODER;
> >>         int ret;
> >>
> >> -       if (IS_DECODER(node))
> >> +       if (is_stateless_decoder)
> >>                 fail_on_test(node->function != MEDIA_ENT_F_PROC_VIDEO_DECODER);
> >>         memset(&cmd, 0xff, sizeof(cmd));
> >>         memset(&cmd.raw, 0, sizeof(cmd.raw));
