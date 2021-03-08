Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 290733315D3
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 19:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbhCHSWa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 13:22:30 -0500
Received: from mail-io1-f54.google.com ([209.85.166.54]:43305 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhCHSWV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 13:22:21 -0500
Received: by mail-io1-f54.google.com with SMTP id f20so10960653ioo.10;
        Mon, 08 Mar 2021 10:22:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Pq15jcwTEBECLbFVPJ1zaHWvf20RZ6s1s9fGsnrhjPg=;
        b=lLRwUpL1ExD8n0NtZKqqzP1hyst/+ssa2UDnY5eRbn9JOG6NKuPSH6WhTefr2R1Qtb
         3o7ZTStUKJT/QMsXnNM4FaDjHBnZnWppHqsQxUzUYD27mMiW9E0tU/hOl0e+a1AVnn1b
         E0nj9Hs3yOjrkLlA2W6Cv9GZrJjsHc5hQBHT0ejUHgx3MhqS1OeBCUYMYgTtJ/6UDfIZ
         q4AjN7Y72XhciwdvXYSQOGs5YRHGnK1WqWo3XxdDYEidY2dcTRx+YrQV7bxMF8a5Tm+M
         bI9ER9T0Qah6lX6+Ko/9ujAd02suLRssv7HWUci0jE/MmQ5sQTjkfOdlOGJP2gOl9LKP
         TTnw==
X-Gm-Message-State: AOAM531dWoKB8FiGPnho4uzK2xKPpABl6NfnMREz10Wsfkz3CAWAUABj
        GtsyvZlWo5rkd3pg8JrG4f4KiBbGjg==
X-Google-Smtp-Source: ABdhPJyUGYEl6elYvRaF78SgykrT1EbiNGGNHSkzsW41shl8b7neRG3JF3Scv/qM1s2j+IT1Cg/MZw==
X-Received: by 2002:a05:6602:2018:: with SMTP id y24mr12056432iod.74.1615227740322;
        Mon, 08 Mar 2021 10:22:20 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id r12sm6521797ile.59.2021.03.08.10.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 10:22:19 -0800 (PST)
Received: (nullmailer pid 2738951 invoked by uid 1000);
        Mon, 08 Mar 2021 18:22:17 -0000
Date:   Mon, 8 Mar 2021 11:22:17 -0700
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, ezequiel@collabora.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
Subject: Re: [PATCH v3 0/5] Reset driver for IMX8MQ VPU hardware block
Message-ID: <20210308182217.GA2735443@robh.at.kernel.org>
References: <20210301151754.104749-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301151754.104749-1-benjamin.gaignard@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 01, 2021 at 04:17:49PM +0100, Benjamin Gaignard wrote:
> The two VPUs inside IMX8MQ share the same control block which can be see
> as a reset hardware block.
> In order to be able to add the second VPU (for HECV decoding) it will be
> more handy if the both VPU drivers instance don't have to share the
> control block registers. This lead to implement it as an independ reset 
> driver and to change the VPU driver to use it.
> 
> Please note that this series break the compatibility between the DTB and
> kernel. This break is limited to IMX8MQ SoC and is done when the driver
> is still in staging directory.

As this information will be lost, please put in the binding and dts 
patch.

> 
> version 3:
> - Fix error in VPU example node
> 
> version 2:
> - Document the change in VPU bindings
>  
> Benjamin Gaignard (5):
>   dt-bindings: reset: IMX8MQ VPU reset
>   dt-bindings: media: IMX8MQ VPU: document reset usage
>   reset: Add reset driver for IMX8MQ VPU block
>   media: hantro: Use reset driver
>   arm64: dts: imx8mq: Use reset driver for VPU hardware block
> 
>  .../bindings/media/nxp,imx8mq-vpu.yaml        |  14 +-
>  .../bindings/reset/fsl,imx8mq-vpu-reset.yaml  |  54 ++++++
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  31 +++-
>  drivers/reset/Kconfig                         |   8 +
>  drivers/reset/Makefile                        |   1 +
>  drivers/reset/reset-imx8mq-vpu.c              | 169 ++++++++++++++++++
>  drivers/staging/media/hantro/Kconfig          |   1 +
>  drivers/staging/media/hantro/imx8m_vpu_hw.c   |  61 ++-----
>  include/dt-bindings/reset/imx8mq-vpu-reset.h  |  16 ++
>  9 files changed, 294 insertions(+), 61 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/reset/fsl,imx8mq-vpu-reset.yaml
>  create mode 100644 drivers/reset/reset-imx8mq-vpu.c
>  create mode 100644 include/dt-bindings/reset/imx8mq-vpu-reset.h
> 
> -- 
> 2.25.1
> 
