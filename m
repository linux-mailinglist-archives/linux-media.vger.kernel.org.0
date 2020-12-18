Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3E42DE17F
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 11:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389221AbgLRKt1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 05:49:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389219AbgLRKt0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 05:49:26 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48603C0617A7
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 02:48:46 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id t16so1646248wra.3
        for <linux-media@vger.kernel.org>; Fri, 18 Dec 2020 02:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fLzY/djypMs81T+aO2pNTod0N4stmZ6pMUg865xqIcc=;
        b=QISrBGDGFjCaWRQGhGA/GugdDLg+ehTDRBxqjxDRfp6+PRSkSkIIsl/aqU4mLa3D9V
         1lhDchOMA5XYtDnwV2u9uTHEqTWspfzU1EQ82GjaAChd4hNnHi18144RGGTUGesp4Psf
         ervrjKImhl07N4OZ3AFBu40EgX2q3R00hjw1y9cWWg07qgqEt61Dwx6UsiFSHcSwWgVc
         ST4ndcClAToTdY2ClU7Szp0a3g0+kfAlnqOCWLvjMqvT7Fr4BICv4gnZ5pTm39L9ZD16
         UbjRemFDIB7SgiMlE9szbx5eAH3wqyEc2v73UegEM9nWVycg15DN1igYaZNtBHKi5gOC
         e6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fLzY/djypMs81T+aO2pNTod0N4stmZ6pMUg865xqIcc=;
        b=Wv2gVLApTMq7CoV+q9dVPKGwWZKDtLn78fU0daHBVKfvQ2oiQIxROepH5RVtvGocc+
         I0JK+Fb3/0Bo/sHIEz8OcjEkd7DOGnw0eCrrmPec0dIucv65ns1aBGnb94MtG4QtBHrL
         jkNmoU+d9c9yOoTKl2FM5GB8sOq/LbtkIjyEMQTdfXXIIaKrhqMVi4DJO5K6eqJf8no8
         37yMKprASDl/qMIVhVYF71eiyFnGs9/0tgsC92CTGONrURuj0p5e7NNEtxmZ3i7yYfBr
         RwPf7VytfVPJha032o7shTXholutj2fDph2Q6T04sXEv5b5qzMhX4j6BbAm1ZHFevT65
         zOnQ==
X-Gm-Message-State: AOAM531wowkRe8dmDzgJDCzDufAAvqTjWMqSDzXyYG4Ra13BVeCcWQUk
        4sObRofiS+WjUCSmcp1xO9+3KIdrwgDKBa0aYSEA7A==
X-Google-Smtp-Source: ABdhPJw44cawfORTxLkciS4IgdazVtUtDppSQQMxvbWbSTGYtlJ7nqwnlTGvwVMaZCumr1XM4pzvsXEYRyLQwkEHCYc=
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr3783824wrw.42.1608288525010;
 Fri, 18 Dec 2020 02:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20201206172720.9406-1-michael.srba@seznam.cz>
In-Reply-To: <20201206172720.9406-1-michael.srba@seznam.cz>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 18 Dec 2020 10:48:28 +0000
Message-ID: <CAPY8ntB0g21HMkYoXzk6zRMHN6wzK7GrY-nHuiwrLtPzCcdMiQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: i2c: imx219: add support for specifying clock-frequencies
To:     michael.srba@seznam.cz
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael

On Sun, 6 Dec 2020 at 17:29, <michael.srba@seznam.cz> wrote:
>
> From: Michael Srba <Michael.Srba@seznam.cz>
>
> This patch adds 1% tolerance on input clock, similar to other camera sensor
> drivers. It also allows for specifying the actual clock in the device tree,
> instead of relying on it being already set to the right frequency (which is
> often not the case).
>
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>

As the listed maintainer of this driver I'll say that I don't have any
objections to the aim of this patch.
Those who know the clock infrastructure far better than me are
recommending alternative methods of implementing this, so I'll leave
it up to them to give a Reviewed-by. When that's happened I'll add an
ack.

  Dave

> ---
>
> changes since v1: default to exactly 24MHz when `clock-frequency` is not present
>
> ---
>  drivers/media/i2c/imx219.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index f64c0ef7a897..b6500e2ab19e 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1443,13 +1443,28 @@ static int imx219_probe(struct i2c_client *client)
>                 return PTR_ERR(imx219->xclk);
>         }
>
> -       imx219->xclk_freq = clk_get_rate(imx219->xclk);
> -       if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
> +       ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency", &imx219->xclk_freq);
> +       if (ret) {
> +               dev_warn(dev, "could not get xclk frequency\n");
> +
> +               /* default to 24MHz */
> +               imx219->xclk_freq = 24000000;
> +       }
> +
> +       /* this driver currently expects 24MHz; allow 1% tolerance */
> +       if (imx219->xclk_freq < 23760000 || imx219->xclk_freq > 24240000) {
>                 dev_err(dev, "xclk frequency not supported: %d Hz\n",
>                         imx219->xclk_freq);
>                 return -EINVAL;
>         }
>
> +       ret = clk_set_rate(imx219->xclk, imx219->xclk_freq);
> +       if (ret) {
> +               dev_err(dev, "could not set xclk frequency\n");
> +               return ret;
> +       }
> +
> +
>         ret = imx219_get_regulators(imx219);
>         if (ret) {
>                 dev_err(dev, "failed to get regulators\n");
> --
> 2.29.2
>
