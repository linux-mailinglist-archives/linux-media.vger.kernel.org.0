Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF192EBEC1
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 14:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbhAFNgo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Jan 2021 08:36:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbhAFNgo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 08:36:44 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0936C061358
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 05:36:03 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kx8yc-0001l3-0x; Wed, 06 Jan 2021 14:35:50 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kx8yY-0005CD-Rt; Wed, 06 Jan 2021 14:35:46 +0100
Message-ID: <b5c5cf7360a0bc297e5753ed1b4d40476ccd7923.camel@pengutronix.de>
Subject: Re: [PATCH -next] media: hantro: use resource_size
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>, ezequiel@collabora.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Cc:     gregkh@linuxfoundation.org
Date:   Wed, 06 Jan 2021 14:35:46 +0100
In-Reply-To: <20210106131813.32644-1-zhengyongjun3@huawei.com>
References: <20210106131813.32644-1-zhengyongjun3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Zheng,

On Wed, 2021-01-06 at 21:18 +0800, Zheng Yongjun wrote:
> Use resource_size rather than a verbose computation on
> the end and start fields.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/staging/media/hantro/hantro_v4l2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> index b668a82d40ad..e1081c16f56a 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -316,7 +316,7 @@ hantro_reset_fmt(struct v4l2_pix_format_mplane *fmt,
>  
>  	fmt->pixelformat = vpu_fmt->fourcc;
>  	fmt->field = V4L2_FIELD_NONE;
> -	fmt->colorspace = V4L2_COLORSPACE_JPEG,
> +	fmt->colorspace = V4L2_COLORSPACE_JPEG;
>  	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>  	fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
>  	fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;

Subject and commit message do not describe the patch.

regards
Philipp
