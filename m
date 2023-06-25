Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBDE73CF56
	for <lists+linux-media@lfdr.de>; Sun, 25 Jun 2023 10:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbjFYI2q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Jun 2023 04:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbjFYI2p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Jun 2023 04:28:45 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF57E78
        for <linux-media@vger.kernel.org>; Sun, 25 Jun 2023 01:28:43 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9786fc23505so176100066b.2
        for <linux-media@vger.kernel.org>; Sun, 25 Jun 2023 01:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687681722; x=1690273722;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NtBhdDmvYbbL3b4bqPNsao2yHfonJhr8TMo/o6b/qJk=;
        b=EmHjvTDnTmAfYUpVQ0AVRdDD/rpHyUSED0u3qKAoFnkY0GhDXShBCWQZOlb/6v7z44
         BU0a2TuLelwlErpqe7ScZn/iSPjGHGNYjDYG+yJiDcUbQ3vzPh57eZ5HfZkbZPan+3Vm
         o/UHSuOZlDovLZkbUSqubc7W5sgBFx5/yN5p60RvP6nhU5hxm7W4JWEdsds1ZPirCseV
         aeM//U5NXKhiBeTTY26bBxRRA03VQsIhAr+8rLq/Id/RAqKOi+GtB7NoxN1o7aPXIZjS
         +CkWMnfvoCqbmwam/APbJUk1uxRVlRtbz6wJGrrehanme9nxqy0Vgmfr2btYszFf4E+B
         12rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687681722; x=1690273722;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NtBhdDmvYbbL3b4bqPNsao2yHfonJhr8TMo/o6b/qJk=;
        b=MhHs6tu0O/o/MuFvWYHlmDQTFaApkDwai9960pK32IYzZgsk/URDYmZSIAMtq6YTL9
         RZ/7H3o+7h3X1Fed6UPX6ULwICD8kPGxdHtIxDT9BpWrRWgeNq5ciXObg5SurB7GsBgy
         ikE6KPIuJPzBCKCCxaEAWi6xx8a15UhZe9feAEMLvE2CbkxahsRCW87y6gKJLBV3cHMP
         X2PZ8OYRwxLxN8hQ7wj15PMkAYLtqEvFPVblFS6zOp0Bgo1jTzimG1o3FsHXqo61303n
         5SeQXz4HIIJCVuVf0JaoHFMw4FTJJeG588UOA577it+7RHxh82jXhwSz4uKscZsvekT+
         tgrw==
X-Gm-Message-State: AC+VfDzHq2wfwkIBoWLiJkDoN5Pz1uT0FL6eY6Aw+69A0HL52mLXFTnn
        B69E2WRJ5n66N0saYEuw/3PzDw==
X-Google-Smtp-Source: ACHHUZ7WuKixRftUW3MFKaI0VJxjL45EUwjgieLLJZC0Fb8+69PyIO8BFGM6teinoTROXDQlOcrvUw==
X-Received: by 2002:a17:907:8a15:b0:988:acb4:f58 with SMTP id sc21-20020a1709078a1500b00988acb40f58mr17874301ejc.51.1687681721112;
        Sun, 25 Jun 2023 01:28:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l8-20020aa7c3c8000000b0051a595c9fc1sm1534040edr.38.2023.06.25.01.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 01:28:40 -0700 (PDT)
Message-ID: <4f026939-26d1-4b65-26f0-143fe25d1f29@linaro.org>
Date:   Sun, 25 Jun 2023 10:28:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/4] media: nxp: rename imx8-isi to imx-isi and remove
 reference to i.MX8
Content-Language: en-US
To:     guoniu.zhou@oss.nxp.com, linux-media@vger.kernel.org,
        linux-imx@nxp.com, devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
References: <20230625080916.3553621-1-guoniu.zhou@oss.nxp.com>
 <20230625080916.3553621-3-guoniu.zhou@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230625080916.3553621-3-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/06/2023 10:09, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> ISI is used both in i.MX8 and i.MX9 SoC, so do not specify a SoC
> version number in the driver name and header file.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> ---
>  MAINTAINERS                                        |  6 +++---
>  drivers/media/platform/nxp/Kconfig                 |  2 +-
>  drivers/media/platform/nxp/Makefile                |  2 +-
>  .../platform/nxp/{imx8-isi => imx-isi}/Kconfig     | 14 +++++++-------
>  drivers/media/platform/nxp/imx-isi/Makefile        |  8 ++++++++
>  .../imx8-isi-core.c => imx-isi/imx-isi-core.c}     |  4 ++--
>  .../imx8-isi-core.h => imx-isi/imx-isi-core.h}     |  2 +-
>  .../imx-isi-crossbar.c}                            |  4 ++--
>  .../imx8-isi-debug.c => imx-isi/imx-isi-debug.c}   |  4 ++--
>  .../imx8-isi-hw.c => imx-isi/imx-isi-hw.c}         |  4 ++--
>  .../imx8-isi-m2m.c => imx-isi/imx-isi-m2m.c}       |  2 +-
>  .../imx8-isi-pipe.c => imx-isi/imx-isi-pipe.c}     |  4 ++--
>  .../imx8-isi-regs.h => imx-isi/imx-isi-regs.h}     |  6 +++---
>  .../imx8-isi-video.c => imx-isi/imx-isi-video.c}   |  8 ++++----
>  drivers/media/platform/nxp/imx8-isi/Makefile       |  8 --------
>  15 files changed, 39 insertions(+), 39 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c83475103a25..2e2fc3c2b338 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15081,12 +15081,12 @@ F:	drivers/iio/adc/imx7d_adc.c
>  F:	drivers/iio/adc/imx93_adc.c
>  F:	drivers/iio/adc/vf610_adc.c
>  
> -NXP i.MX 8M ISI DRIVER
> +NXP i.MX ISI DRIVER
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> -F:	drivers/media/platform/nxp/imx8-isi/

No, your patchset is not bistectable.


> +F:	Documentation/devicetree/bindings/media/nxp,imx-isi.yaml
> +F:	drivers/media/platform/nxp/imx-isi/
>  
>  NXP i.MX 8MP DW100 V4L2 DRIVER
>  M:	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> index a0ca6b297fb8..55ce6a44b3fd 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -28,7 +28,7 @@ config VIDEO_IMX_MIPI_CSIS
>  	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
>  	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
>  
> -source "drivers/media/platform/nxp/imx8-isi/Kconfig"
> +source "drivers/media/platform/nxp/imx-isi/Kconfig"

There is no need for this.

>  
>  # mem2mem drivers
>  
> diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
> index b8e672b75fed..c95d23f1f521 100644
> --- a/drivers/media/platform/nxp/Makefile
> +++ b/drivers/media/platform/nxp/Makefile
> @@ -2,7 +2,7 @@
>  
>  obj-y += dw100/
>  obj-y += imx-jpeg/
> -obj-y += imx8-isi/
> +obj-y += imx-isi/
>  
>  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
>  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
> diff --git a/drivers/media/platform/nxp/imx8-isi/Kconfig b/drivers/media/platform/nxp/imx-isi/Kconfig
> similarity index 60%
> rename from drivers/media/platform/nxp/imx8-isi/Kconfig
> rename to drivers/media/platform/nxp/imx-isi/Kconfig
> index fcff33fc2630..ce222fa67a2f 100644
> --- a/drivers/media/platform/nxp/imx8-isi/Kconfig
> +++ b/drivers/media/platform/nxp/imx-isi/Kconfig
> @@ -1,22 +1,22 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -config VIDEO_IMX8_ISI
> -	tristate "i.MX8 Image Sensor Interface (ISI) driver"
> +config VIDEO_IMX_ISI
> +	tristate "i.MX Image Sensor Interface (ISI) driver"
>  	depends on ARCH_MXC || COMPILE_TEST
>  	depends on HAS_DMA && PM
>  	depends on VIDEO_DEV
>  	select MEDIA_CONTROLLER
>  	select V4L2_FWNODE
> -	select V4L2_MEM2MEM_DEV if VIDEO_IMX8_ISI_M2M
> +	select V4L2_MEM2MEM_DEV if VIDEO_IMX_ISI_M2M
>  	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEOBUF2_DMA_CONTIG
>  	help
>  	  V4L2 driver for the Image Sensor Interface (ISI) found in various
> -	  i.MX8 SoCs.
> +	  i.MX SoCs.
>  
> -config VIDEO_IMX8_ISI_M2M
> -	bool "i.MX8 Image Sensor Interface (ISI) memory-to-memory support"
> -	depends on VIDEO_IMX8_ISI
> +config VIDEO_IMX_ISI_M2M
> +	bool "i.MX Image Sensor Interface (ISI) memory-to-memory support"
> +	depends on VIDEO_IMX_ISI
>  	help
>  	  Select 'yes' here to enable support for memory-to-memory processing
>  	  in the ISI driver.
> diff --git a/drivers/media/platform/nxp/imx-isi/Makefile b/drivers/media/platform/nxp/imx-isi/Makefile
> new file mode 100644
> index 000000000000..f72e0ce8f17d
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx-isi/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +imx-isi-y := imx-isi-core.o imx-isi-crossbar.o imx-isi-hw.o \
> +	imx-isi-pipe.o imx-isi-video.o
> +imx-isi-$(CONFIG_DEBUG_FS) += imx-isi-debug.o
> +imx-isi-$(CONFIG_VIDEO_IMX_ISI_M2M) += imx-isi-m2m.o
> +
> +obj-$(CONFIG_VIDEO_IMX_ISI) += imx-isi.o
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx-isi/imx-isi-core.c
> similarity index 99%
> rename from drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> rename to drivers/media/platform/nxp/imx-isi/imx-isi-core.c
> index 253e77189b69..cd5678139ddf 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx-isi/imx-isi-core.c

Stop renaming everything. You affect users of modules, make backporting
a bit trickier for no real reason.

Best regards,
Krzysztof

