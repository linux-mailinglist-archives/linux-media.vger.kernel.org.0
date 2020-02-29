Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4AD9174558
	for <lists+linux-media@lfdr.de>; Sat, 29 Feb 2020 07:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgB2GKX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Feb 2020 01:10:23 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35049 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbgB2GKX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Feb 2020 01:10:23 -0500
Received: by mail-ot1-f66.google.com with SMTP id r16so4766292otd.2
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2020 22:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vbMOFWxjKdtYfZR0pj0I6vLctD/eqeOpvw+bMKiq5QY=;
        b=AFmVl39v3E73gTjaQSAUPN/yVscu3YpXU+WK3ShAegJNbijUM0B9b48kBzjD8GNCHM
         qYg1EqpuEugVfKA3dpvXMnfEH9Rl4TTBIQak3Pee0oOADP1f6Zgt6Ua/rkqUjzlMGtsT
         KrqAneMmAejGZGOFRrWCo/Ztid/mb4HmRU+G/VHcJiSeClJzAu9fB8CztUuq14zeiwwV
         vLONBHgzywNuKjpiKUx6fsV6qA/GMhnAPZjVQZyvCWV5fSatjOyHIuPy428gOC9ORPwf
         XSog19k8svLvAbR/GN3+4npPShyrBeuMXFCXSAv2L6Wnq6pTyp3ZwUwx84Z+Izw6CcuS
         ZWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vbMOFWxjKdtYfZR0pj0I6vLctD/eqeOpvw+bMKiq5QY=;
        b=GKDmlqcwCvN7xduxHVlw7TvY4jlp21l7x/RgDH31kr/bB/ZH8bTnFBHMTCInEzDfLg
         sB03avCVcFvB6gbtMlBqJKj0ishoY164tB3A0JlTAzmNo43likn/2JJozOjnc3VH+ynU
         aNJxlnLBZBOamr9IzwgQ7S94mFon3nF6qN2b/q1bXb0eyFhvLz2arc6MzXGOpJZQKb9T
         jllGJS9TIpTD8BsvaVjTUMcJF34vnP9BFnQMz3M2SbP4LTtcVsd09eq3Oc0+ejphNJLT
         phEJe82KkH1W4ORoQKefC3BsbyF0mUmLImbULBc7fbR/k9Dbb2PM0CKoVvvHFBh4t5HK
         WTXQ==
X-Gm-Message-State: APjAAAU+Y9pyha6tGtqTdoA9RPmaUqaDWgcM/3UG4thqn32BPw/vXE6c
        IzbiPoFSw3v3e8vtlOYyCK83WEk0D/kLOy7cfQL1Pw==
X-Google-Smtp-Source: APXvYqw32gz0JEiTy9AukIXCcmRTQeYktFArEog5Kv2t+4KjMlLmFM+eEEZoB5T28w9OjAzZTGXs4vJNmi5CKcO093Y=
X-Received: by 2002:a9d:5cc4:: with SMTP id r4mr6032978oti.33.1582956623030;
 Fri, 28 Feb 2020 22:10:23 -0800 (PST)
MIME-Version: 1.0
References: <20200228232657.27028-1-slongerbeam@gmail.com>
In-Reply-To: <20200228232657.27028-1-slongerbeam@gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 28 Feb 2020 22:10:10 -0800
Message-ID: <CAJ+vNU2G_QPxzTn=tgMioCuhe-aVRBM9oBKDFVk1yqrq6irsEQ@mail.gmail.com>
Subject: Re: [PATCH] media: imx: Propagate quantization and encoding in CSI
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 28, 2020 at 3:27 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>
> Unlike the PRPENC and PRPVF subdevices, the CSI's cannot convert
> quantization from sink to source, or do any kind of Y'CbCr <-> RGB
> encoding. So the CSI's cannot allow quantization and ycbcr_enc to be
> selectable by the user and must be propagated from sink to source.
>
> Fixes: 4791bd7d6adc4 ("media: imx: Try colorimetry at both sink and source pads")
> Reported-by: Tim Harvey <tharvey@gateworks.com>
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/staging/media/imx/imx-media-csi.c  | 2 ++
>  drivers/staging/media/imx/imx7-media-csi.c | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
> index b60ed4f22f6d..ac15b1e78f18 100644
> --- a/drivers/staging/media/imx/imx-media-csi.c
> +++ b/drivers/staging/media/imx/imx-media-csi.c
> @@ -1459,6 +1459,8 @@ static void csi_try_fmt(struct csi_priv *priv,
>                 /* propagate colorimetry from sink */
>                 sdformat->format.colorspace = infmt->colorspace;
>                 sdformat->format.xfer_func = infmt->xfer_func;
> +               sdformat->format.quantization = infmt->quantization;
> +               sdformat->format.ycbcr_enc = infmt->ycbcr_enc;
>
>                 break;
>         case CSI_SINK_PAD:
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index db30e2c70f2f..4692a3a77515 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -1013,6 +1013,8 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
>
>                 sdformat->format.colorspace = in_fmt->colorspace;
>                 sdformat->format.xfer_func = in_fmt->xfer_func;
> +               sdformat->format.quantization = in_fmt->quantization;
> +               sdformat->format.ycbcr_enc = in_fmt->ycbcr_enc;
>                 break;
>         case IMX7_CSI_PAD_SINK:
>                 *cc = imx_media_find_mbus_format(sdformat->format.code,
> --
> 2.17.1
>

Tested-by: Tim Harvey <tharvey@gateworks.com>

Tim
