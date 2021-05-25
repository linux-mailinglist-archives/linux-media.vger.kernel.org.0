Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C37C238FC35
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 10:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232179AbhEYIJz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 04:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232035AbhEYIJN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 04:09:13 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B4EC061344
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 01:06:51 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id s6so34984412edu.10
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 01:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bd88TalnqZ3LuY6/Du24s6lZTeOXLy91wdCf8bz37vI=;
        b=VxaQezS2eXZGJC806EUOiml4bqh6+BZ2t6g1CV6E9uZsWy3JBsCa1x5hXGdJ0fm6ra
         MhKSl75VS6vcuI9YzVq1Ctwpoz/a8/vbmN3Mk7CcSgWyQ3lmVPceZmeVUJzxsEsj5Kc6
         RK6gH1XjcsNMC4SjRa3U7vCO2Woo9yuryB/Ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bd88TalnqZ3LuY6/Du24s6lZTeOXLy91wdCf8bz37vI=;
        b=mnRpBtd/j4+xll1bwUfZLvuo9L0GzDbpE7+/v0Y+3g1Fu9fQILqDWp/HVwaNfq3wry
         wYvPE1HSWivKmuuBjt+5JmNlwKbRjp/bI1B44V66tqSDImdASgsC+qhlgHCl02mT9viB
         GdZZ8HgLF7maDUFBKKvf6MrOLphgyqi3/P671oGs+kKtk6jPoRbLKE5le+i5b5P9o17z
         O30ol+6Vfm8XwkW8YQi4nz+JRxoDa8iu73Yw1+WtKCPI4gDIRoAfucahyfiWO3uizfLK
         /IN5m7qU0b5ZpF+jj/B5DOd8qIAleaFXuakF3eJ7qr7YMz9gBpYD/bSkvWp8fnDQ7pBM
         TYUQ==
X-Gm-Message-State: AOAM5311ZojHH1bkjTPkFrs81/BILkXGu+m5yPCtzcVre7T7ZW2qb+wy
        C0Y4jTSzkX334RzjiZstLgzzezPR1HL2eQ==
X-Google-Smtp-Source: ABdhPJwHiwG6f/1narl3+rp9PXgT/OBmRSn3Y9+gsREuHwPcErV3UBzl1EvKXxcQ4ef+7QcUjRvUQw==
X-Received: by 2002:aa7:d786:: with SMTP id s6mr29933040edq.239.1621930009531;
        Tue, 25 May 2021 01:06:49 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id a22sm9717087edu.39.2021.05.25.01.06.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 01:06:48 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id n2so31228328wrm.0
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 01:06:47 -0700 (PDT)
X-Received: by 2002:a5d:4385:: with SMTP id i5mr26095922wrq.192.1621930007302;
 Tue, 25 May 2021 01:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210326095840.364424-1-ribalda@chromium.org>
In-Reply-To: <20210326095840.364424-1-ribalda@chromium.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 25 May 2021 17:06:35 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AegMJCrcV7Qpb0oUQLjSiDa+Q7=ojrZs+z+WDSwLq6Ng@mail.gmail.com>
Message-ID: <CAAFQd5AegMJCrcV7Qpb0oUQLjSiDa+Q7=ojrZs+z+WDSwLq6Ng@mail.gmail.com>
Subject: Re: [PATCH v9 00/22] uvcvideo: Fix v4l2-compliance errors
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

On Fri, Mar 26, 2021 at 6:58 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> *v4l2-compliance -m /dev/media0 -a -f
> Total for uvcvideo device /dev/media0: 8, Succeeded: 6, Failed: 2, Warnings: 0
> Total for uvcvideo device /dev/video0: 54, Succeeded: 50, Failed: 4, Warnings: 2
> Total for uvcvideo device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0
> Grand Total for uvcvideo device /dev/media0: 108, Succeeded: 102,
> Failed: 6, Warnings: 2
>
> After fixing all of them we go down to:
>
> Total for uvcvideo device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
> Total for uvcvideo device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
> Total for uvcvideo device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0
> Grand Total for uvcvideo device /dev/media0: 108, Succeeded: 108,
> Failed: 0, Warnings: 0
>
> YES, NO MORE WARNINGS :)
>
> Note that we depend on:
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20210317143453.483470-1-ribalda@chromium.org/
>
> With Hans patch we can also pass v4l2-compliance -s.
>
> Changelog from v8 (Thanks to Hans)
> - 3 patches from Hans
> - Add Reviewed-by
>
> Hans Verkuil (4):
>   uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE
>   uvcvideo: improve error handling in uvc_query_ctrl()
>   uvcvideo: don't spam the log in uvc_ctrl_restore_values()
>   uvc: use vb2 ioctl and fop helpers
>
> Ricardo Ribalda (18):
>   media: v4l2-ioctl: Fix check_ext_ctrls
>   media: pvrusb2: Do not check for V4L2_CTRL_WHICH_DEF_VAL
>   media: uvcvideo: Do not check for V4L2_CTRL_WHICH_DEF_VAL
>   media: v4l2-ioctl: S_CTRL output the right value
>   media: uvcvideo: Remove s_ctrl and g_ctrl
>   media: uvcvideo: Set capability in s_param
>   media: uvcvideo: Return -EIO for control errors
>   media: uvcvideo: refactor __uvc_ctrl_add_mapping
>   media: uvcvideo: Add support for V4L2_CTRL_TYPE_CTRL_CLASS
>   media: uvcvideo: Use dev->name for querycap()
>   media: uvcvideo: Set unique vdev name based in type
>   media: uvcvideo: Increase the size of UVC_METADATA_BUF_SIZE
>   media: uvcvideo: Use control names from framework
>   media: uvcvideo: Check controls flags before accessing them
>   media: uvcvideo: Set error_idx during ctrl_commit errors
>   media: uvcvideo: Return -EACCES to inactive controls
>   media: docs: Document the behaviour of uvcdriver
>   media: uvcvideo: Downgrade control error messages
>
>  .../userspace-api/media/v4l/vidioc-g-ctrl.rst |   5 +
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |   5 +
>  drivers/media/usb/pvrusb2/pvrusb2-v4l2.c      |   4 -
>  drivers/media/usb/uvc/uvc_ctrl.c              | 343 +++++++++++----
>  drivers/media/usb/uvc/uvc_driver.c            |  22 +-
>  drivers/media/usb/uvc/uvc_metadata.c          |  10 +-
>  drivers/media/usb/uvc/uvc_queue.c             | 143 -------
>  drivers/media/usb/uvc/uvc_v4l2.c              | 389 +++---------------
>  drivers/media/usb/uvc/uvc_video.c             |  51 ++-
>  drivers/media/usb/uvc/uvcvideo.h              |  54 +--
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  67 +--
>  11 files changed, 444 insertions(+), 649 deletions(-)
>
> --
> 2.31.0.291.g576ba9dcdaf-goog
>

Any comments on this? Could we have this merged?

Thanks,
Tomasz
