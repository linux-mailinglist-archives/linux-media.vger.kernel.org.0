Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6C7D64290
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2019 09:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfGJHXx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jul 2019 03:23:53 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:56595 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbfGJHXw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jul 2019 03:23:52 -0400
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 8E37BC000D;
        Wed, 10 Jul 2019 07:23:49 +0000 (UTC)
Date:   Wed, 10 Jul 2019 09:23:49 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Joe Perches <joe@perches.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/12] staging: media: cedrus: Fix misuse of GENMASK macro
Message-ID: <20190710072349.GA24674@aptenodytes>
References: <cover.1562734889.git.joe@perches.com>
 <cd543a5f26b031a0bbd3baa55e1f15813f59f107.1562734889.git.joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cd543a5f26b031a0bbd3baa55e1f15813f59f107.1562734889.git.joe@perches.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Tue 09 Jul 19, 22:04, Joe Perches wrote:
> Arguments are supposed to be ordered high then low.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Good catch, thanks!

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> index 3e9931416e45..ddd29788d685 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> @@ -110,7 +110,7 @@
>  #define VE_DEC_MPEG_MBADDR			(VE_ENGINE_DEC_MPEG + 0x10)
>  
>  #define VE_DEC_MPEG_MBADDR_X(w)			(((w) << 8) & GENMASK(15, 8))
> -#define VE_DEC_MPEG_MBADDR_Y(h)			(((h) << 0) & GENMASK(0, 7))
> +#define VE_DEC_MPEG_MBADDR_Y(h)			(((h) << 0) & GENMASK(7, 0))
>  
>  #define VE_DEC_MPEG_CTRL			(VE_ENGINE_DEC_MPEG + 0x14)
>  
> -- 
> 2.15.0
> 

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
