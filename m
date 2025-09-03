Return-Path: <linux-media+bounces-41646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82145B419F7
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 11:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F37287A1401
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 09:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBAB2F0C71;
	Wed,  3 Sep 2025 09:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bam9Y+Ep"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF342F0C6A
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 09:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756891675; cv=none; b=aDJM5Lh1YrXIcJ3oBOwYojbQ8xyFnUnS7aIasevOU8Px9fywvYqPWfczc/ZqL5cAJvpZkvjR3PPcXJ6O7FkSi4+640CdUIM/bRyarRZU1s7YTCzkekI1IlrKbiDY9VmCEf9Wd5JOpxB9/vsksvC5j6tkW1+f1vFqUCxrCbJYzys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756891675; c=relaxed/simple;
	bh=joBhXf0h+AXef4RJn1LDxvbxDtd2kkVIaNrnF/9lHPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvXJuYdJUCvWpvPwMSLiPWTwbNzb0n63KgrTaxDU1uIdLaN4XnZ6hhTgQ5YVyTx5LXVgPvV9+A1G3qQWRP83ncDUUVCQnca09P0VnPER2R+0eVgEfsHX5OUioVwRk6H91FFmiu4J+jBQeCZRyW0bFgNa+UEyB597vQRzY0rnQDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bam9Y+Ep; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756891673; x=1788427673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=joBhXf0h+AXef4RJn1LDxvbxDtd2kkVIaNrnF/9lHPY=;
  b=Bam9Y+EpzjIEjIilgvEGnVPR5i2s5KdNK/O4ur5tWeu2lQ/aeBiF2hwa
   zd23w1N8Eh/D5veOxQTrFBXMbUNgcFtnh+Kku9gMJve8UwtakUulWDgjY
   nMJph50IGb7M+/ieYau9/1dp4c6g/QEUivvgmuxPRvOeX55RHajiRjGA0
   is6iFnZb0Fh82ghuSH/IC31ZBpN5yT1Q+0ydo5hmF1Kp0Leuw8Kdmp68I
   E6WNA0GRUeTEJ6F0/yVNGFGmIOMxWqrThevbfVQrz/xhXNaqFmMM88soG
   DVXOxKDAIJm59R4+sjUlkgqGvTPKchPL1PCKpPuBFZKkKQMkqWjIOCCx5
   w==;
X-CSE-ConnectionGUID: KtcIuKsmT6iIXM2SEuxkEg==
X-CSE-MsgGUID: mJuJJ3UaRuG/ENnW/dUM8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="63017565"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="63017565"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 02:27:53 -0700
X-CSE-ConnectionGUID: bcLw+TVNSkO/p/vn0oOtxQ==
X-CSE-MsgGUID: BNc0iEdsTjSSiaw2Jw290w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="175898093"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.204])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 02:27:45 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 53EAE11F99F;
	Wed, 03 Sep 2025 12:27:41 +0300 (EEST)
Date: Wed, 3 Sep 2025 12:27:41 +0300
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
Subject: Re: [PATCH v11 17/66] media: uapi: Add new media bus codes for
 generic raw formats
Message-ID: <aLgKDYgjx5opEi1Q@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-18-sakari.ailus@linux.intel.com>
 <httktoswdeltortwoqn5hllzjwtb3prjoe2tigx7u4x6ojdpwr@misyxjdfk3lb>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <httktoswdeltortwoqn5hllzjwtb3prjoe2tigx7u4x6ojdpwr@misyxjdfk3lb>

Hi Jacopo,

On Mon, Sep 01, 2025 at 04:12:33PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Aug 25, 2025 at 12:50:18PM +0300, Sakari Ailus wrote:
> > Add new media bus codes for generic raw formats that are not specific to
> > the colour filter array but that simply specify the bit depth. The layout
> > (packing) of the data is interface specific.
> >
> > The rest of the properties of the format are specified with controls in
> > the image source.
> >
> > The mbus codes added by this patch have bit depth of 8, 10, 12 and 14.
> 
> Same as per the pixel formats, your branch contains
> "media: uapi: Add more media bus codes for generic raw formats"
> 
> Should you squash it in ?

Related to my comment on bit depths and what we know of CSI-2 receiver
implementations, no. But let me know if there's a need to further discuss
this.

> 
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/v4l/subdev-formats.rst              | 27 +++++++++++++++++++
> >  include/uapi/linux/media-bus-format.h         |  6 +++++
> >  2 files changed, 33 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > index 9ef1bc22ad9c..1a51b5c817f1 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > @@ -3434,6 +3434,33 @@ organization is given as an example for the first pixel only.
> >
> >      \endgroup
> >
> > +Generic raw formats on serial interfaces
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +Those formats transfer (largely) unprocessed raw pixel data typically from raw
> 
> I would remove "(largely) unprocessed", mostly because I'm not sure
> what you mean here.

I'm fine with removing that.

> 
> > +camera sensors using Bayer and other Colour Filter Arrays (CFAs) on serial
> > +interfaces. The packing of the data on the bus is determined by the hardware,
> > +however the bit depth is still specific to the format.
> > +
> > +.. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
> > +
> > +.. cssclass:: longtable
> > +
> > +.. flat-table:: Generic raw formats on serial buses
> > +    :header-rows:  1
> > +    :stub-columns: 0
> > +    :widths:       1 1
> > +
> > +    * - Format name
> > +      - Bit depth
> > +    * - MEDIA_BUS_FMT_RAW_8
> > +      - 8
> > +    * - MEDIA_BUS_FMT_RAW_10
> > +      - 10
> > +    * - MEDIA_BUS_FMT_RAW_12
> > +      - 12
> > +    * - MEDIA_BUS_FMT_RAW_14
> > +      - 14
> 
> Should we now say in the "Bayer Formats" section that the existing
> media bus codes that convey the color components ordering are now
> superseded by these ones ?

I can add a note that new drivers need to use these codes but may use older
mbus codes, too. I'd add that to the camera sensor driver documentation
though.

> 
> Nits apart
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thank you!

-- 
Kind regards,

Sakari Ailus

