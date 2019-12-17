Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 087EC123331
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 18:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbfLQRI0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 12:08:26 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33329 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727735AbfLQRI0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 12:08:26 -0500
Received: by mail-oi1-f195.google.com with SMTP id v140so5967575oie.0
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2019 09:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MX5ryTLyNj1gEJN4sAxITw/PDa3L7q0z0atwMq1Sllw=;
        b=stQ7HrR8NLUsEd/uKcjLTm8K2InQYMIR3k0x+rFPgURFB5KG0yx3arx4y53sIfEArF
         2sW/VixVADH95/PrHcDkWXFVxsxOm1TlwOsRAvpt9JB+6Ksj8iGT/tOhpqyRvBkaYAUY
         2y+TMFjlTYh2vIh8gkkzzsV2PkH3GHk4/YnI0pEKe4uAO2reLYCxjxfPwVqineaigDgA
         PduA30a6IOlQ7RpPm1BvTwcDJTuDHH/xdiRSvKo1KIOo9rWbdqW8lh6D+hTedNl4z0EU
         wJM7b5eSXJRTD8qRAvE8vZFzOiSDUzQ8wMbJFmYzyzNWKozoRIuT2KtNsz0cH2SjVvb+
         I3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MX5ryTLyNj1gEJN4sAxITw/PDa3L7q0z0atwMq1Sllw=;
        b=pCBi6EdE9kQpArtrFU+9eMWclK9nEy3JliN9jbBEDoNqsUTj/g7IQ9nAykFIjt1j1i
         tJvcDKrvyZLdc2QnB7IqX77rhsYaTcxKR5i5RTDqoP3qWzwssigmdgGvfKmGW0mEDvcE
         Q11OGRhyTCh4a0Vn6vV9WfzX3qazw3JE427SDFfbAHYY6RvfKap+FKdbRbh0uOx8uqcR
         g2qKl3ogBl9WMO0W/KtiTD4asjh7A7a03dUWj1f8ZmL66vCZuRQMhbBalUH34rP1gpvq
         3k2ygLdPGFF4f56lPp8G5pFU5AtF4leaiBf0tMUYWK3swIzkTRCer6M4d7o/XrHCbc2Z
         +oJA==
X-Gm-Message-State: APjAAAW1kLWvdl4kdqzuHywrohzNlg+Yv6EvUIjIfCYvurn0QjQID6Dw
        5jjDGELT5duZOEz0SS5R1zUgjRcNTmhyJTxMYyWUJQ==
X-Google-Smtp-Source: APXvYqxLG7bWE9YdSVjIU8t3m/nXCwJvl2pBOamYDowsUPR2xloYjm0CkOITzBgkXp6Y+XU6F55krB3cB8r5tqx42h4=
X-Received: by 2002:aca:5fc6:: with SMTP id t189mr2244612oib.166.1576602505161;
 Tue, 17 Dec 2019 09:08:25 -0800 (PST)
MIME-Version: 1.0
References: <c1244a5f-b82a-baee-262a-7241531036ad@ti.com> <1576503511-27500-1-git-send-email-zhongjiang@huawei.com>
 <CALAqxLWAWc6NZDnixWhmHg6BtGHXTy6pZ6GXM0F=SkoYH8DiQw@mail.gmail.com> <5DF83CEC.5060002@huawei.com>
In-Reply-To: <5DF83CEC.5060002@huawei.com>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Tue, 17 Dec 2019 22:38:11 +0530
Message-ID: <CAO_48GFzdM9ZsNYTRc1JVQxUQ77TtVCYdUcCGQzkJDf-Ob=L-Q@mail.gmail.com>
Subject: Re: [PATCH v2] dma-heap: Make the symbol 'dma_heap_ioctl_cmds' static
To:     zhong jiang <zhongjiang@huawei.com>
Cc:     John Stultz <john.stultz@linaro.org>,
        "Andrew F. Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Zhong Jiang,

On Tue, 17 Dec 2019 at 07:56, zhong jiang <zhongjiang@huawei.com> wrote:
>
> On 2019/12/17 5:13, John Stultz wrote:
> > On Mon, Dec 16, 2019 at 5:43 AM zhong jiang <zhongjiang@huawei.com> wrote:
> >> Fix the following sparse warning.
Thanks for the patch; could I request you to please use
scripts/get_maintainer.pl to get the cc: list for the patches?

+ dri-devel.
> >>
> >> drivers/dma-buf/dma-heap.c:109:14: warning: symbol 'dma_heap_ioctl_cmds' was not declared. Should it be static?
> >>
> >> Signed-off-by: zhong jiang <zhongjiang@huawei.com>
> >> ---
> >>  drivers/dma-buf/dma-heap.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> >> index 4f04d10..da2090e 100644
> >> --- a/drivers/dma-buf/dma-heap.c
> >> +++ b/drivers/dma-buf/dma-heap.c
> >> @@ -106,7 +106,7 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
> >>         return 0;
> >>  }
> >>
> >> -unsigned int dma_heap_ioctl_cmds[] = {
> >> +static unsigned int dma_heap_ioctl_cmds[] = {
> >>         DMA_HEAP_IOC_ALLOC,
> >>  };
> > Acked-by: John Stultz <john.stultz@linaro.org>
> >
> > This patch will collide with Andrew's _IOCTL_ naming change, but its a
> > fairly simple thing to resolve.
> >
> > Sumit: If you're comfortable resolving the collision, please queue
> > with the rest of the recent changes for drm-misc-next.
> > Otherwise, I'm happy to submit the resolution I tested with here
> > afterwards. Let me know.
Of course, I am sure I can handle collisions, John, or else being a
maintainer might get a tad difficult :)
> As it is an fairly simple patch, I hope you can resolve the issue directly.
>
> Thanks,
> zhong jiang
> > thanks
> > -john
> >
Best,
Sumit.
