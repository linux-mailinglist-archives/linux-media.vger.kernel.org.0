Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6E963D2A2
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 10:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbiK3J7r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 04:59:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbiK3J7q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 04:59:46 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE8152F38E;
        Wed, 30 Nov 2022 01:59:45 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id d2so6640778qvp.12;
        Wed, 30 Nov 2022 01:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gvd/UsTkZXhKMSN0l+cJA3z1P3QGNDytMulpPdf28ok=;
        b=bczKfFiIRdLnf7fOdZ9h9H5x/IONcQQwNcjJZNLsbGN1t2VTBG3I8PmqPU1T3NFs2W
         9RKfMpyPs3wUtYZ74evNJ9l/kxiBmcimm+CWtzHvbyfnMR5vMy0Ht8OEic6Zz83qmarO
         nqt41Aw/SFxdRbykCzv6qn37OEFtuXzXTE7g/PJPOFF17j4Mjc8dzh4q7z6Sr5aAQrAd
         2jV0EtHZWrQMB0F2xVNM2LTQmQERQNsidzFv4So+7qLdkoi2dXUDNo73I8Uvx8eyobTA
         Ao40PYL/9w/S+azrQG1JXO3LI0uGJZI0KoroCSr/7k39yEtstTFzecD/qjLVRQ9dTIAE
         fHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gvd/UsTkZXhKMSN0l+cJA3z1P3QGNDytMulpPdf28ok=;
        b=6q2uY1NRP0mhtuPKam3ZGgUngCCVtppi+uivmjW0aGqosJ5P8DTya9afek66UuKiQ1
         Ckil1YQfXeiHyA7/JtpFF8aNsrXrl4weknhiVozYxauDxgl3GHauHwzCFaBIwYWaLXEX
         xpyi4vtdDd+pMiwPxh/WWEzVN5NnJe87r89/ICN6BWvscn/1d2wxsslQaPFcb53+4o79
         C8VwvyjbnOuUAs9m04lo9gCZVpZM94fC1405vzA7/E4N8lzULB0PW0Sj8p8EPVPwS0TK
         Bjl122xNcypEpMvHOzRONjvCr22hbzj1l9Avfr2DXnMMA9BuIvfPdr5yNa3ePm/PwXJP
         VI9A==
X-Gm-Message-State: ANoB5plAsqmGK4MX2MRSx/OsfpCX1UY5scx7UfpUHrf+to8D1Z5OwEr2
        9bLhVz9Ths2XsOSCbbBIn22g5+6eSim0vnywrRk=
X-Google-Smtp-Source: AA0mqf429vvSdIdmxi3xgsA14GJGrXZiyGdBzPHGGOVdmepQUfnTDlC+ed4s0TqGQ0aQguShr+zMNuwpnZA4swDV3Wk=
X-Received: by 2002:a05:6214:5cc2:b0:4c6:a622:cb4f with SMTP id
 lk2-20020a0562145cc200b004c6a622cb4fmr46050535qvb.97.1669802384974; Wed, 30
 Nov 2022 01:59:44 -0800 (PST)
MIME-Version: 1.0
References: <20221129231149.697154-1-hdegoede@redhat.com> <20221129231149.697154-6-hdegoede@redhat.com>
In-Reply-To: <20221129231149.697154-6-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 30 Nov 2022 11:59:09 +0200
Message-ID: <CAHp75VdQqJu1YRozd5-qKKn5W9Rk_fLyzfHm0+HVDcgg0heCDA@mail.gmail.com>
Subject: Re: [PATCH 5/6] platform/x86: int3472/discrete: Ensure the clk/power
 enable pins are in output mode
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
> acpi_get_and_request_gpiod() does not take a gpio_lookup_flags argument
> specifying that the pins direction should be initialized to a specific
> value.
>
> This means that in some cases the pins might be left in input mode, causing
> the gpiod_set() calls made to enable the clk / regulator to not work.
>
> One example of this problem is the clk-enable GPIO for the ov01a1s sensor
> on a Dell Latitude 9420 being left in input mode causing the clk to
> never get enabled.
>
> Explicitly set the direction of the pins to output to fix this.

...

> +       /* Ensure the pin is in output mode */

...in output mode and non-active state */

> +       gpiod_direction_output(int3472->clock.ena_gpio, 0);

...

> +       /* Ensure the pin is in output mode */
> +       gpiod_direction_output(int3472->regulator.gpio, 0);

So, previously it was AS IS and now it's non-active state. I believe
this makes no regressions for the other laptops / platforms.

-- 
With Best Regards,
Andy Shevchenko
