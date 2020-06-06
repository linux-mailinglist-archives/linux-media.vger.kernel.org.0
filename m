Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A2A1F0690
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2020 14:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728751AbgFFMqY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Jun 2020 08:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728824AbgFFMqX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Jun 2020 08:46:23 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C9FC03E96A
        for <linux-media@vger.kernel.org>; Sat,  6 Jun 2020 05:46:23 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id l12so9350398ejn.10
        for <linux-media@vger.kernel.org>; Sat, 06 Jun 2020 05:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aIiB9wvX9JqQxrAQEQ3KjZ3Kb+hdGI9GFJ+OCHkh9og=;
        b=de2zzi92V7UV3Gre9gbtutLsXA4WJD3hagaFTOKIH8+eS1vYOtUvDoc/XuwBKh4uQP
         e9NiTKyJQPAG9XeY7Rb95UJiNMz/puFFss53KYpUZquETFzmPrRLWv1gSQShuX7HfVsW
         zRhdYKruBxFscBPt0xwRigKPtgTOnXuUJcggq8VxCD21zEyrV8VZhcXJh/U8W9eLOLpB
         2052nsmQu7wB6O5n20l06RPz/IIVUwfICrBH3J2aN4c/BF6GrVj4xPecrDc6DKNmbJdy
         UzOKWZD0ylddth/9F83ZyRPCWoSDLqrEpXczRrevS3FSgmPNj+sG5BJUBIbEFCQG1lbs
         x2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aIiB9wvX9JqQxrAQEQ3KjZ3Kb+hdGI9GFJ+OCHkh9og=;
        b=njCWy7lchcNNdDLMzk4HFFvh9y7T2WonAdCZzl5ir65AAAUarIJuKGH45NZS1DMCL7
         hPDCwZ5JZZDeUoHhYvfcY54s0tLKGVyDMkQZa5HT/AY5OM02FD+JaIwZhx6/rP78Fn3q
         HenyEYi+30Qa5X5tggGkSR6He6JMWP5fK6GrWR3EFnDQ3W+tIROncm6bidj1qbMKwTiR
         0xWFmXiG0RibEzv+UtQ6MJKt85c5yzE+kz/INetr4kAgmd+QpYS2EHgB68HtkPXoB87z
         ALHR5kWOF/gEbCRuwQJJE65GnH16+oDGFJPTJ9bE5ziAQ6e1OPDQoh913Us1BHSlzYms
         qSrg==
X-Gm-Message-State: AOAM5312KFP6SVJOdKAL28R1vCOtaqE+AJ/Bd86E+oUH96eonNz7Rnbw
        XAOjyA2E/7VpAEjFMM2z3uquL9L88frxEWG9udmokA==
X-Google-Smtp-Source: ABdhPJyPvvoYluZBC3s7eE4x/0+LkycVv8WiYm6kXWtzdvr1YayZBLWOHgcV1e/KPcoA+621WfgYDoiYIFKCEkD9dzU=
X-Received: by 2002:a17:906:d216:: with SMTP id w22mr12635147ejz.420.1591447581711;
 Sat, 06 Jun 2020 05:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200604185745.23568-1-jernej.skrabec@siol.net>
In-Reply-To: <20200604185745.23568-1-jernej.skrabec@siol.net>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sat, 6 Jun 2020 09:46:10 -0300
Message-ID: <CAAEAJfDFMzMkDkN7zzNvkwsmYzgQPNGkP=dhW7neycYYRBJzHA@mail.gmail.com>
Subject: Re: [PATCH 0/3] media: uapi: cedrus: Fix decoding interlaced H264 content
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>, devel@driverdev.osuosl.org,
        Jonas Karlman <jonas@kwiboo.se>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Chen-Yu Tsai <wens@csie.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jernej,

On Thu, 4 Jun 2020 at 15:55, Jernej Skrabec <jernej.skrabec@siol.net> wrote:
>
> Currently H264 interlaced content it's not properly decoded on Cedrus.
> There are two reasons for this:
> 1. slice parameters control doesn't provide enough information
> 2. bug in frame list construction in Cedrus driver
>
> As described in commit message in patch 1, references stored in
> reference lists should tell if reference targets top or bottom field.
> However, this information is currently not provided. Patch 1 adds
> it in form of flags which are set for each reference. Patch 2 then
> uses those flags in Cedrus driver.
>
> Frame list construction is fixed in patch 3.
>
> This solution was extensively tested using Kodi on LibreELEC with A64,
> H3, H5 and H6 SoCs in slightly different form (flags were transmitted
> in MSB bits in index).
>

So, if I understand correctly the field needs to be passed per-reference,
and the current per-DPB entry is not good?

If you could point at the userspace code for this, it would be interesting
to take a look.

> Note: I'm not 100% sure if flags for both, top and bottom fields are
> needed. Any input here would be welcome.
>

Given enum v4l2_field is already part of the uAPI, perhaps it makes
sense to just reuse that for the field type? Maybe it's an overkill,
but it would make sense to reuse the concepts and types that
already exist.

We can still add a reserved field to make this new reference type
extensive.

Thanks,
Ezequiel


> Please take a look.
>
> Best regards,
> Jernej
>
> Jernej Skrabec (3):
>   media: uapi: h264: update reference lists
>   media: cedrus: h264: Properly configure reference field
>   media: cedrus: h264: Fix frame list construction
>
>  .../media/v4l/ext-ctrls-codec.rst             | 40 ++++++++++++++++++-
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 27 +++++++------
>  include/media/h264-ctrls.h                    | 12 +++++-
>  3 files changed, 62 insertions(+), 17 deletions(-)
>
> --
> 2.27.0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
