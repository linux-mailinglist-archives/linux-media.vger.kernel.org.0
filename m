Return-Path: <linux-media+bounces-41440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5017B3E6C9
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 16:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 276891A8185E
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 14:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3392A33CEA8;
	Mon,  1 Sep 2025 14:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AJs+SjSD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C5F2EF643
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 14:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756735965; cv=none; b=lTMgxcTv95byR7k7kjTmudaixi0zlgcVS0Y7hiZsm0XlZ1/deJ8Hy2eocQ1gz7UeDk1arg2MVICFMoWDmxflfDA/+N6pFsnD5J0nLgZqS+XgbIRFIxdxqFYwPjH1TWBiyscSFYDpib9Csky7pi9hkdpo0cqRFTtKWh78YfrShjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756735965; c=relaxed/simple;
	bh=aWbOHMhpzNPN7bzQ5C7OfusGzYyfSaioEQNqJVUpd18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSDQ8L5QGdpvv+i81biZ3G3bxt7EQUaeSFWfbiFAijvHMIboEL+R0YYSkmMFIzsgDVS5a81M6ZVaSFvQG1Fuf4ysqzlx4xgp/ecCEu+gWXh8k8doM2Rp8W3Pn81Xc2Rkngm61Z/2SHyF1d5logpAn8AFC2yqKoZCFqvzU8yJgIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AJs+SjSD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-95.net.vodafone.it [5.90.63.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CD4BEAE;
	Mon,  1 Sep 2025 16:11:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756735890;
	bh=aWbOHMhpzNPN7bzQ5C7OfusGzYyfSaioEQNqJVUpd18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJs+SjSD0Hxn68pyYo7oqNKcQ78LKrgVC7877EaJ29/OJyJPPUPh/3u0Vwx9lN6uR
	 8K8/AfBm1AjdJ62UzVDNxWQOXXUz4J0cw5f6cv8f5vHUKynDn2WOZf8jvXjvdqL6Ca
	 0RVjLot7Mp4WY/0S/87XRrvAv+TXGPztBIXnLmNM=
Date: Mon, 1 Sep 2025 16:12:33 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 17/66] media: uapi: Add new media bus codes for
 generic raw formats
Message-ID: <httktoswdeltortwoqn5hllzjwtb3prjoe2tigx7u4x6ojdpwr@misyxjdfk3lb>
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

Hi Sakari

On Mon, Aug 25, 2025 at 12:50:18PM +0300, Sakari Ailus wrote:
> Add new media bus codes for generic raw formats that are not specific to
> the colour filter array but that simply specify the bit depth. The layout
> (packing) of the data is interface specific.
>
> The rest of the properties of the format are specified with controls in
> the image source.
>
> The mbus codes added by this patch have bit depth of 8, 10, 12 and 14.

Same as per the pixel formats, your branch contains
"media: uapi: Add more media bus codes for generic raw formats"

Should you squash it in ?

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

I would remove "(largely) unprocessed", mostly because I'm not sure
what you mean here.

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

Should we now say in the "Bayer Formats" section that the existing
media bus codes that convey the color components ordering are now
superseded by these ones ?

Nits apart
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
   j

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
> +#define MEDIA_BUS_FMT_RAW_8			0xa001
> +#define MEDIA_BUS_FMT_RAW_10			0xa002
> +#define MEDIA_BUS_FMT_RAW_12			0xa003
> +#define MEDIA_BUS_FMT_RAW_14			0xa004
> +
>  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
> --
> 2.47.2
>
>

