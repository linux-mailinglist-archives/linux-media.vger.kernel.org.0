Return-Path: <linux-media+bounces-42762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 050EDB88C1E
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 12:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B42493AC113
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 10:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD53A265CCB;
	Fri, 19 Sep 2025 10:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVddw8zm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42222C029D
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758276464; cv=none; b=JbF7jyOGXszswlkmucDk7rgf4NsHEKSPvmpS24jo/aNK0cr6stPHptvN3UZTj9hoJh+DC46ceFCMwAj5mAHxk3j6UGJHrKSd3SlWANiQERFmeXqhHpwKFthcUQmesqBMMLJC3p9hVfaD/jCdcHnT7/lfeioYD0R6HVhvLOZicNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758276464; c=relaxed/simple;
	bh=CaKM0ZrBlruz83LYkes6c8wuD17pPIMWqxSsy8cv9t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNMsT/2DgO5+Oe48pvKmBd+1t3qOKL9wRShCLlQxhmnp9nETDqFxQywEy6ax6c6Qm+89md9j45wI1VGfuD4JQVQH2/yalH5QFAPhQtS73hstwE0kkkXFjNCZ5+hhsxPG85hl5G5NvjDoU31kHszsQkZON4kJ+sNRybS+jPyv5yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVddw8zm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758276462; x=1789812462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CaKM0ZrBlruz83LYkes6c8wuD17pPIMWqxSsy8cv9t4=;
  b=QVddw8zmdwgFyF84HjBwens0PgB6tETLGaACssYf/kd/5Nj+iIKzH7We
   7N+0K6HNCQUpIvscOyqgc0hy0zxGmxz7EIJv3wTuuDO0aphOALm6gvftk
   nQvNV6toRtL9JjiuSybHuvtjeW87RhiGAF22G8XHeJPUasn8IvhllmNzE
   J/XGD2Pu5iS2O7nf6QiCHp0SFLDHPbvTfL+6xVeWBDlHOOZq+PdvWTVyY
   xqHdx1jUBai4Gy7h2AG3EUvKm/+gexq1jWCJzYAw4gm2UHjZ4FUxzrmzf
   Yukwrxr8OUxq6SQ9VZy7gCOBzHesfZ+4Gl/inJ91fDSXvIYaRnwsf/iTU
   Q==;
X-CSE-ConnectionGUID: 50BCjuAfT7eBwaB/wyCvNw==
X-CSE-MsgGUID: +RQem0C0QTKPnPtKaQ5ANA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64424749"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64424749"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 03:07:41 -0700
X-CSE-ConnectionGUID: jzQQVN/jSEGFU5xaNGq15A==
X-CSE-MsgGUID: BRGms7vnRSqHjm1/w9r1YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="176239955"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.108])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 03:07:35 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1605A11F982;
	Fri, 19 Sep 2025 13:07:32 +0300 (EEST)
Date: Fri, 19 Sep 2025 13:07:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
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
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 17/66] media: uapi: Add new media bus codes for
 generic raw formats
Message-ID: <aM0rZMeWUqG65B-P@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-18-sakari.ailus@linux.intel.com>
 <20250903143831.GM3648@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903143831.GM3648@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Sep 03, 2025 at 04:38:31PM +0200, Laurent Pinchart wrote:
> On Mon, Aug 25, 2025 at 12:50:18PM +0300, Sakari Ailus wrote:
> > Add new media bus codes for generic raw formats that are not specific to
> > the colour filter array but that simply specify the bit depth. The layout
> > (packing) of the data is interface specific.
> > 
> > The rest of the properties of the format are specified with controls in
> > the image source.
> > 
> > The mbus codes added by this patch have bit depth of 8, 10, 12 and 14.
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
> >  
> >  Packed YUV Formats
> >  ^^^^^^^^^^^^^^^^^^
> > diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> > index ff62056feed5..b71120bc1788 100644
> > --- a/include/uapi/linux/media-bus-format.h
> > +++ b/include/uapi/linux/media-bus-format.h
> > @@ -185,4 +185,10 @@
> >  #define MEDIA_BUS_FMT_META_20			0x8006
> >  #define MEDIA_BUS_FMT_META_24			0x8007
> >  
> > +/* Generic (CFA independent) pixel data formats. Next is 0xa009. */
> 
> The next format is 0xa005. Any reason not to use 0x9000 as a base though
> ? Or maybe adding these to the 0x3000 (bayer formats) group ? We're
> running out of bases.

What do you mean? We have still the upper 16 bits of the media bus code
left for new bases, about a million should be enough. :-)

0xa000 was used as the new metadata formats used the 0x9000 base, which is
now free. I'm fine with switching these to that if you prefer -- I don't
really have much of an option here, 0x9000 base would simply be free for
any later use.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you.

> 
> > +#define MEDIA_BUS_FMT_RAW_8			0xa001
> > +#define MEDIA_BUS_FMT_RAW_10			0xa002
> > +#define MEDIA_BUS_FMT_RAW_12			0xa003
> > +#define MEDIA_BUS_FMT_RAW_14			0xa004
> > +
> >  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
> 

-- 
Kind regards,

Sakari Ailus

