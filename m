Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B112FD05D
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 13:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388802AbhATMiX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 07:38:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388984AbhATLOe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 06:14:34 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1236CC0613D6;
        Wed, 20 Jan 2021 03:13:54 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id i141so11618185yba.0;
        Wed, 20 Jan 2021 03:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n8w0wrgIwK99I/XLO+qT38i1rhaM0hDIWfrrjrmpxSs=;
        b=GXni0TITHijZ716FXff3R1IztZ1OMAIBdCEy032oVBOVCA9SH86KOh4thFAc8jCPwf
         lG06FYLYbrU1WcJqfNjUszxi+qAQwVl8vVkC2mcetS9X8Jrc6MQy2SFKZlRi24sWr2UT
         HGJpAchnTBiTBKbs3eC22aurTuhGv8eGvo9aHWuXbJopG8s0yVjHzhbKWF/wvD/ggHaH
         B/CCZ5D8xHC9SayI/EOkRbzFJGFsaedVPJG5nrxw8Sik2/80kDNQ5e/EmwyXz23VDis2
         YqjcmH3aJn5sSKJgwI1mxeZOP95M+Re+TehgarhznQhcBZFokgQqKURcvIlLz+d1hmYM
         1EWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n8w0wrgIwK99I/XLO+qT38i1rhaM0hDIWfrrjrmpxSs=;
        b=S4VsFzp17xaFx1W6PkH2E0CslL6JvCVOQ3CjHwb93u0Z2xIdCpPpiQcMlhdhqOZWRA
         Oqi323xqMqXZNfPuyzTHvQz9pww4vrHtQ/n3HcpQzDx8zxwVePZi5AOfjO5tLU9rvM0a
         CSdvEtuCfC/n72W0jUoQBX1tRfASMMHDkwVSmpeMLjAEvA3JGhnONgqJT9eF9cy3jUmE
         4ZMvmPwzS8On8JCCiUh9l0/47ESYgj4lzW9YbTP4DFqR54AfYTYoM4/HJsx0z0bg5WpS
         iaGxBCLv7+l5pqw/vwzpbdo13Z12kJeA/W8oIRfkXY2qAlcj/uQnlGc75ShEmDIWKGNM
         OVqg==
X-Gm-Message-State: AOAM533/sneAQRwmxXv6pdRUAdatfxt/7IXs4wgQsev9vXC4DhTNY5yV
        aH1Qa/VulO9I59VOJMmfxA5+Y5WMHQQv8VgAXVw=
X-Google-Smtp-Source: ABdhPJyYcXGJ7UBt8GoLLEiX2wuisF0lCj3RDfHKYpJuROaJ4hobYM9JG5KV1nkwI4hEZyy4YqRoes955e2EyvyM5Eo=
X-Received: by 2002:a25:94b:: with SMTP id u11mr13351112ybm.518.1611141233400;
 Wed, 20 Jan 2021 03:13:53 -0800 (PST)
MIME-Version: 1.0
References: <20210120090148.30598-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <a1c42817-e2e4-b96a-c494-742808443f6b@ideasonboard.com> <20210120103648.GI11878@paasikivi.fi.intel.com>
 <8bdf95af-5df7-df7b-4ded-4d291522f77c@ideasonboard.com>
In-Reply-To: <8bdf95af-5df7-df7b-4ded-4d291522f77c@ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 20 Jan 2021 11:13:27 +0000
Message-ID: <CA+V-a8v1W5jdUyD-S_qt4Lu7vksdmLiQrV7ZwJiDGOa6WBiMfA@mail.gmail.com>
Subject: Re: [PATCH] media: i2c/Kconfig: Select FWNODE for OV772x sensor
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 20, 2021 at 11:09 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> On 20/01/2021 10:36, Sakari Ailus wrote:
> > On Wed, Jan 20, 2021 at 10:17:14AM +0000, Kieran Bingham wrote:
> >> Hi Lad,
> >>
> >> On 20/01/2021 09:01, Lad Prabhakar wrote:
> >>> Fix OV772x build breakage by selecting V4L2_FWNODE config:
> >>>
> >>> ia64-linux-ld: drivers/media/i2c/ov772x.o: in function `ov772x_probe':
> >>> ov772x.c:(.text+0x1ee2): undefined reference to `v4l2_fwnode_endpoint_alloc_parse'
> >>> ia64-linux-ld: ov772x.c:(.text+0x1f12): undefined reference to `v4l2_fwnode_endpoint_free'
> >>> ia64-linux-ld: ov772x.c:(.text+0x2212): undefined reference to `v4l2_fwnode_endpoint_alloc_parse'
> >>>
> >>> Fixes: 8a10b4e3601e ("media: i2c: ov772x: Parse endpoint properties")
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>
> >> I see this driver uses subdev API too.
> >>
> >> Should the driver also select VIDEO_V4L2_SUBDEV_API?
> >
> > Yes, it should. Another patch? This one fixes a compilation problem.
>
> Yes, it's probably another patch, because indeed this is a specific fix.
>
> I wonder if that means the builders haven't been able to construct a
> combination without VIDEO_V4L2_SUBDEV_API...
>
Thats because v4l2-subdev.o is built irrespective of
VIDEO_V4L2_SUBDEV_API enabled/disabled and there are empty fillers in
v4l2-subdev.c when VIDEO_V4L2_SUBDEV_API is disabled.

Cheers,
Prabhakar
> --
> Kieran
>
>
> >> Or is that covered sufficiently already on any platforms that would use
> >> the driver?
> >>
> >> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >>
> >>> ---
> >>>  drivers/media/i2c/Kconfig | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> >>> index eddb10220953..bb1b5a340431 100644
> >>> --- a/drivers/media/i2c/Kconfig
> >>> +++ b/drivers/media/i2c/Kconfig
> >>> @@ -1013,6 +1013,7 @@ config VIDEO_OV772X
> >>>     tristate "OmniVision OV772x sensor support"
> >>>     depends on I2C && VIDEO_V4L2
> >>>     select REGMAP_SCCB
> >>> +   select V4L2_FWNODE
> >>>     help
> >>>       This is a Video4Linux2 sensor driver for the OmniVision
> >>>       OV772x camera.
> >>>
> >>
> >
>
