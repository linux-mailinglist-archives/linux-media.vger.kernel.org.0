Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D63223DF6F8
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 23:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232707AbhHCVkI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 17:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232384AbhHCVkH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 17:40:07 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD37C061757
        for <linux-media@vger.kernel.org>; Tue,  3 Aug 2021 14:39:56 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id j77so973465ybj.3
        for <linux-media@vger.kernel.org>; Tue, 03 Aug 2021 14:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eH7F2c4Hn9egywDlY45TqR5QW7h6BJhJpVKajFn/Dvg=;
        b=frGpZAuU0TNGycNOUwSntnWTwUNXJjKhM/djmFxpOw4RLjxj4ZIMH/kWc6KmsJtmzd
         5DZZF1XvLkwEjfV0d1g/+qd7fYu4p3IcXqxRh2+j2cEJmx1zwJZD59Hk+1HpT49HtK7X
         Uqge3z5MMAj3GqdriP0bGY+4uxvfDwPHI/8AUaTv/dYUqCfItsy4CzgGG4YcVxQ2W+3k
         8yFws8bfEWrZyIXSyrNOM13JM5LbYjDmUdpWEgK5q3XHMwmDZUH16Fn3Lcmdkk1kJ+tR
         5f+ICl8eIJ74PX6+7FzayWfSiwsOc3t/1lDkBGqzyqADZbXQ5H4FBtmOqjk757mpLOmy
         DCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eH7F2c4Hn9egywDlY45TqR5QW7h6BJhJpVKajFn/Dvg=;
        b=eHWCWJSs4icw52c5KxYEIwqiVzwdLITiDZf6RMTDoKyZLefjSqXD9m5wNom/jAfdtj
         USQ5ceOG9i/9Uc14cP41+YBqSroHEmAP7l5OLJu0LURaBD1Mz8RYU/zfoMugUylV3cSu
         yK5cy3cRIFa1v4iz9lpLHArmYsDL73KuRIAReTK6M7YqcISwVNzM9ybWOyZX1HlCRF4E
         dmWh7ewk4f92r6M0LQzsrUQmIBTrxEFGB8ukyF7tXp0ITNUuI1gxAedkKYRV6v8wNmYU
         xdLl/NFkmPysJrkFcVR0d3+6oVuWJx9ZohrI5ecPweYHtcsOrwznwBZZwLHxavdjYsBY
         Hm5A==
X-Gm-Message-State: AOAM530SPTpenNlqfM7zLQk7hA+PMzK+QRFaKWRostV7tjchZIVIBjTo
        OxdLBVTSYpkPZv+D8r3Sir+1I2c7xE/qGQUPGgzIfg==
X-Google-Smtp-Source: ABdhPJynfd6Tp5fx5X/8PoqmW8udIcLQViQbJXvKzToG91Bonke+UV5rO2Ua9gr8hn4ZJodP/4n3mFpQcnCzz5bXHoo=
X-Received: by 2002:a25:cac7:: with SMTP id a190mr14975276ybg.290.1628026795438;
 Tue, 03 Aug 2021 14:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210722190747.1986614-1-hridya@google.com> <CALAqxLVLMt7rbJBQtFBw-ikBAjKrVgfS8=Nu6NFQbp_gq1m22Q@mail.gmail.com>
In-Reply-To: <CALAqxLVLMt7rbJBQtFBw-ikBAjKrVgfS8=Nu6NFQbp_gq1m22Q@mail.gmail.com>
From:   Hridya Valsaraju <hridya@google.com>
Date:   Tue, 3 Aug 2021 14:39:19 -0700
Message-ID: <CA+wgaPOQmY4H9n302YspKuLk9iq9vBzdWBTu19EUUsiQYTUOzQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation limit for system heap
To:     John Stultz <john.stultz@linaro.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 2, 2021 at 7:18 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Thu, Jul 22, 2021 at 12:07 PM Hridya Valsaraju <hridya@google.com> wrote:
> > This patch limits the size of total memory that can be requested in a
> > single allocation from the system heap. This would prevent a
> > buggy/malicious client from depleting system memory by requesting for an
> > extremely large allocation which might destabilize the system.
> >
> > The limit is set to half the size of the device's total RAM which is the
> > same as what was set by the deprecated ION system heap.
> >
> > Signed-off-by: Hridya Valsaraju <hridya@google.com>
>
> Seems sane to me, unless folks have better suggestions for allocation limits.
>
> Reviewed-by: John Stultz <john.stultz@linaro.org>

Thank you for taking a look John!

Regards,
Hridya

>
> thanks
> -john
