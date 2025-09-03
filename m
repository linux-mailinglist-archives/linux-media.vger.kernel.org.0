Return-Path: <linux-media+bounces-41711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6EEB423DF
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 16:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BBDC566164
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DDC20E023;
	Wed,  3 Sep 2025 14:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D+MiqAQS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028B920010C
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 14:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756910336; cv=none; b=reLMNgUsczMSSYg0bMsMQOd9RnWP4msKWwqzq9hMOXvJMjyjjm3mXaikwcYtivDfQweDfa24dbReC1RIAFFys+3t9YW3olKNVxywMDWSbQitz/pwKcOaKMXWdrs2ug9SNsSh7sU8P6z09MmkoCK/rAODXGWfRot9WukDicV62vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756910336; c=relaxed/simple;
	bh=VdLeZADNyEZgFDok1I6gLQPZ9E4A5pItYpaZIuzCv+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xmp15sVn020oxttcZl2l7JsDMw7h0dIe4ZxXfU4gs6xRMZBlO1S9Ra6Km52HT5FERZGANGwP4wjyQ3cVwWEKTaswM+Cc4EAoGF6jzM0jDIQFTYUbHY2hDOfvTJp2FHGeVR2DBWmXjNNSK6ECcnoKfo+17mbzw9Pc8ijskim8Uu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D+MiqAQS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1BF1B8BF;
	Wed,  3 Sep 2025 16:37:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756910263;
	bh=VdLeZADNyEZgFDok1I6gLQPZ9E4A5pItYpaZIuzCv+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+MiqAQSFsJTL+78XthTy4Bw8pj1LkpBfDPpVggte9EHBybxdmExM2HsqGyUWw8Hx
	 npkCKMQ/h/Nv1WA7HTcNTJ4uw9o7RK+/a03ExQJvCXVA8UAsXIrXwpLPEtvu6bNDIk
	 06apqpSsEWchgOWVI6V7J2WEWRepdiLot1EexLkM=
Date: Wed, 3 Sep 2025 16:38:31 +0200
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
Subject: Re: [PATCH v11 17/66] media: uapi: Add new media bus codes for
 generic raw formats
Message-ID: <20250903143831.GM3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-18-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-18-sakari.ailus@linux.intel.com>

On Mon, Aug 25, 2025 at 12:50:18PM +0300, Sakari Ailus wrote:
> Add new media bus codes for generic raw formats that are not specific to
> the colour filter array but that simply specify the bit depth. The layout
> (packing) of the data is interface specific.
> 
> The rest of the properties of the format are specified with controls in
> the image source.
> 
> The mbus codes added by this patch have bit depth of 8, 10, 12 and 14.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/v4l/subdev-formats.rst              | 27 +++++++++++++++++++
>  include/uapi/linux/media-bus-format.h         |  6 +++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 9ef1bc22ad9c..1a51b5c817f1 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -3434,6 +3434,33 @@ organization is given as an example for the first pixel only.
>  
>      \endgroup
>  
> +Generic raw formats on serial interfaces
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Those formats transfer (largely) unprocessed raw pixel data typically from raw
> +camera sensors using Bayer and other Colour Filter Arrays (CFAs) on serial
> +interfaces. The packing of the data on the bus is determined by the hardware,
> +however the bit depth is still specific to the format.
> +
> +.. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: Generic raw formats on serial buses
> +    :header-rows:  1
> +    :stub-columns: 0
> +    :widths:       1 1
> +
> +    * - Format name
> +      - Bit depth
> +    * - MEDIA_BUS_FMT_RAW_8
> +      - 8
> +    * - MEDIA_BUS_FMT_RAW_10
> +      - 10
> +    * - MEDIA_BUS_FMT_RAW_12
> +      - 12
> +    * - MEDIA_BUS_FMT_RAW_14
> +      - 14
>  
>  Packed YUV Formats
>  ^^^^^^^^^^^^^^^^^^
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index ff62056feed5..b71120bc1788 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -185,4 +185,10 @@
>  #define MEDIA_BUS_FMT_META_20			0x8006
>  #define MEDIA_BUS_FMT_META_24			0x8007
>  
> +/* Generic (CFA independent) pixel data formats. Next is 0xa009. */

The next format is 0xa005. Any reason not to use 0x9000 as a base though
? Or maybe adding these to the 0x3000 (bayer formats) group ? We're
running out of bases.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +#define MEDIA_BUS_FMT_RAW_8			0xa001
> +#define MEDIA_BUS_FMT_RAW_10			0xa002
> +#define MEDIA_BUS_FMT_RAW_12			0xa003
> +#define MEDIA_BUS_FMT_RAW_14			0xa004
> +
>  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */

-- 
Regards,

Laurent Pinchart

