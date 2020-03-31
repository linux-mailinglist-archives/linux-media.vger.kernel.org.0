Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE1D21997BA
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 15:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730770AbgCaNmq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 09:42:46 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43948 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730216AbgCaNmq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 09:42:46 -0400
Received: by mail-lf1-f66.google.com with SMTP id n20so17312816lfl.10;
        Tue, 31 Mar 2020 06:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g+oOx8oe1EcOiEsQwOx41lZlMI2tyT5SQXJ7reK/MjM=;
        b=oDM3v2vUvoB+zQ1qxrk49Rs6ZBg+nafBMNk2MMzG+O8CPZW0Hudl4k6TwLZW4EMtJQ
         fLBL0OIBYoNagGt804nTK8OZRHQcGD9TkcD/23CfxQu/IVD+Z8JAEon21F8t1lvztDi9
         Tz5F28Tp5Nb3drKK+NDJO4zfpF1LnPGT54tgPPtUquRxFbqVF3sityDiMimZ94LN5H4m
         9E30zffqveXsn+CfPYHHzZVgdTvf71weNFZ1d3R85/ri4X85LHdLh1JeCSY+++udvlls
         sKV1dgy8Tmy1IXx/3uurUncdjaJy+dkQBEYwfdDl7J2IpK1ctInx9/6BCAFJfyhgcD0E
         i0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g+oOx8oe1EcOiEsQwOx41lZlMI2tyT5SQXJ7reK/MjM=;
        b=tLJWzIzn0OT1fy/Zr0ueAlW7ElOFdZjI18FZsI4XwVB4X9Bx2cX2eriRwxzBkPGoYV
         098142kSvrci7raBZZTnj8RroXaWTaNQ+nJeWYt60I1BBPe7q+nu94V3qtOruFWWgST6
         JiAJeOcawYkAwlwz95xD0ToyLbs3i7576nn0KkEPdYuaXRCwPosyNHcymVBA+IjRSEGr
         hxDtz4wTTgnaURxxEmqeB6/r6TMByzhvGapFOEIBcKF3Gui/hdGA9IcLn0aI1exzgUgw
         MUihpWiwOz+ulsmK9UEZ0AB981DnjiaoSZkbYHf8jzzBfDy+Blu0Hr2nCkxMX7DF0QeY
         ixGQ==
X-Gm-Message-State: AGi0PuYjAXBve7kK8MafkdzIY9hdsc/TwRNkdUb+xHjWBE+3ZVtYcMWO
        7d2KHDNIbCRI19I2WMVynKGbhhxf+maBug/iYkE=
X-Google-Smtp-Source: APiQypL+H+6Kyrx6/X3/WVdrnJz8eQS2wW8bf4HVX9M6MsjMu5LPvIiOLF5pjFJDq/yzciCsM+hUGrhPSZOPEEObj1A=
X-Received: by 2002:ac2:4c3b:: with SMTP id u27mr11614521lfq.7.1585662163062;
 Tue, 31 Mar 2020 06:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200313110350.10864-1-robert.foss@linaro.org>
 <20200313110350.10864-3-robert.foss@linaro.org> <CAOMZO5D9bmXt9_qGTXw+qUG6JDHfuNtx++fJPJtn+mj1Dzsbag@mail.gmail.com>
 <CAG3jFystdBKnosNQ0LeWQfHEtMgU4iGSr_XuS2XU3-902c31nQ@mail.gmail.com>
In-Reply-To: <CAG3jFystdBKnosNQ0LeWQfHEtMgU4iGSr_XuS2XU3-902c31nQ@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 31 Mar 2020 10:42:33 -0300
Message-ID: <CAOMZO5DHBCJbfS2Lt7R-3J_TUJi1is2Xn6n5iZkRwvmn5i6Dmg@mail.gmail.com>
Subject: Re: [v2 2/3] media: ov8856: Add devicetree support
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On Tue, Mar 31, 2020 at 10:37 AM Robert Foss <robert.foss@linaro.org> wrote:

> After testing this change, it breaks the driver during probing.

Why exactly does it break probing? Maybe the GPIO polarity defined in
the device tree is wrong?

> I had a quick look into GPIOD_OUT_HIGH & LOW definitions, and they
> seem to never be 0 or 1.

If you do a grep in all gpiod_set_value_cansleep() usages in the
kernel tree, there is not a single case where  GPIOD_OUT_HIGH or
GPIOD_OUT_LOW is passed as argument of gpiod_set_value_cansleep().
