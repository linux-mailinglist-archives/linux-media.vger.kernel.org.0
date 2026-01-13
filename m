Return-Path: <linux-media+bounces-50614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAF9D1B671
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 22:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D5B923004619
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 21:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81D53328F0;
	Tue, 13 Jan 2026 21:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yhze7BdF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6516731A7EA
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 21:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768339949; cv=none; b=GmbclPG53xBEfIm/7aIYHyWO+8rBz6KtH/FA+KijW3aft+kilyYLdo86lcSl6eDPDsW33Jr+OXolrPngByor3McRshjv34oRn4zq2Fe+/SBApd+KJzZnczJaQlHb0LjJH1t/J7zLQKSIg05SQx/WGT14rxK+zFtnzsoWw5xXsvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768339949; c=relaxed/simple;
	bh=A/R2GArKCHXShDp0ClMqvl4GetrgTaHwSuQ1pIf7tZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cb+7+x2fz1sQ+Iyjl35dZuB+Zopwi81LlPTl2e6oAuo4zqkYib+hfkbv4eJc2vmIm2e+88ynllo+wyvYYg16kkvusO+BaFxjtGCyY6uXnngEk8xdJCcSIn8yrAdRNmy1zrYRGrQilrCIArnqldkKYtPFB7di1/aRn6iZLKUEFvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yhze7BdF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768339948; x=1799875948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A/R2GArKCHXShDp0ClMqvl4GetrgTaHwSuQ1pIf7tZU=;
  b=Yhze7BdFQ4zQaQiOXimqI36YhqQFaJmLtqoKSZnYJAjg4l/qdJE0MvkO
   0PpXqBWnYpDcygWXspxXNpXa5WeCXFZBBEbxefrb+0wy/fiG5zb6RuLU0
   48JgyH0iVr2gWyjUZfaWwzDZMUjhAnPtAZDydehJkry0XV/kD7X9X0Z1X
   owcsBM2d2wJVok48Kp0hVqqzSQc++zjD7eloSYifi4xYrC9eZ3Ve/JPuf
   2i4Ec/L2YCLUWyobXYSycRB8YDFFbAYjBWkEWJzkcmE51FWa8qJrKkvPH
   BOk/4Z/MG+GqGUTPYT4QxZayQ92Y4bcU/PKJPUYIWM0uRPAyqQnsiNvIQ
   Q==;
X-CSE-ConnectionGUID: 91j+89/0S5+DIi9sK/YZpQ==
X-CSE-MsgGUID: 563mnhaAR9mjE56pVPd5Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73476869"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73476869"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 13:32:27 -0800
X-CSE-ConnectionGUID: FSeqVLIySdaFFGydtqjFqg==
X-CSE-MsgGUID: J6G+6fUmTiub/+on1iMYug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204913321"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.58])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 13:32:21 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AF91E11FBC5;
	Tue, 13 Jan 2026 23:32:18 +0200 (EET)
Date: Tue, 13 Jan 2026 23:32:18 +0200
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
Subject: Re: [PATCH v10 24/64] media: uapi: ccs: Add metadata layout for MIPI
 CCS embedded data
Message-ID: <aWa54ri2jx_-EwKz@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-25-sakari.ailus@linux.intel.com>
 <ozeebjfleygstzllqdbjzbigt6i36uplgp2ausgni4ksarnvub@nmjhju3f6rvt>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ozeebjfleygstzllqdbjzbigt6i36uplgp2ausgni4ksarnvub@nmjhju3f6rvt>

Hi Jacopo,

On Fri, Jun 20, 2025 at 03:24:09PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, Jun 19, 2025 at 02:57:56PM +0300, Sakari Ailus wrote:
> > Add new metadata layout (V4L2_METADATA_LAYOUT_CCS) for MIPI CCS embedded
> > data.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Julien Massot <julien.massot@collabora.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../userspace-api/media/v4l/meta-formats.rst  |  1 +
> >  .../media/v4l/metadata-layouts.rst            | 39 +++++++++++++++++++
> >  .../media/v4l/subdev-formats.rst              |  5 +++
> >  include/uapi/linux/v4l2-controls.h            |  1 +
> >  4 files changed, 46 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/metadata-layouts.rst
> >
> > diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > index bb6876cfc271..c9b908d5fbea 100644
> > --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > @@ -15,6 +15,7 @@ These formats are used for the :ref:`metadata` interface only.
> >      metafmt-c3-isp
> >      metafmt-d4xx
> >      metafmt-generic
> > +    metadata-layouts
> >      metafmt-intel-ipu3
> >      metafmt-pisp-be
> >      metafmt-pisp-fe
> > diff --git a/Documentation/userspace-api/media/v4l/metadata-layouts.rst b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
> > new file mode 100644
> > index 000000000000..5f717d54d1ca
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
> > @@ -0,0 +1,39 @@
> > +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> > +
> > +.. _media_metadata_layouts:
> > +
> > +Metadata Layouts
> > +----------------
> > +
> > +The :ref:`metadata layout control <image_source_control_metadata_layout>`
> > +specifies the on-bus layout of the metadata on pads with a :ref:`generic
> > +metadata mbus code <media-bus-format-generic-meta>` independently of the bit
> > +depth.
> 
> This has been reviewed by 2 people already, so it might be not having
> this clear, but I guess the intention is to say that the metadata
> layout control describes how data on the bus should be interpreted by
> userspace while the generic metadata mbus code only defines the sample
> size ?

Hmm. This should probably refer to Data Unit instead.

Do you think that would help? Bit depth doesn't really apply here.

> 
> I don't really get that from the above paragraph. Feel free to ignore
> if it's me only :)

-- 
Kind regards,

Sakari Ailus

