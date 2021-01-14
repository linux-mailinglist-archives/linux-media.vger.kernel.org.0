Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269C52F5876
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 04:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728230AbhANC3u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 21:29:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbhANC3t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 21:29:49 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7260CC061575
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 18:29:08 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id m12so5846556lfo.7
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 18:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x95puxNgC2vbq5QxDUU8f8pXhvDog5hRt5ZVpMfw2uo=;
        b=TbPQkfvptpv70Ivp3lkNTyOpfNU4mKO7a2AGKzUANuUA6L/9UzPXExqMWpAB3+SB0A
         bB8Y1Wj3SkiJgTimXA8CV0semUj5VJKvHyyGZAZLWgEg7T95nribbpVzY65+HWGwdtvB
         gyTeK+KrcxNM/HYy6DfAn4c2M/KpNr+m7nAVPe26jce1Zu+HIriThAr+0mEr4ALCxqHt
         CPsSxob33v0mAS9U3wWkHz3H9nOWW66/ofqpWJGbXbvCJb0QLsBx8DvBaU7awKiGgvD1
         67zFng4zzavHsgQYAuuOVE44tQQGJ4g77aUdQaeXb36NW08toGdzQ1ukvxrEL8ADiXXA
         EirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x95puxNgC2vbq5QxDUU8f8pXhvDog5hRt5ZVpMfw2uo=;
        b=GJc3qSBITMLUqrftPb7H1+6/Zyh5kdiwe7aGMLSuVb9jDMiBH3wLgXUpv7py6nkWNj
         icQBFNHxn6mCLo++WvTNcqjZTt7H02Gg/qJlR1bquSn2BvwBqOf5g0mIz/DVincFOVLk
         73P7oiD5ExNiuXj2VedXx9BU7YqAqCLkxZ0rjhCsT+ybKNIj4P2aQT3Yd0tgU2Gq7wCX
         o/B1Te73Q1GjdEH/fsKQhWOgLA6v14pm/w8sWRi4+vF7zZlVcZoY2NsYpUM4wr5iv1le
         dkGlHXzj9dNK4TakKhFA8kmAwNIb81Ns5Wo4RRlZnX6nlBWZtOS5fRaBmVhNQDAT+wzN
         Zr9Q==
X-Gm-Message-State: AOAM530sWU1RwsnM1fYzUa6AT996nqzZ1oFkEcNVn98Gv0RWOdaxEiT/
        mDug3etuZBfbRq1NFnphUsmnSUqqXTxAH6yjOPsRdQ==
X-Google-Smtp-Source: ABdhPJxNcG5MjzCXllf9zg47SYOxLz5mU1VdJMPt/LUXqJWqd9l+/x+fjumuTYphHawT1C2ETNg5AhrQpKAREcqxvoc=
X-Received: by 2002:ac2:5c1d:: with SMTP id r29mr2080731lfp.204.1610591346863;
 Wed, 13 Jan 2021 18:29:06 -0800 (PST)
MIME-Version: 1.0
References: <1610567539-16750-1-git-send-email-veeras@codeaurora.org> <1610567539-16750-2-git-send-email-veeras@codeaurora.org>
In-Reply-To: <1610567539-16750-2-git-send-email-veeras@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 13 Jan 2021 18:28:55 -0800
Message-ID: <CALAqxLVdNGCPyB+nQKh2iv41Xr_VarVz3ZLc99mNrShtVr2SAw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/drm_vblank: set the dma-fence timestamp during send_vblank_event
To:     Veera Sundaram Sankaran <veeras@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        pdhaval@codeaurora.org, abhinavk@codeaurora.org,
        jsanka@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 13, 2021 at 11:52 AM Veera Sundaram Sankaran
<veeras@codeaurora.org> wrote:
>
> The explicit out-fences in crtc are signaled as part of vblank event,
> indicating all framebuffers present on the Atomic Commit request are
> scanned out on the screen. Though the fence signal and the vblank event
> notification happens at the same time, triggered by the same hardware
> vsync event, the timestamp set in both are different. With drivers
> supporting precise vblank timestamp the difference between the two
> timestamps would be even higher. This might have an impact on use-mode
> frameworks using these fence timestamps for purposes other than simple
> buffer usage. For instance, the Android framework [1] uses the
> retire-fences as an alternative to vblank when frame-updates are in
> progress. Set the fence timestamp during send vblank event using a new
> drm_send_event_timestamp_locked variant to avoid discrepancies.
>
> [1] https://android.googlesource.com/platform/frameworks/native/+/master/
> services/surfaceflinger/Scheduler/Scheduler.cpp#397
>
> Changes in v2:
> - Use drm_send_event_timestamp_locked to update fence timestamp
> - add more information to commit text
>
> Changes in v3:
> - use same backend helper function for variants of drm_send_event to
> avoid code duplications
>
> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
> ---
>  drivers/gpu/drm/drm_file.c   | 71 ++++++++++++++++++++++++++++++++++++--------
>  drivers/gpu/drm/drm_vblank.c |  9 +++++-
>  include/drm/drm_file.h       |  3 ++
>  3 files changed, 70 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 0ac4566..b8348ca 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -775,20 +775,19 @@ void drm_event_cancel_free(struct drm_device *dev,
>  EXPORT_SYMBOL(drm_event_cancel_free);
>
>  /**
> - * drm_send_event_locked - send DRM event to file descriptor
> + * drm_send_event_helper - send DRM event to file descriptor
>   * @dev: DRM device
>   * @e: DRM event to deliver
> + * @timestamp: timestamp to set for the fence event in kernel's CLOCK_MONOTONIC
> + * time domain
>   *
> - * This function sends the event @e, initialized with drm_event_reserve_init(),
> - * to its associated userspace DRM file. Callers must already hold
> - * &drm_device.event_lock, see drm_send_event() for the unlocked version.
> - *
> - * Note that the core will take care of unlinking and disarming events when the
> - * corresponding DRM file is closed. Drivers need not worry about whether the
> - * DRM file for this event still exists and can call this function upon
> - * completion of the asynchronous work unconditionally.
> + * This helper function sends the event @e, initialized with
> + * drm_event_reserve_init(), to its associated userspace DRM file.
> + * The timestamp variant of dma_fence_signal is used when the caller
> + * sends a valid timestamp.
>   */
> -void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e)
> +void drm_send_event_helper(struct drm_device *dev,
> +                       struct drm_pending_event *e, ktime_t timestamp)
>  {
>         assert_spin_locked(&dev->event_lock);
>
> @@ -799,7 +798,10 @@ void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e)
>         }
>
>         if (e->fence) {
> -               dma_fence_signal(e->fence);
> +               if (timestamp)
> +                       dma_fence_signal_timestamp(e->fence, timestamp);
> +               else
> +                       dma_fence_signal(e->fence);
>                 dma_fence_put(e->fence);
>         }
>
> @@ -814,6 +816,51 @@ void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e)
>         wake_up_interruptible_poll(&e->file_priv->event_wait,
>                 EPOLLIN | EPOLLRDNORM);
>  }
> +
> +/**
> + * drm_send_event_timestamp_locked - send DRM event to file descriptor
> + * @dev: DRM device
> + * @e: DRM event to deliver
> + * @timestamp: timestamp to set for the fence event in kernel's CLOCK_MONOTONIC
> + * time domain
> + *
> + * This function sends the event @e, initialized with drm_event_reserve_init(),
> + * to its associated userspace DRM file. Callers must already hold
> + * &drm_device.event_lock.
> + *
> + * Note that the core will take care of unlinking and disarming events when the
> + * corresponding DRM file is closed. Drivers need not worry about whether the
> + * DRM file for this event still exists and can call this function upon
> + * completion of the asynchronous work unconditionally.
> + */
> +void drm_send_event_timestamp_locked(struct drm_device *dev,
> +                       struct drm_pending_event *e, ktime_t timestamp)
> +{
> +       WARN_ON(!timestamp);
> +
> +       drm_send_event_helper(dev, e, timestamp);
> +
> +}
> +EXPORT_SYMBOL(drm_send_event_timestamp_locked);


Hey Veera,
  So actually, after closer look at the testing I was doing, we seem
to be hitting that WARN_ON right as the display first comes up (I see
this on both db845c and HiKey960).
It seems in drm_crtc_send_vblank_event(), if "now" is set by
drm_vblank_count_and_time(), the first timestamp value we get from it
seems to be 0.

Let me know if you need any help reproducing and sorting this issue out.

thanks
-john
