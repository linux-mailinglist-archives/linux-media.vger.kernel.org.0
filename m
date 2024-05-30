Return-Path: <linux-media+bounces-12306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7828D559E
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 00:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D6271C2239F
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 22:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D8B182D3C;
	Thu, 30 May 2024 22:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LUgevlqp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C2B335A7;
	Thu, 30 May 2024 22:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717109000; cv=none; b=na21tqizASfi6skRMqLI814pcRi4THBH+BhPVUa3EubrIit7/qJZBZAqj54tFB75aXj7sGCjnUs5bUycGQuEJ/SyFX8GJzsrs/CcfkMpFUpx26QoREkYyrxXhvnjUzWbLttBcGsa5RtQLTKJF8LM1ZyKDVuVVqhdIYtr6fqnDZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717109000; c=relaxed/simple;
	bh=0X2dw/UeogrCIoEMegPjW9bubHPq1jD1XjDgrtIFmsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQr49dmp78Vc4AKsLCTfFZ1pcXQjrq7QUxtj43msnbfvmRNMmF1SiRip6QAWpTH+/1AYpQNRhq3t1ab+GyohrJdPpXVBVrVS7/VI8fPum+Fssnlwa9hiIrb55Lt68dVilhmXiYD3Kew+Yg53wWKu+EA0MDS6FG6TzHARUT4fZr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LUgevlqp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B59DA06;
	Fri, 31 May 2024 00:43:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717108992;
	bh=0X2dw/UeogrCIoEMegPjW9bubHPq1jD1XjDgrtIFmsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LUgevlqpoBpMsA/1CdtgqtHsMzowZWDZVw5P/9SSxKLDi3rtHQjYs89+B7E5qDXrC
	 XtpBep1/9D7UEUpKhDHqkORYbXeN+S4MpSVLF8cGOXTGanewwq9HCZ4/Vi9XKLVI04
	 wlkSUiE3pEVFVbG5sOb84LqIMXklivh8MzR1vpdI=
Date: Fri, 31 May 2024 01:43:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v5 12/16] Documentation: mali-c55: Add Statistics
 documentation
Message-ID: <20240530224304.GD5213@pendragon.ideasonboard.com>
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-13-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240529152858.183799-13-dan.scally@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Wed, May 29, 2024 at 04:28:54PM +0100, Daniel Scally wrote:
> Add documentation explaining the ability to capture statistics from
> the mali-c55 driver's new V4L2 device, as well as the various tap
> points from which those statistics can be drawn in the ISP's
> processing flow. Additionally add a page detailing the new V4L2
> meta format for the mali-c55 statistics.
> 
> Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v5:
> 
> 	- New patch
> 
>  Documentation/admin-guide/media/mali-c55.rst  | 60 ++++++++++++++++++-
>  .../userspace-api/media/v4l/meta-formats.rst  |  1 +
>  .../media/v4l/metafmt-arm-mali-c55.rst        | 28 +++++++++
>  3 files changed, 88 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
> 
> diff --git a/Documentation/admin-guide/media/mali-c55.rst b/Documentation/admin-guide/media/mali-c55.rst
> index cf4176cb1e44..b75437f6e96a 100644
> --- a/Documentation/admin-guide/media/mali-c55.rst
> +++ b/Documentation/admin-guide/media/mali-c55.rst
> @@ -67,10 +67,11 @@ The driver has 4 V4L2 subdevices:
>  - `mali_c55 resizer fr`: The Full-Resolution pipe resizer
>  - `mali_c55 resizer ds`: The Downscale pipe resizer
>  
> -The driver has 2 V4L2 video devices:
> +The driver has 3 V4L2 video devices:
>  
>  - `mali-c55 fr`: The full-resolution pipe's capture device
>  - `mali-c55 ds`: The downscale pipe's capture device
> +- `mali-c55 3a stats`: The 3A statistics capture device
>  
>  Frame sequences are synchronised across to two capture devices, meaning if one
>  pipe is started later than the other the sequence numbers returned in its
> @@ -326,6 +327,63 @@ configured, followed by formats in the appropriate places:
>      # Set format on the video device and stream
>      yavta -f RGB565 -s 1920x1080 -c10 /dev/video0
>  
> +.. _mali-c55-3a-stats:
> +
> +Capturing ISP Statistics
> +========================
> +
> +The ISP is capable of producing statistics for consumption by image processing
> +algorithms running in userspace. These statistics can be captured by queueing
> +buffers to the `mali-c55 3a stats` V4L2 Device whilst the ISP is streaming. Only
> +the :ref:`V4L2_META_FMT_MALI_C55_3A_STATS <v4l2-meta-fmt-mali-c55-3a-stats>`
> +format is supported, so no format-setting need be done:
> +
> +.. code-block:: none
> +
> +    # We assume the media graph has been configured to support RGB565 capture
> +    # from the mali-c55 fr V4L2 Device, which is at /dev/video0. The statistics
> +    # V4L2 device is at /dev/video3
> +
> +    yavta -f RGB565 -s 1920x1080 -c32 /dev/video0 && \
> +    yavta -c10 -F /dev/video3
> +
> +The layout of the buffer is described by :c:type:`mali_c55_stats_buffer`,
> +but broadly statistics are generated to support three image processing
> +algorithms; AEXP (Auto-Exposure), AWB (Auto-White Balance) and AF (Auto-Focus).
> +These stats can be drawn from various places in the Mali C55 ISP pipeline, known
> +as "tap points". This high-level block diagram is intended to explain where in
> +the processing flow the statistics can be drawn from::
> +
> +                  +--> AEXP-2            +----> AEXP-1          +--> AF-0
> +                  |                      +----> AF-1            |
> +                  |                      |                      |
> +      +---------+ |   +--------------+   |   +--------------+   |
> +      |  Input  +-+-->+ Digital Gain +---+-->+ Black Level  +---+---+
> +      +---------+     +--------------+       +--------------+       |
> +  +-----------------------------------------------------------------+
> +  |
> +  |   +--------------+ +---------+       +----------------+
> +  +-->| Sinter Noise +-+  White  +--+--->|  Lens Shading  +--+---------------+
> +      |   Reduction  | | Balance |  |    |                |  |               |
> +      +--------------+ +---------+  |    +----------------+  |               |
> +                                    +---> AEXP-0 (A)         +--> AEXP-0 (B) |
> +  +--------------------------------------------------------------------------+
> +  |
> +  |   +----------------+      +--------------+  +----------------+
> +  +-->|  Tone mapping  +-+--->| Demosaicing  +->+ Purple Fringe  +-+-----------+
> +      |                | |    +--------------+  |   Correction   | |           |
> +      +----------------+ +-> AEXP-IRIDIX        +----------------+ +---> AWB-0 |
> +  +----------------------------------------------------------------------------+
> +  |                    +-------------+        +-------------+
> +  +------------------->|   Colour    +---+--->|    Output   |
> +                       | Correction  |   |    |  Pipelines  |
> +                       +-------------+   |    +-------------+
> +                                         +-->  AWB-1
> +
> +At present all statistics are drawn from the 0th tap point for each algorithm;
> +I.E. AEXP statistics from AEXP-0 (A), AWB statistics from AWB-0 and AF
> +statistics from AF-0. In the future this will be configurable.
> +
>  References
>  ==========
>  .. [1] https://git.linuxtv.org/v4l-utils.git/
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> index c23aac823d2c..73c05cc35321 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -15,6 +15,7 @@ These formats are used for the :ref:`metadata` interface only.
>      metafmt-d4xx
>      metafmt-generic
>      metafmt-intel-ipu3
> +    metafmt-arm-mali-c55

Alphabetical order please.

>      metafmt-rkisp1
>      metafmt-uvc
>      metafmt-vivid
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
> new file mode 100644
> index 000000000000..219a5dd42d70
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
> @@ -0,0 +1,28 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _v4l2-meta-fmt-mali-c55-3a-stats:
> +
> +****************************************
> +V4L2_META_FMT_MALI_C55_3A_STATS ('C55S')
> +****************************************
> +
> +3A Statistics
> +=============

Missing blank line.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +The ISP device collects different statistics over an input bayer frame. Those
> +statistics can be obtained by userspace from the
> +:ref:`mali-c55 3a stats <mali-c55-3a-stats>` metadata capture video node, using
> +the :c:type:`v4l2_meta_format` interface. The buffer contains a single instance
> +of the C structure :c:type:`mali_c55_stats_buffer` defined in
> +``mali-c55-config.h``, so the structure can be obtained from the buffer by:
> +
> +.. code-block:: C
> +
> +	struct mali_c55_stats_buffer *stats =
> +		(struct mali_c55_stats_buffer *)buf;
> +
> +For details of the statistics see :c:type:`mali_c55_stats_buffer`.
> +
> +Arm Mali-C55 uAPI data types
> +============================
> +
> +.. kernel-doc:: include/uapi/linux/media/arm/mali-c55-config.h

-- 
Regards,

Laurent Pinchart

