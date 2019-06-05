Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A05A13664D
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 23:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbfFEVIP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 17:08:15 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:36131 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfFEVIP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jun 2019 17:08:15 -0400
X-Originating-IP: 93.29.109.196
Received: from collins (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 9B30F40003;
        Wed,  5 Jun 2019 21:08:07 +0000 (UTC)
Message-ID: <5c2217a4e80eaaa6a8eefd8752ce9a86933d0a80.camel@bootlin.com>
Subject: Re: [PATCH 5/7] media: cedrus: Don't set chroma size for scale &
 rotation
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>, maxime.ripard@bootlin.com
Cc:     wens@csie.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Wed, 05 Jun 2019 23:08:07 +0200
In-Reply-To: <20190530211516.1891-6-jernej.skrabec@siol.net>
References: <20190530211516.1891-1-jernej.skrabec@siol.net>
         <20190530211516.1891-6-jernej.skrabec@siol.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Le jeudi 30 mai 2019 à 23:15 +0200, Jernej Skrabec a écrit :
> Scale and rotation are currently not implemented, so it makes no sense to
> set chroma size for it.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cheers,

Paul

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> index 9c5819def186..9de20ae47916 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -79,9 +79,6 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
>  		reg = VE_PRIMARY_OUT_FMT_NV12;
>  		cedrus_write(dev, VE_PRIMARY_OUT_FMT, reg);
>  
> -		reg = VE_CHROMA_BUF_LEN_SDRT(chroma_size / 2);
> -		cedrus_write(dev, VE_CHROMA_BUF_LEN, reg);
> -
>  		reg = chroma_size / 2;
>  		cedrus_write(dev, VE_PRIMARY_CHROMA_BUF_LEN, reg);
>  

