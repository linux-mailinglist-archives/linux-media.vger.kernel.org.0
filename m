Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3E29C0CA6
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 22:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727243AbfI0Ud4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 16:33:56 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46389 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfI0Ud4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 16:33:56 -0400
Received: by mail-oi1-f195.google.com with SMTP id k25so6277584oiw.13;
        Fri, 27 Sep 2019 13:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KwQqUKwfYvMR0bOzWClRV+K1hIwPyt4XhIMj6/901J4=;
        b=Ik7ZBlY60EXvU5r5UbYDErhTPJ50/39lYOc2n2i99wHzeiUFivqDAu/I1wyHZzC5jB
         XVvbiV/FMFVSgV8LMhLi8Pd3BHWsZdqAhF1GhFiELSXWBOXQ4IUZVh5yqX5nZXarUYR7
         mOwKf530o2JyzW1KbWrToS4H9OWHKFA/lEizgixMyijHjFm61g0r84taQNRqnzoxTGEM
         WYnuozS7fCsgUnxlVUW50OiFbCGGe0pDZa32IAdYLyRyQhyCUg3TARwBakWBQfIIo9Sd
         IS73WjQQAyKYZ4LAdfmx6b1hIaUmFlogopKAleEe6ltDrxc4baKdi9ws3an5f1JwqvDc
         FzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KwQqUKwfYvMR0bOzWClRV+K1hIwPyt4XhIMj6/901J4=;
        b=XlbMl1cdc7J6Ra4IjXKF1WNcBpjWIXUb7oH5981gx2UAgaIJTqN0/YQd5JDmLhcbuL
         UdDSoOCOIaTbAXgz7PH/5MzrMCNyKHlHJrsOmgDFWmEs6MUprlMjp1nuahPajFysUNog
         kvFs/VHPiuSBEBJ+8P/2YRualXWnSWxyNY69COiFnV/KYIOWLADbxCLmFFMzWgg+nPrC
         UEVSJi7Gn5wY0sTkkdbN6U82jkFdp5p5OQuD1sDx3qbg7NTxki3C8cFzICAJcRqa/t2x
         jH/35Tkl9QXlAsWw0Mqenrti4a9AU606uwfPOakUhG13KkMeww3vUxF20whCkYF1TeLy
         NZcA==
X-Gm-Message-State: APjAAAXrLAjgWvVSZzEMuDwJ4Q5+1/TdKfK2I0RWzmcGiMcKipN1UFpU
        NlymPWK+aIDzPd+ZOuALw/nlt0B1d9MzYs4Q3dw=
X-Google-Smtp-Source: APXvYqzxtkXdEmWpB1LUva+6xNG3OnkuD3Sp+h13rFA/JvyQfKSUnxq5AFmZ7G/EKj0/qxqVmQ4OpmEpiy4qhHxh/jw=
X-Received: by 2002:aca:d485:: with SMTP id l127mr8327733oig.162.1569616434959;
 Fri, 27 Sep 2019 13:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190927184722.31989-1-bparrot@ti.com> <20190927184722.31989-5-bparrot@ti.com>
In-Reply-To: <20190927184722.31989-5-bparrot@ti.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 27 Sep 2019 21:33:28 +0100
Message-ID: <CA+V-a8t3h6+2a8QWKWNwROJRz546rGbUyXs5ez9wtH6AQ-euPA@mail.gmail.com>
Subject: Re: [Patch v4 4/8] media: i2c: ov2659: fix s_stream return value
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

thank you for the patch.

On Fri, Sep 27, 2019 at 7:46 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> In ov2659_s_stream() return value for invoked function should be checked
> and propagated.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/i2c/ov2659.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index f77320e8a60d..cd4625432264 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -1187,10 +1187,13 @@ static int ov2659_s_stream(struct v4l2_subdev *sd, int on)
>                 goto unlock;
>         }
>
> -       ov2659_set_pixel_clock(ov2659);
> -       ov2659_set_frame_size(ov2659);
> -       ov2659_set_format(ov2659);
> -       ov2659_set_streaming(ov2659, 1);
> +       ret = ov2659_set_pixel_clock(ov2659);
> +       if (!ret)
> +               ret = ov2659_set_frame_size(ov2659);
> +       if (!ret)
> +               ret = ov2659_set_format(ov2659);
> +       if (!ret)
> +               ov2659_set_streaming(ov2659, 1);
>         ov2659->streaming = on;
>
the "ov2659->streaming = on;" should only be set if above calls
succeed, otherwise we might hit -EBUSY during set_fmt.

Cheers,
--Prabhakar Lad

>  unlock:
> --
> 2.17.1
>
