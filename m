Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F11F2FDDDB
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 01:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392995AbhAUA0q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 19:26:46 -0500
Received: from mga03.intel.com ([134.134.136.65]:36322 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388743AbhATVec (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 16:34:32 -0500
IronPort-SDR: KSGpgyxxSoHBwUiWovWedlc6GngpGHqVQoTgc86p0Bd+QJrSUajwOlcEIPftl6pr7F7qaLji4d
 XYSG0rPVQxtA==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="179263499"
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; 
   d="scan'208";a="179263499"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 13:32:13 -0800
IronPort-SDR: ClBbH19ia4QOiuyNHGqhQLNYBFvtit6Tkd2b+GPHK61WwT09kd1YA7lA3Nf7zaIoKQUhjYsz/j
 pQPw0lRJNCKg==
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; 
   d="scan'208";a="427043427"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 13:32:09 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 92D9B206D0; Wed, 20 Jan 2021 23:32:07 +0200 (EET)
Date:   Wed, 20 Jan 2021 23:32:07 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, heiko.stuebner@theobroma-systems.com,
        heiko@sntech.de, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH v7 1/5] media: rkisp1: uapi: change hist_bins array type
 from __u16 to __u32
Message-ID: <20210120213207.GN11878@paasikivi.fi.intel.com>
References: <20210120164446.1220-1-dafna.hirschfeld@collabora.com>
 <20210120164446.1220-2-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120164446.1220-2-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thanks for the update.

On Wed, Jan 20, 2021 at 05:44:42PM +0100, Dafna Hirschfeld wrote:
> Each entry in the array is a 20 bits value composed of 16
> bits unsigned integer and 4 bits fractional part. So the
> type should change to __u32.
> In addition add a documentation of how the measurements
> are done.

The commit message lines wrap at 74, under 60 is not much.

> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Should there be a Fixes: line? The patch is changing UAPI...

The file has been recently introduced. Should it go to fixes or to a stable
kernel, too?

> ---
>  include/uapi/linux/rkisp1-config.h | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 6e449e784260..f75f8d698fb4 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -844,13 +844,17 @@ struct rkisp1_cif_isp_af_stat {
>  /**
>   * struct rkisp1_cif_isp_hist_stat - statistics histogram data
>   *
> - * @hist_bins: measured bin counters
> + * @hist_bins: measured bin counters. Each bin is a 20 bits unsigned fixed point type.
> + *	       Bits 0-4 are the fractional part and bits 5-19 are the integer part.
>   *
> - * Measurement window divided into 25 sub-windows, set
> - * with ISP_HIST_XXX
> + * The window of the measurements area is divided to 5x5 sub-windows. The histogram
> + * is then computed for each sub-window independently and the final result is a weighted
> + * average of the histogram measurements on all sub-windows.
> + * The window of the measurements area and the weight of each sub-window are configurable
> + * using struct @rkisp1_cif_isp_hst_config.

Please wrap the lines before 80.

>   */
>  struct rkisp1_cif_isp_hist_stat {
> -	__u16 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
> +	__u32 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
>  };
>  
>  /**
> -- 
> 2.17.1
> 

-- 
Regards,

Sakari Ailus
