Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B9F354FC1
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 11:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233937AbhDFJYr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 05:24:47 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:51559 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234340AbhDFJYU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Apr 2021 05:24:20 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ThwKl3zws43ycThwNlNMl6; Tue, 06 Apr 2021 11:24:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617701051; bh=6ltNW1Y1YoLa2xULgf+BpKnOllfDqYhoJ72xHtaUesI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=AQNMu50aeibY975qN4Yhq5zXrN0iyCg+4Dsmk5Cti8Yv2UYEixTLjGiNg6hFr90JS
         D9bauakk3RWbLrfP5I/E6/6uGV6PFAbu31v+G2nzSzr8Bf/k6zcqW9TEKAHto0bEUV
         yXWKErZm0fCmf7WiLg3o0M9sBs2LHXoSNQRNcEeiSoDbPJoyAb004Ov34mZLyf7hyP
         IZyPdWZScrtNL1xxBrClegJLDHwWlqJszqW3eYYQWPOBYR4D7HAqIbgZy4PrdwYOKg
         7PE0cRWqgY5P74Nf9luDZIuh8YtqFi71Gp2tMJd7wtU2XMjOhFxOFeL564fVPShxuT
         3Nvgyh1wCv1Cw==
Subject: Re: [PATCH] media: VIDEO_IMX8_JPEG should depend on ARCH_MXC and not
 default to m
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20210331081735.367238-1-geert+renesas@glider.be>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e566f40a-dcfb-d863-bc6a-369e7972114a@xs4all.nl>
Date:   Tue, 6 Apr 2021 11:24:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210331081735.367238-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfM9w8guDS0s68bUW6rlcl0Hz8og0HZGLM8aVwXHcCs1LctqG4skiEBKQc37st96e1fFBUbJVuG4VxpRCMu3vAGbThMezq/L1m2QfCvMsDQmNOeYrZqEn
 17yIe+68HSfInvq2rR855uyYZvrb6cah/RYD96XL/YDHBuefEjMoXo6JpKCorYpNLjEDf6cCVKDvfq3q5mbFnSUvp+H/Cnz+KNfd9FSpWWSMmZ12jlYI0u8r
 sr220x3pW+eUrViKLiO/actVQCTSkxf5L/cBXMsUatvd9Xij8VY328wxWeTYJ1kUfdC/wckr/eM7JMCOnkMWTvgErC6QUzSbNzCetGGdqOl8AEVpYGziQgdn
 RtsowWLcmLvn/8xXHyuvzyw8mUbXQtvKVmaANoqJMc2W2jJ8zXekLMOMVFI1+cPaBjH5oWVjdzGOBzCGDiYXqjmCWRolkG4YNCfsRfxRIk1U9/SxMLNlhRNi
 WwDjvF5y+f9pNjfuWW1V3KH0s2wVw6KMCrZ/ymis7Y4zEWqifUfd+iXsZuRxgAgRCnADe/7evNSgASxh
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On 31/03/2021 10:17, Geert Uytterhoeven wrote:
> The i.MX8 QXP/QM integrated JPEG encoder/decoder is only present on
> Freescale/NXP i.MX8 QXP and QM SoCs.  Hence add a dependency on
> ARCH_MXC, to prevent asking the user about this driver when configuring
> a kernel without i.MX8 support.
> 
> Drop the "default m" (which means "default y" if CONFIG_MODULES is not
> enabled), as merely enabling CONFIG_COMPILE_TEST should not enable
> additional code.

You do not actually drop 'default m' in the patch. Either the patch or the
commit message is wrong.

Regards,

	Hans

> 
> Fixes: 2db16c6ed72ce644 ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/media/platform/imx-jpeg/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/imx-jpeg/Kconfig b/drivers/media/platform/imx-jpeg/Kconfig
> index d875f7c88cdad125..0e3269d06ded30ec 100644
> --- a/drivers/media/platform/imx-jpeg/Kconfig
> +++ b/drivers/media/platform/imx-jpeg/Kconfig
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  config VIDEO_IMX8_JPEG
>  	tristate "IMX8 JPEG Encoder/Decoder"
> +	depends on ARCH_MXC || COMPILE_TEST
>  	depends on VIDEO_DEV && VIDEO_V4L2
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_MEM2MEM_DEV
> 

