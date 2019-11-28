Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3893710C240
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2019 03:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727649AbfK1C00 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Nov 2019 21:26:26 -0500
Received: from out28-52.mail.aliyun.com ([115.124.28.52]:50838 "EHLO
        out28-52.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727432AbfK1C00 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Nov 2019 21:26:26 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1442634|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0651011-0.0193909-0.915508;DS=CONTINUE|ham_regular_dialog|0.216232-0.0239754-0.759793;FP=0|0|0|0|0|-1|-1|-1;HT=e01l07389;MF=yong.deng@magewell.com;NM=1;PH=DS;RN=8;RT=8;SR=0;TI=SMTPD_---.G6MWC7G_1574907969;
Received: from John(mailfrom:yong.deng@magewell.com fp:SMTPD_---.G6MWC7G_1574907969)
          by smtp.aliyun-inc.com(10.147.42.198);
          Thu, 28 Nov 2019 10:26:09 +0800
Date:   Thu, 28 Nov 2019 10:26:08 +0800
From:   Yong <yong.deng@magewell.com>
To:     megous@megous.com
Cc:     linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-media@vger.kernel.org (open list:CSI DRIVERS FOR ALLWINNER V3s),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner
        sunXi SoC support), linux-kernel@vger.kernel.org (open list)
Subject: Re: [linux-sunxi] [PATCH] media: sun6i-csi: Fix incorrect
 HSYNC/VSYNC/PCLK polarity configuration
Message-Id: <20191128102608.035cbb996c8681a6fb035336@magewell.com>
In-Reply-To: <20191128020259.1338188-1-megous@megous.com>
References: <20191128020259.1338188-1-megous@megous.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.30; i686-pc-mingw32)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ondrej,

This has been discussed.
And Maxime sent a patch for this: 
https://www.mail-archive.com/linux-media@vger.kernel.org/msg127149.html

On Thu, 28 Nov 2019 03:02:59 +0100
Ondrej Jirman <megous@megous.com> wrote:

> This was discovered by writing a new camera driver and wondering, why
> hsync/vsync polarity setting behaves in reverse to what would be
> expected. Verified by looking at the actual signals and the SoC
> user manual.
> 
> Fixes: 5cc7522d8965 ("media: sun6i: Add support for Allwinner CSI V3s")
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> index f17e5550602d..98bbcca59a90 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -417,12 +417,12 @@ static void sun6i_csi_setup_bus(struct sun6i_csi_dev *sdev)
>  		if (flags & V4L2_MBUS_FIELD_EVEN_LOW)
>  			cfg |= CSI_IF_CFG_FIELD_POSITIVE;
>  
> -		if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> +		if (flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
>  			cfg |= CSI_IF_CFG_VREF_POL_POSITIVE;
> -		if (flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
> +		if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
>  			cfg |= CSI_IF_CFG_HREF_POL_POSITIVE;
>  
> -		if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> +		if (flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
>  			cfg |= CSI_IF_CFG_CLK_POL_FALLING_EDGE;
>  		break;
>  	case V4L2_MBUS_BT656:
> -- 
> 2.24.0
> 
> -- 
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20191128020259.1338188-1-megous%40megous.com.


Thanks,
Yong
