Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0421FD642
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 22:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgFQUoa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 16:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbgFQUo3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 16:44:29 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 810AFC06174E
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 13:44:29 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id q2so1364573wrv.8
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 13:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=izNQ/AUBePYNQ9lFfRhkbYFYOvim7jrWfUSC8PuNm50=;
        b=IXuESxTW1GDtdZdcUhaUxCMmqR0alOzlFYEBB6cNiOWNqNKga8hTG5Hpk8e+jPgfs7
         gKRbcrFHT/bWqDDjWW1Tu0YTxMUPgU3/zaO7ZYFVAB7sZ5/odoojGtjQaAjqQcISTIRV
         21JjuFUVAp2SULD0ievL+VDKAIV4k3A7ZvwkkUpYlqJyABsW/fENnkF9JkHDsmSI8BPu
         lTx1kIP34vOyLqlII9KESAAKJppWEmMCqsPsjTAr9hgHKVBogXM1wNRzyliJEEMpb4Fs
         wM9VKEIlU+zdEi8dgAC6gR4OOYEJEiqf/0YobEdxc2vAIUU4tWPB0ACvaZ+E1SxG3EjY
         tp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=izNQ/AUBePYNQ9lFfRhkbYFYOvim7jrWfUSC8PuNm50=;
        b=rrksp/DA050IG8oC74FSErqZ/vc6mA71jWLe++mAd8aJkefGUoyv5GBbyiN/oU/tFQ
         wFIb6kv5LFvJvOMufaNVkQZoRQmrDLr45rj6ZBaZF1taOMtR2y6iCZ43L+pVsNo+1bGG
         FWzp1KnTmRHFqonquHFUBjtIpGl5Itls6D9yMk6tSZOj4zm5Ev8YdxCBhJN/eClTKf8Y
         RDehO6p39iQ66TS0cHywauUe9AiT0NHNZtf90Xo8mvPqSgeZXoTWS59kZPKozYhuu4AU
         7Xoxrro29kBMK34Q3XOKTgGcB2UlhWvfMQ+jsq0jnmVTU7ShXJWj0kck5X46gcNnsOxk
         jMzA==
X-Gm-Message-State: AOAM533w90X3UC31y1hr25KNzBQ1hKr9XDVU3PY7yf80aWf0ewgMIfK8
        RzGSEYHcyCZinN2pit7XRESmP8j7K9Jr1B+Gz5l7Ygjq
X-Google-Smtp-Source: ABdhPJx4KYJD9wjC9cWcd4dSFsQSQGMcDhbMVkYCssEzFcqvWczHJXD0Mb1mQo4LGh5tn1IdBmBvR3RzvVWXmaZ51kw=
X-Received: by 2002:adf:9c12:: with SMTP id f18mr1114248wrc.105.1592426668016;
 Wed, 17 Jun 2020 13:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200617180801.158331-1-helen.koike@collabora.com>
In-Reply-To: <20200617180801.158331-1-helen.koike@collabora.com>
From:   Tomasz Figa <tfiga@google.com>
Date:   Wed, 17 Jun 2020 22:44:16 +0200
Message-ID: <CAAFQd5ACgNJLzWSYW9_=vDxoUhO8gUjz0_+ntfVsRsRJbceA0A@mail.gmail.com>
Subject: Re: [PATCH] media: staging: rkisp1: rsz: fix resolution limitation on
 sink pad
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 17, 2020 at 8:08 PM Helen Koike <helen.koike@collabora.com> wrote:
>
> Resizer sink pad is limited by what the ISP can generate.
> The configurations describes what the resizer can produce.
>
> This was tested on a Scarlet device with ChromiumOs, where the selfpath
> receives 2592x1944 and produces 1600x1200 (which isn't possible without
> this fix).
>
> Fixes: 56e3b29f9f6b2 ("media: staging: rkisp1: add streaming paths")
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>
> ---
>
>  drivers/staging/media/rkisp1/rkisp1-resizer.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> index d049374413dcf..0d41f43b5339f 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> @@ -553,11 +553,11 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
>         src_fmt->code = sink_fmt->code;
>
>         sink_fmt->width = clamp_t(u32, format->width,
> -                                 rsz->config->min_rsz_width,
> -                                 rsz->config->max_rsz_width);
> +                                 RKISP1_ISP_MIN_WIDTH,
> +                                 RKISP1_ISP_MAX_WIDTH);
>         sink_fmt->height = clamp_t(u32, format->height,
> -                                  rsz->config->min_rsz_height,
> -                                  rsz->config->max_rsz_height);
> +                                 RKISP1_ISP_MIN_HEIGHT,
> +                                 RKISP1_ISP_MAX_HEIGHT);
>
>         *format = *sink_fmt;
>
> --
> 2.26.0
>

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
