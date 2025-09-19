Return-Path: <linux-media+bounces-42802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DF0B8981F
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 14:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27E561C28AD8
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 12:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95843218596;
	Fri, 19 Sep 2025 12:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzeU/vxo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06D81FBEB9
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 12:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758285772; cv=none; b=Ngf4IQccO6qvyTLZOV39aaSjGMpWNreUTur0JtwCS8cJBfvIn+wqe9I/wMaF+p6CyGrXJa31CJGIy2vjDJfv6oi4PuTyDVNXqwdC9J0F5J45u4M1wzuFjyBcb/NFONNckFUcr49Ci3qAcBIChOhdjJZwrogHsWbEZHXX/ovBv+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758285772; c=relaxed/simple;
	bh=5As/2xUtvcMJen3HcRZfrMVMbZqOrbqA90eE+HMNo2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUzHZH2Rt0yLdf25xVSiznMw6JZnTClmNRxzkZCpssjRLgIkns/gFNQe7tDoLhATDc6I/TjJl+xu6/2muvSfBHHx4CRVLCyL5Bql94rn31p4tmheEii4z87oSOQL/C4ZI4Tdhm6Zo3QMK04c9cwkj8EyfV0f2ydqcli0HmvPJCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JzeU/vxo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758285770; x=1789821770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5As/2xUtvcMJen3HcRZfrMVMbZqOrbqA90eE+HMNo2U=;
  b=JzeU/vxomRUq13u6w1n6W5g5v8RWnNQZy3znh5GSTxgUOOVVWVkAPSRC
   P4G7ART/I/ytc/5509/wZocNX3twDrMVeV+eJl7cMIk2sohIO2j5D4JCe
   TYKfbal21StmaRAc/mCd2xSkC2kBU7UxbghNfnkrElSBwsJEDfjvepYiS
   +KawzyDwLl9pJUwOiK0Cy3hE0hVGMMDcVwfS9Q2XWbG4JseEcRKh2WPZf
   fSapWxdYVS7g+gLNPnKknxOm6lHXDI1ZTqt9urOZX1KPjmyLj9VRaliLN
   +ZAgmjwq8kLwpi0YXGk5KPvoxju0sGwCPfeNu++6UxjqBVIMj95gXtPRd
   Q==;
X-CSE-ConnectionGUID: /1L/iGp2ScabNmpT8iL7sw==
X-CSE-MsgGUID: k1ghg2UuR0CMswFWlKsTwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="48208592"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="48208592"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 05:42:49 -0700
X-CSE-ConnectionGUID: 7ejpOKuiQOCdrd/i2Avuag==
X-CSE-MsgGUID: MtKAqQUoRIGsYvl/FMR97Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="176635680"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.108])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 05:42:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9966911F95D;
	Fri, 19 Sep 2025 15:42:39 +0300 (EEST)
Date: Fri, 19 Sep 2025 15:42:39 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
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
Subject: Re: [PATCH v11 41/66] media: Documentation: Add scaling and
 post-scaler crop for common raw
Message-ID: <aM1Pv0oXpmw8sVn8@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-42-sakari.ailus@linux.intel.com>
 <mqouvw4ecezulohznuovrg4zcqcnugp6l77mdqqgogdawygu24@j5c3mgvf757x>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mqouvw4ecezulohznuovrg4zcqcnugp6l77mdqqgogdawygu24@j5c3mgvf757x>

Hi Jacopo,

On Mon, Sep 01, 2025 at 07:12:23PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Aug 25, 2025 at 12:50:42PM +0300, Sakari Ailus wrote:
> > Document scaling and post-scaler digital crop operations for the common
> > raw sensor model.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../media/v4l/subdev-config-model.rst         | 24 +++++++++++++++----
> >  1 file changed, 19 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > index 1e6c58931ea0..c1b9b74cbcef 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > @@ -139,11 +139,18 @@ sub-sampling to achieve the desired size.
> >
> >  The digital crop operation takes place after binning and sub-sampling. It is
> >  configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
> > -0/0. The resulting image size is further output by the sensor.
> > +0/0.
> > +
> > +The scaling operation is performed after the digital crop. It is configured by
> > +setting the ``V4L2_SEL_TGT_COMPOSE`` rectangle on (pad, stream) pair 0/0,
> > +relative to the digital crop.
> >
> >  The sensor's output mbus code is configured by setting the format on the (pad,
> > -stream) pair 0/0. When setting the format, always use the same width and height
> > -as for the digital crop setting.
> > +stream) pair 0/0. The width and height fields are used to configure post-scaler
> > +digital crop if supported by the driver, affecting the right and bottom edges of
> > +the frame. If post-scaler digital crop is not supported, the width and height
> > +fields of the format will match the compose rectangle sizes applied on the same
> > +0/0 (pad, stream) pair.
> >
> >  Drivers may only support some or even none of these configurations, in which
> >  case they do not expose the corresponding selection rectangles. If any selection
> > @@ -201,12 +208,19 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
> >        - X
> >        - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_COMPOSE``
> >          rectangle on (pad, stream) pair 1/0.
> > +    * - 0/0
> > +      - ``V4L2_SEL_TGT_COMPOSE``
> > +      - \-
> > +      - X
> > +      - Scaling. This rectangle is relative to the ``V4L2_SEL_TGT_CROP``
> > +        rectangle on (pad, stream) pair 0/0.
> >      * - 0/0
> >        - Format
> >        - X
> >        - X
> > -      - Image data source format. Always assign the width and height fields of
> > -        the format to the same values than for the ``V4L2_SEL_TGT_CROP``
> > +      - Image data source format and post-scaler crop. The width and height
> > +        fields of the format, used to configure post-scaler crop on the right
> > +        and bottom edges of the image, are related to the ``V4L2_SEL_TGT_COMPOSE``
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Why not squashing it with #40 that has just introduced the section you
> are here modifying ?

One of the matters that was open regarding this set was whether to include
scaling. I'm fine with squashing this patch once we conclude that.

> 
> >          rectangle on (pad, stream) pair 0/0. The media bus code reflects the
> >          pixel data output of the sensor.
> >      * - 0/1

-- 
Kind regards,

Sakari Ailus

