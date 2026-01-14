Return-Path: <linux-media+bounces-50646-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AE7D1CF65
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 08:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1AEA300B280
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 07:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C4737B406;
	Wed, 14 Jan 2026 07:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iz1Sbb2a"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FB4379971
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377236; cv=none; b=krq5DciU79MgtU/b3Q/FM+ZjlNC8moZ+jBrhRksdHhHqS0OdMQmaL40xHzcxztxrFt+kCv8YchVmEO+IO50tahlD33o0nWzQA2VQv8pD5e47C2dSmQImoiV4j0g0+ZNf4Aecsfggt8X3twXPfs0fIAwqShKMmjG3UQ61CFbfkFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377236; c=relaxed/simple;
	bh=wpOZ8RzIUA8Am9KuAmQ4Ut0ss4PG+/GU2+dTb6GEPY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tczcQNqD6mvmM3TK2URpQ4ifrxLIWjivRbXbFfqCgUrhnQyQmdclXco/cZ1Q6h380yLdjONSr8/oSVdVp8UlyEeTlvD98zfmNnlsxCrB4NuuRF10spxRAp8Pg3xLmQ0ecK6heDHpPhD5X299PMC4m4MiRWjMz4tcSt3W2egvfdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iz1Sbb2a; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F1254BB;
	Wed, 14 Jan 2026 08:53:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768377202;
	bh=wpOZ8RzIUA8Am9KuAmQ4Ut0ss4PG+/GU2+dTb6GEPY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iz1Sbb2aOHskmKZCEhMNN4QK2Tm0xIgldWGPL13gfpU8GfsZ+jJB+3Vb/zb394a9X
	 1z0i0qBvzV0dJWGukW6Kany1bixEP/8h42910LVVMIJD24XvBcvmnC90I7NlPEO5e0
	 NGXySR/J1RE35X71IrJ0lSs6OKNDUYna/UhHjqMw=
Date: Wed, 14 Jan 2026 08:53:46 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 24/64] media: uapi: ccs: Add metadata layout for MIPI
 CCS embedded data
Message-ID: <aWdIqNlFUEe_fkpN@zed>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-25-sakari.ailus@linux.intel.com>
 <ozeebjfleygstzllqdbjzbigt6i36uplgp2ausgni4ksarnvub@nmjhju3f6rvt>
 <aWa54ri2jx_-EwKz@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aWa54ri2jx_-EwKz@kekkonen.localdomain>

Hi Sakari

On Tue, Jan 13, 2026 at 11:32:18PM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Fri, Jun 20, 2025 at 03:24:09PM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Thu, Jun 19, 2025 at 02:57:56PM +0300, Sakari Ailus wrote:
> > > Add new metadata layout (V4L2_METADATA_LAYOUT_CCS) for MIPI CCS embedded
> > > data.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by: Julien Massot <julien.massot@collabora.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  .../userspace-api/media/v4l/meta-formats.rst  |  1 +
> > >  .../media/v4l/metadata-layouts.rst            | 39 +++++++++++++++++++
> > >  .../media/v4l/subdev-formats.rst              |  5 +++
> > >  include/uapi/linux/v4l2-controls.h            |  1 +
> > >  4 files changed, 46 insertions(+)
> > >  create mode 100644 Documentation/userspace-api/media/v4l/metadata-layouts.rst
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > index bb6876cfc271..c9b908d5fbea 100644
> > > --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > @@ -15,6 +15,7 @@ These formats are used for the :ref:`metadata` interface only.
> > >      metafmt-c3-isp
> > >      metafmt-d4xx
> > >      metafmt-generic
> > > +    metadata-layouts
> > >      metafmt-intel-ipu3
> > >      metafmt-pisp-be
> > >      metafmt-pisp-fe
> > > diff --git a/Documentation/userspace-api/media/v4l/metadata-layouts.rst b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
> > > new file mode 100644
> > > index 000000000000..5f717d54d1ca
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
> > > @@ -0,0 +1,39 @@
> > > +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> > > +
> > > +.. _media_metadata_layouts:
> > > +
> > > +Metadata Layouts
> > > +----------------
> > > +
> > > +The :ref:`metadata layout control <image_source_control_metadata_layout>`
> > > +specifies the on-bus layout of the metadata on pads with a :ref:`generic
> > > +metadata mbus code <media-bus-format-generic-meta>` independently of the bit
> > > +depth.
> >
> > This has been reviewed by 2 people already, so it might be not having
> > this clear, but I guess the intention is to say that the metadata
> > layout control describes how data on the bus should be interpreted by
> > userspace while the generic metadata mbus code only defines the sample
> > size ?
>
> Hmm. This should probably refer to Data Unit instead.
>
> Do you think that would help? Bit depth doesn't really apply here.
>

I have a few problems with the text overall, at least as I read it

1) "the metadata layout control specifies the on-bus layout of the
   metadata on pads with a generic metadata mbus code"

This seems to suggest that the control applies on pads with a generic
metadata mbus code

2) "specifies the on-bus layout"

I understand why you used "on-bus" (because we use generic formats on
pads and when the metadata are written to memory, right ?) but I would
rather use "exact layout" or simply "data layout" as you've done below
?

3) I don't get what "on pads with a metadata mbus code indepedently of
the bit depth". What's independent from the bit depth ?

All in all, I guess what I understand is:

The :ref:`metadata layout control <image_source_control_metadata_layout>`
specifies the exact layout of the metadata stream while the a :ref:`generic
metadata mbus code <media-bus-format-generic-meta>` on the subdevice pads
only describe the data unit size.

if that's what you meant

> >
> > I don't really get that from the above paragraph. Feel free to ignore
> > if it's me only :)
>
> --
> Kind regards,
>
> Sakari Ailus

