Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 759876A4328
	for <lists+linux-media@lfdr.de>; Mon, 27 Feb 2023 14:44:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbjB0Noi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Feb 2023 08:44:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbjB0Noh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Feb 2023 08:44:37 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4431CF59
        for <linux-media@vger.kernel.org>; Mon, 27 Feb 2023 05:44:36 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so6212421pjp.2
        for <linux-media@vger.kernel.org>; Mon, 27 Feb 2023 05:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pOQ6LIZpPqWp029mgEzFgiK0UsmaFxpHIGAsyVFnmBQ=;
        b=AcG/zfPn17PIMn97a7EH03/dCbX/1NPF35xeaPB3W4oSHNjA0oPFomK6tuFNknL+HR
         eYG5F9jR/LOj7HHWqUXhQ1KW2bsJ51TdD4ao+WvHCh2mfc4GSOvPIPNLtpA6P9Ml/cAX
         BAv0Ow37WIrRGt5jCUPA8jMGTm+EYsQQeJVA+Es41LbacZOmoR9Ssr5Udro6Y5Yimo1M
         RXwVP4UfdIzOMZXrfzBnRvjYIGP0S/q7NjBksZtYNM3d6D8jdvrEvBGAewjN3p0ih8jS
         W2J60HzDgEcVbmKXDG3BVOCE9UGKdkMGvAL0K0V0aLCQ/ySXdoS+IJEqKu0j/qtPpwzy
         GwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOQ6LIZpPqWp029mgEzFgiK0UsmaFxpHIGAsyVFnmBQ=;
        b=Qs76/8EP9kQh1Y0MQH4w14DR3V5va4SozBgcr0bLTEG95p+XuBR+Gjkhg4TfenmMBa
         v375IsP1g48DtoZBM9wnPCKItUeww53jMWlqZ6WT5hx2lafFSpzOAW5n8+i8REAM//7t
         L+5ZqWlQmjjijkt6GWZm/YGrPgWDYn6ZR/xkX5gGgFR3K8SjaqFXvWtPyXI2dNAQ2CDP
         AP1fOQZd1AaaWd5gF0SXsJBMDka+vKPNhyesY5qsVjdUb9N6UBsxMvSSPytHlx1livEB
         MVnnt0ceuVGaaTmH4pBi5qvmaJkc4vVFqEOg1/EBafkd0XN1qBjl+F4kgU7CC67EQpSa
         nCiQ==
X-Gm-Message-State: AO0yUKXTuf8UcIZR81eF0fyj/qXxTKpuyGEZoHDIfiTP3X975u6cen70
        pmNvZXUkwYzfaf1/22XW0nyBbbJBIk09cJfZr48lRSOR
X-Google-Smtp-Source: AK7set8YImyQ68OCPCwqbAeNemblBG+gdayL1jN1fuC2opUoE4g87I7TpQ/3A7Z5efF/Cv3CJiZx6y6RjeUyU8Enpj4=
X-Received: by 2002:a17:90a:af85:b0:237:cd62:66f7 with SMTP id
 w5-20020a17090aaf8500b00237cd6266f7mr2192209pjq.6.1677505475559; Mon, 27 Feb
 2023 05:44:35 -0800 (PST)
MIME-Version: 1.0
References: <Y9zZLJobSYuMwP9o@pendragon.ideasonboard.com>
In-Reply-To: <Y9zZLJobSYuMwP9o@pendragon.ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 27 Feb 2023 07:44:24 -0600
Message-ID: <CAHCN7xKOvmThMn3mgD_jjRrJvaszgiQdbwDbU+m+zWEZNsgn2Q@mail.gmail.com>
Subject: Re: [GIT PULL FOR v6.3] NXP i.MX8 ISI driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
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

On Fri, Feb 3, 2023 at 4:03 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Mauro,
>
> The following changes since commit 7120d6bfd6d0b26b49958f429701996f2d3e2c2a:
>
>   media: tm6000: remove deprecated driver (2023-01-22 09:57:19 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-imx-isi-next-20230203
>
> for you to fetch changes up to e8126b9f0ee306e784dfa20f5390b97d573986ae:
>
>   media: nxp: Add i.MX8 ISI driver (2023-02-03 11:15:18 +0200)
>

Please forgive my ignorance.  I've been trying to follow this, but I
am not sure where this goes after the merge request is complete.
Can someone point me to the right repo?

thank you,

adam

> This is a new driver for the NXP i.MX8 ISI, found in multiple i.MX8 SoCs
> including the i.MX8MP (which I have used for testing) and i.MX8MN. The
> driver uses the V4L2 streams API that you have merged in the media
> staging tree, so I've based the pull request on the latest master branch
> of that tree.
>
> As the streams API is going to land in v6.3, I think it would be nice to
> also have one user of the API in the same kernel version. Note that the
> API isn't exposed to userspace by default, doing so requires flipping a
> variable in v4l2-subdev.c, so we'll have a few kernel releases to test
> and stabilize everything with multiple drivers (not that I expect
> issues, as we've extensively tested that API over the course of multiple
> years in at least 6 different drivers - which we'll work on upstreaming
> of course, some of them have already been posted for review).
>
> ----------------------------------------------------------------
> NXP i.MX8 ISI driver
>
> ----------------------------------------------------------------
> Laurent Pinchart (2):
>       dt-bindings: media: Add i.MX8 ISI DT bindings
>       media: nxp: Add i.MX8 ISI driver
>
>  .../devicetree/bindings/media/nxp,imx8-isi.yaml    |  173 +++
>  MAINTAINERS                                        |    7 +
>  drivers/media/platform/nxp/Kconfig                 |    2 +
>  drivers/media/platform/nxp/Makefile                |    1 +
>  drivers/media/platform/nxp/imx8-isi/Kconfig        |   22 +
>  drivers/media/platform/nxp/imx8-isi/Makefile       |    8 +
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  645 +++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  395 +++++
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |  529 +++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-debug.c   |  109 ++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  651 +++++++++
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  858 +++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  867 +++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  418 ++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 1512 ++++++++++++++++++++
>  15 files changed, 6197 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/Kconfig
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/Makefile
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
>  create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
>
> --
> Regards,
>
> Laurent Pinchart
