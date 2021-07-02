Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA15D3BA107
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 15:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232508AbhGBNQ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 09:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232338AbhGBNQ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 09:16:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC336C061762;
        Fri,  2 Jul 2021 06:14:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D23C4AB;
        Fri,  2 Jul 2021 15:14:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1625231663;
        bh=IBR4LNA8NgjXSiJtqplX8vE2/homcyM2XE31/wxSYw4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jCrp1JCb64mXSRPTfntfNPK3mhjxJ9/0kibz8/gJyeAZ9NK+xH1eV3MpXVORPoNSL
         2qCNcIn/JgD8oQumbRh7IZ3DRzDi0e9ooU7QT4fP/08jUKN7mLA656P82JeeWLqlJn
         r0oaGwBF1qZUmUPtAQQnizGKb8qjUot5VmpmvP/o=
Date:   Fri, 2 Jul 2021 16:13:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] media: mt9p031: Use BIT macro
Message-ID: <YN8RB6yaI7BFNk+O@pendragon.ideasonboard.com>
References: <20210702095922.118614-1-s.riedmueller@phytec.de>
 <20210702095922.118614-7-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210702095922.118614-7-s.riedmueller@phytec.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

Thank you for the patch.

On Fri, Jul 02, 2021 at 11:59:22AM +0200, Stefan Riedmueller wrote:
> Make use of the BIT macro for setting individual bits. This improves
> readability and safety with respect to shifts.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  drivers/media/i2c/mt9p031.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index 3511c4ff350d..0a5bcbebe55f 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -76,39 +76,39 @@
>  #define	MT9P031_PLL_CONFIG_1				0x11
>  #define	MT9P031_PLL_CONFIG_2				0x12
>  #define MT9P031_PIXEL_CLOCK_CONTROL			0x0a
> -#define		MT9P031_PIXEL_CLOCK_INVERT		(1 << 15)
> +#define		MT9P031_PIXEL_CLOCK_INVERT		BIT(15)
>  #define		MT9P031_PIXEL_CLOCK_SHIFT(n)		((n) << 8)
>  #define		MT9P031_PIXEL_CLOCK_DIVIDE(n)		((n) << 0)
>  #define MT9P031_RESTART					0x0b
> -#define		MT9P031_FRAME_PAUSE_RESTART		(1 << 1)
> -#define		MT9P031_FRAME_RESTART			(1 << 0)
> +#define		MT9P031_FRAME_PAUSE_RESTART		BIT(1)
> +#define		MT9P031_FRAME_RESTART			BIT(0)
>  #define MT9P031_SHUTTER_DELAY				0x0c
>  #define MT9P031_RST					0x0d
>  #define		MT9P031_RST_ENABLE			1

This could also be turned into BIT(0).

>  #define		MT9P031_RST_DISABLE			0

This should then be dropped.

>  #define MT9P031_READ_MODE_1				0x1e
>  #define MT9P031_READ_MODE_2				0x20
> -#define		MT9P031_READ_MODE_2_ROW_MIR		(1 << 15)
> -#define		MT9P031_READ_MODE_2_COL_MIR		(1 << 14)
> -#define		MT9P031_READ_MODE_2_ROW_BLC		(1 << 6)
> +#define		MT9P031_READ_MODE_2_ROW_MIR		BIT(15)
> +#define		MT9P031_READ_MODE_2_COL_MIR		BIT(14)
> +#define		MT9P031_READ_MODE_2_ROW_BLC		BIT(6)
>  #define MT9P031_ROW_ADDRESS_MODE			0x22
>  #define MT9P031_COLUMN_ADDRESS_MODE			0x23
>  #define MT9P031_GLOBAL_GAIN				0x35
>  #define		MT9P031_GLOBAL_GAIN_MIN			8
>  #define		MT9P031_GLOBAL_GAIN_MAX			1024
>  #define		MT9P031_GLOBAL_GAIN_DEF			8
> -#define		MT9P031_GLOBAL_GAIN_MULT		(1 << 6)
> +#define		MT9P031_GLOBAL_GAIN_MULT		BIT(6)
>  #define MT9P031_ROW_BLACK_TARGET			0x49
>  #define MT9P031_ROW_BLACK_DEF_OFFSET			0x4b
>  #define MT9P031_GREEN1_OFFSET				0x60
>  #define MT9P031_GREEN2_OFFSET				0x61
>  #define MT9P031_BLACK_LEVEL_CALIBRATION			0x62
> -#define		MT9P031_BLC_MANUAL_BLC			(1 << 0)
> +#define		MT9P031_BLC_MANUAL_BLC			BIT(0)
>  #define MT9P031_RED_OFFSET				0x63
>  #define MT9P031_BLUE_OFFSET				0x64
>  #define MT9P031_TEST_PATTERN				0xa0
>  #define		MT9P031_TEST_PATTERN_SHIFT		3
> -#define		MT9P031_TEST_PATTERN_ENABLE		(1 << 0)
> +#define		MT9P031_TEST_PATTERN_ENABLE		BIT(0)
>  #define		MT9P031_TEST_PATTERN_DISABLE		(0 << 0)

Similarly here, MT9P031_TEST_PATTERN_DISABLE should be dropped.

>  #define MT9P031_TEST_PATTERN_GREEN			0xa1
>  #define MT9P031_TEST_PATTERN_RED			0xa2

-- 
Regards,

Laurent Pinchart
