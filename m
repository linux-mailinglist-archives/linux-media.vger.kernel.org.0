Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1705416F672
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 05:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbgBZE3U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 23:29:20 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39584 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgBZE3T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 23:29:19 -0500
Received: by mail-ot1-f65.google.com with SMTP id 77so1755791oty.6
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2020 20:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gOC8DpWiH0j9iNghIrQNnZTh9j5bGMcjUGYt8SCdFTA=;
        b=HWH01uwOOOImzmS+M/Az1nOPRtxNoMHwRmXqWQCATSb81iTCoVNG8mzlwu9uAgXpUG
         I9ZSXzimx5y3xfnrk4k8HRmmzc420wkpXx9UloaKNjv94iUG6eO9MufOua5wB59cPNG6
         QkRHG4odHPitkMx2A23QdWYzWibMXOLE9GzBWrvsFWHJ84MyhYRUIPqEP2TJr3Lv7qLh
         x0wdXKkA0gXGZtZV5JgvpDfrm1R5V7gC4tJn9uvTJ5U+rxxw8uN6rxh33NvAZ77dcdLj
         DUXneQv2C4EKJpgIW805wiyvdd5kX58Ba7IZ0s71s0gaFw9TT/2X6a4tPqtlyUs9qlwF
         B3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gOC8DpWiH0j9iNghIrQNnZTh9j5bGMcjUGYt8SCdFTA=;
        b=ExjwVonSm/s4+G/0+WR4WBg844ee/q5cO5tcY1YiVt0hhxrevM8cGBoXy1W+Xacj0x
         Hq66xUMJ0o+1q97aTRjNPFuWLIkiqJG5FOCSnfQyUElsB9MSeMAWopW5RMHTwimRoKcx
         TBuWSYq4l7EMNNbO2ssW4YjPAHDdC06oXHdOYf3J0kPmLO7+ZLJUgvtOS/e3ZskKMB1g
         A0aRcL/Y0MTOZDjx1cB3RsHqi7N1OZA1ZjwINnRae48iqY6OjOvqt3q1v/0bouTwMCgT
         nfcYiMqSwvLS4z4v73T+rQhQUPkDaF4JGOpn74T4QEp61oIQKTJzH6sQLqCMkk9m8p44
         gbiQ==
X-Gm-Message-State: APjAAAUJFF7VaKW7PjegPM10xgWCvr/2Em3CWEbXG2dMw72DtrzTJBdE
        wkpCDaI1dngJb42WH/ux2pMve/nykm6NiOSLG3P1Cw==
X-Google-Smtp-Source: APXvYqy1wy1oEzfz9uQI8ZP6nsZkzbMoKjDIkDSSocjkFUZXQfjBCHycp7ljNh6ZJS1Fj9r+cix0x4himyW0FknMDQ0=
X-Received: by 2002:a9d:5786:: with SMTP id q6mr1472845oth.164.1582691357103;
 Tue, 25 Feb 2020 20:29:17 -0800 (PST)
MIME-Version: 1.0
References: <20200203173311.6269a8be06a05e5a4aa08a93@linux-foundation.org> <20200226015504.7GW9ptoIA%akpm@linux-foundation.org>
In-Reply-To: <20200226015504.7GW9ptoIA%akpm@linux-foundation.org>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Wed, 26 Feb 2020 09:59:05 +0530
Message-ID: <CAO_48GFr9-aY4=kRqWB=UkEzPj5fQDip+G1tNZMsT0XoQpBC7Q@mail.gmail.com>
Subject: Re: + dma-buf-free-dmabuf-name-in-dma_buf_release.patch added to -mm tree
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Chenbo Feng <fengc@google.com>,
        Greg Hackmann <ghackmann@google.com>,
        mm-commits@vger.kernel.org, xiyou.wangcong@gmail.com,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Andrew,


On Wed, 26 Feb 2020 at 07:25, Andrew Morton <akpm@linux-foundation.org> wrote:
>
>
> The patch titled
>      Subject: dma-buf: free dmabuf->name in dma_buf_release()
> has been added to the -mm tree.  Its filename is
>      dma-buf-free-dmabuf-name-in-dma_buf_release.patch

Thanks for taking this patch via -mm during my absence (I'm just
returning from a bit of an illness). If there are other dma-buf
patches on your radar that you'd like to take via the mm tree, please
let me know and I can provide the necessary Acks.
Else I will take them in via drm-misc as usual.


>
> This patch should soon appear at
>     http://ozlabs.org/~akpm/mmots/broken-out/dma-buf-free-dmabuf-name-in-dma_buf_release.patch
> and later at
>     http://ozlabs.org/~akpm/mmotm/broken-out/dma-buf-free-dmabuf-name-in-dma_buf_release.patch
>
> Before you just go and hit "reply", please:
>    a) Consider who else should be cc'ed
>    b) Prefer to cc a suitable mailing list as well
>    c) Ideally: find the original patch on the mailing list and do a
>       reply-to-all to that, adding suitable additional cc's
>
> *** Remember to use Documentation/process/submit-checklist.rst when testing your code ***
>
> The -mm tree is included into linux-next and is updated
> there every 3-4 working days
>
> ------------------------------------------------------
> From: Cong Wang <xiyou.wangcong@gmail.com>
> Subject: dma-buf: free dmabuf->name in dma_buf_release()
>
> dma-buff name can be set via DMA_BUF_SET_NAME ioctl, but once set
> it never gets freed.
>
> Free it in dma_buf_release().
>
> Link: http://lkml.kernel.org/r/20200225204446.11378-1-xiyou.wangcong@gmail.com
> Fixes: bb2bb9030425 ("dma-buf: add DMA_BUF_SET_NAME ioctls")
> Reported-by: syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com
> Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
> Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
> Acked-by: Chenbo Feng <fengc@google.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Greg Hackmann <ghackmann@google.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
>
>  drivers/dma-buf/dma-buf.c |    1 +
>  1 file changed, 1 insertion(+)
>
> --- a/drivers/dma-buf/dma-buf.c~dma-buf-free-dmabuf-name-in-dma_buf_release
> +++ a/drivers/dma-buf/dma-buf.c
> @@ -108,6 +108,7 @@ static int dma_buf_release(struct inode
>                 dma_resv_fini(dmabuf->resv);
>
>         module_put(dmabuf->owner);
> +       kfree(dmabuf->name);
>         kfree(dmabuf);
>         return 0;
>  }
> _
>
> Patches currently in -mm which might be from xiyou.wangcong@gmail.com are
>
> dma-buf-free-dmabuf-name-in-dma_buf_release.patch
>
Thanks and best regards,
Sumit.
