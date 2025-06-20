Return-Path: <linux-media+bounces-35485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F900AE1A3C
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 13:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF2815A56EB
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 11:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163202750E1;
	Fri, 20 Jun 2025 11:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MXVtqT2E"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1435E30E828
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 11:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750420241; cv=none; b=tP8qDRa5DoZT8uT+HzC1SuGItIC2qFKnG+mGI5rNxfQNDjOuEGJU89BmgPJoJmSja8VHqxg/gZsRWrDv4FqMvf8yYjOP2GpG1Fujc7jcg34iuvziXpOZVfPP+fkCgFOdtdLv1da00TBOre6h27DbyeIX5AXMTsWMqLCjLtb5fqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750420241; c=relaxed/simple;
	bh=BLRSSyFfCtDcjWAmodv6V+j0w9+Qo+wlHFrtV813p5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ktkk9JoL+0RI7ENFlMHM/kEln2lShdsIqNfXysZrErlYdkdwXAsGukENTkkIF2gWRXOGmW8I4cO/BbM/u7dTfFAYOfLGs66/EcVYS1dYgVLUtPR12PDaSIpIR6LPGc0YFYChyYlPWvHa5DtbCPUzn1uxkg3bTYzmbegp52DIBs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MXVtqT2E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5922BC0B;
	Fri, 20 Jun 2025 13:50:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750420220;
	bh=BLRSSyFfCtDcjWAmodv6V+j0w9+Qo+wlHFrtV813p5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MXVtqT2ECpiIrq7dS1IPS5Tagl9Mq/AlJ9diuNCOYdVQIIX1AsfdyTCZ1ePAvoyBT
	 AUNXlFNOCeqsInl6KGAVteKtJz20UnAPbjFMSKE+TT1t5VQKSeicMd71x+ztvI2ZDu
	 oaUlKuoto5bTbcZVskABDzmqQq1T0KpJQyxZmEkI=
Date: Fri, 20 Jun 2025 13:50:31 +0200
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
Subject: Re: [PATCH v10 15/64] media: uapi: Add generic CSI-2 raw pixelformats
Message-ID: <2e757wqhu6rfi2c2utpdhw7qfxjdyk2pu62m6pyv2a3ppm4r3a@zyaresvmgd4c>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-16-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-16-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:57:47PM +0300, Sakari Ailus wrote:
> Add generic raw pixelformats for bit depths 8, 10, 12, 14, 16, 20, 24 and
> 28. These formats are CSI-2 packed, apart from the 8-, 16- and 24-bit
> formats.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/v4l/pixfmt-raw-generic.rst          | 398 ++++++++++++++++++
>  .../userspace-api/media/v4l/pixfmt.rst        |   1 +
>  include/uapi/linux/videodev2.h                |  10 +
>  3 files changed, 409 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> new file mode 100644
> index 000000000000..8561233f5262
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> @@ -0,0 +1,398 @@
> +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> +
> +************************************************************************************************************************************************************************************************************************************************************************************
> +V4L2_PIX_FMT_RAW_8 ('RAW8'), V4L2_PIX_FMT_RAW_CSI2_10 ('RACA'), V4L2_PIX_FMT_RAW_CSI2_12 ('RACC'), V4L2_PIX_FMT_RAW_CSI2_14 ('RACE'), V4L2_PIX_FMT_RAW_16 ('RAWG'), V4L2_PIX_FMT_RAW_CSI2_20 ('RACK'), V4L2_PIX_FMT_RAW_24 ('RAWO'), V4L2_PIX_FMT_RAW_CSI2_28 ('RACS')
> +************************************************************************************************************************************************************************************************************************************************************************************
> +

Shouldn't this file be referenced in
Documentation/userspace-api/media/v4l/pixfmt.rst
?

> +
> +Generic line-based image data formats
> +
> +
> +Description
> +===========
> +
> +These generic raw image data formats define the memory layout of the data
> +without defining the order of the pixels in the format or even the CFA (Colour

I would rather use the

"without defining the order of the color components"

Whatever you like the most, I would however not mention CFA, even I
understand the internal image pad represents the sensor's pixel array.

> +Filter Array) itself. These formats may only be used with a Media Controller
> +pipeline where the more specific format is reported by an :ref:`internal sink
> +pad <MEDIA-PAD-FL-INTERNAL>` of the source sub-device. See also :ref:`source
> +routes <subdev-routing>`.

I'm surprised, I thought we were going to express the bayer pattern
ordering using a control, like we're now doing for the
metadata-specific format. Not bothered by this, just wondering if I
missed anything from our previous discussions and from the media
summit conclusions:

[ANN] Media Summit 2025 Report
 <21769183-ca57-4f8f-818a-6a1ad089298d@jjverkuil.nl>

> +
> +.. _v4l2-pix-fmt-raw-8:
> +
> +V4L2_PIX_FMT_RAW_8
> +------------------
> +
> +The V4L2_PIX_FMT_GENERIC_8 format is a plain 8-bit raw pixel data format. This
> +format is used on CSI-2 for 8 bits per :term:`Data Unit`.
> +
> +**Byte Order Of V4L2_PIX_FMT_RAW_8.**
> +Each cell is one byte. "P" denotes a pixel.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|
> +
> +.. flat-table:: Sample 4x2 Image Frame
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8
> +
> +    * - start + 0:
> +      - P\ :sub:`00`
> +      - P\ :sub:`10`
> +      - P\ :sub:`20`
> +      - P\ :sub:`30`
> +    * - start + 4:
> +      - P\ :sub:`01`
> +      - P\ :sub:`11`
> +      - P\ :sub:`21`
> +      - P\ :sub:`31`
> +
> +.. _v4l2-pix-fmt-raw-csi2-10:
> +
> +V4L2_PIX_FMT_RAW_CSI2_10
> +------------------------
> +
> +V4L2_PIX_FMT_RAW_CSI2_10 contains 10-bit packed image data, with four bytes
> +containing the top 8 bits of the pixels followed by lowest 2 bits of the pixels
> +packed into one byte. This format is typically used by CSI-2 receivers with
> +a source that transmits MEDIA_BUS_FMT_RAW_10 and the CSI-2 receiver writes the
> +received data to memory as-is.
> +
> +The packing of the data follows the MIPI CSI-2 specification.
> +
> +This format is little endian.
> +
> +**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_10.**
> +Each cell is one byte. "P" denotes a pixel.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|
> +
> +.. flat-table:: Sample 4x2 Image Frame
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8
> +
> +    * - start + 0:
> +      - P\ :sub:`00 bits 9--2`
> +      - P\ :sub:`10 bits 9--2`
> +      - P\ :sub:`20 bits 9--2`
> +      - P\ :sub:`30 bits 9--2`
> +      - P\ :sub:`00 bits 1--0` (bits 1--0)
> +        P\ :sub:`10 bits 1--0` (bits 3--2)
> +        P\ :sub:`20 bits 1--0` (bits 5--4)
> +        P\ :sub:`30 bits 1--0` (bits 7--6)
> +    * - start + 5:
> +      - P\ :sub:`01 bits 9--2`
> +      - P\ :sub:`11 bits 9--2`
> +      - P\ :sub:`21 bits 9--2`
> +      - P\ :sub:`31 bits 9--2`
> +      - P\ :sub:`01 bits 1--0` (bits 1--0)
> +        P\ :sub:`11 bits 1--0` (bits 3--2)
> +        P\ :sub:`21 bits 1--0` (bits 5--4)
> +        P\ :sub:`31 bits 1--0` (bits 7--6)
> +
> +.. _v4l2-pix-fmt-raw-csi2-12:
> +
> +V4L2_PIX_FMT_RAW_CSI2_12
> +------------------------
> +
> +V4L2_PIX_FMT_RAW_CSI2_12 contains 12-bit packed image data, with two bytes
> +containing the top 8 bits of the pixels followed by lowest 4 bits of the pixels
> +packed into 1 byte. This format is typically used by CSI-2 receivers with
> +a source that transmits MEDIA_BUS_FMT_RAW_12 and the CSI-2 receiver writes the
> +received data to memory as-is.
> +
> +The packing of the data follows the MIPI CSI-2 specification.
> +
> +This format is little endian.
> +
> +**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_12.**
> +Each cell is one byte. "P" denotes a pixel.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|
> +
> +.. flat-table:: Sample 4x2 Image Frame
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8 8
> +
> +    * - start + 0:
> +      - P\ :sub:`00 bits 11--4`
> +      - P\ :sub:`10 bits 11--4`
> +      - P\ :sub:`00 bits 3--0` (bits 3--0)
> +        P\ :sub:`10 bits 3--0` (bits 7--4)
> +      - P\ :sub:`20 bits 11--4`
> +      - P\ :sub:`30 bits 11--4`
> +      - P\ :sub:`20 bits 3--0` (bits 3--0)
> +        P\ :sub:`30 bits 3--0` (bits 7--4)
> +    * - start + 6:
> +      - P\ :sub:`01 bits 11--4`
> +      - P\ :sub:`11 bits 11--4`
> +      - P\ :sub:`01 bits 3--0` (bits 3--0)
> +        P\ :sub:`11 bits 3--0` (bits 7--4)
> +      - P\ :sub:`21 bits 11--4`
> +      - P\ :sub:`31 bits 11--4`
> +      - P\ :sub:`21 bits 3--0` (bits 3--0)
> +        P\ :sub:`31 bits 3--0` (bits 7--4)
> +
> +.. _v4l2-pix-fmt-raw-csi2-14:
> +
> +V4L2_PIX_FMT_RAW_CSI2_14
> +------------------------
> +
> +V4L2_PIX_FMT_RAW_CSI2_14 contains 14-bit packed image data, with four bytes
> +containing the top 8 bits of the pixels followed by lowest 6 bits of the pixels
> +packed into three bytes. This format is typically used by CSI-2 receivers with a
> +source that transmits MEDIA_BUS_FMT_RAW_14 and the CSI-2 receiver writes the
> +received data to memory as-is.
> +
> +The packing of the data follows the MIPI CSI-2 specification.
> +
> +This format is little endian.
> +
> +**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_14.**
> +Each cell is one byte. "P" denotes a pixel.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|p{1.8cm}|p{1.8cm}|
> +
> +.. flat-table:: Sample 4x2 Image Frame
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8 8 8
> +
> +    * - start + 0:
> +      - P\ :sub:`00 bits 13--6`
> +      - P\ :sub:`10 bits 13--6`
> +      - P\ :sub:`20 bits 13--6`
> +      - P\ :sub:`30 bits 13--6`
> +      - P\ :sub:`10 bits 1--0` (bits 7--6)
> +        P\ :sub:`00 bits 5--0` (bits 5--0)
> +      - P\ :sub:`20 bits 3--0` (bits 7--4)
> +        P\ :sub:`10 bits 5--2` (bits 3--0)
> +      - P\ :sub:`30 bits 5--0` (bits 7--2)
> +        P\ :sub:`20 bits 5--4` (bits 1--0)
> +    * - start + 7:
> +      - P\ :sub:`01 bits 13--6`
> +      - P\ :sub:`11 bits 13--6`
> +      - P\ :sub:`21 bits 13--6`
> +      - P\ :sub:`31 bits 13--6`
> +      - P\ :sub:`11 bits 1--0` (bits 7--6)
> +        P\ :sub:`01 bits 5--0` (bits 5--0)
> +      - P\ :sub:`21 bits 3--0` (bits 7--4)
> +        P\ :sub:`11 bits 5--2` (bits 3--0)
> +      - P\ :sub:`31 bits 5--0` (bits 7--2)
> +        P\ :sub:`21 bits 5--4` (bits 1--0)
> +
> +.. _v4l2-pix-fmt-raw-16:
> +
> +V4L2_PIX_FMT_RAW_16
> +-------------------
> +
> +V4L2_PIX_FMT_RAW_16 contains 16-bit image data, with each two consecutive
> +bytes forming a pixel value. This format is typically used by CSI-2 receivers
> +with a source that transmits MEDIA_BUS_FMT_RAW_16 and the CSI-2 receiver writes
> +the received data to memory as-is.
> +
> +The packing of the data follows the MIPI CSI-2 specification.
> +
> +This format is little endian.
> +
> +**Byte Order Of V4L2_PIX_FMT_RAW_16.**
> +Each cell is one byte. "P" denotes a pixel.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|
> +
> +.. flat-table:: Sample 4x2 Image Frame
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8 8 8 8
> +
> +    * - start + 0:
> +      - P\ :sub:`00 bits 15--8`
> +      - P\ :sub:`00 bits 7--0`
> +      - P\ :sub:`10 bits 15--8`
> +      - P\ :sub:`10 bits 7--0`
> +      - P\ :sub:`20 bits 15--8`
> +      - P\ :sub:`20 bits 7--0`
> +      - P\ :sub:`30 bits 15--8`
> +      - P\ :sub:`30 bits 7--0`
> +    * - start + 8:
> +      - P\ :sub:`01 bits 15--8`
> +      - P\ :sub:`01 bits 7--0`
> +      - P\ :sub:`11 bits 15--8`
> +      - P\ :sub:`11 bits 7--0`
> +      - P\ :sub:`21 bits 15--8`
> +      - P\ :sub:`21 bits 7--0`
> +      - P\ :sub:`31 bits 15--8`
> +      - P\ :sub:`31 bits 7--0`
> +
> +.. _v4l2-pix-fmt-raw-csi2-20:
> +
> +V4L2_PIX_FMT_RAW_CSI2_20
> +------------------------

I can't validate the following format match the csi2 spec as they're
not there in the version I have access to :)

They seem however correct to me!
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> +
> +V4L2_PIX_FMT_RAW_CSI2_20 contains 20-bit packed image data, with four bytes
> +containing the top 8 bits of two pixels followed by lowest 4 bits of the pixels
> +packed into one byte. This format is typically used by CSI-2 receivers with a
> +source that transmits MEDIA_BUS_FMT_RAW_20 and the CSI-2 receiver writes the
> +received data to memory as-is.
> +
> +The packing of the data follows the MIPI CSI-2 specification.
> +
> +This format is little endian.
> +
> +**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_20.**
> +Each cell is one byte. "P" denotes a pixel.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.8cm}
> +
> +.. flat-table:: Sample 4x2 Image Frame
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8 8 8 8 8 8
> +
> +    * - start + 0:
> +      - P\ :sub:`00 bits 19--12`
> +      - P\ :sub:`00 bits 11--4`
> +      - P\ :sub:`10 bits 19--12`
> +      - P\ :sub:`10 bits 11--4`
> +      - P\ :sub:`10 bits 3--0` (bits 7--4)
> +        P\ :sub:`00 bits 3--0` (bits 3--0)
> +      - P\ :sub:`20 bits 19--12`
> +      - P\ :sub:`20 bits 11--4`
> +      - P\ :sub:`30 bits 19--12`
> +      - P\ :sub:`30 bits 11--4`
> +      - P\ :sub:`30 bits 3--0` (bits 7--4)
> +        P\ :sub:`20 bits 3--0` (bits 3--0)
> +    * - start + 10:
> +      - P\ :sub:`01 bits 19--12`
> +      - P\ :sub:`01 bits 11--4`
> +      - P\ :sub:`11 bits 19--12`
> +      - P\ :sub:`11 bits 11--4`
> +      - P\ :sub:`11 bits 3--0` (bits 7--4)
> +        P\ :sub:`01 bits 3--0` (bits 3--0)
> +      - P\ :sub:`21 bits 19--12`
> +      - P\ :sub:`21 bits 11--4`
> +      - P\ :sub:`31 bits 19--12`
> +      - P\ :sub:`31 bits 11--4`
> +      - P\ :sub:`31 bits 3--0` (bits 7--4)
> +        P\ :sub:`21 bits 3--0` (bits 3--0)
> +
> +.. _v4l2-pix-fmt-raw-24:
> +
> +V4L2_PIX_FMT_RAW_24
> +-------------------
> +
> +V4L2_PIX_FMT_RAW_24 contains 24-bit packed image data, with each three bytes
> +containing the value of one pixel. This format is typically used by CSI-2
> +receivers with a source that transmits MEDIA_BUS_FMT_RAW_24 and the CSI-2
> +receiver writes the received data to memory as-is.
> +
> +The packing of the data follows the MIPI CSI-2 specification.
> +
> +This format is little endian.
> +
> +**Byte Order Of V4L2_PIX_FMT_RAW_24.**
> +Each cell is one byte. "P" denotes a pixel.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|p{1.2cm}|p{.8cm}|p{.8cm}|
> +
> +.. flat-table:: Sample 4x2 Image Frame
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8 8 8 8 8 8 8 8
> +
> +    * - start + 0:
> +      - P\ :sub:`00 bits 23--16`
> +      - P\ :sub:`00 bits 15--8`
> +      - P\ :sub:`00 bits 7--0`
> +      - P\ :sub:`10 bits 23--16`
> +      - P\ :sub:`10 bits 15--8`
> +      - P\ :sub:`10 bits 7--0`
> +      - P\ :sub:`20 bits 23--16`
> +      - P\ :sub:`20 bits 15--8`
> +      - P\ :sub:`20 bits 7--0`
> +      - P\ :sub:`30 bits 23--16`
> +      - P\ :sub:`30 bits 15--8`
> +      - P\ :sub:`30 bits 7--0`
> +    * - start + 12:
> +      - P\ :sub:`01 bits 23--16`
> +      - P\ :sub:`01 bits 15--8`
> +      - P\ :sub:`01 bits 7--0`
> +      - P\ :sub:`11 bits 23--16`
> +      - P\ :sub:`11 bits 15--8`
> +      - P\ :sub:`11 bits 7--0`
> +      - P\ :sub:`21 bits 23--16`
> +      - P\ :sub:`21 bits 15--8`
> +      - P\ :sub:`21 bits 7--0`
> +      - P\ :sub:`31 bits 23--16`
> +      - P\ :sub:`31 bits 15--8`
> +      - P\ :sub:`31 bits 7--0`
> +
> +.. _v4l2-pix-fmt-raw-csi2-28:
> +
> +V4L2_PIX_FMT_RAW_CSI2_28
> +------------------------
> +
> +V4L2_PIX_FMT_RAW_CSI2_28 contains 28-bit packed image data, with four bytes
> +containing the top 8 bits of two pixels followed by lowest 4 bits of the pixels
> +packed into one byte. This format is typically used by CSI-2 receivers with a
> +source that transmits MEDIA_BUS_FMT_RAW_28 and the CSI-2 receiver writes the
> +received data to memory as-is.
> +
> +The packing of the data follows the MIPI CSI-2 specification.
> +
> +This format is little endian.
> +
> +**Byte Order Of V4L2_PIX_FMT_RAW_CSI2_28.**
> +Each cell is one byte. "P" denotes a pixel.
> +
> +.. tabularcolumns:: |p{2.4cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}|p{1.2cm}
> +
> +.. flat-table:: Sample 4x2 Image Frame
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 8 8 8 8 8 8 8 8 8 8 8 8 8 8
> +
> +    * - start + 0:
> +      - P\ :sub:`00 bits 27--20`
> +      - P\ :sub:`00 bits 13--6`
> +      - P\ :sub:`10 bits 27--20`
> +      - P\ :sub:`10 bits 13--6`
> +      - P\ :sub:`00 bits 19--14`
> +	P\ :sub:`00 bits 1--0`
> +      - P\ :sub:`00 bits 5--2`
> +	P\ :sub:`10 bits 17--14`
> +      - P\ :sub:`10 bits 19--18`
> +	P\ :sub:`10 bits 5--0`
> +      - P\ :sub:`20 bits 27--20`
> +      - P\ :sub:`20 bits 13--6`
> +      - P\ :sub:`30 bits 27--20`
> +      - P\ :sub:`30 bits 13--6`
> +      - P\ :sub:`20 bits 19--14`
> +	P\ :sub:`20 bits 1--0`
> +      - P\ :sub:`20 bits 5--2`
> +	P\ :sub:`30 bits 17--14`
> +      - P\ :sub:`30 bits 19--18`
> +	P\ :sub:`30 bits 5--0`
> +    * - start + 14:
> +      - P\ :sub:`01 bits 27--20`
> +      - P\ :sub:`01 bits 13--6`
> +      - P\ :sub:`11 bits 27--20`
> +      - P\ :sub:`11 bits 13--6`
> +      - P\ :sub:`01 bits 19--14`
> +	P\ :sub:`01 bits 1--0`
> +      - P\ :sub:`01 bits 5--2`
> +	P\ :sub:`11 bits 17--14`
> +      - P\ :sub:`11 bits 19--18`
> +	P\ :sub:`11 bits 5--0`
> +      - P\ :sub:`21 bits 27--20`
> +      - P\ :sub:`21 bits 13--6`
> +      - P\ :sub:`31 bits 27--20`
> +      - P\ :sub:`31 bits 13--6`
> +      - P\ :sub:`21 bits 19--14`
> +	P\ :sub:`21 bits 1--0`
> +      - P\ :sub:`21 bits 5--2`
> +	P\ :sub:`31 bits 17--14`
> +      - P\ :sub:`31 bits 19--18`
> +	P\ :sub:`31 bits 5--0`
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Documentation/userspace-api/media/v4l/pixfmt.rst
> index 11dab4a90630..d917190c717d 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
> @@ -25,6 +25,7 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
>      pixfmt-indexed
>      pixfmt-rgb
>      pixfmt-bayer
> +    pixfmt-raw-generic
>      yuv-formats
>      hsv-formats
>      depth-formats
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 9e3b366d5fc7..855cbe2a97d8 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -745,6 +745,16 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR.. BGBG.. */
>  #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG.. GBGB.. */
>
> +/* Generic CSI-2 packed raw pixel formats */
> +#define V4L2_PIX_FMT_RAW_8 v4l2_fourcc('R', 'A', 'W', '8')
> +#define V4L2_PIX_FMT_RAW_CSI2_10 v4l2_fourcc('R', 'A', 'C', 'A')
> +#define V4L2_PIX_FMT_RAW_CSI2_12 v4l2_fourcc('R', 'A', 'C', 'C')
> +#define V4L2_PIX_FMT_RAW_CSI2_14 v4l2_fourcc('R', 'A', 'C', 'E')
> +#define V4L2_PIX_FMT_RAW_16 v4l2_fourcc('R', 'A', 'W', 'G')
> +#define V4L2_PIX_FMT_RAW_CSI2_20 v4l2_fourcc('R', 'A', 'C', 'K')
> +#define V4L2_PIX_FMT_RAW_24 v4l2_fourcc('R', 'A', 'W', 'O')
> +#define V4L2_PIX_FMT_RAW_CSI2_28 v4l2_fourcc('R', 'A', 'C', 'S')
> +
>  /* HSV formats */
>  #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
>  #define V4L2_PIX_FMT_HSV32 v4l2_fourcc('H', 'S', 'V', '4')
> --
> 2.39.5
>
>

