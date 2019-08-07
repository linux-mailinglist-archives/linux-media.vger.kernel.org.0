Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E78E184C76
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 15:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388013AbfHGNJK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 09:09:10 -0400
Received: from mga12.intel.com ([192.55.52.136]:46241 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387982AbfHGNJK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Aug 2019 09:09:10 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Aug 2019 06:09:09 -0700
X-IronPort-AV: E=Sophos;i="5.64,357,1559545200"; 
   d="scan'208";a="185988522"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Aug 2019 06:09:04 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 9F4DC20355; Wed,  7 Aug 2019 16:09:08 +0300 (EEST)
Date:   Wed, 7 Aug 2019 16:09:08 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        jacob2.chen@rock-chips.com, jeffy.chen@rock-chips.com,
        zyc@rock-chips.com, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, kernel@collabora.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com,
        Jacob Chen <jacob-chen@rock-chips.com>
Subject: Re: [PATCH v8 02/14] media: doc: add document for rkisp1 meta buffer
 format
Message-ID: <20190807130908.GM21370@paasikivi.fi.intel.com>
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <20190730184256.30338-3-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190730184256.30338-3-helen.koike@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

On Tue, Jul 30, 2019 at 03:42:44PM -0300, Helen Koike wrote:
> From: Jacob Chen <jacob2.chen@rock-chips.com>
> 
> This commit add document for rkisp1 meta buffer format
> 
> Signed-off-by: Jacob Chen <jacob-chen@rock-chips.com>
> Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> [update for upstream]
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> 
> Changes in v8:
> - Add SPDX in the header
> - Remove emacs configs
> - Fix doc style
> 
> Changes in v7:
> - s/correspond/corresponding
> - s/use/uses
> - s/docuemnt/document
> 
>  Documentation/media/uapi/v4l/meta-formats.rst |  2 ++
>  .../uapi/v4l/pixfmt-meta-rkisp1-params.rst    | 23 +++++++++++++++++++
>  .../uapi/v4l/pixfmt-meta-rkisp1-stat.rst      | 22 ++++++++++++++++++
>  3 files changed, 47 insertions(+)
>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
>  create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
> 
> diff --git a/Documentation/media/uapi/v4l/meta-formats.rst b/Documentation/media/uapi/v4l/meta-formats.rst
> index b10ca9ee3968..5de621fea3cc 100644
> --- a/Documentation/media/uapi/v4l/meta-formats.rst
> +++ b/Documentation/media/uapi/v4l/meta-formats.rst
> @@ -24,3 +24,5 @@ These formats are used for the :ref:`metadata` interface only.
>      pixfmt-meta-uvc
>      pixfmt-meta-vsp1-hgo
>      pixfmt-meta-vsp1-hgt
> +    pixfmt-meta-rkisp1-params
> +    pixfmt-meta-rkisp1-stat
> diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst b/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
> new file mode 100644
> index 000000000000..103b5cb79b7c
> --- /dev/null
> +++ b/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
> @@ -0,0 +1,23 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +.. _v4l2-meta-fmt-rkisp1-params:
> +
> +============================
> +V4L2_META_FMT_RK_ISP1_PARAMS
> +============================
> +
> +Rockchip ISP1 Parameters Data
> +
> +Description
> +===========
> +
> +This format describes input parameters for the Rockchip ISP1.
> +
> +It uses c-struct :c:type:`rkisp1_isp_params_cfg`, which is defined in
> +the ``linux/rkisp1-config.h`` header file.

Do you have an insight on in which order the device executes the processing
steps for the image data? The pipeline may not be entirely linear either
(statistics, for instance). This should be included in the documentation.

> +
> +The parameters consist of multiple modules.
> +The module won't be updated if the corresponding bit was not set in module_*_update.
> +
> +.. kernel-doc:: include/uapi/linux/rkisp1-config.h
> +   :functions: rkisp1_isp_params_cfg
> diff --git a/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst b/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
> new file mode 100644
> index 000000000000..4ad303f96421
> --- /dev/null
> +++ b/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
> @@ -0,0 +1,22 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +.. _v4l2-meta-fmt-rkisp1-stat:
> +
> +=============================
> +V4L2_META_FMT_RK_ISP1_STAT_3A
> +=============================
> +
> +
> +Rockchip ISP1 Statistics Data
> +
> +Description
> +===========
> +
> +This format describes image color statistics information generated by the Rockchip
> +ISP1.
> +
> +It uses c-struct :c:type:`rkisp1_stat_buffer`, which is defined in
> +the ``linux/rkisp1-config.h`` header file.
> +
> +.. kernel-doc:: include/uapi/linux/rkisp1-config.h
> +   :functions: rkisp1_stat_buffer

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
