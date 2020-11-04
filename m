Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C30B72A66C2
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 15:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729279AbgKDOwe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 09:52:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgKDOwe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 09:52:34 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D80C3C0613D3
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 06:52:33 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id 33so11549403wrl.7
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 06:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N4+Q9RBvb0DbSKNFqUUw65Wd7RKau0aR66ICm9Wczxc=;
        b=BFMrtHCr83asEN7tMjnHohQGLFhuNOKQqzoMrgmfnA4cJFBFSINMdjGTZNa4r5n+Ga
         NnzG7Tp3/nU1IQuJpStNdUzFIIA54WwQSY12rnnJvUl1VmmSPw6O4ygJUrZKyWYBrQib
         pPYQQYnsONNqBsmbkho7VcR5dTeZ/QKDlKqI/zBkQyp3ziyNr+3yhsjFdRKdlpaF0+6E
         h06MRVYBIN3GMzzF/mfM2kv+Og/VKpXRZWXbf/IkDGEutH07pgcmofy5topX9BQ5wdr2
         +i2PzToCHOnRBc1LMrjyP8hRVI01v9yJow5DzsPvrFgKvtRM0DyGPMTGIEpa4tA1jU6k
         2qGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N4+Q9RBvb0DbSKNFqUUw65Wd7RKau0aR66ICm9Wczxc=;
        b=GsXJ27hc+1oCJ1x6TWMasaWkjQXRpP4zDKQmS5zfiEstnEZbRgtEIZ4fAnTcSab/Ox
         jE7SkrO3Tf3ONC30E74uflrbqRwhXcqTXGJYeS5R+RhMmgYxpyH+ScQ4apT9dAXA91Lq
         52mJBty6oA9YnzO8dE/bpn0hJillnBNXmcI79UAcKKPWHCyDAzfVDsXNHC5mt2QsJ5hs
         Ss6gpc7iP7lAEJZv4i1T+IMfh7pxMKQwFwqMno4gaXsRX51/OcDJF8S9LEiScSTA4Cj9
         ylcYFzIraE7YiVGAaWJdjp39EcQyt25pLvzvjkr6cJ/6+U755RF3x9GOu2tZJnm0xjKc
         QJNw==
X-Gm-Message-State: AOAM531Z4dGA5zLOn6WVaW7ghGx4+XvsJi8nFWTbSu8FdsavcXKcs1B0
        HfyQAPSfqEc1Lsin4Jzd4Kb/lJjIqyRCUuorirVUNw==
X-Google-Smtp-Source: ABdhPJxyklbtKdhwvFGt30H+9s19twSb/P6VPR/BO1L5KrcDPyvR/9yAAAMd2WQiukf3j4CWwJ9hVGHIQ8RIy4JMhNg=
X-Received: by 2002:a5d:4ac1:: with SMTP id y1mr4364339wrs.27.1604501552665;
 Wed, 04 Nov 2020 06:52:32 -0800 (PST)
MIME-Version: 1.0
References: <20201104103622.595908-1-jacopo@jmondi.org> <20201104103622.595908-17-jacopo@jmondi.org>
In-Reply-To: <20201104103622.595908-17-jacopo@jmondi.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 4 Nov 2020 14:52:17 +0000
Message-ID: <CAPY8ntBc35oF+5SUirENbtL5s9HhsWuV3wN+g3z1R1L647utgQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/30] media: ov5647: Rename SBGGR8 VGA mode
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Naushir Patuck <naush@raspberrypi.com>, erosca@de.adit-jv.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Wed, 4 Nov 2020 at 10:37, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Before adding new modes, rename the only existing one to report
> the media bus format in the name to distinguish it from future
> additions.

You are aware that if flips get added into the mix then they alter the
Bayer order, and therefore the media bus format will change?
Adding the bit depth makes sense, but adding the Bayer order less so.

  Dave

> While at it, briefly describe the mode.
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5647.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 65fcd86dcba96..9cbe3b675fb52 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -115,7 +115,7 @@ static struct regval_list sensor_oe_enable_regs[] = {
>         {0x3002, 0xe4},
>  };
>
> -static const struct regval_list ov5647_640x480[] = {
> +static const struct regval_list ov5647_640x480_sbggr8[] = {
>         {0x0100, 0x00},
>         {0x0103, 0x01},
>         {0x3034, 0x08},
> @@ -205,7 +205,8 @@ static const struct regval_list ov5647_640x480[] = {
>         {0x0100, 0x01},
>  };
>
> -static const struct ov5647_mode ov5647_8bit_modes[] = {
> +static const struct ov5647_mode ov5647_sbggr8_modes[] = {
> +       /* 8-bit VGA mode: Uncentred crop 2x2 binned 1296x972 image. */
>         {
>                 .format = {
>                         .code           = MEDIA_BUS_FMT_SBGGR8_1X8,
> @@ -220,16 +221,16 @@ static const struct ov5647_mode ov5647_8bit_modes[] = {
>                         .width          = 1280,
>                         .height         = 960,
>                 },
> -               .reg_list       = ov5647_640x480,
> -               .num_regs       = ARRAY_SIZE(ov5647_640x480)
> +               .reg_list       = ov5647_640x480_sbggr8,
> +               .num_regs       = ARRAY_SIZE(ov5647_640x480_sbggr8)
>         },
>  };
>
>  static const struct ov5647_format_list ov5647_formats[] = {
>         {
>                 .mbus_code      = MEDIA_BUS_FMT_SBGGR8_1X8,
> -               .modes          = ov5647_8bit_modes,
> -               .num_modes      = ARRAY_SIZE(ov5647_8bit_modes),
> +               .modes          = ov5647_sbggr8_modes,
> +               .num_modes      = ARRAY_SIZE(ov5647_sbggr8_modes),
>         },
>  };
>
> --
> 2.29.1
>
