Return-Path: <linux-media+bounces-35480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB58AE199D
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 13:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 663AB1BC4B64
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 11:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D42C289370;
	Fri, 20 Jun 2025 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W+uaQNko"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040F52853F1
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 11:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750417765; cv=none; b=QhDliasgGcEUAkus+hJFeZQiKH9tIC8lG7+JkaPqzjUZdQbwEgC68UuTyY26UJnTNP6HtCIufdutVYP+AqtxbivfCuXBM78dt0gSUiAE/bB5GzVfYrrAdlMN6ZIqN0hnM598jkjdhjLHWUjEr8M1u+NMHZ2aGuA/zcrpG9t+QfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750417765; c=relaxed/simple;
	bh=7xbWf8EiSDUQ02GzvwlDcy9vVAfoEwcRIqC6uX/ZG+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKl+ILPzxueNA9EO+0RTNwNS1WXmTGnvkdEJIX2WxSqkmx00qGdQbbw+1J/O/i0L44fLL2Pt5H309DyMRITlZud5zZJcJUNAFhIJQYBK+MTskVdMZB0nU1N5peLXOdfRR2nR7d53aVigZuOikoTa4n4/0Ls3qw+dNoGc4Pknj3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W+uaQNko; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A0BEC0B;
	Fri, 20 Jun 2025 13:09:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750417746;
	bh=7xbWf8EiSDUQ02GzvwlDcy9vVAfoEwcRIqC6uX/ZG+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W+uaQNkoIAtID3hH+y2wz9v3lFQuVt6AaddejicgAMxpoKqKVewobH5OddTyR5qRe
	 lWMuQaUh3/R0aheYtaIIKVrXOwyZhucOyENNH1cp9aJL9mEKZiQXxcoRyWJvqaIoOs
	 pkvmivwW+cMdxFnGURENQS7r2Hed9bNjH5EJ1J1o=
Date: Fri, 20 Jun 2025 13:09:18 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
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
Subject: Re: [PATCH v10 08/64] media: Documentation: Refer to internal pads
 in metadata documentation
Message-ID: <66er7ngkwseuesrx6rkyk3urrch5zwmonliermadtrr6hmgh3n@cxmvrt536xla>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-9-sakari.ailus@linux.intel.com>
 <5wzdogevsfx2p2ecpy2vhz5igcut3pmovpg3n56ovpvdur4hi6@yjhitjftdhn5>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5wzdogevsfx2p2ecpy2vhz5igcut3pmovpg3n56ovpvdur4hi6@yjhitjftdhn5>

On Fri, Jun 20, 2025 at 12:01:36PM +0200, Jacopo Mondi wrote:
> Hi Sakari
>
> On Thu, Jun 19, 2025 at 02:57:40PM +0300, Sakari Ailus wrote:
> > Metadata is intended to be used with internal pads when it comes to the
> > source of the data. Document this.
>
> Isn't this more likely something:
>
> Generic metadata formats are intended to be used along the media
> pipeline while the actual metadata format is reported by the
> V4L2_CID_METADATA_LAYOUT control value. Document this.
>
> Which makes me wonder if this isn't better merged with the patch I
> assume comes later in the series that introduces that control.

Please also note the patch subject needs to be updated!

>
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/userspace-api/media/v4l/metafmt-generic.rst | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > index 78ab56b21682..90a1bc2ea15e 100644
> > --- a/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > +++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> > @@ -7,12 +7,17 @@ V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_M
> >
> >  Generic line-based metadata formats
> >
> > +.. _v4l2-format-generic-meta:
> >
> >  Description
> >  ===========
> >
> >  These generic line-based metadata formats define the memory layout of the data
> > -without defining the format or meaning of the metadata itself.
> > +without defining the format or meaning of the metadata itself. These formats may
> > +only be used with a Media Controller pipeline where the more specific metadata
> > +layout is reported by an :ref:`V4L2_CID_METADATA_LAYOUT control
>
> s/by an/by the/ ?
>
> > +<image_source_control_metadata_layout>` of the source sub-device. See also
> > +:ref:`source routes <subdev-routing>`.
> >
> >  .. _v4l2-meta-fmt-generic-8:
> >
> > --
> > 2.39.5
> >
> >

