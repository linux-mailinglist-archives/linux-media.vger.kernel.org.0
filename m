Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FAD2244F16
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 22:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgHNUPH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 16:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgHNUPH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 16:15:07 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF09C061386
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 13:15:06 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id h3so9150049oie.11
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2020 13:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K1VjQolyfnnNVHHYuPIt8KNCctqJMTa9sGgTeUR70Ro=;
        b=DZ5myydxcvkGbm+IsJi3gh56/Bx0I9UaNCaJ/ja2SMZKO1klTplQvWE6mNbZhrGgv/
         UF99xSMV81q7h9YWU718ve0oCTci6YlEkeVIgBIl9rUO1DHkOKOkkBQFqnrtqVoFnicG
         4khUMVOXYg0QltxHVsuE+SOlJtDagL5LrMwEFeOG59n3JY92s+7oxtRSGfxB0VBeSIO+
         JwC4EnIwyEOh6Towkp8VMDKmTtvInhnauublH668LYzQWCOBwh0YFwelJM688XPUQFCX
         B5wqPD15o5+/D+tCHj5tTucdfC1n3qt2hRdNi79xBh/2bZTC3cBgEmROvyrkCxKk+NV9
         wxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K1VjQolyfnnNVHHYuPIt8KNCctqJMTa9sGgTeUR70Ro=;
        b=MUjZwDjgo1v7+FrXpsHIy55myVXNG/fGqmCAqG9uy5kpbghlf+ewQzjYqTAM3CGZih
         m/bWudC4C9QLgQhe4zGhJqEb3KnlBYOnMmcYeXUajaZBDPRuDycX7LUYoQ1RgsfQPf+X
         RRCaFeVzcdG77I4g2G3oEpQzWp23ON2AFZ+vCT4G3hvsxgqss/JQYtx+O5tMGmpmEYNl
         f1PUyQ6U+hH2ibsIQFOgT6v/fWIUCbMY8kf/C9LfSCUEbvFjo3pjMS8NAPf3zxRiw/dM
         gvIwlLFL8iqO6OnN9Cl8sYQXWvpef8dru790kHRlL0gZXXzEqsxgOErg5jZbC1zJtUdl
         ADYw==
X-Gm-Message-State: AOAM530E1dIS1fVY0KsrrolHp4xP4mofEY02YZoacsy3D6iww1c29pdV
        gTAklX3zF21chY/b2OygXE++0t1O6yEZJu86Cx4spw==
X-Google-Smtp-Source: ABdhPJw4UOC9yfUWvWUG9o2FjojXvLZmJIXbbxjYgl69mSx9NHERCd5aVLqvrPbeoCFTLDdWCdN9atd5Igcy//QirKc=
X-Received: by 2002:aca:dc85:: with SMTP id t127mr2517949oig.169.1597436106306;
 Fri, 14 Aug 2020 13:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200814062458.53049-1-john.stultz@linaro.org>
 <20200814062458.53049-2-john.stultz@linaro.org> <CAAEAJfDy7V9thc4-dfkwkiRAqqG=D1_qWTv7_gOkN9dcaM6mkw@mail.gmail.com>
In-Reply-To: <CAAEAJfDy7V9thc4-dfkwkiRAqqG=D1_qWTv7_gOkN9dcaM6mkw@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 14 Aug 2020 13:14:55 -0700
Message-ID: <CALAqxLUKkAubGMPYKZC6ufjaepkHw21Cit4h=nnOJGjYnO7GUA@mail.gmail.com>
Subject: Re: [RFC][PATCH v2 2/2] dma-heap: Add a system-uncached heap
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 14, 2020 at 9:15 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> Thanks for the patch.
>
> On Fri, 14 Aug 2020 at 03:25, John Stultz <john.stultz@linaro.org> wrote:
> >
> > This adds a heap that allocates non-contiguous buffers that are
> > marked as writecombined, so they are not cached by the CPU.
> >
>
> What's the rationale for exposing the memory
> attribute as a new heap, instead of just introducing flags?
>
> I guess this calls for some guidelines on what situations
> call for a separate heap, and when it's just a modifier flag.

YES! :) A big part of this patch is to start a discussion and feel out
what properties of heaps are generic enough to be flags, and what
aspects are unique enough to deserve having their own heap
implementation.

ION used the ION_FLAG_CACHED bit for this and considered it a generic
property (though by default all buffers were uncached). This seemed to
cause enough friction in reviews that we dropped it and used cachable
buffers for the initial DMA BUF heaps.

Further, I want to make sure we avoid the custom flag abuse that ION
saw, especially with vendor heaps. So I think having each unique
behavior being a separate heap is a reasonable stance.

That said, we added the (currently unused) heap-flags field to the
interface as there may be some attributes or modalities that are truly
generic across heaps. So if we want to add an UNCACHED flag instead,
I'm open to that.. however I want to make sure it has clear general
meaning so that its behavior is consistent across all heaps and
architectures (or produces an error if it's not supported).

thanks
-john
