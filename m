Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2C5663D26F
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 10:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbiK3JuG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 04:50:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234667AbiK3JuD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 04:50:03 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D9825E96;
        Wed, 30 Nov 2022 01:50:03 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id c15so10742723qtw.8;
        Wed, 30 Nov 2022 01:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o2E5Vtfoc6hZxpE5TiF8GkWs3qrhcqnamB/Vqoexlhk=;
        b=UDEM0SsVmbbUnJQtdkjqHwBL0B4xToYFEzwX5WFkhCPiT+xssF/HxIVKaDQ7OOMZof
         RVFk7ShFIOdiBiVw3KXfX8R1Id/GEvybwwb+DGp+V93wxaTZf6OABOH9KZCOFcxeTgPY
         EUYb6SEn6uLxjFJep+I/wkgK/zmy5Tbq1wBh/MFqYd5MHM1FyMNAmKPVPxKK+D65U6Ch
         0QjVmv6gT1EJUkf4Za/uzfNKFC1+Ms8dYPNQy3nrZXC4Hxv+ngXn/mKd1dprpQk0tHxe
         xo6pYH/oXd8BQOfRBzc3VCgRsnBZP1X1r45qI3zGMuA9p9Lo0O+w7TZ/xSQx/2G95tib
         g7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2E5Vtfoc6hZxpE5TiF8GkWs3qrhcqnamB/Vqoexlhk=;
        b=oVE66gcL4fnoIObp8WtbvYgXvVBkocomOeTUAE5dJqphzpm7UV9zGaECw+B/wPA5HF
         F2Jj1G5NTFUXva04RHFWpbEacC2W70ohM/G906oY7RZfbTy1fg+eXqcoxVy/MHkoGw+w
         tn4szi6ozEcVEO1huu6AJa/mX3R/+oDvk9N9TJkQXfVk+O1l+TSVzz+DhOVN5/RzrUjp
         RZksWVwlbVHA8G5GwZxO9Zki5lCC1WI2X79b/KzNZwLc9e175r+qb72y5SvQzhc/isCu
         lefP/afdxk+jqmtKi8QdZz/ECy2sPxX1/IWF77G7GLEdatfbjrP26ec8yuKGyZ9METzz
         tu0A==
X-Gm-Message-State: ANoB5pmXA2m1MyytYwftOWILxVhxb8hYYZnAqdok2yRUQToFIdTn59ZI
        qi5Mq1qbuC3OarnDjPIaVTdoaa39I9fw3qoz9rk=
X-Google-Smtp-Source: AA0mqf7T8vFhUoXXhHAh6Wo4tYYurRsmOOtoj/a4D7++TGSzS/Dt5JWijyllWniHoQWAnDEyZB1TY7cR998tw18xVMo=
X-Received: by 2002:ac8:5501:0:b0:3a5:cb82:109b with SMTP id
 j1-20020ac85501000000b003a5cb82109bmr57102282qtq.61.1669801802131; Wed, 30
 Nov 2022 01:50:02 -0800 (PST)
MIME-Version: 1.0
References: <20221129231149.697154-1-hdegoede@redhat.com> <20221129231149.697154-3-hdegoede@redhat.com>
In-Reply-To: <20221129231149.697154-3-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 30 Nov 2022 11:49:23 +0200
Message-ID: <CAHp75Vc8BrXBnkvRgWk=hD9gHd5_Yd7fjJRsVA+G2+D2x1Ozbw@mail.gmail.com>
Subject: Re: [PATCH 2/6] platform/x86: int3472/discrete: Refactor GPIO to
 sensor mapping
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 30, 2022 at 1:12 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Add a helper function to map the type returned by the _DSM
> method to a function name + the default polarity for that function.
>
> And fold the INT3472_GPIO_TYPE_RESET and INT3472_GPIO_TYPE_POWERDOWN
> cases into a single generic case.
>
> This is a preparation patch for further GPIO mapping changes.

...

> +       switch (type) {
> +       case INT3472_GPIO_TYPE_RESET:
> +               *func = "reset";
> +               *polarity = GPIO_ACTIVE_LOW;
> +               break;
> +       case INT3472_GPIO_TYPE_POWERDOWN:
> +               *func = "powerdown";
> +               *polarity = GPIO_ACTIVE_LOW;
> +               break;
> +       case INT3472_GPIO_TYPE_CLK_ENABLE:
> +               *func = "clk-enable";
> +               *polarity = GPIO_ACTIVE_HIGH;
> +               break;
> +       case INT3472_GPIO_TYPE_PRIVACY_LED:
> +               *func = "privacy-led";
> +               *polarity = GPIO_ACTIVE_HIGH;
> +               break;
> +       case INT3472_GPIO_TYPE_POWER_ENABLE:
> +               *func = "power-enable";
> +               *polarity = GPIO_ACTIVE_HIGH;
> +               break;
> +       default:
> +               *func = "unknown";
> +               *polarity = GPIO_ACTIVE_HIGH;

A nit-pick: In long term maintenance it's always good to have a break
statement even in the default case.

> +       }

-- 
With Best Regards,
Andy Shevchenko
