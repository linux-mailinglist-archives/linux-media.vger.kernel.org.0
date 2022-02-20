Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB004BD0B1
	for <lists+linux-media@lfdr.de>; Sun, 20 Feb 2022 19:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244402AbiBTSUG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Feb 2022 13:20:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240912AbiBTSUF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Feb 2022 13:20:05 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84984507D
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 10:19:43 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id i11so23292932eda.9
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 10:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=benWcURYgGK+uAiYHNdB8VXxJ8t300zl1DIDLlznLsQ=;
        b=Ert31gFzb8VTlobnNs1vwF57jnx93vMlznupDkEG4c13sDwkjbkROJXgtzzDvrSloF
         Vy0Q8YKYfUlHGWdMc6F1O62EXfZiSKkKbkGItz5MUyiOnj9PP9JJGC4RL7cUtfud1ErA
         ZUWZUsGHYxdMQGikpuVeP2Xn6YUQwygLwDe9uujAGQM+Y2tubq18Z1jr/fxWP5jvCRCz
         jEa6nj+F/dMAIE+j3hMNyYySmOnvXihpYIrE0MOWfTlhDrvM3Uu6BRluGBQcjIHC+2sm
         M/ErUYXTOtfwdUOGcoH9dVNcV4TGkdP7IYeUwqEehl7Re8INQ4c5PEJuAFli28rOt5D8
         UUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=benWcURYgGK+uAiYHNdB8VXxJ8t300zl1DIDLlznLsQ=;
        b=ZHitcgpcf2H1IYJxu/meSDNzt1ZhRnL/N34fIaushBGcMdyw6cCoe+6teG0qZMPIws
         3E15EcsjhAw0e7zVxcPS3dnxN0orkKmy+DZAkny0X9dM5VFKvk9pshc/3aw1stnpaCdd
         8bFf3TW/GZExByU8Bz/qcvBmh+O4o5uliln/9bP6KyAbtYxkT0ZG5bsuIuDCY8j2/reC
         MpDNgH/KiZbABgf9Avatd8YeMxsuYy1l0jQc9ZC0xVwrgEqbGwEEZrmPJeWlHk1ziZfe
         JlD/C5WnUrCTbdpnYR8uxcaMTIcNFxSuC4sR1o9pBChsgjfmx3cgbO/kH+bYUOPDn45a
         xzOg==
X-Gm-Message-State: AOAM533gy3f0Ui+XuGcwQluTBaIfQ9vll2DjSQE7+/GePZHZBDY8d2Tj
        nOcRhdrwDVSXWi6OM8CMo7dDwZT0obk7rwsviag=
X-Google-Smtp-Source: ABdhPJwiJkhS1p3i4WFuARwlpZWTIFoZp10y/I2/1aFGjDT2dQlpg4tPMK+6DGjm0IEFl2mlLHt8yzNy62zCuklNblw=
X-Received: by 2002:a05:6402:18:b0:410:86cd:9dce with SMTP id
 d24-20020a056402001800b0041086cd9dcemr17780927edu.70.1645381182179; Sun, 20
 Feb 2022 10:19:42 -0800 (PST)
MIME-Version: 1.0
References: <20220218183421.583874-1-jacopo@jmondi.org>
In-Reply-To: <20220218183421.583874-1-jacopo@jmondi.org>
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 20 Feb 2022 12:19:30 -0600
Message-ID: <CAHCN7xKXoBB4AiJY=wEhZ-8YT=QW4CANe7bapGpjFGnWKm3xmQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] media: imx: Destage imx7-mipi-csis
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

On Sun, Feb 20, 2022 at 8:56 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hello
>   this series includes patches from two series previously sent:
> https://lore.kernel.org/linux-media/20220119112024.11339-1-jacopo@jmondi.org/
> https://lore.kernel.org/linux-media/20220211180216.290133-1-jacopo@jmondi.org/
> v1:
> https://lore.kernel.org/linux-media/20220214184318.409208-1-jacopo@jmondi.org/T/#t
>
> Which can now be marked as superseded.
>
> The first 2 patches performs the de-staging of the imx7-mipi-csis driver and
> are now reviewed.
>
> The rest of the series builds on top of the comment received on:
> https://lore.kernel.org/linux-media/20220119112024.11339-3-jacopo@jmondi.org/
>
> If DUAL pixel mode is used in the CSIS driver, then the CSI block of the IMX8MM
> SoC needs to be operated in dual mode as well. To do so, use the image format
> sample size to determine in the CSI bridge if dual or single mode should be
> used.
>
> Laurent could you test on MM to see if it works now ?

Jacopo,

Do you have a repo I can clone?  If not, I need to know which branch
to apply to the series. I have an 8MM with an OV5640, and I'm willing
to test if Laurent can't.

adam
>
> On top two small patches I was carrying in my tree to add more formats to the
> CSIS driver, the last one with the caveat that RGB24 is transmitted on the wire
> with one format and stored in memory with a different one.
>
> Series based on top of the most recent media master branch.
>
> Thanks
>   j
>
> v1->v2:
> - Remove per-SoC handling in CSI bridge and only use image formats
> - Add TODO note to the staging driver
> - Fix PIXEL_DUAL mode comments for imx-mipi-csis
> - Add output format translation to imx-mipi-csis to handle RGB24
>
> Jacopo Mondi (7):
>   media: imx: De-stage imx7-mipi-csis
>   media: imx: Rename imx7-mipi-csis.c to imx-mipi-csis.c
>   media: imx: imx7-media-csi: Use dual sampling for YUV 1X16
>   media: imx: imx-mipi-csis: Set PIXEL_MODE for YUV422
>   media: imx: imx-mipi-csis: Add RGB565_1X16
>   media: imx: imx-mipi-csis: Add BGR888
>   media: imx: imx-mipi-csis: Add output format
>
>  Documentation/admin-guide/media/imx7.rst      |  2 +-
>  ...-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml} |  2 +-
>  MAINTAINERS                                   |  4 +-
>  drivers/media/platform/Kconfig                |  1 +
>  drivers/media/platform/Makefile               |  1 +
>  drivers/media/platform/imx/Kconfig            | 24 ++++++++
>  drivers/media/platform/imx/Makefile           |  1 +
>  .../platform/imx/imx-mipi-csis.c}             | 59 +++++++++++++++++--
>  drivers/staging/media/imx/Makefile            |  1 -
>  drivers/staging/media/imx/TODO                | 26 ++++++++
>  drivers/staging/media/imx/imx7-media-csi.c    |  8 ++-
>  11 files changed, 117 insertions(+), 12 deletions(-)
>  rename Documentation/devicetree/bindings/media/{nxp,imx7-mipi-csi2.yaml => nxp,imx-mipi-csi2.yaml} (98%)
>  create mode 100644 drivers/media/platform/imx/Kconfig
>  create mode 100644 drivers/media/platform/imx/Makefile
>  rename drivers/{staging/media/imx/imx7-mipi-csis.c => media/platform/imx/imx-mipi-csis.c} (95%)
>
> --
> 2.35.0
>
