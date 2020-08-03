Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41C0D23A066
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 09:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgHCHep (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 03:34:45 -0400
Received: from mga07.intel.com ([134.134.136.100]:29521 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbgHCHeo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Aug 2020 03:34:44 -0400
IronPort-SDR: bZ1ZA1pfppM8dHrWb9ovMD2xoOumu3Tj+Ur+Cb31Uhp6xOtmVlxlsVP2jnB7O+fACw3UJES02g
 eecDxlz4XR3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="216483513"
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; 
   d="scan'208";a="216483513"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2020 00:34:42 -0700
IronPort-SDR: DK1ZB4ZUGE91T42iV8DRclymgMvIWPA/+r8S9cI8XcHoQirRhs3AVmThuZxkVnoeHegws0oLMg
 2Hn0uVwg0HDg==
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; 
   d="scan'208";a="395971159"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2020 00:34:39 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8EB8B20760; Mon,  3 Aug 2020 10:34:37 +0300 (EEST)
Date:   Mon, 3 Aug 2020 10:34:37 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        mchehab@kernel.org, tfiga@chromium.org
Subject: Re: [PATCH 1/2] media: pixfmt-meta-rkisp1.rst: add description of
 rkisp1 metadata formats in pixfmt-meta-rkisp1.rst
Message-ID: <20200803073437.GU13316@paasikivi.fi.intel.com>
References: <20200731121243.25882-1-dafna.hirschfeld@collabora.com>
 <20200731121243.25882-2-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200731121243.25882-2-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thanks for the patchset.

On Fri, Jul 31, 2020 at 02:12:42PM +0200, Dafna Hirschfeld wrote:
> The metadata formats V4L2_META_FMT_IPU3_PARAMS, V4L2_META_FMT_IPU3_3A
> are currently described in two files under
> drivers/staging/media/rkisp1/Documentation/media/uapi/v4l
> 
> This patch moves the description to one file:
> Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
> The patch also extends the description and adds the rst file to
> toctree.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  .../userspace-api/media/v4l/meta-formats.rst  |  1 +
>  .../media/v4l/pixfmt-meta-rkisp1.rst          | 49 +++++++++++++++++++
>  .../uapi/v4l/pixfmt-meta-rkisp1-params.rst    | 23 ---------
>  .../uapi/v4l/pixfmt-meta-rkisp1-stat.rst      | 22 ---------
>  4 files changed, 50 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
>  delete mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
>  delete mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index 7dcc4bacbb0c..55a635534bc9 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -21,6 +21,7 @@ These formats are used for the :ref:`metadata` interface only.
>  
>      pixfmt-meta-d4xx
>      pixfmt-meta-intel-ipu3
> +    pixfmt-meta-rkisp1
>      pixfmt-meta-uvc
>      pixfmt-meta-vsp1-hgo
>      pixfmt-meta-vsp1-hgt
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
> new file mode 100644
> index 000000000000..c8effdfd27bf
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-rkisp1.rst
> @@ -0,0 +1,49 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _v4l2-meta-fmt-params-rkisp1:
> +.. _v4l2-meta-fmt-stat-rkisp1:
> +
> +*****************************************************************************
> +V4L2_META_FMT_RK_ISP1_PARAMS ('rk1p'), V4L2_META_FMT_RK_ISP1_STAT_3A ('rk1s')
> +*****************************************************************************
> +
> +.. rkisp1_stat_buffer
> +
> +3A and histogram statistics
> +===========================
> +
> +The ISP1 device collects different statistics over an input Bayer frame.
> +Those statistics are obtained from the :ref:`rkisp1_stats <rkisp1_stats>` metadata capture video node,
> +using the :c:type:`v4l2_meta_format` interface. The buffer contains a single instance of

Please wrap lines at most at 80 characters if possible.

> +the C structure :c:type:`rkisp1_stat_buffer` defined in ``rkisp1-config.h``.
> +So the structure can be obtained from the buffer by:
> +
> +.. code-block:: c
> +
> +	struct rkisp1_stat_buffer *stats = (struct rkisp1_stat_buffer*) buffer;
> +
> +The statistics collected are Exposure, AWB (Auto-white balance), Histogram and
> +AF (Auto-focus). See :c:type:`rkisp1_stat_buffer` for details of the statistics.
> +
> +.. ipu3_uapi_params
> +
> +Configuration parameters
> +========================

I'd move configuration parameters before statistics --- they're first in
the section name and are also used to calculate the statistics.

> +
> +The configuration parameters are passed to the :ref:`rkisp1_params <rkisp1_params>` metadata
> +output video node, using the :c:type:`v4l2_meta_format` interface. The buffer contains
> +a single instance of the C structure :c:type:`rkisp1_params_cfg` defined in
> +``rkisp1-config.h``. So the structure can be obtained from the buffer by:
> +
> +.. code-block:: c
> +
> +	struct rkisp1_params_cfg *stats = (struct rkisp1_params_cfg*) buffer;
> +
> +The 3A statistics and configuration parameters described here are usually consumed
> +and produced by dedicated user space libraries that comprise the important tuning
> +tools using software control loop.
> +
> +rkisp1 uAPI data types
> +======================
> +
> +.. kernel-doc:: drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> diff --git a/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst b/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
> deleted file mode 100644
> index 32034e481357..000000000000
> --- a/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> -
> -.. _v4l2-meta-fmt-rkisp1-params:
> -
> -============================
> -V4L2_META_FMT_RK_ISP1_PARAMS
> -============================
> -
> -Rockchip ISP1 Parameters Data
> -
> -Description
> -===========
> -
> -This format describes input parameters for the Rockchip ISP1.
> -
> -It uses c-struct :c:type:`rkisp1_params_cfg`, which is defined in
> -the ``linux/rkisp1-config.h`` header file.
> -
> -The parameters consist of multiple modules.
> -The module won't be updated if the corresponding bit was not set in module_*_update.
> -
> -.. kernel-doc:: include/uapi/linux/rkisp1-config.h
> -   :functions: rkisp1_params_cfg
> diff --git a/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst b/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
> deleted file mode 100644
> index 4ad303f96421..000000000000
> --- a/drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> -
> -.. _v4l2-meta-fmt-rkisp1-stat:
> -
> -=============================
> -V4L2_META_FMT_RK_ISP1_STAT_3A
> -=============================
> -
> -
> -Rockchip ISP1 Statistics Data
> -
> -Description
> -===========
> -
> -This format describes image color statistics information generated by the Rockchip
> -ISP1.
> -
> -It uses c-struct :c:type:`rkisp1_stat_buffer`, which is defined in
> -the ``linux/rkisp1-config.h`` header file.
> -
> -.. kernel-doc:: include/uapi/linux/rkisp1-config.h
> -   :functions: rkisp1_stat_buffer

-- 
Kind regards,

Sakari Ailus
