Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53E17216F07
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 16:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbgGGOlY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 10:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbgGGOlY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 10:41:24 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6BBC061755
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 07:41:24 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z15so34133898wrl.8
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2020 07:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dda2s4tx026v4fC4q4yCJEmqiTQPhBaUaOGoPO9KcSA=;
        b=WpO9WTPInAXTh9LGygFySDAPyuFvL6EgrcY6l2/mD+rIwkSup7l0nU/gb6zji+Ad0k
         TJTEBK6SiTyMF4O2KEIi1Fjm7o282dteRCeueI5XTaH/xMx0k4zw2wNDaDfI5JNhBtQi
         qlvLCMeNu/LD4A7fAf7lyOixFjDR5K4vHXrLdGtZCCyjY9UH916/BIDuYDizKIyqzLr1
         /wU9kS2xuFgv6S3KUzGVFDYKFXR9R6dG09S9lG408gElTBTQ77wwTqYFJmjOmLvQZziq
         uAv0jx021kf8aIajQOM+TPevsTho5FrgDSwwU3IKV16WpvrXqF68gvCwjVeVL/lJuT7s
         Js6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dda2s4tx026v4fC4q4yCJEmqiTQPhBaUaOGoPO9KcSA=;
        b=dSvbwFJy28cTGiPYECLeUHF78pFmuf94c+XZumIO++Q88YYzjYA5R3mJEw/bhYal+m
         jzwEissQGid9pdaVvUWhAhsS86cLp40uysN7B356ERC18HLEjQG54Jbcux9++rpqdHnk
         Ge7Dx7HJD2uZYg7T3vCa84RYdNiyEzf1tI8jdKMH/4/aygfMQGD2YBSnM1f1BEX0s+04
         VAjjHHhsBgnOU8pM6KnQGhWsVfKOZmkcCRUOgA2NZDkup8UBDiIxKM1VBG0rU2WcPL3B
         MrdpDK0KW5zADxsLRGx3gyiKX9xi9trfY2MzPveESpXBYJS7g+btzoHDPJItHe6ghhWj
         gVSg==
X-Gm-Message-State: AOAM532kffUBRPxv5V8VJgY3AXrrlLoqZ97ZqTeOB9CKnjzchGIpQ0KC
        VG2ayJAJSC0jKRMVQ1VKsuC/u7rlCWY+R7xuRFyiyHgb
X-Google-Smtp-Source: ABdhPJw1bxdqAM+Vu91p6XQM5C5UcDW2kWlu8APpOXLamumoTHi1qMiYwgB0FTfSuthS4aT5DKdbpWtMaXse1BjogTQ=
X-Received: by 2002:adf:81c7:: with SMTP id 65mr51688529wra.47.1594132882877;
 Tue, 07 Jul 2020 07:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY8ntAogTZHd7Oh_7L+ghh4_DP9AzZ4DuJ9xChN_EmVbGXb1Q@mail.gmail.com>
 <34df23a8-6ab1-aaba-19f7-5193d18a60b0@xs4all.nl>
In-Reply-To: <34df23a8-6ab1-aaba-19f7-5193d18a60b0@xs4all.nl>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 7 Jul 2020 15:41:05 +0100
Message-ID: <CAPY8ntAjV7vxpb2qFQVY+EYk3Mb0nBfGovYcAvw+0NMFH0j5PQ@mail.gmail.com>
Subject: Re: v4l2-compliance tests for cache flags
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Tue, 7 Jul 2020 at 14:49, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 07/07/2020 15:33, Dave Stevenson wrote:
> > Hi Hans, Sergey, & the list.
> >
> > I'm running the latest v4l2-compliance (85ec2917 "v4l2-compliance: fix
> > stateful encoder tests") against the Raspberry Pi vendor 5.4 kernel
> > tree. That means the kernel isn't supporting
> > V4L2_BUF_FLAG_NO_CACHE_[INVALIDATE|CLEAN] flags on the buffers, nor is
> > anything advertising V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS. I'm
> > getting failures in setupMmap.
> >
> > With patch "784be6a v4l2-utils: test cache_hints for MMAP queues" the
> > test deliberately sets V4L2_BUF_FLAG_NO_CACHE_INVALIDATE and
> > V4L2_BUF_FLAG_NO_CACHE_CLEAN on the buffers that it queues.
> > Nothing in the kernel is expecting to manipulate those flags as the
> > behaviour wasn't really defined before, but the test is failed if they
> > aren't cleared. The v4l2 core would only clear them if the kernel
> > includes the patch "f5f5fa7 media: videobuf2: handle V4L2 buffer cache
> > flags", which currently means only linuxtv/master as that patch isn't
> > even in 5.8-rc3.
> >
> > Is it really valid to look at the V4L2_BUF_FLAG_NO_CACHE_* flags at
> > all if V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS isn't set? If the
> > capability isn't advertised, surely the state of those bits is
> > undefined.
>
> v4l2-compliance tests are in sync with our master and it expects that
> that kernel is used.

Thanks, I'd never noted that restriction. All previous times I'd used
v4l2-compliance against any kernel it had performed as expected. This
is the first change that causes a major failure of tests due to an
older kernel.

> It is possible in rare cases to add a version check (use the version
> field returned by QUERYCAP) to determine if a feature is in the latest
> kernel. It's not done anywhere in the current compliance test, but I'd
> accept a patch that disables this test for kernels < 5.9 (since this feature
> will land in 5.9).

OK, I'll try to sort out a patch for you.

  Dave

> Regards,
>
>         Hans
