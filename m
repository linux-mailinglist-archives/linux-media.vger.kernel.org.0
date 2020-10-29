Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9191F29E729
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 10:23:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgJ2JXW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 05:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgJ2JXW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 05:23:22 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7965AC0613D2
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2020 02:23:20 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id z23so2554138oic.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2020 02:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HErX54nBW85Mz/DisB4HfNyGdAeDZ0yXv+UudeIIMTI=;
        b=CBZ8FpLcj2jbgAT+Vmv1XK/GbFU0hZrgfjfdtoEzh/dEuH+e0mn43Y+dqqjduTTKhF
         J7T958sHQ5/KYkABUDOFL7LBDzCndG/FofSZCVsgEfa1haI/dp0rDYf3SCs2rGay/PWL
         uDxd+MKtvtWQZGFZGQv1Mt5IJ+VVaOuC4yqDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HErX54nBW85Mz/DisB4HfNyGdAeDZ0yXv+UudeIIMTI=;
        b=d26sn5PLzadgOtEbE0RnUrEQzGU37gUJilLQQNwPVHPI0R1P+Nu5P/NVw8gukEnqvn
         mF8cyoeidBM8SX8JFPIhddiFCnyJvOOwexobHtyR/LZ6E2hUC5kXx/SG4xfr4X2HfYni
         tTJ/adtrrYG7d7FZwRW1c1q7Rnoxw+YryB8CtogGtZOE2nCtbHHYgsIq1w5e5ll3vOzY
         GEQySrVbpDvcr/aod83B3rX7uUG+Dh7ZqVpNUSWq3YTY6YFnGNbTN0rVpZoWd/WykOnL
         0Aeyw0rQjNAPhXeIwIBFAHI5l60rNRojxbkG+gHBIo2CJ8DuIsf30vb2RDufSQ9L2oIE
         Wdxg==
X-Gm-Message-State: AOAM533GAFxg6SHT+keDemN//SPixEgnFygV/yHMTocuiVhOKmf29Px6
        2rFAnM1RX8fKZRNBsi91AUxmqiEglC8ntEBgPbZYcA==
X-Google-Smtp-Source: ABdhPJwaJb96lRFRXk+hd1pHWMNo5GqlP779ZIojTGckKr1ysWVQINo4W6Rzy8Z9dUSTdKF2aKSvZQbQvjmujgECT7Y=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr2268480oig.128.1603963399942;
 Thu, 29 Oct 2020 02:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
 <20201026105818.2585306-9-daniel.vetter@ffwll.ch> <20201029085644.GA25658@infradead.org>
In-Reply-To: <20201029085644.GA25658@infradead.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 29 Oct 2020 10:23:09 +0100
Message-ID: <CAKMK7uGVUf9RfTHKa8fpTUgGQ5iy+5toK+tQYp0TokKU=iM8pQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/15] mm: Add unsafe_follow_pfn
To:     Christoph Hellwig <hch@infradead.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        "J??r??me Glisse" <jglisse@redhat.com>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 29, 2020 at 9:56 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> > +int unsafe_follow_pfn(struct vm_area_struct *vma, unsigned long address,
> > +     unsigned long *pfn)
>
> The one tab indent here looks weird, normally tis would be two tabs
> or aligned aftetthe opening brace.
>
> > +{
> > +#ifdef CONFIG_STRICT_FOLLOW_PFN
> > +     pr_info("unsafe follow_pfn usage rejected, see CONFIG_STRICT_FOLLOW_PFN\n");
> > +     return -EINVAL;
> > +#else
> > +     WARN_ONCE(1, "unsafe follow_pfn usage\n");
> > +     add_taint(TAINT_USER, LOCKDEP_STILL_OK);
> > +
> > +     return follow_pfn(vma, address, pfn);
> > +#endif
>
> Woudn't this be a pretty good use case of "if (IS_ENABLED(...)))"?
>
> Also I'd expect the inverse polarity of the config option, that is
> a USAFE_FOLLOW_PFN option to enable to unsafe behavior.

Was just about to send out v5, will apply your suggestions for that
using IS_ENABLED.

Wrt negative or positive Kconfig, I was following STRICT_DEVMEM symbol
as precedence. But easy to invert if there's strong feeling the other
way round, I'm not attached to either.

> > +/**
> > + * unsafe_follow_pfn - look up PFN at a user virtual address
> > + * @vma: memory mapping
> > + * @address: user virtual address
> > + * @pfn: location to store found PFN
> > + *
> > + * Only IO mappings and raw PFN mappings are allowed.
> > + *
> > + * Returns zero and the pfn at @pfn on success, -ve otherwise.
> > + */
> > +int unsafe_follow_pfn(struct vm_area_struct *vma, unsigned long address,
> > +     unsigned long *pfn)
> > +{
> > +     return follow_pfn(vma, address, pfn);
> > +}
> > +EXPORT_SYMBOL(unsafe_follow_pfn);
>
> Any reason this doesn't use the warn and disable logic?

I figured without an mmu there's not much guarantees anyway. But I
guess I can put it in here too for consistency.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
