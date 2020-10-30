Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 216712A0C26
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 18:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbgJ3RJX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 13:09:23 -0400
Received: from mga07.intel.com ([134.134.136.100]:13402 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727263AbgJ3RJU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 13:09:20 -0400
IronPort-SDR: ZdOj2Zrf8wkJIifKSVfGgPa/lZmHH9TCH0dyXsNgoYetIwVYbdNLvcq85JdaxiWVY6oxwVGMkB
 qh+67tNTwWCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="232815551"
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; 
   d="scan'208";a="232815551"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 10:09:19 -0700
IronPort-SDR: 5N2oZGH55VprlyiNlLydwafobFQ6yreOgcuf7zUhyzWb4eHAo6KeTv06azpEnyGk/Dii5CQ/vD
 XgMeaOjoaRjw==
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; 
   d="scan'208";a="335480145"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 10:09:16 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id F2E6A20736; Fri, 30 Oct 2020 16:02:41 +0200 (EET)
Date:   Fri, 30 Oct 2020 16:02:41 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: Re: [PATCH v3 1/2] media: uapi: add MEDIA_BUS_FMT_METADATA_FIXED
 media bus format.
Message-ID: <20201030140241.GQ26150@paasikivi.fi.intel.com>
References: <20201030134609.30020-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201030134609.30020-1-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Fri, Oct 30, 2020 at 02:46:08PM +0100, Dafna Hirschfeld wrote:
> MEDIA_BUS_FMT_METADATA_FIXED should be used when
> the same driver handles both sides of the link and
> the bus format is a fixed metadata format that is
> not configurable from userspace.
> The width and height will be set to 0 for this format.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> ---
> changes since v2:
> added documentation in subdev-formats.rst
> changes since v1:
> 1. replace "This format may have 0 height and width."
> with "Width and height will be set to 0 for this format."
> and add it also to the commit log
> 2. s/meida:/media:/ in the patch subject line
> 
>  .../media/v4l/subdev-formats.rst              | 27 +++++++++++++++++++
>  include/uapi/linux/media-bus-format.h         |  8 ++++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index c9b7bb3ca089..7f16cbe46e5c 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -7899,3 +7899,30 @@ formats.
>        - 0x5001
>        - Interleaved raw UYVY and JPEG image format with embedded meta-data
>  	used by Samsung S3C73MX camera sensors.
> +
> +.. _v4l2-mbus-metadata-fmts:
> +
> +Metadata Formats
> +^^^^^^^^^^^^^^^^
> +
> +This section lists all metadata formats.
> +
> +The following table lists the existing metadata formats.
> +
> +.. tabularcolumns:: |p{8.0cm}|p{1.4cm}|p{7.7cm}|
> +
> +.. flat-table:: Metadata formats
> +    :header-rows:  1
> +    :stub-columns: 0
> +
> +    * - Identifier
> +      - Code
> +      - Comments
> +    * .. _MEDIA-BUS-FMT-METADATA-FIXED:
> +
> +      - MEDIA_BUS_FMT_METADATA_FIXED
> +      - 0x7001
> +      - This format should be used when the same driver handles
> +	both sides of the link and the bus format is a fixed
> +	metadata format that is not configurable from userspace.
> +	Width and height will be set to 0 for this format.
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 84fa53ffb13f..2ce3d891d344 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -156,4 +156,12 @@
>  /* HSV - next is	0x6002 */
>  #define MEDIA_BUS_FMT_AHSV8888_1X32		0x6001
>  
> +/*
> + * This format should be used when the same driver handles
> + * both sides of the link and the bus format is a fixed
> + * metadata format that is not configurable from userspace.
> + * Width and height will be set to 0 for this format.
> + */

Does this mean that metadata with dimensions should not use
MEDIA_BUS_FMT_METADATA_FIXED? I guess that's not the intention? For some
formats the dimensions would be relevant but for others not. I'd thus
replace "will" by "may". Same for the documentation.

> +#define MEDIA_BUS_FMT_METADATA_FIXED		0x7001
> +
>  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */

-- 
Kind regards,

Sakari Ailus
