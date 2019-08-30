Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6145AA3424
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 11:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfH3Jis (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Aug 2019 05:38:48 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45059 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbfH3Jis (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 05:38:48 -0400
Received: by mail-oi1-f194.google.com with SMTP id v12so4838266oic.12
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2019 02:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hfIr0oG7zkjfTylZRL1EmDdcoClxx4OzN+k3Fa69QOk=;
        b=JZSzfjCV+OzEP0NKiy064AMNbZCphzNNPFXwQYxpUoxKno8taFSuAONsfm81PEzvhQ
         qaCbe4ObT5UHEJBtWQSMdiRygC0gFb4piQ27RfDvbgjt1MFHx4FUZYcXKDJ16XhUnr/e
         s1OWlBpt4sKcZVLl+qYpSVUn0vbanGsamHLos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hfIr0oG7zkjfTylZRL1EmDdcoClxx4OzN+k3Fa69QOk=;
        b=PRAOp+yy5o6AleLVFLvyAjwwRBp0j5NLo66+Y+b+welDWnrOmzyPjWu2BaiDTerAfS
         qEKkkCM1IdE5i0Rl0nndxDHa3E8vUlmt/RPs81ty3uV79WMNOJI9ezHBiR1lcgmOsXLy
         3dwCHt0oqEaHUZQQil9BjhFZYiNH+0SOLiSq9UMpAvZLUA32Ls0hP72gRlTryZ95dBPK
         8HSJVyP6zYvvYpXNh+iqnZYXSy+F/s6P7vK6QG5nCyvPzDgRYXAYAv4tHr+222oKafSG
         Atqpoc9p1te/a5j7Dnc5MJQq6HU+6U0Dh7sGkyylbZn+6OpnLYg4h77I3axsVzIb5mE/
         1+Cg==
X-Gm-Message-State: APjAAAUBfomlaZocMUjMJv2ZxPW7S/j7b+XfS0HaBvM3ZvMpoLD3rtAU
        6Ffq2vfJGajDpIz4dMOJbzJ1NOSD0fw=
X-Google-Smtp-Source: APXvYqxhFjVX5XxEEY0Uc2zv/8tQ6REqg/P4sw4eNUwRzi6WR6GEur7/IuxikdoDBWqUHtht78mTqQ==
X-Received: by 2002:aca:3158:: with SMTP id x85mr9170698oix.93.1567157926644;
        Fri, 30 Aug 2019 02:38:46 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id e2sm1780879otl.67.2019.08.30.02.38.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2019 02:38:45 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id z17so6294982otk.13
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2019 02:38:45 -0700 (PDT)
X-Received: by 2002:a9d:c67:: with SMTP id 94mr11849012otr.33.1567157924626;
 Fri, 30 Aug 2019 02:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190822194500.2071-1-jernej.skrabec@siol.net> <20190822194500.2071-3-jernej.skrabec@siol.net>
In-Reply-To: <20190822194500.2071-3-jernej.skrabec@siol.net>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 30 Aug 2019 18:38:32 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUChtZcNSTa2uT50k6uPU9T68wofLYGUFRJntDhjH8+iw@mail.gmail.com>
Message-ID: <CAPBb6MUChtZcNSTa2uT50k6uPU9T68wofLYGUFRJntDhjH8+iw@mail.gmail.com>
Subject: Re: [PATCH 2/8] videodev2.h: add V4L2_DEC_CMD_FLUSH
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, Chen-Yu Tsai <wens@csie.org>,
        gregkh@linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        Ezequiel Garcia <ezequiel@collabora.com>, jonas@kwiboo.se
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 23, 2019 at 4:45 AM Jernej Skrabec <jernej.skrabec@siol.net> wrote:
>
> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>
> Add this new V4L2_DEC_CMD_FLUSH decoder command and document it.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst | 11 ++++++++++-
>  Documentation/media/videodev2.h.rst.exceptions      |  1 +
>  include/uapi/linux/videodev2.h                      |  1 +
>  3 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
> index 57f0066f4cff..0bffef6058f7 100644
> --- a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
> @@ -208,7 +208,16 @@ introduced in Linux 3.3. They are, however, mandatory for stateful mem2mem decod
>         been started yet, the driver will return an ``EPERM`` error code. When
>         the decoder is already running, this command does nothing. No
>         flags are defined for this command.
> -
> +    * - ``V4L2_DEC_CMD_FLUSH``
> +      - 4
> +      - Flush any held capture buffers. Only valid for stateless decoders,
> +        and only if ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` was set.
> +       This command is typically used when the application reached the
> +       end of the stream and the last output buffer had the
> +       ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag set. This would prevent
> +       dequeueing the last capture buffer containing the last decoded frame.
> +       So this command can be used to explicitly flush that last decoded
> +       frame.

Just for safety, can we also specify that it is valid to call this
command even if no buffer was held (in which case it is a no-op), as
this can help make user-space code simpler?

>
>  Return Value
>  ============
> diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
> index adeb6b7a15cb..a79028e4d929 100644
> --- a/Documentation/media/videodev2.h.rst.exceptions
> +++ b/Documentation/media/videodev2.h.rst.exceptions
> @@ -434,6 +434,7 @@ replace define V4L2_DEC_CMD_START decoder-cmds
>  replace define V4L2_DEC_CMD_STOP decoder-cmds
>  replace define V4L2_DEC_CMD_PAUSE decoder-cmds
>  replace define V4L2_DEC_CMD_RESUME decoder-cmds
> +replace define V4L2_DEC_CMD_FLUSH decoder-cmds
>
>  replace define V4L2_DEC_CMD_START_MUTE_AUDIO decoder-cmds
>  replace define V4L2_DEC_CMD_PAUSE_TO_BLACK decoder-cmds
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 4fa9f543742d..91a79e16089c 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1978,6 +1978,7 @@ struct v4l2_encoder_cmd {
>  #define V4L2_DEC_CMD_STOP        (1)
>  #define V4L2_DEC_CMD_PAUSE       (2)
>  #define V4L2_DEC_CMD_RESUME      (3)
> +#define V4L2_DEC_CMD_FLUSH       (4)
>
>  /* Flags for V4L2_DEC_CMD_START */
>  #define V4L2_DEC_CMD_START_MUTE_AUDIO  (1 << 0)
> --
> 2.22.1
>
