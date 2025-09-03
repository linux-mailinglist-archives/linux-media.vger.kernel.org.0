Return-Path: <linux-media+bounces-41665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D1CB41CD1
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 13:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 64CE54E4BCA
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 11:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5922F6582;
	Wed,  3 Sep 2025 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOG53oO/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ABB252292
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 11:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756897998; cv=none; b=HUq5BAQdIh8E+YtebBbiwHFy5WZQtrwP8sZAwPZJ1qqhAd943l/SjpfMuOhC8yldKkx170b/vPpUeog2ZKaQSX9UcX8+y3kfxPdbYdcEocv1Y9mzqm0C610rTVNQNKzLZElpO2YXGrlfAXuPvZ8pqsIBSi1oLt5NkLJ8nNGPe0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756897998; c=relaxed/simple;
	bh=kYv923uor8T+dP60AferWnQfwFSsNUerCWJx2iraTds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bv6kH0RF/G6fAqEU2uMNgnIYOgFM3mtvTPIyjpdsymTvLw6rxwbENzSA3sfhkIQV/ikATt24PZ/flDFnD/B7I0LPKPil3nOidb9uLDUcaca1Lw4kcovzs+U8ooWnGW3Lf7rQuJA9/1igWwbQpCLOOgGHv87kjDaxutsJNlk5lnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOG53oO/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756897996; x=1788433996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kYv923uor8T+dP60AferWnQfwFSsNUerCWJx2iraTds=;
  b=YOG53oO/u95jelQYJA0qZadJrCWwfJTbcPRUfg8pJPgennSNbOI6jrnw
   e70Egt+CrKeZSNbfTYPDVEtX7ipNbi7buixqF8MQjPRaZK8xbV12ps0Xy
   +yf8b14tDKEA5FAHdaTgjZGRCjctYlrNzQoSz0dpj58WZsl7vcDRTZYX2
   IqSrGUVEvbCUF3eSIa3j/jkF4+VKovlfLAQAucq+tj/w5aWwZGyxxVv9t
   pAlrvZx6s3UrOzPKnAqVDfepfMeyTbheA6sWRWe5KriBXPHue5B+ssalM
   dUlgOOfAw0Z+mtpnutFkhsfeXVXRN3N7+dCYlewT5GSG6EgrTmB6wpjFc
   w==;
X-CSE-ConnectionGUID: 3Jrt2zKRSCC/+BxMaUE+RQ==
X-CSE-MsgGUID: +HsP1+E3RzCBG2x2mTPmCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70585282"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="70585282"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 04:13:16 -0700
X-CSE-ConnectionGUID: JCX/JP03Qjub6ZnVjUkqIg==
X-CSE-MsgGUID: ukALlRHCT2OIhaYDheIIOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="202516191"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 04:13:09 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5B91711F99F;
	Wed, 03 Sep 2025 14:13:07 +0300 (EEST)
Date: Wed, 3 Sep 2025 14:13:07 +0300
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
Subject: Re: [PATCH v11 24/66] media: uapi: Add V4L2_CID_METADATA_LAYOUT
 control
Message-ID: <aLgiwzB_IhGTHyHz@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-25-sakari.ailus@linux.intel.com>
 <qeuueahbuofjmeird3dr7xtcosfhymk72ceuma4dibudf2nn3s@z6smlg4yn2rf>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qeuueahbuofjmeird3dr7xtcosfhymk72ceuma4dibudf2nn3s@z6smlg4yn2rf>

Hi Jacopo,

On Mon, Sep 01, 2025 at 05:07:55PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Aug 25, 2025 at 12:50:25PM +0300, Sakari Ailus wrote:
> > The metadata layout control defines the layout of the metadata on the bus.
> > It is used on sub-devices that use generic metadata mbus codes on at least
> > on one of the pads.
> 
> Ideally:
> 1) we have per pad controls
> 2) s/V4L2_CID_COLOR_PATTERN/V4L2_CID_DATA_PATTERN
> 3) we use V4L2_CID_DATA_PATTERN for both color components ordering and
>    metadata layouts. A sub-device will expose the same control, but on
>    different pads
> 
> I know we don't want to block this series to wait for per-pad
> controls, but I'm a bit afraid V4L2_CID_METADATA_LAYOUT will be made
> redundant before it gets used for real (which maybe it's not a big
> deal as if no one uses it, we will be able to easily replace it).

I wouldn't do that, for the reason that the mbus codes in the two cases
will be different in any case so both will have separate namespaces.

Metadata is also unaffected by flipping, unlike the colour patterns.

I wonder what others think.

> 
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/ext-ctrls-image-source.rst      | 6 ++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c                   | 1 +
> >  include/uapi/linux/v4l2-controls.h                          | 2 ++
> >  3 files changed, 9 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > index 3cb7ee1b0aed..64c0f9ff5b1b 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > @@ -145,3 +145,9 @@ Image Source Control IDs
> >      of the reversed readout. ``V4L2_COLOR_PATTERN_FLIP_BOTH`` for setting both
> >      ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
> >      ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
> > +
> > +``V4L2_CID_METADATA_LAYOUT (integer)``
> > +    The metadata layout control defines the on-bus metadata layout for metadata
> > +    streams. The control is used in conjunction with :ref:`generic metadata
> > +    formats <media-bus-format-generic-meta>` formats to specify the layout of the
> > +    data.
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index 9ec65998a8f7..a7ea380de5ee 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1157,6 +1157,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >  	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
> >  	case V4L2_CID_COLOR_PATTERN:		return "Color Pattern";
> >  	case V4L2_CID_COLOR_PATTERN_FLIP:	return "Color Pattern Flip";
> > +	case V4L2_CID_METADATA_LAYOUT:		return "Metadata Layout";
> >
> >  	/* Image processing controls */
> >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index eb9ffdd74d32..74e22a930be4 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1239,6 +1239,8 @@ enum v4l2_jpeg_chroma_subsampling {
> >  #define V4L2_COLOR_PATTERN_FLIP_BOTH \
> >  	(V4L2_COLOR_PATTERN_FLIP_HORIZONTAL | V4L2_COLOR_PATTERN_FLIP_VERTICAL)
> >
> > +#define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
> > +
> 
> Intentional empty line ?

I'll drop it.

> 
> For the time being
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thank you.

-- 
Kind regards,

Sakari Ailus

