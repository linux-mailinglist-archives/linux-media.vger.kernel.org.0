Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68773796B5
	for <lists+linux-media@lfdr.de>; Mon, 10 May 2021 19:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233321AbhEJR6Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 May 2021 13:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233315AbhEJR6Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 May 2021 13:58:24 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B575C06175F
        for <linux-media@vger.kernel.org>; Mon, 10 May 2021 10:57:19 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id v191so14130512pfc.8
        for <linux-media@vger.kernel.org>; Mon, 10 May 2021 10:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mWPrNb69nyGWKI0m9pPGW0IsoOENSpHi4HuteUPIllA=;
        b=WDir0qDOMsL25iK8wuf0VwNf0hPuuhOqUjjIVr1hs7XzcxFvbzfzYbFkdx/sh9mljA
         1j3r5+a480WbR1tiGdAGMc75YHoI0pWIg1rBqEVgUfMYWxjA8ZHrhNHj2pd2/8iAlJB3
         sfcnzbav23KQ6dzUy2Z0rWCgkThAw+d2CBVFPzYeT8htkYT+muYNLyNGbzHzWUMRWPUf
         9tdzV2Im41JBWIiZLskLQGpj0ERl0rBZNSWHYrwPKUQD8N2F23w1M3xGeP8qAW2tMSoZ
         GUP5y2jtRz6EtzZTPRO0KyFrNDU+cJ0rqnkbYZuw1wJeYbmYfrrKCXk9NNQmDdnhDo8N
         GaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mWPrNb69nyGWKI0m9pPGW0IsoOENSpHi4HuteUPIllA=;
        b=CjmSqhvdB3ewr6chJFM/3sxiD0w/hPkQtMr5g3j6D9cMEulfXlCc0STNiUYCKgjzW7
         IcAVolbBOsnLaMy4EGmUG46z9PXRyRkP42vbEHT4hzNB0yz5pxrJs9jufrnJkRfGvo3f
         en129+OpgfaPh9949TBN9VO97TdmR4OSb9cbSlZnLWBLBWVmTis+1NkQyKDYuutYGdOA
         LjSi9PvfUZkZlEWsWTlucowvTNDuTtV7gxDB22VdEZHxqVCv/O27s5D3ybwb1dBrFjwi
         52DdxdwSjIQPxZ0kdqbDpHxHM8PbVm9w5rdUnLEq5JqeceNDG8pTvxAWoFh3GCVcLuO0
         Dtnw==
X-Gm-Message-State: AOAM533crT886T7j9tT5R53VbEubKFkPn5BcZinwvypI/gMDxJ/mMpyT
        c0nDXbL/AKRYVoimcl0+w6afkA==
X-Google-Smtp-Source: ABdhPJxGmr5OAWApep3UYINJrGM2ui/EZ9ttx3t/4ewaXx+5Bt9eSw10BXX2oHyBKAcRoxeHzRohHg==
X-Received: by 2002:a62:d108:0:b029:25d:497e:2dfd with SMTP id z8-20020a62d1080000b029025d497e2dfdmr26602164pfg.29.1620669438673;
        Mon, 10 May 2021 10:57:18 -0700 (PDT)
Received: from google.com (240.111.247.35.bc.googleusercontent.com. [35.247.111.240])
        by smtp.gmail.com with ESMTPSA id s21sm11918766pjn.29.2021.05.10.10.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 10:57:18 -0700 (PDT)
Date:   Mon, 10 May 2021 17:57:14 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL] topic/iomem-mmap-vs-gup
Message-ID: <YJlz+p787mK8tAh+@google.com>
References: <YJBHiRiCGzojk25U@phenom.ffwll.local>
 <CAHk-=wiwgOPQ+4Eaf0GD5P_GveE6vUHsKxAT=pMsjk1v_kh4ig@mail.gmail.com>
 <YJVijmznt1xnsCxc@phenom.ffwll.local>
 <CAHk-=wgjO8-f1bUwQB=5HGzkvSS+aGACR9+H5CkkDhRgud+3MA@mail.gmail.com>
 <20210510135031.GF2047089@ziepe.ca>
 <CAKMK7uFfN3p2fE1Xq47nOTtkPY2vm10GMvBaupQ9hgK0rS8sgQ@mail.gmail.com>
 <20210510153412.GG2047089@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510153412.GG2047089@ziepe.ca>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+Paolo

On Mon, May 10, 2021, Jason Gunthorpe wrote:
> On Mon, May 10, 2021 at 04:55:39PM +0200, Daniel Vetter wrote:
> 
> > yeah vfio is still broken for the case I care about. I think there's
> > also some questions open still about whether kvm really uses
> > mmu_notifier in all cases correctly, 
> 
> IIRC kvm doesn't either.

Yep, KVM on x86 has a non-trivial number of flows that don't properly hook into
the mmu_notifier.  Paolo is working on fixing the problem, but I believe the
rework won't be ready until 5.14.
