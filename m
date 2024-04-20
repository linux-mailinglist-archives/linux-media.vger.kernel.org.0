Return-Path: <linux-media+bounces-9805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 904168ABAC8
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 11:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E5A9B21105
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 09:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510A01758C;
	Sat, 20 Apr 2024 09:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F1bwuou3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E4F14AB4
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 09:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713605382; cv=none; b=WOrvAuMrCxF8oY6JeZmiWZoeBsdQlaslzrWlPTt9GthCdzG8ebrlAnPKUKzeoD/kTDUql7Goc/ZGCJfudn+X5KP454yrSmWBzSLJahBcfO+AWn8CLW8NI3KlSA3VXtkNWOMfRr5pC/IMr+4ltAGp7gBNXF6fsplVHllJOzkEem4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713605382; c=relaxed/simple;
	bh=VgncZgLev46kg9ADlg/QPTChS2WxJ/496wKcpZ0wKdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ph4YYbUg5flHEolKIM9B/31GwjiJqF5wQUVBtx0RnN92VtfmrtaAksk2/32a7Uuu6831c/HQmjh56J7L7bLf6gTAgiQrmrDvCjVmU48DOO59r2JIa0j4ebyEekLcSCYZBCId6yvjBVo5fxcE4Gf8Yad8CmB6gaq9lLFKEF3SSdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F1bwuou3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29CB255;
	Sat, 20 Apr 2024 11:28:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713605330;
	bh=VgncZgLev46kg9ADlg/QPTChS2WxJ/496wKcpZ0wKdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F1bwuou30BPDPoFnvIYaDn6uW4ZuCZBn4F9WaihWuu49pI181D/F53wID1VkAFQfS
	 d/Q1qnF9TMcg2l3vi1/uTgK+p5Fcmn6s+dDE3mg3MBmyznjlAN09T6RVaLNNDRF5By
	 zVmH+3oaLOlKnZD3Vv6kefdewPwbN+OpXLOe7kQI=
Date: Sat, 20 Apr 2024 12:29:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 36/46] media: uapi: Add media bus code for ov2740
 embedded data
Message-ID: <20240420092930.GW6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-37-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-37-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:33:09PM +0300, Sakari Ailus wrote:
> Add a media bus code for ov2740 camera sensor embedded data and document
> it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../media/v4l/subdev-formats.rst              | 70 +++++++++++++++++++
>  include/uapi/linux/media-bus-format.h         |  3 +-
>  2 files changed, 72 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index a04756092238..c99b58cb8c7b 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -8596,3 +8596,73 @@ This mbus code are only used for "2-byte simplified tagged data format" (code
>  embedded data format codes.
>  
>  Also see :ref:`CCS driver documentation <media-ccs-routes>`.
> +
> +Omnivision OV2740 Embedded Data Format
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The Omnivision OV2740 camera sensor produces the following embedded data format,
> +indicated by mbus code MEDIA_BUS_FMT_OV2740_EMBEDDED. The format conforms to
> +:ref:`CCS embedded data format <MEDIA-BUS-FMT-CCS-EMBEDDED>` up to level 1.
> +
> +.. flat-table:: Omnivision OV2740 Embedded Data Format. Octets at indices marked
> +                reserved or unused have been omitted from the table. The values
> +                are big endian byte order.

s/are big endian/are in big endian/

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

v8 indicated this contained bits 9:2 of the value, was that wrong, or
did it get dropped by mistake ?

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

I'm not sure to understand what those four values are.

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
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 03f7e9ab517b..13e68c2ccb61 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -183,7 +183,8 @@
>  #define MEDIA_BUS_FMT_META_20			0x8006
>  #define MEDIA_BUS_FMT_META_24			0x8007
>  
> -/* Specific metadata formats. Next is 0x9002. */
> +/* Specific metadata formats. Next is 0x9003. */
>  #define MEDIA_BUS_FMT_CCS_EMBEDDED		0x9001
> +#define MEDIA_BUS_FMT_OV2740_EMBEDDED		0x9002
>  
>  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */

-- 
Regards,

Laurent Pinchart

