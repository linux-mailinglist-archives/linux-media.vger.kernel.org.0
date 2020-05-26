Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEE411E337B
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 01:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391174AbgEZXJW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 19:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389565AbgEZXJW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 19:09:22 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F39F6C061A0F
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 16:09:20 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id f3so23980762ioj.1
        for <linux-media@vger.kernel.org>; Tue, 26 May 2020 16:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cQ3ze+f5b/1ZwQbWOPMMZMeekvLgFjRb8bxIRjsaSd0=;
        b=kdbKxW0bvkN1ZI9nLoxn9sBacbu4KgJJ4FkkYn2QrKvlucVlYtdZ8H4ff6C6eTsE9Z
         MoWXyUvlH0S68teD/K+co02/k/X0AVerTO8ghOoQMxYCCrIY73R/ovJFRE05lJV3wfC0
         tAS5uBYzxc697Qdj+xYMJmeXw+7GV7Wv2p6KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cQ3ze+f5b/1ZwQbWOPMMZMeekvLgFjRb8bxIRjsaSd0=;
        b=J4aCEFIIgZY2pO6rIpK9ctlvBZO3bJC2+kEIfCH913LYSjlC/zS4suCjmSJYB15QoU
         RSYEje/nE1un9zt5NyIUPexkIFZtmX//r/GWciwYpCIELft+31qYBdne1Zquc8Rqm8Hl
         uzkyzAF1zaS5nPnuxMIimts70KnQxd+ns2DakS4mJnBXRkZYmJZ6AfPipYQUQ4psge3m
         9Kfrn7e0IlJNNNPiih34a9YVWjyhqYTmZDV6XTOeUju5WW8G0Iq6qY2ToVK5SjkVZMR5
         dLcBLyb8ROBlVqIZZ5w5UOp1JazPbjLpnwm1pYZcXQRZlWSNps2rG/esN7c0xYWOGY+9
         yQ/Q==
X-Gm-Message-State: AOAM530L3R7YiXQHPDxRINi+kBdFvIWdW4j/gJRFOglaY4Bd9kB87phT
        xrAwFx7L0rvdscOF5Wu2rlwCc9qZAH0X+pLUteBc7Q==
X-Google-Smtp-Source: ABdhPJzVAtHQErZTvpJ1Saha2x31lQqV2ODlhL29AuDQeCObg4bco1zWako9f6YP6Z2U+CKCwPHPM9Sc7Kp7xNUOIsw=
X-Received: by 2002:a05:6602:2dca:: with SMTP id l10mr18865176iow.163.1590534560425;
 Tue, 26 May 2020 16:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com> <20200515142952.20163-4-dafna.hirschfeld@collabora.com>
In-Reply-To: <20200515142952.20163-4-dafna.hirschfeld@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 27 May 2020 01:09:09 +0200
Message-ID: <CAHD77HkjjWMOcX3oLnzdMuzZM-_NSydStnzLLcHEFRenL23d-A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] media: staging: rkisp1: rsz: set output format to
 YUV422 if cap format is YUV444
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 15, 2020 at 4:30 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> If the capture format is YUV444M then the memory input format
> should be YUV422, so the resizer should not change the default
> hdiv, vdiv in that case.
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-resizer.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> index 04a29af8cc92..5f9740ddd558 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> @@ -394,10 +394,11 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
>          * (4:2:2 -> 4:2:0 for example). So the width/height of the CbCr
>          * streams should be set according to the pixel format in the capture.
>          * The resizer always gets the input as YUV422. If the capture format
> -        * is RGB then the memory input (the resizer output) should be YUV422
> -        * so we use the hdiv, vdiv of the YUV422 info in this case.
> +        * is RGB or YUV444 then the memory input (the resizer output) should
> +        * be YUV422 so we use the hdiv, vdiv of the YUV422 info in this case.
>          */
> -       if (v4l2_is_format_yuv(cap->pix.info)) {
> +       if (v4l2_is_format_yuv(cap->pix.info) &&
> +           cap->pix.info->format != V4L2_PIX_FMT_YUV444M) {
>                 src_c.width = cap->pix.info->hdiv;
>                 src_c.height = cap->pix.info->vdiv;

As pointed out in another thread, this should have been the original
size divided by the divisor and not just the latter alone.

It seems a bit suspicious to me that we don't need to upscale the
chroma planes here, because it would mean that the MI itself would be
doing some horizontal pixel doubling. The hardware documentation
doesn't really explain this, though.

Have you been able to validate that the setting without upscaling
indeed produces correct output?

Best regards,
Tomasz
