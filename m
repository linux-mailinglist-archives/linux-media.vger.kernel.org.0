Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7AA91CEEE3
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 10:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgELINn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 04:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725889AbgELINn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 04:13:43 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25701C061A0E
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 01:13:43 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id j4so9795848otr.11
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 01:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+/M7ttbizVNgiq3E6e56DHlLpnfL10dXQ3P0u57oqQo=;
        b=B3m+V+H5gTjtrCKtwwO492HjhFTr38Y7VLdRIx8Tr0JsnUUVuJfvLNFpAjkYVRe/MU
         OGhuxIOgscPAJlStLNeONC5jnNM98kozL2u0pPS16qB774cjwhRApsJJSSoWukr1lnGH
         ndMSRfj/B/LQ6dcNI82uqbQkLohbgmAyXx7d4L3tgQ3l3nihXM9IjQ28IC8EK2tj/GD9
         iHnOYCeOgJr/UT9aaWtYgPY3TJC7SJd+g13SZ9TH5FPj9pe98IZSRDzO8BHktwFWhKDd
         X1cRshj6SP1m+RsHrtI3l2vN5q2jx7wmf8L2tcm6zsUJnPybnwRmro6/JKHf/oSS9sVT
         GmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+/M7ttbizVNgiq3E6e56DHlLpnfL10dXQ3P0u57oqQo=;
        b=XoB73pmcPKZXksMg63JNF56gfyJrtAxBOp0JbOjtmuy0/FPTT90kzi1uMM57Yx0mmx
         6C2m0AznlUk5OSxRxTIkQC4GbR7odGwm7aiklRJkq2b87ttw21UfBvm1n60LzPukZlS1
         6tmxuDlQ/1Vi3vAkFKPPwjOxMTAKnULoehK5BOSc0MpABbIuPWo1jaFVDcjFVpssyV00
         zHlxUUriTYwm2j7GP7Fn6CpnYxp8z+vnRPUA46Od8VzJxobpDv0IMjUUJGNe91BANgtV
         V1ClgeOdM3F6QuCP2nF8bDKJP5erhYAMQX7gk7738aMhFm3yc8vYf7VsFbUR3LANDYlG
         l71Q==
X-Gm-Message-State: AGi0PuaAEJ1y39s4xfM/yE4zrsDDs0zuGjQCNk/1FJNA9F0sWqNn6jYh
        qkXVBxW7QL694kdHTU82Ev3qYX5tYKHC1v3os62q4A==
X-Google-Smtp-Source: APiQypLADIaeTtFDiDZj0oHRCnE87JDFcA3KKjn9my/GbFnCnkWw5321wESGx5JUU0FJwwNUrkgSoNw73WHvEVtCGSA=
X-Received: by 2002:a9d:3462:: with SMTP id v89mr15637311otb.68.1589271222321;
 Tue, 12 May 2020 01:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200511110350.11565-1-robert.foss@linaro.org>
 <20200511110350.11565-3-robert.foss@linaro.org> <20200512002518.GX867@valkosipuli.retiisi.org.uk>
In-Reply-To: <20200512002518.GX867@valkosipuli.retiisi.org.uk>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 12 May 2020 10:13:31 +0200
Message-ID: <CAG3jFytw+GH4bXsUpS-=En52F67_1iPmOtOTo36ujE69j-9h3g@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] media: ov8856: Add devicetree support
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>, Ben Kao <ben.kao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 12 May 2020 at 02:26, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Robert,
>
> On Mon, May 11, 2020 at 01:03:49PM +0200, Robert Foss wrote:
> > Add match table, enable ov8856_probe() to support
> > both ACPI and DT modes.
> >
> > ACPI and DT modes are primarily distinguished from
> > by checking for ACPI mode and by having resource like
> > be NULL.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
>
> Applied with this small diff --- please check with checkpatch.pl on the
> next time. Thanks!

Thanks Sakari, I appreciate it!

>
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> index 1657e03d9a9d..4ca27675cc5a 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -1226,8 +1226,7 @@ static int ov8856_get_hwcfg(struct ov8856 *ov8856, struct device *dev)
>         if (!fwnode)
>                 return -ENXIO;
>
> -       ret = fwnode_property_read_u32(fwnode, "clock-frequency",
> -               &xvclk_rate);
> +       ret = fwnode_property_read_u32(fwnode, "clock-frequency", &xvclk_rate);
>         if (ret)
>                 return ret;
>
> @@ -1244,10 +1243,11 @@ static int ov8856_get_hwcfg(struct ov8856 *ov8856, struct device *dev)
>         }
>
>         if (xvclk_rate != OV8856_XVCLK_19_2)
> -               dev_warn(dev, "external clock rate %d is unsupported", xvclk_rate);
> +               dev_warn(dev, "external clock rate %u is unsupported",
> +                        xvclk_rate);
>
>         ov8856->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> -               GPIOD_OUT_LOW);
> +                                                    GPIOD_OUT_LOW);
>         if (IS_ERR(ov8856->reset_gpio))
>                 return PTR_ERR(ov8856->reset_gpio);
>
> --
> Kind regards,
>
> Sakari Ailus
