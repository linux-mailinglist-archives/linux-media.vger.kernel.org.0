Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75CB32A44C5
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 13:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728613AbgKCMFs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 07:05:48 -0500
Received: from mga17.intel.com ([192.55.52.151]:20068 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728422AbgKCMFs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 07:05:48 -0500
IronPort-SDR: LueejPVFwhRYVx7NwmnHU5fFwKj029Zpoq4lYAt8sOJhLxHyCfwjF1rlZIBQyhSuo54GA1Oepu
 uHsDZP5Fig9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="148895072"
X-IronPort-AV: E=Sophos;i="5.77,447,1596524400"; 
   d="scan'208";a="148895072"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 04:05:47 -0800
IronPort-SDR: AelSH6r3w38YI3C+vbOteHKL85all+9f5otrBgvAhqc1Tip4nXMrWE1r6fB4hnE1bA0CmBzFkC
 BH5OasEqim2Q==
X-IronPort-AV: E=Sophos;i="5.77,447,1596524400"; 
   d="scan'208";a="325199149"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 04:05:45 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E8073209D9; Tue,  3 Nov 2020 14:05:42 +0200 (EET)
Date:   Tue, 3 Nov 2020 14:05:42 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH v2 12/19] media: doc: pixfmt-yuv: Move all luma-only YUV
 formats to common file
Message-ID: <20201103120542.GH26150@paasikivi.fi.intel.com>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
 <20201102224102.30292-13-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102224102.30292-13-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Nov 03, 2020 at 12:40:55AM +0200, Laurent Pinchart wrote:
> Luma-only pixel formats are documented in separate files. This
> duplicates information, as those formats share comon traits. Consolidate
> them in a single file and describe them in a single table.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Use SPDX license header
> ---
>  .../userspace-api/media/v4l/pixfmt-grey.rst   |  44 ------
>  .../userspace-api/media/v4l/pixfmt-y10.rst    |  65 ---------
>  .../userspace-api/media/v4l/pixfmt-y10b.rst   |  33 -----
>  .../userspace-api/media/v4l/pixfmt-y10p.rst   |  43 ------
>  .../userspace-api/media/v4l/pixfmt-y12.rst    |  65 ---------
>  .../userspace-api/media/v4l/pixfmt-y14.rst    |  65 ---------
>  .../userspace-api/media/v4l/pixfmt-y16-be.rst |  69 ----------
>  .../userspace-api/media/v4l/pixfmt-y16.rst    |  69 ----------
>  .../media/v4l/pixfmt-yuv-luma.rst             | 126 ++++++++++++++++++
>  .../userspace-api/media/v4l/yuv-formats.rst   |   9 +-
>  10 files changed, 127 insertions(+), 461 deletions(-)
>  delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-grey.rst
>  delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y10.rst
>  delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y10b.rst
>  delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y10p.rst
>  delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y12.rst
>  delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y14.rst
>  delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16-be.rst
>  delete mode 100644 Documentation/userspace-api/media/v4l/pixfmt-y16.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-grey.rst b/Documentation/userspace-api/media/v4l/pixfmt-grey.rst
> deleted file mode 100644
> index 121365b03c57..000000000000
> --- a/Documentation/userspace-api/media/v4l/pixfmt-grey.rst
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> -
> -.. _V4L2-PIX-FMT-GREY:
> -
> -**************************
> -V4L2_PIX_FMT_GREY ('GREY')
> -**************************
> -
> -Grey-scale image
> -
> -
> -Description
> -===========
> -
> -This is a grey-scale image. It is really a degenerate Y'CbCr format
> -which simply contains no Cb or Cr data.
> -
> -**Byte Order.**
> -Each cell is one byte.
> -
> -.. flat-table::
> -    :header-rows:  0
> -    :stub-columns: 0
> -
> -    * - start + 0:
> -      - Y'\ :sub:`00`
> -      - Y'\ :sub:`01`
> -      - Y'\ :sub:`02`
> -      - Y'\ :sub:`03`
> -    * - start + 4:
> -      - Y'\ :sub:`10`
> -      - Y'\ :sub:`11`
> -      - Y'\ :sub:`12`
> -      - Y'\ :sub:`13`
> -    * - start + 8:
> -      - Y'\ :sub:`20`
> -      - Y'\ :sub:`21`
> -      - Y'\ :sub:`22`
> -      - Y'\ :sub:`23`
> -    * - start + 12:
> -      - Y'\ :sub:`30`
> -      - Y'\ :sub:`31`
> -      - Y'\ :sub:`32`
> -      - Y'\ :sub:`33`
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y10.rst b/Documentation/userspace-api/media/v4l/pixfmt-y10.rst
> deleted file mode 100644
> index 05f018dd883f..000000000000
> --- a/Documentation/userspace-api/media/v4l/pixfmt-y10.rst
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> -
> -.. _V4L2-PIX-FMT-Y10:
> -
> -*************************
> -V4L2_PIX_FMT_Y10 ('Y10 ')
> -*************************
> -
> -
> -Grey-scale image
> -
> -
> -Description
> -===========
> -
> -This is a grey-scale image with a depth of 10 bits per pixel. Pixels are
> -stored in 16-bit words with unused high bits padded with 0. The least
> -significant byte is stored at lower memory addresses (little-endian).
> -
> -**Byte Order.**
> -Each cell is one byte.
> -
> -
> -
> -
> -.. flat-table::
> -    :header-rows:  0
> -    :stub-columns: 0
> -
> -    * - start + 0:
> -      - Y'\ :sub:`00low`
> -      - Y'\ :sub:`00high`
> -      - Y'\ :sub:`01low`
> -      - Y'\ :sub:`01high`
> -      - Y'\ :sub:`02low`
> -      - Y'\ :sub:`02high`
> -      - Y'\ :sub:`03low`
> -      - Y'\ :sub:`03high`
> -    * - start + 8:
> -      - Y'\ :sub:`10low`
> -      - Y'\ :sub:`10high`
> -      - Y'\ :sub:`11low`
> -      - Y'\ :sub:`11high`
> -      - Y'\ :sub:`12low`
> -      - Y'\ :sub:`12high`
> -      - Y'\ :sub:`13low`
> -      - Y'\ :sub:`13high`
> -    * - start + 16:
> -      - Y'\ :sub:`20low`
> -      - Y'\ :sub:`20high`
> -      - Y'\ :sub:`21low`
> -      - Y'\ :sub:`21high`
> -      - Y'\ :sub:`22low`
> -      - Y'\ :sub:`22high`
> -      - Y'\ :sub:`23low`
> -      - Y'\ :sub:`23high`
> -    * - start + 24:
> -      - Y'\ :sub:`30low`
> -      - Y'\ :sub:`30high`
> -      - Y'\ :sub:`31low`
> -      - Y'\ :sub:`31high`
> -      - Y'\ :sub:`32low`
> -      - Y'\ :sub:`32high`
> -      - Y'\ :sub:`33low`
> -      - Y'\ :sub:`33high`
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y10b.rst b/Documentation/userspace-api/media/v4l/pixfmt-y10b.rst
> deleted file mode 100644
> index 38d353b37df9..000000000000
> --- a/Documentation/userspace-api/media/v4l/pixfmt-y10b.rst
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> -
> -.. _V4L2-PIX-FMT-Y10BPACK:
> -
> -******************************
> -V4L2_PIX_FMT_Y10BPACK ('Y10B')
> -******************************
> -
> -Grey-scale image as a bit-packed array
> -
> -
> -Description
> -===========
> -
> -This is a packed grey-scale image format with a depth of 10 bits per
> -pixel. Pixels are stored in a bit-packed array of 10bit bits per pixel,
> -with no padding between them and with the most significant bits coming
> -first from the left.
> -
> -**Bit-packed representation.**
> -
> -pixels cross the byte boundary and have a ratio of 5 bytes for each 4
> -pixels.
> -
> -.. flat-table::
> -    :header-rows:  0
> -    :stub-columns: 0
> -
> -    * - Y'\ :sub:`00[9:2]`
> -      - Y'\ :sub:`00[1:0]`\ Y'\ :sub:`01[9:4]`
> -      - Y'\ :sub:`01[3:0]`\ Y'\ :sub:`02[9:6]`
> -      - Y'\ :sub:`02[5:0]`\ Y'\ :sub:`03[9:8]`
> -      - Y'\ :sub:`03[7:0]`
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y10p.rst b/Documentation/userspace-api/media/v4l/pixfmt-y10p.rst
> deleted file mode 100644
> index dd20d3438732..000000000000
> --- a/Documentation/userspace-api/media/v4l/pixfmt-y10p.rst
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> -
> -.. _V4L2-PIX-FMT-Y10P:
> -
> -******************************
> -V4L2_PIX_FMT_Y10P ('Y10P')
> -******************************
> -
> -Grey-scale image as a MIPI RAW10 packed array
> -
> -
> -Description
> -===========
> -
> -This is a packed grey-scale image format with a depth of 10 bits per
> -pixel. Every four consecutive pixels are packed into 5 bytes. Each of
> -the first 4 bytes contain the 8 high order bits of the pixels, and
> -the 5th byte contains the 2 least significants bits of each pixel,
> -in the same order.
> -
> -**Bit-packed representation.**
> -
> -.. raw:: latex
> -
> -    \small
> -
> -.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3.2cm}|
> -
> -.. flat-table::
> -    :header-rows:  0
> -    :stub-columns: 0
> -    :widths: 8 8 8 8 64
> -
> -    * - Y'\ :sub:`00[9:2]`
> -      - Y'\ :sub:`01[9:2]`
> -      - Y'\ :sub:`02[9:2]`
> -      - Y'\ :sub:`03[9:2]`
> -      - Y'\ :sub:`03[1:0]`\ (bits 7--6) Y'\ :sub:`02[1:0]`\ (bits 5--4)
> -	Y'\ :sub:`01[1:0]`\ (bits 3--2) Y'\ :sub:`00[1:0]`\ (bits 1--0)
> -
> -.. raw:: latex
> -
> -    \normalsize
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y12.rst b/Documentation/userspace-api/media/v4l/pixfmt-y12.rst
> deleted file mode 100644
> index 20e12a18da72..000000000000
> --- a/Documentation/userspace-api/media/v4l/pixfmt-y12.rst
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> -
> -.. _V4L2-PIX-FMT-Y12:
> -
> -*************************
> -V4L2_PIX_FMT_Y12 ('Y12 ')
> -*************************
> -
> -
> -Grey-scale image
> -
> -
> -Description
> -===========
> -
> -This is a grey-scale image with a depth of 12 bits per pixel. Pixels are
> -stored in 16-bit words with unused high bits padded with 0. The least
> -significant byte is stored at lower memory addresses (little-endian).
> -
> -**Byte Order.**
> -Each cell is one byte.
> -
> -
> -
> -
> -.. flat-table::
> -    :header-rows:  0
> -    :stub-columns: 0
> -
> -    * - start + 0:
> -      - Y'\ :sub:`00low`
> -      - Y'\ :sub:`00high`
> -      - Y'\ :sub:`01low`
> -      - Y'\ :sub:`01high`
> -      - Y'\ :sub:`02low`
> -      - Y'\ :sub:`02high`
> -      - Y'\ :sub:`03low`
> -      - Y'\ :sub:`03high`
> -    * - start + 8:
> -      - Y'\ :sub:`10low`
> -      - Y'\ :sub:`10high`
> -      - Y'\ :sub:`11low`
> -      - Y'\ :sub:`11high`
> -      - Y'\ :sub:`12low`
> -      - Y'\ :sub:`12high`
> -      - Y'\ :sub:`13low`
> -      - Y'\ :sub:`13high`
> -    * - start + 16:
> -      - Y'\ :sub:`20low`
> -      - Y'\ :sub:`20high`
> -      - Y'\ :sub:`21low`
> -      - Y'\ :sub:`21high`
> -      - Y'\ :sub:`22low`
> -      - Y'\ :sub:`22high`
> -      - Y'\ :sub:`23low`
> -      - Y'\ :sub:`23high`
> -    * - start + 24:
> -      - Y'\ :sub:`30low`
> -      - Y'\ :sub:`30high`
> -      - Y'\ :sub:`31low`
> -      - Y'\ :sub:`31high`
> -      - Y'\ :sub:`32low`
> -      - Y'\ :sub:`32high`
> -      - Y'\ :sub:`33low`
> -      - Y'\ :sub:`33high`
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y14.rst b/Documentation/userspace-api/media/v4l/pixfmt-y14.rst
> deleted file mode 100644
> index 2a4826b77105..000000000000
> --- a/Documentation/userspace-api/media/v4l/pixfmt-y14.rst
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> -
> -.. _V4L2-PIX-FMT-Y14:
> -
> -*************************
> -V4L2_PIX_FMT_Y14 ('Y14 ')
> -*************************
> -
> -
> -Grey-scale image
> -
> -
> -Description
> -===========
> -
> -This is a grey-scale image with a depth of 14 bits per pixel. Pixels are
> -stored in 16-bit words with unused high bits padded with 0. The least
> -significant byte is stored at lower memory addresses (little-endian).
> -
> -**Byte Order.**
> -Each cell is one byte.
> -
> -
> -
> -
> -.. flat-table::
> -    :header-rows:  0
> -    :stub-columns: 0
> -
> -    * - start + 0:
> -      - Y'\ :sub:`00low`
> -      - Y'\ :sub:`00high`
> -      - Y'\ :sub:`01low`
> -      - Y'\ :sub:`01high`
> -      - Y'\ :sub:`02low`
> -      - Y'\ :sub:`02high`
> -      - Y'\ :sub:`03low`
> -      - Y'\ :sub:`03high`
> -    * - start + 8:
> -      - Y'\ :sub:`10low`
> -      - Y'\ :sub:`10high`
> -      - Y'\ :sub:`11low`
> -      - Y'\ :sub:`11high`
> -      - Y'\ :sub:`12low`
> -      - Y'\ :sub:`12high`
> -      - Y'\ :sub:`13low`
> -      - Y'\ :sub:`13high`
> -    * - start + 16:
> -      - Y'\ :sub:`20low`
> -      - Y'\ :sub:`20high`
> -      - Y'\ :sub:`21low`
> -      - Y'\ :sub:`21high`
> -      - Y'\ :sub:`22low`
> -      - Y'\ :sub:`22high`
> -      - Y'\ :sub:`23low`
> -      - Y'\ :sub:`23high`
> -    * - start + 24:
> -      - Y'\ :sub:`30low`
> -      - Y'\ :sub:`30high`
> -      - Y'\ :sub:`31low`
> -      - Y'\ :sub:`31high`
> -      - Y'\ :sub:`32low`
> -      - Y'\ :sub:`32high`
> -      - Y'\ :sub:`33low`
> -      - Y'\ :sub:`33high`
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y16-be.rst b/Documentation/userspace-api/media/v4l/pixfmt-y16-be.rst
> deleted file mode 100644
> index 6d70cd78cbf6..000000000000
> --- a/Documentation/userspace-api/media/v4l/pixfmt-y16-be.rst
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> -
> -.. _V4L2-PIX-FMT-Y16-BE:
> -
> -****************************************
> -V4L2_PIX_FMT_Y16_BE ('Y16 ' | (1 << 31))
> -****************************************
> -
> -
> -Grey-scale image
> -
> -
> -Description
> -===========
> -
> -This is a grey-scale image with a depth of 16 bits per pixel. The most
> -significant byte is stored at lower memory addresses (big-endian).
> -
> -.. note::
> -
> -   The actual sampling precision may be lower than 16 bits, for
> -   example 10 bits per pixel with values in range 0 to 1023.
> -
> -**Byte Order.**
> -Each cell is one byte.
> -
> -
> -
> -
> -.. flat-table::
> -    :header-rows:  0
> -    :stub-columns: 0
> -
> -    * - start + 0:
> -      - Y'\ :sub:`00high`
> -      - Y'\ :sub:`00low`
> -      - Y'\ :sub:`01high`
> -      - Y'\ :sub:`01low`
> -      - Y'\ :sub:`02high`
> -      - Y'\ :sub:`02low`
> -      - Y'\ :sub:`03high`
> -      - Y'\ :sub:`03low`
> -    * - start + 8:
> -      - Y'\ :sub:`10high`
> -      - Y'\ :sub:`10low`
> -      - Y'\ :sub:`11high`
> -      - Y'\ :sub:`11low`
> -      - Y'\ :sub:`12high`
> -      - Y'\ :sub:`12low`
> -      - Y'\ :sub:`13high`
> -      - Y'\ :sub:`13low`
> -    * - start + 16:
> -      - Y'\ :sub:`20high`
> -      - Y'\ :sub:`20low`
> -      - Y'\ :sub:`21high`
> -      - Y'\ :sub:`21low`
> -      - Y'\ :sub:`22high`
> -      - Y'\ :sub:`22low`
> -      - Y'\ :sub:`23high`
> -      - Y'\ :sub:`23low`
> -    * - start + 24:
> -      - Y'\ :sub:`30high`
> -      - Y'\ :sub:`30low`
> -      - Y'\ :sub:`31high`
> -      - Y'\ :sub:`31low`
> -      - Y'\ :sub:`32high`
> -      - Y'\ :sub:`32low`
> -      - Y'\ :sub:`33high`
> -      - Y'\ :sub:`33low`
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-y16.rst b/Documentation/userspace-api/media/v4l/pixfmt-y16.rst
> deleted file mode 100644
> index 398ad8ba5d64..000000000000
> --- a/Documentation/userspace-api/media/v4l/pixfmt-y16.rst
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> -
> -.. _V4L2-PIX-FMT-Y16:
> -
> -*************************
> -V4L2_PIX_FMT_Y16 ('Y16 ')
> -*************************
> -
> -
> -Grey-scale image
> -
> -
> -Description
> -===========
> -
> -This is a grey-scale image with a depth of 16 bits per pixel. The least
> -significant byte is stored at lower memory addresses (little-endian).
> -
> -.. note::
> -
> -   The actual sampling precision may be lower than 16 bits, for
> -   example 10 bits per pixel with values in range 0 to 1023.
> -
> -**Byte Order.**
> -Each cell is one byte.
> -
> -
> -
> -
> -.. flat-table::
> -    :header-rows:  0
> -    :stub-columns: 0
> -
> -    * - start + 0:
> -      - Y'\ :sub:`00low`
> -      - Y'\ :sub:`00high`
> -      - Y'\ :sub:`01low`
> -      - Y'\ :sub:`01high`
> -      - Y'\ :sub:`02low`
> -      - Y'\ :sub:`02high`
> -      - Y'\ :sub:`03low`
> -      - Y'\ :sub:`03high`
> -    * - start + 8:
> -      - Y'\ :sub:`10low`
> -      - Y'\ :sub:`10high`
> -      - Y'\ :sub:`11low`
> -      - Y'\ :sub:`11high`
> -      - Y'\ :sub:`12low`
> -      - Y'\ :sub:`12high`
> -      - Y'\ :sub:`13low`
> -      - Y'\ :sub:`13high`
> -    * - start + 16:
> -      - Y'\ :sub:`20low`
> -      - Y'\ :sub:`20high`
> -      - Y'\ :sub:`21low`
> -      - Y'\ :sub:`21high`
> -      - Y'\ :sub:`22low`
> -      - Y'\ :sub:`22high`
> -      - Y'\ :sub:`23low`
> -      - Y'\ :sub:`23high`
> -    * - start + 24:
> -      - Y'\ :sub:`30low`
> -      - Y'\ :sub:`30high`
> -      - Y'\ :sub:`31low`
> -      - Y'\ :sub:`31high`
> -      - Y'\ :sub:`32low`
> -      - Y'\ :sub:`32high`
> -      - Y'\ :sub:`33low`
> -      - Y'\ :sub:`33high`
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> new file mode 100644
> index 000000000000..ba8cd895cb0b
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> @@ -0,0 +1,126 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _yuv-luma-only:
> +
> +*****************
> +Luma-Only Formats
> +*****************
> +
> +This family of formats only store the luma component of a Y'CbCr image. They
> +are often referred to as greyscale formats.
> +
> +.. note::
> +
> +   - In all the tables that follow, bit 7 is the most significant bit in a byte.
> +   - Formats are described with the minimum number of pixels needed to create a
> +     byte-aligned repeating pattern. `...` indicates repetition of the pattern.
> +   - Y'\ :sub:`x`\ [9:2] denotes bits 9 to 2 of the Y' value for pixel at colum
> +     `x`.
> +   - `0` denotes padding bits set to 0.
> +
> +
> +.. flat-table:: Luma-Only Image Formats
> +    :header-rows: 1
> +    :stub-columns: 0
> +
> +    * - Identifier
> +      - Code
> +      - Byte 0
> +      - Byte 1
> +      - Byte 2
> +      - Byte 3
> +      - Byte 4
> +
> +    * .. _V4L2-PIX-FMT-GREY:
> +
> +      - ``V4L2_PIX_FMT_GREY``
> +      - 'GREY'
> +
> +      - Y'\ :sub:`0`\ [7:0]
> +      - ...
> +      - ...
> +      - ...
> +      - ...
> +
> +    * .. _V4L2-PIX-FMT-Y10:
> +
> +      - ``V4L2_PIX_FMT_Y10``
> +      - 'Y10 '
> +
> +      - Y'\ :sub:`0`\ [7:0]
> +      - `000000` Y'\ :sub:`0`\ [9:8]
> +      - ...
> +      - ...
> +      - ...
> +
> +    * .. _V4L2-PIX-FMT-Y10BPACK:
> +
> +      - ``V4L2_PIX_FMT_Y10BPACK``
> +      - 'Y10B'
> +
> +      - Y'\ :sub:`0`\ [9:2]
> +      - Y'\ :sub:`0`\ [1:0] Y'\ :sub:`1`\ [9:4]
> +      - Y'\ :sub:`1`\ [3:0] Y'\ :sub:`2`\ [9:6]
> +      - Y'\ :sub:`2`\ [5:0] Y'\ :sub:`3`\ [9:8]
> +      - Y'\ :sub:`3`\ [7:0]
> +
> +    * .. _V4L2-PIX-FMT-Y10P:
> +
> +      - ``V4L2_PIX_FMT_Y10P``
> +      - 'Y10P'
> +
> +      - Y'\ :sub:`0`\ [7:0]
> +      - Y'\ :sub:`1`\ [9:8]
> +      - Y'\ :sub:`2`\ [9:2]
> +      - Y'\ :sub:`3`\ [9:2]
> +      - Y'\ :sub:`3`\ [1:0] Y'\ :sub:`2`\ [1:0] Y'\ :sub:`1`\ [1:0] Y'\ :sub:`0`\ [1:0]
> +
> +    * .. _V4L2-PIX-FMT-Y12:
> +
> +      - ``V4L2_PIX_FMT_Y12``
> +      - 'Y12 '
> +
> +      - Y'\ :sub:`0`\ [7:0]
> +      - `0000` Y'\ :sub:`0`\ [11:8]
> +      - ...
> +      - ...
> +      - ...
> +
> +    * .. _V4L2-PIX-FMT-Y14:
> +
> +      - ``V4L2_PIX_FMT_Y14``
> +      - 'Y14 '
> +
> +      - Y'\ :sub:`0`\ [7:0]
> +      - `00` Y'\ :sub:`0`\ [13:8]
> +      - ...
> +      - ...
> +      - ...
> +
> +    * .. _V4L2-PIX-FMT-Y16:
> +
> +      - ``V4L2_PIX_FMT_Y16``
> +      - 'Y16 '
> +
> +      - Y'\ :sub:`0`\ [7:0]
> +      - Y'\ :sub:`0`\ [15:8]
> +      - ...
> +      - ...
> +      - ...
> +
> +    * .. _V4L2-PIX-FMT-Y16-BE:
> +
> +      - ``V4L2_PIX_FMT_Y16_BE``
> +      - 'Y16 ' | (1 << 31)

1U << 31

> +
> +      - Y'\ :sub:`0`\ [7:0]
> +      - Y'\ :sub:`0`\ [15:8]

The order is the same as for the LE version. Shouldn't it be inverted?

> +      - ...
> +      - ...
> +      - ...
> +
> +.. note::
> +
> +    For the Y16 and Y16_BE formats, the actual sampling precision may be lower
> +    than 16 bits. For example, 10 bits per pixel uses values in the range 0 to
> +    1023.
> diff --git a/Documentation/userspace-api/media/v4l/yuv-formats.rst b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> index a5b17040679e..7179d715f8a7 100644
> --- a/Documentation/userspace-api/media/v4l/yuv-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/yuv-formats.rst
> @@ -265,14 +265,7 @@ image.
>      :maxdepth: 1
>  
>      pixfmt-packed-yuv
> -    pixfmt-grey
> -    pixfmt-y10
> -    pixfmt-y12
> -    pixfmt-y14
> -    pixfmt-y10b
> -    pixfmt-y10p
> -    pixfmt-y16
> -    pixfmt-y16-be
> +    pixfmt-yuv-luma
>      pixfmt-y8i
>      pixfmt-y12i
>      pixfmt-uv8

-- 
Regards,

Sakari Ailus
