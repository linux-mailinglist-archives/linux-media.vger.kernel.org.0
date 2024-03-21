Return-Path: <linux-media+bounces-7522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06334885F18
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 18:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 977B31F2454C
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C28763EC;
	Thu, 21 Mar 2024 16:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IbqOHlcM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7C413342F
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 16:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711040085; cv=none; b=jiLiCYwAEpWISfs4mvI4l9XrQfP9v16n3JuXjYeMCsxlkWT9ucO9g0TlExh2fchO2a8MGDdteBvmzRbcYClVn61Lu7OVT9LepM5JwTxiLQzFOst8h+1b5d0+EcW7rTAGkdXCyOr35MqGt7YKH8gKrxscgVq3sPAkn5o0vvwphR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711040085; c=relaxed/simple;
	bh=EQngy2F4hzX4h7eW215fE8GI4pNRFQxz+JxlaInzz30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQIzad9AULgAizAcceI5Vg4vEIjgyp7dTGVLBz/df+ns+3nMNLmD3RQM3SM/3S6YvursnrT0jbfZvHimeNzc8+PdHq8IMF2DyII4s9czyDq7GbEUaiKU3a1AuakBHjlT0nB1Q4aHEvDOLvLw4pTT7ZEbFhqGrr1A9iakCp/5BbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IbqOHlcM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1DE5672;
	Thu, 21 Mar 2024 17:54:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711040053;
	bh=EQngy2F4hzX4h7eW215fE8GI4pNRFQxz+JxlaInzz30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IbqOHlcMCwcRT0uMHnR3E9ITVRKcjvneWN4OllZe/fB2F6FIgPpsRHdRKWOjmxQ6p
	 k/+BYN4l8G9bI80iirof+ssQjm+gi8Wfr5IlrrffjrT3hrvGOW1/DA968R9nA9AU/A
	 4dg6NXWNOzS0sHg5xiPBXTkVbF1StmmvNivHEzOo=
Date: Thu, 21 Mar 2024 18:54:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 32/38] media: uapi: Add media bus code for ov2740
 embedded data
Message-ID: <20240321165438.GF9582@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-33-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-33-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:25:10AM +0200, Sakari Ailus wrote:
> Add a media bus code for ov2740 camera sensor embedded data and document
> it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/v4l/subdev-formats.rst              | 66 +++++++++++++++++++
>  include/uapi/linux/media-bus-format.h         |  3 +-
>  2 files changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index ca4da6a400ff..a875868ed951 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -8594,3 +8594,69 @@ This mbus code are only used for "2-byte simplified tagged data format" (code
>  embedded data format codes.
>  
>  Also see :ref:`CCS driver documentation <media-ccs-routes>`.
> +
> +Omnivision OV2740 Embedded Data Format
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The Omnivision OV2740 camera sensor produces the following embedded data format.
> +
> +.. flat-table:: Omnivision OV2740 Embedded Data Format. Octets at indices marked
> +                reserved or unused have been omitted from the table.
> +    :header-rows: 1
> +
> +    * - Byte
> +      - Concent description

s/Concent/Content/

> +    * - 0
> +      - Sensor info

What does this contain ?

> +    * - 4
> +      - Analogue gain (bits 10--8)
> +    * - 5
> +      - Analogue gain (bits 7--0)

I wonder if you could simplify the table by writing

    * - 4
      - Analogue gain (bits 10--0)
    * - 6
      - Coarse integration time (bits 15--0)

...

and documenting that all fields are in big-endian format. A size columns
could then be useful I suppose.

> +    * - 6
> +      - Coarse integration time (bits 15--8)
> +    * - 7
> +      - Coarse integration time (bits 7--0)
> +    * - 10
> +      - Dpc correction threshold (bits 9--2)
> +    * - 15
> +      - Output image width (bits 15--8)
> +    * - 16
> +      - Output image width (bits 7--0)
> +    * - 17
> +      - Output image height (bits 15--8)
> +    * - 18
> +      - Output image height (bits 7--0)
> +    * - 23
> +      - MIPI header revision number

What does this contain ?

> +    * - 31
> +      - Vertical (bit 1) and horizontal flip (bit 0)
> +    * - 32
> +      - Frame duration A

What does this contain ? Same for frame duration B, context count,
context select.

> +    * - 33
> +      - Frame duration B
> +    * - 34
> +      - Context count
> +    * - 35
> +      - Context select
> +    * - 54
> +      - Data pedestal (bits 9--2)
> +    * - 63
> +      - Frame average (bits 9--2)
> +    * - 64
> +      - Digital gain red
> +    * - 65
> +      - Digital gain red

Bit numbers are missing.

> +    * - 66
> +      - Digital gain greenr
> +    * - 67
> +      - Digital gain greenr
> +    * - 68
> +      - Digital gain blue
> +    * - 69
> +      - Digital gain blue
> +    * - 70
> +      - Digital gain greenb
> +    * - 71
> +      - Digital gain greenb
> +    * - 89
> +      - Frame counter

Does this wrap at 255 ?

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

