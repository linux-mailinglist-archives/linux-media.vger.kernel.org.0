Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE6DC17A956
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2020 16:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbgCEPya (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Mar 2020 10:54:30 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:44282 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbgCEPya (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Mar 2020 10:54:30 -0500
Received: by mail-ed1-f67.google.com with SMTP id g19so7345320eds.11
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2020 07:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jpgwSkp7XcrOD1X4HMaPrupSeCafE36RfxzoW5P2WRA=;
        b=DiAuYIkHTZXOVb9HWj0I5RfNbwb2gRoDsioZ3DGYGgGwpuHWBI6imJQcLeV/8vMoqx
         vLpKZYWVuc/WzCc5hrpyImzqk89IyeFPjEb+xaiDUdzUc3L+4vP0GxfMfWHAa5225inH
         bhqKp8vTYWxjL8QTRbdt0RawrERVG6l9iq4VKC12IMs05TN+MQMi7cEdi0ZODqu3zAmn
         l87bl6TItmmR7WIHUwFPQog5XZ0yhYkDSymk8Nmfar54q6ikBv7NtkZMuLgKjzmfUNuR
         ciEIB+WF2eGUFEjO13Md4l7m4l+Ku0SUEk5+AiVw2jj5FK33lWzc593ZRpUii2yNSxRP
         8p1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jpgwSkp7XcrOD1X4HMaPrupSeCafE36RfxzoW5P2WRA=;
        b=XbBL8lgxiCZ/5zvG5gkI1mIVRQS+wWXFHdf6hLqj+co5DoOKtpazqz1/FswGLDxGag
         i9PQAdOl6tmHBh2zjN4LwThRrFXfvRFN97larfxnYh88Gd0dkzWYrx92bNSWfzJ/LUhz
         VUK1wL8Or/aukw/5E1+GG8Rdwr+aNH9I1628u6FppgWjuV1+wPtiuHWJrNY9hABQtvMQ
         DO0v1+ck0okOPGdsbTY46Yu13/aSTFSAW/+ePZI/NZk26OD3Avr8cdGKf7Nzkbtag5L2
         HivhKyzqn62Xz7bnaYfsAwQ099raR/lgytcFPm3lI6EYOMXlI35oPvpH6TJ5Bpy8n55A
         z/qg==
X-Gm-Message-State: ANhLgQ1NGwxFbdZUmfnYPoSuSex4SeYRxTYjLl6xLrnHdFVmYiKvjBLi
        SAWvxi+U9ViMe0IcJ8spFhZhDGmpZGyMIn/OA2x8Jg==
X-Google-Smtp-Source: ADFU+vtfOlYmMkcz0GZIDO1iKHc1JvcTJQpELewViffLb0TBaaBXcV3kuWUnf2AGZLPIyKSJzHoRuU3LVrFVwcti4F0=
X-Received: by 2002:a05:6402:1655:: with SMTP id s21mr9282877edx.324.1583423668000;
 Thu, 05 Mar 2020 07:54:28 -0800 (PST)
MIME-Version: 1.0
References: <20200225235856.975366-1-jason@jlekstrand.net> <8066d8b2-dd6a-10ef-a7bb-2c18a0661912@amd.com>
 <20200226100523.GQ2363188@phenom.ffwll.local> <CAOFGe94O66HL212aXqhi9tdYqw---Xm-fwNSV4pxHyPmpSGpbg@mail.gmail.com>
 <CAP+8YyEUz29fXDW5kO_0ZG6c849=TuFWCK8ynT3LuM+Tn+rMzw@mail.gmail.com>
 <810a26e7-4294-a615-b7ee-18148ac70641@amd.com> <CAOFGe96namyeQXTvdrduM+=wkJuoWWx34CxcsJHS3fcCaKDadw@mail.gmail.com>
 <21aeacc0-f3ae-c5dd-66df-4d2f3d73f73e@amd.com> <CAOFGe95Gx=kX=sxwhx1FYmXQuPtGAKwt2V5YodQBwJXujE3WwA@mail.gmail.com>
 <CAOFGe97XSxgzCViOH=2+B2_d5P3vGifKmvAw-JrzRQbbRMRbcg@mail.gmail.com> <6fb8becf-9e6b-f59e-9c22-2b20069241a7@amd.com>
In-Reply-To: <6fb8becf-9e6b-f59e-9c22-2b20069241a7@amd.com>
From:   Jason Ekstrand <jason@jlekstrand.net>
Date:   Thu, 5 Mar 2020 09:54:16 -0600
Message-ID: <CAOFGe94gv9N+6n6oEC2aRtsmy7kBfx1D_R6WLQSGq7-8yUM_OQ@mail.gmail.com>
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

On Thu, Mar 5, 2020 at 7:06 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 04.03.20 um 17:41 schrieb Jason Ekstrand:
> > On Wed, Mar 4, 2020 at 10:27 AM Jason Ekstrand <jason@jlekstrand.net> w=
rote:
> >> On Wed, Mar 4, 2020 at 2:34 AM Christian K=C3=B6nig <christian.koenig@=
amd.com> wrote:
> >>> Am 03.03.20 um 20:10 schrieb Jason Ekstrand:
> >>>> On Thu, Feb 27, 2020 at 2:28 AM Christian K=C3=B6nig
> >>>> <christian.koenig@amd.com> wrote:
> >>>> [SNIP]
> >>> For reference see what dance is necessary in the dma_fence_chain_rele=
ase
> >>> function to avoid that:
> >>>>          /* Manually unlink the chain as much as possible to avoid
> >>>> recursion
> >>>>           * and potential stack overflow.
> >>>>           */
> >>>>          while ((prev =3D rcu_dereference_protected(chain->prev, tru=
e))) {
> >>> ....
> >>>
> >>> It took me quite a while to figure out how to do this without causing
> >>> issues. But I don't see how this would be possible for dma_fence_arra=
y.
> >> Ah, I see the issue now!  It hadn't even occurred to me that userspace
> >> could use this to build up an infinite recursion chain.  That's nasty!
>
> Yeah, when I first stumbled over it it was like why the heck is my code
> crashing in an interrupt handler?
>
> Realizing that this is stack corruption because of the long chain we
> constructed was quite an enlightenment.
>
> And then it took me even longer to fix it :)

Fun....

> >>   I'll give this some more thought and see if can come up with
> >> something clever.
> >>
> >> Here's one thought:  We could make dma_fence_array automatically
> >> collapse any arrays it references and instead directly reference their
> >> fences.  This way, no matter how much the client chains things, they
> >> will never get more than one dma_fence_array.  Of course, the
> >> difficulty here (answering my own question) comes if they ping-pong
> >> back-and-forth between something which constructs a dma_fence_array
> >> and something which constructs a dma_fence_chain to get
> >> array-of-chain-of-array-of-chain-of-...  More thought needed.
>
> Condensing the fences into a larger array can certainly work, yes.
>
> > Answering my own questions again...  I think the
> > array-of-chain-of-array case is also solvable.
> >
> > For array-of-chain, we can simply add all unsignaled dma_fences in the
> > chain to the array.  The array won't signal until all of them have
> > which is exactly the same behavior as if we'd added the chain itself.
>
> Yeah, that should work. Probably best to implement something like a
> cursor to walk all fences in the data structure.
>
> > For chain-of-array, we can add all unsignaled dma_fences in the array
> > to the same point in the chain.  There may be some fiddling with the
> > chain numbering required here but I think we can get it so the chain
> > won't signal until everything in the array has signaled and we get the
> > same behavior as if we'd added the dma_fence_array to the chain.
>
> Well as far as I can see this won't work because it would break the
> semantics of the timeline sync.

I'm not 100% convinced it has to.  We already have support for the
seqno regressing and we ensure that we still wait for all the fences.
I thought maybe we could use that but I haven't spent enough time
looking at the details to be sure.  I may be missing something.

> But I think I know a different way which should work: A dma_fence_chain
> can still contain a dma_fence_array, only the other way around is
> forbidden. Then we create the cursor functionality in such a way that it
> allows us to deep dive into the data structure and return all containing
> fences one by one.

Agreed.  As long as one container is able to consume the other, it's fine.

> I can prototype that if you want, shouldn't be more than a few hours of
> hacking anyway.

If you'd like to, go for it.  I'd be happy to give it a go as well but
if you already know what you want, it may be easier for you to just
write the patch for the cursor.

Two more questions:

 1. Do you want this collapsing to happen every time we create a
dma_fence_array or should it be a special entrypoint?  Collapsing all
the time likely means doing extra array calculations instead of the
dma_fence_array taking ownership of the array that's passed in.  My
gut says that cost is ok; but my gut doesn't spend much time in kernel
space.

 2. When we do the collapsing, should we call dma_fence_is_signaled()
to avoid adding signaled fences to the array?  It seems like avoiding
adding references to fences that are already signaled would let the
kernel clean them up faster and reduce the likelihood that a fence
will hang around forever because it keeps getting added to arrays with
other unsignaled fences.

--Jason
