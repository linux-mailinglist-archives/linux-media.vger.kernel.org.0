Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8384D320D5E
	for <lists+linux-media@lfdr.de>; Sun, 21 Feb 2021 21:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbhBUUDZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 15:03:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbhBUUDY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 15:03:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F3CC061574;
        Sun, 21 Feb 2021 12:02:43 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FCB6EF;
        Sun, 21 Feb 2021 21:02:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613937759;
        bh=o2eDVQuJ6yjcFRPIKu9v84KcpaYn/gl029K82U+HOIM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YdOPKjyLq8xdf0OTeyQLgnjwKVOCYKOHnKiieixUnPwgrWv5l2NQObgBijpagtJ0p
         J06nCkSIS5V60pcLfJBRNn34iHJ7slDc+sPMWDex7NITULHQ5FnkLaQrVZNjum6JNM
         RkaDyTd0rfkUBd16SHXqnqTx+CcvYjxmIZvyprEA=
Date:   Sun, 21 Feb 2021 22:02:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Nikolay Kyx <knv418@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: omap4iss: code style - avoid macro
 argument precedence issues
Message-ID: <YDK8RfFUlktIyu7q@pendragon.ideasonboard.com>
References: <20210221195308.1451-1-knv418@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210221195308.1451-1-knv418@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nikolay,

Thank you for the patch.

On Sun, Feb 21, 2021 at 10:53:08PM +0300, Nikolay Kyx wrote:
> This patch fixes the following checkpatch.pl check:
> 
> CHECK: Macro argument 'i' may be better as '(i)' to avoid precedence issues
> 
> in file iss_regs.h
> 
> Signed-off-by: Nikolay Kyx <knv418@gmail.com>
> ---
> 
> Additionally some style warnings remain valid here and could be fixed by
> another patch.
> 
>  drivers/staging/media/omap4iss/iss_regs.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/omap4iss/iss_regs.h b/drivers/staging/media/omap4iss/iss_regs.h
> index 09a7375c89ac..cfe0bb075072 100644
> --- a/drivers/staging/media/omap4iss/iss_regs.h
> +++ b/drivers/staging/media/omap4iss/iss_regs.h
> @@ -197,7 +197,7 @@
>  #define CSI2_TIMING_STOP_STATE_COUNTER_IO1_MASK		(0x1fff << 0)
>  #define CSI2_TIMING_STOP_STATE_COUNTER_IO1_SHIFT	0
>  
> -#define CSI2_CTX_CTRL1(i)				(0x70 + (0x20 * i))
> +#define CSI2_CTX_CTRL1(i)				(0x70 + (0x20 * (i)))

This is a good change, as it fixes potential issues, but maybe we could
go one step forward and drop the unneeded parentheses ?

-#define CSI2_CTX_CTRL1(i)				(0x70 + (0x20 * i))
+#define CSI2_CTX_CTRL1(i)				(0x70 + 0x20 * (i))

What do you think ?

>  #define CSI2_CTX_CTRL1_GENERIC				BIT(30)
>  #define CSI2_CTX_CTRL1_TRANSCODE			(0xf << 24)
>  #define CSI2_CTX_CTRL1_FEC_NUMBER_MASK			(0xff << 16)
> @@ -210,7 +210,7 @@
>  #define CSI2_CTX_CTRL1_PING_PONG			BIT(3)
>  #define CSI2_CTX_CTRL1_CTX_EN				BIT(0)
>  
> -#define CSI2_CTX_CTRL2(i)				(0x74 + (0x20 * i))
> +#define CSI2_CTX_CTRL2(i)				(0x74 + (0x20 * (i)))
>  #define CSI2_CTX_CTRL2_FRAME_MASK			(0xffff << 16)
>  #define CSI2_CTX_CTRL2_FRAME_SHIFT			16
>  #define CSI2_CTX_CTRL2_USER_DEF_MAP_SHIFT		13
> @@ -222,19 +222,19 @@
>  #define CSI2_CTX_CTRL2_FORMAT_MASK			(0x3ff << 0)
>  #define CSI2_CTX_CTRL2_FORMAT_SHIFT			0
>  
> -#define CSI2_CTX_DAT_OFST(i)				(0x78 + (0x20 * i))
> +#define CSI2_CTX_DAT_OFST(i)				(0x78 + (0x20 * (i)))
>  #define CSI2_CTX_DAT_OFST_MASK				(0xfff << 5)
>  
> -#define CSI2_CTX_PING_ADDR(i)				(0x7c + (0x20 * i))
> +#define CSI2_CTX_PING_ADDR(i)				(0x7c + (0x20 * (i)))
>  #define CSI2_CTX_PING_ADDR_MASK				0xffffffe0
>  
> -#define CSI2_CTX_PONG_ADDR(i)				(0x80 + (0x20 * i))
> +#define CSI2_CTX_PONG_ADDR(i)				(0x80 + (0x20 * (i)))
>  #define CSI2_CTX_PONG_ADDR_MASK				CSI2_CTX_PING_ADDR_MASK
>  
> -#define CSI2_CTX_IRQENABLE(i)				(0x84 + (0x20 * i))
> -#define CSI2_CTX_IRQSTATUS(i)				(0x88 + (0x20 * i))
> +#define CSI2_CTX_IRQENABLE(i)				(0x84 + (0x20 * (i)))
> +#define CSI2_CTX_IRQSTATUS(i)				(0x88 + (0x20 * (i)))
>  
> -#define CSI2_CTX_CTRL3(i)				(0x8c + (0x20 * i))
> +#define CSI2_CTX_CTRL3(i)				(0x8c + (0x20 * (i)))
>  #define CSI2_CTX_CTRL3_ALPHA_SHIFT			5
>  #define CSI2_CTX_CTRL3_ALPHA_MASK			\
>  		(0x3fff << CSI2_CTX_CTRL3_ALPHA_SHIFT)

-- 
Regards,

Laurent Pinchart
