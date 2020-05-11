Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8711CD564
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 11:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729387AbgEKJhD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 05:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725790AbgEKJhD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 05:37:03 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E762C061A0C;
        Mon, 11 May 2020 02:37:03 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id a2so14337118oia.11;
        Mon, 11 May 2020 02:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=22vKbxGNsiWZ2IBSP8WLC1U/nWrORH0rvsSsTyvQNUY=;
        b=NlWCo7dP/VWuLfWFdFpzGMrV/pRiSGLxiW3StDcnOyZmQN6A9Bo+mt7HtKIxnbyb6O
         B8AODeAWxDTon/SfhHFqtbftk7/4PBAtisXRVFzy741HpZy9IPiF9cB2mD2Ya5YgqZXP
         +87UId71b74B5yjf3GPRANw9E1YJCdjRX8KDQr7shkLs+jfWI+OBsUBxLcs7mzOy7YYJ
         ywqwXwg195c6oAZokkPSacE5AUF6ee09oxXDQ4jcwuzoBPpsIuLrPKqAih6S6KqileaB
         HIjrM8/kIXAzo//UG6HWjEYL0RIDomANSO8k/Q4VxaM5ShEpBqzdVNbpJWPV8pqoOOaD
         ootA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=22vKbxGNsiWZ2IBSP8WLC1U/nWrORH0rvsSsTyvQNUY=;
        b=MnpXZIboNws6C1bI7nWYQ25vyovgZILhF3Ct8lE2bxHvpQnZ6bpgLIO0dd/XSHI5Pq
         LlkZ1TWMddpQaH8gUQoYT4aS6C1ZiKiIX8ZzQIHe5kDJlFKNl/PlS3IKJ8BCDAwPljDr
         buX4zSrymKnzG7Ot/xG9lELao/h1Bz73FkpiFTj+FpBthJ4DvhAgeIxB1B0XCLwiIbRs
         ryX7fXnk/2xvkameyjzju48D8jAQdwJ5NhfxegroVjN2UhREvss2X3T2WnIGHpRTs4zC
         VK9ecF5/Y3+FX2X3/gJyq6aRm7Eo8g/YeuSTAh7zlhhKdUYwS5SCwDtdyq5k4ykBqWGo
         /AQg==
X-Gm-Message-State: AGi0PuZE8vFNZVnQGy82KNRg0/uxrxe7nLSHkrqLhU3FVgDJwiUEXNFP
        brIencyDY7Ok5JdJAgITSHT+b9AtZS1gbKJWceCKYQ==
X-Google-Smtp-Source: APiQypItVNPD5CU0V3ko73rD3gop/ALAVZC9z5N0O6VQktyi+IqeOBVFv0YirK83X6veZdCfSKOn3G7NXIZF7PpTQHY=
X-Received: by 2002:aca:abd0:: with SMTP id u199mr18289341oie.130.1589189822681;
 Mon, 11 May 2020 02:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200511091142.208787-1-daniel.vetter@ffwll.ch> <20200511091142.208787-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20200511091142.208787-3-daniel.vetter@ffwll.ch>
From:   Oded Gabbay <oded.gabbay@gmail.com>
Date:   Mon, 11 May 2020 12:36:17 +0300
Message-ID: <CAFCwf10m14ModSuRbQAsWf5CSJvTeP7YRzcokD=o+m2Pa0TqKg@mail.gmail.com>
Subject: Re: [PATCH 3/3] misc/habalabs: don't set default fence_ops->wait
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Olof Johansson <olof@lixom.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 11, 2020 at 12:11 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> It's the default.
Thanks for catching that.

>
> Also so much for "we're not going to tell the graphics people how to
> review their code", dma_fence is a pretty core piece of gpu driver
> infrastructure. And it's very much uapi relevant, including piles of
> corresponding userspace protocols and libraries for how to pass these
> around.
>
> Would be great if habanalabs would not use this (from a quick look
> it's not needed at all), since open source the userspace and playing
> by the usual rules isn't on the table. If that's not possible (because
> it's actually using the uapi part of dma_fence to interact with gpu
> drivers) then we have exactly what everyone promised we'd want to
> avoid.

We don't use the uapi parts, we currently only using the fencing and
signaling ability of this module inside our kernel code. But maybe I
didn't understand what you request. You want us *not* to use this
well-written piece of kernel code because it is only used by graphics
drivers ?
I'm sorry but I don't get this argument, if this is indeed what you meant.

Oded

>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc:     Olof Johansson <olof@lixom.net>
> Cc: Oded Gabbay <oded.gabbay@gmail.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  drivers/misc/habanalabs/command_submission.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/misc/habanalabs/command_submission.c b/drivers/misc/habanalabs/command_submission.c
> index 409276b6374d..cc3ce759b6c3 100644
> --- a/drivers/misc/habanalabs/command_submission.c
> +++ b/drivers/misc/habanalabs/command_submission.c
> @@ -46,7 +46,6 @@ static const struct dma_fence_ops hl_fence_ops = {
>         .get_driver_name = hl_fence_get_driver_name,
>         .get_timeline_name = hl_fence_get_timeline_name,
>         .enable_signaling = hl_fence_enable_signaling,
> -       .wait = dma_fence_default_wait,
>         .release = hl_fence_release
>  };
>
> --
> 2.26.2
>
