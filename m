Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B364888BF
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 11:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235275AbiAIKgl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jan 2022 05:36:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbiAIKgl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jan 2022 05:36:41 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7280FC06173F;
        Sun,  9 Jan 2022 02:36:40 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D3CF7FF803;
        Sun,  9 Jan 2022 10:36:37 +0000 (UTC)
Date:   Sun, 9 Jan 2022 11:37:38 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: Re: [PATCH v2 08/11] media: i2c: max9286: Define macros for all bits
 of register 0x15
Message-ID: <20220109103738.fqyehzvj4hgggu6w@uno.localdomain>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220101182806.19311-9-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220101182806.19311-9-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jan 01, 2022 at 08:28:03PM +0200, Laurent Pinchart wrote:
> Macros are easier to read than numerical values.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 24c2bf4fda53..4b69bd036ca6 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -80,10 +80,13 @@
>  #define MAX9286_DATATYPE_RGB565		(1 << 0)
>  #define MAX9286_DATATYPE_RGB888		(0 << 0)
>  /* Register 0x15 */
> +#define MAX9286_CSI_IMAGE_TYP		BIT(7)
>  #define MAX9286_VC(n)			((n) << 5)
>  #define MAX9286_VCTYPE			BIT(4)
>  #define MAX9286_CSIOUTEN		BIT(3)
> -#define MAX9286_0X15_RESV		(3 << 0)
> +#define MAX9286_SWP_ENDIAN		BIT(2)
> +#define MAX9286_EN_CCBSYB_CLK_STR	BIT(1)
> +#define MAX9286_EN_GPI_CCBSYB		BIT(0)
>  /* Register 0x1b */
>  #define MAX9286_SWITCHIN(n)		(1 << ((n) + 4))
>  #define MAX9286_ENEQ(n)			(1 << (n))
> @@ -525,10 +528,12 @@ static void max9286_set_video_format(struct max9286_priv *priv,
>  		return;
>
>  	/*
> -	 * Video format setup:
> -	 * Disable CSI output, VC is set according to Link number.
> +	 * Video format setup: disable CSI output, set VC according to Link
> +	 * number, enable I2C clock stretching when CCBSY is low, enable CCBSY
> +	 * in external GPI-to-GPO mode.
>  	 */
> -	max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
> +	max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_EN_CCBSYB_CLK_STR |
> +		      MAX9286_EN_GPI_CCBSYB);
>
>  	/* Enable CSI-2 Lane D0-D3 only, DBL mode. */
>  	max9286_write(priv, 0x12, MAX9286_CSIDBL | MAX9286_DBL |
> @@ -810,13 +815,17 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
>  		}
>
>  		/*
> -		 * Enable CSI output, VC set according to link number.
> -		 * Bit 7 must be set (chip manual says it's 0 and reserved).
> +		 * Configure the CSI-2 output to line interleaved mode (W x (N
> +		 * x H), as opposed to the (N x W) x H mode that outputs the
> +		 * images stitched side-by-side) and enable it.
>  		 */
> -		max9286_write(priv, 0x15, 0x80 | MAX9286_VCTYPE |
> -			      MAX9286_CSIOUTEN | MAX9286_0X15_RESV);
> +		max9286_write(priv, 0x15, MAX9286_CSI_IMAGE_TYP | MAX9286_VCTYPE |
> +			      MAX9286_CSIOUTEN | MAX9286_EN_CCBSYB_CLK_STR |
> +			      MAX9286_EN_GPI_CCBSYB);
>  	} else {
> -		max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
> +		max9286_write(priv, 0x15, MAX9286_VCTYPE |
> +			      MAX9286_EN_CCBSYB_CLK_STR |
> +			      MAX9286_EN_GPI_CCBSYB);

Probably fits better on two lines only.

Trusting the bits definitions:
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

>
>  		/* Stop all cameras. */
>  		for_each_source(priv, source)
> --
> Regards,
>
> Laurent Pinchart
>
