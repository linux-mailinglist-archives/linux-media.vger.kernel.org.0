Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF2344921C3
	for <lists+linux-media@lfdr.de>; Tue, 18 Jan 2022 10:02:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231984AbiARJBr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jan 2022 04:01:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiARJBr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jan 2022 04:01:47 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3A9CC061574
        for <linux-media@vger.kernel.org>; Tue, 18 Jan 2022 01:01:46 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id u21so76365831edd.5
        for <linux-media@vger.kernel.org>; Tue, 18 Jan 2022 01:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mG7gOq/SSZLmMcy51IR+3veg90IBLDwrL2VOp0HPfVU=;
        b=F3tG5daW7xkDe2egxnNps2tkaVjs43mZ6adzS9r+lPPCGfdXPmOIHxNYMYxWmJVlXC
         Yl1cRM3w1yZ94pczfHlw1ZOnsDd3cY8q8JkOpgnVHEfzWe0GYaJqKUDZt801Qi9uUFIb
         NsGTVxq0RJrRNF9/RmZCb/hf7AQrAhw9Js+BWnfjOZ5KGakuNlhA+xIhwixcO1Rcdgpb
         /q8davOBZf28KZH0GVshq/WzvnaAVTJa3mbT5jtkomHysNpKHf97/rrH7wpyuT6JBrrf
         hn4W+zdc7tp42FQ7i+cPBLnKMZRoRWuq2QIgcK4Nzhf66oE/4wSBwHw4D4icelETzJjY
         51cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mG7gOq/SSZLmMcy51IR+3veg90IBLDwrL2VOp0HPfVU=;
        b=uWqmMzUUL+37lp0AfpPUsf4AJ5EIJMvGMZaMc8WEoSdKhyKZPI285OTdGp779+FvmU
         Kl9DTm+GmpUBaPduPSTSou1TzqDGQdy4UF0YRtulmMKfQ5MXXc8Ztt6BLjegZq3BUmgW
         ewMug5s+LkDqCTsBZl57LDZDX1zY7KNVqaXq0cqVMFipNeDM6xzHE9s0O3w4px0F7/2V
         i0u5QmAFNS4JphQqnccpfoLEV8VqOl5ZTYYEHCVr0cbQmhcVvxlefdWPCvr7hGPiv9ug
         e88VfKITWp50Be946fmU5v8adPcuGAd4i1W0AhLEHHEdXV0Oe2tNRWLf+G7N4fGK2NI2
         E9hQ==
X-Gm-Message-State: AOAM5329ZONDcx8Dkc4BQQNdKsSWrGuux8NYFmGeILIGtyuGPqfU0jKb
        wm7hrxkf6eOUIkNgXDfTkZk0g3Y7yqtBgf3jEwY=
X-Google-Smtp-Source: ABdhPJxZEEFiAtJRlsVeQI0DAErrMlK/vkIDu+T+KICgzfC81hMTsX/cHS7WRtRQVKXVUd9qUMjLtxM1+fIWoId2poo=
X-Received: by 2002:a17:907:968c:: with SMTP id hd12mr19357452ejc.639.1642496505416;
 Tue, 18 Jan 2022 01:01:45 -0800 (PST)
MIME-Version: 1.0
References: <20220116215204.307649-1-hdegoede@redhat.com>
In-Reply-To: <20220116215204.307649-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 18 Jan 2022 11:01:09 +0200
Message-ID: <CAHp75VdkrxaskWfirJqgdXA7c9JFuN_TXBpKSwp9X-++Y4ex2g@mail.gmail.com>
Subject: Re: [PATCH 0/9] media: atomisp: Fix AXP288 PMIC and dual-cam support
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jan 16, 2022 at 11:52 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> Here is a patch series fixing various bugs in the current
> atomisp_gmin_platform AXP288 support (it was completely broken before
> this series) as well as adding support for devices with front and back
> sensors.
>
> This has been tested on a Teclast Tbook11 and a
> Trekstor Surftab Duo W1 10.1, both of which use ov2680 sensors as both
> there front and back sensors.
>
> I think this should also make things work on the Cyberbook T116,
> but I did not get around to testing that yet.
>
> This series also contains some code to try and get things to work on
> Bay Trail devices. This at least makes the driver load, but it does
> not work yet and actually getting it to work may very well be quite
> tricky.

Thanks for the series! I have looked into all patches and I found them
clean and good.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Regards,
>
> Hans
>
>
> Hans de Goede (9):
>   media: atomisp: Don't use ifdef on IS_ISP2401
>   media: atomisp: Don't use ifdef ISP2400
>   media: atomisp: Use irci_stable_candrpv_0415_20150423_1753 fw for byt
>   media: atomisp_gmin_platform: Fix axp_regulator_set() writing to the
>     wrong register
>   media: atomisp_gmin_platform: Add enable-count to
>     gmin_[v1p8|v2p8]_ctrl()
>   media: atomisp_gmin_platform: Set ELDO1 to 1.6V on devices with an
>     AXP288 PMIC
>   media: atomisp_gmin_platform: Do not turn ELDO2 off from axp_v1p8_on()
>   media: atomisp_gmin_platform: Base CsiPort default on detected CLK
>   media: atomisp_gmin_platform: Add DMI quirk to not turn AXP ELDO2
>     regulator off on some boards
>
>  .../media/atomisp/pci/atomisp_compat_css20.c  |   4 +-
>  .../media/atomisp/pci/atomisp_gmin_platform.c | 148 +++++++++++++-----
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |   2 +-
>  .../media/atomisp/pci/sh_css_firmware.c       |   4 +
>  4 files changed, 114 insertions(+), 44 deletions(-)
>
> --
> 2.33.1
>


-- 
With Best Regards,
Andy Shevchenko
