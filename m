Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4AAD2FD03E
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 13:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388641AbhATMiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 07:38:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729880AbhATLJ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 06:09:28 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED75C061575;
        Wed, 20 Jan 2021 03:08:33 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id y128so19068790ybf.10;
        Wed, 20 Jan 2021 03:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=izJjiQyu1GYzGUIAUfxMpuu92rB5Iocb5gRKO07/GnQ=;
        b=cbUC5KOUYNg8M33ntayju3FjU261leLSiPzOC58RMPGUr9aIbXhgW0hpUY1Y486h9f
         WzaCjiN5XjAJAbWx9DH+VbQSPcTHAo98ZNIALTh6PE/I5ZkBtqnI+CVMABP5aDEV2bQN
         hRgG/5kV5rKCh6l5+atY3rWmiR0HcWxvvPGWD3Vn0g7KmepSvStc/DhAbqxYxrCOHHyD
         n9lFCiN2jEr6G6qUyx2F5/QU0GBF0/zr/VIUOX/zfHtv0Zvw7keT7MoYHEvPXM+r3JJ4
         HM1A2o3UafF2jO1pGNzeamYemll1zmQT8icJlPIPfW0F5mvtVBQPbmxq3lX5zQRiRlFQ
         23uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=izJjiQyu1GYzGUIAUfxMpuu92rB5Iocb5gRKO07/GnQ=;
        b=GYuMPnaNEzZRzTNRdPPoUNwUaDW13p/kN+ymQ7DfSXd5COi8ZEK7tX/HfL5/qWGxDQ
         5Ds0Rb7eI/JkqnjG9BjxBCRNvDwWLn8qZbW0HtNngm0V0+gDIrr+uWjnQJ8GiHDQoUl1
         9RnLBK0KuCjS1wKYNTD5qYZwM+IUX5MK7XTYPRvx8Cx6xRgiHfVLUz5m9DtKHVs6v2tI
         Xbwb2joK9pWZfj4Vmni38X9PV1NXyFyA1yLUxewuUMSqP5H+7Nty0My05DRs7BO6Jw8E
         9zbqk/sOqQ4to73uf7T5vRpgpJlCbWyKrIDEVgWvWoFEU0usNS3mUgSY3p63isvvk5bL
         TbJA==
X-Gm-Message-State: AOAM533c2peclKsQylPxEgg36to3GkMAX3jVYMotCAdOvymAFCo4MSnP
        jVNeAQykJkCBTL6djZm50J0ey5I97vvzgVWqpZJuyHd09+mGQA==
X-Google-Smtp-Source: ABdhPJyY8vnco3lwg0Uk86/uEzJNPLaloncnyEg2CPHZZhkizlAJKikX4PKy1+pZu9X3x/35Rd8SxGT3ifB5qWHH430=
X-Received: by 2002:a25:e686:: with SMTP id d128mr12914565ybh.127.1611140912403;
 Wed, 20 Jan 2021 03:08:32 -0800 (PST)
MIME-Version: 1.0
References: <20210120090148.30598-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <a1c42817-e2e4-b96a-c494-742808443f6b@ideasonboard.com> <20210120103648.GI11878@paasikivi.fi.intel.com>
In-Reply-To: <20210120103648.GI11878@paasikivi.fi.intel.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 20 Jan 2021 11:08:06 +0000
Message-ID: <CA+V-a8uveCXV_FZCEVRJSjm=jjOmqGQW99pNkGiJH4eRFngiVA@mail.gmail.com>
Subject: Re: [PATCH] media: i2c/Kconfig: Select FWNODE for OV772x sensor
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
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

Hi Sakari and Kieran,

On Wed, Jan 20, 2021 at 10:36 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Wed, Jan 20, 2021 at 10:17:14AM +0000, Kieran Bingham wrote:
> > Hi Lad,
> >
> > On 20/01/2021 09:01, Lad Prabhakar wrote:
> > > Fix OV772x build breakage by selecting V4L2_FWNODE config:
> > >
> > > ia64-linux-ld: drivers/media/i2c/ov772x.o: in function `ov772x_probe':
> > > ov772x.c:(.text+0x1ee2): undefined reference to `v4l2_fwnode_endpoint_alloc_parse'
> > > ia64-linux-ld: ov772x.c:(.text+0x1f12): undefined reference to `v4l2_fwnode_endpoint_free'
> > > ia64-linux-ld: ov772x.c:(.text+0x2212): undefined reference to `v4l2_fwnode_endpoint_alloc_parse'
> > >
> > > Fixes: 8a10b4e3601e ("media: i2c: ov772x: Parse endpoint properties")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > I see this driver uses subdev API too.
> >
> > Should the driver also select VIDEO_V4L2_SUBDEV_API?
>
> Yes, it should. Another patch? This one fixes a compilation problem.
>
Do agree, I will post an incremental patch on top of this.

Cheers,
Prabhakar

> >
> > Or is that covered sufficiently already on any platforms that would use
> > the driver?
> >
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >
> > > ---
> > >  drivers/media/i2c/Kconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index eddb10220953..bb1b5a340431 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -1013,6 +1013,7 @@ config VIDEO_OV772X
> > >     tristate "OmniVision OV772x sensor support"
> > >     depends on I2C && VIDEO_V4L2
> > >     select REGMAP_SCCB
> > > +   select V4L2_FWNODE
> > >     help
> > >       This is a Video4Linux2 sensor driver for the OmniVision
> > >       OV772x camera.
> > >
> >
>
> --
> Sakari Ailus
