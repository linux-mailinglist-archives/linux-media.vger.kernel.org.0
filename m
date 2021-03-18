Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4175F3406B5
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 14:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbhCRNTI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 09:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbhCRNSh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 09:18:37 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AAFDC06175F
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 06:18:37 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id m21-20020a9d7ad50000b02901b83efc84a0so5134496otn.10
        for <linux-media@vger.kernel.org>; Thu, 18 Mar 2021 06:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v0u3U62VgqQ/5cx0dl1OlmbnmTob1+65hnEnMoAP8+g=;
        b=Wq2xIKdqjdfzxw2Myb5taaYoDXG0Mt5eTvw70t+Qfukgix/l82cWO0JuAAM9pp9Lr8
         iuztkE2RYqfAeHvp28wsWDJ+QoGaPWC+Rv09fwMM2iRu/K2UOyFvuXajEDVEVPCoATb4
         oF5XWjbtWmNZTiF6bVmPZ4xhDEvuykvOW88w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v0u3U62VgqQ/5cx0dl1OlmbnmTob1+65hnEnMoAP8+g=;
        b=VnqYI0NLBsj9CccmgyYD5LQ0TU6mcmAlOCDgefAm6PTOL3GptGr+bdoGu41CBpbkre
         OvQ+OZ+/nxNXnnxrTDqf8EnJrsarZV/fFyl8kE/15xtzWjj+6jB0HHB/5WT78WSUq57m
         VL5owxwykdRsi6t3EsCyfZahcVBk0fwms61kVyEJZJe+crXuXGiRu0tIO6bFnt1NktES
         SMl+Tk9MaAxjtvRmXLcXVVCirR6j4GgyWpPnqYs1BqSobUNwKf+YvknNtWnq0hAuQcTQ
         1hfL+W/4qPV1Q3u4BbC85n6CG85vZEzaNrUkiO1oYGUTy0O3ZC2FLZjq0weop3ve/gpO
         CgxQ==
X-Gm-Message-State: AOAM533SB8GeAdzTJWYoBgweck2aql77VPNOQpbbbHYhWBMlT/2+Gjtl
        IAUyaDU9flfV2L+cRJKQHUreO5E4rVEkqUTtq1VfCA==
X-Google-Smtp-Source: ABdhPJys7CWu1QW7sqaGp8DPpYtt4z4UFBXzAiTSc52E6cJ3FtAgdwRl3llcaxjGyQonUci42YLrVhEplIIDHitKc+k=
X-Received: by 2002:a9d:63d6:: with SMTP id e22mr7303358otl.188.1616073516410;
 Thu, 18 Mar 2021 06:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <16d4300e-bf29-1e85-317b-53d257890cb9@vmware.com> <20210308091932.GB4931@dell>
 <YEobySvG0zPs9xhc@phenom.ffwll.local> <20210311135152.GT701493@dell>
 <20210317081729.GH701493@dell> <CAKMK7uEibsgXXTEM1d2CGSswp-koouPSouseP_rwLHTdpxfRpw@mail.gmail.com>
In-Reply-To: <CAKMK7uEibsgXXTEM1d2CGSswp-koouPSouseP_rwLHTdpxfRpw@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 18 Mar 2021 14:18:25 +0100
Message-ID: <CAKMK7uHkJGDL8k3FfAqAM78honZR0euMcacW8UpdPZfS1J-7cA@mail.gmail.com>
Subject: Re: [RESEND 00/53] Rid GPU from W=1 warnings
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Roland Scheidegger <sroland@vmware.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Anthony Koo <Anthony.Koo@amd.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Colin Ian King <colin.king@canonical.com>,
        Dave Airlie <airlied@redhat.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Harry Wentland <harry.wentland@amd.com>,
        Jeremy Kolb <jkolb@brandeis.edu>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Leo Li <sunpeng.li@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Nouveau Dev <nouveau@lists.freedesktop.org>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Rob Clark <rob.clark@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Zack Rusin <zackr@vmware.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 17, 2021 at 9:32 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Mar 17, 2021 at 9:17 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Thu, 11 Mar 2021, Lee Jones wrote:
> >
> > > On Thu, 11 Mar 2021, Daniel Vetter wrote:
> > >
> > > > On Mon, Mar 08, 2021 at 09:19:32AM +0000, Lee Jones wrote:
> > > > > On Fri, 05 Mar 2021, Roland Scheidegger wrote:
> > > > >
> > > > > > The vmwgfx ones look all good to me, so for
> > > > > > 23-53: Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> > > > > > That said, they were already signed off by Zack, so not sure what
> > > > > > happened here.
> > > > >
> > > > > Yes, they were accepted at one point, then dropped without a reason.
> > > > >
> > > > > Since I rebased onto the latest -next, I had to pluck them back out of
> > > > > a previous one.
> > > >
> > > > They should show up in linux-next again. We merge patches for next merge
> > > > window even during the current merge window, but need to make sure they
> > > > don't pollute linux-next. Occasionally the cut off is wrong so patches
> > > > show up, and then get pulled again.
> > > >
> > > > Unfortunately especially the 5.12 merge cycle was very wobbly due to some
> > > > confusion here. But your patches should all be in linux-next again (they
> > > > are queued up for 5.13 in drm-misc-next, I checked that).
> > > >
> > > > Sorry for the confusion here.
> > >
> > > Oh, I see.  Well so long as they don't get dropped, I'll be happy.
> > >
> > > Thanks for the explanation Daniel
> >
> > After rebasing today, all of my GPU patches have remained.  Would
> > someone be kind enough to check that everything is still in order
> > please?
>
> It's still broken somehow. I've kiced Maxime and Maarten again,
> they're also on this thread.

You're patches have made it into drm-next meanwhile, so they should
show up in linux-next through that tree at least. Except if that one
also has some trouble.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
