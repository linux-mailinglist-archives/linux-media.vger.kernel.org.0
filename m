Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED12B1A2E17
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 05:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgDID63 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 23:58:29 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40989 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgDID62 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 23:58:28 -0400
Received: by mail-ot1-f67.google.com with SMTP id f52so9121316otf.8
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 20:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FsPlV7xUkpLV6nUKygfRWVpxvFWnNZfwGjmtdPoteHc=;
        b=Lgqu1zBXj4IHJOiruelPRxwd7oO0GjjL4G1muWRtu0rhYHMF6qxpayeyXTzSQiLRXN
         gGVymQ/loctWIenlU3gRr0Egy9KjhMs/pabnVHmiWtlGXL/7Fx7FAmV8uTOfqCGqi9dr
         MH+odGbWZxDI7sAw5CbFdutgajqNVTVNZPvqRjvZ7mkYQ4fCZJggUBb8TAQtH9P5vetS
         mOvfE8k/GeGeFhMD/4PV9d/H+0SKT0W9mBEYlXCLGOE3oI0W9i3oNF5DAyHukZJG6B7R
         VN9yFcBa3FmwrfvhVIoSRByiyRKFsL+fQ5DJplGa7wClP4IVwvFJBwHwQcGuBbdCkPLh
         qxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FsPlV7xUkpLV6nUKygfRWVpxvFWnNZfwGjmtdPoteHc=;
        b=m6X5hKj5YvyuYD22jGId8Jr0ormooxqF5fA7GqoJKB+k1nPCd/0uBAWT+PUl1zKGNA
         4DHWuqSzEsPvYvqY8dTU8V87SvQlrvRiM7uFiHu9iFKWgeluMXP8vjQ/W3XVRK84XWT4
         VNKzaQZMhSmm8wytis6zqFL0zl8qPsEC1d2HXE9qLMwdH/Jp8/U2gdgYaaSKOO7B6OhK
         qbXrkEqlT40w4El1aLBUl4UahqtZI7OHsiEaFf7QGc4YaVPLLPceXQsWSosiwT8G4eFa
         ywUCPCnEmj57/cW5+HgZPTzIi1RCg1WATnATXiSOZnsPusMS/sGuXbyRYJwKMChEG8dc
         tG6w==
X-Gm-Message-State: AGi0PuZXSoeky1stCQehMqSJuAQPAYUgWjT0mrXSCPLYe3zA0HiBrJVA
        s3WMTBj5Lse4rBVaajjzvTHtfZoOIJ4n9yomAJB5ng==
X-Google-Smtp-Source: APiQypJrcx9SA5Bho12teEGNq3eHBnpaPanCdIkscabOeWI4bgsl79g5jr8VaR+luOeX3P7CmHUb511K/67jy0H3QOY=
X-Received: by 2002:a05:6830:22d9:: with SMTP id q25mr7984877otc.164.1586404708132;
 Wed, 08 Apr 2020 20:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200407133002.3486387-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20200407133002.3486387-1-daniel.vetter@ffwll.ch>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Thu, 9 Apr 2020 09:28:16 +0530
Message-ID: <CAO_48GF5jM-L7bqnfvXSvbugAjYsYnE7rGokO7_LWQxHua0=wQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Fix SET_NAME ioctl uapi
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Chenbo Feng <fengc@google.com>,
        Greg Hackmann <ghackmann@google.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        minchan@kernel.org, Suren Baghdasaryan <surenb@google.com>,
        Jenhao Chen <jenhaochen@google.com>,
        Martin Liu <liumartin@google.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for the patch, Daniel!


On Tue, 7 Apr 2020 at 19:00, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> The uapi is the same on 32 and 64 bit, but the number isnt. Everyone
> who botched this please re-read:
>
> https://www.kernel.org/doc/html/v5.4-preprc-cpu/ioctl/botching-up-ioctls.html
>
> Also, the type argument for the ioctl macros is for the type the void
> __user *arg pointer points at, which in this case would be the
> variable-sized char[] of a 0 terminated string. So this was botched in
> more than just the usual ways.

Yes, it shouldn't have passed through the cracks; my apologies!

>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Chenbo Feng <fengc@google.com>
> Cc: Greg Hackmann <ghackmann@google.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: minchan@kernel.org
> Cc: surenb@google.com
> Cc: jenhaochen@google.com
> Cc: Martin Liu <liumartin@google.com>

Martin,
Could I request you to test this one with the 4 combinations of 32-bit
/ 64-bit userspace and kernel, and let us know that all 4 are working
alright? If yes, please consider giving your tested-by here.

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/dma-buf/dma-buf.c    | 3 ++-
>  include/uapi/linux/dma-buf.h | 4 ++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 570c923023e6..1d923b8e4c59 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -388,7 +388,8 @@ static long dma_buf_ioctl(struct file *file,
>
>                 return ret;
>
> -       case DMA_BUF_SET_NAME:
> +       case DMA_BUF_SET_NAME_A:
> +       case DMA_BUF_SET_NAME_B:
>                 return dma_buf_set_name(dmabuf, (const char __user *)arg);
>
>         default:
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index dbc7092e04b5..21dfac815dc0 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -39,6 +39,10 @@ struct dma_buf_sync {
>
>  #define DMA_BUF_BASE           'b'
>  #define DMA_BUF_IOCTL_SYNC     _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
> +/* 32/64bitness of this uapi was botched in android, there's no difference
> + * between them in actual uapi, they're just different numbers. */
>  #define DMA_BUF_SET_NAME       _IOW(DMA_BUF_BASE, 1, const char *)
> +#define DMA_BUF_SET_NAME_A     _IOW(DMA_BUF_BASE, 1, u32)
> +#define DMA_BUF_SET_NAME_B     _IOW(DMA_BUF_BASE, 1, u64)
>
>  #endif
> --
> 2.25.1
>
Best,
Sumit.
