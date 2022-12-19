Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF72365149C
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 22:07:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbiLSVHG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 16:07:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232328AbiLSVHA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 16:07:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 108B3658E;
        Mon, 19 Dec 2022 13:06:56 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 307A9825;
        Mon, 19 Dec 2022 22:06:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671484014;
        bh=GgWU9DQtGFgDZKlTPlKPTzTL2szkwcJhLVoJmO5jeqo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FMogWR8bIOFTEYpaqVq/6QdbcxCIhQJM+iocHwhEKjzT+mPDO4L2dXjaSQ1CcT9yu
         VGP8qxCL3cVZ0lPbOGJVZEMA8ZQ+fyLnpdlQEwQJH89pm3t3KU/0yZTHNO8bC8tXTt
         ckGWbzZeqklG8BPApN+IX5wujnFAD9PG16OwXAUQ=
Date:   Mon, 19 Dec 2022 23:06:50 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 4/7] media: renesas: vsp1: Add V4H SoC version
Message-ID: <Y6DSasWWdmx73hgf@pendragon.ideasonboard.com>
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221219140139.294245-5-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221219140139.294245-5-tomi.valkeinen+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Dec 19, 2022 at 04:01:36PM +0200, Tomi Valkeinen wrote:
> Add VI6_IP_VERSION_SOC_V4H so that we can identify V4H SoC.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_regs.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> index 8c9333f76858..c61e8dafeecf 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> @@ -782,6 +782,7 @@
>  #define VI6_IP_VERSION_SOC_M3N		(0x04 << 0)
>  #define VI6_IP_VERSION_SOC_E3		(0x04 << 0)
>  #define VI6_IP_VERSION_SOC_V3U		(0x05 << 0)
> +#define VI6_IP_VERSION_SOC_V4H		(0x06 << 0)
>  /* RZ/G2L SoCs have no version register, So use 0x80 for SoC Identification */
>  #define VI6_IP_VERSION_SOC_RZG2L	(0x80 << 0)
>  

-- 
Regards,

Laurent Pinchart
