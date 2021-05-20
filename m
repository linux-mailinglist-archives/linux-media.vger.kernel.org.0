Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9F938B236
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 16:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbhETOvq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 10:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbhETOvq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 10:51:46 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCEEEC061574;
        Thu, 20 May 2021 07:50:23 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id v12so17970425wrq.6;
        Thu, 20 May 2021 07:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Pw/S3DhRfs9hqIwXkjoQ53ij2Leive6HtbA3MFyHCVA=;
        b=hwiIauTkRs1gkN7GptgkaSNYGZrP3Ui4s0V1lP3VcpU9RdwFWgPVtzMNlwAMoyPI9s
         I3PU2aWE4CfRaH9vhiYZHL4ZGUUoS8qUrgEV10VObwtOqCMXgORXcqrLFvBKxrSZjk7U
         Qy1ReiQyV5LNQNzkjF6irBDS4DxFx32SHBvWepatsCspmxetBEaXfREFdmHe269HmmRt
         v/p+fLWYleQBkV2+rMjMpiJGHWoFBON/jYuJop49t+TmRKFFYAZccBHEeboTIKls3dmz
         Lu25yodi2wA30N77koIcqpHBweSntl6WcktpsTVQQkL4mmoicBJglBDbb9I8RA0NJFLq
         oLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Pw/S3DhRfs9hqIwXkjoQ53ij2Leive6HtbA3MFyHCVA=;
        b=EXVfvn0yTle641f2Ubi9S0Ncxjd2Y94bfJuzuDwLQat/ae7L055EKzrHy1USi9734M
         aMOqJWbs0uu/cyzN6sck/Y2jz/JsoJco2O8xafF0CADH+DdyCn4r0nt8MvqB6Iz37rpA
         FZ2HkFsQjzIDptqP6PbkKxfAC9h1Yi2yH2AUT3WZMX5sni1n0sUxaKlF3CnKH8++rk2E
         HP7cMlGeh+MMiiIkFjetx7NNN2YwYnXQzp6dqYY8KcLdWJ4tRdLnuA+Gb9uk+KdmBxed
         DjdWwonE9A4asgetB/UcU4LdH2mrMJsl/YRTovRZ9JLko2wHd/G0YKsM+hmtxiCF01Hp
         S2hw==
X-Gm-Message-State: AOAM532nlH4dHdBj3xaMOzGj+jWW7rp/pBaPW8a9p7XVvLIBpSNnV1LI
        CRo4WjCFgf/8nedzDF58KBfOG21ZDLmBYmui8VE=
X-Google-Smtp-Source: ABdhPJyqpa5z8S7zPqUU/Sw+yjCc4qC8hKSJNQRRZDc71DjdMxDOwRF7Ke51/NMtAhuN4Tw9Wv81UvtjRWmRVbsahmU=
X-Received: by 2002:adf:fa46:: with SMTP id y6mr4810707wrr.83.1621522222321;
 Thu, 20 May 2021 07:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210519183855.1523927-1-robdclark@gmail.com> <20210519183855.1523927-2-robdclark@gmail.com>
 <8dcdc8d5-176c-f0ad-0d54-6466e9e68a0a@amd.com> <CAF6AEGtg_VnxYrj94AfbAfViK1v8U0ZJyfJjS4taVLMF=YVy+w@mail.gmail.com>
 <d65acf46-4c3b-4903-6222-0b81915d355d@amd.com>
In-Reply-To: <d65acf46-4c3b-4903-6222-0b81915d355d@amd.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 20 May 2021 07:54:05 -0700
Message-ID: <CAF6AEGvm1tFwpfyJrX1bTGoHg_wzKKLQvSk2qLHf3XeqvEzDPA@mail.gmail.com>
Subject: Re: [RFC 1/3] dma-fence: Add boost fence op
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 20, 2021 at 7:11 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> Am 20.05.21 um 16:07 schrieb Rob Clark:
> > On Wed, May 19, 2021 at 11:47 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Uff, that looks very hardware specific to me.
> > Howso?  I'm not sure I agree.. and even if it was not useful for some
> > hw, it should be useful for enough drivers (and harm no drivers), so I
> > still think it is a good idea
> >
> > The fallback plan is to go the i915 route and stop using atomic
> > helpers and do the same thing inside the driver, but that doesn't help
> > any of the cases where you have a separate kms and gpu driver.
>
> Yeah, that's certainly not something we want.
>
> >> As far as I can see you can also implement completely inside the backe=
nd
> >> by starting a timer on enable_signaling, don't you?
> > Not really.. I mean, the fact that something waited on a fence could
> > be a useful input signal to gpu freq governor, but it is entirely
> > insufficient..
> >
> > If the cpu is spending a lot of time waiting on a fence, cpufreq will
> > clock down so you spend less time waiting.  And no problem has been
> > solved.  You absolutely need the concept of a missed deadline, and a
> > timer doesn't give you that.
>
> Ok then I probably don't understand the use case here.
>
> What exactly do you try to solve?

Basically situations where you are ping-ponging between GPU and CPU..
for example if you are double buffering instead of triple buffering,
and doing vblank sync'd pageflips.  The GPU, without any extra signal,
could get stuck at 30fps and a low gpu freq, because it ends up idle
while waiting for an extra vblank cycle for the next back-buffer to
become available.  Whereas if it boosted up to a higher freq and
stopped missing a vblank deadline, it would be less idle due to
getting the next back-buffer sooner (due to not missing a vblank
deadline).

BR,
-R

> Thanks,
> Christian.
>
> >
> > BR,
> > -R
> >
> >> Christian.
> >>
> >> Am 19.05.21 um 20:38 schrieb Rob Clark:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> Add a way to hint to the fence signaler that a fence waiter has misse=
d a
> >>> deadline waiting on the fence.
> >>>
> >>> In some cases, missing a vblank can result in lower gpu utilization,
> >>> when really we want to go in the opposite direction and boost gpu fre=
q.
> >>> The boost callback gives some feedback to the fence signaler that we
> >>> are missing deadlines, so it can take this into account in it's freq/
> >>> utilization calculations.
> >>>
> >>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>> ---
> >>>    include/linux/dma-fence.h | 26 ++++++++++++++++++++++++++
> >>>    1 file changed, 26 insertions(+)
> >>>
> >>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> >>> index 9f12efaaa93a..172702521acc 100644
> >>> --- a/include/linux/dma-fence.h
> >>> +++ b/include/linux/dma-fence.h
> >>> @@ -231,6 +231,17 @@ struct dma_fence_ops {
> >>>        signed long (*wait)(struct dma_fence *fence,
> >>>                            bool intr, signed long timeout);
> >>>
> >>> +     /**
> >>> +      * @boost:
> >>> +      *
> >>> +      * Optional callback, to indicate that a fence waiter missed a =
deadline.
> >>> +      * This can serve as a signal that (if possible) whatever signa=
ls the
> >>> +      * fence should boost it's clocks.
> >>> +      *
> >>> +      * This can be called in any context that can call dma_fence_wa=
it().
> >>> +      */
> >>> +     void (*boost)(struct dma_fence *fence);
> >>> +
> >>>        /**
> >>>         * @release:
> >>>         *
> >>> @@ -586,6 +597,21 @@ static inline signed long dma_fence_wait(struct =
dma_fence *fence, bool intr)
> >>>        return ret < 0 ? ret : 0;
> >>>    }
> >>>
> >>> +/**
> >>> + * dma_fence_boost - hint from waiter that it missed a deadline
> >>> + *
> >>> + * @fence: the fence that caused the missed deadline
> >>> + *
> >>> + * This function gives a hint from a fence waiter that a deadline wa=
s
> >>> + * missed, so that the fence signaler can factor this in to device
> >>> + * power state decisions
> >>> + */
> >>> +static inline void dma_fence_boost(struct dma_fence *fence)
> >>> +{
> >>> +     if (fence->ops->boost)
> >>> +             fence->ops->boost(fence);
> >>> +}
> >>> +
> >>>    struct dma_fence *dma_fence_get_stub(void);
> >>>    u64 dma_fence_context_alloc(unsigned num);
> >>>
>
