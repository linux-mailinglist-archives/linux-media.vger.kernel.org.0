Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C31923487A
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 17:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387545AbgGaP3K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 11:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgGaP3K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 11:29:10 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 500E2C061574;
        Fri, 31 Jul 2020 08:29:10 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id k63so3120062oob.1;
        Fri, 31 Jul 2020 08:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=90N+DizNEGS1ke1z4ysD0xy01hNFDRmhSDp55LndzYM=;
        b=QOJVzRaNwMysXEWmHwMrwn59HvXe+T9rwydI40AfnEtC9gpfhfaa7DRCnUlSzQMSUM
         pfmoszmrhpDVi4bc3aiAEtduQTcnhXt3g4WJDlFQ8QVmExiLJ4TlS+RGvQq1S7qaCKwl
         ckBYPkEWZq+JfO625y7KWPbQBF/jT1CmMAwQmGA3YWUK30fZJZV4fOcgWzcxi+S10Mor
         /4jJ71p+gzbJVtVVKR+3ajL02mmH2sQkyDTNbO0ldVcdiR63Ctn++yrYmyVNt5igCZ3W
         7fW6eqYYwbyKI1GdZO7iyHbm0DZbOtODptwGuyfHSBbxiXBrp/J7d5yFnI/rqOaH9kZO
         buUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=90N+DizNEGS1ke1z4ysD0xy01hNFDRmhSDp55LndzYM=;
        b=ODzwyW9B6PjI+qder304AZVWkeSx9qCOWXPFm81KTFEnhFGF639ULaZAWaT5/f22KF
         WM3qsNJKa1jd1wn9B8SnHwPJiM9/bhgjQs1rnKxVEqUuszZMX8/K5vMg6rlzNTHACdpt
         wFMoOBqU7eVapfpUUv+/oTNIhQAfdClLaI5sr3rjTjyNC/7cLjCbep103khPfUIsvVcK
         Wyao75nXX0L94X2F843CzPN6KA66ybo7oK74g4qfIbhdKMADAktnQzcNXHOZiW2fgz1U
         Vm7UZ8Tx+lEs2hKSDe2JWnib5nzHbWPjFnxcoewBFOkpn5AS5L1DIf3K+SkzicN8e6HK
         +/Eg==
X-Gm-Message-State: AOAM533gVVPrIowaXKhZiZmvF2lRoR4lvRM/zy25aYOCLXYKK5U7MFBD
        U5aM5x0kpV3OrJx/ZIAFTJyR3Z/fjOfNFEkiivo=
X-Google-Smtp-Source: ABdhPJzEn0VpY6nfOqay120JTISDPfrd/5KoUQgYqFFFObRAkqh9H6ImiJKN0dgt4rlSAcYkUp5IqBXW02/TiuardGw=
X-Received: by 2002:a4a:a782:: with SMTP id l2mr3555935oom.62.1596209349753;
 Fri, 31 Jul 2020 08:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <1596187487-31403-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1596187487-31403-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200731152353.GS13316@paasikivi.fi.intel.com>
In-Reply-To: <20200731152353.GS13316@paasikivi.fi.intel.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 31 Jul 2020 16:28:43 +0100
Message-ID: <CA+V-a8sQtM8MTBgLGdZR5wm_5PkKR8X5yxeK5Xdk-ZHWYAqjvw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: ov5640: Add support for BT656 mode
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the review.

On Fri, Jul 31, 2020 at 4:23 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Prabhakar,
>
> On Fri, Jul 31, 2020 at 10:24:47AM +0100, Lad Prabhakar wrote:
> > @@ -2875,8 +2891,10 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
> >
> >               if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
> >                       ret = ov5640_set_stream_mipi(sensor, enable);
> > -             else
> > +             else if (sensor->ep.bus_type == V4L2_MBUS_PARALLEL)
> >                       ret = ov5640_set_stream_dvp(sensor, enable);
> > +             else
> > +                     ret = ov5640_set_stream_bt656(sensor, enable);
>
> I'd also check for the Bt.656 mode here, rather than assuming it.
>
Sure will do.

> Could you also update the DT bindings, given that the sensor appears to
> support Bt.656 as well? I believe this requires the bus-type property, too.
>
Aha I ignored because this wasnt updated when DVP support was added to
the driver, but will do now.

Cheers,
Prabhakar

> >
> >               if (!ret)
> >                       sensor->streaming = enable;
>
> --
> Kind regards,
>
> Sakari Ailus
