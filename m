Return-Path: <linux-media+bounces-66341-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G88CJIFURmrFQwsAu9opvQ
	(envelope-from <linux-media+bounces-66341-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 14:07:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7686F753C
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 14:07:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="LXXK//Wa";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66341-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66341-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BD303047E45
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 11:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDCC3D904C;
	Thu,  2 Jul 2026 11:06:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556703C3BE2
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 11:06:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782990381; cv=none; b=Ti57BvsYLD1q48jDn3+Q4CMUzP/kwPfSvzcqNKsfIrVrjD3+GWy8YEMryA6aWnpTitb/r+h6xKBMc4cldhgsxZQvm/eibI8Itp8jBpvdKhQjCLtHCnsrymnQO0i2dRSngz0+bZSlQo7YbvzA2kKgmQa4CbcWwTuhRT6DR2kfTzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782990381; c=relaxed/simple;
	bh=M7rVo8gVWIcPlgSET/5BobYVSHN+EotPYHFYCGhT8H0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktz3057kn6+Ny7AJqjaHt2wIQmB/dVlERf9/UCRs1+JxuHv3d1g6oqlD7AkvREoVNeczw4pgY8zp+5Za//11pjUESyg8frIfMaocAGhsKWrVFmrX9H3ykZw2mt049CQWGL2FVLpvYGryS4NPEhFMGo1xSM4oIwCy3Y6Ew0GEHaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXXK//Wa; arc=none smtp.client-ip=198.175.65.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782990380; x=1814526380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M7rVo8gVWIcPlgSET/5BobYVSHN+EotPYHFYCGhT8H0=;
  b=LXXK//WaXMSABXyCfcLf/AD5RozEOn8inSexiyT87tWoTKAlNBUwFsXh
   ElghCA3JxqMXERDx2Iz9gn+7LkU99zlgYVfxuUoNCkCVK/kzLizgE5r/+
   pJ5ErRnyfRcWO6xLW7kZROBfVEa0FBOTR5lVA13tLY+FdjDYwy2EJRpKz
   6FxIcVn8IHGmvI6Gw09muydeXfh7MJZcErmYO6RmQzj34DKTLoZLu/xzT
   IxgG9ml8FYyMoU0p9ai3j77Xoic7Tjcd4sCPLwo4Vz2+S8L81B7JkVwNR
   D8gHyyvJfywAuMbgvCd4wkXnadVtM4orFpSe1O6xp6Ev0PQSRp7kuaL5/
   g==;
X-CSE-ConnectionGUID: Vf7bYuavQD+SWhTSnWQO1Q==
X-CSE-MsgGUID: qxPYv/YGS+e17QJoJGHJqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83831122"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83831122"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 04:06:19 -0700
X-CSE-ConnectionGUID: fgCTQpOBQHSiY6hrSBklMw==
X-CSE-MsgGUID: fYciMMYJQJCs7PkydT9xvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="277158521"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.229])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 04:06:13 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C4578121C29;
	Thu, 02 Jul 2026 14:06:09 +0300 (EEST)
Date: Thu, 2 Jul 2026 14:06:09 +0300
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
Subject: Re: [PATCH v12 05/86] media: uapi: Add V4L2_CID_CFA_PATTERN for
 describing color patterns
Message-ID: <akZGIehJsfGv8ZbH@kekkonen.localdomain>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
 <20260409201501.975242-6-sakari.ailus@linux.intel.com>
 <178240963924.1799417.13645477490024464265@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178240963924.1799417.13645477490024464265@freya>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66341-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE7686F753C

Hi Jai,

On Thu, Jun 25, 2026 at 11:17:19PM +0530, Jai Luthra wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thanks for the review!

> 
> Quoting Sakari Ailus (2026-04-10 01:43:40)
> > Add V4L2_CID_CFA_PATTERN to tell the camera sensor's native Color Filter
> > Array (CFA) pattern.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> > ---
> >  .../media/v4l/ext-ctrls-image-source.rst      | 43 +++++++++++++++++++
> >  .../media/v4l/subdev-formats.rst              |  2 +
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
> >  include/uapi/linux/v4l2-controls.h            |  6 +++
> >  4 files changed, 52 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > index f9c0b7ad3b4e..b09ad4b4576e 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > @@ -93,3 +93,46 @@ Image Source Control IDs
> >      representing a gain of exactly 1.0. For example, if this default value
> >      is reported as being (say) 128, then a value of 192 would represent
> >      a gain of exactly 1.5.
> > +
> > +``V4L2_CID_CFA_PATTERN (integer)``
> > +    This control determines the color components and native pixel order in the
> > +    sensor's CFA (Color Filter Array) when used in conjunction with
> > +    :ref:`generic raw mbus codes MEDIA_BUS_FMT_RAW_x (where 'x' is the bit
> > +    depth) <v4l2-mbus-pixelcode-generic-raw>` pixelcodes. The native pixel
> > +    order is constant for a given device, it is not affected by cropping or
> > +    flipping.
> > +
> > +    This control may only be used on V4L2 sub-devices.
> > +
> > +    This is a read-only control.
> > +
> > +    Available patterns:
> > +
> > +.. flat-table:: V4L2 Color Filter Array Patterns
> > +    :header-rows:  1
> > +    :stub-columns: 0
> > +    :widths:       1 2 1
> > +
> > +    * - Macro name
> > +      - Synopsis
> > +      - Value
> > +    * - V4L2_CFA_PATTERN_GRBG
> > +      - Bayer pattern (2x2 macroblocks). Each macroblock has a green filter in
> > +        the top-left and bottom-right pixels, a red filter in the top-right
> > +        pixel, and a blue filter in the bottom-left pixel.
> > +      - 0
> > +    * - V4L2_CFA_PATTERN_RGGB
> > +      - Bayer pattern (2x2 macroblocks). Each macroblock has a green filter in
> > +        the top-right and bottom-left pixels, a red filter in the top-left
> > +        pixel, and a blue filter in the bottom-right pixel.
> > +      - 1
> > +    * - V4L2_CFA_PATTERN_BGGR
> > +      - Bayer pattern (2x2 macroblocks). Each macroblock has a green filter in
> > +        the top-right and bottom-left pixels, a blue filter in the top-left
> > +        pixel, and a red filter in the bottom-right pixel.
> > +      - 2
> > +    * - V4L2_CFA_PATTERN_GBRG
> > +      - Bayer pattern (2x2 macroblocks). Each macroblock has a green filter in
> > +        the top-left and bottom-right pixels, a blue filter in the top-right
> > +        pixel, and a red filter in the bottom-left pixel.
> > +      - 3
> 
> WDYT about adding a V4L2_CFA_PATTERN_MONO or similar here?
> 
> This would help us re-use MEDIA_BUS_FMT_RAW_xx across mono/color variants
> of the same sensor (like IMX678), and applications supporting the new raw
> sensor model can also have a simple code-flow of always reading the
> CFA_PATTERN control instead of handling MEDIA_BUS_FMT_Yxx separately.

I'll add this to v13.

We also have a chance now to differentiate visible light vs. infrared etc.
here. The sensitivity of different sensors for visible light differs,
too, but some information might be useful here.

Some of the other patterns have various kinds of pixels, too, and we may
need additional interfaces to convey this information to the userspace in
the future -- or just keep it in the userspace.

-- 
Regards,

Sakari Ailus

