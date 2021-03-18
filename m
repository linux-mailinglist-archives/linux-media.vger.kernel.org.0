Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFFC340FBA
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 22:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbhCRVTy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 17:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbhCRVT2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 17:19:28 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73931C06174A
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 14:19:28 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id d2so6203957ilm.10
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 14:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MbJIq0ucB8f2n4fhwnTv/rVAUGxtBZm58m8rbeIBX9U=;
        b=fKB/ZVWXLTeHVUyzK8JfoJmHacbDh3PUwyCUZgAhyPH4FBrESDbFeAKqzrci/2/ZOO
         c/wn4jTfEM6x6E3+uuRm4VEb/st8pqNXlME4V+QXdFz/YlVdg2OPIBJcWTN1yLeo02JC
         EOSxAeBit/c1KD+dKrtrJX5fBDT2WGAHLUyj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MbJIq0ucB8f2n4fhwnTv/rVAUGxtBZm58m8rbeIBX9U=;
        b=NICAsuiXqAZlrDZU6IPItQpdiQ+GMJpK6tLiGVWYqwSvJLje1PRnfUYTk3QKRhAfRx
         7h7tDuBu+k09HADo9TUg9otLrKAu4JfA8/c3l1nUicbjZ7lEIDBPxvIo6gvDKduOJvEK
         l0A6C0XqBrAd5xzVd53O2nLDzbqyon0FXYVo3JqobBKu90NXR4sROCsABAgRanLjIxAt
         53xHNGfNAUiFQo4zYD9Mh7ET0fGXI4MqwbD/+suumsVZwl0YXM1hkTeKH4r9HU7FW3qb
         w+rxVQUw3+WNf/cEyjC3K3hapPBS8mTiYBnGaeixgoOnkwStIuZNYskliGQaMNb6I3q0
         MSvw==
X-Gm-Message-State: AOAM533jgechVS+JRjfVXD7wenm7/g6uetixChXbT5MnZkMjiR3NLE5a
        xQEZsOi21gJzuqXixC9jCG+4oel7Wc8sgGS/
X-Google-Smtp-Source: ABdhPJz5xvV1w1FVcl4Uz2om5OnLQ8qCywNdGAVMOHwyul3JK1lhap4lsHyBirpuXMGG/LOTMk0yLA==
X-Received: by 2002:a05:6e02:de2:: with SMTP id m2mr428856ilj.274.1616102367785;
        Thu, 18 Mar 2021 14:19:27 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id x2sm1595581ilj.31.2021.03.18.14.19.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 14:19:27 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id l5so6211809ilv.9
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 14:19:26 -0700 (PDT)
X-Received: by 2002:a05:6e02:dc5:: with SMTP id l5mr434497ilj.218.1616102366490;
 Thu, 18 Mar 2021 14:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
 <20210208051749.1785246-4-sergey.senozhatsky@gmail.com> <CAPybu_10Uz0Eb2U5ZohNV1t0gf98ZBZOa3KFCzdi1RJ0k3c1yQ@mail.gmail.com>
 <YFFiizDjNBMG3uI+@google.com> <CAPybu_0ruoc-w3402j-vVNs2-xq8=-_XzVKSxiG+iuyB=eNimA@mail.gmail.com>
 <YFLbYjm0VyzaEMkr@google.com>
In-Reply-To: <YFLbYjm0VyzaEMkr@google.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 18 Mar 2021 22:19:15 +0100
X-Gmail-Original-Message-ID: <CANiDSCtCaVUxrYeceWXEJ3o61ze8uNyce69xW_KcQTirhWfZaQ@mail.gmail.com>
Message-ID: <CANiDSCtCaVUxrYeceWXEJ3o61ze8uNyce69xW_KcQTirhWfZaQ@mail.gmail.com>
Subject: Re: [PATCHv2 3/3] media: uvcvideo: add UVC 1.5 ROI control
To:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey

On Thu, Mar 18, 2021 at 5:47 AM Sergey Senozhatsky
<sergey.senozhatsky.work@gmail.com> wrote:
>
> On (21/03/17 08:58), Ricardo Ribalda Delgado wrote:
> [..]
> > >
> > > GET_CUR?
> > yep
> >
> > >
> > > > https://www.kernel.org/doc/html/v4.13/media/uapi/v4l/vidioc-g-selection.html?highlight=vidioc_s_selection
> > > > On success the struct v4l2_rect r field contains the adjusted
> > > > rectangle.
> > >
> > > What is the adjusted rectangle here? Does this mean that firmware can
> > > successfully apply SET_CUR and return 0, but in reality it was not happy
> > > with the rectangle dimensions so it modified it behind the scenes?
> >
> > I can imagine that some hw might have spooky requirements for the roi
> > rectangle (multiple of 4, not crossing the bayer filter, odd/even
> > line...) so they might be able to go the closest valid config.
>
> Hmm. Honestly, I'm very unsure about it. ROI::SET_CUR can be a very
> hot path, depending on what user-space considers to be of interest
> and how frequently that object of interest changes its position/shape/etc.
> Doing GET_CUR after every SET_CUR doubles the number of firmware calls
> we issue, that's for sure; is it worth it - that's something that I'm
> not sure of.
>
> May I please ask for more opinions on this?

Could you try setting the roi in a loop in your device and verify that
it accepts all the values with no modification. If so we can implement
the set/get as a quirk for other devices.

>
>         -ss



-- 
Ricardo Ribalda
