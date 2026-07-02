Return-Path: <linux-media+bounces-66363-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4bLaE2RlRmqcSgsAu9opvQ
	(envelope-from <linux-media+bounces-66363-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 15:19:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D5C6F8417
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 15:19:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=G51Ofx3c;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66363-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66363-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3046311AD81
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 13:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0684944BC82;
	Thu,  2 Jul 2026 13:11:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192464534BB
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 13:11:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997869; cv=none; b=CQ5A/KeYekRPZsv+ZLcfOb92ra+u4qYyixHIpa65KYC8Dbugj3l11mDNUK+ZJmvnwotjTbB5365UvNnrWNNzvoH694L9f6GAC4Ao2VIVluN9QD9r1ugTWGVORVQUgBRU4lxua8V7qVzG/KgqFPCEiBSj5pJ9fIMcdKB4PDiTzkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997869; c=relaxed/simple;
	bh=umSEOhggWeapKAffuewROdolS+ut2zENRjTyS++EiYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDz8P7TOGF2GeBar3T6xWHavQv/dlR/UvPqm8cF0m8xSe/2MQKbqbxOgMrR5dZAadZ8yk+hQHjy53IKEaPp3VjWy+ideHFRYsWjOVF46+x5RZ+GXMnfbXLakmt/Snn38+XWENy3SXIvqbv/qIstQQ1MW2E4hR7OTcjvsoWoyUkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G51Ofx3c; arc=none smtp.client-ip=192.198.163.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782997868; x=1814533868;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=umSEOhggWeapKAffuewROdolS+ut2zENRjTyS++EiYg=;
  b=G51Ofx3cd4qVqwUNyKHtNxE028NM07lnBmrI2zlP6kITHMVfNP5QX0fn
   GUx/U7yQgorIRFBRzwu6s3Khzk/WL0MB43J/hXPqMTT7EGNFK2YeaTP4p
   dvm3+hvWE4AE0iMDBCmADte3G7RYv+bjKEPP+1M4Bpq8tT7ypZbCceEIr
   zYSym3JJ5C+MaSlNXLOrP2cLy8Pc3tc4tdBke63H3pyaXCt+ndWOY12hw
   xNTRXx0xX5OQSdnnJnGkXZ/fSU4J49t/EUvHE9WWijUi03H8Mx/pjs1mE
   HrQYTDp7+XnFo/jvphFm0pQJMt9zSBd8naq544Q1QPqoqVMahkEF6V67L
   g==;
X-CSE-ConnectionGUID: 2EcE1pxNTvefR/She5zCIg==
X-CSE-MsgGUID: l1r6Ic0YToG95JeIwUBJeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83802053"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83802053"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:11:07 -0700
X-CSE-ConnectionGUID: sI6xhU4vRDaIEP9wv1YReQ==
X-CSE-MsgGUID: hl6lZisrRBaTn61iWIpAYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251803665"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.229])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:11:01 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CF7E9121C2C;
	Thu, 02 Jul 2026 16:10:57 +0300 (EEST)
Date: Thu, 2 Jul 2026 16:10:57 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v12 27/86] media: uapi: Add V4L2_CID_BINNING control for
 binning configuration
Message-ID: <akZjYdju3vV-J-N9@kekkonen.localdomain>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
 <20260409201501.975242-28-sakari.ailus@linux.intel.com>
 <ad5jAqaTkHbIiUcA@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad5jAqaTkHbIiUcA@zed>
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
	TAGGED_FROM(0.00)[bounces-66363-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 95D5C6F8417

Hi Jacopo,

Thanks for the review.

On Tue, Apr 14, 2026 at 05:55:28PM +0200, Jacopo Mondi wrote:
> On Thu, Apr 09, 2026 at 11:14:02PM +0300, Sakari Ailus wrote:
> > Add V4L2_CID_BINNING control for configuring binning and enumerating a
> 
> Seems like the control is now named V4L2_CID_BINNING_FACTORS ?
> Also applies to the patch subject
> 
> Have I missed something ?

I guess the commit message wasn't updated when the control was renamed.
I'll do that for v13.

> $ git grep CID_BINNING include/
> include/uapi/linux/v4l2-controls.h:#define V4L2_CID_BINNING_FACTORS             (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 13)
> 
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
> 
> This needs to be updated as well ?

Yes.

> 
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
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index 4618252d24f2..fee343667b69 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1160,6 +1160,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >  	case V4L2_CID_CFA_PATTERN:		return "Color Filter Array Pattern";
> >  	case V4L2_CID_CFA_PATTERN_FLIP:		return "CFA Pattern Flip";
> >  	case V4L2_CID_METADATA_LAYOUT:		return "Metadata Layout";
> > +	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
> >
> >  	/* Image processing controls */
> >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > @@ -1438,6 +1439,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >  	case V4L2_CID_HDR_SENSOR_MODE:
> >  		*type = V4L2_CTRL_TYPE_MENU;
> >  		break;
> > +	case V4L2_CID_BINNING_FACTORS:
> >  	case V4L2_CID_LINK_FREQ:
> >  		*type = V4L2_CTRL_TYPE_INTEGER_MENU;
> >  		break;
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 1bf6d298e3c4..5496b1664432 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1249,6 +1249,8 @@ enum v4l2_jpeg_chroma_subsampling {
> >
> >  #define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
> >
> > +#define V4L2_CID_BINNING_FACTORS		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 13)
> > +
> >  /* Image processing controls */
> >
> >  #define V4L2_CID_IMAGE_PROC_CLASS_BASE		(V4L2_CTRL_CLASS_IMAGE_PROC | 0x900)
> > --
> > 2.47.3
> >
> >

-- 
Regards,

Sakari Ailus

