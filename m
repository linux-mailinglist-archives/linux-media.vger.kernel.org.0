Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82D92B91E0
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 12:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbgKSLuv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 06:50:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbgKSLuu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 06:50:50 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DDDC0613CF
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 03:50:49 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id q206so5949275oif.13
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 03:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wAINGYhpRNkeBcHvB7hUfaRV9a2G0AV47GHaXFf129g=;
        b=WBpoc0xdVhpxpx7JMPTDKoNS6NBHcXqJAZMZE7t4PKySCED9ho/YRTv710D/lJXRho
         ruquWxbEUWwOXHkY1DuIHpCd7LeVbO3n0GYjgalc0WkxXomGepyRtkgPxLN7qElxDf+8
         dRiFlqGEPdOiQVNMQK3wDOdSs9N7WTPs2hyqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wAINGYhpRNkeBcHvB7hUfaRV9a2G0AV47GHaXFf129g=;
        b=QrckWt6hk5HYxxYvfRha80jb91DLd0GoCYZJcIvMOTpw/bonZZovT6nDo5TlB+jYUk
         87YRn6uMui2WPnFGDNen5qICTb61PTiTuKCI+FM4rxwBNqtIidm3cp/fb/wOhhFzxNAi
         pZHIiRS1QzFUyn8QzoApl/T1i3tZeL7n+jT2fZh0KTMBk9yu+6YQ5+5yN5vJMNMia8hH
         FR335MnWHxEgbab3dahQ6hdfti77QQMukBM6z7YDYyazIw2bieGJvEx8ZPv9nclTy3/6
         JZY58VXeflkzgnyKLZnHh0W9ywatusemmNAF0m2vwvOWAYpcumPpvkYVJboctKx8aV1o
         wvYA==
X-Gm-Message-State: AOAM533Osf5Qb4Yc7p+odJBGRPrJTicJ6Cykba26VABWRt0nxtQhnyvx
        xGT1m+N5tGNYGQPlIHzh6Rpm9bKpa75gigvpCssAwg==
X-Google-Smtp-Source: ABdhPJy/MXGNqya9sfGY9qtGsAxNCa7mmUSP4CZliM1Hu0gRLG+R5Nvz8GneyUwn8QPqdTh269kFctbbvtATNEiV480=
X-Received: by 2002:aca:1713:: with SMTP id j19mr2367142oii.101.1605786648953;
 Thu, 19 Nov 2020 03:50:48 -0800 (PST)
MIME-Version: 1.0
References: <1605205643-12746-1-git-send-email-veeras@codeaurora.org>
 <1605205643-12746-2-git-send-email-veeras@codeaurora.org> <20201113204525.GV401619@phenom.ffwll.local>
 <a21bad2bd7b5583692535ea107d38872@codeaurora.org>
In-Reply-To: <a21bad2bd7b5583692535ea107d38872@codeaurora.org>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 19 Nov 2020 12:50:37 +0100
Message-ID: <CAKMK7uGMyiV-_NUdcHMT4oT+aJF3vTfe6qUMaYwt7xbkDVs=Rw@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/2] drm/drm_vblank: set the dma-fence timestamp
 during send_vblank_event
To:     Veera Sundaram Sankaran <veeras@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Dave Airlie <airlied@linux.ie>,
        "Clark, Rob" <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        pdhaval@codeaurora.org, Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 19, 2020 at 2:26 AM <veeras@codeaurora.org> wrote:
>
> On 2020-11-13 12:45, Daniel Vetter wrote:
> > On Thu, Nov 12, 2020 at 10:27:23AM -0800, Veera Sundaram Sankaran
> > wrote:
> >> The explicit out-fences in crtc are signaled as part of vblank event,
> >> indicating all framebuffers present on the Atomic Commit request are
> >> scanned out on the screen. Though the fence signal and the vblank
> >> event
> >> notification happens at the same time, triggered by the same hardware
> >> vsync event, the timestamp set in both are different. With drivers
> >> supporting precise vblank timestamp the difference between the two
> >> timestamps would be even higher. This might have an impact on use-mode
> >> frameworks using these fence timestamps for purposes other than simple
> >> buffer usage. For instance, the Android framework uses the
> >> retire-fences
> >> as an alternative to vblank when frame-updates are in progress Set the
> >> fence timestamp during send vblank event to avoid discrepancies.
> >
> > I think a reference to the exact source code in android that does this
> > would be really useful. Something in drm_hwcomposer or whatever is
> > doing
> > this.
> >
>
> Thanks for the review. Sorry for not getting back earlier, was waiting
> for the review on [patch 1/2], so that both comments can be addressed
> together.
> Here is the reference for Android expecting retire-fence timestamp to
> match exactly with hardware vsync as it is used for the dispsync model.
>
> Usage: https://source.android.com/devices/graphics/implement-vsync
> Code:
> https://android.googlesource.com/platform/frameworks/native/+/master/services/surfaceflinger/Scheduler/Scheduler.cpp#397
> Will update the commit-text with the links as part of V2 patch.

Yeah sounds good. Might be good to mention that Android requires this
in the code comment too, since it's potentially confusing.
-Daniel

> Thanks,
> Veera
>
> > Aside from documenting why we want to do this I think this all looks
> > reasonable.
> > -Daniel
> >
> >>
> >> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
> >> ---
> >>  drivers/gpu/drm/drm_vblank.c | 9 +++++++++
> >>  1 file changed, 9 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_vblank.c
> >> b/drivers/gpu/drm/drm_vblank.c
> >> index b18e1ef..b38e50c 100644
> >> --- a/drivers/gpu/drm/drm_vblank.c
> >> +++ b/drivers/gpu/drm/drm_vblank.c
> >> @@ -24,6 +24,7 @@
> >>   * OTHER DEALINGS IN THE SOFTWARE.
> >>   */
> >>
> >> +#include <linux/dma-fence.h>
> >>  #include <linux/export.h>
> >>  #include <linux/kthread.h>
> >>  #include <linux/moduleparam.h>
> >> @@ -999,6 +1000,14 @@ static void send_vblank_event(struct drm_device
> >> *dev,
> >>              e->event.seq.time_ns = ktime_to_ns(now);
> >>              break;
> >>      }
> >> +
> >> +    /*
> >> +     * update fence timestamp with the same vblank timestamp as both
> >> +     * are signaled by the same event
> >> +     */
> >> +    if (e->base.fence)
> >> +            e->base.fence->timestamp = now;
> >> +
> >>      trace_drm_vblank_event_delivered(e->base.file_priv, e->pipe, seq);
> >>      drm_send_event_locked(dev, &e->base);
> >>  }
> >> --
> >> 2.7.4
> >>



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
