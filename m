Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1171AC1EB
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 14:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894667AbgDPM71 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 08:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2894447AbgDPM7X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 08:59:23 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A375FC061A0F
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2020 05:59:23 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id n17so1206267ejh.7
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2020 05:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pqocv/eXd8agG6oQNiPQwe8tU9LueQq90txyZdBuL44=;
        b=NmuMt05wm0nh5pDYjx6jFJ0hyrfOZRfh4rtC8/XsvZETXclm+D/BaNlRZO9BveAbGR
         lXujA2tdsIMCv//33DS0v39tE/BzDr4ZuQktKV6XBouxm5jSWRR0MgXI5g0fLvBuM0kY
         rL0gOwH+/35QQdDIXLEQ/WSZu7csyiz8qW56jw3APfWNuySnek1cPaq7Y3BVw8l48kLb
         BSUDgOE0zeqFY3UBi6DU/xrARIijIXQTtneZdeRg3U1OSxDp+WUatnUACvILY5GawGPG
         c1S9G8rt9VQaJGndxGxdtwhZ3i7RLa0UyrBd1u501/qqb8BCZNa/viQTVy9VHUq3Zz8M
         P5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pqocv/eXd8agG6oQNiPQwe8tU9LueQq90txyZdBuL44=;
        b=jBbgBngq3T3TODQ31RiqQn2EG1Yu9JxLYFKA+5KwFOQA67M63cFk8Nkcsovxrq5i3R
         2r8uHyiWQ/cv2XR0tAXE901hUze4pn/k2/HmeMhKRa59FI+Degx33tM6ZjyYiuDd8XiO
         A8bwHEOEhYPnn9HeFwPND+j/8b+MHsfZsI9dOgK/hNpi1R+orweM47QOYEUhV83AJ335
         a8vNrt6UdzHgIVpzh3/l71JqtQoOA6VZfQamLY1ERTwo2R/Vjq0hGstbJk3ce2TBKTxw
         UJnThuHk6MBZlKA4latjY/DNqdh2Ca/VTP2xcSWfQSz4dzRDWYOzM8QOYhicjWwIUucT
         ZCYg==
X-Gm-Message-State: AGi0PubT1FprG5eZYSHPBFKJdkygg5kgugBDM5+rwx80zJlv96stt5Q1
        tcrf6Tlwc7FS6nj/x5FFG8oE2qvl3XDs+bYaxKV95g==
X-Google-Smtp-Source: APiQypJZ8a9Xj0AcqhtwU+4h7TWpCu2z8o/G+gdZiRVW5tZY0fxY1YqboCEkjK1ptgUJPvQE71pdnqe4P0py81bICVY=
X-Received: by 2002:a17:906:af6f:: with SMTP id os15mr9748919ejb.78.1587041962281;
 Thu, 16 Apr 2020 05:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200410103501.1083-1-sergey.senozhatsky@gmail.com>
In-Reply-To: <20200410103501.1083-1-sergey.senozhatsky@gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Thu, 16 Apr 2020 09:59:10 -0300
Message-ID: <CAAEAJfCyWpNy-Ckn+6fdzUTFiDr5RqYD4V5BgUviRRBxr=ggBQ@mail.gmail.com>
Subject: Re: [RFC][PATCH] media: v4l2-ctrls: add more NULL pointer checks
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey,

Thanks for the patch!

On Fri, 10 Apr 2020 at 07:35, Sergey Senozhatsky
<sergey.senozhatsky@gmail.com> wrote:
>
> A number of v4l2-ctrls functions gracefully handle NULL ctrl pointers,
> for instance, v4l2_g_ctrl(), v4l2_ctrl_activate(), __v4l2_ctrl_grab()

Please note that v4l2_g_ctrl doesn't really handle
a NULL ctrl parameter, because it doesn't have a ctrl
parameter :-)

Checking the return of a function such as v4l2_ctrl_find,
is not the same as defensive-style parameter checking.

And the thing is, the kernel doesn't really do defensive checking
like this on internal APIs, unless there are good reasons
allowing a NULL parameter, such as kfree.

Now, maybe this is the case, maybe it should be possible
to add controls without checking the result, or to allow
calling the control API with a NULL ctrl.

Quite frankly, I'm not convinced of this being the case,
or just a quirk of the vivid driver.

In any case...

> to name a few. But not all of them. It is relatively easy to crash the
> kernel with the NULL pointer dereference:
>
>         # modprobe vivid node_types=0x60000
>         $ v4l2-compliance
>
> BUG: kernel NULL pointer dereference, address: 0000000000000020
> PF: supervisor read access in kernel mode
> PF: error_code(0x0000) - not-present page
> PGD 0 P4D 0
> Oops: 0000 [#1] SMP PTI
> RIP: 0010:v4l2_ctrl_s_ctrl.isra.0+0x4/0x30 [vivid]
> Call Trace:
>  vidioc_s_input.cold+0x1a8/0x38d [vivid]
>  __video_do_ioctl+0x372/0x3a0 [videodev]
>  ? v4l_enumstd+0x20/0x20 [videodev]
>  ? v4l_enumstd+0x20/0x20 [videodev]
>  video_usercopy+0x1cb/0x450 [videodev]
>  v4l2_ioctl+0x3f/0x50 [videodev]
>  ksys_ioctl+0x3f1/0x7e0
>  ? vfs_write+0x1c4/0x1f0
>  __x64_sys_ioctl+0x11/0x20
>  do_syscall_64+0x49/0x2c0
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>
> vivid driver crashes the kernel in various places, for instance,
>
>         v4l2_ctrl_modify_range(dev->brightness, ...);
> or
>         v4l2_ctrl_s_ctrl(dev->brightness, ...);
>
> because ->brightness (and quite likely some more controls) is NULL.
> While we may fix the vivid driver, it would be safer to fix core
> API. This patch adds more NULL pointer checks to ctrl API.
>
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 22 ++++++++++++++++-
>  include/media/v4l2-ctrls.h           | 37 ++++++++++++++++++++++++++--
>  2 files changed, 56 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 93d33d1db4e8..02a60f67c2ee 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -2869,6 +2869,9 @@ EXPORT_SYMBOL(v4l2_ctrl_add_handler);
>
>  bool v4l2_ctrl_radio_filter(const struct v4l2_ctrl *ctrl)
>  {
> +       if (WARN_ON(!ctrl))
> +               return false;
> +

.. don't think this is needed, as it's always called via v4l2_ctrl_add_handler
which guarantess a non-NULL pointer.

Thanks!
Ezequiel
