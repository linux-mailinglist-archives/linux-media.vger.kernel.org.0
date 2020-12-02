Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055B12CB703
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 09:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387654AbgLBIZK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 03:25:10 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:33149 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726898AbgLBIZK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 03:25:10 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id kNQwkxXA2kGBYkNQzkZPDM; Wed, 02 Dec 2020 09:24:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606897468; bh=4aQWTSJcpnqm5HkU2W1lRO0MKZWkB+Dnx78eOD+BEqA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=G76lo9HHD2hAw2tVzS1JuzXVAB8E9gLb4WE7Fuc70YO08+TvFrQTu09bdsc/0OKRe
         whYBBk7gTnTSOagBkz9VocHGrMBAjs0EUKbD0wI8zHXfhhzYLslmB9KJNAPIwziePE
         TvG7qJIlsOx+492dFvo+gpldvpxjBD6ssmZTslHUq4OGNfdD/JlYJhWdRpZ5eWKEHE
         8bwAZNLbu3GtkgXeVekHTgLqErCgejenEIrqiPE7fmxgewep2vO5rIJtHuJIknDV84
         aDrONXkOjHsdknbl1OfpT8kyq1Lz3GG3rsIPqe76zCNuEU/frRG3/mTl4DBnJLPibk
         v1zGqKQ5rwhZg==
Subject: Re: [PATCH] staging: media: imx: drop dependency on ipuv3
To:     Martin Kepplinger <martin.kepplinger@puri.sm>,
        rogerio.silva@nxp.com, slongerbeam@gmail.com,
        p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
        festevam@gmail.com
Cc:     iain.galloway@nxp.com, kernel@puri.sm, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20201109091340.7223-1-martin.kepplinger@puri.sm>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6044ff23-1117-4c11-35b7-fb44b8ce2435@xs4all.nl>
Date:   Wed, 2 Dec 2020 09:24:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201109091340.7223-1-martin.kepplinger@puri.sm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfD+xQMvUzzpe9aD9lBPq1UPqDH6Td3vPjhgNE517heHqImdmpVZ9EzC4Sw0Fp2mmML3MfFIgGsj/RZFbQGig4B0OTiy523BvOnfMb0y7SVVIgjTv9hLM
 rggcZyt1vBLBhml74b/fX3OaYkseTCYQcYcPnKT74fJvu1hHHsNxgbsOiJej69wz2WBPNNACEnt4Smcr2tN0X37eZmDCVIvY4F63J+N4uXuHBVRZJOZm5XT9
 BKWKU03UFDSLqTEGOrYfXECjPBDRmvOLBNM2yvllA3KL+lhroUl9Vs8adEWQlZ79cnKqU4o9DFCq798aU8Rd3K4EdEDg44guEZrkZtUMijQLIpz7kGWfwlf6
 ZJvf7L9tEgXDnLb6+dkKkOThWVNuNJA5XSQJpuVe2ScVVTkHAD9v+fxV9YlWPC/g6aW89XLTt2fmk8M1PTTOsa5uS8lqjK1sgVzFSkPG17l8Yq3GBni+TEhv
 LOYbFv1u9wMkaoaazCjXOyJ/mXBGfVQpBKfnzb3oW/sbcEzxa7wDbFQRDN+PKobxqk+MdUELNemi+HSgaOvTXpwoepjBNinrjirREab7tQdIaf5H9I7z659Y
 xYm+G392BAR1vnpNFse+KJbRp/lNNWQGP+Wad4o7rVr56Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/11/2020 10:13, Martin Kepplinger wrote:
> As described in NXPs' linux tree, the imx8m SoC includes the same
> CSI bridge hardware that is part of imx7d. We should be able to
> use the "fsl,imx7-csi" driver for imx8m directly.
> 
> Since ipuv3 is not relevant for imx8m, drop the build dependency
> for it.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  drivers/staging/media/imx/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
> index f555aac8a9d5..98272fd92fe4 100644
> --- a/drivers/staging/media/imx/Kconfig
> +++ b/drivers/staging/media/imx/Kconfig
> @@ -2,7 +2,7 @@
>  config VIDEO_IMX_MEDIA
>  	tristate "i.MX5/6 V4L2 media core driver"

Isn't this text rather out of date if imx7 & 8 are also supported?

Something to fix for the next version...

Regards,

	Hans

>  	depends on ARCH_MXC || COMPILE_TEST
> -	depends on VIDEO_V4L2 && IMX_IPUV3_CORE
> +	depends on VIDEO_V4L2
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	depends on HAS_DMA
> 

