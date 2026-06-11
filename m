Return-Path: <linux-media+bounces-64583-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZKVNCE2mKmqEuQMAu9opvQ
	(envelope-from <linux-media+bounces-64583-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 14:13:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E55B671B71
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 14:13:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=EMVOFSEV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64583-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64583-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C16530829D4
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 12:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B303EB10D;
	Thu, 11 Jun 2026 12:09:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAE930D3F6
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 12:09:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179787; cv=none; b=r6GTYMhNS8mKVrEvqlEpihIXQAYBAslAyiXQ8zUJuu/YsikKsQ0S/CCLoqtOQtHnvlsKUKuJQLJbfHrCZ5J7c+EaMglVj4yMosS7m3Y1blaaLBiQ1Kysktvdy1sYOJZMRYVPIt+8S2qpkZzJmbSNTGDgndcxo4g9k/X2eLkfNeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179787; c=relaxed/simple;
	bh=+q2U8o9sj7xXO8b89jvj4cUy8+kQIrkio6VDBCV/XSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CoHouyoiN4hjRn1p15ZnW3QO1wgiDH/+WdZ5+c9XtBo1i69eLFfB4z0fzDSEe2jljoj3x+SyUkZVCu24LO4go9/s+uhsjKWr6RNanNW64A2mtxdNbpOEvooMbSf6PAGwpjJ8goOOdNgvmiEelK2Xqejxu9MlgGsFkS9QmPjmW7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMVOFSEV; arc=none smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781179785; x=1812715785;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+q2U8o9sj7xXO8b89jvj4cUy8+kQIrkio6VDBCV/XSU=;
  b=EMVOFSEVeY+yuTrdmgon+hcziaBiccxN5zjPES0r/MxuDzkRhJwj9Kx9
   SruzRBlHoIkF03DdmDKVk1HLrczL4xwPmqvu6/TXsNF2eZHwHeTGk1ZY1
   GplbdOmB6DPLQXlzT21spAh63qI5rkoT7XvYg4IM3madzV2IsZs7ZHkjF
   iQI4wJax7fidNL4Yzz/j74D6PpIZ/OQPWC4nRZ+L8WEa8BRKZVwQBihmR
   fwqil1jQLYR6SrC+WhClAApPWfiF3OS//nHNgmb31zv1NXnZ9KRpaqsA9
   VcHQqlemYvNu6+JQexk0xJtTiq5uSYWf+DHb8Emxw154MmBzIrxzy4rgx
   A==;
X-CSE-ConnectionGUID: 4QbvpcC5Q8iYj34G2JINow==
X-CSE-MsgGUID: h2qKGSRGSOyKROlgJqbIww==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85828443"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="85828443"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:09:44 -0700
X-CSE-ConnectionGUID: JKJnCv3sRPiROOrQY7jAnQ==
X-CSE-MsgGUID: jGcdP6KnS+a2h5WebUnucA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="246541890"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.136])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:09:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AC374121C39;
	Thu, 11 Jun 2026 15:09:34 +0300 (EEST)
Date: Thu, 11 Jun 2026 15:09:34 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	" Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v12 13/86] media: Documentation: v4l: Document internal
 sink pads
Message-ID: <aiqlfoCg-s8WKs1m@kekkonen.localdomain>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
 <20260409201501.975242-14-sakari.ailus@linux.intel.com>
 <177926218793.2341049.4470290417149054877@selene>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177926218793.2341049.4470290417149054877@selene>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64583-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E55B671B71

Hi Jay,

Thanks for the review.

On Wed, May 20, 2026 at 09:29:47AM +0200, Jai Luthra wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> Quoting Sakari Ailus (2026-04-09 22:13:48)
> > Document internal sink pads, pads that have both SINK and INTERNAL flags
> > set. Use the IMX219 camera sensor as an example.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Julien Massot <julien.massot@collabora.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > ---
> >  .../userspace-api/media/v4l/dev-subdev.rst    | 24 +++++++++++++++++++
> >  .../media/v4l/ext-ctrls-image-source.rst      |  2 ++
> >  2 files changed, 26 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index 142e2cd95062..39c281991460 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -554,6 +554,25 @@ A stream at a specific point in the media pipeline is identified by the
> >  sub-device and a (pad, stream) pair. For sub-devices that do not support
> >  multiplexed streams the 'stream' field is always 0.
> >  
> > +Internal sink pads and routing
> > +------------------------------
> > +
> > +Cases where a single sub-device source pad is carries multiple streams, one or
> 
> "is carries" -> "carries" or is "carrying"

I'll use "carries".

> 
> > +more of which originate from within the sub-device itself, are special as there
> > +is no external sink pad for such routes. In those cases, the sources of the
> 
> I think this paragraph could read slightly easier:
> 
> There are special cases where a single sub-device source pad carries
> multiple streams, one or more of which originate from within the sub-device
> itself. In those cases, the sources of...

How about instead:

Internal sink pads are used to denote sources of routes that originate from
within a sub-device itself. No external sink pads exist for such routes.
Internal sink pads have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
pad flag set.

> 
> With that,
> 
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> 
> > +internally generated streams are represented by internal sink pads, which are
> > +sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>` pad
> > +flag set.
> > +
> > +Internal pads have all the properties of an external pad, including formats and
> > +selections. The format in this case is the source format of the stream. An
> > +internal pad always has a single stream only (0).
> > +
> > +Routes from an internal sink pad to an external source pad are created by the
> > +driver and can be activated and deactivated using the
> > +:ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
> > +on the device capabilities.
> > +
> >  Interaction between routes, streams, formats and selections
> >  -----------------------------------------------------------
> >  
> > @@ -691,3 +710,8 @@ To configure this pipeline, the userspace must take the following steps:
> >     the configurations along the stream towards the receiver, using
> >     :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
> >     stream endpoint in each sub-device.
> > +
> > +   In case generic raw and metadata formats are used, :ref:`V4L2_CID_CFA_PATTERN
> > +   <image-source-control-cfa-pattern>` and :ref:`V4L2_CID_METADATA_LAYOUT
> > +   <image_source_control_metadata_layout>` controls are present on the source
> > +   sub-device to obtain the pixel array CFA pattern and metadata layout.
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > index e369978c2b50..490cd16186cd 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > @@ -153,6 +153,8 @@ Image Source Control IDs
> >  
> >      This is a read-only control.
> >  
> > +.. _image_source_control_metadata_layout:
> > +
> >  ``V4L2_CID_METADATA_LAYOUT (integer)``
> >      The metadata layout control defines the metadata layout on the device's data
> >      interface for metadata streams. The control is used in conjunction with
> > -- 
> > 2.47.3
> >

-- 
Kind regards,

Sakari Ailus

