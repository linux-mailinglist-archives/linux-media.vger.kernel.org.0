Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A505344E8A
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 19:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbhCVS1u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 14:27:50 -0400
Received: from mga03.intel.com ([134.134.136.65]:52474 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229994AbhCVS1t (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 14:27:49 -0400
IronPort-SDR: hFX/6NZSpEGF1d3aWGnUjIUTxTzrKNWqz24L8lxEE/9dep789wjLPk704i+pbfr0iiOub1FFWB
 EvOCZMpEezbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="190352718"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; 
   d="scan'208";a="190352718"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2021 11:27:48 -0700
IronPort-SDR: PHO82oQlp6/w5aKkH14N0P+ioivw2g1izuSpaO8+P3NSw1prwKND+5GN1yW+ZmqRBNICVu6rld
 TLa6r6HI5jtQ==
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; 
   d="scan'208";a="592709956"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2021 11:27:46 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 1FA6F203ED;
        Mon, 22 Mar 2021 20:27:44 +0200 (EET)
Date:   Mon, 22 Mar 2021 20:27:44 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com, gjorgjix.rosikopulos@linux.intel.com
Subject: Re: [PATCH 05/10] media: v4l: Add Keem Bay Camera meta buffer formats
Message-ID: <20210322182743.GR3@paasikivi.fi.intel.com>
References: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
 <20210319180632.585-6-martinax.krasteva@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319180632.585-6-martinax.krasteva@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martian and Gjorgji,

On Fri, Mar 19, 2021 at 06:06:27PM +0000, Martina Krasteva wrote:
> From: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
> 
> Add Keem Bay Camera specific meta formats for processing
> parameters and statistics:
> 
>     V4L2_META_FMT_KMB_PARAMS
>     V4L2_META_FMT_KMB_STATS
> 
> Signed-off-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
> Co-developed-by: Ivan Dimitrov <ivanx.dimitrov@intel.com>
> Signed-off-by: Ivan Dimitrov <ivanx.dimitrov@intel.com>
> Co-developed-by: Martina Krasteva <martinax.krasteva@intel.com>
> Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
> Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> ---
>  .../userspace-api/media/v4l/meta-formats.rst       |  1 +
>  .../media/v4l/pixfmt-meta-intel-kmb.rst            | 98 ++++++++++++++++++++++
>  MAINTAINERS                                        |  2 +
>  include/uapi/linux/videodev2.h                     |  4 +
>  4 files changed, 105 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-meta-intel-kmb.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index fff25357fe86..cb85161dc1ae 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -14,6 +14,7 @@ These formats are used for the :ref:`metadata` interface only.
>  
>      pixfmt-meta-d4xx
>      pixfmt-meta-intel-ipu3
> +    pixfmt-meta-intel-kmb
>      pixfmt-meta-rkisp1
>      pixfmt-meta-uvc
>      pixfmt-meta-vsp1-hgo
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-kmb.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-kmb.rst
> new file mode 100644
> index 000000000000..99615bbed106
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-kmb.rst
> @@ -0,0 +1,98 @@
> +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> +
> +.. _v4l2-meta-fmt-params:
> +.. _v4l2-meta-fmt-stats:
> +
> +*******************************************************************
> +V4L2_META_FMT_KMB_PARAMS ('kmbp'), V4L2_META_FMT_KMB_STATS ('kmbs')
> +*******************************************************************
> +
> +.. kmb_isp_stats
> +
> +ISP statistics
> +==============
> +
> +The Keembay ISP statistics blocks collect different statistics over
> +an input Bayer frame in non-HDR mode, or up to three input Bayer frames
> +in HDR mode. Those statistics are obtained from the "keembay-metadata-stats"
> +metadata capture video node, using the :c:type:`v4l2_meta_format` interface.
> +They are formatted as described by the :c:type:`kmb_isp_stats` structure.
> +
> +The statistics collected are AE/AWB (Auto-exposure/Auto-white balance),
> +AF (Auto-focus) filter response, luma histogram, rgb histograms and dehaze statistics.
> +Dehaze statistic are collected after HDR fusion in HDR mode.
> +
> +The struct :c:type:`kmb_isp_params` contain all configurable parameters for the

The syntax has changed recently regarding references to structs, which now
are simply "struct nameofthestruct".

> +statistics:
> +
> +- The struct :c:type:`kmb_raw_params` contain enable flags for all
> +  statistics except dehaze (always enabled) and configuration for flicker rows
> +  statistics.
> +- The struct :c:type:`kmb_ae_awb_params` contain configuration parameters for AE/AWB
> +  statistics.
> +- The struct :c:type:`kmb_af_params` contain configuration for AF (Auto-focus) filter
> +  response statistics.
> +- The struct :c:type:`kmb_hist_params` contain configuration for luma and rgb histograms.
> +- The struct :c:type:`kmb_hist_params` contain configuration for luma and rgb histograms.
> +- The struct :c:type:`kmb_dehaze_params` contain configuration for dehaze statistics.

Please wrap before 80 characters per line unless there's a reason to do
otherwise.

> +
> +.. code-block:: c
> +
> +	struct kmb_isp_stats {
> +		struct {
> +			__u8 ae_awb_stats[KMB_CAM_AE_AWB_STATS_SIZE];
> +			__u8 af_stats[KMB_CAM_AF_STATS_SIZE];
> +			__u8 hist_luma[KMB_CAM_HIST_LUMA_SIZE];
> +			__u8 hist_rgb[KMB_CAM_HIST_RGB_SIZE];
> +			__u8 flicker_rows[KMB_CAM_FLICKER_ROWS_SIZE];
> +		} exposure[KMB_CAM_MAX_EXPOSURES];
> +		__u8 dehaze[MAX_DHZ_AIRLIGHT_STATS_SIZE];
> +		struct kmb_isp_stats_flags update;
> +	};
> +
> +.. kmb_isp_stats
> +
> +ISP parameters
> +==============
> +
> +The ISP parameters are passed to the "keembay-metadata-params" metadata
> +output video node, using the :c:type:`v4l2_meta_format` interface. They are
> +formatted as described by the :c:type:`kmb_isp_params` structure.
> +
> +Both ISP statistics and ISP parameters described here are closely tied to
> +the underlying camera sub-system (VPU Camera) APIs. They are usually consumed
> +and produced by dedicated user space libraries that comprise the important
> +tuning tools, thus freeing the developers from being bothered with the low
> +level hardware and algorithm details.
> +
> +.. code-block:: c
> +
> +	struct kmb_isp_params {
> +		struct kmb_isp_params_flags update;
> +		struct kmb_blc_params blc[KMB_CAM_MAX_EXPOSURES];
> +		struct kmb_sigma_dns_params sigma_dns[KMB_CAM_MAX_EXPOSURES];
> +		struct kmb_lsc_params lsc;
> +		struct kmb_raw_params raw;
> +		struct kmb_ae_awb_params ae_awb;
> +		struct kmb_af_params af;
> +		struct kmb_hist_params histogram;
> +		struct kmb_lca_params lca;
> +		struct kmb_debayer_params debayer;
> +		struct kmb_dog_dns_params dog_dns;
> +		struct kmb_luma_dns_params luma_dns;
> +		struct kmb_sharpen_params sharpen;
> +		struct kmb_chroma_gen_params chroma_gen;
> +		struct kmb_median_params median;
> +		struct kmb_chroma_dns_params chroma_dns;
> +		struct kmb_color_comb_params color_comb;
> +		struct kmb_hdr_params hdr;
> +		struct kmb_lut_params lut;
> +		struct kmb_tnf_params tnf;
> +		struct kmb_dehaze_params dehaze;
> +		struct kmb_warp_params warp;
> +	};

As this is already part of the UAPI header you don't need to repeat it
here.

> +
> +Keembay ISP uAPI data types
> +===============================
> +
> +.. kernel-doc:: include/uapi/linux/keembay-isp-ctl.h
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 955f9f6a195d..d90eaf453012 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1972,6 +1972,8 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/intel,keembay-camera.yaml
> +F:	Documentation/media/uapi/v4l/meta-formats.rst
> +F:	Documentation/media/uapi/v4l/pixfmt-meta-intel-kmb.rst

The files are under Documentation/userspace-api/media/v4l/ .

>  F:	drivers/media/platform/keembay-camera/
>  F:	include/uapi/linux/keembay-isp-ctl.h
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 79dbde3bcf8d..0d32269638f6 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -769,6 +769,10 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
>  #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
>  
> +/* Vendor specific - used for Keem Bay camera sub-system */
> +#define V4L2_META_FMT_KMB_PARAMS v4l2_fourcc('K', 'M', 'B', 'P') /* Keem Bay parameters */
> +#define V4L2_META_FMT_KMB_STATS  v4l2_fourcc('K', 'M', 'B', 'S') /* Keem Bay statistics */
> +
>  /* priv field value to indicates that subsequent fields are valid. */
>  #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
>  

-- 
Kind regards,

Sakari Ailus
