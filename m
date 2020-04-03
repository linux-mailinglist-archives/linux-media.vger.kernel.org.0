Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 815F019D4F3
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 12:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgDCKVb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 06:21:31 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54844 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727774AbgDCKVa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 06:21:30 -0400
Received: by mail-wm1-f66.google.com with SMTP id c81so6594159wmd.4
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2020 03:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FfipSOn0Icee/rxgcS7KEbKw8dB/XyZpcA9L/OXq2Q4=;
        b=XKa8sSyqHL2y/3Z/pTCBEUvCC72aRZ1iPmEwC7sBopGlJ1xURUOktTkEK0+7JDUt23
         nxGLKDZHlIxsN5aES6En+G1IqMTrXZyg1WHwkZztx1cS+EhcOM9SW95UBn4xwYKHiafl
         SkmN/A68PKSMf9dyrfCKnazNl4v4U43raYPpKG0hGQpYUXnqPqnR+6Y6z69rGO2uSpp0
         x3vV5vc+OtGeVzUZ3GSJpV6p/WOO0cJKhKvbjcUsq0YRkHQMCkKnnsI9wlfvTrSAs+zf
         +647VfBi6ISPyKOPZ2IKu5SKk4Usg3agpSntIHxqjDqLC7kr7DzWOjP30lQC9p2sF+wl
         Jucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FfipSOn0Icee/rxgcS7KEbKw8dB/XyZpcA9L/OXq2Q4=;
        b=KZl0uRFXpUDSIovQ7jV3sF+s2Atxnw39e0CVpTAMWDVEj2nzhviD3UIDxfHeJL9W1R
         r4509leWxWa5qfmL2iETsr9xdcOp7I/kNAFntgQ70dImFq7j3NTg17wbicQ+ZEOTqOj2
         i/Vfz4FnzfBBRPGRZHQRIlGIlGw685Tkh3SA4yc5TFFO/1BovrXNjSSN7wAHpJ5zECq2
         BdoPZEoMimrfmydwX+j0Q2OLRxwZIdalkFHMH9RB1gIHlXiFlQCwJCFSg0MugMNCpzfm
         FXshxno/BMV4i4gf5wWiT4WV+76Mwb43X3stMpWV5H1BBF1db8U8l/9/WQARr+vFrXfh
         4/Eg==
X-Gm-Message-State: AGi0Puba+WMw0aPAjzJ1pPgKutznA0IWByl1kCQ1B/pVhckDWDlPaO9C
        KqICVm+m9utNdwrA5+qniP3aQeIRNBAfQcn4NbndMshsaFg=
X-Google-Smtp-Source: APiQypI7DGeQa4WZEDKNe7RFwFdC/IocV7yhw+IHdN48WJfok9pyEnIbIWPLjNoawoGc9ZBxTCGbTjzc/8vpVCWDBLw=
X-Received: by 2002:a1c:9e08:: with SMTP id h8mr1633145wme.183.1585909287467;
 Fri, 03 Apr 2020 03:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200331180630.5703-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20200331180630.5703-1-dafna.hirschfeld@collabora.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 3 Apr 2020 11:21:10 +0100
Message-ID: <CAPY8ntD=4i6VnxTHakt2dnfM3BLfNsBPEhJt6qS229rOfCHZmg@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx219: Fix a bug in imx219_enum_frame_size
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        helen.koike@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        dafna3@gmail.com,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna

Thanks for the patch.

On Tue, 31 Mar 2020 at 19:06, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> When enumerating the frame sizes, the value sent to
> imx219_get_format_code should be fse->code
> (the code from the ioctl) and not imx219->fmt.code
> which is the code set currently in the driver.
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Agreed that v4l2-ctl --list-formats-ext doesn't list the frame sizes
for the mode that isn't selected without this patch. With this patch
you get the full list.

Does it warrant a "Fixes: 22da1d56e ("media: i2c: imx219: Add support
for RAW8 bit bayer format")"? I'd probably say yes.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index b1f30debe449..df2a6ed7c8ac 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -781,7 +781,7 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
>         if (fse->index >= ARRAY_SIZE(supported_modes))
>                 return -EINVAL;
>
> -       if (fse->code != imx219_get_format_code(imx219, imx219->fmt.code))
> +       if (fse->code != imx219_get_format_code(imx219, fse->code))
>                 return -EINVAL;
>
>         fse->min_width = supported_modes[fse->index].width;
> --
> 2.17.1
>
