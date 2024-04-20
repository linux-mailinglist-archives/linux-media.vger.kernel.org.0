Return-Path: <linux-media+bounces-9796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CCA8ABA37
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 10:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA9551C209B9
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 08:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D8413FFC;
	Sat, 20 Apr 2024 08:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eqW9X/3J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF92F205E31
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 08:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713600472; cv=none; b=evBaScBPsPDgxuCy843mn8eUQOL5h4zwD2uKWprvNFkU3Qk8k/NAEweyp3f6tiOr/NPXw3iv9Pw9eGxkz4SHzhO5nYBcysKrGcdQ1tq0563G0cN51jdVpxafp2Fk8L1J+hLsxtly+T30CZaO2rzbm/9exeaU+QKl/iWi4SmMqYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713600472; c=relaxed/simple;
	bh=VowHNFfw9WQNZe09iS2fmPJ58PSsIuNKWKZ3hNv5mTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGyHWomkCaa0fX7aaiDuKRTTBrFdjqf+HvWHWSUZgBa2TXWm4tHThYf//nPkWSD+AH2Zc9X0ThUuD+8vvRty7oz/gz8n07jBekNtovcKbIdD3ZZELEK+mE6chPSTTVtCvXsidh6ywdlzD/g19E40InktZ2YaE859bC+RPc3xbRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eqW9X/3J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F07AE2BC;
	Sat, 20 Apr 2024 10:06:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713600420;
	bh=VowHNFfw9WQNZe09iS2fmPJ58PSsIuNKWKZ3hNv5mTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eqW9X/3J1OpudejOC/4crpcaIdXiYo+RUl7rpiXkLeI/quP89wdSbrh2gr2l8a9Jx
	 TeMmr9K4XZYyw60ZCjumwHERxlK1PiD3SwvbGHFKxfCRr51ymPp5RMaj4/gQijv88l
	 TbvSxF6K/TWr3bhOusgFkZoiUyvixpCn7X1XYEtk=
Date: Sat, 20 Apr 2024 11:07:40 +0300
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
Message-ID: <20240420080740.GA15761@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-24-sakari.ailus@linux.intel.com>
 <20240321164914.GD9582@pendragon.ideasonboard.com>
 <Zhenr8ykPs9vlkh6@kekkonen.localdomain>
 <20240412190746.GO31122@pendragon.ideasonboard.com>
 <Zhu0ke6RA9PYfYZi@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zhu0ke6RA9PYfYZi@kekkonen.localdomain>

Hi Sakari,

On Sun, Apr 14, 2024 at 10:48:49AM +0000, Sakari Ailus wrote:
> On Fri, Apr 12, 2024 at 10:07:46PM +0300, Laurent Pinchart wrote:
> > On Thu, Apr 11, 2024 at 09:04:47AM +0000, Sakari Ailus wrote:
> > > On Thu, Mar 21, 2024 at 06:49:14PM +0200, Laurent Pinchart wrote:
> > > > On Wed, Mar 13, 2024 at 09:25:01AM +0200, Sakari Ailus wrote:
> > > > > Add new MIPI CCS embedded data media bus code
> > > > > (MEDIA_BUS_FMT_CCS_EMBEDDED).
> > > > > 
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > >  .../media/v4l/subdev-formats.rst              | 28 +++++++++++++++++++
> > > > >  include/uapi/linux/media-bus-format.h         |  3 ++
> > > > >  2 files changed, 31 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > > index cbd475f7cae9..c8f982411e70 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > > @@ -8564,3 +8564,31 @@ and finally the bit number in subscript. "X" indicates a padding bit.
> > > > >        - X
> > > > >        - X
> > > > >        - X
> > > > > +
> > > > > +.. _MEDIA-BUS-FMT-CCS-EMBEDDED:
> > > > > +
> > > > > +MIPI CCS Embedded Data Formats
> > > > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > > +
> > > > > +`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines a
> > > > > +metadata format for sensor embedded data, which is used to store the register
> > > > > +configuration used for capturing a given frame. The format is defined in the CCS
> > > > > +specification. The media bus code for this format is
> > > > > +``MEDIA_BUS_FMT_CCS_EMBEDDED``.
> > > > > +
> > > > > +The CCS embedded data format definition includes three levels:
> > > > > +
> > > > > +1. Padding within CSI-2 bus :ref:`Data unit <media-glossary-data-unit>` as
> > > > 
> > > > s/Data unit/Data Unit/
> > > 
> > > Yes.
> > > 
> > > > > +   documented in the MIPI CCS specification.
> > > > > +
> > > > > +2. The tagged data format as documented in the MIPI CCS specification.
> > > > > +
> > > > > +3. Register addresses and register documentation as documented in the MIPI CCS
> > > > > +   specification.
> > > > > +
> > > > > +The format definition shall be used only by devices that fulfill all three
> > > > > +levels above.
> > > > 
> > > > Hmmmm... Do we need to mandate level 3 ? There are lots of sensors that
> > > > comply with the first two levels but have their own register set. Would
> > > > you like a sensor-specific embedded data format for each of them ? If
> > > > so, how would we document it without essentially copying the datasheet ?
> > > 
> > > You could refer to the datasheet if it's publicly available.
> > 
> > What if it's not ? How would you expect documentation to be organized ?
> > Will we then end up adding one media bus code per sensor ?
> 
> Probably. The user space needs a way to find out what to expect. If a
> sensor produces its own custom metadata format, it needs to be documented.
> 
> There's also documentation for OV2740 embedded data in the set.

The OV2740 is a different case than what I had in mind. It uses level 1
of the CCS embedded data only, without using the CCS tagged format. The
documentation you've included in this patch series looks good to me.

For sensors that are compatible with CCS embedded data level 2, I'm not
sure how to proceed. Those sensors send (register, value) pairs in their
embedded data, but the register set is not CCS-compatible. Even when
documentation is available, it's hard to verify that the sensor will
never output the value of undocumented registers, as the registers
included in the embedded data may vary depending on the sensor
configuration.

How would you proceed in such cases ? I can try to write a sample
documentation patch, but I don't know what you expect. I'm thinking
about the IMX219 sensor for instance, but any sensor compatible with CCS
embedded data level 2 without a public datasheet is a good example.

-- 
Regards,

Laurent Pinchart

