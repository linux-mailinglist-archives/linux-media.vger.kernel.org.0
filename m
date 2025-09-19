Return-Path: <linux-media+bounces-42796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CACB894DC
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 13:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0ECA5160FDC
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 11:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3BE306B3D;
	Fri, 19 Sep 2025 11:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hiMSOpMR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0B7199934
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 11:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758282382; cv=none; b=Grkpx3NngXnJlq4TNeweES1gjy010Kg8QlJCx+tUaN5Vlyj+mWWdc2tDwpsEJ6OVjS//Q88QJHTb/iMfktKP4U2bqBitsmqN4vwSgIjGvLjKXC3juiRd651QdEMKrS3u2jM/SPhV2Ra0KUpDdGrkJX/bHZjFBZLlCMF5GKvSUSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758282382; c=relaxed/simple;
	bh=0aTp25XsT3JdXKEtcLovCy8sIzc8eoNAIW3+/u2rJeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovn3KXb+0a/lRY5sZ4apc15q83A0fDE8tajUVNCW5UuxQds6buQiNBSjOkMnXLKySduA4OHkGrD/sccT/z0nyKQu4hT7fd2YfoIRaq4y183EESxIl76NVcwfqA2a1Hln4Lxsr6qgB66hVhuWLHXYCG0wOQS2bgV8pO2IUcKsui4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hiMSOpMR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758282379; x=1789818379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0aTp25XsT3JdXKEtcLovCy8sIzc8eoNAIW3+/u2rJeM=;
  b=hiMSOpMR6KHMVb3Te7HViN3yy0jh3C18QaqI/ylYSGbkOkdLsjhOYs/3
   VSLJPHXXodwygeereU+pkq0hhfGzo0Ad3TJLFUwvp/RvnM3XwGnzJz4ah
   6zj6ANzp71Jn+tUmkh8kL0UACiYezqUydfTdRBMhQK4FTzD8I8ZOCrdRy
   0Gkle9/XA5tgMEmmN6oBk0QeKz9rjCflMJRpTux1OoALodQv2yUip/+43
   8plrogwhguwnxpv45yDNyNdOUO8t+t7rpO3DTXyLa2XKzzHfakD0sKcxE
   rfPhReBsaTTETH+WU5ra5lwYVV+2+3ZNa277/PDrUwsJW4NXdzZvZColl
   g==;
X-CSE-ConnectionGUID: a5fDykwgRiWZeU8dyN8IjQ==
X-CSE-MsgGUID: ux2eoKmCRveHzpcKPlIWrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="72056704"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="72056704"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 04:46:18 -0700
X-CSE-ConnectionGUID: Kkmx7c2ZSI6cehvMauGNDw==
X-CSE-MsgGUID: Jaqt5mWoS0enG8lT79Ca7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="206574622"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.108])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 04:46:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CD25D11F982;
	Fri, 19 Sep 2025 14:46:08 +0300 (EEST)
Date: Fri, 19 Sep 2025 14:46:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 26/66] media: Documentation: Document embedded data
 guidelines for camera sensors
Message-ID: <aM1CgGRceRwqvL5q@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-27-sakari.ailus@linux.intel.com>
 <wsa4s2ele6nejp5jcca5ny44oerwxdnyjn2ggxu6e2x5yqlm4g@vihn6rrtdnkg>
 <aLhEiMQSp23ZCffK@kekkonen.localdomain>
 <20250903204059.GW3648@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903204059.GW3648@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Sep 03, 2025 at 10:40:59PM +0200, Laurent Pinchart wrote:
> On Wed, Sep 03, 2025 at 04:37:12PM +0300, Sakari Ailus wrote:
> > On Mon, Sep 01, 2025 at 06:42:33PM +0200, Jacopo Mondi wrote:
> > > On Mon, Aug 25, 2025 at 12:50:27PM +0300, Sakari Ailus wrote:
> > > > Document how embedded data support should be implemented for camera
> > > > sensors, and when and how CCS embedded data layout should be referenced.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Reviewed-by: Julien Massot <julien.massot@collabora.com>
> > > > ---
> > > >  .../media/drivers/camera-sensor.rst           | 20 +++++++++++++++++++
> > > >  1 file changed, 20 insertions(+)
> > > >
> > > > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > > index a8e0e4accbc9..a719c6f88f11 100644
> > > > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > > @@ -117,3 +117,23 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
> > > >  values programmed by the register sequences. The default values of these
> > > >  controls shall be 0 (disabled). Especially these controls shall not be inverted,
> > > >  independently of the sensor's mounting rotation.
> > > > +
> > > > +Embedded data
> > > > +-------------
> > > > +
> > > > +Many sensors, mostly raw sensors, support embedded data which is used to convey
> > > > +the sensor configuration for the captured frame back to the host. While CSI-2 is
> > > > +the most common data interface used by such sensors, embedded data can be
> > > > +available on other interfaces as well.
> > > > +
> > > > +Embedded data support is indicated by the presence of an internal sink pad (pad
> > > > +that has both the ``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and
> > > > +``MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`` flags set) with a metadata
> > > 
> > > These are rendered as verbatim text, not links
> > 
> > Will fix for v12.
> > 
> > > > +format to model the embedded data stream. If the sub-device driver supports
> > > > +disabling embedded data, this can be done by disabling the embedded data route
> > > > +via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
> > > > +
> > > > +In general, changing the embedded data layout from the driver-configured values
> > > > +is not supported. The height of the metadata is device-specific and the width
> > > > +is that (or less of that) of the image width, as configured on the pixel data
> > > 
> > > s/is that (or less of that) of/is the same (or smaller) than/
> > > 
> > > reads better in my possibily broke English
> > 
> > How about:
> > 
> > The height of the metadata is device-specific and equal to or less than the
> > image width, as configured on the pixel data stream.
> 
> That doesn't sound right. "The *height* is [...] than the image
> *width*". I'll give it a try:
> 
> ----
> In general, changing the embedded data layout from the driver-configured
> values is not supported. The height of the metadata is typically a small
> fixed device-specific value, and the width is equal to the image width,
> as configured on the pixel data.
> ----
> 
> That drops the "or less" though. When is the embedded data width smaller
> than the image data width, and is it configurable in that case, or does
> it have a fixed value that depends on the image data width ?

The text is fine but I think we should add "or less". E.g. the ov2740
embedded data lines are shorter than the image and that is also common
elsewhere, too.

I used this:

In general, changing the embedded data layout from the driver-configured values
is not supported. The height of the metadata is device-specific and equal to or
less than the image width, as configured on the pixel data stream.


-- 
Regards,

Sakari Ailus

