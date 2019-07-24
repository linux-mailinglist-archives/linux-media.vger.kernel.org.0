Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DABF725B2
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 06:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbfGXEJZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 00:09:25 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42460 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbfGXEJZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 00:09:25 -0400
Received: by mail-ed1-f67.google.com with SMTP id v15so45854960eds.9
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 21:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L7KyMlWxEoabNKg6lprSY1ZgY9phUzmLAT2goYWFrwM=;
        b=NTUufX2nMecOpFFTp9k8J4h/nEbb+A5PSh0vu+z/IIYFOe46qFNSxxsVxwiL1cul5u
         GEznv3Vodh40BZ/fIPGU/vc3om2FDGTKnvqqfbmdYZMnA14O5+4wlV4fRL//zZTkIR8q
         88k0WB04eJSjhYlMc8P8QI8w69nM22ZfytAH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L7KyMlWxEoabNKg6lprSY1ZgY9phUzmLAT2goYWFrwM=;
        b=UcOV4KvrClDoAQ3+HzqbclUYbvD8sN6t9W5EVgUQChlW9P69Eam+iSBlC3Rje3jlzD
         u96pfQz9moAiqEZKXrwL+Vylxowo5LIytFrtWto/e0Vantaz8xZTibB/tzTOMyMRpF18
         kgwSfENf+co7rpqP4m1KaTFZKTGHYzKBG92OxuB16bsmzPi5T9TWvfLsTlM1r9FWjzod
         sVIFS6wSc17Q46yMRA2Xvs00nSm8GRiF7NnEW1mBODjzRtlPK9/CIpO8B4Zg5oXfWYB1
         xq1BcJ7tl2g0GB084QDWoWORfKt6Oi+fGCFNoOsSYvFQxl9/RNI2hNPmSJNN9nGorbVv
         n9hg==
X-Gm-Message-State: APjAAAWfKob1qNDAUOBAmi3iNW9ho9vAZO4HSMyqO07KEsXPGmrXEdQL
        HY46t5Wadha/ngAQ/hipPDZJRmrRFd/9aA==
X-Google-Smtp-Source: APXvYqxVmDVWc1oFt5iTKbOXiyhM2f+ze72ShAosgKTta9tjCvAK6/kVOAlmpx0ue+UwfZL3EQReDg==
X-Received: by 2002:a17:906:b7d8:: with SMTP id fy24mr62436142ejb.230.1563941363301;
        Tue, 23 Jul 2019 21:09:23 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id c53sm12684927ede.84.2019.07.23.21.09.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 21:09:21 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id u25so29860537wmc.4
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 21:09:20 -0700 (PDT)
X-Received: by 2002:a05:600c:2111:: with SMTP id u17mr51232483wml.64.1563941360309;
 Tue, 23 Jul 2019 21:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190609143820.4662-1-mjourdan@baylibre.com> <907e0560-3b46-04c9-52ef-6c6ff7140876@xs4all.nl>
 <3dc4d551-0628-5c74-c223-4afe64a701d8@xs4all.nl> <CAAFQd5BekdTTXjO8tS3aVK3=pg_YZYCQieTxcUWByuMqhWL=dg@mail.gmail.com>
 <a82fc60a-f18d-c7d3-299e-b3f68a09eccf@xs4all.nl>
In-Reply-To: <a82fc60a-f18d-c7d3-299e-b3f68a09eccf@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 24 Jul 2019 13:09:08 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DLsHNWr9mgOD-OS648akxwT75MvJ0Hw1rJbQSzG190-Q@mail.gmail.com>
Message-ID: <CAAFQd5DLsHNWr9mgOD-OS648akxwT75MvJ0Hw1rJbQSzG190-Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] Add enum_fmt flag for coded formats with dynamic
 resolution switching
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 19, 2019 at 5:41 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 7/19/19 4:45 AM, Tomasz Figa wrote:
> > On Mon, Jul 15, 2019 at 9:37 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> On 6/11/19 10:13 AM, Hans Verkuil wrote:
> >>> On 6/9/19 4:38 PM, Maxime Jourdan wrote:
> >>>> Hello,
> >>>>
> >>>> This RFC proposes a new format flag - V4L2_FMT_FLAG_DYN_RESOLUTION - used
> >>>> to tag coded formats for which the device supports dynamic resolution
> >>>> switching, via V4L2_EVENT_SOURCE_CHANGE.
> >>>> This includes the initial "source change" where the device is able to
> >>>> tell userspace about the coded resolution and the DPB size (which
> >>>> sometimes translates to V4L2_CID_MIN_BUFFERS_FOR_CAPTURE).
> >>>
> >>> Shouldn't the initial source change still be there? The amlogic decoder
> >>> is capable of determining the resolution of the stream, right? It just
> >>> can't handle mid-stream changes.
> >>
> >> I've been thinking about this a bit more: there are three different HW capabilities:
> >>
> >> 1) The hardware cannot parse the resolution at all and userspace has to tell it
> >> via S_FMT.
> >>
> >> 2) The hardware can parse the initial resolution, but is not able to handle
> >> mid-stream resolution changes.
> >>
> >> 3) The hardware can parse the initial resolution and all following mid-stream
> >> resolution changes.
> >>
> >> We can consider 2 the default situation.
> >
> > Any particular reason for 2 being the default? I'm especially
> > wondering about that as most of the drivers actually provide 3.
>
> Various reasons:
>
> 1) I prefer to have a flag indicating what IS supported rather than what
>    isn't.
> 2) An application that checks this flag and doesn't see it (i.e. if a
>    flag-aware application is used with an older kernel where these flags
>    aren't set) will still work, but with possibly reduced functionality.
>    If the flag would indicate that something is NOT supported, then they
>    would fail when combined with an older kernel and a driver that doesn't
>    support dynamic resolution changes.
> 3) None of the encoders support it, so there too it makes sense to have
>    'no dynamic resolution change' as the default. It's nicely symmetrical
>    for encoders and decoders.
> 4) Some formats do not support it, so again, having no dynamic res changes
>    as the default makes sense.

Okay, I think you convinced me, thanks!

Feel free to add my Acked-by.

Best regards,
Tomasz
