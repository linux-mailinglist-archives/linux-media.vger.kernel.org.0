Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 127C922C7B8
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 16:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgGXORY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 10:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgGXORY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 10:17:24 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62724C0619D3;
        Fri, 24 Jul 2020 07:17:24 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id a21so7074299otq.8;
        Fri, 24 Jul 2020 07:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aJ77W7VC0CnaHTOKlpJ2EDWmm2cahJBuCdEmwoD17qU=;
        b=SZPE9yCxR7WrG6Fo2B2u2oUI22IyoJtJqZyEkmNVqWJGnntdt9OjWKCFXQZNUqlSwg
         1RY+9NO9QLqd8BhbSjv7d2yT6F22Fgwl8zt67LqF06tXBN+VrY6e4wf6YB6qIBB/D1Hq
         /eAqazUwyQY8Rs5+VdB7Eb18Rf9262TcWLKHRHpBuxZo399IB7FZBemInr/dE1pSc+eP
         AVbYX6pRSXzgrIc5zlVZ3rftuGchWygZthUZsWim8RcftFZMCkOjLxdcMh96Vntk0d+U
         JXHo8n+L+PGZy+AqImoJCxvRZgIbllXwu6aGmSdFFnBKQuUx4IMyQSr64lsyiIF/vXmn
         hY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aJ77W7VC0CnaHTOKlpJ2EDWmm2cahJBuCdEmwoD17qU=;
        b=Vj3UckrlOZn4e4RHowUP1BKyzdbVwW6AJqfh8yOswc7VkQYa46GrGq8zwRzkcEU/+a
         uVkWbciZs+guL3mFf8LYBi+tx0phkWMB9zkH+XGZceZ/aoN8B6hKJNMStltEqiRETmDM
         hOcHdNJd3tzkUe2NxGL6fQ4vOHeBAwqsAp55Kma+Xlm2RF4Giiewl83CSPx/fPDVaHNl
         3mmV4tzPVg1J9xskNMXr5zx2k2I2zRE92SFrU0hmdwJl5j+Xz66yfm2fP0YtxuRnveTf
         oqIdMTPJyMjxzaWQXbo+Ki6Zp8WmyLhg1uE3+Zg/AwXxrrK+8O8TyWB/c9djZJZjigkZ
         /B2g==
X-Gm-Message-State: AOAM532DUtbE4ZK66vSbC5wHRRFeb8ghKOQD3AvOEEWevs0D+eM8MyVb
        CFNqbtRPUYlphfwdBnNMRTsL3PLG014MPo95Mus=
X-Google-Smtp-Source: ABdhPJxhNtVkYnZ/+BowuavKo7KNnAma7VTzVPnSGK3nZUxq0GAlf5iP/WueQXoZlmk8OEm+7L/wqhbBIm8NKULy0AY=
X-Received: by 2002:a9d:5e18:: with SMTP id d24mr8814609oti.88.1595600243805;
 Fri, 24 Jul 2020 07:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200723170453.432-1-novikov@ispras.ru>
In-Reply-To: <20200723170453.432-1-novikov@ispras.ru>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 24 Jul 2020 15:16:57 +0100
Message-ID: <CA+V-a8uNfscxiM1fMjfdvZstZkkzxW41p40jpBXT3NeyiS9-Qw@mail.gmail.com>
Subject: Re: [PATCH] media: davinci: vpif_capture: fix potential double free
To:     Evgeny Novikov <novikov@ispras.ru>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, ldv-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Evgeny,

Thank you for the patch.

On Thu, Jul 23, 2020 at 6:04 PM Evgeny Novikov <novikov@ispras.ru> wrote:
>
> In case of errors vpif_probe_complete() releases memory for vpif_obj.sd
> and unregisters the V4L2 device. But then this is done again by
> vpif_probe() itself. The patch removes the cleaning from
> vpif_probe_complete().
>
> Found by Linux Driver Verification project (linuxtesting.org).
>
> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
> ---
>  drivers/media/platform/davinci/vpif_capture.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
> index d9ec439faefa..72a0e94e2e21 100644
> --- a/drivers/media/platform/davinci/vpif_capture.c
> +++ b/drivers/media/platform/davinci/vpif_capture.c
> @@ -1482,8 +1482,6 @@ static int vpif_probe_complete(void)
>                 /* Unregister video device */
>                 video_unregister_device(&ch->video_dev);
>         }
> -       kfree(vpif_obj.sd);
> -       v4l2_device_unregister(&vpif_obj.v4l2_dev);
>
vpif_probe_complete() is a async callback and probe() should have
already completed by then.

Cheers,
--Prabhakar

>         return err;
>  }
> --
> 2.16.4
>
