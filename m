Return-Path: <linux-media+bounces-41731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3017AB42A50
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 21:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFD675E2C5D
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 19:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C9136C070;
	Wed,  3 Sep 2025 19:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v/sZacVD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D61A369992
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 19:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756929159; cv=none; b=ivdBhgq1nepEeCsi8wlpJKeUaegzpwpEgsXVYTpoVTjgZ9PE2GiMrVZ4CEgVoIwLa5FdeXNRNBjGBxn1gSN9CADceTsDebmiz/o7ro3Fl7ufLmBpN7EPCASlZdJaeo+2PPqYXFssyEONtAI7pQ7gJdh4QtUgeesTBw42ugAIhZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756929159; c=relaxed/simple;
	bh=uyy6VXY2YStnWn5JfQvuybCM6umfC+r3rRnGjL/3Vu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X718xjNdWb0YZDkVi6r/9cO7GtZvIJL6ZpEEmiACD/0LNNAJ5yqq6cTYbl7cDkg3oCIMvY9YnD6d+qccQoN3Ch1HzPKRu/b208hFMPAQIn72oYUek4Y05tmWrPIS5w8WhaG8u0lxaN4r+tn9Ct0Cp1Aaj6U8Er9E3H6o8Dak86o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v/sZacVD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2FA678D4;
	Wed,  3 Sep 2025 21:51:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756929084;
	bh=uyy6VXY2YStnWn5JfQvuybCM6umfC+r3rRnGjL/3Vu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v/sZacVDqaJhmCFUJStqX0G77y+D7QQ3uxEu7I53xnhOK0VmcEpFGUnb2m19Zv+zm
	 t5bnmbI3S3i7BQSDdaqv9zJcDWaNWCdDG15VaOs6VmQkECCXvCHYp/sM6vvxi8GO0o
	 kZugFWVGSd2TnN1L/zXh4UPdSY53RLZNVD8WIayc=
Date: Wed, 3 Sep 2025 21:52:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
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
Subject: Re: [PATCH v11 24/66] media: uapi: Add V4L2_CID_METADATA_LAYOUT
 control
Message-ID: <20250903195211.GU3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-25-sakari.ailus@linux.intel.com>
 <qeuueahbuofjmeird3dr7xtcosfhymk72ceuma4dibudf2nn3s@z6smlg4yn2rf>
 <aLgiwzB_IhGTHyHz@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLgiwzB_IhGTHyHz@kekkonen.localdomain>

On Wed, Sep 03, 2025 at 02:13:07PM +0300, Sakari Ailus wrote:
> On Mon, Sep 01, 2025 at 05:07:55PM +0200, Jacopo Mondi wrote:
> > On Mon, Aug 25, 2025 at 12:50:25PM +0300, Sakari Ailus wrote:
> > > The metadata layout control defines the layout of the metadata on the bus.
> > > It is used on sub-devices that use generic metadata mbus codes on at least
> > > on one of the pads.
> > 
> > Ideally:
> > 1) we have per pad controls
> > 2) s/V4L2_CID_COLOR_PATTERN/V4L2_CID_DATA_PATTERN
> > 3) we use V4L2_CID_DATA_PATTERN for both color components ordering and
> >    metadata layouts. A sub-device will expose the same control, but on
> >    different pads
> > 
> > I know we don't want to block this series to wait for per-pad
> > controls, but I'm a bit afraid V4L2_CID_METADATA_LAYOUT will be made
> > redundant before it gets used for real (which maybe it's not a big
> > deal as if no one uses it, we will be able to easily replace it).
> 
> I wouldn't do that, for the reason that the mbus codes in the two cases
> will be different in any case so both will have separate namespaces.
> 
> Metadata is also unaffected by flipping, unlike the colour patterns.
> 
> I wonder what others think.

Per-pad controls could possibly be used here, but they're not there yet,
and the CFA pattern and metadata layout are two different concepts.

This being said, if you consider a sensor that produces multiple
metadata streams (e.g. embedded data and NPU tensors, transported over
different DTs), a single V4L2_CID_METADATA_LAYOUT control won't scale.
We will likely need per-pad, or even per-stream controls for that.

We could start with V4L2_CID_METADATA_LAYOUT and later extend it with
per-pad/stream controls for additional metadata streams, I don't think
that would cause trouble in userspace.

> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../userspace-api/media/v4l/ext-ctrls-image-source.rst      | 6 ++++++
> > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c                   | 1 +
> > >  include/uapi/linux/v4l2-controls.h                          | 2 ++
> > >  3 files changed, 9 insertions(+)
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > index 3cb7ee1b0aed..64c0f9ff5b1b 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > @@ -145,3 +145,9 @@ Image Source Control IDs
> > >      of the reversed readout. ``V4L2_COLOR_PATTERN_FLIP_BOTH`` for setting both
> > >      ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
> > >      ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
> > > +
> > > +``V4L2_CID_METADATA_LAYOUT (integer)``
> > > +    The metadata layout control defines the on-bus metadata layout for metadata

This needs to be clearer. "on-bus metadata layout" left me guessing what
values this control would take. Before the patches further in the series
that add layout values, I wasn't sure if the control would use media bus
codes or other types of values.

> > > +    streams. The control is used in conjunction with :ref:`generic metadata
> > > +    formats <media-bus-format-generic-meta>` formats to specify the layout of the
> > > +    data.
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > index 9ec65998a8f7..a7ea380de5ee 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > @@ -1157,6 +1157,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> > >  	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
> > >  	case V4L2_CID_COLOR_PATTERN:		return "Color Pattern";
> > >  	case V4L2_CID_COLOR_PATTERN_FLIP:	return "Color Pattern Flip";
> > > +	case V4L2_CID_METADATA_LAYOUT:		return "Metadata Layout";

How about v4l2_ctrl_fill() ?

> > >
> > >  	/* Image processing controls */
> > >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > > index eb9ffdd74d32..74e22a930be4 100644
> > > --- a/include/uapi/linux/v4l2-controls.h
> > > +++ b/include/uapi/linux/v4l2-controls.h
> > > @@ -1239,6 +1239,8 @@ enum v4l2_jpeg_chroma_subsampling {
> > >  #define V4L2_COLOR_PATTERN_FLIP_BOTH \
> > >  	(V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
> > >
> > > +#define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
> > > +
> > 
> > Intentional empty line ?
> 
> I'll drop it.
> 
> > For the time being
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Thank you.

-- 
Regards,

Laurent Pinchart

