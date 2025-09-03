Return-Path: <linux-media+bounces-41705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 531C5B4238D
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 16:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A98A18977BF
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDD53112D2;
	Wed,  3 Sep 2025 14:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LiKN5RGi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FB130DD3A
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 14:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909534; cv=none; b=meVgNHpcRcLflLuSUirs1QBumyXQo9aSYxs/j/9CXKQhZ1NkiD7QSV+//E/CgMqvbM8AsA/dXoWu4yp8C2kbYVuB8jcQn+Mqj7cfN+ybZRenWefZhm2VV/mDyycOFWbTgyVy/f7DjdvRH2/Rw3iMPxPDc2DLrsxG+ok9/WbqKm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909534; c=relaxed/simple;
	bh=HnOBAWDnn9u/oQCRwiaXOP1ENjMTBRo1ljPs9fneqZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzJ4juTpBn4CohidKET6w9aI6nPHENznaIklPfiWYd6QiwRJcOx2L5g8ERd9ZWJ2e7IkO6zNRF51ojj9LA9N3jnDNNab5udUpFmrgPW6ROPwsud2HI5MRBwBhv3S5YMO8CPtwLEjG8pHZ9wTGXBnh0/NWBpZ4Gq45pCH0kjNZ3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LiKN5RGi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6FBC08BF;
	Wed,  3 Sep 2025 16:24:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756909461;
	bh=HnOBAWDnn9u/oQCRwiaXOP1ENjMTBRo1ljPs9fneqZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LiKN5RGiyGaC2anH5p+KdFhvPlkwkWJPNnjwamceG9jfOUdDKAJjY2oHsn7+l3vzX
	 jaYL63boTmrGaUr/M2ljQnTh9lEEHUK0B3Pp2JVyB6s/oTT7yGRpWpSZUziSnYRYqU
	 qVtNIHQYQnL5Gc5m54yDorH7ve4LZwpkvL821Fw8=
Date: Wed, 3 Sep 2025 16:25:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
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
Subject: Re: [PATCH v11 16/66] media: Documentation: Reference color pattern
 control in format docs
Message-ID: <20250903142509.GK3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-17-sakari.ailus@linux.intel.com>
 <6ebtnjvazvjinprgp5ejdj5otknubr2lkdth7w72kybygwlowi@ejbr4ot7stum>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6ebtnjvazvjinprgp5ejdj5otknubr2lkdth7w72kybygwlowi@ejbr4ot7stum>

On Mon, Sep 01, 2025 at 03:51:21PM +0200, Jacopo Mondi wrote:
> On Mon, Aug 25, 2025 at 12:50:17PM +0300, Sakari Ailus wrote:
> > Refer to the color pattern control in the generic raw pixelformat
> > documentation.
> 
> Either move this after patch #19 that introduces the control, or
> squash it with #15 that introduce the generic RAW pixel format

Agreed, this should go after the introduction of the control.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Either ways
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> > index 9fda7a36cd3a..034d4f3e0499 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-raw-generic.rst
> > @@ -13,7 +13,10 @@ Description
> >
> >  These generic raw image data formats define the memory layout of the data
> >  without defining the order of the pixels in the format or even the CFA (Colour
> > -Filter Array) itself. See also :ref:`source routes <subdev-routing>`.
> > +Filter Array) itself. These formats may only be used with a Media Controller
> > +pipeline where the more specific format is reported by the
> > +:ref:`V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>` control on
> > +the source sub-device. See also :ref:`source routes <subdev-routing>`.
> >
> >  .. _v4l2-pix-fmt-raw-8:
> >

-- 
Regards,

Laurent Pinchart

