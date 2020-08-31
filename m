Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03EA82577A4
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 12:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgHaKs6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 06:48:58 -0400
Received: from mga03.intel.com ([134.134.136.65]:9160 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726797AbgHaKsy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 06:48:54 -0400
IronPort-SDR: mjh+pU5l3w+xP4a0wwPq7B/AVikvNUlqhG2+jRQrWcH3/SdVdkE8IlXTUcommcqFnWzkxwZ/PP
 tc4TMfHf8FAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="156947471"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; 
   d="scan'208";a="156947471"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 03:48:53 -0700
IronPort-SDR: QtbYslM8L6VMNNukXAtrEXwVAn0uOhONeiIlE9BvQ5B9t/RaF/9VInXkE7qJwK2FRDyEZ2mAhe
 /erudIpq4vCw==
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; 
   d="scan'208";a="374774114"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 03:48:49 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id AB5D3204F9; Mon, 31 Aug 2020 13:48:47 +0300 (EEST)
Date:   Mon, 31 Aug 2020 13:48:47 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     =?iso-8859-1?Q?K=E9vin_L'h=F4pital?= <kevin.lhopital@bootlin.com>
Cc:     linux-media@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, mripard@kernel.org, wens@csie.org,
        yong.deng@magewell.com, mchehab+samsung@kernel.org,
        p.zabel@pengutronix.de, hans.verkuil@cisco.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v2 2/4] media: sunxi: sun6i-csi: Move the sun6i_csi_dev
 structure to the common header
Message-ID: <20200831104847.GJ31019@paasikivi.fi.intel.com>
References: <20200828131737.12483-1-kevin.lhopital@bootlin.com>
 <20200828131737.12483-3-kevin.lhopital@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200828131737.12483-3-kevin.lhopital@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kévin,

On Fri, Aug 28, 2020 at 03:17:34PM +0200, Kévin L'hôpital wrote:
> Access to the sun6i_csi_dev structure is needed to add the
> MIPI CSI2 support.
> 
> Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
> ---
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 12 ------------
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h | 12 ++++++++++++
>  2 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> index 055eb0b8e396..680fa31f380a 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -29,18 +29,6 @@
>  
>  #define MODULE_NAME	"sun6i-csi"
>  
> -struct sun6i_csi_dev {
> -	struct sun6i_csi		csi;
> -	struct device			*dev;
> -
> -	struct regmap			*regmap;
> -	struct clk			*clk_mod;
> -	struct clk			*clk_ram;
> -	struct reset_control		*rstc_bus;
> -
> -	int				planar_offset[3];
> -};
> -
>  static inline struct sun6i_csi_dev *sun6i_csi_to_dev(struct sun6i_csi *csi)
>  {
>  	return container_of(csi, struct sun6i_csi_dev, csi);
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> index 8b83d15de0d0..c4a87bdab8c3 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> @@ -48,6 +48,18 @@ struct sun6i_csi {
>  	struct sun6i_video		video;
>  };
>  
> +struct sun6i_csi_dev {
> +	struct sun6i_csi	csi;
> +	struct device		*dev;
> +	struct regmap		*regmap;
> +	struct clk		*clk_mod;
> +	struct clk		*clk_ram;
> +	struct clk		*clk_mipi;
> +	struct clk		*clk_misc;

This patch adds two more clocks, please add them when you need them. I
think you could also squash the patch to another one that requires the
struct in the header.

> +	struct reset_control	*rstc_bus;
> +	int			planar_offset[3];
> +};
> +
>  /**
>   * sun6i_csi_is_format_supported() - check if the format supported by csi
>   * @csi:	pointer to the csi

-- 
Sakari Ailus
