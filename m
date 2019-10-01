Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C57AC2D0F
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 08:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731636AbfJAGE5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 02:04:57 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38992 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725777AbfJAGE5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 02:04:57 -0400
Received: by mail-oi1-f193.google.com with SMTP id w144so13364016oia.6;
        Mon, 30 Sep 2019 23:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oEIJNBUFx9U+QiZqRvXaEBKRw5Gehkx+h0Lui6mqiMk=;
        b=BjC4sH+aVzzM5CI09HoOBZVGXyJKiHbuY+VyANdqhQi7Iut83Q5ZlYz4Izw/lS8mCs
         Iu1Af+2xTs63Py+2AAvL4vLj7rHEPCGfv67X4xHpg7g54K3RH0pwD2XUDfa6znT22YqB
         U1KR0LDf0CYqIArYS5JapKAuSlQz+3MEDvr+DZBiaXnnLU5hVZkysTYLuBATmsvGNplu
         Hje4WJ8e2XT/j5+ZCvpAc8pO5+gu3o514VVpjUAybEodIxbZ8GnT40NMgnEqImbTF4i8
         aV9Uxq9I5teqk32KhCEgcRW/Fhe5BnDA6yqcmjibKujWeJOwIiYxRnFhwA5D04SPrYaF
         3/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oEIJNBUFx9U+QiZqRvXaEBKRw5Gehkx+h0Lui6mqiMk=;
        b=UzdzqnNkb0yM/Usr+HlDz3l0uurYc4O2+zoR0dWN2U568AOlhQdpgYz57mKU4mjOI4
         tmG1dSLhCNGbn3Fmr2dflm2ZE1dLH3C7afzOGS5xEQRCQzdN6nrAhTAc+XvQByDh2uFp
         qMOG5TVt5rbz7T4GOFe5/bb0neEFqsPW67kVLHXKtjWqUFYkNDDwdCL2zL772VVgIYJw
         HDmJLQzwGbrfRymJuEAiYnWVxvOU25OCi5aWnW6zoL+I2d3hn9Atqz7GMJR3POWdFSUG
         4tZxbgqa+dXPAOQcz0tAz+08VM1a2Z2RQZigfyW/sd+C+MSacOeJeTcNCgY/3zBKappU
         Y5Yw==
X-Gm-Message-State: APjAAAUqCQ2vifoD95YmlkqM4WKiGrjKKgK9tWSVD79S4wOcTIrQGUlm
        T2Bo+oFYjZ1jNrtnrk+RSDij5s5/PP9vSabsb6pHIngQMEo=
X-Google-Smtp-Source: APXvYqwCpZS0Ku9+O/t4MlJT0csmkVhw/Syu2/K4LLXJyXh2SPQNSLC6V9yrcUX9tdak9gia//rFrA02hsACfX6T6m0=
X-Received: by 2002:aca:5ed4:: with SMTP id s203mr2323789oib.101.1569909896234;
 Mon, 30 Sep 2019 23:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190930130644.8704-1-bparrot@ti.com> <20190930130644.8704-5-bparrot@ti.com>
In-Reply-To: <20190930130644.8704-5-bparrot@ti.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 1 Oct 2019 07:04:30 +0100
Message-ID: <CA+V-a8tw1ydsiK1n0ctDEeg6dAUAD+oyMSh1S3n+X4DfiAMkOA@mail.gmail.com>
Subject: Re: [Patch v5 4/8] media: i2c: ov2659: fix s_stream return value
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

On Mon, Sep 30, 2019 at 2:07 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> In ov2659_s_stream() return value for invoked function should be checked
> and propagated.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/i2c/ov2659.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad

> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index f77320e8a60d..da181a13cf44 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -1187,11 +1187,15 @@ static int ov2659_s_stream(struct v4l2_subdev *sd, int on)
>                 goto unlock;
>         }
>
> -       ov2659_set_pixel_clock(ov2659);
> -       ov2659_set_frame_size(ov2659);
> -       ov2659_set_format(ov2659);
> -       ov2659_set_streaming(ov2659, 1);
> -       ov2659->streaming = on;
> +       ret = ov2659_set_pixel_clock(ov2659);
> +       if (!ret)
> +               ret = ov2659_set_frame_size(ov2659);
> +       if (!ret)
> +               ret = ov2659_set_format(ov2659);
> +       if (!ret) {
> +               ov2659_set_streaming(ov2659, 1);
> +               ov2659->streaming = on;
> +       }
>
>  unlock:
>         mutex_unlock(&ov2659->lock);
> --
> 2.17.1
>
