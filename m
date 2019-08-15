Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 741078ECDA
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 15:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732032AbfHONa6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 09:30:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45926 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730304AbfHONa5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 09:30:57 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 098F92AF;
        Thu, 15 Aug 2019 15:30:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565875855;
        bh=oEGS/F9TsobJYhQR4dkRtTsgMLOO7VkPub64ct7EeRk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RUm+7Lhtsj+xA8IzGITIPGzI7HFNL822Vn8HFMW7I2T1V6Qc5Xl6v/zy3GzftG+Br
         qCjEYmiCfeUK6WEKpaQNtx+52/EUAoSPHngiKB7afFhHF/bwhW5qTZvxdvbIM+UBRA
         IJx81qsyDluQ1Resw+3axW8H7RNs6bTQ/BpYGfsc=
Date:   Thu, 15 Aug 2019 16:30:51 +0300
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
Subject: Re: [PATCH v8 01/14] media: videodev2.h, v4l2-ioctl: add rkisp1 meta
 buffer format
Message-ID: <20190815133051.GT5011@pendragon.ideasonboard.com>
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <20190730184256.30338-2-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190730184256.30338-2-helen.koike@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thank you for the patch.

On Tue, Jul 30, 2019 at 03:42:43PM -0300, Helen Koike wrote:
> From: Shunqian Zheng <zhengsq@rock-chips.com>
> 
> Add the Rockchip ISP1 specific processing parameter format
> V4L2_META_FMT_RK_ISP1_PARAMS and metadata format
> V4L2_META_FMT_RK_ISP1_STAT_3A for 3A.

I don't like V4L2_META_FMT_RK_ISP1_PARAMS much, as the parameters are
not passed to the hardware through a buffer, but instead written to
registers by the kernel driver. This is an area where V4L2 controls are
traditionally used. I do however understand that it's easier for driver
authors to pass a large set of controls this way when they have to be
applied atomically, but it's clearly a hack in my opinion. I won't
oppose to it though, as I know there's no way we can support this kind
of feature in V4L2 at the moment without an extensive amount of work, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
> Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
> Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> [update for upstream]
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> 
> Changes in v8: None
> Changes in v7:
> - s/IPU3/RK_ISP1
> 
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>  include/uapi/linux/videodev2.h       | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index bb5b4926538a..2df20801a299 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1330,6 +1330,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
>  	case V4L2_META_FMT_UVC:		descr = "UVC Payload Header Metadata"; break;
>  	case V4L2_META_FMT_D4XX:	descr = "Intel D4xx UVC Metadata"; break;
> +	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A params"; break;
> +	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A statistics"; break;
>  
>  	default:
>  		/* Compressed formats */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 2427bc4d8eba..ae1e375a10d7 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -756,6 +756,10 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
>  
> +/* Vendor specific - used for RK_ISP1 camera sub-system */
> +#define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 params */
> +#define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A statistics */
> +
>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
>  

-- 
Regards,

Laurent Pinchart
