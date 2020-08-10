Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C018240277
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 09:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgHJH02 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 03:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbgHJH00 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 03:26:26 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A90AC061756;
        Mon, 10 Aug 2020 00:26:25 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id m200so4640926ybf.10;
        Mon, 10 Aug 2020 00:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a/yQjIpGQ9bwN19T0c8h1wga/yLfPYyGvmAA4RpqO9o=;
        b=OG+MeLJSksMXQYnng3ZOq6fUtWnCYdY5dR1M1xCP2OB9ND+9+4gTccvtg9esOBO8aY
         gtirQoqKkpqoqmrbG7tGO0qdLyMXyV0NJ/xJER24xixIb67EJa8RmSQF2Ff7aIr2wYAG
         bAoeaXl/I2YDiY3TlR4Q8dzk+t2YsYj46MLrVBciwEz2H7kh6AorllAny6O+UFnqdWsF
         oVAqzKJFAsREVEASyYves69+s+Y/hLecF33Xiz/Gck+5vGk2HL4Ngq/msOKp+arz7rHV
         sjHchbSuQbUBIppXohuffpkxb3UsDyddlDTDs+IACcu8BNO6GDRwD0PhZpPHJkJj0axg
         39Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a/yQjIpGQ9bwN19T0c8h1wga/yLfPYyGvmAA4RpqO9o=;
        b=nku+gK88rrPf6TCNq7PmCU4m+fGk6qquKezO60dXXYaLUd2mnncLJY6taH+eahrGMM
         pJVOboJK1nRwZzyGNj1SUTxQd4L8v5J1dutJLVSbWo7pGWdWLYUpe8KiSC/AIv4gK+j3
         6/oiVAaTnY/UDljhEQt5cdPfYa8Yx2pO/vt99S9SBhFhUrAQNkVa4o8umkOD/37OFYyw
         3QwDpUuIftvgT1oCEoIBlRxz5WJmE7huXVWLlg5+Bp37Q2MxZ/KfBwQms52hlvNcp2Tu
         WJ5AsQdSMytmcvxFtgYOe1gfzB/VHibFQR5oF82X0Q+nv5KDcaHt7O1Rbg0UbNoMkff7
         gBBA==
X-Gm-Message-State: AOAM531T2GleVWjQet8F1kX8dndv8rVswAN7m+4irktcJHRH/UewRpTq
        BmcDNcJ12iODtC0zWlC1985CxTpTjSn1tQ4lRwE=
X-Google-Smtp-Source: ABdhPJx5ZqLguTnboxWSbfqbxWq6Zi7lwEzwh50vnLLZ5b7sQaMUmIrC4FfDLxZUtT0lEp3C6ZVNHYQi/QODDA9MeYY=
X-Received: by 2002:a25:b74b:: with SMTP id e11mr3088014ybm.395.1597044384816;
 Mon, 10 Aug 2020 00:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <1596465107-14251-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200806144828.bflbpla2x4sjfsbp@uno.localdomain>
In-Reply-To: <20200806144828.bflbpla2x4sjfsbp@uno.localdomain>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 10 Aug 2020 08:25:58 +0100
Message-ID: <CA+V-a8tmU2OVg8L8qsySG1CtpMw08BmjeyYBiakXdAh8vgxuNQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] media: i2c: ov5640 feature enhancement and fixes
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,


On Thu, Aug 6, 2020 at 3:44 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hello,
>
> On Mon, Aug 03, 2020 at 03:31:43PM +0100, Lad Prabhakar wrote:
> > Hi All,
> >
> > This patch series fixes DVP support and enables BT656 mode in
> > the driver.
> >
> > @Jacopo Mondi - patch 1/4 will collide with your patch series [1],
> > feel free to merge it as part of your v2.
>
> This would actually make my life simpler, as one of the issues I had
> was trying to make bus-type required to be able to differentiate
> between different properties.
>
Thank you for taking care of it.

Cheers,
Prabhakar

> >
> > [1] https://www.spinics.net/lists/linux-renesas-soc/msg51236.html
> >
> > Cheers,
> > Prabhakar
> >
> > Changes for v2:
> > * Added support to fallback in parallel mode
> > * Documented bus-type property
> > * Added descriptive commit message for patch 2/4 as pointed
> >   by Sakari
> > * Fixed review comments pointed by Laurent to have separate functions
> >   for mipi and dvp setup
> > * Made sure the sensor is in power down mode during startup too for
> >   DVP mode
> >
> > Lad Prabhakar (4):
> >   dt-bindings: media: i2c: ov5640: Document bus-type property
> >   media: i2c: ov5640: Enable data pins on poweron for DVP mode
> >   media: i2c: ov5640: Add support for BT656 mode
> >   media: i2c: ov5640: Fallback to parallel mode
> >
> >  .../devicetree/bindings/media/i2c/ov5640.txt  |   9 +-
> >  drivers/media/i2c/ov5640.c                    | 333 ++++++++++--------
> >  2 files changed, 198 insertions(+), 144 deletions(-)
> >
> > --
> > 2.17.1
> >
