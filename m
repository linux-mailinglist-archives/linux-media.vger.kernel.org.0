Return-Path: <linux-media+bounces-41733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D851B42B2B
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 22:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 032CB173850
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 20:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D585936809C;
	Wed,  3 Sep 2025 20:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d8tQGjyH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9BE30E85E
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 20:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756932086; cv=none; b=fuTdmCAUUH654CghAaD1CIXnt2HmRmp1Nt/Sdat6KFLL8jvkNpizzUKY4xzOHQ3MXvIl4Z6IaovaBThXT8GFqobjunXlSfSr/53q+keEY/aSSZS+mkEwMd8iWoYvENyh4RwRf8iN1f4BqOx8SZYv+hcrghcsT9dWAf65Tkim+Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756932086; c=relaxed/simple;
	bh=TM+AjeSJ9frzjRFhfNwbjvVG6IvYrO5tXFUO6C2Kz0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kq6xFRnFnhdxgXzbKDu+N7cu8GPkGA65KqyjuV7HM5zuKnLg5FikMxdQMiu4lv9TXW0ZNtMdfvMaMsRX/kiVkwNVMLdGzUGlWvo3MAeD29iq3MXLIJSgIE+BL/mEZxQf8Cd+Nxr318yaQ7bG9lc9WI/6dmnsE75hLYke0b8m4s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d8tQGjyH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0A049928;
	Wed,  3 Sep 2025 22:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756932012;
	bh=TM+AjeSJ9frzjRFhfNwbjvVG6IvYrO5tXFUO6C2Kz0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d8tQGjyHyZTAquRO2hcqLTRzgbjF7Ln/yPcQk+A1qreGQ8Ya4uC4UBzIZtsifBQR/
	 u5WxYZBNgGppdPinJ+aIKFzXNYy75wlSMpgzh7/q9R+tPmrgTViNPBZcgwG1AmBHNX
	 AaK5wtPk06KRQEXIw7I6FN1bhBIeJqnNtyh2jdcw=
Date: Wed, 3 Sep 2025 22:40:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
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
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 26/66] media: Documentation: Document embedded data
 guidelines for camera sensors
Message-ID: <20250903204059.GW3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-27-sakari.ailus@linux.intel.com>
 <wsa4s2ele6nejp5jcca5ny44oerwxdnyjn2ggxu6e2x5yqlm4g@vihn6rrtdnkg>
 <aLhEiMQSp23ZCffK@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLhEiMQSp23ZCffK@kekkonen.localdomain>

On Wed, Sep 03, 2025 at 04:37:12PM +0300, Sakari Ailus wrote:
> On Mon, Sep 01, 2025 at 06:42:33PM +0200, Jacopo Mondi wrote:
> > On Mon, Aug 25, 2025 at 12:50:27PM +0300, Sakari Ailus wrote:
> > > Document how embedded data support should be implemented for camera
> > > sensors, and when and how CCS embedded data layout should be referenced.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by: Julien Massot <julien.massot@collabora.com>
> > > ---
> > >  .../media/drivers/camera-sensor.rst           | 20 +++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >
> > > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > index a8e0e4accbc9..a719c6f88f11 100644
> > > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > @@ -117,3 +117,23 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
> > >  values programmed by the register sequences. The default values of these
> > >  controls shall be 0 (disabled). Especially these controls shall not be inverted,
> > >  independently of the sensor's mounting rotation.
> > > +
> > > +Embedded data
> > > +-------------
> > > +
> > > +Many sensors, mostly raw sensors, support embedded data which is used to convey
> > > +the sensor configuration for the captured frame back to the host. While CSI-2 is
> > > +the most common data interface used by such sensors, embedded data can be
> > > +available on other interfaces as well.
> > > +
> > > +Embedded data support is indicated by the presence of an internal sink pad (pad
> > > +that has both the ``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and
> > > +``MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`` flags set) with a metadata
> > 
> > These are rendered as verbatim text, not links
> 
> Will fix for v12.
> 
> > > +format to model the embedded data stream. If the sub-device driver supports
> > > +disabling embedded data, this can be done by disabling the embedded data route
> > > +via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
> > > +
> > > +In general, changing the embedded data layout from the driver-configured values
> > > +is not supported. The height of the metadata is device-specific and the width
> > > +is that (or less of that) of the image width, as configured on the pixel data
> > 
> > s/is that (or less of that) of/is the same (or smaller) than/
> > 
> > reads better in my possibily broke English
> 
> How about:
> 
> The height of the metadata is device-specific and equal to or less than the
> image width, as configured on the pixel data stream.

That doesn't sound right. "The *height* is [...] than the image
*width*". I'll give it a try:

----
In general, changing the embedded data layout from the driver-configured
values is not supported. The height of the metadata is typically a small
fixed device-specific value, and the width is equal to the image width,
as configured on the pixel data.
----

That drops the "or less" though. When is the embedded data width smaller
than the image data width, and is it configurable in that case, or does
it have a fixed value that depends on the image data width ?

> > With the links fixed
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Thank you.

-- 
Regards,

Laurent Pinchart

