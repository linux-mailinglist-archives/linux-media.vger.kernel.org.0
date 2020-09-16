Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFC7826C670
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 19:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgIPRtu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 13:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727520AbgIPRss (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 13:48:48 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC693C0A888B
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2020 05:42:04 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id t76so7911540oif.7
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2020 05:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=czd653EAQqRd9y6KWSclqvh0oWs0wM7+eL3iGSU/nsI=;
        b=Lu3BjPbRiC/AX011FfwezqvylAv3ZKt1PhgO2s9ivkaAdFT+L+aU0tlTbH9aGB3QdD
         ZRH99A3CPlO3UqmOgNoRm+sYa3H4f9liy9wkSbTEbzeH6grEkhQUdoV/KEkl0b+7g6Fl
         aZYv0CeL8ooRR1NM3VZWi8l0zPzoTUe7oUQL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=czd653EAQqRd9y6KWSclqvh0oWs0wM7+eL3iGSU/nsI=;
        b=dju0ngfSDISgzCIWoKDWW9g9ZDd+5F6kimhFAAUKeenaJ8X6IDFLGj2yi33Hq7/Uxp
         LkbOVKMFOEna3PRuHSsUF52NCYCcI4u/2vKrthQqdS42cxkPAJpsJZtqehhVFLhJFzaH
         9xUtBPPeKJ5DSpQIxsvmBzzbr71Qxrfo7D6aJ06qPzIKUrYoJPtHb1JC7kRVbO5zT+l+
         S2Ff/96G9aGIN0kvSe0L68o8zKnOuJCYrl3rdOVbaSfuw2VJMn7oDYQZoq85TGh9+czp
         OXNzSPctLrCtxQFQGsepgM3XeSuRUBdIA2qvIx8tqgwdGRsj2q7oTciWPZ3UTkEk6oNx
         5GIw==
X-Gm-Message-State: AOAM532r6CfYy5vJqDM8i/0lgbbnf1KqpxsQCZ8M5CtGubjJ1YXdUD7C
        ywZAiILTmkczNUEMUfZZF0zqdkeBUJMRbK6o9WZ2ILloL79iAQ==
X-Google-Smtp-Source: ABdhPJwB+2iScSnSRjswx0wBN3crEjmROMPJs/KcyWAFLMOIPP9Nlf6b8MzVFM61WOlkTuWWi8Wacl+i3PJJq3k7BoM=
X-Received: by 2002:aca:6083:: with SMTP id u125mr3033440oib.14.1600260122457;
 Wed, 16 Sep 2020 05:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com> <20200914140632.GD1221970@ziepe.ca>
 <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com> <20200916095359.GD438822@phenom.ffwll.local>
 <fc8f2af7-9fc2-cb55-3065-75a4060b7c82@amd.com> <b621db68-30b9-cc3f-c2c0-237a7fe4db09@amd.com>
In-Reply-To: <b621db68-30b9-cc3f-c2c0-237a7fe4db09@amd.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 16 Sep 2020 14:41:51 +0200
Message-ID: <CAKMK7uGJVMj6Sb1nDTBoY8SsXc55y2ypUEsGhNLOkbbjFLuYfw@mail.gmail.com>
Subject: Re: Changing vma->vm_file in dma_buf_mmap()
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 16, 2020 at 1:45 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> [SNIP]
>
> But Jason pointed me to the right piece of code. See this comment in in m=
map_region():
>
> /* ->mmap() can change vma->vm_file, but must guarantee that
> * vma_link() below can deny write-access if VM_DENYWRITE is set
> * and map writably if VM_SHARED is set. This usually means the
> * new file must not have been exposed to user-space, yet.
> */
> vma->vm_file =3D get_file(file);
> error =3D call_mmap(file, vma);
>
>
> So changing vma->vm_file is allowed at least under certain circumstances.
>
> Only the "file must not have been exposed to user-space, yet" part still =
needs double checking. Currently working on that.
>
>
> Ok, I think we can guarantee for all DMA-bufs what is required here.
>
> While searching the code I've found that at least vgem_prime_mmap() and i=
915_gem_dmabuf_mmap() are doing the same thing of modifying vma->vm_file.
>
> So I'm leaning towards that this works as expected and we should just doc=
ument this properly.
>
> Daniel and Jason what do you think?

Well I can claim I started this, so I started out with naively
assuming that it Just Works :-)

I think we already have vgem/i915 prime testcases in igt which try to
excercise this mmap forwarding, including provoking pte shoot-downs.
So I think best would be if you could also add a variant for amdgpu,
to make sure this really works and keeps working.

Plus ofc the documentation patch so that core mm folks can officially
ack this as legit.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
