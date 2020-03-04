Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF804179533
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 17:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388399AbgCDQ2G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 11:28:06 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:36319 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387497AbgCDQ2G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Mar 2020 11:28:06 -0500
Received: by mail-ed1-f67.google.com with SMTP id a13so3027040edh.3
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2020 08:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7TRIY9YZNfQ03l0XAD8uITch5RH+qIr9GBOry06eMOI=;
        b=DyjBlh4x8TGTi0/baq7816HKFpJxdmdh2OzVkAZqLMtGgEWsnnRBjUNDbMhLtTxKrm
         qsWwddd2y1HXIShfDo4TTplQmv/XPR48GHuE0B4EBpMcKo7lBNjPYMetgokwrGCaVzdt
         szyOmrwGOGIpQAcwpTf9aaBVdeIg8ZD3/fh2BXXK9eVrI0jWHP8CNvEZWqcKf1R1BHdc
         cGMCQ+mRhLMKzM9MAZpiI7hKFH77iA9jeVil4vAf4z3GX6urUtr5aev2Si1JICBfTk8O
         /pIvKegc01ZP9YmE7S7jfCoWdt1GNU+8mX8o/CwmR/ga8fbT99pHiso1U+mizqMrJQVQ
         rAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7TRIY9YZNfQ03l0XAD8uITch5RH+qIr9GBOry06eMOI=;
        b=FpT59SKZoUo6NjBO07Y5lFX8a9fQUKyb+YSFjJc1Jh0KItIE4/yeo0t3k5tFhfBB6H
         DKdg2B3ZK4dZ6DILoxyCkb9e+wV6az5KY1hRtP06foCkZ4Bizd29FA9OGPXIsb5XiOug
         bk0hMZAlEr1OTI3AfXgC3EqydoDT8YXXVA1rqDiv0qJAHZrRpNBlfzLsHuaFwPOWluVG
         WAYTVlfPezOt2zBz2ge4aQz1w3pPmjCpVr//LQJ7rB85APuIlVoPnmwManKujWj75aUp
         S2YWxzeAksft0BR0/PJ6XnPdvXFslaHxaiiqZMzX9hxgqbvROVv1MC1Y7tUJDJtJh8ga
         06CA==
X-Gm-Message-State: ANhLgQ1lgkzU6wKqN2nn+cpA1pyUj7qPQfA4Vk7CQ83aEv/LNiNwbGhO
        CcTDIzDGQQt39wBhp1ZXpTH2vhTNUbNXa7VJ3FF2aA==
X-Google-Smtp-Source: ADFU+vsSyopp0FIj9kIHIXWZFM6m95W5fA7PACVmDDg7Apxr6rZ0+SjUG+P1JsIhCXAPTgAxBiN91lx8DJJ0ecG4TlA=
X-Received: by 2002:a17:906:f258:: with SMTP id gy24mr927151ejb.120.1583339283393;
 Wed, 04 Mar 2020 08:28:03 -0800 (PST)
MIME-Version: 1.0
References: <20200225235856.975366-1-jason@jlekstrand.net> <8066d8b2-dd6a-10ef-a7bb-2c18a0661912@amd.com>
 <20200226100523.GQ2363188@phenom.ffwll.local> <CAOFGe94O66HL212aXqhi9tdYqw---Xm-fwNSV4pxHyPmpSGpbg@mail.gmail.com>
 <CAP+8YyEUz29fXDW5kO_0ZG6c849=TuFWCK8ynT3LuM+Tn+rMzw@mail.gmail.com>
 <810a26e7-4294-a615-b7ee-18148ac70641@amd.com> <CAOFGe96namyeQXTvdrduM+=wkJuoWWx34CxcsJHS3fcCaKDadw@mail.gmail.com>
 <21aeacc0-f3ae-c5dd-66df-4d2f3d73f73e@amd.com>
In-Reply-To: <21aeacc0-f3ae-c5dd-66df-4d2f3d73f73e@amd.com>
From:   Jason Ekstrand <jason@jlekstrand.net>
Date:   Wed, 4 Mar 2020 10:27:51 -0600
Message-ID: <CAOFGe95Gx=kX=sxwhx1FYmXQuPtGAKwt2V5YodQBwJXujE3WwA@mail.gmail.com>
Subject: Re: [PATCH] RFC: dma-buf: Add an API for importing and exporting sync files
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        Dave Airlie <airlied@redhat.com>,
        Jesse Hall <jessehall@google.com>,
        James Jones <jajones@nvidia.com>,
        Daniel Stone <daniels@collabora.com>,
        =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Chenbo Feng <fengc@google.com>,
        Greg Hackmann <ghackmann@google.com>,
        linux-media@vger.kernel.org,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 4, 2020 at 2:34 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 03.03.20 um 20:10 schrieb Jason Ekstrand:
> > On Thu, Feb 27, 2020 at 2:28 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> [SNIP]
> >>> However, I'm not sure what the best way is to do garbage collection o=
n
> >>> that so that we don't get an impossibly list of fence arrays.
> >> Exactly yes. That's also the reason why the dma_fence_chain container =
I
> >> came up with for the sync timeline stuff has such a rather sophisticat=
ed
> >> garbage collection.
> >>
> >> When some of the included fences signal you need to free up the
> >> array/chain and make sure that the memory for the container can be reu=
sed.
> > Currently (as of v2), I'm using dma_fence_array and being careful to
> > not bother constructing one if there's only one fence in play.  Is
> > this insufficient?  If so, maybe we should consider improving
> > dma_fence_array.
>
> That still won't work correctly in all cases. See the problem is not
> only optimization, but also avoiding situations where userspace can
> abuse the interface to do nasty things.
>
> For example if userspace just calls that function in a loop you can
> create a long chain of dma_fence_array objects.
>
> If that chain is then suddenly released the recursive dropping of
> references can overwrite the kernel stack.
>
> For reference see what dance is necessary in the dma_fence_chain_release
> function to avoid that:
> >         /* Manually unlink the chain as much as possible to avoid
> > recursion
> >          * and potential stack overflow.
> >          */
> >         while ((prev =3D rcu_dereference_protected(chain->prev, true)))=
 {
> ....
>
> It took me quite a while to figure out how to do this without causing
> issues. But I don't see how this would be possible for dma_fence_array.

Ah, I see the issue now!  It hadn't even occurred to me that userspace
could use this to build up an infinite recursion chain.  That's nasty!
 I'll give this some more thought and see if can come up with
something clever.

Here's one thought:  We could make dma_fence_array automatically
collapse any arrays it references and instead directly reference their
fences.  This way, no matter how much the client chains things, they
will never get more than one dma_fence_array.  Of course, the
difficulty here (answering my own question) comes if they ping-pong
back-and-forth between something which constructs a dma_fence_array
and something which constructs a dma_fence_chain to get
array-of-chain-of-array-of-chain-of-...  More thought needed.

> As far as I can see the only real option to implement this would be to
> change the dma_resv object container so that you can add fences without
> overriding existing ones.
>
> For shared fences that can be done relative easily, but I absolutely
> don't see how to do this for exclusive ones without a larger rework.

Fair enough.  Thanks for taking the time to explain the issue.  I'll
give this some more thought.

--Jason


> >>>    (Note
> >>> the dma_resv has a lock that needs to be taken before adding an
> >>> exclusive fence, might be useful). Some code that does a thing like
> >>> this is __dma_resv_make_exclusive in
> >>> drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> >> Wanted to move that into dma_resv.c for quite a while since there are
> >> quite a few other cases where we need this.
> > I've roughly done that.  The primary difference is that my version
> > takes an optional additional fence to add to the array.  This makes it
> > a bit more complicated but I think I got it mostly right.
> >
> > I've also written userspace code which exercises this and it seems to
> > work.  Hopefully, that will give a better idea of what I'm trying to
> > accomplish.
>
> Yes, that is indeed a really nice to have feature.
>
> Regards,
> Christian.
