Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9C028815C
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 06:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731307AbgJIEaU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 00:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgJIEaU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 00:30:20 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 634EFC0613D2
        for <linux-media@vger.kernel.org>; Thu,  8 Oct 2020 21:30:20 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id e20so7412420otj.11
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2020 21:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bQCRsRi8kNOo2aPGfc7lMNsOSErczm6II0z2jnbK/64=;
        b=hOWJ7xYfYM+6d5Y3UGE81JEW30JgDfoQMe1Tn0bTzgehmm0gWfnBdkgQ7HuIXYBQB2
         /tjbwY4uuJr6AXHAvxJsDIe/hODY461gREIMT00jtu90X+3zfGwdybMA4O/Q4aJNV1ay
         z+8z3GXqz2BvyOqTty4J6/NVLV5vh7K0jy1gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bQCRsRi8kNOo2aPGfc7lMNsOSErczm6II0z2jnbK/64=;
        b=kQTN3m5jLk+ZYNkNmbPzvH7VMTfbckFQXwUC42Y1LKIWSmJjEXRQ7u6HqDG5Yk7gdt
         jbaM7/i77M6eB8y80kCsEznv40UncgAb+de/PBFHA5PLNWEBQ/tm/ZZsd/hlsCMQRJGC
         kYKLRQ5ym5Em/bqSHZdYCKaGHZ8BTGZjDaEGfwK3h8rh09y0U5irgDjFwHIRUXXmUd+O
         bNvPaZ5dRUTJvCZKAct4+Ej2xJR0ymeIDqAmvr2r1kHEuNMsVuBu1hI9q7aR0Kf1pJ0X
         p4qEv6N8GtIh3AncTCwdwjL3KIrq9O/VG0nyY9FU0AB/E8h1nK4Uv5atQw0xjgQ06HiP
         TlSg==
X-Gm-Message-State: AOAM532D0FeK0J/iYzlk1uarw+EwSHbuFZYgVIhOPU+m3e2BbxkLXse6
        lslSI1JUsO9SQycpgrJ1oyQ16qfmJp3k2C2x
X-Google-Smtp-Source: ABdhPJwX95GsKWLlU7X4iqwyEVGb15Lk7lCAIQYAc7IV1zGnakkQyqjSKWeZTb1YOt+RL0GDfHHyEQ==
X-Received: by 2002:a9d:3407:: with SMTP id v7mr7392398otb.117.1602217819311;
        Thu, 08 Oct 2020 21:30:19 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id m1sm5753450otq.30.2020.10.08.21.30.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2020 21:30:18 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id f10so7861218otb.6
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2020 21:30:18 -0700 (PDT)
X-Received: by 2002:a9d:7a2:: with SMTP id 31mr7000765oto.141.1602217817599;
 Thu, 08 Oct 2020 21:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201004122234.802044-1-acourbot@chromium.org>
 <c3e1c20a-7729-9f48-ce66-41e67f195fc7@xs4all.nl> <cda40a8e-4dd2-5fd7-c5ff-8b048475164b@xs4all.nl>
 <CAPBb6MX8rFZU=9Pd5o0mqQ6pf+1oQYzk=D0WiR93_S3FUG7jJw@mail.gmail.com> <1bb71c21-0f03-5d8f-be2c-fdcb13dadcd6@xs4all.nl>
In-Reply-To: <1bb71c21-0f03-5d8f-be2c-fdcb13dadcd6@xs4all.nl>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 9 Oct 2020 13:30:06 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWf7bWkigMPUwx7g6dXjwMkttGhHwC9X_=e6=cz1K5J0w@mail.gmail.com>
Message-ID: <CAPBb6MWf7bWkigMPUwx7g6dXjwMkttGhHwC9X_=e6=cz1K5J0w@mail.gmail.com>
Subject: Re: [PATCH v2] media: mtk-vcodec: fix builds when remoteproc is disabled
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 9, 2020 at 1:13 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 08/10/2020 16:02, Alexandre Courbot wrote:
> > Hi Hans, thanks for taking the time to look at this!
> >
> > On Thu, Oct 8, 2020 at 10:12 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> On 08/10/2020 15:07, Hans Verkuil wrote:
> >>> Hi Alexandre,
> >>>
> >>> On 04/10/2020 14:22, Alexandre Courbot wrote:
> >>>> The addition of MT8183 support added a dependency on the SCP remoteproc
> >>>> module. However the initial patch used the "select" Kconfig directive,
> >>>> which may result in the SCP module to not be compiled if remoteproc was
> >>>> disabled. In such a case, mtk-vcodec would try to link against
> >>>> non-existent SCP symbols. "select" was clearly misused here as explained
> >>>> in kconfig-language.txt.
> >>>>
> >>>> Replace this by a "depends" directive on at least one of the VPU and
> >>>> SCP modules, to allow the driver to be compiled as long as one of these
> >>>> is enabled, and adapt the code to support this new scenario.
> >>>>
> >>>> Also adapt the Kconfig text to explain the extra requirements for MT8173
> >>>> and MT8183.
> >>>>
> >>>> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> >>>> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> >>>> ---
> >>>>  drivers/media/platform/Kconfig                | 10 +--
> >>>>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 72 ++++++++++++-------
> >>>>  2 files changed, 54 insertions(+), 28 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> >>>> index a3cb104956d5..98eb62e49ec2 100644
> >>>> --- a/drivers/media/platform/Kconfig
> >>>> +++ b/drivers/media/platform/Kconfig
> >>>> @@ -253,14 +253,16 @@ config VIDEO_MEDIATEK_VCODEC
> >>>>      depends on MTK_IOMMU || COMPILE_TEST
> >>>>      depends on VIDEO_DEV && VIDEO_V4L2
> >>>>      depends on ARCH_MEDIATEK || COMPILE_TEST
> >>>> +    depends on VIDEO_MEDIATEK_VPU || MTK_SCP
> >>>
> >>> Close, but no cigar.
> >>>
> >>> If VIDEO_MEDIATEK_VPU=y and MTK_SCP=m, then VIDEO_MEDIATEK_VCODEC can be configured
> >>> to y, and then it won't be able to find the scp_ functions.
> >>>
> >>> To be honest, I'm not sure how to solve this.
> >>
> >> Found it. Add this:
> >>
> >>         depends on MTK_SCP || !MTK_SCP
> >>         depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
> >>
> >> Ugly as hell, but it appears to be the correct incantation for this.
> >
> > But doesn't it mean that the driver can be compiled if !MTK_SCP and
> > !VIDEO_MEDIATEK_VPU? That's the one case we want to avoid.
>
> No, because you still have:
>
>         depends on VIDEO_MEDIATEK_VPU || MTK_SCP
>
> So at least one of these must be set.
>
> Just try it :-)

Aha, I misread your message and thought you suggested replacing the
dependencies with these two lines. In this case it would certainly
work! Thanks for the suggestion, I'll send a v3 soon.

>
> Regards,
>
>         Hans
