Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28CFE38F9E6
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 07:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhEYF2s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 01:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbhEYF2p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 01:28:45 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9153C061574;
        Mon, 24 May 2021 22:27:13 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id z1so27165631ils.0;
        Mon, 24 May 2021 22:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8bFyhZoFnSEldE3f1E0VK0YgkI0W8XPc7z9v6abT0NM=;
        b=TOvGGUb7gEP5qcYDgvYGCzgB90TpnlIHF7yPbTTrkNZ40FQBFYyTWnk8M45GAOl6wZ
         oc59LU5eTYuCGdB6jA89xpMgouHGrzHT/d56ajL4tU0FB7DNZRqKK611d3htX1noeZcf
         m8dPFcr0XKuaoZLJfcJ2yhv8ZZcfvTLVQSMWffa7+SxlYProLHv51nZi/zzaq903Unoq
         tHoO1g+nkhx4d1GFvATFQMjgMX8ShgI8QUJU+uZM5Gt01BEsHnt6AEYzIZ30RGfaLt7T
         oWmblQDAQyUYw90a1NbAxRfZtEchXaUeaNUofXoMjNsaHIvKEJg+z8tglmEZ5gGZwdf8
         aC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8bFyhZoFnSEldE3f1E0VK0YgkI0W8XPc7z9v6abT0NM=;
        b=LP/l6ugs2Nt5N0jOlmfx4n1r4tINu54/zJXBeggb78UvroMKcEW+b10gIToqsZJfRB
         5zPKjXberqhXHwds9LGkpO/jxpHPmM+yQhgd8YP1Bs11Iq3d17lAa/AAsqnG1K3s/2TB
         KglyMI4oJJGc464VF6Xff6EYjoqr/a/AG1Wg8TCmv7zOwE1NlEcA0Rl53oWrjhxWD2Nm
         cQtJgg5lS0RZnva+1f20zPaduOpVBdWNxyI2263fAn/llUByQaR17wowrwWTwEfIV4C0
         HhYeku7Y0dYUbjGW4ZQqMFALonO//Rcu5m5ur/qHGBt6r9sFvhLz6gj4d25Ype/kK5S6
         nwfQ==
X-Gm-Message-State: AOAM531m18U1UxFTDhYFardoMv5tJiA6rZJFEqR09yTnbDZhPpNqTcpJ
        R3K7bEJBZKp88jbMl3ZTduNIVlzLEaNMlRKrYRk=
X-Google-Smtp-Source: ABdhPJxS3zdsbtVkjyh9Yd5A4gEOYvVinc9cmvRC9f2XeiZV22CRYBzpe5xovg/AemJauv7Vf9Oy3XgQ6/r47/32mJo=
X-Received: by 2002:a92:c5b4:: with SMTP id r20mr5048594ilt.200.1621920432845;
 Mon, 24 May 2021 22:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <1620706164-28856-1-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1620706164-28856-1-git-send-email-dillon.minfei@gmail.com>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Tue, 25 May 2021 13:26:37 +0800
Message-ID: <CAL9mu0JOWU7+ORdGMSU1BhMa1DqEN75yRqDycKR04FwTNEzMig@mail.gmail.com>
Subject: Re: [PATCH] media: s5p-g2d: Fix a memory leak on ctx->fh.m2m_ctx
To:     mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
        a.hajda@samsung.com
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just a kind ping.

Thanks.
Dillon,

On Tue, May 11, 2021 at 12:09 PM <dillon.minfei@gmail.com> wrote:
>
> From: Dillon Min <dillon.minfei@gmail.com>
>
> The m2m_ctx resources was allocated by v4l2_m2m_ctx_init() in g2d_open()
> should be freed from g2d_release() when it's not used.
>
> Fix it
>
> Fixes: 918847341af0 ("[media] v4l: add G2D driver for s5p device family")
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> ---
>  drivers/media/platform/s5p-g2d/g2d.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/s5p-g2d/g2d.c b/drivers/media/platform/s5p-g2d/g2d.c
> index 15bcb7f6e113..0818fdd3e984 100644
> --- a/drivers/media/platform/s5p-g2d/g2d.c
> +++ b/drivers/media/platform/s5p-g2d/g2d.c
> @@ -279,6 +279,9 @@ static int g2d_release(struct file *file)
>         v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>         v4l2_fh_del(&ctx->fh);
>         v4l2_fh_exit(&ctx->fh);
> +       mutex_lock(&dev->mutex);
> +       v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +       mutex_unlock(&dev->mutex);
>         kfree(ctx);
>         v4l2_info(&dev->v4l2_dev, "instance closed\n");
>         return 0;
> --
> 2.7.4
>
