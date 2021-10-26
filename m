Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBC943B3B1
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 16:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236380AbhJZOOX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 10:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235305AbhJZOOW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 10:14:22 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F19CDC061767
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 07:11:58 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id b12so13598267qtq.3
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 07:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=QnclSDWEoLjy+T+jAuDo+8q1HVMSCwyY/22eDshYtRU=;
        b=6GqLsYxV4oYares8v6Q86Xxa4bjF0SBL00dhhSOrLGBI9EsDx9JZIv+5RF+Ao08rJw
         9l8OcUy5etX3I/Alwi4r3DMH8p2+WQ7c+SsIXtVsLpH4EV2QaIaOOWECJxlZhjafOzJz
         B1qywLI3Z4rpmUui+dTItKzrZa/B+O4wlTduWNNqZTrTVkZKZS13pnMgnutIb7fThpRs
         AXwJcKRGsW0aa2n9iSWzRX97pMql7KUommtjtUpsPtLatCLJ0RYhoqDqJHJWzS1lQ0yu
         j2zybWXG98Ipn0SoWt4xw54KAE05p/NLnePapYQ8tDkESnWWKpF9v5m0xTPH2twgpXTt
         TIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QnclSDWEoLjy+T+jAuDo+8q1HVMSCwyY/22eDshYtRU=;
        b=4BjD/o9wSg4t2cKQDghdOKQMec+1DIQeFHEp+ou9uVxh5MWUPyh8rV7UnswYwtJL+F
         liXFvnuQBaC7cdo0sD2kF6oXy1cHsQOGKZpCB5oWWsC8DdkEB4hIM/pR2U/WY8UH23iU
         r8NF8t1mucUCILhwmLmiZ0SYsnTZtPkVPdz8OIvTVzQKc7L/LI4pfqVESwVOLqUYE+g6
         1O1V/2s9OzzfyXUM0FobrAL7YNIRUcj5TD79GPZDME+9FgXzV9iHErjjYzOOg4IPpBnb
         NJ4XpW41ujMhd41jzWSaCUfWqZUKS2gnkWlG3QQdSNoxgFS4twMwSW3Khjod50KQfii3
         hNZw==
X-Gm-Message-State: AOAM532705wHMJ0ckFLnW4lfTq4+zzBZ+aRboWivl6z4B5qgo2M4uHme
        tRqo84pALJDJgUBDQFPNGh7z7n65IcU+JA==
X-Google-Smtp-Source: ABdhPJyk3H55mvkyZF/gT5UmtxxWbTFj4KbzNGO4VZObmertiNf6KAHBvdCoyRMlK4xhQix2poBTAw==
X-Received: by 2002:ac8:138b:: with SMTP id h11mr24239581qtj.80.1635257518092;
        Tue, 26 Oct 2021 07:11:58 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id g12sm11206984qtb.3.2021.10.26.07.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 07:11:56 -0700 (PDT)
Message-ID: <9cb4f64e2ec3959df44b71dd69ef95697920dc4b.camel@ndufresne.ca>
Subject: Re: [PATCH] media: docs: dev-decoder: add restrictions about
 CAPTURE buffers
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 26 Oct 2021 10:11:54 -0400
In-Reply-To: <20211018091427.88468-1-acourbot@chromium.org>
References: <20211018091427.88468-1-acourbot@chromium.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 18 octobre 2021 à 18:14 +0900, Alexandre Courbot a écrit :
> CAPTURE buffers might be read by the hardware after they are dequeued,
> which goes against the general idea that userspace has full control over
> dequeued buffers. Explain why and document the restrictions that this
> implies for userspace.
> 
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  .../userspace-api/media/v4l/dev-decoder.rst     | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> index 5b9b83feeceb..3cf2b496f2d0 100644
> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> @@ -752,6 +752,23 @@ available to dequeue. Specifically:
>       buffers are out-of-order compared to the ``OUTPUT`` buffers): ``CAPTURE``
>       timestamps will not retain the order of ``OUTPUT`` timestamps.
>  
> +.. note::
> +
> +   The backing memory of ``CAPTURE`` buffers that are used as reference frames
> +   by the stream may be read by the hardware even after they are dequeued.
> +   Consequently, the client should avoid writing into this memory while the
> +   ``CAPTURE`` queue is streaming. Failure to observe this may result in
> +   corruption of decoded frames.
> +
> +   Similarly, when using a memory type other than ``V4L2_MEMORY_MMAP``, the
> +   client should make sure that each ``CAPTURE`` buffer is always queued with
> +   the same backing memory for as long as the ``CAPTURE`` queue is streaming.
> +   The reason for this is that V4L2 buffer indices can be used by drivers to
> +   identify frames. Thus, if the backing memory of a reference frame is
> +   submitted under a different buffer ID, the driver may misidentify it and
> +   decode a new frame into it while it is still in use, resulting in corruption
> +   of the following frames.
> +

I think this is nice addition, but insufficient. We should extend the API with a
flags that let application know if the buffers are reference or secondary. For
the context, we have a mix of CODEC that will output usable reference frames and
needs careful manipulation and many other drivers where the buffers *maybe*
secondary, meaning they may have been post-processed and modifying these in-
place may have no impact.

The problem is the "may", that will depends on the chosen CAPTURE format. I
believe we should flag this, this flag should be set by the driver, on CAPTURE
queue. The information is known after S_FMT, so Format Flag, Reqbufs
capabilities or querybuf flags are candidates. I think the buffer flags are the
best named flag, though we don't expect this to differ per buffer. Though,
userspace needs to call querybuf for all buf in order to export or map them.

What userspace can do with this is to export the DMABuf as read-only, and signal
this internally in its own context. This is great to avoid any unwanted side
effect described here.

>  During the decoding, the decoder may initiate one of the special sequences, as
>  listed below. The sequences will result in the decoder returning all the
>  ``CAPTURE`` buffers that originated from all the ``OUTPUT`` buffers processed


