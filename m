Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58F7C19A7F
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 11:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbfEJJSI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 05:18:08 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:42241 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726992AbfEJJSI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 05:18:08 -0400
Received: from [IPv6:2001:983:e9a7:1:d7b:80d:652c:317d] ([IPv6:2001:983:e9a7:1:d7b:80d:652c:317d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id P1fJhc8LSsDWyP1fKhbcBb; Fri, 10 May 2019 11:18:06 +0200
Subject: Re: [PATCH 1/3] media: mx2-emmaprp: Allow MX2-EMMA driver support to
 be selected with i.MX21
To:     Alexander Shiyan <shc_work@mail.ru>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20181216034806.15725-1-shc_work@mail.ru>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d082e2ac-480d-8792-8829-2676127a9182@xs4all.nl>
Date:   Fri, 10 May 2019 11:18:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20181216034806.15725-1-shc_work@mail.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfE9K/952uLA7tUjBzvHf1PCbMtnPRo1SbNQUkPYSqlQiSvOw87PlqiozyLjEEa+cAzVcFWKVYVSqAsm1SF4Br31hUj40PrCZPLXFeFELtmZEWTih+1WH
 z+MXv5Y6u/Cy6PYT4TqNNgrZPEBI6zUHmNCcD/ghb2KDjTuKzpOmKcqDBvlODdB+MrQn9DGBlbLdNqXkqYFlmtH8npH1eDoN3E6UGrImGvU2FVcQa4/WOf0u
 rFFcy4DAj5HityPBrh2b4KilaPzYshyiWS3cZogeJAx+ZIMn9pni7Y+kFmhiWNnAruzC+oefDAruLavWGHeC0nq25qEtVnflEMKvyRqOoJ9R2C9U1K3eP9tK
 V9TiBDJnMWAXzMlrnTkH2OD2Ma/6FtAg1xvfrooqK2Pi/p/UUq8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

This series has been stalled since I still haven't received a Reviewed-By of the binding
patch. I recommend that you rebase it and post it again, hopefully it will get a review
the second time around.

Regards,

	Hans

On 12/16/18 4:48 AM, Alexander Shiyan wrote:
> Freescale i.MX21 chip has enhanced Multimedia Accelerator (eMMA)
> video Pre-processor (PrP) unit. This patch allows MX2-EMMA support
> to be selected for this SoC.
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  drivers/media/platform/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 70c4f6c..fb70d21 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -293,7 +293,7 @@ config VIDEO_SAMSUNG_S5P_MFC
>  config VIDEO_MX2_EMMAPRP
>  	tristate "MX2 eMMa-PrP support"
>  	depends on VIDEO_DEV && VIDEO_V4L2
> -	depends on SOC_IMX27 || COMPILE_TEST
> +	depends on SOC_IMX21 || SOC_IMX27 || COMPILE_TEST
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_MEM2MEM_DEV
>  	help
> 

