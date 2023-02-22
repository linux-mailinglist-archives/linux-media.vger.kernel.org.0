Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D17F569FBA4
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 19:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbjBVS5y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 13:57:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbjBVS5x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 13:57:53 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C82D272C;
        Wed, 22 Feb 2023 10:57:51 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id w7so8897291oik.13;
        Wed, 22 Feb 2023 10:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UF7nR0RAhOzqdZkHDCQjiRJ4YI0fbLgTEln+9Hs89cc=;
        b=GXPFdJPqHg34EbfZFQwsHqVl71NbwwnBvYtpxGkfSHAr+EM8MHBzktjfMX8YzYP0Th
         ty3iR9sqxUi6OcJM5cAJp5tmM4BxeAT5Op2Z2a1yko0mhyhim/hBJ3zwc7FGOBwdeBsO
         2y/WNoeQLWSfkdhJSdfJKQhu/cm7X/77Ncojseq07fUYIOYcP1B0BHPKGF11xrkBXb1s
         ucXeJDwbXhbCYVICFSAn6nVUy20odf/WEVv+VQEV5nkncVtQTOvZhWfft+/XlrtQe+qW
         PqwwV1J2EIMYS5bb0Nkzp0RCkGOKfPkC18E9/3A4/TzBa6e22Gt5L7o/pceG67QtBBH8
         K+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UF7nR0RAhOzqdZkHDCQjiRJ4YI0fbLgTEln+9Hs89cc=;
        b=G8QhMBicWESk6WgAIV+gfAv5hbmcweHhAxQDhbOUxSswbRaW079iHWbIZ6S8D29IpH
         uCW5w1QWHu5IXbNRKPBkjoGZtmaT2u3DeOeDpZQlMMFtMekQ9fz14CYL8WEfVQ6wukBP
         QAtXlEut37sjMINkheIuRURynA330p+lTThuIWk8YT0I82oYoL83vJIbTg7C/l3OXEKA
         0tsxzm3TiiR3AgU1uxcxlM22d7+cgqbd9S1xAWyMMP3D+vOB0oFtGZytrNZcB9r8s8s+
         lQlqklqVEk24CI2sQwB0/XnWBd4ib+EC/pLggOc+ktJZWIlSKjsDYBVDHoqxdPurIPcH
         +d1g==
X-Gm-Message-State: AO0yUKUBPtNM/pB5hiN3v9SXIjrTkAdj66sqf8D+fIqLar9B0Uji3+fD
        I9Yd9acBjIsfgfZDSpk4RLLrVrFupFfkPYUc7kE=
X-Google-Smtp-Source: AK7set8frmvxbkGuSlE/CZ3Cw8fhh0TWYwlF4WjVzZ12iA+f7NRi126FESxiqBxE2/sx2BJ0dkNHdIprSHLrN2hcU/w=
X-Received: by 2002:a05:6808:16ab:b0:37d:81a9:5103 with SMTP id
 bb43-20020a05680816ab00b0037d81a95103mr1454254oib.38.1677092270732; Wed, 22
 Feb 2023 10:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20230218211608.1630586-1-robdclark@gmail.com> <20230218211608.1630586-2-robdclark@gmail.com>
 <b65a2fe2-6f68-2116-9599-2940e66d166b@linux.intel.com> <21f36640-3229-0b46-31a2-a47efc5be934@amd.com>
 <b8a16579-4be7-8e14-01e4-9d17c1570c8b@linux.intel.com> <CAJs_Fx61OpgFo_kSLoy+2z8mS=wcdK8eZfQBA6dQm9p0=qLU2g@mail.gmail.com>
 <d7b0614e-2cc3-1180-3571-409204ac5b00@linux.intel.com>
In-Reply-To: <d7b0614e-2cc3-1180-3571-409204ac5b00@linux.intel.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 22 Feb 2023 10:57:39 -0800
Message-ID: <CAF6AEGvyei6QcNGb-VEAuE5w4qJHavj+8TuirXwwcK7ydEXeSQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/14] dma-buf/dma-fence: Add deadline awareness
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org,
        Gustavo Padovan <gustavo@padovan.org>,
        Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
        =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
        open list <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        freedreno@lists.freedesktop.org,
        "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 22, 2023 at 9:33 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 22/02/2023 17:16, Rob Clark wrote:
> > On Wed, Feb 22, 2023 at 9:05 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> On 22/02/2023 15:28, Christian K=C3=B6nig wrote:
> >>> Am 22.02.23 um 11:23 schrieb Tvrtko Ursulin:
> >>>>
> >>>> On 18/02/2023 21:15, Rob Clark wrote:
> >>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>
> >>>>> Add a way to hint to the fence signaler of an upcoming deadline, su=
ch as
> >>>>> vblank, which the fence waiter would prefer not to miss.  This is t=
o aid
> >>>>> the fence signaler in making power management decisions, like boost=
ing
> >>>>> frequency as the deadline approaches and awareness of missing deadl=
ines
> >>>>> so that can be factored in to the frequency scaling.
> >>>>>
> >>>>> v2: Drop dma_fence::deadline and related logic to filter duplicate
> >>>>>       deadlines, to avoid increasing dma_fence size.  The fence-con=
text
> >>>>>       implementation will need similar logic to track deadlines of =
all
> >>>>>       the fences on the same timeline.  [ckoenig]
> >>>>> v3: Clarify locking wrt. set_deadline callback
> >>>>>
> >>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>>> ---
> >>>>>    drivers/dma-buf/dma-fence.c | 20 ++++++++++++++++++++
> >>>>>    include/linux/dma-fence.h   | 20 ++++++++++++++++++++
> >>>>>    2 files changed, 40 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fenc=
e.c
> >>>>> index 0de0482cd36e..763b32627684 100644
> >>>>> --- a/drivers/dma-buf/dma-fence.c
> >>>>> +++ b/drivers/dma-buf/dma-fence.c
> >>>>> @@ -912,6 +912,26 @@ dma_fence_wait_any_timeout(struct dma_fence
> >>>>> **fences, uint32_t count,
> >>>>>    }
> >>>>>    EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> >>>>>    +
> >>>>> +/**
> >>>>> + * dma_fence_set_deadline - set desired fence-wait deadline
> >>>>> + * @fence:    the fence that is to be waited on
> >>>>> + * @deadline: the time by which the waiter hopes for the fence to =
be
> >>>>> + *            signaled
> >>>>> + *
> >>>>> + * Inform the fence signaler of an upcoming deadline, such as
> >>>>> vblank, by
> >>>>> + * which point the waiter would prefer the fence to be signaled by=
.
> >>>>> This
> >>>>> + * is intended to give feedback to the fence signaler to aid in po=
wer
> >>>>> + * management decisions, such as boosting GPU frequency if a perio=
dic
> >>>>> + * vblank deadline is approaching.
> >>>>> + */
> >>>>> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadl=
ine)
> >>>>> +{
> >>>>> +    if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
> >>>>> +        fence->ops->set_deadline(fence, deadline);
> >>>>> +}
> >>>>> +EXPORT_SYMBOL(dma_fence_set_deadline);
> >>>>> +
> >>>>>    /**
> >>>>>     * dma_fence_describe - Dump fence describtion into seq_file
> >>>>>     * @fence: the 6fence to describe
> >>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> >>>>> index 775cdc0b4f24..d77f6591c453 100644
> >>>>> --- a/include/linux/dma-fence.h
> >>>>> +++ b/include/linux/dma-fence.h
> >>>>> @@ -99,6 +99,7 @@ enum dma_fence_flag_bits {
> >>>>>        DMA_FENCE_FLAG_SIGNALED_BIT,
> >>>>>        DMA_FENCE_FLAG_TIMESTAMP_BIT,
> >>>>>        DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> >>>>> +    DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> >>>>
> >>>> Would this bit be better left out from core implementation, given ho=
w
> >>>> the approach is the component which implements dma-fence has to trac=
k
> >>>> the actual deadline and all?
> >>>>
> >>>> Also taking a step back - are we all okay with starting to expand th=
e
> >>>> relatively simple core synchronisation primitive with side channel
> >>>> data like this? What would be the criteria for what side channel dat=
a
> >>>> would be acceptable? Taking note the thing lives outside drivers/gpu=
/.
> >>>
> >>> I had similar concerns and it took me a moment as well to understand =
the
> >>> background why this is necessary. I essentially don't see much other
> >>> approach we could do.
> >>>
> >>> Yes, this is GPU/CRTC specific, but we somehow need a common interfac=
e
> >>> for communicating it between drivers and that's the dma_fence object =
as
> >>> far as I can see.
> >>
> >> Yeah I also don't see any other easy options. Just wanted to raise thi=
s
> >> as something which probably needs some wider acks.
> >>
> >> Also what about the "low level" part of my question about the reason, =
or
> >> benefits, of defining the deadline bit in the common layer?
> >
> > We could leave DMA_FENCE_FLAG_HAS_DEADLINE_BIT out, but OTOH managing
> > a bitmask that is partially defined in core enum and partially in
> > backend-driver has it's own drawbacks, and it isn't like we are
> > running out of bits.. :shrug:
>
> There is DMA_FENCE_FLAG_USER_BITS onwards which implementations could
> use to store their stuff?
>
> And if we skip forward to "drm/scheduler: Add fence deadline support"
> that's the only place bit is used, right? Would it simply work to look
> at drm_sched_fence->deadline =3D=3D 0 as bit not set? Or you see a need t=
o
> interoperate with other fence implementations via that bit somehow?

Currently drm/scheduler is the only one using it.  I ended up dropping
use of it in msm since the deadline is stored in the fence-context
instead.  But I think it is better to try to avoid assuming that zero
means not-set.

It could be moved to drm/sched.. I guess there are few enough
implementations at this point to say whether it is something useful to
other drivers or not.

BR,
-R

> Regards,
>
> Tvrtko
