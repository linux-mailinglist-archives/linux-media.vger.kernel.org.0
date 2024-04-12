Return-Path: <linux-media+bounces-9219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 852438A3629
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 21:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4013328583B
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 19:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F2414F13D;
	Fri, 12 Apr 2024 19:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XgTk8cbI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2C71487CB
	for <linux-media@vger.kernel.org>; Fri, 12 Apr 2024 19:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712948878; cv=none; b=MLayKCeParx9opewJkBfWivBRNyjAZETaOCtLlyl7VdsyPYiiTynNykewp2ip3TDVShT2Z92SGIGr/4yeHGGORUBQdCUXFBNVf4IwR/CfMg06AZUWVoIp4cW3fOY3xSwbH70GTlTi+FFS2SCGC5TMYRD2sW28MuD/7XEauG0wTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712948878; c=relaxed/simple;
	bh=iBuwmavZMJ5jpcg8mNizkJ/zoPhJeyREETJcIjhK4kI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJGtZYl0LX0L8gA1Yex5ibSJnB3aVZ/oW5aNBAydiNOWnGn1EnVk+nWgWj7nr07N1PbttyKecZ7RpsoeAW4O2KG8YeD8l8XQ1ZuoDLNcH9KP2NdsLo3xyrjmHCvD/GNrqNFob9Dobq1lw4BOlrOznJB2znI2DToFX5vCfDfPX9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XgTk8cbI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-16-252-nat.elisa-mobile.fi [85.76.16.252])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E91CC9D5;
	Fri, 12 Apr 2024 21:07:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712948831;
	bh=iBuwmavZMJ5jpcg8mNizkJ/zoPhJeyREETJcIjhK4kI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgTk8cbI8ThLuCJGf33KEMnnDrD3qMeOmYuZovRl16iMUkwZzTNQ1A+NgqeA1hZf2
	 dVUAjAmECvHWBFAEiMwlzSOxRd5Uis+ecVEHD3IiYZgndaqCaaBvJwrHgWf/q1fWhw
	 pjSQtjK4AV/jIW8p3KbcRD4zVhkLyQ2iJyyxBYuA=
Date: Fri, 12 Apr 2024 22:07:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 23/38] media: uapi: ccs: Add media bus code for MIPI
 CCS embedded data
Message-ID: <20240412190746.GO31122@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-24-sakari.ailus@linux.intel.com>
 <20240321164914.GD9582@pendragon.ideasonboard.com>
 <Zhenr8ykPs9vlkh6@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zhenr8ykPs9vlkh6@kekkonen.localdomain>

Hi Sakari,

On Thu, Apr 11, 2024 at 09:04:47AM +0000, Sakari Ailus wrote:
> On Thu, Mar 21, 2024 at 06:49:14PM +0200, Laurent Pinchart wrote:
> > On Wed, Mar 13, 2024 at 09:25:01AM +0200, Sakari Ailus wrote:
> > > Add new MIPI CCS embedded data media bus code
> > > (MEDIA_BUS_FMT_CCS_EMBEDDED).
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../media/v4l/subdev-formats.rst              | 28 +++++++++++++++++++
> > >  include/uapi/linux/media-bus-format.h         |  3 ++
> > >  2 files changed, 31 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > index cbd475f7cae9..c8f982411e70 100644
> > > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > @@ -8564,3 +8564,31 @@ and finally the bit number in subscript. "X" indicates a padding bit.
> > >        - X
> > >        - X
> > >        - X
> > > +
> > > +.. _MEDIA-BUS-FMT-CCS-EMBEDDED:
> > > +
> > > +MIPI CCS Embedded Data Formats
> > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > +
> > > +`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines a
> > > +metadata format for sensor embedded data, which is used to store the register
> > > +configuration used for capturing a given frame. The format is defined in the CCS
> > > +specification. The media bus code for this format is
> > > +``MEDIA_BUS_FMT_CCS_EMBEDDED``.
> > > +
> > > +The CCS embedded data format definition includes three levels:
> > > +
> > > +1. Padding within CSI-2 bus :ref:`Data unit <media-glossary-data-unit>` as
> > 
> > s/Data unit/Data Unit/
> 
> Yes.
> 
> > > +   documented in the MIPI CCS specification.
> > > +
> > > +2. The tagged data format as documented in the MIPI CCS specification.
> > > +
> > > +3. Register addresses and register documentation as documented in the MIPI CCS
> > > +   specification.
> > > +
> > > +The format definition shall be used only by devices that fulfill all three
> > > +levels above.
> > 
> > Hmmmm... Do we need to mandate level 3 ? There are lots of sensors that
> > comply with the first two levels but have their own register set. Would
> > you like a sensor-specific embedded data format for each of them ? If
> > so, how would we document it without essentially copying the datasheet ?
> 
> You could refer to the datasheet if it's publicly available.

What if it's not ? How would you expect documentation to be organized ?
Will we then end up adding one media bus code per sensor ?

> The CCS static data format is meaningful only for accessing (level 1) and
> parsing (level 2) the data without knowing its meaning, which is the most
> important aspect. The user space will need to know the meaning of the data
> and can additionally select the same data unpacker than for CCS and
> possibly also the CCS data parser if applicable.
> 
> The user space should especially not have to have a list of CCS-compliant
> sensors which would become necessary, should we skip on the 3rd level
> requirement here.
> 
> > > +
> > > +This mbus code are only used for "2-byte simplified tagged data format" (code
> > > +0xa) but their use may be extended further in the future, to cover other CCS
> > > +embedded data format codes.
> > > diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> > > index d4c1d991014b..03f7e9ab517b 100644
> > > --- a/include/uapi/linux/media-bus-format.h
> > > +++ b/include/uapi/linux/media-bus-format.h
> > > @@ -183,4 +183,7 @@
> > >  #define MEDIA_BUS_FMT_META_20			0x8006
> > >  #define MEDIA_BUS_FMT_META_24			0x8007
> > >  
> > > +/* Specific metadata formats. Next is 0x9002. */
> > > +#define MEDIA_BUS_FMT_CCS_EMBEDDED		0x9001
> > > +
> > >  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */

-- 
Regards,

Laurent Pinchart

