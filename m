Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC1BA5BA28C
	for <lists+linux-media@lfdr.de>; Fri, 16 Sep 2022 00:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiIOWEH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Sep 2022 18:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiIOWEG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Sep 2022 18:04:06 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 238BD53D05
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 15:04:03 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id l14so45205620eja.7
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 15:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=tALU3ngGuccY89kW5gd4JGorZltgFUamSuX4Gf4e2t8=;
        b=tFd4I4QPu0Dc9TgYFcm9IjMi1lbLPg8f5IFq4ZRs/3N75wMqxe4qw74H6WiffrI9FA
         lmSBMCdkSU86m9CdKiXWql/9GwDLo9PdwcSzYW2BppEFObjtPIYJ+HIFVAatx/Mt6yDT
         RrShoRFzo0ECfhF8qxF8ZRfwFHJcG17r1qxKdTUOa8cf+lj+HCYyVdf2CdRBtkhbXxw8
         3Czvl4menwOP778cnz7+46bkt+AuVFdfT5O4tgtkw+zh/2fM9Oz1pC/FC6Ywrm34VNjj
         hvWmZkaK/ACBGwS5uJZi+S44LdL++rRhW9IH+Vq2bNCylgFooUVw2t3ddDecz+fD9wvM
         6CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tALU3ngGuccY89kW5gd4JGorZltgFUamSuX4Gf4e2t8=;
        b=X3rqJIsbWq/qwe9Ql9K7mk70kYSprtCnxu1HUx0TXONRAcV5lZV5dp71wOXadz4KS2
         ThwM5GUaNmpkItuqTkd6Vo7H7G6ePn535aDHN2+hWOXfwI9uZJcIS6aMfXCW2/I9jpdA
         ySuqDrC8UQFvyXJE957O83/O5E7vm8+Wpu7fOLD6/j610s47NGU1HzozO9ys92Gq1WM6
         F4ZxMLaYg+xyNeg1YnCqQtLBN6K7LFZJRRpDtga5wkrbYmTLuRq1zqGfl5T2+WmOFy1K
         iH/snbGKSgzLXBrxT0111+VR6tw29YS1rYV2x7w+Dq/ae0OhnZ3QhUN5lybmtgaakHP7
         /CIA==
X-Gm-Message-State: ACrzQf1yLRP9q78FNRJgsxh+7cDoGtNAfswUXm0m/7zIoY0RYSI71GRa
        78lbwdMEjug4r1bZCaR7UdVRC4xvmwIz0vJ8eIeEfQ==
X-Google-Smtp-Source: AMsMyM4DNqRCOy/6dqrGBzM4j9BVWGmfnai5LHvFQPu8fFgc3wgc+Yna1J7qYsfXvOy8PxzJD6YGH5OazrNBcsCeGMw=
X-Received: by 2002:a17:907:80b:b0:77a:86a1:db52 with SMTP id
 wv11-20020a170907080b00b0077a86a1db52mr1379611ejb.294.1663279441712; Thu, 15
 Sep 2022 15:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220915003522.1227073-1-bryan.odonoghue@linaro.org> <20220915003522.1227073-5-bryan.odonoghue@linaro.org>
In-Reply-To: <20220915003522.1227073-5-bryan.odonoghue@linaro.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 15 Sep 2022 23:03:45 +0100
Message-ID: <CAPY8ntCmRy_BSQW6QajrRMLpQBzMimcQPvZw1ocazxhr2dOd0A@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] media: i2c: imx412: Add imx477 compatible string
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan

On Thu, 15 Sept 2022 at 01:36, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> The Sony imx477 uses the same silicon enabling reference code from Sony in
> the available examples provided.

Have you had any conversations with Sony on whether the same register
settings are genuinely valid for all of these sensors?

IMX477 is the sensor in the Raspberry Pi HQ camera, but the register
set that we have from Sony has many undocumented (to us at least)
registers for image quality tuning that aren't in the imx412 driver -
we're up at 417 registers vs imx412's 231 [1].

Raspberry Pi has previously had discussions with Sony regarding IMX378
vs IMX477, which is also in the same family. Whilst nearly identical
in register setup, they gave us 3 additional registers that have to be
set for IMX378 to avoid image quality issues. I wouldn't be surprised
if something similar weren't true for IMX412 and IMX577.

I'm not saying it's impossible to remove a load of duplicated register
settings by combining these sensors into one driver, but this current
patch looks a little simplistic, and probably needs to be looking to
have a struct for sensor specific registers, not just changing the
compatible string and advertised name. Or perhaps we extend that later
once the compatible string has been added?
Merging them does bring issues with regard to testing as it is
unlikely to be practical to test any new features across all variants.

  Dave

[1] https://github.com/raspberrypi/linux/blob/rpi-5.15.y/drivers/media/i2c/imx477.c

> Add an imx477 compatible string and re-use the existing imx412 code.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/i2c/imx412.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index bc7fdb24235f..1013a5afc85f 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -1289,6 +1289,7 @@ static const struct dev_pm_ops imx412_pm_ops = {
>
>  static const struct of_device_id imx412_of_match[] = {
>         { .compatible = "sony,imx412", .data = "imx412" },
> +       { .compatible = "sony,imx477", .data = "imx477" },
>         { }
>  };
>
> --
> 2.34.1
>
