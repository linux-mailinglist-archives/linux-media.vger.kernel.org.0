Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B63494BE3E8
	for <lists+linux-media@lfdr.de>; Mon, 21 Feb 2022 18:58:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359137AbiBUNhY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Feb 2022 08:37:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233419AbiBUNhX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Feb 2022 08:37:23 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E31ABEA
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 05:36:59 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id vz16so33460326ejb.0
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 05:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hVsxXa9zfJzDSONzhFmUt2n45g2Tl+QAXT1aliotVqU=;
        b=XmTAslYxp5GDy/Vljfy2unr/xoU7gzU3HEjXxhmZ4thZ5TR7G2L0bE47eJF3ebQlbw
         QxzN5HViSUiWkQIDn9p5oVRlfFaJYqvfvfKo6WGh54M4BJiR95utbGShS7OVeaT1iEYg
         vcB4jz3DnGm7gh4eAJazlvVoj8Nb0zHVQTcMu1rAzYJCUcHNVgysTFEE/nMzdDadIOp1
         dQjcLfxZrlApQjxJQlUR+q0M6PgNYQAYYpYa4Kngk4GHTpB/wzPqeQCXhAEdIijKK8KT
         rivlHUC9xLh00Wnc/QdwtCKV+MR69Y8TVx+B0uzytjAVQvH1TSokvM2VDqM6ybQh+0UL
         jcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hVsxXa9zfJzDSONzhFmUt2n45g2Tl+QAXT1aliotVqU=;
        b=kcMlejq/NpGHfjENGH8cTEK+6MxutdQzhOaCP75MnzZm6LY2EzHcHp+krV1VLN75gO
         YrZLKwfZox0vhCQCAdJIGJs+xZtaW8oEo4aqWk2IAo2rxAvZ65yofBBzB4Pry9ATdfsc
         Rtboqltd6w88pl9hBg3lE4EKH+Ia0txaZ8iDIfEafbR6hx9WwxqVlOqBQVXrJ3dyDOUf
         ID9r5tZNPdIClbPN76qHZwuqQ998Pya1Xv/AAMG6Pb6aOoUQvbEPXMimKg0xD2gurwWe
         SqgfImwQEcJHtKxsyFnOTwmTtmSNg25Bv98qFo4z+NMwOWsr/esGkTZs7BCoHLux6JEQ
         Dx0A==
X-Gm-Message-State: AOAM532INz/zZr7Y/bnBd0yH7xnS3LWKPrjVLXqmPP50tNI2GH7FIZDf
        TolJ0Z6HEXZAvjXKKDXJJckdNWPssa8BtaeX9yM=
X-Google-Smtp-Source: ABdhPJyEZ/gU5SCeWCcTzpOSzUXpy+j4gBmV01rVq1YoY/L4n7+iMS5I7aLybc0v/YOKIwqJBvvfGM5l8u8ISI4J1mE=
X-Received: by 2002:a17:906:364d:b0:6cd:9109:cfd4 with SMTP id
 r13-20020a170906364d00b006cd9109cfd4mr15717127ejb.198.1645450617442; Mon, 21
 Feb 2022 05:36:57 -0800 (PST)
MIME-Version: 1.0
References: <20220218183421.583874-1-jacopo@jmondi.org> <CAHCN7xKXoBB4AiJY=wEhZ-8YT=QW4CANe7bapGpjFGnWKm3xmQ@mail.gmail.com>
 <YhLDqUPRe84/JylR@pendragon.ideasonboard.com> <20220221075859.xtilbojle5ghnfru@uno.localdomain>
 <YhNMQGpZ8oRTOxB8@pendragon.ideasonboard.com>
In-Reply-To: <YhNMQGpZ8oRTOxB8@pendragon.ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 21 Feb 2022 07:36:46 -0600
Message-ID: <CAHCN7x+gk9xXOCNB4PWFRSkY=haA1kAnAYB8WFjUDDA4imzj4w@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] media: imx: Destage imx7-mipi-csis
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        martin.kepplinger@puri.sm, rmfrfs@gmail.com,
        xavier.roumegue@oss.nxp.com,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        dorota.czaplejewicz@puri.sm, Sascha Hauer <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 21, 2022 at 2:24 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jacopo,
>
> On Mon, Feb 21, 2022 at 08:58:59AM +0100, Jacopo Mondi wrote:
> > On Mon, Feb 21, 2022 at 12:41:45AM +0200, Laurent Pinchart wrote:
> > > On Sun, Feb 20, 2022 at 12:19:30PM -0600, Adam Ford wrote:
> > > > On Sun, Feb 20, 2022 at 8:56 AM Jacopo Mondi wrote:
> > > > >
> > > > > Hello
> > > > >   this series includes patches from two series previously sent:
> > > > > https://lore.kernel.org/linux-media/20220119112024.11339-1-jacopo@jmondi.org/
> > > > > https://lore.kernel.org/linux-media/20220211180216.290133-1-jacopo@jmondi.org/
> > > > > v1:
> > > > > https://lore.kernel.org/linux-media/20220214184318.409208-1-jacopo@jmondi.org/T/#t
> > > > >
> > > > > Which can now be marked as superseded.
> > > > >
> > > > > The first 2 patches performs the de-staging of the imx7-mipi-csis driver and
> > > > > are now reviewed.
> > > > >
> > > > > The rest of the series builds on top of the comment received on:
> > > > > https://lore.kernel.org/linux-media/20220119112024.11339-3-jacopo@jmondi.org/
> > > > >
> > > > > If DUAL pixel mode is used in the CSIS driver, then the CSI block of the IMX8MM
> > > > > SoC needs to be operated in dual mode as well. To do so, use the image format
> > > > > sample size to determine in the CSI bridge if dual or single mode should be
> > > > > used.
> > > > >
> > > > > Laurent could you test on MM to see if it works now ?
> > > >
> > > > Jacopo,
> > > >
> > > > Do you have a repo I can clone?  If not, I need to know which branch
> > > > to apply to the series. I have an 8MM with an OV5640, and I'm willing
> > > > to test if Laurent can't.
> > >
> > > I've applied the patches on top of v5.17-rc4 plus a few backports, and
> > > pushed the result to
> > > https://gitlab.com/ideasonboard/nxp/linux/-/tree/pinchartl/v5.17/csis.
> > >
> >
> > Oh, you've been slightly quicker then me :p
> >
> > I was about to ask Adam if he was interested in a branch which also
> > contains
> > https://patchwork.linuxtv.org/project/linux-media/list/?series=7311
> >
> > As he has an ov5640 :)
>
> Do you mean
> https://gitlab.com/ideasonboard/nxp/linux/-/tree/pinchartl/v5.17/sensors/ov5640/v2
> ? :-)
>
> > Adam, if you get here faster than me, please try Laurent's branch and
> > let me know. Otherwise I will provide a branch with a v3 of this
> > series and the ov5640 changes as well, if you're interested in testing
> > them.

I should be able to get to this today.  Are there specific resolutions
or formats you want me to test?  I assume I should test the new ones,
but I wasn't if there were some that were less confident.

adam
> >
> > Thanks
> >   j
> >
> > > > > On top two small patches I was carrying in my tree to add more formats to the
> > > > > CSIS driver, the last one with the caveat that RGB24 is transmitted on the wire
> > > > > with one format and stored in memory with a different one.
> > > > >
> > > > > Series based on top of the most recent media master branch.
> > > > >
> > > > > Thanks
> > > > >   j
> > > > >
> > > > > v1->v2:
> > > > > - Remove per-SoC handling in CSI bridge and only use image formats
> > > > > - Add TODO note to the staging driver
> > > > > - Fix PIXEL_DUAL mode comments for imx-mipi-csis
> > > > > - Add output format translation to imx-mipi-csis to handle RGB24
> > > > >
> > > > > Jacopo Mondi (7):
> > > > >   media: imx: De-stage imx7-mipi-csis
> > > > >   media: imx: Rename imx7-mipi-csis.c to imx-mipi-csis.c
> > > > >   media: imx: imx7-media-csi: Use dual sampling for YUV 1X16
> > > > >   media: imx: imx-mipi-csis: Set PIXEL_MODE for YUV422
> > > > >   media: imx: imx-mipi-csis: Add RGB565_1X16
> > > > >   media: imx: imx-mipi-csis: Add BGR888
> > > > >   media: imx: imx-mipi-csis: Add output format
> > > > >
> > > > >  Documentation/admin-guide/media/imx7.rst      |  2 +-
> > > > >  ...-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml} |  2 +-
> > > > >  MAINTAINERS                                   |  4 +-
> > > > >  drivers/media/platform/Kconfig                |  1 +
> > > > >  drivers/media/platform/Makefile               |  1 +
> > > > >  drivers/media/platform/imx/Kconfig            | 24 ++++++++
> > > > >  drivers/media/platform/imx/Makefile           |  1 +
> > > > >  .../platform/imx/imx-mipi-csis.c}             | 59 +++++++++++++++++--
> > > > >  drivers/staging/media/imx/Makefile            |  1 -
> > > > >  drivers/staging/media/imx/TODO                | 26 ++++++++
> > > > >  drivers/staging/media/imx/imx7-media-csi.c    |  8 ++-
> > > > >  11 files changed, 117 insertions(+), 12 deletions(-)
> > > > >  rename Documentation/devicetree/bindings/media/{nxp,imx7-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml} (98%)
> > > > >  create mode 100644 drivers/media/platform/imx/Kconfig
> > > > >  create mode 100644 drivers/media/platform/imx/Makefile
> > > > >  rename drivers/{staging/media/imx/imx7-mipi-csis.c => media/platform/imx/imx-mipi-csis.c} (95%)
>
> --
> Regards,
>
> Laurent Pinchart
