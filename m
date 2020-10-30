Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3FE2A1122
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 23:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbgJ3Wpt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 18:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgJ3Wpt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 18:45:49 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC4AC0613D5;
        Fri, 30 Oct 2020 15:45:49 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id B9E141F4624F
Subject: Re: [PATCH 04/14] media: sun6i-csi: Fix the image storage bpp for
 10/12-bit Bayer formats
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com,
        =?UTF-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-5-paul.kocialkowski@bootlin.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <60fc4f85-e08f-fec6-5687-005add5cbeed@collabora.com>
Date:   Fri, 30 Oct 2020 19:45:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201023174546.504028-5-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On 10/23/20 2:45 PM, Paul Kocialkowski wrote:
> Both 10 and 12-bit Bayer formats are stored aligned as 16-bit values
> in memory, not unaligned 10 or 12 bits.
> 
> Since the current code for retreiving the bpp is used only to
> calculate the memory storage size of the picture (which is what
> pixel formats describe, unlike media bus formats), fix it there.
> 
> Fixes: 5cc7522d8965 ("media: sun6i: Add support for Allwinner CSI V3s")
> Co-developed-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
> Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../platform/sunxi/sun6i-csi/sun6i_csi.h      | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> index c626821aaedb..7f2be70ae641 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> @@ -86,7 +86,7 @@ void sun6i_csi_update_buf_addr(struct sun6i_csi *csi, dma_addr_t addr);
>   */
>  void sun6i_csi_set_stream(struct sun6i_csi *csi, bool enable);
>  
> -/* get bpp form v4l2 pixformat */
> +/* get memory storage bpp from v4l2 pixformat */
>  static inline int sun6i_csi_get_bpp(unsigned int pixformat)
>  {
>  	switch (pixformat) {
> @@ -96,15 +96,6 @@ static inline int sun6i_csi_get_bpp(unsigned int pixformat)
>  	case V4L2_PIX_FMT_SRGGB8:
>  	case V4L2_PIX_FMT_JPEG:
>  		return 8;
> -	case V4L2_PIX_FMT_SBGGR10:
> -	case V4L2_PIX_FMT_SGBRG10:
> -	case V4L2_PIX_FMT_SGRBG10:
> -	case V4L2_PIX_FMT_SRGGB10:
> -		return 10;
> -	case V4L2_PIX_FMT_SBGGR12:
> -	case V4L2_PIX_FMT_SGBRG12:
> -	case V4L2_PIX_FMT_SGRBG12:
> -	case V4L2_PIX_FMT_SRGGB12:
>  	case V4L2_PIX_FMT_HM12:
>  	case V4L2_PIX_FMT_NV12:
>  	case V4L2_PIX_FMT_NV21:
> @@ -121,6 +112,15 @@ static inline int sun6i_csi_get_bpp(unsigned int pixformat)
>  	case V4L2_PIX_FMT_RGB565:
>  	case V4L2_PIX_FMT_RGB565X:
>  		return 16;
> +	case V4L2_PIX_FMT_SBGGR10:
> +	case V4L2_PIX_FMT_SGBRG10:
> +	case V4L2_PIX_FMT_SGRBG10:
> +	case V4L2_PIX_FMT_SRGGB10:
> +	case V4L2_PIX_FMT_SBGGR12:
> +	case V4L2_PIX_FMT_SGBRG12:
> +	case V4L2_PIX_FMT_SGRBG12:
> +	case V4L2_PIX_FMT_SRGGB12:
> +		return 16;
>  	case V4L2_PIX_FMT_RGB24:
>  	case V4L2_PIX_FMT_BGR24:
>  		return 24;
> 

Instead of updating this table, how about using v4l2_format_info() instead?

Regards,
Helen
