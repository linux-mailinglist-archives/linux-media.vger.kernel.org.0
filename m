Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D102A511031
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 06:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357700AbiD0Eeh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 00:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236382AbiD0Eeg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 00:34:36 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B95CE1CB1E
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 21:31:26 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id hh4so374830qtb.10
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 21:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eDJ/TKi8MJj4cRz3lASeVWI34QxPexXoDljXobkQyGg=;
        b=ZYSazkTWKQgXrTiBOPxNdhzCsnwoyOqM4V2N9vOQDG6HRKnC+gKK7I+aN0EPVfp3pH
         j7jBmnk/fvOdyR4xI9ms8Ab++PWx5/p71SrZahPgOOdOaGA9EI7HhKnJxv5GkR/CpuZu
         PX59oxiLlPIqvkE7FjDXFM6Z8ipB/iweREssM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eDJ/TKi8MJj4cRz3lASeVWI34QxPexXoDljXobkQyGg=;
        b=0J0WUve3/+JMVaoV4S9s11FqC2mOSfSjJay9+rrgM2V6d7ghouvdpQyCeCrJXmlsZA
         /RBmikGfmh3bA5+pxfitKsyH4WVnNczJyN0bfwLZrsT1UVreYPBhQIAp6HHRHeBB6abc
         MB4SeGaAVXa1Kr5SgK8ayDXHlYdvWsZ4RsRAtdgCBh0WRdFCr0Nvg4ekRusTeuq3yUU2
         jHpPEkYJLd29D4IbSIKZP4Z+tTCYbHFVOiRR6TmObc/xhX+3MmlLeJIBtEX4q16agYrl
         Ov8+4fz7S6ocaFXSAMzVd5iu7E/kiL8STOaOPfxuYBtt5UiRV5p4nb8mikzYNOa3aqI3
         /atA==
X-Gm-Message-State: AOAM530s4QzBr7qTX21lDL/yh9vGibJo7WxbE6LxfVAIm3JITdl3+zqw
        POSUOYlpbjRg3B1qVs6Khh/lv0T7ggViGA==
X-Google-Smtp-Source: ABdhPJzcW4QCqHGYJXL8CgdBT2688xfw0j0semBwRvBBNhY15mPouJsrftPRFMsrnWbbCOctPRUjhw==
X-Received: by 2002:a05:622a:13d1:b0:2f3:3c25:c741 with SMTP id p17-20020a05622a13d100b002f33c25c741mr17555199qtk.208.1651033885683;
        Tue, 26 Apr 2022 21:31:25 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id f10-20020a05622a104a00b002f35726ccd8sm8907435qte.86.2022.04.26.21.31.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 21:31:24 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-2f7d19cac0bso5516017b3.13
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 21:31:23 -0700 (PDT)
X-Received: by 2002:a0d:cb41:0:b0:2f7:d205:9c99 with SMTP id
 n62-20020a0dcb41000000b002f7d2059c99mr17141871ywd.417.1651033882822; Tue, 26
 Apr 2022 21:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220426125751.108293-1-nicolas.dufresne@collabora.com> <20220426125751.108293-4-nicolas.dufresne@collabora.com>
In-Reply-To: <20220426125751.108293-4-nicolas.dufresne@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 27 Apr 2022 13:31:11 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C6qmxmn4y=cx5Mtb3p8vcTAFm6Jfc1vMAE8+x9iwhDZg@mail.gmail.com>
Message-ID: <CAAFQd5C6qmxmn4y=cx5Mtb3p8vcTAFm6Jfc1vMAE8+x9iwhDZg@mail.gmail.com>
Subject: Re: [PATCH v4 03/24] media: videobuf2-v4l2: Warn on holding buffers
 without support
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     nicolas@ndufresne.ca,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        linux-media@vger.kernel.org,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas, Sebastian,

On Tue, Apr 26, 2022 at 9:58 PM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> From: Sebastian Fricke <sebastian.fricke@collabora.com>
>
> Using V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF flag without specifying the
> subsystem flag VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF, results in
> silently ignoring it.
> Warn the user via a debug print when the flag is requested but ignored
> by the videobuf2 framework.
>
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  drivers/media/common/videobuf2/videobuf2-v4l2.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>

Thanks for the patch. Please see my comments inline.

> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 6edf4508c636..812c8d1962e0 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -329,8 +329,13 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
>                  */
>                 vbuf->flags &= ~V4L2_BUF_FLAG_TIMECODE;
>                 vbuf->field = b->field;
> -               if (!(q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF))
> +               if (!(q->subsystem_flags & VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF)) {
> +                       if (vbuf->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF)
> +                               dprintk(q, 1,
> +                                       "Request holding buffer (%d), unsupported on output queue\n",
> +                                       b->index);

I wonder if we shouldn't just fail such a QBUF operation. Otherwise
the application would get unexpected behavior from the kernel.
Although it might be too late to do it now if there are applications
that rely on this implicit ignore...

Best regards,
Tomasz
