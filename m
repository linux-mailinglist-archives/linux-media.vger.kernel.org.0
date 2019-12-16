Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF07121B95
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 22:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfLPVOC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 16:14:02 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:40754 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbfLPVOC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 16:14:02 -0500
Received: by mail-il1-f195.google.com with SMTP id c4so2167635ilo.7
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2019 13:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ScEgdn7td6K2AI+QFF092h38Iaa+VFJSkrPG9BcVwIc=;
        b=JjoVzq8evnG1icA/FtopLUdXEb40mvSQ0C965AomDw1ZpMxVKvh8bqXaP8m0+NxVtZ
         +yxzzGrofpGvvYQ+KsveN/bZFU9GQgHEpfhAeGd6HPSk9PT3WDpeItFfOCtJdCoOW2XD
         14pqovdsi9xZ/PhVdfQ1oYj2foEYctqqZv2g/BWnQdoezCCyQTlbC7GDKGpFsXgka5Dd
         xVokR0JbVhSznTyx/OeUuy0k5O06bKQrGklYpaA1N5TuE2WjdkWp6T1hla1d2bQsZQ5+
         lJumWqjfOcvOoBwBhvXIAkvSRtb8eAg4hPBmojfPPbCMDcIoCIUKBzJ8e81qNHVHA8bK
         Nz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ScEgdn7td6K2AI+QFF092h38Iaa+VFJSkrPG9BcVwIc=;
        b=boUS3YeplU+HhY36DFyP1kBVQl2Zkd697rEgQIuMfrvTFu2c27FP1hzup5Ow0qVZvT
         oL9AfbiMmXY/Ged1WDkqDsHx6AWvRSDvXrASG87cCjP21neZOprxCMu6V3OIC/r+279v
         xLquEsxTdVqkWX8VPO/90luyDMv79TVkHcN65CxEvMpzltOwq3+UHICLLjwkl8OEXETL
         sqzUAu7Ah6crYoBpbbrIARpdzIDnpgx66y50b5M5qz2rAqai+LGxonZs4EeNAznEd6z3
         IRTWYHKM79tx9eAPymR85EDMpVBjTdalPKg8BmiJyong0vgCH8/8JNIWBLh+iIbqRkH/
         39mA==
X-Gm-Message-State: APjAAAW7In3O9nmSwX9eomybvdT2I/41yVr92j2302w2tt+ol4eAr0YO
        bSWl3BRvTBCB1fML3FRxW1fK9dvytzAuGZJ6rUNksw==
X-Google-Smtp-Source: APXvYqwcLLmtNs0dAvpxYBX6LtdSa6EiRvef1XeYW0zzM03UEWa1PdIyxhPK8EMM7ulemON/T2tzskJyV423SW9L3wA=
X-Received: by 2002:a92:2550:: with SMTP id l77mr13210229ill.21.1576530841155;
 Mon, 16 Dec 2019 13:14:01 -0800 (PST)
MIME-Version: 1.0
References: <c1244a5f-b82a-baee-262a-7241531036ad@ti.com> <1576503511-27500-1-git-send-email-zhongjiang@huawei.com>
In-Reply-To: <1576503511-27500-1-git-send-email-zhongjiang@huawei.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 16 Dec 2019 13:13:50 -0800
Message-ID: <CALAqxLWAWc6NZDnixWhmHg6BtGHXTy6pZ6GXM0F=SkoYH8DiQw@mail.gmail.com>
Subject: Re: [PATCH v2] dma-heap: Make the symbol 'dma_heap_ioctl_cmds' static
To:     zhong jiang <zhongjiang@huawei.com>
Cc:     "Andrew F. Davis" <afd@ti.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        lkml <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 16, 2019 at 5:43 AM zhong jiang <zhongjiang@huawei.com> wrote:
>
> Fix the following sparse warning.
>
> drivers/dma-buf/dma-heap.c:109:14: warning: symbol 'dma_heap_ioctl_cmds' was not declared. Should it be static?
>
> Signed-off-by: zhong jiang <zhongjiang@huawei.com>
> ---
>  drivers/dma-buf/dma-heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 4f04d10..da2090e 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -106,7 +106,7 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
>         return 0;
>  }
>
> -unsigned int dma_heap_ioctl_cmds[] = {
> +static unsigned int dma_heap_ioctl_cmds[] = {
>         DMA_HEAP_IOC_ALLOC,
>  };

Acked-by: John Stultz <john.stultz@linaro.org>

This patch will collide with Andrew's _IOCTL_ naming change, but its a
fairly simple thing to resolve.

Sumit: If you're comfortable resolving the collision, please queue
with the rest of the recent changes for drm-misc-next.
Otherwise, I'm happy to submit the resolution I tested with here
afterwards. Let me know.

thanks
-john
