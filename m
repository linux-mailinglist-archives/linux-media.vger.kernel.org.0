Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A377363540
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 14:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhDRMd0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 08:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbhDRMd0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 08:33:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED44C06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 05:32:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7509751E;
        Sun, 18 Apr 2021 14:32:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618749176;
        bh=+1Q18sAEPndpCuFzYntpdURC7u/uaPsptEmAS/s3rXo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=My2EUjFyyKzqEgRdN3I245TdD+MJSg7Rw2ztIh+JwE9TWA3wvj5tHIk2S4J8h0ad8
         N4x7OuV+4umFnR0s0zKItrZd9gnVcTqOFPLHbmw3/NDofd2nk8XWV4Dinb+Xsq+3iX
         GNfFZ7RLOSAhk4pnLnBfP/fJItdATHxwLn1+pRzU=
Date:   Sun, 18 Apr 2021 15:32:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 13/28] media: ti-vpe: cal: clean up CAL_CSI2_VC_IRQ_*
 macros
Message-ID: <YHwm9W5/tv0J7sU9@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-14-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-14-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:42PM +0300, Tomi Valkeinen wrote:
> The macros related to CAL_CSI2_VC_IRQ can be handled better by having
> the VC number as a macro parameter.
> 
> Note that the macros are not used anywhere yet, so no other changes are
> needed.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal_regs.h | 30 +++++-------------------
>  1 file changed, 6 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
> index 93d9bf1f3c00..ed658175a444 100644
> --- a/drivers/media/platform/ti-vpe/cal_regs.h
> +++ b/drivers/media/platform/ti-vpe/cal_regs.h
> @@ -406,30 +406,12 @@
>  #define CAL_CSI2_TIMING_STOP_STATE_X16_IO1_MASK		BIT(14)
>  #define CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK		BIT(15)
>  
> -#define CAL_CSI2_VC_IRQ_FS_IRQ_0_MASK			BIT(0)
> -#define CAL_CSI2_VC_IRQ_FE_IRQ_0_MASK			BIT(1)
> -#define CAL_CSI2_VC_IRQ_LS_IRQ_0_MASK			BIT(2)
> -#define CAL_CSI2_VC_IRQ_LE_IRQ_0_MASK			BIT(3)
> -#define CAL_CSI2_VC_IRQ_CS_IRQ_0_MASK			BIT(4)
> -#define CAL_CSI2_VC_IRQ_ECC_CORRECTION0_IRQ_0_MASK	BIT(5)
> -#define CAL_CSI2_VC_IRQ_FS_IRQ_1_MASK			BIT(8)
> -#define CAL_CSI2_VC_IRQ_FE_IRQ_1_MASK			BIT(9)
> -#define CAL_CSI2_VC_IRQ_LS_IRQ_1_MASK			BIT(10)
> -#define CAL_CSI2_VC_IRQ_LE_IRQ_1_MASK			BIT(11)
> -#define CAL_CSI2_VC_IRQ_CS_IRQ_1_MASK			BIT(12)
> -#define CAL_CSI2_VC_IRQ_ECC_CORRECTION0_IRQ_1_MASK	BIT(13)
> -#define CAL_CSI2_VC_IRQ_FS_IRQ_2_MASK			BIT(16)
> -#define CAL_CSI2_VC_IRQ_FE_IRQ_2_MASK			BIT(17)
> -#define CAL_CSI2_VC_IRQ_LS_IRQ_2_MASK			BIT(18)
> -#define CAL_CSI2_VC_IRQ_LE_IRQ_2_MASK			BIT(19)
> -#define CAL_CSI2_VC_IRQ_CS_IRQ_2_MASK			BIT(20)
> -#define CAL_CSI2_VC_IRQ_ECC_CORRECTION0_IRQ_2_MASK	BIT(21)
> -#define CAL_CSI2_VC_IRQ_FS_IRQ_3_MASK			BIT(24)
> -#define CAL_CSI2_VC_IRQ_FE_IRQ_3_MASK			BIT(25)
> -#define CAL_CSI2_VC_IRQ_LS_IRQ_3_MASK			BIT(26)
> -#define CAL_CSI2_VC_IRQ_LE_IRQ_3_MASK			BIT(27)
> -#define CAL_CSI2_VC_IRQ_CS_IRQ_3_MASK			BIT(28)
> -#define CAL_CSI2_VC_IRQ_ECC_CORRECTION0_IRQ_3_MASK	BIT(29)
> +#define CAL_CSI2_VC_IRQ_FS_IRQ_MASK(n)			BIT(0 + (n * 8))

This should be BIT(0 + (n) * 8). Same below.

As they're single bits, I would have dropped the _MASK suffix.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +#define CAL_CSI2_VC_IRQ_FE_IRQ_MASK(n)			BIT(1 + (n * 8))
> +#define CAL_CSI2_VC_IRQ_LS_IRQ_MASK(n)			BIT(2 + (n * 8))
> +#define CAL_CSI2_VC_IRQ_LE_IRQ_MASK(n)			BIT(3 + (n * 8))
> +#define CAL_CSI2_VC_IRQ_CS_IRQ_MASK(n)			BIT(4 + (n * 8))
> +#define CAL_CSI2_VC_IRQ_ECC_CORRECTION_IRQ_MASK(n)	BIT(5 + (n * 8))
>  
>  #define CAL_CSI2_CTX_DT_MASK		GENMASK(5, 0)
>  #define CAL_CSI2_CTX_VC_MASK		GENMASK(7, 6)

-- 
Regards,

Laurent Pinchart
