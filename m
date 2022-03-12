Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7894D6DE8
	for <lists+linux-media@lfdr.de>; Sat, 12 Mar 2022 11:07:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231678AbiCLKI7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Mar 2022 05:08:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbiCLKI6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Mar 2022 05:08:58 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAED821CD21
        for <linux-media@vger.kernel.org>; Sat, 12 Mar 2022 02:07:50 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id v4so10305479pjh.2
        for <linux-media@vger.kernel.org>; Sat, 12 Mar 2022 02:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wYq6tWAwazSwtaOSCcn5XeDaBbEnnMxnnX4o0qHorPw=;
        b=RCC9d6s+pci7YMgg1RymL3t5FOGxdAarGsaVkM6MrLdIwyseLC2zdbdGsrhGW/9iuo
         G3CwNKKEJIjCQ9KBzfDA/IBq+kBwXN2hhmMNJ2hS0Q7v1CsSefgac0oH9GkzTJTWIOnD
         SeUdJEvk4RF1eVT9RX6hkjA2g6gTyVTTHLJa0DFV6vQ6k8PG16p/MD+MG2MlR/nIQQtB
         4NErqiNWRzjz7x9urQx2oYDfqL8ExJFrGwL78FE3eHieqvzArKK74AJVEnbSy8c0AbhE
         k+/cxe6XiCh0/onW21fRpnKfTMEUs2gZ5MmcUN/zTHl58809kLMXKDLP/8bCvxBVEiIZ
         q6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wYq6tWAwazSwtaOSCcn5XeDaBbEnnMxnnX4o0qHorPw=;
        b=6JMqKjMzfVCxVowAt0quSSWcDbXDTQ9ZGoz81KTz1Bf9PwNG6EeJXoCDrHr14nY6Ow
         Bm3jK6pDFKJ3EfX7SSxQ2w0pRNlmOxZko55f3XicYoQ6XdVC0AFz4BljrgNcQ5oqqmUc
         3XfoHDEMu0MioahYeSr0bu5kZm8fIyEhips/am9UK4gBKa1uS9RhIvcLRZiv9F1mbbkO
         SeAXXorcAkeCF+JBa2zjgVZQXtLqMylizpBE3kCKmrs8vUE972Wae+VHpbQmO0Ud98Rd
         grXHT95vhdwfSFvJW4a6ihCHBN2z2XS6gzfAEtS0ua49Opip3EwgoykIlidPnlzRx1F5
         fR8g==
X-Gm-Message-State: AOAM533SqsOFVHqEEGjowMcY9HjdvhqvH09uu9zVuj5LS58lrdxeQpsW
        y7/z2PXUzZHe5cshmVvdmikfDAXEhA7g1oqBcO5hMw==
X-Google-Smtp-Source: ABdhPJzOAX1230fxKXWYL8R8DcTPN06CepOoh5pbUwIhYFkflUGvGx81W4io38EXjfmESuDRPBX1c0dv/+QE0TRTLMY=
X-Received: by 2002:a17:90b:124c:b0:1bc:369b:7db5 with SMTP id
 gx12-20020a17090b124c00b001bc369b7db5mr26400342pjb.179.1647079670159; Sat, 12
 Mar 2022 02:07:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1647006877.git.mchehab@kernel.org> <8602f414ccdbf2ed803b013cdb7b9a97739d4921.1647006877.git.mchehab@kernel.org>
In-Reply-To: <8602f414ccdbf2ed803b013cdb7b9a97739d4921.1647006877.git.mchehab@kernel.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Sat, 12 Mar 2022 11:07:39 +0100
Message-ID: <CAG3jFyt8H=X0DTeu9AHu5meOZj2eXAzX+i1dBvPbNZHmHqTTCw@mail.gmail.com>
Subject: Re: [PATCH v2 21/38] media: platform: camss: move config to its own file
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ming Qian <ming.qian@nxp.com>,
        Todor Tomov <todor.too@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 11 Mar 2022 at 15:09, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>
> In order to better organize the platform/Kconfig, place
> camss-specific config stuff on a separate Kconfig file.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/38] at: https://lore.kernel.org/all/cover.1647006877.git.mchehab@kernel.org/
>
>  drivers/media/platform/Kconfig            | 11 +----------
>  drivers/media/platform/qcom/camss/Kconfig |  9 +++++++++
>  2 files changed, 10 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/media/platform/qcom/camss/Kconfig
>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index f65eefa15dda..19ca01d2f841 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -61,6 +61,7 @@ source "drivers/media/platform/mtk-vcodec/Kconfig"
>  source "drivers/media/platform/mtk-vpu/Kconfig"
>  source "drivers/media/platform/omap3isp/Kconfig"
>  source "drivers/media/platform/omap/Kconfig"
> +source "drivers/media/platform/qcom/camss/Kconfig"
>
>  source "drivers/media/platform/aspeed/Kconfig"
>
> @@ -78,16 +79,6 @@ config VIDEO_MUX
>
>  source "drivers/media/platform/intel/Kconfig"
>
> -config VIDEO_QCOM_CAMSS
> -       tristate "Qualcomm V4L2 Camera Subsystem driver"
> -       depends on V4L_PLATFORM_DRIVERS
> -       depends on VIDEO_V4L2
> -       depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
> -       select MEDIA_CONTROLLER
> -       select VIDEO_V4L2_SUBDEV_API
> -       select VIDEOBUF2_DMA_SG
> -       select V4L2_FWNODE
> -
>  config VIDEO_S3C_CAMIF
>         tristate "Samsung S3C24XX/S3C64XX SoC Camera Interface driver"
>         depends on V4L_PLATFORM_DRIVERS
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
> new file mode 100644
> index 000000000000..56be91578706
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -0,0 +1,9 @@
> +config VIDEO_QCOM_CAMSS
> +       tristate "Qualcomm V4L2 Camera Subsystem driver"
> +       depends on V4L_PLATFORM_DRIVERS
> +       depends on VIDEO_V4L2
> +       depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
> +       select MEDIA_CONTROLLER
> +       select VIDEO_V4L2_SUBDEV_API
> +       select VIDEOBUF2_DMA_SG
> +       select V4L2_FWNODE
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
