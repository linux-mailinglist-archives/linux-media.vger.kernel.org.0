Return-Path: <linux-media+bounces-43530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16642BB2AA4
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 09:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0B5C3206AC
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 07:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1332877F2;
	Thu,  2 Oct 2025 07:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mLvQjPE/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB95239E81
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 07:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759389153; cv=none; b=LHH30nPaKFgSCsEXy9xxzroHRWehKoYpX5BolOUnbrghgbI9JLLGF3WMmTYkVVF3xoZ2hsKKjVetTtMwuj8G1FuMkiurweNSogmRvbnBfhwp0FPyA2MaiQB463uHIZaUnsvPEdbZasy52FCJRx7rX/uMQQuP9YHt2NXhIw6ZiYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759389153; c=relaxed/simple;
	bh=1gb/swripx3/MXiyUGDtjMa1SfvR17ce79MfPEEbrq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8q1IpndIFnRtImcYTdkz01dSbPmoL2o55ttDzSfbpP2lmk5QXpZk6QM4PdqvgUpA46nBmCo6yPy6YaZBcFyMervogU8/04x/WJh8RJarca9VoKNx2YAUtK03gU2IqI5fL/PaB5QhU+9ONB1HFjOgzwXQI6gPAUTgtJMUd6L9Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mLvQjPE/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759389151; x=1790925151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1gb/swripx3/MXiyUGDtjMa1SfvR17ce79MfPEEbrq4=;
  b=mLvQjPE/iggH9e91J2YAqH43GgesgC9i3swL5h0uNES5AGqr8WqIz6w0
   JEuufjX/iZ1BxcbB//IHNcyEVMZntsdoNQArDDCB8HMaHMGJuEDDInpCg
   9UIhOJ1n97/X/Iy3uV/gSVMqy27BwWicN0pZY3d5+gU5IEfebadNDkm/L
   tZQTkAhk8uBX4pjOfga5xsqLp4rRys0W0O/DJovIxcmF2vKjV1gv/Zc9q
   2pcenf4WUkgyPEzrK1qFzurtahcr0EqRXd71q1b73sfIHXMmG1U2ZgBdx
   PEOuQzMAiA766BmJYLjv/P/dG7KLXqfxpc/nIsm/87/10ys05xyrc6yAH
   g==;
X-CSE-ConnectionGUID: 9ZEIp4zPQnearRFyO4BtlA==
X-CSE-MsgGUID: ry9D1h1FR16OUfQtpe4qnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61585788"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61585788"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 00:12:30 -0700
X-CSE-ConnectionGUID: YGfV02wcSSiiNHv8iKFd/g==
X-CSE-MsgGUID: OvmL0KWGTyWMBPe1yfJung==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; 
   d="scan'208";a="179390720"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.175])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 00:12:24 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 71B86121096;
	Thu, 02 Oct 2025 10:12:21 +0300 (EEST)
Date: Thu, 2 Oct 2025 10:12:21 +0300
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
Message-ID: <aN4l1S6C8t2fenyJ@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-42-sakari.ailus@linux.intel.com>
 <mqouvw4ecezulohznuovrg4zcqcnugp6l77mdqqgogdawygu24@j5c3mgvf757x>
 <aM1Pv0oXpmw8sVn8@kekkonen.localdomain>
 <fgcmwxfbeavfv2m7gs36ck7rzsncfj2k27k7upb3rt6fyrxz5i@5mvd5mmdz3fn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fgcmwxfbeavfv2m7gs36ck7rzsncfj2k27k7upb3rt6fyrxz5i@5mvd5mmdz3fn>

Hi Jacopo,

On Thu, Sep 25, 2025 at 12:45:46PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Fri, Sep 19, 2025 at 03:42:39PM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Mon, Sep 01, 2025 at 07:12:23PM +0200, Jacopo Mondi wrote:
> > > Hi Sakari
> > >
> > > On Mon, Aug 25, 2025 at 12:50:42PM +0300, Sakari Ailus wrote:
> > > > Document scaling and post-scaler digital crop operations for the common
> > > > raw sensor model.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > >  .../media/v4l/subdev-config-model.rst         | 24 +++++++++++++++----
> > > >  1 file changed, 19 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > > index 1e6c58931ea0..c1b9b74cbcef 100644
> > > > --- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > > @@ -139,11 +139,18 @@ sub-sampling to achieve the desired size.
> > > >
> > > >  The digital crop operation takes place after binning and sub-sampling. It is
> > > >  configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
> > > > -0/0. The resulting image size is further output by the sensor.
> > > > +0/0.
> > > > +
> > > > +The scaling operation is performed after the digital crop. It is configured by
> > > > +setting the ``V4L2_SEL_TGT_COMPOSE`` rectangle on (pad, stream) pair 0/0,
> > > > +relative to the digital crop.
> > > >
> > > >  The sensor's output mbus code is configured by setting the format on the (pad,
> > > > -stream) pair 0/0. When setting the format, always use the same width and height
> > > > -as for the digital crop setting.
> > > > +stream) pair 0/0. The width and height fields are used to configure post-scaler
> > > > +digital crop if supported by the driver, affecting the right and bottom edges of
> > > > +the frame. If post-scaler digital crop is not supported, the width and height
> > > > +fields of the format will match the compose rectangle sizes applied on the same
> > > > +0/0 (pad, stream) pair.
> > > >
> > > >  Drivers may only support some or even none of these configurations, in which
> > > >  case they do not expose the corresponding selection rectangles. If any selection
> > > > @@ -201,12 +208,19 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
> > > >        - X
> > > >        - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_COMPOSE``
> > > >          rectangle on (pad, stream) pair 1/0.
> > > > +    * - 0/0
> > > > +      - ``V4L2_SEL_TGT_COMPOSE``
> > > > +      - \-
> > > > +      - X
> > > > +      - Scaling. This rectangle is relative to the ``V4L2_SEL_TGT_CROP``
> > > > +        rectangle on (pad, stream) pair 0/0.
> > > >      * - 0/0
> > > >        - Format
> > > >        - X
> > > >        - X
> > > > -      - Image data source format. Always assign the width and height fields of
> > > > -        the format to the same values than for the ``V4L2_SEL_TGT_CROP``
> > > > +      - Image data source format and post-scaler crop. The width and height
> > > > +        fields of the format, used to configure post-scaler crop on the right
> > > > +        and bottom edges of the image, are related to the ``V4L2_SEL_TGT_COMPOSE``
> > >
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > >
> > > Why not squashing it with #40 that has just introduced the section you
> > > are here modifying ?
> >
> > One of the matters that was open regarding this set was whether to include
> > scaling. I'm fine with squashing this patch once we conclude that.
> >
> 
> I recall there were discussion initially, but I don't remember the
> exact issue :)
> 
> Was it because this is feature rarely available and we just want to
> wait for more users to standardize on an API or was there something
> else I'm missing ?

It's rare. I'd like to have Laurent's opinion on this, too.

What's also possible is that we don't apply it now but only do so if we get
a device that benefits from it. It may well be we won't; only sensors I've
ever seen supporting this are CCS compliant and they won't use the common
raw sensor model.

-- 
Regards,

Sakari Ailus

