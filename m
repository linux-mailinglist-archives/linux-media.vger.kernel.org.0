Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD2484419E6
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 11:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbhKAKc1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 06:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbhKAKc0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 06:32:26 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3615AC061714
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 03:29:53 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id c28so35332378lfv.13
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 03:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nr+uoSbqMlzaD10waKHpGV/0b7+Bom5T7XVpT2ZiGyU=;
        b=fJqrwmkzzdU1PNYvQlX9da7iUVJpiPO8ho1dL7fhLvnhRtqo+RLYTEVApOYmKF0n3+
         OiVajpvOKypn4Hnx/qZ+DuJLiw31GxuyxwgFo8I0TjOmFKS8FUrym3XBkLcf0FGqx24Q
         Ng1x40YPiRw6wcliWm/R6amLzjDCn0lAudUJlIEVslo4gO7ApIWbLjXPXn/1gnAhmSQ8
         KDUrT93FGNcTYoti0Wwd2kP68K2loqHLM8cVraWeNo7vR8nzNhoPgcpOEijiSRawyQC5
         xJCn0W4jOmEtlvoU9HtpMYUExO/ImEQ45J5UkUDT2lWODrQzEm5T0/9RDzUgxvYRma9s
         vj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nr+uoSbqMlzaD10waKHpGV/0b7+Bom5T7XVpT2ZiGyU=;
        b=UouuOvBOf3T+BqjAdt++ZupBOqjt9cIytYqmQ+IQ1NzwYUqeI3LWRNKfiOhXTl5tvW
         04EaInvktahqNl3eyX4mCLKV4bHKiFN2/tlUGk4iGX+83DTBInphBj07QKYewQm3dmoL
         BZKAJgLpVFJ8UzDTXJXZ7XUbwrfTTU64uRcusHSmlB87yme6i1rRxH+6Fm4WOQHIelwx
         0tS/Zh9tecu4jaHpFuINL26jPvz9mEJbaPdVsWBIF0qQa71PftETlPcQPHOCLV6VDlLJ
         DodfyFyJT5b0sqQ/0wE1JJ4HuwH8/ArHeSLfKm/W7ebtZFvWbcgZoMFYtWkOhbrDZA34
         KDog==
X-Gm-Message-State: AOAM533sdu9dssHVh22k2M2eK7MO3q/deVRusojqohXbrk8yPDS9qya/
        X3aQ0qhPDa5SidCBq2+L6QhEWSwXSS2Gpoal2cY=
X-Google-Smtp-Source: ABdhPJywl9HGaIfLT/DPWZ61Q+SoOSYkgcCQnmBjTU/7IE1WIKq1dd0D3gg3EcYbwhvS5ZUu+V+5befS/cQfgJwHEzg=
X-Received: by 2002:a05:6512:3f6:: with SMTP id n22mr13046376lfq.94.1635762591581;
 Mon, 01 Nov 2021 03:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211101001119.46056-1-djrscally@gmail.com> <20211101001119.46056-5-djrscally@gmail.com>
In-Reply-To: <20211101001119.46056-5-djrscally@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Nov 2021 12:29:01 +0200
Message-ID: <CAHp75VfuMtdMrXnFABW8CELNuZEjQUiV9LhzAtTWRr4+aOkLYA@mail.gmail.com>
Subject: Re: [PATCH v4 04/16] media: i2c: Support 19.2MHz input clock in ov8865
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 1, 2021 at 2:12 AM Daniel Scally <djrscally@gmail.com> wrote:
>
> The ov8865 driver as written expects a 24MHz input clock, but the sensor
> is sometimes found on x86 platforms with a 19.2MHz input clock supplied.
> Add a set of PLL configurations to the driver to support that rate too.
> As ACPI doesn't auto-configure the clock rate, check for a clock-frequency
> during probe and set that rate if one is found.

...

> +       /*
> +        * We could have either a 24MHz or 19.2MHz clock rate. Check for a
> +        * clock-frequency property and if found, set that rate. This should
> +        * cover the ACPI case. If the system uses devicetree then the
> +        * configured rate should already be set, so we'll have to check it.
> +        */
> +       ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> +                                      &rate);
> +       if (!ret) {
> +               ret = clk_set_rate(sensor->extclk, rate);

> +               if (ret) {
> +                       dev_err(dev, "failed to set clock rate\n");
> +                       return ret;
> +               }

dev_err_probe()
7065f92255bb ("driver core: Clarify that dev_err_probe() is OK even
w/out -EPROBE_DEFER")

> +       }

...

> +       for (i = 0; i < ARRAY_SIZE(supported_extclk_rates); i++) {
> +               if (sensor->extclk_rate == supported_extclk_rates[i])
> +                       break;
> +       }
> +
> +       if (i == ARRAY_SIZE(supported_extclk_rates)) {
> +               dev_err(dev, "clock rate %lu Hz is unsupported\n",
> +                       sensor->extclk_rate);
>                 ret = -EINVAL;
>                 goto error_endpoint;
>         }

find_closest() ?

-- 
With Best Regards,
Andy Shevchenko
