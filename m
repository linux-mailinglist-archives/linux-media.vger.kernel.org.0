Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3C333018
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 14:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbfFCMpn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 08:45:43 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:52677 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726792AbfFCMpn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Jun 2019 08:45:43 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id XmLJhLWU8sDWyXmLMht7vZ; Mon, 03 Jun 2019 14:45:41 +0200
Subject: Re: [PATCH v3 08/10] media: hantro: add initial i.MX8MQ support
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
References: <20190531085523.10892-1-p.zabel@pengutronix.de>
 <20190531085523.10892-9-p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cfabcdc7-baff-82d8-2b24-5a18a9c50441@xs4all.nl>
Date:   Mon, 3 Jun 2019 14:45:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190531085523.10892-9-p.zabel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGUmvVtXbo4hpmmyG9vcRRzTp2aHcqoTUi5Mjg2Bws5gTVonHrWOlO9punBb39MBYupZRFE8oAwz02MyWyWJTEP5Nf8Ifj0N3zr9u4d2m8vhgZsm4KQT
 aQPnQKzBNij8n3MWGiXDjx87zV5eebWejo3t8nsepGR+qnyTh9zmklj3XA3k6aJTQxisIs6oySBdFjyVmv7ZyLpnwJegmWT+dTR4HDI2knM5GTnvqPMzkEXh
 wNE7aFwOHra9zxFjP2kxpaUkUU2sOy6UupIpsLDp9UBl4L5w1/zYdGr72+v+zIUV9tMD75HYJPKnXTvto5VwFsqMBslOGNcxY9/wDrGCuu3Vq9wBoyaMJ44R
 dkJOKQS04FflQNzNrYxcgH3YYBLF9Hc+tCMVxHoVHMdIEuG4D5Pm556MeLgYtP6flF7srXyRqeoL+m7Z2jCZUFtQ5cvnrg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/31/19 10:55 AM, Philipp Zabel wrote:
> For now this just enables MPEG-2 decoding on the Hantro G1 on i.MX8MQ.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> Changes since v2 [1]:
>  - Adapted to changes in patches 4 and 5
> 
> [1] https://patchwork.linuxtv.org/patch/56420/
> ---
>  drivers/staging/media/hantro/Kconfig        |   8 +-
>  drivers/staging/media/hantro/Makefile       |   1 +
>  drivers/staging/media/hantro/hantro_drv.c   |   1 +
>  drivers/staging/media/hantro/hantro_hw.h    |   1 +
>  drivers/staging/media/hantro/imx8m_vpu_hw.c | 171 ++++++++++++++++++++
>  5 files changed, 178 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/staging/media/hantro/imx8m_vpu_hw.c
> 
> diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/staging/media/hantro/Kconfig
> index 660cca358f04..6fdb72df7bd3 100644
> --- a/drivers/staging/media/hantro/Kconfig
> +++ b/drivers/staging/media/hantro/Kconfig
> @@ -1,15 +1,15 @@
>  # SPDX-License-Identifier: GPL-2.0
>  config VIDEO_HANTRO
>  	tristate "Hantro VPU driver"
> -	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	depends on ARCH_MXC || ARCH_ROCKCHIP || COMPILE_TEST
>  	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
>  	depends on MEDIA_CONTROLLER_REQUEST_API
>  	select VIDEOBUF2_DMA_CONTIG
>  	select VIDEOBUF2_VMALLOC
>  	select V4L2_MEM2MEM_DEV
>  	help
> -	  Support for the Hantro IP based Video Processing Unit present on
> -	  Rockchip SoC, which accelerates video and image encoding and
> -	  decoding.
> +	  Support for the Hantro IP based Video Processing Units present on
> +	  Rockchip and NXP i.MX8M SoCs, which accelerate video and image
> +	  encoding and decoding.
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called hantro-vpu.
> diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
> index 14f17a4e48cb..1dac16af451e 100644
> --- a/drivers/staging/media/hantro/Makefile
> +++ b/drivers/staging/media/hantro/Makefile
> @@ -9,5 +9,6 @@ hantro-vpu-y += \
>  		rk3399_vpu_hw.o \
>  		rk3399_vpu_hw_jpeg_enc.o \
>  		rk3399_vpu_hw_mpeg2_dec.o \
> +		imx8m_vpu_hw.o \
>  		hantro_jpeg.o \
>  		hantro_mpeg2.o

I'm a bit concerned about how this is organized. As far as I can tell,
enabling this driver would compile both rockchip and imx8 code into the
same driver. You would expect that only the code for the selected
architectures would be compiled in (or all if COMPILE_TEST is set, of course).

Can you take a look at this?

Regards,

	Hans
