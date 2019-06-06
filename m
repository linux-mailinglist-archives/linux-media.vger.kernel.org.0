Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29BCD368E3
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 02:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbfFFA7G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 20:59:06 -0400
Received: from merlin.infradead.org ([205.233.59.134]:57978 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfFFA7G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 20:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rdvxjYpg/e8nhq1XERcq08J7OsYArg9QNGCXIA6GP3M=; b=jMuaVq1fJw9VkLiI6IrgXWskHz
        AUgIn4icw6zR0iZFb5OVT7FPsdzJSvDAPVTD9KQRIAcghB2Ww+6RASil0dv4QwZtD7hVhRlYveZ9U
        l5eKLjTGsuyx7PVm7fPcCmB6IDKISL5S1KUF9ov4LQsUnSdDvZXb34lYtWPvgHXmplzdIMebnWZDz
        PXdXx2kpE5gOvqqmkEbHmiW0d5cVB1V2ExLUGQW4ercvxIevls5fwq2VD0uxIW1Xd4ajs8+p8yNvq
        /Fuewt1ef1SdhEMi6vfXDLNxWLL5H6+jS5DuZ+GsO41FjQ1/wSP1X0PikzJ3W0RRxCOWAWZSA0XNU
        z/QAiOcg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hYgkA-0003ZU-9d; Thu, 06 Jun 2019 00:59:02 +0000
Subject: Re: [PATCH] Revert "media: staging/imx: Allow driver to build if
 COMPILE_TEST is enabled"
To:     Fabio Estevam <festevam@gmail.com>, hverkuil-cisco@xs4all.nl
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org, mchehab@kernel.org, javierm@redhat.com
References: <20190605205333.2481-1-festevam@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <97474d3b-88f5-a2ee-cf8f-b5d59df22733@infradead.org>
Date:   Wed, 5 Jun 2019 17:58:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190605205333.2481-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/5/19 1:53 PM, Fabio Estevam wrote:
> Commit 020bc7354a6e ("media: staging/imx: Allow driver to build
> if COMPILE_TEST is enabled") incorrectly assumed that the imx media
> driver had no build time dependency with IMX_IPUV3_CORE.
> 
> Building on x86_64 without IMX_IPUV3_CORE causes lots of build errors
> such as:
> 
> ld: drivers/staging/media/imx/imx-media-internal-sd.o: in function `imx_media_register_ipu_internal_subdevs':
> imx-media-internal-sd.c:(.text+0xd1): undefined reference to `ipu_get_num'
> ld: drivers/staging/media/imx/imx-ic-common.o: in function `imx_media_ic_register':
> imx-ic-common.c:(.text+0xec): undefined reference to `ipu_get_num'
> 
> All these definitions come from the imx ipu3 core driver, so make
> sure that imx media depends on IMX_IPUV3_CORE.
> 
> This reverts commit 020bc7354a6ebec980e0aedf5bedf57b42f93aca.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Works for me.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/staging/media/imx/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
> index ad3d7df6bb3c..4c726345dc25 100644
> --- a/drivers/staging/media/imx/Kconfig
> +++ b/drivers/staging/media/imx/Kconfig
> @@ -2,7 +2,7 @@
>  config VIDEO_IMX_MEDIA
>  	tristate "i.MX5/6 V4L2 media core driver"
>  	depends on ARCH_MXC || COMPILE_TEST
> -	depends on MEDIA_CONTROLLER && VIDEO_V4L2 && (IMX_IPUV3_CORE || COMPILE_TEST)
> +	depends on MEDIA_CONTROLLER && VIDEO_V4L2 && IMX_IPUV3_CORE
>  	depends on VIDEO_V4L2_SUBDEV_API
>  	depends on HAS_DMA
>  	select VIDEOBUF2_DMA_CONTIG
> 


-- 
~Randy
