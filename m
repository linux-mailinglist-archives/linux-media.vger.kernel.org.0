Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33A0630E39F
	for <lists+linux-media@lfdr.de>; Wed,  3 Feb 2021 20:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbhBCTyd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Feb 2021 14:54:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbhBCTyc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Feb 2021 14:54:32 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95EDAC0613D6
        for <linux-media@vger.kernel.org>; Wed,  3 Feb 2021 11:53:51 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id m2so934972wmm.1
        for <linux-media@vger.kernel.org>; Wed, 03 Feb 2021 11:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yeYVRDirmQQ5wl5j/KtVwzs1oXNB1UpSXJMPqylroD8=;
        b=PrG7fsvod/NdW0x6EITygzcKs0maUOZab7byusEFWwMulxeL9s4s45eFmyLgbahgZK
         L8MQvn//WnpvVobRbcm1gY5btgOSiWMwe+YvJBv/jkZMmI7NmoJKXj1Svk9y8N082iX9
         qmAAE/VJmbAkgGci5vuK3MazRNomaM2AwQgFjf38G+kIvYVksJ5TLCQDxhwY40obK+5c
         AN+mVmCvgBV5oaV7ql4n8iMPiKphRmRpt9VDn1EEpw74FRxmLNZ8ecxEiyTvJsPSvrkR
         jGVPqUPY+39WNA7bC4kzm3fo65JAgxZPJqi8Q6g9BniWJtMWBTdOTcZoDibsW94F5ySd
         HJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yeYVRDirmQQ5wl5j/KtVwzs1oXNB1UpSXJMPqylroD8=;
        b=N3+c2lG07Df6KoILgz+yllZ0oaxPvu7giRKDH3wDNPNPayVIkH0B7IVTlWT4O7iUgR
         m+z1VuPTycpzlWf53tofrovFuKBSzmJJhFY+pJXi00uvEig0zDaaXrc5/A+NRaqVzBB/
         YI6gkR4FJVmHH96FccYRHfKw3nHWYVonSuKtb4yEz3iwpzxvr8TCX8cbW6qykYicI5+m
         xgZ9Bz3Ba3rsIT4egmO7I6H4IkF4nlRpTyXAKcY40Ao7QpPy1OU1qJNF9lrcEU5vBc9k
         yRH//9/2zaxSGXdhRhhV59lyKqL3YpKf8u2BO1ttUGwYQlC7DhbYFFlLMp7b5SoOU6no
         Fi8g==
X-Gm-Message-State: AOAM531eqH73Xfd6k3ww8Hkf4DsaB4mUa46lwbYdv1ELf7pOygs28ngU
        pJKkvQMgOoPEXoTM5AFFXqDgay8NI1e/ytGaHEjFAw==
X-Google-Smtp-Source: ABdhPJwHAkjE7WwvDKsGEeDVaItvRVpZmXyiUkxEOFNWYdPypIMM2i5ivMMV3z16KeF/g3UAP5Kq9CLgXvL+gCzihgQ=
X-Received: by 2002:a05:600c:4f93:: with SMTP id n19mr4218419wmq.163.1612382029968;
 Wed, 03 Feb 2021 11:53:49 -0800 (PST)
MIME-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com> <20210203003134.2422308-2-surenb@google.com>
 <YBn+yWIE9eXbgQ2K@google.com> <CAJuCfpHCCD6ruxQAZP8pTZxz44F7pDKY59QznxFv0nQ+-9VaQA@mail.gmail.com>
 <1ea3d79a-2413-bba5-147e-e24df3f91ce0@amd.com>
In-Reply-To: <1ea3d79a-2413-bba5-147e-e24df3f91ce0@amd.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Wed, 3 Feb 2021 11:53:38 -0800
Message-ID: <CAJuCfpFxZPgBefgKdToiBPzeNtW9_pwZi=7JKUq01PK9xnW_zg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Map system heap pages as managed
 by linux vm
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Minchan Kim <minchan@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        James Jones <jajones@nvidia.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sandeep Patil <sspatil@google.com>,
        linux-media <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 3, 2021 at 12:06 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 03.02.21 um 03:02 schrieb Suren Baghdasaryan:
> > On Tue, Feb 2, 2021 at 5:39 PM Minchan Kim <minchan@kernel.org> wrote:
> >> On Tue, Feb 02, 2021 at 04:31:34PM -0800, Suren Baghdasaryan wrote:
> >>> Currently system heap maps its buffers with VM_PFNMAP flag using
> >>> remap_pfn_range. This results in such buffers not being accounted
> >>> for in PSS calculations because vm treats this memory as having no
> >>> page structs. Without page structs there are no counters representing
> >>> how many processes are mapping a page and therefore PSS calculation
> >>> is impossible.
> >>> Historically, ION driver used to map its buffers as VM_PFNMAP areas
> >>> due to memory carveouts that did not have page structs [1]. That
> >>> is not the case anymore and it seems there was desire to move away
> >>> from remap_pfn_range [2].
> >>> Dmabuf system heap design inherits this ION behavior and maps its
> >>> pages using remap_pfn_range even though allocated pages are backed
> >>> by page structs.
> >>> Replace remap_pfn_range with vm_insert_page, following Laura's sugges=
tion
> >>> in [1]. This would allow correct PSS calculation for dmabufs.
> >>>
> >>> [1] https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fdriverdev-devel.linuxdriverproject.narkive.com%2Fv0fJGpaD%2Fusing-ion-me=
mory-for-direct-io&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Cb4c145=
b86dd0472c943c08d8c7e7ba4b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637=
479145389160353%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DW1N%2B%2BlcFDaRSvXdSPe5h=
PNMRByHfGkU7Uc3cmM3FCTU%3D&amp;reserved=3D0
> >>> [2] https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%=
2Fdriverdev.linuxdriverproject.org%2Fpipermail%2Fdriverdev-devel%2F2018-Oct=
ober%2F127519.html&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Cb4c145=
b86dd0472c943c08d8c7e7ba4b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637=
479145389160353%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DjQxSzKEr52lUcAIx%2FuBHMJ=
7yOgof%2FVMlW9%2BB2f%2FoS%2FE%3D&amp;reserved=3D0
> >>> (sorry, could not find lore links for these discussions)
> >>>
> >>> Suggested-by: Laura Abbott <labbott@kernel.org>
> >>> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >> Reviewed-by: Minchan Kim <minchan@kernel.org>
> >>
> >> A note: This patch makes dmabuf system heap accounted as PSS so
> >> if someone has relies on the size, they will see the bloat.
> >> IIRC, there was some debate whether PSS accounting for their
> >> buffer is correct or not. If it'd be a problem, we need to
> >> discuss how to solve it(maybe, vma->vm_flags and reintroduce
> >> remap_pfn_range for them to be respected).
> > I did not see debates about not including *mapped* dmabufs into PSS
> > calculation. I remember people were discussing how to account dmabufs
> > referred only by the FD but that is a different discussion. If the
> > buffer is mapped into the address space of a process then IMHO
> > including it into PSS of that process is not controversial.
>
> Well, I think it is. And to be honest this doesn't looks like a good
> idea to me since it will eventually lead to double accounting of system
> heap DMA-bufs.

Thanks for the comment! Could you please expand on this double
accounting issue? Do you mean userspace could double account dmabufs
because it expects dmabufs not to be part of PSS or is there some
in-kernel accounting mechanism that would be broken by this?

>
> As discussed multiple times it is illegal to use the struct page of a
> DMA-buf. This case here is a bit special since it is the owner of the
> pages which does that, but I'm not sure if this won't cause problems
> elsewhere as well.

I would be happy to keep things as they are but calculating dmabuf
contribution to PSS without struct pages is extremely inefficient and
becomes a real pain when we consider the possibilities of partial
mappings, when not the entire dmabuf is being mapped.
Calculating this would require parsing /proc/pid/maps for the process,
finding dmabuf mappings and the size for each one, then parsing
/proc/pid/maps for ALL processes in the system to see if the same
dmabufs are used by other processes and only then calculating the PSS.
I hope that explains the desire to use already existing struct pages
to obtain PSS in a much more efficient way.

>
> A more appropriate solution would be to held processes accountable for
> resources they have allocated through device drivers.

Are you suggesting some new kernel mechanism to account resources
allocated by a process via a driver? If so, any details?

>
> Regards,
> Christian.
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>
