Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0BBC5F953
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 15:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfGDNtp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 09:49:45 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33434 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbfGDNtp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 09:49:45 -0400
Received: by mail-pf1-f193.google.com with SMTP id x15so2999066pfq.0;
        Thu, 04 Jul 2019 06:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q57G3q5Jt82bTMu8+pXuQ4swwABbsqmtrU7b+V+udHQ=;
        b=J89GIpdl9vKHz3FgttcdMCi4jN9+xe07Evf04UK3O7nzrBkjOVT5a5bO+/QHxY5qvj
         cE4Qx8h49JdeORrNZx6evR57H8CrPJ08znX/iaN3hbAxJU6VJIInZrPk0wc+WSprOtAZ
         jNdKQW56ZQvrAwCbVsPfzkc6rW+ZALqDAggA/FeOVcibuT7jHHePBaQ3Fb79+hny+VGT
         adVgjqJUuiFxEV3be6nndLxV14iCNZUTtlPNxJL886YUS58gSCIITapMlKd5ABmlvxRf
         1CrcdhQEhWDKemXCcl7xnaAIAX72rvW9fAWY599oFxRq+86HJTi0vV8jT74XCOrLjlV7
         MGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q57G3q5Jt82bTMu8+pXuQ4swwABbsqmtrU7b+V+udHQ=;
        b=fghlAxvvXu2hylvH96Eg7YXxUBSS4MOQaRZDOUUxTCSB8iOaRNV39BYEd4nHm/XwTL
         0lhCsSQW0OMGgrt3N/quqFd4bqeD36VXOdYd105l6yRLd0A8hkOWW8FLsW4cdWe65njL
         ewuew88h86lUVdQjxmzmGvOdV7vAb+604erc4UU4zhWAfdI/df98qaDgPMV9jUFAlkpq
         v3bR0uOAHHerqoIhKMhN4vQifeuSyn5xV0vSDuCZly8frkjs9rBTNUNNKLodVaPqBYTc
         0ajr3LCv2ri0z4aZukS4lMT4N7MbPRgsprd3aYJv22hXedG7Is1gJ54p+/8CHM+bM3cR
         Z4aA==
X-Gm-Message-State: APjAAAVpR7ctCckCFvWbwXnFC1nO6yTHlHUzxvNWMZrdmt6jdnQFcI/R
        KmoF5gaZUxyOYLlYxXqph9RYCbNFmTHt5vJzh7BisjNO
X-Google-Smtp-Source: APXvYqwvGhLTYCzCEeb37MdSjdnT4A0T7iNNbizQi4/kAir/H2MzjkbUVVzl5BbHHDxIQUGSP+Je4vUBg/AJBxE1f2w=
X-Received: by 2002:a17:90a:d681:: with SMTP id x1mr19501121pju.13.1562248184725;
 Thu, 04 Jul 2019 06:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190704093553.49904-1-yuehaibing@huawei.com>
In-Reply-To: <20190704093553.49904-1-yuehaibing@huawei.com>
From:   Akinobu Mita <akinobu.mita@gmail.com>
Date:   Thu, 4 Jul 2019 22:49:33 +0900
Message-ID: <CAC5umyi6S0eV2AOwpxmYh-HhNaMHEKZzgnG9PteVRR0i35rV4w@mail.gmail.com>
Subject: Re: [PATCH] regmap: select CONFIG_REGMAP while REGMAP_SCCB is set
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael@kernel.org, wsa+renesas@sang-engineering.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>, khoroshilov@ispras.ru,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

2019=E5=B9=B47=E6=9C=884=E6=97=A5(=E6=9C=A8) 18:36 YueHaibing <yuehaibing@h=
uawei.com>:
>
> REGMAP_SCCB is selected by ov772x and ov9650 drivers,
> but CONFIG_REGMAP may not, so building will fails:
>
> rivers/media/i2c/ov772x.c: In function ov772x_probe:
> drivers/media/i2c/ov772x.c:1360:22: error: variable ov772x_regmap_config =
has initializer but incomplete type
>   static const struct regmap_config ov772x_regmap_config =3D {
>                       ^~~~~~~~~~~~~
> drivers/media/i2c/ov772x.c:1361:4: error: const struct regmap_config has =
no member named reg_bits
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 5bbf32217bf9 ("media: ov772x: use SCCB regmap")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/base/regmap/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
> index c8bbf53..a498413 100644
> --- a/drivers/base/regmap/Kconfig
> +++ b/drivers/base/regmap/Kconfig
> @@ -4,7 +4,7 @@
>  # subsystems should select the appropriate symbols.
>
>  config REGMAP
> -       default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W=
1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_I3C)
> +       default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W=
1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SCCB || REGMAP_I3C)
>         select IRQ_DOMAIN if REGMAP_IRQ
>         bool

Looks good.

Reviewed-by: Akinobu Mita <akinobu.mita@gmail.com>

A similar problem exists for REGMAP_SOUNDWIRE. But I can't find any users
of regmap_init_sdw (i.e. REGMAP_SOUNDWIRE).
