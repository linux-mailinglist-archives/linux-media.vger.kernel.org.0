Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F80E257795
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 12:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgHaKrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 06:47:12 -0400
Received: from mga05.intel.com ([192.55.52.43]:13528 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725964AbgHaKrL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 06:47:11 -0400
IronPort-SDR: W3PC5hGe5avBR6wK26Ljwg9a2bIwIfJ+/qCgBHrNtw4xOhESFsPD6OYDenct+/opwro5N8TZrY
 6psl6sUJtivw==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="241757644"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; 
   d="scan'208";a="241757644"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 03:47:10 -0700
IronPort-SDR: omwp4a9fl6Y7IKJt472Dl9ir83vgev5zrmdnxU+tY8B4HZIMUCFvIJ1YcKC8eExQziDf8737n9
 02e522+uo+aA==
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; 
   d="scan'208";a="314309762"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 03:47:06 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id CCFC8204F9; Mon, 31 Aug 2020 13:47:03 +0300 (EEST)
Date:   Mon, 31 Aug 2020 13:47:03 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     =?iso-8859-1?Q?K=E9vin_L'h=F4pital?= <kevin.lhopital@bootlin.com>
Cc:     linux-media@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, mripard@kernel.org, wens@csie.org,
        yong.deng@magewell.com, mchehab+samsung@kernel.org,
        p.zabel@pengutronix.de, hans.verkuil@cisco.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v2 1/4] media: sun6i-csi: Fix the bpp for 10-bit bayer
 formats
Message-ID: <20200831104703.GI31019@paasikivi.fi.intel.com>
References: <20200828131737.12483-1-kevin.lhopital@bootlin.com>
 <20200828131737.12483-2-kevin.lhopital@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200828131737.12483-2-kevin.lhopital@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kévin,

Thanks for the patch.

On Fri, Aug 28, 2020 at 03:17:33PM +0200, Kévin L'hôpital wrote:
> 10-bit bayer formats are aligned to 16 bits in memory, so this is what
> needs to be used as bpp for calculating the size of the buffers to
> allocate.
> This function is only used to generate the number of bytes per line.
> 
> Fixes: 5cc7522d8965 ("media: sun6i: Add support for Allwinner CSI V3s")
> Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
> ---
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> index c626821aaedb..8b83d15de0d0 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> @@ -100,7 +100,7 @@ static inline int sun6i_csi_get_bpp(unsigned int pixformat)
>  	case V4L2_PIX_FMT_SGBRG10:
>  	case V4L2_PIX_FMT_SGRBG10:
>  	case V4L2_PIX_FMT_SRGGB10:
> -		return 10;
> +		return 16;

Does the same also apply to the 12-bit formats below?

>  	case V4L2_PIX_FMT_SBGGR12:
>  	case V4L2_PIX_FMT_SGBRG12:
>  	case V4L2_PIX_FMT_SGRBG12:

-- 
Sakari Ailus
