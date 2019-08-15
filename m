Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B29DA8ED7D
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 15:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732648AbfHON4t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 09:56:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46176 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732589AbfHON4s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 09:56:48 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92D862AF;
        Thu, 15 Aug 2019 15:56:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565877406;
        bh=+znBB1qxlpkl1VQ3xwg9po9anFFiiOOPe/FD9geVKKY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L2Def8pd2B7+o7xJuCGOdegyMwnBrfp4zslYsGWuPvZyEykkt1EtWe0HMw4mcvmr5
         uQtmj56sGIVUJjm/jUWSkijYOFuT+J56bkA1uNWCxWD+6BIaoSVu+WVXOFtnQMajsf
         34jNMFPWS2jHgykQ7h4O1gUcah/ltNPuxGDlChX8=
Date:   Thu, 15 Aug 2019 16:56:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        jacob2.chen@rock-chips.com, jeffy.chen@rock-chips.com,
        zyc@rock-chips.com, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, hans.verkuil@cisco.com,
        sakari.ailus@linux.intel.com, kernel@collabora.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com
Subject: Re: [PATCH v8 14/14] MAINTAINERS: add entry for Rockchip ISP1 driver
Message-ID: <20190815135643.GV5011@pendragon.ideasonboard.com>
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <20190730184256.30338-15-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190730184256.30338-15-helen.koike@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thank you for the patch.

On Tue, Jul 30, 2019 at 03:42:56PM -0300, Helen Koike wrote:
> Add MAINTAINERS entry for the rockchip isp1 driver.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> 
> Changes in v8: None
> Changes in v7: None
> 
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6426db5198f0..7f38abcb4114 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13743,6 +13743,14 @@ F:	drivers/hid/hid-roccat*
>  F:	include/linux/hid-roccat*
>  F:	Documentation/ABI/*/sysfs-driver-hid-roccat*
>  
> +ROCKCHIP ISP V1 DRIVER
> +M:	Helen Koike <helen.koike@collabora.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	drivers/media/platform/rockchip/isp1/
> +F:	Documentation/devicetree/bindings/media/rockchip-isp1.txt
> +F:	Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt

This is missing the include/ files and the custom format documentation.
Apart from that, I'm happy to see that you will maintain this driver :-)

> +
>  ROCKCHIP RASTER 2D GRAPHIC ACCELERATION UNIT DRIVER
>  M:	Jacob chen <jacob2.chen@rock-chips.com>
>  L:	linux-media@vger.kernel.org

-- 
Regards,

Laurent Pinchart
