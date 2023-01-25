Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D15DA67BA06
	for <lists+linux-media@lfdr.de>; Wed, 25 Jan 2023 19:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235506AbjAYS7l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Jan 2023 13:59:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235065AbjAYS7l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Jan 2023 13:59:41 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE893D09C
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 10:59:37 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-4c24993965eso277193247b3.12
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 10:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLlms4Kx5vtQ9Fqt9wbpRXCgK+qb1Gc1PtzXNbXDWiQ=;
        b=oW141OhoLlhkN7P7P4m5FqxC/TEGDkgb/Ockie9M23a7TTIJgZvvdwy2Ca3/5yv0lq
         837pBESR0EJqT13sZWZr8pm0CaIIaWs3S/lqr4cMavpJEGm9XsQHi2XHfxN+MGX+UjV7
         YyLpw/2izmO88NzweP6HvSZz0mAh+wx/Jmc6BJKzvS2U8TPusH4yKNAvPGYLiGTrKR+I
         5o5LI1Lw65sklcBme440kz4uCTg8XYjKZAdBymMw3WaZE+TtnJdwbGv0c0vUbNQtXADp
         uTs65B/8qsRuqv+nKRcUfVkfO4HG0LVDSKTkM4uThP+XmDStcffdEO1KqpXSMYoKtAHX
         XItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLlms4Kx5vtQ9Fqt9wbpRXCgK+qb1Gc1PtzXNbXDWiQ=;
        b=uA+9SIZ5smI6QRtnMz3XPZXXBFqUgteYjJLHfgfnQbnmBCiQ813+Tr5T8bvi2wSI8e
         Zoq/LiIcxMblrrIaK/ZfsufXYxLPYghui0zRyAhLclE8RxieppJZFf6/mVXcWD1bjYTN
         zS6ECtiZCfCQSnMe0rEQz06+dR1heYGvXb40aGZLAzMnldfuftY+WCwvAsbuzSkTDd+z
         +XvVY80bt/gA+C5WodAv0vV9xeJVM0CnYaXbuevveMqykjDNNPDBLJ19njMBNuXLZLzZ
         UCJ6z/nrCmAYfZhElRmr/E0rBR9FoW/YnBFA7p+q27KhtMmp/X2yH/DiPWnVYEJog+2f
         dDeQ==
X-Gm-Message-State: AFqh2kow8Gv5lGS+43KVPim+0+D9D4cW6vhroctxgrVxaWGGCxmzaoXk
        AYUkyM49Ao6Azq5jTW8QNANxenRgs1B2rDEpyguV
X-Google-Smtp-Source: AMrXdXuiYoFGbypVm5Yp+UoATXO7zfbhtqwEeCvO/6KX5uo/itZBEBOcQqjtb/5xvWU2ArNv/Sz81iQlWcbFUcxO5lg=
X-Received: by 2002:a0d:dd06:0:b0:4ff:774b:80dd with SMTP id
 g6-20020a0ddd06000000b004ff774b80ddmr2049749ywe.14.1674673176939; Wed, 25 Jan
 2023 10:59:36 -0800 (PST)
MIME-Version: 1.0
References: <20230123123756.401692-1-christian.koenig@amd.com>
 <Y86R3vQX+vW0+oxw@pendragon.ideasonboard.com> <1f4a1a5c-e0d5-7f0e-353c-daa89f1369ea@amd.com>
 <CANDhNCoVkq4pQJvtgmvJJe=68ZoQOdjYFkbGG-PXVujX1py4aw@mail.gmail.com> <33f87d88-b05d-e524-54fb-d5fd2f676217@amd.com>
In-Reply-To: <33f87d88-b05d-e524-54fb-d5fd2f676217@amd.com>
From:   John Stultz <jstultz@google.com>
Date:   Wed, 25 Jan 2023 10:59:25 -0800
Message-ID: <CANDhNCqiP1cF2j-A_brM5kSh7je6r3MK5534YaHBYkVsNjLtWQ@mail.gmail.com>
Subject: Re: DMA-heap driver hints
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
        tfiga@chromium.org, sebastian.wick@redhat.com, hverkuil@xs4all.nl,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, benjamin.gaignard@collabora.com,
        lmark@codeaurora.org, labbott@redhat.com, Brian.Starkey@arm.com,
        mchehab@kernel.org, James Jones <jajones@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sorry for the delay, this was almost ready to send, but then got
forgotten in my drafts folder.

On Mon, Jan 23, 2023 at 11:15 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> Am 24.01.23 um 06:19 schrieb John Stultz:
> > On Mon, Jan 23, 2023 at 8:29 AM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 23.01.23 um 14:55 schrieb Laurent Pinchart:
> >>> - I assume some drivers will be able to support multiple heaps. How d=
o
> >>>     you envision this being implemented ?
> >> I don't really see an use case for this.
> >>
> >> We do have some drivers which say: for this use case you can use
> >> whatever you want, but for that use case you need to use specific memo=
ry
> >> (scan out on GPUs for example works like this).
> >>
> > [snipping the constraints argument, which I agree with]
> >> What we do have is compatibility between heaps. E.g. a CMA heap is
> >> usually compatible with the system heap or might even be a subset of
> >> another CMA heap. But I wanted to add that as next step to the heaps
> >> framework itself.
> > So the difficult question is how is userland supposed to know which
> > heap is compatible with which?
>
> The heaps should know which other heap they are compatible with.
>
> E.g. the CMA heap should have a link to the system heap because it can
> handle all system memory allocations as well.
>
> If we have a specialized CMA heap (for example for 32bit DMA) it should
> have a link to the general CMA heap.

This is an interesting idea, but it seems to assume a linear or at
least converging "compatibility" order, which I don't think is always
the case.
(For instance, there may be secure heaps which a small set of devices
have access to, but supporting secure memory doesn't imply system
memory for all devices or vice versa).

So I really think being able to express support for multiple heaps
would be important to resolve the majority of these edge cases.

Also to have a single link ordering, it means the constraints have to
go from the heap that satisfies more constraints to the heap that
satisfies less (which is sort of reverse of how I'd think of
compatibility). Which makes the solving logic for userland doable, but
somewhat complex/non-intuitive (as you're searching for the most
"satisfying" heap from the set which will be one of the starting
points).

Whereas finding the intersection of lists seems a bit more straightforward.


> > If you have two devices, one that points to heap "foo" and the other
> > points to heap "bar", how does userland know that "foo" satisfies the
> > constraints of "bar" but "bar" doesn't satisfy the constraints of
> > "foo".
> > (foo =3D"cma",  bar=3D"system")
> >
> > I think it would be much better for device 1 to list "foo" and device
> > 2 to list "foo" and "bar", so you can find that "foo" is the common
> > heap which will solve both devices' needs.
>
> I think that this would be a rather bad idea because then all devices
> need to know about all the possible different heaps they are compatible
> with.

I agree it is somewhat burdensome, but I suspect we'd eventually want
registration helpers to abstract out some of the relationships you
mention above (ie: system supporting devices will accept CMA buffers,
dma32 buffers, etc). But at least that logic would be in-kernel and
not exposed to userland.

> >>> - Devices could have different constraints based on particular
> >>>     configurations. For instance, a device may require specific memor=
y
> >>>     layout for multi-planar YUV formats only (as in allocating the Y =
and C
> >>>     planes of NV12 from different memory banks). A dynamic API may th=
us be
> >>>     needed (but may also be very painful to use from userspace).
> >> Uff, good to know. But I'm not sure how to expose stuff like that.
> > Yeah. These edge cases are really hard to solve generically.  And
> > single devices that have separate constraints for different uses are
> > also not going to be solvable with a simple linking approach.
> >
> > But I do wonder if a generic solution to all cases is needed
> > (especially if it really isn't possible)? If we leave the option for
> > gralloc like omniscient device-specific userland policy, those edge
> > cases can be handled by those devices that can't run generic logic.
> > And those devices just won't be able to be supported by generic
> > distros, hopefully motivating future designs to have less odd
> > constraints?
>
> Potentially yes, but I think that anything more complex than "please
> allocate from this piece of memory for me" is not something which should
> be handled inside the device independent framework.
>
> Especially device specific memory and allocation constrains (e.g. things
> like don't put those two things on the same memory channel) is *not*
> something we should have in an inter device framework.
>
> In those cases we should just be able to say that an allocation should
> be made from a specific device and then let the device specific drivers
> deal with the constrain.

Yeah. I don't think we can get away from needing omniscient userland,
but hopefully we can solve a large chunk of the issue with something
like your approach.

thanks
-john
