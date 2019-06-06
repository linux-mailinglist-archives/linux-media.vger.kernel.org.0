Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9FB937211
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 12:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfFFKwH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 06:52:07 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:38073 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725784AbfFFKwH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 06:52:07 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Yq01hyi9N3qlsYq04hm4Jh; Thu, 06 Jun 2019 12:52:05 +0200
Subject: Re: [PATCH] Revert "media: staging/imx: Allow driver to build if
 COMPILE_TEST is enabled"
To:     Fabio Estevam <festevam@gmail.com>
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de,
        rdunlap@infradead.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, javierm@redhat.com
References: <20190605205333.2481-1-festevam@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2110572a-9a81-820a-edcf-970c8b961038@xs4all.nl>
Date:   Thu, 6 Jun 2019 12:52:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605205333.2481-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJs3LtkM5/eIyjjPi3kkUD/fBICjKzPootn+IWwbPENdA8K7wOUwcBJJfDGQZxJ2HILjZ8fB3zaeCtO3xBGXXv0ltNPJrqoGCvyRMXuR7/XQJPneblpb
 XjMzZO2auMd+PQjU0QrJbCKIwm2OmIRm1csagpsWQr9W9yFPU1MW1IvEsu9AmfuWi24Gd8TGYyR7sT/GEAE99NOe1LiiCzlOYpaj3vCEaJghrv/d5VF6zg1d
 hau/FmnAfTENbe27CNyXIVreFBBwkFTFTrdsfIm0RLf8h4J5NUvwMIdQH/+lkCvAhKTps7O/j6vg7L4K8u979BR7tlOCAuPQ3IHT/n0L01J4avY7AlNdgdCv
 uoQZtjxtcHee7wEWFXbvmHlrv2MHbQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/5/19 10:53 PM, Fabio Estevam wrote:
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

Can this driver just select IMX_IPUV3_CORE? IMX_IPUV3_CORE can handle
TEST_COMPILE, so that might work.

Regards,

	Hans

>  	depends on VIDEO_V4L2_SUBDEV_API
>  	depends on HAS_DMA
>  	select VIDEOBUF2_DMA_CONTIG
> 

