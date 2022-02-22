Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 250BF4BFC03
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 16:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233003AbiBVPLe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 10:11:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233270AbiBVPLc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 10:11:32 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888C51162AF
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 07:11:06 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id r13so20820950ejd.5
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 07:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fL8e12ftws7fUwpxuI4CGi65GLmW9MQF61Xi+R/ZjoQ=;
        b=g1AoTsIJXsM4MvcbOuwZ0n/OXtEMbTgzXT77sKKNL1fmiWCMDeueN1lBZWI915eQMX
         RXrrFjI2YtG8pVYzpVkG34PB6S5+G+sObghFE6qMrUL9g8ZloqkD2bSqPC8a5pWga7PA
         qrNc5SI6tCjQOzvt2BHjV7wEIl/bTKFiaqH2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fL8e12ftws7fUwpxuI4CGi65GLmW9MQF61Xi+R/ZjoQ=;
        b=AFuSmYHnFRXBO1uY4+3E/QOIbot0krNFwiGCT5TZYRBqbFEeVrh7lFr7IcZfCwCw9C
         tCCDv/ypY6AUDwPzXXL0lMEJ0fO6YwDcZ4LyZEfu0b6FDCV5KxPPLR2ZCNR+Vk32mzn3
         wrEpe2IGb9oYTYN3i41hT6+VtRsLJoCcLF94HBq/7nxI4hIYzBsaHwG5tXQMAZyrovUo
         ZFvU4Zv0hputdfjpjdaeRBdZP2cmXX4tiJN7J0BT8jPverQrlQLaKVoXjENM1wrwXT/v
         0YctCwBBuDxXPmrg44IQi4pU0gxSUJn2PCrCl2vYAvI2JqU58r7AiZOh/cp4r8P/2SsL
         pGbQ==
X-Gm-Message-State: AOAM5319Yu8lIdfGG9+2Vjs3NuqUPwhF9MbekHw61BKuQPyIDCiw2Bbb
        aP6O5UWfBMh8mmPmIqFJp/dNDBFvN7l5SA==
X-Google-Smtp-Source: ABdhPJxEvaLZY8QlwliBIYWI1bTDXj8t7BZc9e3mmW4Ctl1H2Oy9w2dUojGm+h0A6/FglAbK00D68g==
X-Received: by 2002:a17:906:2ad3:b0:6ce:3662:8d68 with SMTP id m19-20020a1709062ad300b006ce36628d68mr19746981eje.71.1645542664889;
        Tue, 22 Feb 2022 07:11:04 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id ho34sm2527927ejc.122.2022.02.22.07.11.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 07:11:04 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id h6so33878647wrb.9
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 07:11:04 -0800 (PST)
X-Received: by 2002:a05:6000:1546:b0:1e8:7b68:4f4e with SMTP id
 6-20020a056000154600b001e87b684f4emr20043254wry.30.1645542663786; Tue, 22 Feb
 2022 07:11:03 -0800 (PST)
MIME-Version: 1.0
References: <b5c170e2-dbdf-fc08-31e2-112d2973017f@linaro.org> <fff5d698-99b3-3d92-5fc3-23e217554a79@xs4all.nl>
In-Reply-To: <fff5d698-99b3-3d92-5fc3-23e217554a79@xs4all.nl>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Tue, 22 Feb 2022 10:10:51 -0500
X-Gmail-Original-Message-ID: <CAMfZQbwRc0vcbzC42bYYASc_L0Sh+MizPH-LvrURBprNTao90w@mail.gmail.com>
Message-ID: <CAMfZQbwRc0vcbzC42bYYASc_L0Sh+MizPH-LvrURBprNTao90w@mail.gmail.com>
Subject: Re: Venus v4l2-compliance failures
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
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

On Thu, Feb 17, 2022 at 9:35 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 17/02/2022 15:12, Stanimir Varbanov wrote:
> > Hi Hans,
> >
> > Presently we have two failures while running v4l2-compliance on venus
> > stateful decoder:
> >
> > 1. fail: v4l2-compliance.cpp(753): !ok
> >         test for unlimited opens: FAIL
> >
> > 2. fail: v4l2-test-formats.cpp(1668): IS_DECODER(node)
> >         test Cropping: FAIL
> >    fail: v4l2-test-codecs.cpp(104): node->function !=
> > MEDIA_ENT_F_PROC_VIDEO_DECODER
> >         test VIDIOC_(TRY_)DECODER_CMD: FAIL
> >
> > Failure #1 is related to the limitation we made in decoder open(). The
> > maximum parallel decoding sessions is limited to 16 and the check
> > for this maximum is made in decoder open() because the clients wanted to
> > know that earlier. For example, Chromium browser can open 16 hw
> > accelerated decoder sessions (in separate Tabs) and from 17 and upward
> > it will fallback to sw decoder. I wonder how that failure can be fixed.
>
> I'm wondering if this isn't better done via a read-only control that
> reports the max number of parallel sessions.
>
Do you see this as a constant value?  It would be burdensome if the
client had to keep track of how many contexts are in use.  Or do you
see this as a number of currently available contexts?

> I really hate artificial open() limitations, it's very much against the
> v4l2 philosophy.
>
From a client stand point it just seems like extra round trips.
Everytime the device is opened another call needs to be made right
away to check and see if there are resources available.

If that's the philosophy, the client can adapt.  If the control was
queried and it returned 0 for the number of available contexts, then
the handle could be closed and then a sw codec could be used instead.

> Reporting it with a standard control makes it also much easier for software
> to anticipate when it needs to switch to SW en/decoding.
>
I think you are talking about the codec controls[1], correct? I didn't
see an existing control present that would report the number of
currently open contexts and/or the number of maximum contexts.

[1]: https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-codec.html
> >
> >
> > Failure #2 is related to a commit [1] which add checks for
> > MEDIA_ENT_F_PROC_VIDEO_ENCODER, I think this entity flag is applicable
> > for stateless encoders (Request API) but Venus driver has no use of
> > media-controller API. Did I miss something?
>
> For item 2, can you try the patch below?
>
> Regards,
>
>         Hans
>
> -----------------------------------------------------------------------
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/utils/v4l2-compliance/v4l2-test-codecs.cpp b/utils/v4l2-compliance/v4l2-test-codecs.cpp
> index 22175eef..3f06070f 100644
> --- a/utils/v4l2-compliance/v4l2-test-codecs.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-codecs.cpp
> @@ -29,9 +29,10 @@ int testEncoder(struct node *node)
>  {
>         struct v4l2_encoder_cmd cmd;
>         bool is_encoder = node->codec_mask & (STATEFUL_ENCODER | JPEG_ENCODER);
> +       bool is_stateless_encoder = node->codec_mask & STATELESS_ENCODER;
>         int ret;
>
> -       if (IS_ENCODER(node))
> +       if (is_stateless_encoder)
>                 fail_on_test(node->function != MEDIA_ENT_F_PROC_VIDEO_ENCODER);
>         memset(&cmd, 0xff, sizeof(cmd));
>         memset(&cmd.raw, 0, sizeof(cmd.raw));
> @@ -98,9 +99,10 @@ int testDecoder(struct node *node)
>  {
>         struct v4l2_decoder_cmd cmd;
>         bool is_decoder = node->codec_mask & (STATEFUL_DECODER | JPEG_DECODER);
> +       bool is_stateless_decoder = node->codec_mask & STATELESS_DECODER;
>         int ret;
>
> -       if (IS_DECODER(node))
> +       if (is_stateless_decoder)
>                 fail_on_test(node->function != MEDIA_ENT_F_PROC_VIDEO_DECODER);
>         memset(&cmd, 0xff, sizeof(cmd));
>         memset(&cmd.raw, 0, sizeof(cmd.raw));
