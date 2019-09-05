Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 999BFAA338
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 14:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389257AbfIEMbE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 08:31:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54746 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387432AbfIEMbE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 08:31:04 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C344ECC;
        Thu,  5 Sep 2019 14:31:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567686661;
        bh=xcSubn/iQCGjwJ8OJH7HDlSa5Fjf8PeWVmKESKQ8p40=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lzOsnyIrOPL6NFMqF9UISBuYcxDt79qCl/uAKMc6YZIGIIRtLO4Uhm1U2r/qc4x3n
         WyIvsjFuGJyhKkMwwQv5vKC4/2Hw8GWFs3k7FAiC4eSD3+RDmgIdGnSmYOprlu+fmT
         IClX+wGvXOHjv4bm62vgi5T45SoZHznzXCpO7JeE=
Date:   Thu, 5 Sep 2019 15:30:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
Cc:     hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com,
        tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org,
        yuzhao@chromium.org, zwisler@chromium.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Sean.Cheng@mediatek.com,
        sj.huang@mediatek.com, christie.yu@mediatek.com,
        frederic.chen@mediatek.com, jungo.lin@mediatek.com,
        Rynn.Wu@mediatek.com, po-yang.huang@mediatek.com,
        shik@chromium.org, suleiman@chromium.org,
        linux-media@vger.kernel.org, srv_heupstream@mediatek.com,
        devicetree@vger.kernel.org
Subject: Re: [RFC PATCH V2 3/4] media: platform: Add Mediatek FD driver
 KConfig
Message-ID: <20190905123054.GL5035@pendragon.ideasonboard.com>
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
 <1562661672-22439-4-git-send-email-Jerry-Ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1562661672-22439-4-git-send-email-Jerry-Ch.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jerry,

Thank you for the patch.

On Tue, Jul 09, 2019 at 04:41:11PM +0800, Jerry-ch Chen wrote:
> From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> 
> This patch adds KConfig for Mediatek Face Detection driver (FD).
> FD is embedded in Mediatek SoCs. It can provide hardware
> accelerated face detection function.
> 
> Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>

You can squash this patch with 4/4, there's no need to keep it separate.

> ---
>  drivers/media/platform/Kconfig            |  2 ++
>  drivers/media/platform/mtk-isp/fd/Kconfig | 17 +++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-isp/fd/Kconfig
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index a505e9f..ae99258e 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -32,6 +32,8 @@ source "drivers/media/platform/davinci/Kconfig"
>  
>  source "drivers/media/platform/omap/Kconfig"
>  
> +source "drivers/media/platform/mtk-isp/fd/Kconfig"
> +
>  config VIDEO_ASPEED
>  	tristate "Aspeed AST2400 and AST2500 Video Engine driver"
>  	depends on VIDEO_V4L2
> diff --git a/drivers/media/platform/mtk-isp/fd/Kconfig b/drivers/media/platform/mtk-isp/fd/Kconfig
> new file mode 100644
> index 0000000..0c5eaf0
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/fd/Kconfig
> @@ -0,0 +1,17 @@
> +config VIDEO_MEDIATEK_FD
> +	bool "Mediatek face detection processing function"
> +	select DMA_SHARED_BUFFER
> +	select VIDEOBUF2_DMA_CONTIG
> +	select VIDEOBUF2_CORE
> +	select VIDEOBUF2_V4L2
> +	select VIDEOBUF2_MEMOPS
> +	select VIDEOBUF2_VMALLOC

Do you need both VIDEOBUF2_DMA_CONTIG and VIDEOBUF2_VMALLOC ? The driver
doesn't seem to make use of VIDEOBUF2_VMALLOC.

> +	select MEDIA_CONTROLLER
> +
> +	default n
> +	help
> +		Support the Face Detectioin (FD) feature.

s/Detectioin/Detection/

Maybe "... feature found in the Mediatek <list of SoCs> SoCs." ?

> +
> +		FD driver is a V4L2 memory-to-memory device driver which
> +		provides hardware accelerated face detection function,
> +		it can detect different sizes of faces in a raw image.

-- 
Regards,

Laurent Pinchart
