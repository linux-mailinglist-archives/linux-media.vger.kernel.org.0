Return-Path: <linux-media+bounces-41741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7801AB42C13
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 23:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5346A1B282AB
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 21:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FD72EACFB;
	Wed,  3 Sep 2025 21:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fJQhll56"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13172E7F03
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 21:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756935815; cv=none; b=J3P4E4LvT7N/AHxxChVO9uflCX1yRZc2U+/jiUgspmVsM9R0NlGyxNGjgutSUke3kOi5lYmQfvJmSVxd+frrqGdJHm8Mv3mmJBNZi70tkYOhN1aqSuUQDreQLADytcwdYMTiBzMYrUMo3tsnMXwjpr0qv/d69bq6Q9wFjjVd5BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756935815; c=relaxed/simple;
	bh=0VFdBo83O+glE3wjqJoqZqWXvnpEJPNG+ON0KktnWto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXsqzNMwjWFHbmcL7JpjK7KGxaIZq/9tHQ/CDPzJsLtDlYH4oO+jz+MGAKgW+n50TmRIKeftvTUooNFe1PdMXfaPGNQZ/DA2i4+5XKPTJHqMrf+1Xh8o2T5cZ/Qwc7rX9KL4Uzvs7f+htW4faNa+vW6JUwTRdG9hlWkj51NvoGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fJQhll56; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C3BE27CE;
	Wed,  3 Sep 2025 23:42:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756935739;
	bh=0VFdBo83O+glE3wjqJoqZqWXvnpEJPNG+ON0KktnWto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fJQhll56Dn91UgQXuqN34jtgGvdYLZyqEnuujVhZzOhD0d6GQTYlcjxQO/UWEnB7e
	 jV8MfDEEmz57Ybh5Z/HNbctV+KU2ctOV4awqMYNUA/8SbUB/ikgjGJrLfHhrDfqSgO
	 QDwBxpThJtw9kuFQwlQfGSuoa0ionU596ZFGRvNU=
Date: Wed, 3 Sep 2025 23:43:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 46/66] media: uapi: Add metadata layout for ov2740
 embedded data
Message-ID: <20250903214307.GD3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-47-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-47-sakari.ailus@linux.intel.com>

On Mon, Aug 25, 2025 at 12:50:47PM +0300, Sakari Ailus wrote:
> Add a metadata layout for ov2740 camera sensor embedded data and document
> it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../media/v4l/ext-ctrls-image-source.rst      |  3 +
>  .../media/v4l/metadata-layouts.rst            | 72 +++++++++++++++++++
>  include/uapi/linux/v4l2-controls.h            |  1 +
>  3 files changed, 76 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index 371c155a88f7..ced358d7c250 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -165,3 +165,6 @@ Image Source Control IDs
>      * - V4L2_METADATA_LAYOUT_CCS
>        - :ref:`CCS embedded data <media-metadata-layout-ccs>`
>        - 1
> +    * - V4L2_METADATA_LAYOUT_OV2740
> +      - :ref:`OV2740 embedded data <media-metadata-layout-ov2740>`
> +      - 2
> diff --git a/Documentation/userspace-api/media/v4l/metadata-layouts.rst b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
> index a4f7e93e6a29..e667148cc3cb 100644
> --- a/Documentation/userspace-api/media/v4l/metadata-layouts.rst
> +++ b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
> @@ -39,3 +39,75 @@ format" (code ``0xa``) but their use may be extended further in the future, to
>  cover other CCS embedded data format codes.
>  
>  Also see :ref:`CCS driver documentation <media-ccs-routes>`.
> +
> +.. _media-metadata-layout-ov2740:
> +
> +Omnivision OV2740 Embedded Data Layout (``V4L2_METADATA_LAYOUT_OV2740``)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The Omnivision OV2740 camera sensor produces the following embedded data layout,
> +indicated by ``V4L2_METADATA_LAYOUT_CCS`` metadata layout. The format conforms

s/V4L2_METADATA_LAYOUT_CCS/V4L2_METADATA_LAYOUT_OV2740/

> +to :ref:`CCS embedded data layout <media-metadata-layout-ccs>` up to level 1.
> +
> +.. flat-table:: Omnivision OV2740 Embedded Data Layout. Octets at indices marked
> +                reserved or unused have been omitted from the table. The values
> +                are big endian byte order.
> +    :header-rows: 1
> +
> +    * - Offset
> +      - Size in bits (active bits if not the same as size)
> +      - Content description
> +    * - 4
> +      - 16 (10--0)
> +      - Analogue gain
> +    * - 6
> +      - 16
> +      - Coarse integration time
> +    * - 10
> +      - 8
> +      - Dpc correction threshold

s/Dpc/DPC/

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +    * - 15
> +      - 16
> +      - Output image width
> +    * - 17
> +      - 16
> +      - Output image height
> +    * - 23
> +      - 8
> +      - MIPI header revision number (2)
> +    * - 31
> +      - 8
> +      - Vertical (bit 1) and horizontal flip (bit 0)
> +    * - 32
> +      - 8
> +      - Frame duration A
> +    * - 33
> +      - 8
> +      - Frame duration B
> +    * - 34
> +      - 8
> +      - Context count (2)
> +    * - 35
> +      - 8
> +      - Context select
> +    * - 54
> +      - 8
> +      - Data pedestal bits 9--2
> +    * - 63
> +      - 8
> +      - Frame average bits 9--2
> +    * - 64
> +      - 16
> +      - Digital gain red
> +    * - 66
> +      - 16
> +      - Digital gain greenr
> +    * - 68
> +      - 16
> +      - Digital gain blue
> +    * - 70
> +      - 16
> +      - Digital gain greenb
> +    * - 89
> +      - 8
> +      - Frame counter (starts at 1, wraps to 0 after 255)
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 51d43d4a3151..bac2fdcbd202 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1244,6 +1244,7 @@ enum v4l2_jpeg_chroma_subsampling {
>  
>  #define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
>  #define V4L2_METADATA_LAYOUT_CCS		1U
> +#define V4L2_METADATA_LAYOUT_OV2740		2U
>  
>  
>  /* Image processing controls */

-- 
Regards,

Laurent Pinchart

