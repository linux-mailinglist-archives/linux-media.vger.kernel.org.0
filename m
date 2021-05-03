Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C36B371542
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 14:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233628AbhECMbZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 08:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhECMbX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 May 2021 08:31:23 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC9BC06174A;
        Mon,  3 May 2021 05:30:29 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id r8so7245434ybb.9;
        Mon, 03 May 2021 05:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=an6evm4pvxilSxn0BHsmQe9q8Xi69XxZyMDxgmRiPNQ=;
        b=Vf5CyRuiYCL3/Igc9K9MqyA7/cXFENaM3Rqr9kSplUPS+TPEUzXHXZxAlxS+uYXgQb
         UEFpo3NKvHlyeZCINHjEvCLTmBIYUk9NgXTvbpTUjZZpUeZwgsabxK3IXi9hUPqnBo4g
         llkBKUpoYUXFm3RPT3uRkce1XbGAANdjAYbor7hIHeaPlNT2xiCoRt4U1fUuiuBUl8V1
         qe7N7qeVcUS5C1cfoB7ay+uecZtCYqM0KrTmEcMsgmECZjEfDbadcDbX440gM2q28y5r
         MD7OzSOGx8FzaB5Edh1npSzK/KE//tTU0KTsCbUTVLHH1BzMgLL07MqJc0FOH/4JhhdY
         gGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=an6evm4pvxilSxn0BHsmQe9q8Xi69XxZyMDxgmRiPNQ=;
        b=ZeRT7JRU7jozCoo6ebvABxXzhZZpdJyNLn1vAEGuqNzbuWhHpm1BrAhcPdaQg0HtAl
         NlFtlI/l74G1taL1luXpFUp1Q3YVKfw+4F41qw8ltzgz3Jr5qn33t7grz7D0aMG8Fonp
         RS//vD5yvGzfbX546ui2IAXqRGvMvycq/0yLVIiy6vxF3/sJsXoQNKKtYq3+Yfp8Cd5T
         eYXsEGELwRllO3SklWFS4YW+9+K+npRuUNjhiBb2bziuZrL6lwLo35sfb7B0YrhEkMjF
         PUUAQV/84IQ9FWt8ShROs0zIdyLXqRO9E6tdz3pY1gv5b2iFqH8sewSCz+DlKaYzWi01
         hu2Q==
X-Gm-Message-State: AOAM533726zy/7aFF8ovIxdD/UCBEb17eHRRevZ8t4V7QZvmaBvKiIuJ
        +zhFMbIzaJJ8At/l28dEwKJL+3fM+P9gIHPppX4=
X-Google-Smtp-Source: ABdhPJwqGuWE9LmZG2VDV5f5DcY1xIy0GIAeNwFOT9TLj/pjPkUkcxSw+qGyaYfLM9iaAq0I1ukqXczvkYYUrH6iVg4=
X-Received: by 2002:a25:2702:: with SMTP id n2mr26635261ybn.179.1620045028921;
 Mon, 03 May 2021 05:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619621413.git.mchehab+huawei@kernel.org> <05a26c6f0f7798e9bc7a04845b3e3f32d9fcb659.1619621413.git.mchehab+huawei@kernel.org>
In-Reply-To: <05a26c6f0f7798e9bc7a04845b3e3f32d9fcb659.1619621413.git.mchehab+huawei@kernel.org>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 3 May 2021 13:30:02 +0100
Message-ID: <CA+V-a8t_ELh7zxXV8WJgg66uY7wawwPmNaxjGGquNPZkuwK99Q@mail.gmail.com>
Subject: Re: [PATCH v4 43/79] media: i2c: ov2659: use pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thank you for the patch.

On Wed, Apr 28, 2021 at 3:52 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
>
> Use the new API, in order to cleanup the error check logic.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/i2c/ov2659.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
Acked-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index 42f64175a6df..a3c8eae68486 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -1186,11 +1186,9 @@ static int ov2659_s_stream(struct v4l2_subdev *sd, int on)
>                 goto unlock;
>         }
>
> -       ret = pm_runtime_get_sync(&client->dev);
> -       if (ret < 0) {
> -               pm_runtime_put_noidle(&client->dev);
> +       ret = pm_runtime_resume_and_get(&client->dev);
> +       if (ret < 0)
>                 goto unlock;
> -       }
>
>         ret = ov2659_init(sd, 0);
>         if (!ret)
> --
> 2.30.2
>
