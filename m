Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 866D63D300F
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 01:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232445AbhGVW2h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 18:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbhGVW2h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 18:28:37 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E58C061575;
        Thu, 22 Jul 2021 16:09:11 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id z8so379834wru.7;
        Thu, 22 Jul 2021 16:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=WoM9lOF7rkqISzlcDBAnEuQoNMpZpUDXvbZJFWhKlts=;
        b=AA5EkpEOr9Ss7d9k4cvAGogXLVoWf7hTLeuV5wnhW4xiIkvaAvGT/Is6luF6k51oOt
         LfGkwhlXp3vO/V/OXryTB9ppfp3KiUJmahf0XkYcALFaUthPjI6LIkJ6yygnqtVMW1T1
         GGlL5asGWXIZ+mZCM966yQ/asf9ty7Ru/Myr0H4imG5VWMScSS3rM3e8Y5up9DDK3f6R
         /botoFZM1uprtB3Owm7m1Et8yTQIN95ds17F5zlsShwaGcSolos0qYnLiOkjxk+CWDNx
         2y060nlIeNEdeOgUrqfUWf8oyIwCkQrZMaPMk9763+8Vb1lcmdKCe0RpOTBs76MmF4V2
         up3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WoM9lOF7rkqISzlcDBAnEuQoNMpZpUDXvbZJFWhKlts=;
        b=ZRP/BbDCEzJZpxS2Ku1v7QzU7tH96iqTSHlZWpBICVqENAkSbjvBq14PtyWEGNRxxi
         IeTYhOEMOn5oFq0lkQJdNZVnfOgdtTYy+dUbwqUo/suVz5NXOC3lQgiQu6y9t7zAIQ4S
         VnYOW+mEwcPse+qtlAu6xuD6kGmuYkVzLLJEuHxcIFaux4Z3O97TF6YqynWeG5PFCbIr
         hN7MVU2UpREUk6QxlypDtDN2tEAehD7pF6/XFryKGOiQA/0n3cFDt0GAcJY4V+Fojju2
         CJbRXcm6rW8sSVzfqmo0A6SBTzywazUJXmrfEDGd7bCuIjDts0Po66iIkLMRwZAz11sy
         5mfA==
X-Gm-Message-State: AOAM532iz/TG6WbKvvoSOlaW6kG5x5GpBse6oYM5x6RcCv52ITVvgWwV
        grHgmCOuw5l/v5UZxaSTfcE=
X-Google-Smtp-Source: ABdhPJxB+kVF7ksAVmcFEeO7X3K6KnN34qSuz/iDL0Bnj4GYOxZx5Xvrj3L6m0NKX5G1/vRWFTlwmw==
X-Received: by 2002:a5d:4449:: with SMTP id x9mr2223877wrr.52.1626995350261;
        Thu, 22 Jul 2021 16:09:10 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id f130sm31887449wmf.23.2021.07.22.16.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 16:09:09 -0700 (PDT)
Subject: Re: [PATCH 01/13] media: i2c: Add ACPI support to ov8865
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
References: <20210722203407.3588046-1-djrscally@gmail.com>
 <20210722203407.3588046-2-djrscally@gmail.com>
 <CAHp75VfC1QMu=BcMZP8-vX_2paDp4CXqEYEDQnN+7=s3Up9VjA@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <eb13a7da-066f-aa91-e89f-c2171bff2aed@gmail.com>
Date:   Fri, 23 Jul 2021 00:09:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfC1QMu=BcMZP8-vX_2paDp4CXqEYEDQnN+7=s3Up9VjA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 22/07/2021 22:58, Andy Shevchenko wrote:
>
>
> On Thursday, July 22, 2021, Daniel Scally <djrscally@gmail.com
> <mailto:djrscally@gmail.com>> wrote:
>
>     The ov8865 sensor is sometimes found on x86 platforms enumerated
>     via ACPI.
>     Add an ACPI match table to the driver so that it's probed on those
>     platforms.
>
>     Signed-off-by: Daniel Scally <djrscally@gmail.com
>     <mailto:djrscally@gmail.com>>
>     ---
>      drivers/media/i2c/ov8865.c | 8 ++++++++
>      1 file changed, 8 insertions(+)
>
>     diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
>     index ce50f3ea87b8..fe60cda3dea7 100644
>     --- a/drivers/media/i2c/ov8865.c
>     +++ b/drivers/media/i2c/ov8865.c
>     @@ -5,6 +5,7 @@
>       * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com
>     <mailto:paul.kocialkowski@bootlin.com>>
>       */
>
>     +#include <linux/acpi.h>
>
>
>
> No user of it. Probably you meant mod_devicetable.h


Huh, I guess I did yeah...for some reason I thought acpi_device_id was
in acpi.h. Thanks very much; I'll fix it.

>  
>
>      #include <linux/clk.h>
>      #include <linux/delay.h>
>      #include <linux/device.h>
>     @@ -2946,6 +2947,12 @@ static const struct dev_pm_ops
>     ov8865_pm_ops = {
>             SET_RUNTIME_PM_OPS(ov8865_suspend, ov8865_resume, NULL)
>      };
>
>     +static const struct acpi_device_id ov8865_acpi_match[] = {
>     +       {"INT347A"},
>     +       {},
>     +};
>     +MODULE_DEVICE_TABLE(acpi, ov8865_acpi_match);
>     +
>      static const struct of_device_id ov8865_of_match[] = {
>             { .compatible = "ovti,ov8865" },
>             { }
>     @@ -2956,6 +2963,7 @@ static struct i2c_driver ov8865_driver = {
>             .driver = {
>                     .name = "ov8865",
>                     .of_match_table = ov8865_of_match,
>     +               .acpi_match_table = ov8865_acpi_match,
>                     .pm = &ov8865_pm_ops,
>             },
>             .probe_new = ov8865_probe,
>     -- 
>     2.25.1
>
>
>
> -- 
> With Best Regards,
> Andy Shevchenko
>
>
