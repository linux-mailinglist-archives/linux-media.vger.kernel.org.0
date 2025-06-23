Return-Path: <linux-media+bounces-35600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C522EAE3BB9
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 579D51885633
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2774623ABBB;
	Mon, 23 Jun 2025 10:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hu6EyzGJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FFEB663
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 10:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673149; cv=none; b=M6wC06d2Ao887Jh/lFvbF6gDwD8eH9iXhsMa5hO9JkSi7TJaKu/iTJghxFFETW7++EaiQ4HTrEBUF7FmzB5Qn4QbfvOVHkFKiy2Vfme+Ej5r6jZckw3ELq8zCsJxOhln6dGiBt+z71TKiRC7AXPUetmoeB8w2EBkIejMeZGH5Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673149; c=relaxed/simple;
	bh=sjsg+vwaihGqnnPTgCzGHgDlkKQFctMk+wIoPxaJcP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pd12kR3cYAE2Pl38GP4Qvg5RrGPU6fpdNtoF6EB6bFGHCoAmKfJ68XSVgzeG/TOk+h+yIsIHM1xS/LsN4VygDUEwMy3TxsGDsyQHh4jWKCZGrzRheMH37HFAOX01fQYgAXPoPxi7f8hAgwOHnZ6bbRU0g4pjRYor4CIXKbmPxKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hu6EyzGJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750673148; x=1782209148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sjsg+vwaihGqnnPTgCzGHgDlkKQFctMk+wIoPxaJcP8=;
  b=hu6EyzGJqSyFN93ukDVW+wrKXlv8/lHy1LrVB5gmz67zmgtpT0K25zxD
   xrJmpsjGaa7LY6fmTU0vLF5LgryLzwjlV7jWiHGc1rG9MDwvOmnnK3xv7
   rJu2vGdYIvg0f5ycOcv2iYswfMghLTw761Uto2CLlnI1sOGA1+v9r2PRy
   wOLgRH7aYweDxbcBywB5zx4XP4xuiwJA/pbI5lyx+YqUZ2xR4Czfk99pY
   ZwpogZQOGx0XrM8A/ECcj62eQwice5nuNcaUD/URMKyEdto1csdK/a5vE
   BPw+nuT5iZNbF0a2wYAqJ4ouII9emCkv4DR7/VO69dlVegX2rYdWy8I8W
   w==;
X-CSE-ConnectionGUID: EOryrILRQEac14j1xpKIyw==
X-CSE-MsgGUID: 4eEM8SaqQvWfIP9zmk1odg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="64228592"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="64228592"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 03:05:47 -0700
X-CSE-ConnectionGUID: cw/xsuJPQS+u62Nw1oq4rg==
X-CSE-MsgGUID: tWXoCsiVR228OkLBIMGnkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151842172"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 03:05:40 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A35A61201F7;
	Mon, 23 Jun 2025 13:05:37 +0300 (EEST)
Date: Mon, 23 Jun 2025 10:05:37 +0000
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
Subject: Re: [PATCH v10 38/64] media: uapi: Correct generic CSI-2 metadata
 format 4cc
Message-ID: <aFkm8ZaGjzA9mGqI@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-39-sakari.ailus@linux.intel.com>
 <lgm4ufdwzeg7tnpv25h27kausizxn2wilzhgfwvramiug67e6h@jndtb26w2paf>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lgm4ufdwzeg7tnpv25h27kausizxn2wilzhgfwvramiug67e6h@jndtb26w2paf>

Hi Jacopo,

On Fri, Jun 20, 2025 at 03:26:25PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, Jun 19, 2025 at 02:58:10PM +0300, Sakari Ailus wrote:
> > Rework the pixelformat 4cc for CSI-2 generic metadata. This can be done as
> > no driver uses this yet and the interface is disabled.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/metafmt-generic.rst      |  2 +-
> >  include/uapi/linux/videodev2.h                       | 12 ++++++------
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > index e8824b5a65d6..e0d675d1ec07 100644
> > --- a/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > +++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > @@ -1,7 +1,7 @@
> >  .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> >
> >  ********************************************************************************************************************************************************************************************************************************************************************************
> > -V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_META_FMT_GENERIC_CSI2_12 ('MC1C'), V4L2_META_FMT_GENERIC_CSI2_14 ('MC1E'), V4L2_META_FMT_GENERIC_CSI2_16 ('MC1G'), V4L2_META_FMT_GENERIC_CSI2_20 ('MC1K'), V4L2_META_FMT_GENERIC_CSI2_24 ('MC1O')
> > +V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MECA'), V4L2_META_FMT_GENERIC_CSI2_12 ('MECC'), V4L2_META_FMT_GENERIC_CSI2_14 ('MECE'), V4L2_META_FMT_GENERIC_CSI2_16 ('MECG'), V4L2_META_FMT_GENERIC_CSI2_20 ('MECK'), V4L2_META_FMT_GENERIC_CSI2_24 ('MECO')
> >  ********************************************************************************************************************************************************************************************************************************************************************************
> >
> >
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 855cbe2a97d8..6f0dacd69ab3 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -893,12 +893,12 @@ struct v4l2_pix_format {
> >   * adding new ones!
> >   */
> >  #define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
> 
> Why GENERIC_8 is still 'MET' and all others are 'MEC' ?

C is for "CSI-2". This actually should be the case for 16- and 24-bit
formats as they don't use CSI-2 specific packing.

> 
> > -#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
> > -#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
> > -#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'C', '1', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
> > -#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
> > -#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
> > -#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'E', 'C', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'E', 'C', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'E', 'C', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'E', 'C', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'E', 'C', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
> > +#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'E', 'C', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
> >  #endif
> >
> >  /* priv field value to indicates that subsequent fields are valid. */

-- 
Regards,

Sakari Ailus

