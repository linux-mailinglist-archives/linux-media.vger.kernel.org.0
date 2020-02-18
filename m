Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4289162ED6
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2020 19:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgBRSl3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Feb 2020 13:41:29 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46700 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgBRSl2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Feb 2020 13:41:28 -0500
Received: by mail-qt1-f195.google.com with SMTP id i14so8032756qtv.13
        for <linux-media@vger.kernel.org>; Tue, 18 Feb 2020 10:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+8trNULk0p7YTqlS76VkwaHxCoBJjgc3YSZwDVrMPcc=;
        b=h6M6HrVl/s5ivPkO5Z1ae1j41oRDK/YZ/CMQeyTHeCm70Xf8uzH3NUd2U1TEIBQctu
         zaEPJnigmUn3fvfj0Sa0Vtkti5inbKWVcYrGvzz2Z9j3tAywKdkucVFFz9PkvyoLP6wY
         /5mIIY9IuOmrH7z2JMau9X++QuLwtDTXvMskap9MpzjyVWX//o0rQmGkyGijHqEUft0+
         AU7HWAlmw783ySPgijXZvqNYfdh2o/ASnQ85K/RkvHNBsduuWv8f5kxmfZKVXm30kVa7
         V0121A5vUilpN8Q72rXVxAfFiad3uPlDcFp8JTCASh2TMuKUxiBf1gGHBdEe1Hb0xtjP
         zpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+8trNULk0p7YTqlS76VkwaHxCoBJjgc3YSZwDVrMPcc=;
        b=GIrgHNZj/8CVgCjjZayNzFMdYSjk2RLeDhdIF094gvFVEsb25ew392ubZPJNRg18iX
         NpfRtsfcBNaTMg8iXmPhr5xMTweeiQo1qExANrqe9xyfhJZOCrbftLw3QA5WDxS5Ei5o
         QQXTuG9H6g+PlGO2YHHilhHmCTw3wOrmevdqmSqXviWxWYfI/C7as/lQf/yAM0KTqA3t
         ggGX+LX09uccbPJNSh5Lauvz/CQeF5lgapeubrjABsgu33KLG09YfawbTV5bdIDPO+5r
         17vv4Cz41wqfZjSgwCKs6ed9NYm4z5bM+PwhaApfEdXf//uWeiJEBTdmGeuFRzzaVSAW
         sgmQ==
X-Gm-Message-State: APjAAAWoAuNPUDEaGpZAANYQjdByZJzXsaLH55mX8wqYIqrih/rY+xVA
        a33QkJfUI7UuM7ey3uFd+kE7HQLovdeVQgIy5Q0uoA==
X-Google-Smtp-Source: APXvYqwNn+oeDOLhVeJz9u7cgOo+LDlda9ul4xQGNdm+tuTn6q87++mwk68MeqHh4jfoH64EprmRSvnltHAJHxaIXcI=
X-Received: by 2002:ac8:2ffa:: with SMTP id m55mr18764287qta.189.1582051287712;
 Tue, 18 Feb 2020 10:41:27 -0800 (PST)
MIME-Version: 1.0
References: <20191227063204.5813-1-xiyou.wangcong@gmail.com>
In-Reply-To: <20191227063204.5813-1-xiyou.wangcong@gmail.com>
From:   Chenbo Feng <fengc@google.com>
Date:   Tue, 18 Feb 2020 10:41:16 -0800
Message-ID: <CAMOXUJ=mvh0Aj-==wmPGh6x3dz0K3YTfaSw+osMwU=rgQv+Qkw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: free dmabuf->name in dma_buf_release()
To:     Cong Wang <xiyou.wangcong@gmail.com>
Cc:     DRI mailing list <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com,
        Greg Hackmann <ghackmann@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Acked-by: Chenbo Feng <fengc@google.com>


On Thu, Dec 26, 2019 at 10:32 PM Cong Wang <xiyou.wangcong@gmail.com> wrote:
>
> dma-buff name can be set via DMA_BUF_SET_NAME ioctl, but once set
> it never gets freed.
>
> Free it in dma_buf_release().
>
> Fixes: bb2bb9030425 ("dma-buf: add DMA_BUF_SET_NAME ioctls")
> Reported-by: syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com
> Cc: Greg Hackmann <ghackmann@google.com>
> Cc: Chenbo Feng <fengc@google.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
> ---
>  drivers/dma-buf/dma-buf.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index ce41cd9b758a..2427398ff22a 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -108,6 +108,7 @@ static int dma_buf_release(struct inode *inode, struct file *file)
>                 dma_resv_fini(dmabuf->resv);
>
>         module_put(dmabuf->owner);
> +       kfree(dmabuf->name);
>         kfree(dmabuf);
>         return 0;
>  }
> --
> 2.21.0
>
