Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0888326E23F
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 19:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgIQRXY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 13:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgIQRXP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 13:23:15 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E098EC061788
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 10:23:14 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id 185so3324644oie.11
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 10:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=F86p0ud99YSiTMCN0ZfJJse9lFQfi+WRyzF06l3LfwA=;
        b=Oe+9XFyi4XwSdp0c08MIQlmhrPw1Z8ltKB2S7V3IMBblrL34HKoK0b4blCy3ZHSJxj
         7IaJJ0RwaRrjJztcw/95TWgK1iToMprnqvda3Cw5Rs+2ciTDAeh8nMCt44s2ulVhn6KN
         6sAVjFYZRVuJFjONKZdpeD53O77tF58gs1uyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=F86p0ud99YSiTMCN0ZfJJse9lFQfi+WRyzF06l3LfwA=;
        b=PHDhM/5Qmp/MvHbBW7Cb5DxmD59jl1+iug5CX0YANuPWvZWUBnyqIjjH51XxVf3a1w
         3SmuKCRHC5aLMnqU8raC9C9JQe/5qRjvZ10sEVkHIR4pN7H+4bGZZgvuTSWT1VZ344FT
         refz+B/eEjyareTWZ7FDcusxc8ZqZAhzjGOWkdS9fVmHlAg+itiKJbexln9sV5XVOvs+
         CPbIXzC0WAmHfFY7qOtoCdqKfHbGrYtVE6paDQo3ItrtxYqsvrMwI9UInp/n+pXEHRoR
         hVnus8nkZ9pli8RzUAkUaIGeJys2zvZDP8mW/o+gqFc51XJrkoDIXo2n8KijoBDnCGwg
         PbIw==
X-Gm-Message-State: AOAM533aSTo0PsCPHSew2SmQYTDrayFJZT6cxlw57kqMHgHTQVGK2D8y
        PDzyFKYrj9TSjA6GraQAKFsS2clrYYuVk9mPZZ6cDw==
X-Google-Smtp-Source: ABdhPJwF3dNmQNnc08BdxH8My7DtOBpKWMR10LzO7dt3VFCMGmJE1UwcTFFGHLsdQ5ho5h5wrPc5sUf6w5ZuU6y8//k=
X-Received: by 2002:aca:6083:: with SMTP id u125mr7050119oib.14.1600363394219;
 Thu, 17 Sep 2020 10:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca> <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
 <20200917121858.GF8409@ziepe.ca> <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
 <20200917143551.GG8409@ziepe.ca> <5b330920-c789-fac7-e9b1-49f3bc1097a8@gmail.com>
 <20200917152456.GH8409@ziepe.ca> <CAKMK7uHQLAHXC_aBZZco0e3tbAqnNuW8QdJk=-V-yM2khw5e=Q@mail.gmail.com>
 <b9e65f47-b5c8-db09-117a-a8e22a5b6c71@amd.com> <20200917163907.GI8409@ziepe.ca>
In-Reply-To: <20200917163907.GI8409@ziepe.ca>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 17 Sep 2020 19:23:03 +0200
Message-ID: <CAKMK7uHrQ13-0oxTGZERQeoJ7jQES9jeDf0FhY3qW-NHdZvZ4w@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Linux MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 6:39 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Sep 17, 2020 at 06:06:14PM +0200, Christian K=C3=B6nig wrote:
> > > > If it is already taking a page fault I'm not sure the extra functio=
n
> > > > call indirection is going to be a big deal. Having a uniform VMA
> > > > sounds saner than every driver custom rolling something.
> > > >
> > > > When I unwound a similar mess in RDMA all the custom VMA stuff in t=
he
> > > > drivers turned out to be generally buggy, at least.
> > > >
> > > > Is vma->vm_file->private_data universally a dma_buf pointer at leas=
t?
> > > Nope. I think if you want this without some large scale rewrite of a
> > > lot of code we'd need a vmops->get_dmabuf or similar. Not pretty, but
> > > would get the job done.
> >
> > Yeah, agree that sounds like the simplest approach.
>
> I don't think that will fly, it is clearly only papering over a mess
> inside DRM/dma buf :\

dma-buf started out as something to paper over the disjoint mess of
allocators, since it was pretty clear to anyone involved we're not
going to unify them anytime soon, if ever. So the mess pretty much is
bound to stay.

I think most reasonable thing would be to throw a common vmops in
there somehow, but even that means some large scale surgery across
every driver/subsystem involved in dma-buf. It wouldn't unify
anything, all it would give you is a constant vma->vm_ops to do some
kind of upcasting. And that would still only give you a slightly less
opaque pointer with a callback to upcast to a dma-buf in some
driver/subsystem specific way.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
