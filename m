Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9FA929F56E
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 20:35:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgJ2TfE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 15:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgJ2TfD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 15:35:03 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF10C0613CF
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2020 12:35:02 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id n11so3434175ota.2
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2020 12:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pNs67top4pPOTGcP1NX7Pu7/uSm+kbCFKUDcv3vSLmY=;
        b=MQWqXJYCQgyXX2ED5upvS1zb/S5C1frA3jtLf8wN4hQgUkBCTJdeytiWYoqHWLJGwc
         Et2uXFDO9vJn9YdPxvW7EdORHys3z1FcdVODWJcjXelZlWEq3ff/wL64LENYfqlnNvIv
         ckJux5YWlOs6YLhRHDYrT2QluVkyhCkEjrk42hML2mgWA4g9BuWXwHj5ujn+Jbzt370f
         OUvmYK/AVfE97h3+gd2w1bcRNWRicBIdwPeUG/dTFDizok+kju4vmUbj8MVtu8wyqyEm
         uUfTLU9/up/V6EdurhRz9ibvNZqc+xEyRIONBF+zEUqPz41J/bSSzbBTJZYa8Iv41pUv
         9YUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pNs67top4pPOTGcP1NX7Pu7/uSm+kbCFKUDcv3vSLmY=;
        b=d8Ml+pQyxre7JaS9FzHNiSgA2MCLixeHV/RtpxRP9iHEouGiLvCNcmdUkCNMm0ELMH
         uF+AryJnwxFRcRgtWFOC/8V6uohBJeS8kIbXOD+7+TT9/xx2OXPUPUq0qeMsBCns+Xt6
         f1hf+bUu/9yXPyBB8ULnQNHLbC7O2EVebYbjDlgP+wbKKnDv6D+tdr2iP83oP9qFEQEz
         rbxCx5pIRvJr9Zslr9zAJi+AY5hlh7CKdMLUAR66MmDbNu0ayZio2ubnj4xkMfH3Acgj
         qIQZBfkgRqjVP2pnV1fdfdAHslXOFaAOxTsvo+01UGX/h2X1Mby08WU+T/ma4BFRL6oD
         KjWA==
X-Gm-Message-State: AOAM533kX6iwZEN6pdBvbKDnBptYZc7STsCzjeTfWJqsyQYFQvvQCNbz
        B8Oww+aNmZYDM0FG+OKJ/VxN5ZLsnZqlgLFNl3DRVw==
X-Google-Smtp-Source: ABdhPJy0AyVCxa/MNqqLnCtulrwic0DXZmVBbHxEFIqaCu0LwsfmMANQIDL2vahx/7Rjil+GW+C9/cBLzXFlqiduehw=
X-Received: by 2002:a05:6830:400c:: with SMTP id h12mr4739838ots.102.1604000102315;
 Thu, 29 Oct 2020 12:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201029001624.17513-1-john.stultz@linaro.org>
 <20201029001624.17513-6-john.stultz@linaro.org> <20201029070221.2856-1-hdanton@sina.com>
In-Reply-To: <20201029070221.2856-1-hdanton@sina.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 29 Oct 2020 12:34:51 -0700
Message-ID: <CALAqxLV8EYq7FEXFGrGnWocpiXihAd+wHcu5=X4oC2oS8_Fy=A@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] dma-buf: system_heap: Allocate higher order pages
 if available
To:     Hillf Danton <hdanton@sina.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 29, 2020 at 12:02 AM Hillf Danton <hdanton@sina.com> wrote:
>
> On Thu, 29 Oct 2020 00:16:22 +0000 John Stultz wrote:
> >
> > +#define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
> > +                             | __GFP_NORETRY) & ~__GFP_RECLAIM) \
> > +                             | __GFP_COMP)
> > +#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO | __GFP_COMP)
> > +static gfp_t order_flags[] = {HIGH_ORDER_GFP, LOW_ORDER_GFP, LOW_ORDER_GFP};
> > +static const unsigned int orders[] = {8, 4, 0};
> > +#define NUM_ORDERS ARRAY_SIZE(orders)
>
> A two-line comment helps much understand the ORDERs above if it specifies the
> reasons behind the detour to HPAGE_PMD_ORDER and PAGE_ALLOC_COSTLY_ORDER.

Thanks so much for the review and feedback!

So yes, this was pulled from ION's system heap:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/android/ion/ion_system_heap.c#n20

But adding __GFP_COMP as that's added by ION in the pagepool code I
didn't include:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/android/ion/ion_page_pool.c#n146

I unfortunately don't have a lot of detail on the exact rationale
(other than what I can pull from the commit log), I suspect it has to
do experiential knowledge of the majority of graphics buffers being
small multiples of 1M or 64K.

But I do agree some rationale in a comment would be helpful, and will
try to add that.

As for your comment on HPAGE_PMD_ORDER (9 on arm64/arm) and
PAGE_ALLOC_COSTLY_ORDER(3), I'm not totally sure I understand your
question? Are you suggesting those values would be more natural orders
to choose from?

Thanks again!
-john
