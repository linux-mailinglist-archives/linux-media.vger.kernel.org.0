Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF7E163D2B9
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 11:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235372AbiK3KDx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 05:03:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232803AbiK3KDo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 05:03:44 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0296E2FA7C;
        Wed, 30 Nov 2022 02:03:44 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id k2so11836007qkk.7;
        Wed, 30 Nov 2022 02:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eaVjldeP+uADnpJz5nFWHJvfok/q/RDOhNw15aDm8Fk=;
        b=b+gunAuaxdJNm18EbKAXvEkjEIWYWR4ShZh2OJI2DmqX9NrIVhTev4poU37dgVDsnD
         EdlL7f5YevGZnnetp9PEu8ogL05rVlKg3f1LqqZGcd7mE/P94Opv5APFmhvXmmVwwawF
         7wxYLEQSPNR1qZivhVOCuOoXntHtXfWANQQUE2XgjeJS6bG5MPcWddI7VP4N7UssL5bs
         BKjEw63j33NYKWvj5tGoUGeGMDlg6VmGjx15ElnJKUQ5/invypY6R5hGCVfjO+sp8eB+
         s4Idx0/PjELuiKHaVybfECqpqlUmRW2tKU6gm28wNDbmjB5U1sAYMAvuYB8Au91tpg7H
         aSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaVjldeP+uADnpJz5nFWHJvfok/q/RDOhNw15aDm8Fk=;
        b=cmY4TnSoI8gc+9VmaLjs/wLUTTqnDSp4L1Nx+RqieGCWJN2kqH3Pn6wTKKj2vfrU2H
         0Zj7Aq7fPghnudBQG9Zwej6jzxp38uaPg0K1bxEiw2xFDw9sG4UQ+NtV7cd63r8n9IBK
         7XZH5wIR9hZ1N7Q+lxlCBWQeXWwCG1TxCszoRIxndPxGDjaPyOtXxg8rRz2JS6n7deBs
         Bva/xLBmtQ8zmm6nZuWpmyRKNVjnbQVTCP2ZmPfDzYZ5hVOQerbtBPNuTlXgugLnIy+z
         ixJwyD+RFX8Jztw6UBdZRSfXmNxkVdQVIGs74rLWyNpKjoRbsCi90NT5C7YIc/TXIhCt
         OTVg==
X-Gm-Message-State: ANoB5pmr255tt3ng/GQ/7kbBkld1XJvobOsnEXUgKiz4MP75ikB9cRpp
        FO+7Bad27r+VFFVGKPZUNWXF3IkUWI3ElopLeqw=
X-Google-Smtp-Source: AA0mqf6ajD+uUb73bB7xIine8wZa8kJJXlWR4hBFk0gUci+QyAlbT3ut/JGRChCt9QrYbz9VAD4mUqqCyqtpcKxA8AM=
X-Received: by 2002:a05:620a:1aa3:b0:6fa:b56f:7ede with SMTP id
 bl35-20020a05620a1aa300b006fab56f7edemr54317437qkb.383.1669802623073; Wed, 30
 Nov 2022 02:03:43 -0800 (PST)
MIME-Version: 1.0
References: <20221129231149.697154-1-hdegoede@redhat.com>
In-Reply-To: <20221129231149.697154-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 30 Nov 2022 12:03:07 +0200
Message-ID: <CAHp75Vfvsefb8M-yZXxu18PQwnN7b0NgCSJKpQ4Qcdkv5Tu9-Q@mail.gmail.com>
Subject: Re: [PATCH 0/6] ov5693/int3472: Privacy LED handling changes + IPU6 compatibility
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
> Hi All,
>
> The out of tree IPU6 driver has moved to using the in kernel INT3472
> code for doing power-ctrl rather then doing their own thing (good!).

than

> Some of the IPU6 devices with a discrete INT3472 ACPI device have a
> privacy-led GPIO. but no clk-enable GPIO. To make this work this series
> moves the privacy LED control from being integrated with the clk-provider
> to modelling the privacy LED as a separate GPIO. This also brings the
> discrete INT3472 ACPI device privacy LED handling inline with the privacy
> LED handling for INT3472 TPS68470 PMIC devices which I posted here:
>
> https://lore.kernel.org/platform-driver-x86/20221128214408.165726-1-hdegoede@redhat.com/
>
> This obsoletes my previous "[PATCH 0/3] platform/x86: int3472/discrete:
> Make it work with IPU6" series:
>
> https://lore.kernel.org/platform-driver-x86/20221124200007.390901-1-hdegoede@redhat.com/
>
> Mauro since laptops with IPU6 cameras are becoming more and more
> popular I would like to get this merged for 6.2 so that with 6.2
> users will be able to build the out of tree IPU6 driver without
> requiring patching their main kernel. I realize we are a bit
> late in the cycle, but can you please still take the ov5693 patch
> for 6.2 ? It is quite small / straight-forward and since it used
> gpiod_get_optional() it is a no-op without the rest of this series.
>
> This series has been tested on:
>
> - Lenovo ThinkPad X1 Yoga gen 7, IPU6, front: ov2740 with privacy LED
> - Dell Latitude 9420, IPU 6 with privacy LED on front
> - Mirosoft Surface Go, IPU3, front: ov5693 with privacy LED,

Microsoft?

>                               back: ov8865 with privacy LED

I like this series! Minimum invasion and code.

-- 
With Best Regards,
Andy Shevchenko
