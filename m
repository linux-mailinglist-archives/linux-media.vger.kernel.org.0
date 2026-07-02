Return-Path: <linux-media+bounces-66364-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ivtRC1ZmRmrxSgsAu9opvQ
	(envelope-from <linux-media+bounces-66364-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 15:23:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DF86F849A
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 15:23:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=ILsiVUfg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66364-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66364-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0500304C60C
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 13:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC75E47DFB4;
	Thu,  2 Jul 2026 13:12:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE60A42E8E5
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 13:12:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997979; cv=none; b=JReSLX5t0JvSTgi8jowpl36UgJnS36x7k40Krhft1F/SPKjJOcU2JMYxuhAgPO2IGXP77XEd4lct7OQyG0DEfU+tD0/JSH2+I2XOMmj5MV5lIrtbKvFE1pZuEcGk7M6fZ8i1k90q4IYxlZP2G7kJEEkYYERRmYoqmttKpX1/cG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997979; c=relaxed/simple;
	bh=2dNe4t9FImP9d9XV3XrVS+GcyjEWABTPQeLrTNCKCCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtzBeKyqkSXbs3uDYXLRpTEg9p2pYXaG5RWbQtWhylfvZXOxzhMC/fjIj5W38D2H1opmCKi2HT53r9pgTA0Fenk1zQg4fKzZDGmhV5D2SHKEPKeKXU8AfQjFH3dr2QZz7esFiIdJw0kghjQPVbRHpN86/Ym27hvpaPxLu5KKxjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILsiVUfg; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782997977; x=1814533977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2dNe4t9FImP9d9XV3XrVS+GcyjEWABTPQeLrTNCKCCs=;
  b=ILsiVUfgm6YxoyDDAhBSNSIz5Wqci1nsUHNwzXOjHpo++8ZGI15Jw/g0
   XTSygSzxti4a3r2NMTKJYe8n07RACrdFFjs4C+vcShw+hEVPC9S9i1egW
   8Bq7eVqd0RN0xvfGzDfPYbPsjI6DoTi7LaxKDZ7XCHOsZJud2VrYLEtku
   x3VBONchERyoIWUiiphDz3/Jgu172XfJuixiY3CvklOJUoWIGr36L+cgs
   EpR8yorJoASjYu2claX0nGkPDZXNCKQHqEolMZMWiREIedbPLG37VZdol
   ssy+IKWNMNS6mcF2G53dvoWYcxeqEVeioDPIxItmH0xyOFirI+nrm6oIy
   A==;
X-CSE-ConnectionGUID: mutx4c3TQ3OdWhs6i8hDQQ==
X-CSE-MsgGUID: DSODh3MBTxaf6TtD3C2VVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83783128"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83783128"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:12:57 -0700
X-CSE-ConnectionGUID: TyRMvM6PRBa5cw6i3Erphg==
X-CSE-MsgGUID: MUIukMYgSDW41RGEL7p5mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="253521961"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.229])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:12:52 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0AEF7121C2C;
	Thu, 02 Jul 2026 16:12:48 +0300 (EEST)
Date: Thu, 2 Jul 2026 16:12:47 +0300
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
Subject: Re: [PATCH v12 27/86] media: uapi: Add V4L2_CID_BINNING control for
 binning configuration
Message-ID: <akZjz4T184PwoOGK@kekkonen.localdomain>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
 <20260409201501.975242-28-sakari.ailus@linux.intel.com>
 <178128831650.1799417.3287316914483188867@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178128831650.1799417.3287316914483188867@freya>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66364-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72DF86F849A

Hi Jai,

Thank you for the review.

On Fri, Jun 12, 2026 at 11:48:36PM +0530, Jai Luthra wrote:
> Hi Sakari,
> 
> Quoting Sakari Ailus (2026-04-10 01:44:02)
> > Add V4L2_CID_BINNING control for configuring binning and enumerating a
> > camera sensor's binning capabilities. The control combines horizontal and
> > vertical binning into a single control as the two are generally related.
> > 
> > New drivers should use this control to configure binning.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  .../media/drivers/camera-sensor.rst           | 12 ++++++++
> >  .../media/v4l/ext-ctrls-image-source.rst      | 30 +++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
> >  include/uapi/linux/v4l2-controls.h            |  2 ++
> >  4 files changed, 46 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index d8ba809486c5..12f075379bc8 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -120,6 +120,18 @@ values programmed by the register sequences. The default values of these
> >  controls shall be 0 (disabled). Especially these controls shall not be inverted,
> >  independently of the sensor's mounting rotation.
> >  
> > +Binning
> > +-------
> > +
> > +Binning has traditionally been configured using :ref:`the compose selection
> > +rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
> > +<image_source_control_binning_factors>` control is also available for binning
> > +configuration and users should use it when it's available. Drivers supporting
> > +the control shall also support the compose rectangle, albeit the rectangle may
> > +be read-only when the control is present.
> > +
> > +Binning isn't affected by flipping.
> > +
> >  .. _media_using_camera_sensor_drivers_embedded_data:
> >  
> >  Embedded data
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > index 490cd16186cd..0ef76b02a6e1 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > @@ -160,3 +160,33 @@ Image Source Control IDs
> >      interface for metadata streams. The control is used in conjunction with
> >      :ref:`generic metadata formats <media-bus-format-generic-meta>` formats to
> >      specify the layout of the data.
> > +
> > +.. _image_source_control_binning_factors:
> > +
> > +``V4L2_CID_BINNING_FACTORS (integer menu)``
> > +
> > +    This control determines horizontal and vertical binning factors. Binning
> > +    combines several horizontal, vertical or both pixel values into a single
> > +    pixel. It is a way to scale an image. Binning typically produces fairly good
> > +    quality output.
> > +
> > +    Determines both horizontal and vertical binning factors for a camera
> > +    sensor. The values are encoded in the following way:
> > +
> > +.. flat-table::
> > +    :header-rows:  1
> > +    :stub-columns: 0
> > +
> > +    * - Bits
> > +      - Synopsis
> > +    * - 48--63
> > +      - Horizontal binning numerator.
> > +    * - 32--47
> > +      - Horizontal binning denominator.
> > +    * - 16--31
> > +      - Vertical binning numerator.
> > +    * - 0--15
> > +      - Vertical binning denominator.
> > +
> > +For instance, a value of ``0x0001000300020003`` indicates binning by 3
> > +(horizontally) * 3/2 (vertically).
> 
> Shouldn't the value here be ``0x0003000100030002`?

Fixed for v13.

> 
> With that fixed,
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thank you.

-- 
Kind regards,

Sakari Ailus

