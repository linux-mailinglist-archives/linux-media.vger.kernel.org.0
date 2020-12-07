Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6855C2D0AEF
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 08:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgLGHCZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 7 Dec 2020 02:02:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbgLGHCZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 02:02:25 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 318ABC0613D0
        for <linux-media@vger.kernel.org>; Sun,  6 Dec 2020 23:01:45 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kmAWf-0000VH-Pl; Mon, 07 Dec 2020 08:01:37 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kmAWc-00026h-TV; Mon, 07 Dec 2020 08:01:34 +0100
Message-ID: <8b01e4a320c9af9e6502e870e0ce44338542b100.camel@pengutronix.de>
Subject: Re: [PATCH] staging:hantro: Fixed "replace comma with semicolon"
 Warning:
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Travis Carter <traviscarter2@gmail.com>, ezequiel@collabora.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Date:   Mon, 07 Dec 2020 08:01:34 +0100
In-Reply-To: <20201204235150.GA8626@linuxmint-midtower-pc>
References: <20201204235150.GA8626@linuxmint-midtower-pc>
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

Hi Travis,

On Fri, 2020-12-04 at 17:51 -0600, Travis Carter wrote:
> Corrected the following Warning:
> drivers/staging/media/hantro/hantro_v4l2.c:319: WARNING: Possible comma where semicolon could be used
> 
> Signed-off-by: Travis Carter <traviscarter2@gmail.com>
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

Thank you,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
