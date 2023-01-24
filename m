Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34CA4678FAF
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 06:08:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbjAXFIe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 00:08:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbjAXFIc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 00:08:32 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBAEC3B3FB
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 21:08:08 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-4c131bede4bso202311057b3.5
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 21:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFk9/LshyOazerQVNiA1ja62Zlj7Q7aVCq7uUOqwpN8=;
        b=jWMM2g4EqTlOLHIdIRNr92DUTwy+cxhiq92I36/xLpO2fKDlTQEeawrgNWk1cNglNz
         HaSmx4C64CfW2zynwWotoDfF92hmHlYZ7csRlnQkKEO16w/3/hJt3WMyRiWTzJwvvOgy
         MHwd0TO4pgsGOmAlp+LNdqlaaLbeax3Ey6DCczfnACtBXL5WR6rucDf502jnjFu6T4qf
         UTKIy7j+a7uYpAfJFh3jdutt/zuVun6e4qYT+L9997QhmemYtvbdyyG8cl1jWs5o0iOh
         /6SZcX/YB4ZCdGZIw9kIASt3IePBUvl1ScLvtygWR2PsCRVwf2jh1y236nDIZdEQiumL
         RJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFk9/LshyOazerQVNiA1ja62Zlj7Q7aVCq7uUOqwpN8=;
        b=bnux/QdyOiSr/Pb0ZmePK7mQMd7aRzDxA6XPXFsapW272uffCJPO1//SH44RmCrkCV
         6s/inmOyAg5F/t38Ic80lzTeJPCHDzn9Fuxq3alOxj1dRk3G/zjN1CiL3AxpS7eJ5hal
         p6nQdyzJWcohdkSDLKGDB6xYmKNyFQ9ctxAPEvIVTx8QHjJkVmV62DBAaNY7jP+QqqzG
         WL1H+uzON1Y2nT4u4y2kgtwK2Yon/e/D4Ssd/dU+UDcY3txLQJdtcvkcStlsK6J/zfpY
         cd5qI609dpunx2IRJCm+h8W6HofWapHN1cUogPD/bg72Zllje1fhaoO5eoG+d90FVTao
         f3fw==
X-Gm-Message-State: AFqh2koHjCAKZMiG2F1AvfWbMbWhQ49AkbTaIv7BN8RDRGShehO8IDeL
        yv+M3pS5giETPWUJhBM5tq6MMPiW57Ac9R8jpkmK
X-Google-Smtp-Source: AMrXdXuJplsF/hX9gNzVeObQYMpCkfsRYCF+rGhiiMoM/7wmLL3IjeJ1EgQlsSmxNfFFlrsah0cpLT3QyuPcUSvB5CI=
X-Received: by 2002:a81:9ace:0:b0:4ed:5f50:1a43 with SMTP id
 r197-20020a819ace000000b004ed5f501a43mr3704793ywg.291.1674536885984; Mon, 23
 Jan 2023 21:08:05 -0800 (PST)
MIME-Version: 1.0
References: <20230123123756.401692-1-christian.koenig@amd.com> <Y86R3vQX+vW0+oxw@pendragon.ideasonboard.com>
In-Reply-To: <Y86R3vQX+vW0+oxw@pendragon.ideasonboard.com>
From:   John Stultz <jstultz@google.com>
Date:   Mon, 23 Jan 2023 21:07:54 -0800
Message-ID: <CANDhNCoppG0oXHu-Cc8s1WJNWZTXmV9Z1d+5qrHSEDEGsFf1ag@mail.gmail.com>
Subject: Re: DMA-heap driver hints
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
        tfiga@chromium.org, sebastian.wick@redhat.com, hverkuil@xs4all.nl,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, benjamin.gaignard@collabora.com,
        Brian.Starkey@arm.com, mchehab@kernel.org,
        James Jones <jajones@nvidia.com>,
        "T.J. Mercier" <tjmercier@google.com>
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

On Mon, Jan 23, 2023 at 5:55 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Christian,
>
> CC'ing James as I think this is related to his work on the unix device
> memory allocator ([1]).
>
> [1] https://lore.kernel.org/dri-devel/8b555674-1c5b-c791-4547-2ea7c16aee6=
c@nvidia.com/
>
> On Mon, Jan 23, 2023 at 01:37:54PM +0100, Christian K=C3=B6nig wrote:
> > Hi guys,
> >
> > this is just an RFC! The last time we discussed the DMA-buf coherency
> > problem [1] we concluded that DMA-heap first needs a better way to
> > communicate to userspace which heap to use for a certain device.
> >
> > As far as I know userspace currently just hard codes that information
> > which is certainly not desirable considering that we should have this
> > inside the kernel as well.
> >
> > So what those two patches here do is to first add some
> > dma_heap_create_device_link() and  dma_heap_remove_device_link()
> > function and then demonstrating the functionality with uvcvideo
> > driver.
> >
> > The preferred DMA-heap is represented with a symlink in sysfs between
> > the device and the virtual DMA-heap device node.
>
> I'll start with a few high-level comments/questions:
>
> - Instead of tying drivers to heaps, have you considered a system where
>   a driver would expose constraints, and a heap would then be selected
>   based on those constraints ? A tight coupling between heaps and
>   drivers means downstream patches to drivers in order to use
>   vendor-specific heaps, that sounds painful.

Though, maybe it should be in that case. More motivation to get your
heap (and its users) upstream. :)


>   A constraint-based system would also, I think, be easier to extend
>   with additional constraints in the future.

I think the issue of enumerating and exposing constraints to userland
is just really tough.  While on any one system there is a fixed number
of constraints, it's not clear we could come up with a bounded set for
all systems.
To avoid this back in the ION days I had proposed an idea of userland
having devices share an opaque constraint cookie, which userland could
mask together between devices and then find a heap that matches the
combined cookie, which would avoid exposing specific constraints to
userland, but the processes of using it seemed like such a mess to
explain.

So I think this driver driven links approach is pretty reasonable. I
do worry we might get situations where the drivers ability to use a
heap depends on some other factor (dts iommu setup maybe?), which the
driver might not know on its own, but I think having the driver
special-case that to resolve it would be doable.


> - I assume some drivers will be able to support multiple heaps. How do
>   you envision this being implemented ?

Yeah. I also agree we need to have multiple heap links.

> - Devices could have different constraints based on particular
>   configurations. For instance, a device may require specific memory
>   layout for multi-planar YUV formats only (as in allocating the Y and C
>   planes of NV12 from different memory banks). A dynamic API may thus be
>   needed (but may also be very painful to use from userspace).

Yeah. While I know folks really don't like the static userspace config
model that Android uses, I do fret that once we get past what a
workable heap is, it still won't address what the ideal heap is.

For instance, we might find that the system heap works for a given
pipeline, but because the cpu doesn't use the buffer in one case, the
system-uncached heap is really the best choice for performance. But in
another pipeline with the same devices, if the cpu is reading and
writing the buffer quite a bit, one would want the standard system
heap.

Because userland is the only one who can know the path a buffer will
take, userland is really the best place to choose the ideal allocation
type.

So while I don't object to this link based approach just to allow a
generic userland to find a working buffer type for a given set of
devices, I don't think it will be able to replace having device
specific userland policy (like gralloc), though it's my personal hope
the policy can be formalized to a config file rather then having
device specific binaries.

thanks
-john
