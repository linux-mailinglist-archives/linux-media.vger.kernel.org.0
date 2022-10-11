Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE615FAA90
	for <lists+linux-media@lfdr.de>; Tue, 11 Oct 2022 04:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbiJKCVb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 22:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiJKCVa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 22:21:30 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58405C9C9
        for <linux-media@vger.kernel.org>; Mon, 10 Oct 2022 19:21:28 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id p7so9643258vsr.7
        for <linux-media@vger.kernel.org>; Mon, 10 Oct 2022 19:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iACEFRvthNjVfwth1lqJaiAI0y1r8vkx1gBSUQShI5g=;
        b=A8zD4Nffbi6p4gvVPbkuMqmKMs4W0OnJfYzlNB5Aq2ucC5kAg2Z/yAv7WUqTfbnaLh
         HBPQ25ARAftcEzd4/nGABDU2qo/1Vyt7ZAn5Lwc2wHWiFrrv1CPLpAaT1yNIfZD20V2N
         WJDTyPzyIzktwCtxSP+14s+QHNAqyQhbOtWb4vKgegI3weKibwzCcU9g1taZ4s7YA540
         kivtqSjcABH7Rkr3Tm/xy/BexDh75uCvSEQw/UpkUjHnuKvhMrPadNFznT37dRUj7hL7
         Zd65PMnGqKuzFGwtVDATFhjNk2DuJF/i2T23JxKDp28EAe4VverAwZxpUP6AK4DU02xk
         Ne6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iACEFRvthNjVfwth1lqJaiAI0y1r8vkx1gBSUQShI5g=;
        b=uyurIbB0q8kZVhaw+U5O13yabCH4arLaavtrnYwMz7xBqlAyWfBWixu4XixE5vX1x2
         IXlmP1yTsEhvfuOS+6bGK0FRj4zKzuBsxiAMbXvdgecYOxsHAhrwlh8Sqr/iON1I1CL6
         ksGi7S0JjPcKAXsePUd58Xlh6Nh0lmkG8OusSW7VsLkWcSRL/KQf0yIpXaoyx6On1NA2
         4cvQ9iOgdxVgdSHhi3IyySofhfBYJO8YFiNDfvw08z0nAtyp/MnEuFpo1GmclhpKiLG2
         HVgJCyde0sWW6JcMq6cCgyg7wH4b5LR4bPf24k6ZwhuNc3TfivyZP/0i4Fm7pNbKV2Fj
         iBmg==
X-Gm-Message-State: ACrzQf3GXJwz9HaSZjONs49rbLkQ8vRs9p2Q9i2SncJQAsKrp0qKyfMy
        /rok/Z56Ovg4Ow5KqqqDlfl+gfdx6psgxUZcwIk=
X-Google-Smtp-Source: AMsMyM7TedN5jPWaebDuC4H1I6h33r+iFkdiNEZARt+lIBbJ05N7wR8TusecGx/d+jlS2CJb9wEVYET7TDFO0coshWg=
X-Received: by 2002:a67:fc54:0:b0:3a6:add0:dd8b with SMTP id
 p20-20020a67fc54000000b003a6add0dd8bmr10600833vsq.82.1665454887698; Mon, 10
 Oct 2022 19:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
 <20220712000251.13607-8-laurent.pinchart@ideasonboard.com>
 <CAHCN7xKq+a05P4RKtToLiCqW4ZCQEYjKBpuS6Q0hOv4y3i8n+g@mail.gmail.com> <Y0QgWDNor/YKWcZ/@pendragon.ideasonboard.com>
In-Reply-To: <Y0QgWDNor/YKWcZ/@pendragon.ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 10 Oct 2022 21:21:16 -0500
Message-ID: <CAHCN7xKJ_oeVs1PXiuE+-8CLNfi5EEwYckJA3amu+94u4KQEnA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] media: nxp: Add i.MX8 ISI driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Martin Vaklev <mvaklev@thermal.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 10, 2022 at 8:38 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Adam,
>
> On Mon, Oct 10, 2022 at 07:27:14AM -0500, Adam Ford wrote:
> > On Mon, Jul 11, 2022 at 7:06 PM Laurent Pinchart wrote:
> > >
> > > The Image Sensing Interface (ISI) combines image processing pipelines
> > > with DMA engines to process and capture frames originating from a
> > > variety of sources. The inputs to the ISI go through Pixel Link
> > > interfaces, and their number and nature is SoC-dependent. They cover
> > > both capture interfaces (MIPI CSI-2 RX, HDMI RX) and memory inputs.
> > >
> > > Signed-off-by: Christian Hemp <c.hemp@phytec.de>
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> >
> > I did some testing on the imx8m Nano using the code from Laurent's git
> > repo as a starting point using an OV5640 camera.  I was able to
> > capture an image, but there is a solid green line at the top of the
> > image.  I am attaching a screenshot of my ceiling fan.  It's a little
> > blurry since it was spinning, but I have taken other images and this
> > green line remains. It's unclear to me if it's a camera issue, CSIS
> > issue or an ISI issue, but I was curious to know if anyone has seen
> > this on an imx8m Plus?
> >
> > I'm going to try to run a similar test on an imx8m Mini when I get
> > some more time.  I don't recall seeing this before, but I know there
> > have been some updates to the OV5640 and CSIS drivers.  The same
> > camera works on the Mini, but it has a different capture part, but I
> > think the CSIS is the same, so I'm hoping it might narrow the issue
> > down to ISI or not.
>
> Could you provide the same image in PNG format ? The lossless
> compression of JPEG creates artifacts that make it difficult to see what
> should be attributed to capture issues and what is caused by the
> compression.

I changed the output of the ISI to RGB and captured it as a PNG
instead of the JPEG, and the green bar disappeared.  I then re-ran it
with JPEG again, and the green bar returned.  I decided to convert to
RGB, then capture as JPEG, and the green bar stayed, so it appears to
be limited to the JPEG converstion and not the ISI.

I'll run some more experiments when I have more time, but for now , I
guess there is nothing to worry about.  Sorry for the noise.

adam
>
> > > ---
> > >  MAINTAINERS                                   |    7 +
> > >  drivers/media/platform/nxp/Kconfig            |    2 +
> > >  drivers/media/platform/nxp/Makefile           |    1 +
> > >  drivers/media/platform/nxp/imx8-isi/Kconfig   |   22 +
> > >  drivers/media/platform/nxp/imx8-isi/Makefile  |    9 +
> > >  .../platform/nxp/imx8-isi/imx8-isi-core.c     |  646 +++++++
> > >  .../platform/nxp/imx8-isi/imx8-isi-core.h     |  394 +++++
> > >  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  529 ++++++
> > >  .../platform/nxp/imx8-isi/imx8-isi-debug.c    |  109 ++
> > >  .../media/platform/nxp/imx8-isi/imx8-isi-hw.c |  651 +++++++
> > >  .../platform/nxp/imx8-isi/imx8-isi-m2m.c      |  858 ++++++++++
> > >  .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  867 ++++++++++
> > >  .../platform/nxp/imx8-isi/imx8-isi-regs.h     |  418 +++++
> > >  .../platform/nxp/imx8-isi/imx8-isi-video.c    | 1513 +++++++++++++++++
> > >  14 files changed, 6026 insertions(+)
> > >  create mode 100644 drivers/media/platform/nxp/imx8-isi/Kconfig
> > >  create mode 100644 drivers/media/platform/nxp/imx8-isi/Makefile
> > >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
> > >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> > >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> > >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> > >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> > >  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 1fc9ead83d2a..02327b4d8c9f 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -14270,6 +14270,13 @@ F:     Documentation/devicetree/bindings/clock/imx*
> > >  F:     drivers/clk/imx/
> > >  F:     include/dt-bindings/clock/imx*
> > >
> > > +NXP i.MX 8M ISI DRIVER
> > > +M:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > +L:     linux-media@vger.kernel.org
> > > +S:     Maintained
> > > +F:     Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > +F:     drivers/media/platform/nxp/imx8-isi/
> > > +
> > >  NXP i.MX 8MQ DCSS DRIVER
> > >  M:     Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > >  R:     Lucas Stach <l.stach@pengutronix.de>
> > > diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> > > index 1ac0a6e91111..0f5f8976ae78 100644
> > > --- a/drivers/media/platform/nxp/Kconfig
> > > +++ b/drivers/media/platform/nxp/Kconfig
> > > @@ -27,6 +27,8 @@ config VIDEO_VIU
> > >           Say Y here if you want to enable VIU device on MPC5121e Rev2+.
> > >           In doubt, say N.
> > >
> >
> > <snip>
>
> --
> Regards,
>
> Laurent Pinchart
