Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 550002199FA
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 09:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbgGIHcy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jul 2020 03:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbgGIHcx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jul 2020 03:32:53 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D74C061A0B
        for <linux-media@vger.kernel.org>; Thu,  9 Jul 2020 00:32:53 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z13so1221997wrw.5
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2020 00:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Jud8gvQk5riwJAQJGuwXf/WPCVvJ3Rgrb7LcC+OGLek=;
        b=zLm4SSk5z97AJg6wYQWGtiXRJWSitYdo31xqKn0gBxQYkDc/O8TNqgmdajvWHTc0Kq
         rGwaApXSclxBjqko2/Imk9PsR/5u4P/dFPZ9vnPTcqas0kKsEXgqhgF3t0RafiX5Slpt
         JeQpVI0kr0Ku8fqaHq0LjC1TI8jp96YL96hlw5mEdqcM3BGaUheuStZw9Zp7Ip4b+qMo
         G8ZaPEuNqWQyW5xojChELdclmASsdPKtzfHhPpgkGLUC1m/SFhDwvbCu0ULyt2e6O4l4
         gmydb794XLx3M6/yeu4lieZBx/uX1mX0dOMcySh4xW9eVoMMSL0MVJyZib2fBoxie8xs
         axQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Jud8gvQk5riwJAQJGuwXf/WPCVvJ3Rgrb7LcC+OGLek=;
        b=i0leFIShOwcIXdCm2oMwDaQY95AgUrPOdojxgPt5bUAHifB51BckYqcZA2V6KDfpg2
         S/0E0/Mymv8exQJhGrRgwAB/qXZQolfW7JoRDHZ9aQPI5hI12MfdxLbJbYd5H8V/uanN
         iiOaCIv5fW7BdrrARU3Gsu2TpGxpnaSigOZWp4+nyT087fqf/8koz0qJNgUDx6ao0a5P
         bLFWBIgTadxB4GJ8eKxXwxA/MASthullhHQCvm/aw/QkIkahdouqRBRpGSmRjj++8tmW
         ptEsw2Tu9wgDQ5bll/sHWOjF2fe3v4NzoAtqHVnXCnImeNLrJtBQ5e/Hmsi2kAPMNV3Q
         KZnw==
X-Gm-Message-State: AOAM530jRzoCjWHzHo4i3Zro5DNNkOHGMPMLrC23CegacuIT63REJdXX
        F81JYLUFiZ9vqc4rYyOcSBs21aRVDg7lmaBcWYZWVA==
X-Google-Smtp-Source: ABdhPJwgsWk0Cll+yWUxQEOGAdwXBKFxNE0yBvBai49LXxv7MVRksA8PL+EvQ8au/BG5aRKV6xpbDv9YTf7SNQSV164=
X-Received: by 2002:a5d:66ca:: with SMTP id k10mr50931091wrw.244.1594279971984;
 Thu, 09 Jul 2020 00:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-2-daniel.vetter@ffwll.ch> <20c0a95b-8367-4f26-d058-1cb265255283@amd.com>
 <CAKMK7uFe7Pz4=UUkkunBms8vUrzwEpWJmScOMLO4KdADM43vnw@mail.gmail.com>
In-Reply-To: <CAKMK7uFe7Pz4=UUkkunBms8vUrzwEpWJmScOMLO4KdADM43vnw@mail.gmail.com>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Thu, 9 Jul 2020 08:32:41 +0100
Message-ID: <CAPj87rNXneE+Vry4aSV11=Qv2mbUsFjCLmNzRmx-Oeqj=u9dyw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 01/25] dma-fence: basic lockdep annotations
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed, 8 Jul 2020 at 16:13, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Wed, Jul 8, 2020 at 4:57 PM Christian K=C3=B6nig <christian.koenig@amd=
.com> wrote:
> > Could we merge this controlled by a separate config option?
> >
> > This way we could have the checks upstream without having to fix all th=
e
> > stuff before we do this?
>
> Since it's fully opt-in annotations nothing blows up if we don't merge
> any annotations. So we could start merging the first 3 patches. After
> that the fun starts ...
>
> My rough idea was that first I'd try to tackle display, thus far
> there's 2 actual issues in drivers:
> - amdgpu has some dma_resv_lock in commit_tail, plus a kmalloc. I
> think those should be fairly easy to fix (I'd try a stab at them even)
> - vmwgfx has a full on locking inversion with dma_resv_lock in
> commit_tail, and that one is functional. Not just reading something
> which we can safely assume to be invariant anyway (like the tmz flag
> for amdgpu, or whatever it was).
>
> I've done a pile more annotations patches for other atomic drivers
> now, so hopefully that flushes out any remaining offenders here. Since
> some of the annotations are in helper code worst case we might need a
> dev->mode_config.broken_atomic_commit flag to disable them. At least
> for now I have 0 plans to merge any of these while there's known
> unsolved issues. Maybe if some drivers take forever to get fixed we
> can then apply some duct-tape for the atomic helper annotation patch.
> Instead of a flag we can also copypasta the atomic_commit_tail hook,
> leaving the annotations out and adding a huge warning about that.

How about an opt-in drm_driver DRIVER_DEADLOCK_HAPPY flag? At first
this could just disable the annotations and nothing else, but as we
see the annotations gaining real-world testing and maturity, we could
eventually make it taint the kernel.

Cheers,
Daniel
