Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46A2C58CC1C
	for <lists+linux-media@lfdr.de>; Mon,  8 Aug 2022 18:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244008AbiHHQ32 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Aug 2022 12:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243519AbiHHQ31 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Aug 2022 12:29:27 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A7026E8
        for <linux-media@vger.kernel.org>; Mon,  8 Aug 2022 09:29:26 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 123so14459055ybv.7
        for <linux-media@vger.kernel.org>; Mon, 08 Aug 2022 09:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Y2IMNWPIjkzwaAM4UvkDC79np/PUW3X2sEbAT/ct8M4=;
        b=LxmDtRGZHfImjROQcKCDQgGiXe9nnrACKjUj1qQ1Oo5w8W1sVppkiIaStTZalM3DXn
         d4fg1VCCvKly9zyZDlAlOBTDConQkbR6pYotSN97XAEEa3G6Ci/dkjE2SlkeewTK2qS/
         +LZD9TM6jhdfJet5x28hBgUlGGgDvlR0Axijg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Y2IMNWPIjkzwaAM4UvkDC79np/PUW3X2sEbAT/ct8M4=;
        b=NGv94Y+axopu1g4F9WkkbOo/8UxMPYAWQwe3rwXeRXeIq5ufZJod2QLv3Lxmny2K7R
         i5gPMXM4GUDPvAKSgrbAbNwJXJQqbbpJgSbazvgH5jXxtGWgQecwc/Y9S4c7gSTZRhjC
         MH2rJksqI5AtUE+VOmytEpQ3n4IBDyTb30BSLShkTh8XblzLMVp/f0aqO+RMMS4XUQ0/
         NNiC59V9G0wMtmNiea2F6GAnQ5YF/rfQq4m/h3N1+Jqgdm8UlYJXMtsp/dwhM+94owqE
         20UHSJigm3YzH/zETdGQ0jQye6DTDcw8AvX5yFacFPNSo3rZoZAOui7xZqe73J7MmgLC
         oNTg==
X-Gm-Message-State: ACgBeo2bniVAsC3VvcCJbsvD9KLg1fNv0/i4A9YR0iwpewFPtUTdU8Fk
        /Nzgw9Y2KGMSr1Oyh63edVMOiPfZf8ApNDOeAi3iXw==
X-Google-Smtp-Source: AA6agR6kDyxRT7WvypBMOU0kjVKYcER2bG2K/ZyDSG0YHpOdaiMnykM2TuLH0P9zUQOyjlN1ElXY6sY14LDXcz0HYCw=
X-Received: by 2002:a25:b68b:0:b0:673:df99:5838 with SMTP id
 s11-20020a25b68b000000b00673df995838mr17329517ybj.157.1659976165690; Mon, 08
 Aug 2022 09:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220729170744.1301044-1-robdclark@gmail.com> <20220729170744.1301044-2-robdclark@gmail.com>
 <3d2083aa-fc6c-6875-3daf-e5abe45fb762@gmail.com> <CAF6AEGvKdM3vyCvBZK=ZcdGmak7tsrP1b8ANyyaMjVfNDViqyw@mail.gmail.com>
 <973de2f8-75e4-d4c7-a13a-c541a6cf7c77@amd.com> <CAF6AEGuhQT6A_jh8kLWh5xMoUGc1osdewyBk-8NoprtWOHseaQ@mail.gmail.com>
 <2fc74efe-220f-b57a-e804-7d2b3880d14f@gmail.com> <CAF6AEGv9H+fSFKPNqwPxYUjkgj05AimpXbp-p_JL8nKLnzON=w@mail.gmail.com>
 <e2423bd7-ef73-8d43-c661-a19c80ad1a26@gmail.com> <CAF6AEGsoYaXe2+qug_TfT99KXuXh9Ez2L2HjQZroE6c6GSW4SQ@mail.gmail.com>
 <e90caaaa-cae9-c6d1-bfb6-dc56aa559681@amd.com> <CAF6AEGtWjtF7_uCYAH4uARVXgnOnX3DZ3KQahxTdAi_9Myvw0w@mail.gmail.com>
 <4e7448d2-7b26-e260-3d6c-7aa263a75250@amd.com>
In-Reply-To: <4e7448d2-7b26-e260-3d6c-7aa263a75250@amd.com>
From:   Rob Clark <robdclark@chromium.org>
Date:   Mon, 8 Aug 2022 09:29:52 -0700
Message-ID: <CAJs_Fx7vf7RyGqBrQHySyG4zr31O_j8GyQeWTCjxZ3R2VDnE9Q@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/3] dma-buf: Add ioctl to query mmap info
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 8, 2022 at 7:56 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 08.08.22 um 15:26 schrieb Rob Clark:
> > On Mon, Aug 8, 2022 at 4:22 AM Christian K=C3=B6nig <christian.koenig@a=
md.com> wrote:
> >
> > [SNIP]
> >>>> If the virtio/virtgpu UAPI was build around the idea that this is
> >>>> possible then it is most likely fundamental broken.
> >>> How else can you envision mmap'ing to guest userspace working?
> >> Well long story short: You can't.
> >>
> >> See userspace mappings are not persistent, but rather faulted in on
> >> demand. The exporter is responsible for setting those up to be able to
> >> add reverse tracking and so can invalidate those mappings when the
> >> backing store changes.
> > I think that is not actually a problem.  At least for how it works on
> > arm64 but I'm almost positive x86 is similar.. I'm not sure how else
> > you could virtualize mmu/iommu/etc in a way that didn't have horrible
> > performance.
> >
> > There are two levels of pagetable translation, the first controlled by
> > the host kernel, the second by the guest.  From the PoV of host
> > kernel, it is just memory mapped to userspace, getting faulted in on
> > demand, just as normal.  First the guest controlled translation
> > triggers a fault in the guest which sets up guest mapping.  And then
> > the second level of translation to translate from what guest sees as
> > PA (but host sees as VA) to actual PA triggers a fault in the host.
>
> Ok, that's calming.
>
> At least that's not the approach talked about the last time this came up
> and it doesn't rip a massive security hole somewhere.

Hmm, tbh I'm not sure which thread/discussion this was.. it could have
been before I was paying much attention to the vm use-case

> The question is why is the guest then not using the caching attributes
> setup by the host page tables when the translation is forwarded anyway?

The guest kernel itself doesn't know.  AFAICT, at least on arm, the hw
will combine the attributes of the mapping in S1 and S2 pagetables and
use the most restrictive.  So if S1 (host) is cached but S2 (guest) is
WC, you'll end up w/ WC.

That said, at least on aarch64, it seems like we could always tell the
guest it is cached, and if mapped WC in S1 you'll end up with WC
access.  But this seems to depend on an optional feature, FWB, which
allows S2 to override S1 attributes, not being enabled.  And not
entirely sure how it works on x86.

BR,
-R

> > [SNIP]
> > This is basically what happens, although via the two levels of pgtable
> > translation.  This patch provides the missing piece, the caching
> > attributes.
>
> Yeah, but that won't work like this. See the backing store migrates all
> the time and when it is backed by PCIe/VRAM/local memory you need to use
> write combine while system memory is usually cached.
>
> >>       Because otherwise you can't accommodate that the exporter is
> >> changing those caching attributes.
> > Changing the attributes dynamically isn't going to work.. or at least
> > not easily.  If you had some sort of synchronous notification to host
> > userspace, it could trigger an irq to the guest, I suppose.  But it
> > would mean host kernel has to block waiting for host userspace to
> > interrupt the guest, then wait for guest vgpu process to be scheduled
> > and handle the irq.
>
> We basically change that on every page flip on APUs and that doesn't
> sound like something fast.
>
> Thanks for the explanation how this works,
> Christian.
>
> >
> > At least in the case of msm, the cache attributes are static for the
> > life of the buffer, so this scenario isn't a problem.  AFAICT this
> > should work fine for at least all UMA hw.. I'm a bit less sure when it
> > comes to TTM, but shouldn't you at least be able to use worst-cache
> > cache attributes for buffers that are allowed to be mapped to guest?
> >
> > BR,
> > -R
> >
> >>> But more seriously, let's take a step back here.. what scenarios are
> >>> you seeing this being problematic for?  Then we can see how to come u=
p
> >>> with solutions.  The current situation of host userspace VMM just
> >>> guessing isn't great.
> >> Well "isn't great" is a complete understatement. When KVM/virtio/virtg=
pu
> >> is doing what I guess they are doing here then that is a really major
> >> security hole.
> >>
> >>>     And sticking our heads in the sand and
> >>> pretending VMs don't exist isn't great.  So what can we do?  I can
> >>> instead add a msm ioctl to return this info and solve the problem eve=
n
> >>> more narrowly for a single platform.  But then the problem still
> >>> remains on other platforms.
> >> Well once more: This is *not* MSM specific, you just absolutely *can't
> >> do that* for any driver!
> >>
> >> I'm just really wondering what the heck is going on here, because all =
of
> >> this was discussed in lengthy before on the mailing list and very
> >> bluntly rejected.
> >>
> >> Either I'm missing something (that's certainly possible) or we have a
> >> strong case of somebody implementing something without thinking about
> >> all the consequences.
> >>
> >> Regards,
> >> Christian.
> >>
> >>
> >>> Slightly implicit in this is that mapping dma-bufs to the guest won't
> >>> work for anything that requires DMA_BUF_IOCTL_SYNC for coherency.. we
> >>> could add a possible return value for DMA_BUF_INFO_VM_PROT indicating
> >>> that the buffer does not support mapping to guest or CPU access
> >>> without DMA_BUF_IOCTL_SYNC.  Then at least the VMM can fail gracefull=
y
> >>> instead of subtly.
> >>>
> >>> BR,
> >>> -R
>
