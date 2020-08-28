Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5281255DA0
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 17:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbgH1PSK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 11:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgH1PSH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 11:18:07 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D11C061264
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2020 08:18:05 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id w14so1498374eds.0
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2020 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G2HuvEUb+cEO2pHupijluoyfGx/fDLghw4ohpb9DBko=;
        b=jb1ijdCLU2VqGTwpN0GkyjHGqUuflN+HR4/BGcjzb66XSRn+Ytp+o5R+uI9jaVI4R2
         9RSEibzSDz8xdJwlnB6hpPPjORRY4PJRzwTILSIhD4w6UICFhZBHtSIIJBjVR9zoW2PM
         uZ+/mOvzkFskzNseT4NqsTQS3dg354P+vZfeRHx4PgO1Y2sC1mqGwQEeCNy7jHWt8tYn
         mx8V56Z9DirO+jQxU0NDk6XqjPP38w78n8Fpv4tHgCzZS/vOvEldVaKC677Ub2Uj9lXD
         0MGzJULi8fc6gdkSnt90+vIumP9L7xRnjouVx3J77tQhFF3F58cH3RiT+dzQ9XGSCOGk
         1j7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G2HuvEUb+cEO2pHupijluoyfGx/fDLghw4ohpb9DBko=;
        b=ZeGuovmWGH7teg59SedAUsbs9HsK0q94ZFvTs6HWFdXBXGrEPzOQWkX+S7o/Yx4KRV
         dW0iolPfOe41NP8pTX89IqGP/7atBXYT7UK+IcXAwGymogXfCC+z9yGCl0Omi2B7nX5W
         mimL163dCXJ/vsiPhSHqMCC1+ZskaVUiHgyaHuciJFcQ03BFpXx1t+hrFCFH5saW9xci
         avWx5dezZbUBfZbSf3PHHQ15blZ6ZMu8GYLijpApTFgLGJGe6D+Qb7k6CdueAiKL3ROk
         Lla4MWV4BLPGydRPGGlf19Te5COUT9cS/cZCMNs/pK/EjqwCQO/YnrVlDJGTqLYthCta
         EA9w==
X-Gm-Message-State: AOAM533QYslDwB5/rzArkxq1ucfKikOjfKPqLnsIOZ8a0TaSxvNYJbiK
        Lm4KxEz7XGQuUHxHxoNwXj9r24/+iZLXkmz/TpwK2g==
X-Google-Smtp-Source: ABdhPJwPUV40y51nfan2Zoya5MFLcYsyf0FR6v1BLFghZ9inuwW3rmGdjDhvNrFEW+FxEApYffCxtZ1fBfvNSG6+5eI=
X-Received: by 2002:a50:cd15:: with SMTP id z21mr2430176edi.362.1598627884419;
 Fri, 28 Aug 2020 08:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200827124946.328700-1-gnurou@gmail.com> <20200827124946.328700-2-gnurou@gmail.com>
In-Reply-To: <20200827124946.328700-2-gnurou@gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Fri, 28 Aug 2020 12:17:53 -0300
Message-ID: <CAAEAJfAqB2WAuWd4KKdhxp2=64n=hxkESrzGeBj1KN+Otz7mmg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: v4l2-mem2mem: always consider OUTPUT queue
 during poll
To:     Alexandre Courbot <gnurou@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 27 Aug 2020 at 09:50, Alexandre Courbot <gnurou@gmail.com> wrote:
>
> If poll() is called on a m2m device with the EPOLLOUT event after the
> last buffer of the CAPTURE queue is dequeued, any buffer available on
> OUTPUT queue will never be signaled because v4l2_m2m_poll_for_data()
> starts by checking whether dst_q->last_buffer_dequeued is set and
> returns EPOLLIN in this case, without looking at the state of the OUTPUT
> queue.
>
> Fix this by not early returning so we keep checking the state of the
> OUTPUT queue afterwards.
>
> Signed-off-by: Alexandre Courbot <gnurou@gmail.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index 95a8f2dc5341d..fe90c3c0e4128 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -868,10 +868,8 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
>                  * If the last buffer was dequeued from the capture queue,
>                  * return immediately. DQBUF will return -EPIPE.
>                  */
> -               if (dst_q->last_buffer_dequeued) {
> -                       spin_unlock_irqrestore(&dst_q->done_lock, flags);
> -                       return EPOLLIN | EPOLLRDNORM;
> -               }
> +               if (dst_q->last_buffer_dequeued)
> +                       rc |= EPOLLIN | EPOLLRDNORM;
>         }
>         spin_unlock_irqrestore(&dst_q->done_lock, flags);
>
> --
> 2.28.0
>
