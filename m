Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E23D55A4E4A
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 15:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbiH2NhP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Aug 2022 09:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbiH2NhJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Aug 2022 09:37:09 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7456B6D9DE
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 06:37:07 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id kk26so15703085ejc.11
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 06:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=k+DKFLD2tIanA4ZTaYBtCwu+QQVmzIDfYP98THogbsQ=;
        b=MrV/LDxVHuOzJiNHjMDREAmyKseMQ/X1Jbqdn5j03ZzghdfGS3ek6JxLi5+KfAX7jX
         77ZoaKbYwKlIBbU1FNGaqanw2vE49543wIQZA6Fi62XpGC17YExqVFCfqOR2xIgf/lxs
         0EQLS6UGD3x0wXlzei6yiIODxrEcfPEvSNPlSWkK05HC+k1nViuF6NShWdMbKlxuLN5N
         PQyAxp2yyRHorSI8uBICii/z37nFTehFl1NoHAmTpGIocLRpKBNkzx5EhLlnCABZopul
         LBJr5w9/0mDJ++Sl65xNx2dGoby+mvO70btsEKayO3PpVJHArt84tR/EwK2hy2nP5RUh
         koKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=k+DKFLD2tIanA4ZTaYBtCwu+QQVmzIDfYP98THogbsQ=;
        b=GPezWhcxcQX6K+RUXLK+k2Uyd3TAvcppzX6taA6yE6pFeVuhilxyazGucmHqciAL8X
         alcSSMpaOaFl51B15OiMFfCSL2jhymOgj4UPn2DICv8PUpQJ4gcmtRERQlNDskI74zvQ
         uh8ewp8S3KQgCsRNRsyhezutu81MVLxSOv0JNGhTVyovGUMbYgVB4W7x28tddtOupEUT
         ulPoWb2ZY1b1JqwvoERtDRlxkp9gez82YCsULWDyBjeaIBQ1Mc/2QQXGgYufphI6MeLS
         QBstAOl5PTz861bukQrdceXAiEiVbdRYbJ2GNXoqHFA3r4rtSz9JMHaskLqpu0pl8OiG
         jVJQ==
X-Gm-Message-State: ACgBeo2fZwQmr/b+g06GI0JwvEcHEe/dnWSkX2IdssY25T0UhuQkHT16
        eoOPQqa6oTr9KSO85/0xQT5ZdFO8HHoGWe0RrueMEw==
X-Google-Smtp-Source: AA6agR43tBWNduUYA8jUPnevcGAAIEjAZKMEUdbVbdeN2T09HWwHyBIgepDdGKJF1v62JtVi9SCrtp/FST9QXsAFlqg=
X-Received: by 2002:a17:907:7d91:b0:731:7ecb:1e5b with SMTP id
 oz17-20020a1709077d9100b007317ecb1e5bmr13665749ejc.78.1661780225769; Mon, 29
 Aug 2022 06:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <edbd6c95873c51853c4f645ee1ed81a3522a5864.1660657745.git.robin.murphy@arm.com>
In-Reply-To: <edbd6c95873c51853c4f645ee1ed81a3522a5864.1660657745.git.robin.murphy@arm.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 29 Aug 2022 15:36:54 +0200
Message-ID: <CAG3jFyvO5CD7tqspgM5c=qF3CX=EVN=qcUsRBC6yEfXBYkbiXw@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: Clean up Kconfig dependencies
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     todor.too@gmail.com, mchehab@kernel.org,
        stanimir.varbanov@linaro.org, linux-media@vger.kernel.org,
        iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robin,

On Tue, 16 Aug 2022 at 15:49, Robin Murphy <robin.murphy@arm.com> wrote:
>
> Depending on IOMMU_DMA is suspicious, since the low-level DMA ops
> internals and MSI helpers is provides are not of interest to general
> drivers. In practice it mostly seems to be serving as a dependency on
> ARM64 here, so do that properly. The venus driver looks like it won't
> actually be useful at runtime without the IOMMU API, so add that too.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/media/platform/qcom/camss/Kconfig | 2 +-
>  drivers/media/platform/qcom/venus/Kconfig | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
> index 4eda48cb1adf..575f42377c12 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -2,7 +2,7 @@ config VIDEO_QCOM_CAMSS
>         tristate "Qualcomm V4L2 Camera Subsystem driver"
>         depends on V4L_PLATFORM_DRIVERS
>         depends on VIDEO_DEV
> -       depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
> +       depends on (ARCH_QCOM && ARM64) || COMPILE_TEST
>         select MEDIA_CONTROLLER
>         select VIDEO_V4L2_SUBDEV_API
>         select VIDEOBUF2_DMA_SG
> diff --git a/drivers/media/platform/qcom/venus/Kconfig b/drivers/media/platform/qcom/venus/Kconfig
> index bfd50e8f3421..f04b45720bca 100644
> --- a/drivers/media/platform/qcom/venus/Kconfig
> +++ b/drivers/media/platform/qcom/venus/Kconfig
> @@ -2,7 +2,7 @@ config VIDEO_QCOM_VENUS
>         tristate "Qualcomm Venus V4L2 encoder/decoder driver"
>         depends on V4L_MEM2MEM_DRIVERS
>         depends on VIDEO_DEV && QCOM_SMEM
> -       depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
> +       depends on (ARCH_QCOM && ARM64 && IOMMU_API) || COMPILE_TEST
>         select QCOM_MDT_LOADER if ARCH_QCOM
>         select QCOM_SCM
>         select VIDEOBUF2_DMA_CONTIG
> --
> 2.36.1.dirty
>

Both parts look good to me and build just fine.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
