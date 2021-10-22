Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFE443703B
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 04:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbhJVC7Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 22:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232627AbhJVC7X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 22:59:23 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E9EC061766
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 19:57:06 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id n8so140922lfk.6
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 19:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rQ7tR0Yp6rf1GJIW4s5NegDfNukJ5qAaGOcznVi/4fI=;
        b=h+Hl0emiqAK+B5ocs80eCdhcXRzi5YMDF968lXPzFxnEUEjZNCV6OZuT38DosVDCnX
         2kd2/6AfNusMc5xZkJ8N/9HOLbumhVHkRiVl+pTu0p8c76KiiCFvZP6csq8e5XzeKi6s
         NKzG9bxPFLEFUUM8MXoHHRBH58n0tfALyHZLNCEXPuZAdHp3IgWsrEtLaIcl/FQ/twrr
         hIQ2l5UiMMeYimNmh9FL25L+JI1EsizIDwRoXofARqjCqxBLfJa5U+iVP1afhGBSql/i
         LQLgTmVowuxTC7rnceq7K+q0QmfkhwHTbf/RdNNeDinD5gd8YVstgSuB3dBRn2olMQi3
         IFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rQ7tR0Yp6rf1GJIW4s5NegDfNukJ5qAaGOcznVi/4fI=;
        b=q1uGh610IqsO0oLre4OCIs0JVjQTs6LKXgetkdvl5L6slhBCnAckJEweSr0MUFDjlS
         1Vq2jYDwBfiRltA3kjhvYX+uIM0uERdww5Dwqb0KdEwZyD2qXkj9GGfg9bsO42sdaUFU
         A2YnsGeAPxc6Vu6T9pp8qfPhdlrFidB3g3DrN3PQWEKQUO5W5/wwhhRsUbJhFTr7AtTH
         vhNOozaHku1MZCWFTb30OpZBRrJ9bha4YWIsxVlaMuQAik4jiJjUekVjXNHut1Orav1D
         eXSorSf/xFhhFDojDdxNBvnLbRAzkIXxDJGiRWSTJsqVDGcfrR1Vnfl5HeiqHE8CcVDr
         FWKA==
X-Gm-Message-State: AOAM533bNxeRRtAnRTkoEtjIieT3bNOSAoEdAmrj+7R15oMf10aWyAKY
        MIxXt5wyy4Dem+N+2fNzF8tjUI+tXLXh0U7iFfg8cA==
X-Google-Smtp-Source: ABdhPJxJzM5FMhJLy7C24Ma1EhlhY+qm5a7Z6vGXJYXVhmcGsZqzKAOfVcJhFW3p0QRzG2qT+ZeBiOVY+pqKt+wQAQQ=
X-Received: by 2002:a05:6512:3191:: with SMTP id i17mr8670014lfe.485.1634871425112;
 Thu, 21 Oct 2021 19:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211022014850.22933-1-huangshuosheng@allwinnertech.com>
In-Reply-To: <20211022014850.22933-1-huangshuosheng@allwinnertech.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 21 Oct 2021 19:56:54 -0700
Message-ID: <CALAqxLXNMvaT3OU3Y-aYkH+KJA_g1QSOZNJHqvzt21WPy=6UJw@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: heaps: init heaps in subsys_initcall
To:     Shuosheng Huang <huangshuosheng@allwinnertech.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Christian Koenig <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 21, 2021 at 6:49 PM Shuosheng Huang
<huangshuosheng@allwinnertech.com> wrote:
>
> Some built-in modules will failed to use dma-buf heap to allocate
> memory if the heap drivers are too late to be initialized.
> To fix this issue, move initialization of dma-buf heap drivers in
> subsys_initcall() which is more earlier to be called.

Hey! Thanks so much for sending this out! I appreciate it!

So the change looks pretty straightforward to me, however, the
rationale for it is where we hit problems.

With the upstream kernel, there are not yet any modules that directly
allocate from dmabuf heaps. So in the context of the upstream kernel,
the reasoning doesn't make much sense.

Now, I know folks have their own drivers that want to allocate from
dmabuf heaps, but those haven't been submitted upstream yet.
So maybe can you submit those patches that need this along with this
change so it would make sense as part of a patch series? It would be
trivial to justify including this patch then.

thanks
-john
