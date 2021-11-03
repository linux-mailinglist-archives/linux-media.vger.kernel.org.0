Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89CA4443B1D
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 02:47:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbhKCBtu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 21:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbhKCBtt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 21:49:49 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF16C061714;
        Tue,  2 Nov 2021 18:47:13 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id b17so1096406qvl.9;
        Tue, 02 Nov 2021 18:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iIfhELKBA59uYTnqWLZdOTQFhHkJ8JIZdnz4Zyo8KZw=;
        b=SMxYX+FjngAizwzwGf0p+JkubhUWAXjRGqDCq5xJ87DyiD+8mXCwqkH/x3YfF5f29A
         xevwGdPchS1Fi5DrS3aexlrF5yG9gmA/jq6IJ1EjgqIBOD1whwOwinm0pghiUuVjdAP6
         GKfcbgfSk7Xuh4KzSSzrACWz11mURursOpVtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iIfhELKBA59uYTnqWLZdOTQFhHkJ8JIZdnz4Zyo8KZw=;
        b=h0iqtE5ZmOgHyMLVxYtuwnoHwxjrVFp+p1QU7bIwNN8+6V8ix5w7HZCk7XkdE0Gh5q
         3Oh6BJKn5/QlPiIXwIfVXkNwlnnPJyKufdPJqZPp9MOagwxVQH1i8EADvJUHWcuSs30D
         6JNmNRWlnKGivXJ9PQilLrhtXU5s4inoQWEL21qTsVBDWit82+f3/XiJBzQRA4DJCaTL
         fpxiWmkm/ipgAHDXDIskqs/k0XgSXUqswQL+jfKntjEaYVNaYkXhLA+OlCSKW6O7AYBW
         LJOB7CWEcLsFL5SM2BE6slTmcbB8nC+HgPnGU+ESpiTC0RoAUJNe2B4aP4vCxDCGiSLU
         8RiA==
X-Gm-Message-State: AOAM530jOP9cG5KkjXW4cbV+6B6tJIQyIHZuE1mIFsymlhQyVdgTV7Wm
        Vm+c8RjLOaMQC0NnqUnYViQ/wXtF+yNaXV8yOlQ=
X-Google-Smtp-Source: ABdhPJxWUZEryVqXcBikybAoLyADEf6kRUtBPv82PFH52VOA75zBpO5PHr7kAAXN7A+FwtfuY0PHMm74kIpUVbkNYTQ=
X-Received: by 2002:a05:6214:5002:: with SMTP id jo2mr39450110qvb.27.1635904032986;
 Tue, 02 Nov 2021 18:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211103011357.22067-1-jammy_huang@aspeedtech.com>
In-Reply-To: <20211103011357.22067-1-jammy_huang@aspeedtech.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 3 Nov 2021 01:47:01 +0000
Message-ID: <CACPK8XcuhVVvbs4m5k=1d6oFiewEo2RqqOqf5R72KJ4yjiEiUw@mail.gmail.com>
Subject: Re: [PATCH v2] media: aspeed: fix mode-detect always time out at 2nd run
To:     Jammy Huang <jammy_huang@aspeedtech.com>
Cc:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 3 Nov 2021 at 01:13, Jammy Huang <jammy_huang@aspeedtech.com> wrote:
>
> aspeed_video_get_resolution() will try to do res-detect again if the
> timing got in last try is invalid. But it will always time out because
> VE_SEQ_CTRL_TRIG_MODE_DET is only cleared after 1st mode-detect.
>
> To fix the problem, just clear VE_SEQ_CTRL_TRIG_MODE_DET before setting
> it in aspeed_video_enable_mode_detect().
>
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
> v2:
>   - update commit message
> ---
>  drivers/media/platform/aspeed-video.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 5ffbabf884eb..fea5e4d0927e 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -518,6 +518,10 @@ static void aspeed_video_enable_mode_detect(struct aspeed_video *video)
>         aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
>                             VE_INTERRUPT_MODE_DETECT);
>
> +       /* Disable mode detect in order to re-trigger */
> +       aspeed_video_update(video, VE_SEQ_CTRL,
> +                           VE_SEQ_CTRL_TRIG_MODE_DET, 0);
> +
>         /* Trigger mode detect */
>         aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_TRIG_MODE_DET);
>  }
> @@ -809,10 +813,6 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
>                         return;
>                 }
>
> -               /* Disable mode detect in order to re-trigger */
> -               aspeed_video_update(video, VE_SEQ_CTRL,
> -                                   VE_SEQ_CTRL_TRIG_MODE_DET, 0);
> -
>                 aspeed_video_check_and_set_polarity(video);
>
>                 aspeed_video_enable_mode_detect(video);
> --
> 2.25.1
>
