Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 888412F8A43
	for <lists+linux-media@lfdr.de>; Sat, 16 Jan 2021 02:13:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbhAPBNf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 20:13:35 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:39734 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbhAPBNf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 20:13:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610759590; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=aYQd6ct3X1FYUJHEYVMsedCk4QxqYq8AVbHhlk4z8d4=;
 b=qYW85UBpikc2QCqhOf1LsXtmThGT6iJ4H8JeXxSPT9jNV0hm7Az4nUyKwI8csQyeeyDJeRW6
 ek2EgE9Ry1Kulb47whrDXhgwfl/0SkMCTKh134nB36cyQ8OWbNfTdfZcRo+fEtjVIOqpyyaT
 xrDDgnCZaL9ZX3VuaYd/Ks366HI=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 60023d7ce23dedcc3a0275b8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 16 Jan 2021 01:12:28
 GMT
Sender: veeras=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F0037C433C6; Sat, 16 Jan 2021 01:12:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: veeras)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 96E60C433CA;
        Sat, 16 Jan 2021 01:12:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 15 Jan 2021 17:12:26 -0800
From:   veeras@codeaurora.org
To:     John Stultz <john.stultz@linaro.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        pdhaval@codeaurora.org, abhinavk@codeaurora.org,
        jsanka@codeaurora.org
Subject: Re: [PATCH v3 2/2] drm/drm_vblank: set the dma-fence timestamp during
 send_vblank_event
In-Reply-To: <CALAqxLUZhb7p26w-a3AmNzFtpB2xDU8k3951VYGGtqgnsqj03A@mail.gmail.com>
References: <1610567539-16750-1-git-send-email-veeras@codeaurora.org>
 <1610567539-16750-2-git-send-email-veeras@codeaurora.org>
 <CALAqxLVdNGCPyB+nQKh2iv41Xr_VarVz3ZLc99mNrShtVr2SAw@mail.gmail.com>
 <e13db164c6efaf8524fb863e8f0e2f0f@codeaurora.org>
 <CALAqxLUZhb7p26w-a3AmNzFtpB2xDU8k3951VYGGtqgnsqj03A@mail.gmail.com>
Message-ID: <32f2787d1fa278febcc9a7abac298a99@codeaurora.org>
X-Sender: veeras@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-01-15 14:29, John Stultz wrote:
> On Thu, Jan 14, 2021 at 12:54 PM <veeras@codeaurora.org> wrote:
>> 
>> On 2021-01-13 18:28, John Stultz wrote:
>> > On Wed, Jan 13, 2021 at 11:52 AM Veera Sundaram Sankaran
>> > <veeras@codeaurora.org> wrote:
>> >>
>> >> The explicit out-fences in crtc are signaled as part of vblank event,
>> >> indicating all framebuffers present on the Atomic Commit request are
>> >> scanned out on the screen. Though the fence signal and the vblank
>> >> event
>> >> notification happens at the same time, triggered by the same hardware
>> >> vsync event, the timestamp set in both are different. With drivers
>> >> supporting precise vblank timestamp the difference between the two
>> >> timestamps would be even higher. This might have an impact on use-mode
>> >> frameworks using these fence timestamps for purposes other than simple
>> >> buffer usage. For instance, the Android framework [1] uses the
>> >> retire-fences as an alternative to vblank when frame-updates are in
>> >> progress. Set the fence timestamp during send vblank event using a new
>> >> drm_send_event_timestamp_locked variant to avoid discrepancies.
>> >>
>> >> [1]
>> >> https://android.googlesource.com/platform/frameworks/native/+/master/
>> >> services/surfaceflinger/Scheduler/Scheduler.cpp#397
>> >>
>> >> Changes in v2:
>> >> - Use drm_send_event_timestamp_locked to update fence timestamp
>> >> - add more information to commit text
>> >>
>> >> Changes in v3:
>> >> - use same backend helper function for variants of drm_send_event to
>> >> avoid code duplications
>> >>
>> >> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
>> >> ---
>> >>  drivers/gpu/drm/drm_file.c   | 71
>> >> ++++++++++++++++++++++++++++++++++++--------
>> >>  drivers/gpu/drm/drm_vblank.c |  9 +++++-
>> >>  include/drm/drm_file.h       |  3 ++
>> >>  3 files changed, 70 insertions(+), 13 deletions(-)
>> >>
>> >> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> >> index 0ac4566..b8348ca 100644
>> >> --- a/drivers/gpu/drm/drm_file.c
>> >> +++ b/drivers/gpu/drm/drm_file.c
>> >> @@ -775,20 +775,19 @@ void drm_event_cancel_free(struct drm_device
>> >> *dev,
>> >>  EXPORT_SYMBOL(drm_event_cancel_free);
>> >>
>> >>  /**
>> >> - * drm_send_event_locked - send DRM event to file descriptor
>> >> + * drm_send_event_helper - send DRM event to file descriptor
>> >>   * @dev: DRM device
>> >>   * @e: DRM event to deliver
>> >> + * @timestamp: timestamp to set for the fence event in kernel's
>> >> CLOCK_MONOTONIC
>> >> + * time domain
>> >>   *
>> >> - * This function sends the event @e, initialized with
>> >> drm_event_reserve_init(),
>> >> - * to its associated userspace DRM file. Callers must already hold
>> >> - * &drm_device.event_lock, see drm_send_event() for the unlocked
>> >> version.
>> >> - *
>> >> - * Note that the core will take care of unlinking and disarming
>> >> events when the
>> >> - * corresponding DRM file is closed. Drivers need not worry about
>> >> whether the
>> >> - * DRM file for this event still exists and can call this function
>> >> upon
>> >> - * completion of the asynchronous work unconditionally.
>> >> + * This helper function sends the event @e, initialized with
>> >> + * drm_event_reserve_init(), to its associated userspace DRM file.
>> >> + * The timestamp variant of dma_fence_signal is used when the caller
>> >> + * sends a valid timestamp.
>> >>   */
>> >> -void drm_send_event_locked(struct drm_device *dev, struct
>> >> drm_pending_event *e)
>> >> +void drm_send_event_helper(struct drm_device *dev,
>> >> +                       struct drm_pending_event *e, ktime_t
>> >> timestamp)
>> >>  {
>> >>         assert_spin_locked(&dev->event_lock);
>> >>
>> >> @@ -799,7 +798,10 @@ void drm_send_event_locked(struct drm_device
>> >> *dev, struct drm_pending_event *e)
>> >>         }
>> >>
>> >>         if (e->fence) {
>> >> -               dma_fence_signal(e->fence);
>> >> +               if (timestamp)
>> >> +                       dma_fence_signal_timestamp(e->fence,
>> >> timestamp);
>> >> +               else
>> >> +                       dma_fence_signal(e->fence);
>> >>                 dma_fence_put(e->fence);
>> >>         }
>> >>
>> >> @@ -814,6 +816,51 @@ void drm_send_event_locked(struct drm_device
>> >> *dev, struct drm_pending_event *e)
>> >>         wake_up_interruptible_poll(&e->file_priv->event_wait,
>> >>                 EPOLLIN | EPOLLRDNORM);
>> >>  }
>> >> +
>> >> +/**
>> >> + * drm_send_event_timestamp_locked - send DRM event to file
>> >> descriptor
>> >> + * @dev: DRM device
>> >> + * @e: DRM event to deliver
>> >> + * @timestamp: timestamp to set for the fence event in kernel's
>> >> CLOCK_MONOTONIC
>> >> + * time domain
>> >> + *
>> >> + * This function sends the event @e, initialized with
>> >> drm_event_reserve_init(),
>> >> + * to its associated userspace DRM file. Callers must already hold
>> >> + * &drm_device.event_lock.
>> >> + *
>> >> + * Note that the core will take care of unlinking and disarming
>> >> events when the
>> >> + * corresponding DRM file is closed. Drivers need not worry about
>> >> whether the
>> >> + * DRM file for this event still exists and can call this function
>> >> upon
>> >> + * completion of the asynchronous work unconditionally.
>> >> + */
>> >> +void drm_send_event_timestamp_locked(struct drm_device *dev,
>> >> +                       struct drm_pending_event *e, ktime_t
>> >> timestamp)
>> >> +{
>> >> +       WARN_ON(!timestamp);
>> >> +
>> >> +       drm_send_event_helper(dev, e, timestamp);
>> >> +
>> >> +}
>> >> +EXPORT_SYMBOL(drm_send_event_timestamp_locked);
>> >
>> >
>> > Hey Veera,
>> >   So actually, after closer look at the testing I was doing, we seem
>> > to be hitting that WARN_ON right as the display first comes up (I see
>> > this on both db845c and HiKey960).
>> > It seems in drm_crtc_send_vblank_event(), if "now" is set by
>> > drm_vblank_count_and_time(), the first timestamp value we get from it
>> > seems to be 0.
>> >
>> > Let me know if you need any help reproducing and sorting this issue
>> > out.
>> >
>> Hi John,
>> Thanks for the review and testing.
>> Since vblank timestamp being set to 0 is acceptable currently, I think
>> it would
>> be safe to remove the WARN_ON in drm_send_event_timestamp_locked(), so
>> the same
>> would be applied to the corresponding fences as well. Especially with
>> high
>> precision vblank timestamping enabled, driver is free to set and there
>> is no
>> timestamp validation within drm. This is a separate work and can be
>> decoupled
>> from this patch. Or we can use the appropriate  drm_send_event variant
>> from send_vblank_event() based on the availability of "now" timestamp.
>> Please let me know your opinion, I will modify the patch accordingly.
> 
> 
> Not sure if I know the vblank details well enough to really recommend a 
> path.
> I suspect there needs to be some special case handling of the
> initialization state so the first vblank isn't at time 0, but I'd need
> to dig more to understand it.
> 
> I'd guess removing the warning is ok for now, but it does seem like
> something needs to eventually be fixed.
> 

Thanks John. Agree that path might need a fix. Updated the current patch
with warn removed. Please take a look.

Thanks,
Veera

> thanks
> -john
