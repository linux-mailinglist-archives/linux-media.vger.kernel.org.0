Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 268013E5AAB
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 15:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241116AbhHJNFq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 09:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240830AbhHJNFp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 09:05:45 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2DDCC061798
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 06:05:23 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d1so20905519pll.1
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 06:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YDO5xx83jVBbz6Chw80GH2rGfTfIZ9o399tPo9FYegI=;
        b=FRVFxETxZbH/1UMzD2f8hOWQHbsNvIKKEhOQ573pRw0nScJSYbOBa8MHs0dZyYMpGL
         iXjySieUtsMhOHskCk+JMFrB3Og7ZuLAwlP0PCNhq1nhOsP/RnUMZ4qdvuBrJutPcWNk
         l4Bq/6loELgeerEWdIXBNnpVgos2lR3Y6toKRkLcfLLwssZt8gaFHEVogBdUjCf61zwZ
         Cn31THnd+LcIdE9Yqe+E+bpPj1C3eQrTw6DfK18DYF3/qZl1dY0sDXyx2ZRJA5769+c0
         FXj+QCTI3mTxAXw0bIxRrxC4Gcu+y7+MLo+2uVMPEMAaV3jFOXKCof4xDpEIghB0s03j
         qtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YDO5xx83jVBbz6Chw80GH2rGfTfIZ9o399tPo9FYegI=;
        b=IxOTSrEblu1Hx2n4ezXmXu0Rll19K4extMSCodrvAUjNMpkfpHs9CxprKkPSoE1h89
         p2uM1jMTY8HpDGM4oISoZhifOGeM57Zpw3Ti8xkKN4L2efQ3hEA7deUkAwbB01uqQDkj
         uYwwNibaMv5ntf4iP9PE3XHoZmA9BjTiclEgdmhFeCn7jZg29Yu1prVwhzHs1o1PHhG9
         T0fP1stZ3fHNRGDBk9Q8M1gIXeKxAwe30ZDUclPm5yK2Qdf2hSPZE0h4RwhfqDjxdFSV
         HJkQJa1t3LTaTsTxwkelEM7bj1457WBAHWtgkZ0R5zaSNHuzca+wxJG1Gbx+5rLRpOKy
         v9FA==
X-Gm-Message-State: AOAM533+c99Ofm9wv8qn0okSYha9QT6mgtV7FeLJY5ek+63+MKnzwId6
        UCjDn5eLwz54k7UqePq096lk1mG67ivxfRpSKnY=
X-Google-Smtp-Source: ABdhPJwKQc26nfLRSCB65XGP/D2KsmHrBPbg58bduGJP59xpGDUSaYyZNFDcZGkQS1FVyFdGkOqtitUjqm1YXGgp13M=
X-Received: by 2002:a63:40c1:: with SMTP id n184mr59035pga.74.1628600723338;
 Tue, 10 Aug 2021 06:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210809225845.916430-1-djrscally@gmail.com> <20210809225845.916430-5-djrscally@gmail.com>
In-Reply-To: <20210809225845.916430-5-djrscally@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 10 Aug 2021 16:04:46 +0300
Message-ID: <CAHp75VfXjWkBLsxmDY6DtaU0cZjVsQntp2Q99hZkguWz6PQy9A@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] media: i2c: Support 19.2MHz input clock in ov8865
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 10, 2021 at 1:59 AM Daniel Scally <djrscally@gmail.com> wrote:
>
> The ov8865 driver as written expects a 24MHz input clock, but the sensor
> is sometimes found on x86 platforms with a 19.2MHz input clock supplied.
> Add a set of PLL configurations to the driver to support that rate too.
> As ACPI doesn't auto-configure the clock rate, check for a clock-frequency
> during probe and set that rate if one is found.

...

> +enum extclk_rate {
> +       OV8865_19_2_MHZ,
> +       OV8865_24_MHZ,
> +       OV8865_NUM_SUPPORTED_RATES,

Same here, i.e. no comma,
If these are the only problems during review of v2, you can ignore
them, they are not critical at all.

> +};

...

> +static const struct ov8865_pll2_config ov8865_pll2_configs_native[] = {

> +       /* 24MHz input clock */
> +       {
> +               .pll_pre_div_half       = 1,
> +               .pll_pre_div            = 0,
> +               .pll_mul                = 30,
> +               .dac_div                = 2,
> +               .sys_pre_div            = 5,
> +               .sys_div                = 0,
> +       }

+ comma.

>  };

...

> +       /* 24MHz input clock */
> +       {
>         .pll_pre_div_half       = 1,
>         .pll_pre_div            = 0,
>         .pll_mul                = 30,
>         .dac_div                = 2,
>         .sys_pre_div            = 10,
>         .sys_div                = 0,
> +       }

Ditto.

...

> +       /*
> +        * We could have either a 24MHz or 19.2MHz clock rate. Check for a
> +        * clock-frequency property and if found, set that rate. This should
> +        * cover ACPI case. If the system uses devicetree then the configured

the ACPI case

> +        * rate should already be set, so we'll have to check it.
> +        */

> +

Redundant blank line.

> +       ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> +                                      &rate);
> +       if (!ret) {

I'm wondering if something like

... rate = 0;

       fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency", &rate);
       if (rate > 0) {

can be used.

> +               ret = clk_set_rate(sensor->extclk, rate);
> +               if (ret) {
> +                       dev_err(dev, "failed to set clock rate\n");
> +                       return ret;
> +               }
> +       }

-- 
With Best Regards,
Andy Shevchenko
