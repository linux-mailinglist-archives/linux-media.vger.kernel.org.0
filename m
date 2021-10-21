Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5E7435CCD
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 10:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbhJUIXs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 04:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbhJUIXr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 04:23:47 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBADC061749
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 01:21:31 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id g10so1309924edj.1
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 01:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/hiUEvAk0D+Wzqjvqk+6FpLdxlRGHN8XahFm7bhkPck=;
        b=UsGpUysSmE0IX+iOcdYqPhwYRsS5qwrxwZb/H0tqdrKEiUZ/VuZ9GKWGaSrFHItYFG
         OYGP2LK9FUnAViP2sDpbmmEZFHg2JqHU+mAOIlnafuwSSK+RyRgCKG6m+mu6jpsS4nyZ
         E8ubjdLbqhGqmqqlZzLqA+WZjGmWQLRrtFRc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/hiUEvAk0D+Wzqjvqk+6FpLdxlRGHN8XahFm7bhkPck=;
        b=FUEzADoxALWJwj4wlpX6YjXKjqcc1vJBgJFkBXYPsEEyNi9AfUyG8enWZuIYRYrBUM
         7Y2lsTJ/afkrxAOqFrkkJcw/EJ5aUPAbpvXhurjZr7RegDtXz/Qv3arXwW0PlUxu6o+1
         yuBxpyY1s8/Mu2hBn3Vu5rSDGAMR098bjbXrhOgnVxN0OqlRPHObgmyRVDtdre3ANaIM
         qyULtrgUB7Y9RGpl3lU8CJXxM0be3p3vvEhSrdipe+pFV3V4AgQCHpeFWqc96VyDijcQ
         Iop/jY3+sWUpd1xbAnoRuN6B2g1vxGuH8Jpu4djqq5nZycUsFB1wCTjeggke8h3wjOrt
         oArA==
X-Gm-Message-State: AOAM530r+fcBDb2HiIgr60qb1XYWcvOPX6AR/3kvYI4c8Unaxm6byLOn
        B7oRp3jMGdqC3LF7Um2+RvEXgmlQsN322A==
X-Google-Smtp-Source: ABdhPJy6N6J07kvQSzb42FluJktht/UJJ7mI3HCRJX8HbzfMYOdbWO5Ssq+wTdsB1mt0kMQ7mnnang==
X-Received: by 2002:a05:6402:11cf:: with SMTP id j15mr5750395edw.232.1634804489742;
        Thu, 21 Oct 2021 01:21:29 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id nb42sm2292983ejc.23.2021.10.21.01.21.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 01:21:29 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id r18so243046wrg.6
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 01:21:28 -0700 (PDT)
X-Received: by 2002:adf:a51e:: with SMTP id i30mr5620040wrb.206.1634804488220;
 Thu, 21 Oct 2021 01:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211018091427.88468-1-acourbot@chromium.org>
In-Reply-To: <20211018091427.88468-1-acourbot@chromium.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 21 Oct 2021 17:21:16 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A_yoZPUw26Cza8KLh9VdgtbxWK9rezSbj4keJZt249NQ@mail.gmail.com>
Message-ID: <CAAFQd5A_yoZPUw26Cza8KLh9VdgtbxWK9rezSbj4keJZt249NQ@mail.gmail.com>
Subject: Re: [PATCH] media: docs: dev-decoder: add restrictions about CAPTURE buffers
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 18, 2021 at 6:14 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
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
>  During the decoding, the decoder may initiate one of the special sequences, as
>  listed below. The sequences will result in the decoder returning all the
>  ``CAPTURE`` buffers that originated from all the ``OUTPUT`` buffers processed
> --
> 2.33.0.1079.g6e70778dc9-goog
>

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
