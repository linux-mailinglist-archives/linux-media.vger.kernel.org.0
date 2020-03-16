Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09C9C186AE4
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 13:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730958AbgCPMbg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 08:31:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35734 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730878AbgCPMbg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 08:31:36 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 102EDA3B;
        Mon, 16 Mar 2020 13:31:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584361894;
        bh=ZGOS/P+T/4NYZTxGGMk4EYgE7EI0FO7Tc0yhudUhNvk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SZDcvE1EkcyJKGmvE0G3169sIT12WK/OCL8pllRKIJ94RKd16geHkWxUNwzAoPUlI
         a9hLRsWdsQ/A46vlCisstZldc/0TgrnbGOHzV/m5rxgOfeJ9DLF/PgY9BvLPwBez3v
         5fpCnHRGGLFsWd2Ajp33R4gAnrjtd+exua5GQm+I=
Date:   Mon, 16 Mar 2020 14:31:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 07/16] media: ti-vpe: cal: remove unused defines
Message-ID: <20200316123129.GZ4732@pendragon.ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-7-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200313114121.32182-7-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Fri, Mar 13, 2020 at 01:41:12PM +0200, Tomi Valkeinen wrote:
> Remove a bunch of IRQ defines that are never used.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal_regs.h | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal_regs.h b/drivers/media/platform/ti-vpe/cal_regs.h
> index 532d4a95740a..b27c0445b8d5 100644
> --- a/drivers/media/platform/ti-vpe/cal_regs.h
> +++ b/drivers/media/platform/ti-vpe/cal_regs.h
> @@ -142,12 +142,6 @@
>  #define CAL_HL_IRQ_EOI_LINE_NUMBER_EOI0			0
>  
>  #define CAL_HL_IRQ_MASK(m)			BIT((m) - 1)
> -#define CAL_HL_IRQ_NOACTION				0x0
> -#define CAL_HL_IRQ_ENABLE				0x1
> -#define CAL_HL_IRQ_CLEAR				0x1
> -#define CAL_HL_IRQ_DISABLED				0x0
> -#define CAL_HL_IRQ_ENABLED				0x1
> -#define CAL_HL_IRQ_PENDING				0x1
>  
>  #define CAL_HL_IRQ_CIO_MASK(i)			BIT(16 + (i-1) * 8)
>  #define CAL_HL_IRQ_VC_MASK(i)			BIT(17 + (i-1) * 8)

-- 
Regards,

Laurent Pinchart
