Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 620D719C36E
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 15:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732625AbgDBN7h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 09:59:37 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43502 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbgDBN7h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 09:59:37 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id BE597280125
Subject: Re: [PATCH 3/3] rkisp1: Fix wrong PHY config dependency
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>
References: <20200401213721.24173-1-ezequiel@collabora.com>
 <20200401213721.24173-4-ezequiel@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <b0c9e734-7302-08e6-7bbf-79699d1d305e@collabora.com>
Date:   Thu, 2 Apr 2020 10:59:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200401213721.24173-4-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/1/20 6:37 PM, Ezequiel Garcia wrote:
> Instead of depending on the Rockchip PHY driver the ISP driver
> should really depend on CONFIG_GENERIC_PHY_MIPI_DPHY,
> given all it needs is the phy_mipi_dphy_get_default_config() symbol.
> 
> Fix it.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/staging/media/rkisp1/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkisp1/Kconfig b/drivers/staging/media/rkisp1/Kconfig
> index b859a493caba..e3ba6826fbb0 100644
> --- a/drivers/staging/media/rkisp1/Kconfig
> +++ b/drivers/staging/media/rkisp1/Kconfig
> @@ -7,7 +7,7 @@ config VIDEO_ROCKCHIP_ISP1
>  	select VIDEOBUF2_DMA_CONTIG
>  	select VIDEOBUF2_VMALLOC
>  	select V4L2_FWNODE
> -	select PHY_ROCKCHIP_DPHY_RX0
> +	select GENERIC_PHY_MIPI_DPHY
>  	default n
>  	help
>  	  Enable this to support the Image Signal Processing (ISP) module
> 
