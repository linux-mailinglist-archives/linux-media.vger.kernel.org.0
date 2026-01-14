Return-Path: <linux-media+bounces-50668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A99DBD1DAFA
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0EE5303C629
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 09:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935C3387576;
	Wed, 14 Jan 2026 09:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K8oZ7ADO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCFE3242B0
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768384018; cv=none; b=K0SdvsmrdUZ+5W3G7NcrBX/A+6bkbDDE1EtVRpjAuzdGpF6g0NO5jQR6WVYCtm3NIZxlMwMe/wqCdn1Do+7wgCeaX/pw/uHrLwk6gRsQpCrm2cXQ+cti2IrDCGMeMuLKF/Ges/i+djTi0y1E1NBMCKwfmAwF1DVTkh77ra+7pks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768384018; c=relaxed/simple;
	bh=NgzBVaOzjf/VI8SSMUyqDSlQr+cKltwL8rZyJtfDO7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYR9rTmqBhHfjk/L69uvnBtbwdZuz9bldZQgb1SVg2sTSUUmrpMY7v5zpH6s1Thc5NbklYA1vr6sb7UgIfWw2+P3pY7TBM9ZmgIxZpDbglj3g1hUf6x563ODis/FgpYUWOcarvPoSJVLDs9b8GNpkbzNPsrmtTY5dTjj4A3wAzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K8oZ7ADO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768384017; x=1799920017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NgzBVaOzjf/VI8SSMUyqDSlQr+cKltwL8rZyJtfDO7g=;
  b=K8oZ7ADO4pJPvVD1zU0IYsKzlXApzDvcunoj4eGyAEt3bQUHv68JJ00Y
   RM+d8Q9NVe9TmDtiB2vcW3iYjls22QN5W1IxW8OHVeW/esgENH7h9fAVa
   KJ278o18gzV8uqnVcUs/4MT1WtfOfoicRLjbpziHXZsu4W4GQzpOqhFcs
   A9Dk/DTshlhVuL1llIXAK/yV2/BZv5V4Si/PDi8ndk0khNevQ9fI1Z+Sj
   iuQMNHaPk4rN1zlTcIWCf6gHbj11+J49ML7LUKCoSBqB5sUOAmpk2wJp5
   Q4J0PZjRHwaf9RVED2uKWJAj9QEF9OlzpXMzplzWzirdZjFlvdQb5Mx3J
   A==;
X-CSE-ConnectionGUID: URl2rvFPQFuumWCEs0wRxg==
X-CSE-MsgGUID: 77aJ6S7gQNe07eG+G2Y53A==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73519746"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="73519746"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 01:46:54 -0800
X-CSE-ConnectionGUID: yiN23fPyQ0S/ZfzY0Mw08w==
X-CSE-MsgGUID: PDfeK4/PRomqKuPjg9gF6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="203774811"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.116])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 01:46:48 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2B91D11F9B2;
	Wed, 14 Jan 2026 11:46:45 +0200 (EET)
Date: Wed, 14 Jan 2026 11:46:45 +0200
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
Message-ID: <aWdmBc8uJl2VoeGk@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-25-sakari.ailus@linux.intel.com>
 <ozeebjfleygstzllqdbjzbigt6i36uplgp2ausgni4ksarnvub@nmjhju3f6rvt>
 <aWa54ri2jx_-EwKz@kekkonen.localdomain>
 <aWdIqNlFUEe_fkpN@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWdIqNlFUEe_fkpN@zed>

Hi Jacopo,

On Wed, Jan 14, 2026 at 08:53:46AM +0100, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Tue, Jan 13, 2026 at 11:32:18PM +0200, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Fri, Jun 20, 2025 at 03:24:09PM +0200, Jacopo Mondi wrote:
> > > Hi Sakari
> > >
> > > On Thu, Jun 19, 2025 at 02:57:56PM +0300, Sakari Ailus wrote:
> > > > Add new metadata layout (V4L2_METADATA_LAYOUT_CCS) for MIPI CCS embedded
> > > > data.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Reviewed-by: Julien Massot <julien.massot@collabora.com>
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > >  .../userspace-api/media/v4l/meta-formats.rst  |  1 +
> > > >  .../media/v4l/metadata-layouts.rst            | 39 +++++++++++++++++++
> > > >  .../media/v4l/subdev-formats.rst              |  5 +++
> > > >  include/uapi/linux/v4l2-controls.h            |  1 +
> > > >  4 files changed, 46 insertions(+)
> > > >  create mode 100644 Documentation/userspace-api/media/v4l/metadata-layouts.rst
> > > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > > index bb6876cfc271..c9b908d5fbea 100644
> > > > --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > > > @@ -15,6 +15,7 @@ These formats are used for the :ref:`metadata` interface only.
> > > >      metafmt-c3-isp
> > > >      metafmt-d4xx
> > > >      metafmt-generic
> > > > +    metadata-layouts
> > > >      metafmt-intel-ipu3
> > > >      metafmt-pisp-be
> > > >      metafmt-pisp-fe
> > > > diff --git a/Documentation/userspace-api/media/v4l/metadata-layouts.rst b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
> > > > new file mode 100644
> > > > index 000000000000..5f717d54d1ca
> > > > --- /dev/null
> > > > +++ b/Documentation/userspace-api/media/v4l/metadata-layouts.rst
> > > > @@ -0,0 +1,39 @@
> > > > +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> > > > +
> > > > +.. _media_metadata_layouts:
> > > > +
> > > > +Metadata Layouts
> > > > +----------------
> > > > +
> > > > +The :ref:`metadata layout control <image_source_control_metadata_layout>`
> > > > +specifies the on-bus layout of the metadata on pads with a :ref:`generic
> > > > +metadata mbus code <media-bus-format-generic-meta>` independently of the bit
> > > > +depth.
> > >
> > > This has been reviewed by 2 people already, so it might be not having
> > > this clear, but I guess the intention is to say that the metadata
> > > layout control describes how data on the bus should be interpreted by
> > > userspace while the generic metadata mbus code only defines the sample
> > > size ?
> >
> > Hmm. This should probably refer to Data Unit instead.
> >
> > Do you think that would help? Bit depth doesn't really apply here.
> >
> 
> I have a few problems with the text overall, at least as I read it
> 
> 1) "the metadata layout control specifies the on-bus layout of the
>    metadata on pads with a generic metadata mbus code"
> 
> This seems to suggest that the control applies on pads with a generic
> metadata mbus code
> 
> 2) "specifies the on-bus layout"
> 
> I understand why you used "on-bus" (because we use generic formats on
> pads and when the metadata are written to memory, right ?) but I would
> rather use "exact layout" or simply "data layout" as you've done below
> ?
> 
> 3) I don't get what "on pads with a metadata mbus code indepedently of
> the bit depth". What's independent from the bit depth ?
> 
> All in all, I guess what I understand is:
> 
> The :ref:`metadata layout control <image_source_control_metadata_layout>`
> specifies the exact layout of the metadata stream while the a :ref:`generic
> metadata mbus code <media-bus-format-generic-meta>` on the subdevice pads
> only describe the data unit size.
> 
> if that's what you meant

That would work, too, yes. I'll add a reference to the glossary, too.

> 
> > >
> > > I don't really get that from the above paragraph. Feel free to ignore
> > > if it's me only :)
> >

-- 
Kind regards,

Sakari Ailus

