Return-Path: <linux-media+bounces-20075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB979AC06A
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 09:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDE121C23664
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 07:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF55154BFF;
	Wed, 23 Oct 2024 07:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QdKbNsg8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F110154457
	for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 07:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729668968; cv=none; b=cpnlx8G8UnUMpjvvrlt7+AlCjVm1+SyZMiZB8xvhFuE/LEx9Mhf9nJMcaCuaMuzoKXPjx288N8yEgN1PtgEc8t8o+a/grlI+nv7LJKEvOp+bTY+Psu6EVQljH4hShnDI80ahAQKs/6HDfbRO1xd2oSHJxgHOsKTzkAMnsdoMgNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729668968; c=relaxed/simple;
	bh=EjKi21UlXmMoJawi/R1H43YxPDSl+Snbc+3DmCaSRaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7ExEOsmn2gShxiOlrHKo3Csau9DdrOPFEU+IMV3HnWW5z0i4kirwUSmoOISz0xUMnJXMTcTAL1XRHqMp7VIRXJdxtGmN3HNAln/XpcMxgu2gEgc/HlwM82WXZu13I28CJ9nAvgnneYNBZ7U4DaaExUTd/TJwSDFkxMIb3gZm3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QdKbNsg8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D96C039F;
	Wed, 23 Oct 2024 09:34:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729668852;
	bh=EjKi21UlXmMoJawi/R1H43YxPDSl+Snbc+3DmCaSRaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QdKbNsg8sjX18IrP5lI3RXzpK2etJPWemaHCto8sSSI7UVzsbv9Y8HfZ35Q35tW3C
	 l5CuX+5PmHsTmvQzoLnTi1OnwjcgKc/x/d5wgpOUYj53BwAmYKjdWO0OOavuIEoHyS
	 LVJPuwDhvauM6pSWEoXGa/zBK4zmdVdZ1yhmYpjc=
Date: Wed, 23 Oct 2024 09:35:55 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com, 
	hongju.wang@intel.com, hverkuil@xs4all.nl, 
	Andrey Konovalov <andrey.konovalov@linaro.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dmitry Perchanov <dmitry.perchanov@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, 
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 27/46] media: uapi: ccs: Add media bus code for MIPI
 CCS embedded data
Message-ID: <hpm5l6yyms3dttdlaxxf6svqyezzzhtpz4p7mwmonfqpurc33u@bege2uxgljtc>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-28-sakari.ailus@linux.intel.com>
 <20240420081050.GP6414@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240420081050.GP6414@pendragon.ideasonboard.com>

Hi Sakari

On Sat, Apr 20, 2024 at 11:10:50AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
>
> Thank you for the patch.
>
> On Tue, Apr 16, 2024 at 10:33:00PM +0300, Sakari Ailus wrote:
> > Add new MIPI CCS embedded data media bus code
> > (MEDIA_BUS_FMT_CCS_EMBEDDED).
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Julien Massot <julien.massot@collabora.com>
>
> There's still an open question on how to document embedded data formats
> for sensors compatible with level 2 only. The discussion is ongoing and
> may affect this patch, but the changes can be implemented later, so
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> >  .../media/v4l/subdev-formats.rst              | 32 +++++++++++++++++++
> >  include/uapi/linux/media-bus-format.h         |  3 ++
> >  2 files changed, 35 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > index 0547f2733ee3..fa181ce8f48c 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > @@ -8316,6 +8316,10 @@ content is more or less device specific but the data is transmitted and received
> >  by multiple devices that do not process the data in any way, simply writing
> >  it to system memory for processing in software at the end of the pipeline.
> >
> > +The exact format of the data generated by the device is reported on the internal
> > +source pad of the originating sub-device, using one of the more specific

Do you mean "sink pad" ?

If I got this right:
SOURCE_PAD#0,stream#1 -> Generic metadata format
SINK_PAD#2,stream#0 -> Device specific metadata format

Thanks
  j

> > +metadata formats such as MEDIA_BUS_FMT_CCS_EMBEDDED.
> > +
> >  "b" in an array cell signifies a byte of data, followed by the number of the bit
> >  and finally the bit number in subscript. "x" indicates a padding bit.
> >
> > @@ -8562,3 +8566,31 @@ and finally the bit number in subscript. "x" indicates a padding bit.
> >        - x
> >        - x
> >        - x
> > +
> > +.. _MEDIA-BUS-FMT-CCS-EMBEDDED:
> > +
> > +MIPI CCS Embedded Data Formats
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines a
> > +metadata format for sensor embedded data, which is used to store the register
> > +configuration used for capturing a given frame. The format is defined in the CCS
> > +specification. The media bus code for this format is
> > +``MEDIA_BUS_FMT_CCS_EMBEDDED``.
> > +
> > +The CCS embedded data format definition includes three levels:
> > +
> > +1. Padding within CSI-2 bus :ref:`Data Unit <media-glossary-data-unit>` as
> > +   documented in the MIPI CCS specification.
> > +
> > +2. The tagged data format as documented in the MIPI CCS specification.
> > +
> > +3. Register addresses and register documentation as documented in the MIPI CCS
> > +   specification.
> > +
> > +The format definition shall be used only by devices that fulfill all three
> > +levels above.
> > +
> > +This mbus code are only used for "2-byte simplified tagged data format" (code
> > +0xa) but their use may be extended further in the future, to cover other CCS
> > +embedded data format codes.
> > diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> > index d4c1d991014b..03f7e9ab517b 100644
> > --- a/include/uapi/linux/media-bus-format.h
> > +++ b/include/uapi/linux/media-bus-format.h
> > @@ -183,4 +183,7 @@
> >  #define MEDIA_BUS_FMT_META_20			0x8006
> >  #define MEDIA_BUS_FMT_META_24			0x8007
> >
> > +/* Specific metadata formats. Next is 0x9002. */
> > +#define MEDIA_BUS_FMT_CCS_EMBEDDED		0x9001
> > +
> >  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
>
> --
> Regards,
>
> Laurent Pinchart
>

