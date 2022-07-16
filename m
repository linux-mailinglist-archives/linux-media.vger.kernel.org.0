Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09DFE57708B
	for <lists+linux-media@lfdr.de>; Sat, 16 Jul 2022 19:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbiGPR7u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jul 2022 13:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbiGPR7t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jul 2022 13:59:49 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC0C165A4
        for <linux-media@vger.kernel.org>; Sat, 16 Jul 2022 10:59:48 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id os14so14255811ejb.4
        for <linux-media@vger.kernel.org>; Sat, 16 Jul 2022 10:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t2kzdKwWLV1Q4MiroDiKKlL2CWFmJlnbE2/Uk8DWx3M=;
        b=nEd/4xfU7U4BghrfZEzwXeksMsF4Adkocj3xkWlrVJRybo4S1VWIqwTzbqBrxoIjIF
         x50b7CKbEqn0huY5jCdCKaq4BCs5r46G31NbF0sBJ2EgAmri7feSHm/ai0RK217tSPgO
         9hekt2JeT21cmNUKtsmrHJ/qIXcniPtrbUO6a1Comnfxqej8zHh3ZRX68fTZJgANWMYD
         kk/DEIHvNaKFeyEjwoCXLTzUy64wEoiRpI7sbsto4zFwAvykDJOXPRbg9rQ3l56c/SEt
         VxHHK7lstpBsKFOpxOJbI442zVdANNbVvkOeBvI8A+5kb0LJY2+cROes6StgLfSjNEpZ
         Eghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t2kzdKwWLV1Q4MiroDiKKlL2CWFmJlnbE2/Uk8DWx3M=;
        b=AHBzb0fgvbF64wWFhv4Cb1b9q+h4bgpYaX0BKtZ3hbV4LoNgs/VkAUeYeAVA00v7hn
         6BhLxgA8wZr8nKlu+68O8rLjB9Z2xJuUuPKuBsucVJI/tUOwKJ8dCe51VeImHGBHq5Ym
         7C4nU4+LeW3yfuEKXL6vnH7L3n61nq4YCyArBgzo1dq1KiJFcVsyi7B9E6dX+90J5hSp
         HJEgV6IJj+rulwBOnUl4X768BYoftjqXKrsnuBZbctc8Dzvng/fhDZpVlGDIk4E4qeL/
         eTNoVqO52jeFPxuHbtosqpoWkkpN/JYOtSuwjO2U5MBA/u5JCKj+1BBiwrO5St2jWcRh
         XGgg==
X-Gm-Message-State: AJIora84ADb5KC7MOsxq5Le9v2HsfrgM7sZdaOopw0G25uBROq0dhyO9
        Y7fyGG/MAH3cm5vXAxFnQscAR+zR2CNGfBPQoPc=
X-Google-Smtp-Source: AGRyM1ui5hvMmXxliWa4cdwX21IAHjoiTX5qd6bGKhSrOtm9ITUJf7B1gZMa0eQ2jLmk3LEO/2AD2w5gutw0qsAfGeE=
X-Received: by 2002:a17:907:7241:b0:72b:347b:17a1 with SMTP id
 ds1-20020a170907724100b0072b347b17a1mr20136831ejc.32.1657994386610; Sat, 16
 Jul 2022 10:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com> <20220712000251.13607-8-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220712000251.13607-8-laurent.pinchart@ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 16 Jul 2022 12:59:35 -0500
Message-ID: <CAHCN7xKfYabhnFKu46jfcE+qBj4TcF_ei6=7PWEcqUb=wHwd7w@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] media: nxp: Add i.MX8 ISI driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>
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

On Mon, Jul 11, 2022 at 7:06 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The Image Sensing Interface (ISI) combines image processing pipelines
> with DMA engines to process and capture frames originating from a
> variety of sources. The inputs to the ISI go through Pixel Link
> interfaces, and their number and nature is SoC-dependent. They cover
> both capture interfaces (MIPI CSI-2 RX, HDMI RX) and memory inputs.
>
> Signed-off-by: Christian Hemp <c.hemp@phytec.de>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  MAINTAINERS                                   |    7 +
>  drivers/media/platform/nxp/Kconfig            |    2 +
>  drivers/media/platform/nxp/Makefile           |    1 +
>  drivers/media/platform/nxp/imx8-isi/Kconfig   |   22 +
>  drivers/media/platform/nxp/imx8-isi/Makefile  |    9 +
>  .../platform/nxp/imx8-isi/imx8-isi-core.c     |  646 +++++++
>  .../platform/nxp/imx8-isi/imx8-isi-core.h     |  394 +++++
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  529 ++++++
>  .../platform/nxp/imx8-isi/imx8-isi-debug.c    |  109 ++
>  .../media/platform/nxp/imx8-isi/imx8-isi-hw.c |  651 +++++++
>  .../platform/nxp/imx8-isi/imx8-isi-m2m.c      |  858 ++++++++++
>  .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  867 ++++++++++
>  .../platform/nxp/imx8-isi/imx8-isi-regs.h     |  418 +++++
>  .../platform/nxp/imx8-isi/imx8-isi-video.c    | 1513 +++++++++++++++++
>  14 files changed, 6026 insertions(+)
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

(snip)

Laurent,

Thank you for this series.
> +
> +/* -----------------------------------------------------------------------------
> + * IRQ
> + */
> +
> +u32 mxc_isi_channel_irq_status(struct mxc_isi_pipe *pipe, bool clear)
> +{
> +       u32 status;
> +
> +       status = mxc_isi_read(pipe, CHNL_STS);
> +       if (clear)
> +               mxc_isi_write(pipe, CHNL_STS, status);
> +
> +       return status;
> +}
> +
> +void mxc_isi_channel_irq_clear(struct mxc_isi_pipe *pipe)
> +{
> +       mxc_isi_write(pipe, CHNL_STS, 0xffffffff);
> +}
> +

I was reading through the TRM for both Nano and Plus, and it seems
like there are a few bits in CHNL_STS that are always 0, but we're
setting them 1.  Bit 0-7, 11-15 an 24 all show 0. The TRM says to
write a 1 to any bit that's set in order to clear it, and
mxc_isi_channel_irq_status can do this.  Why not just have
mxc_isi_channel_irq_clear call mxc_isi_channel_irq_status(pipe, true)?
 It seems clearer to me than writing a hard-coded hex value.  This
way, it's only clearing any set bits and not arbitrarily writing 1's
to bit locations that might not be desired..

(snip)
> --
> Regards,
>
> Laurent Pinchart
>
