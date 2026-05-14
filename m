Return-Path: <linux-media+bounces-61629-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI74OmdJBmo3hwIAu9opvQ
	(envelope-from <linux-media+bounces-61629-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 00:15:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36161547619
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 00:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22C4930379AA
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 22:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7100F3C2769;
	Thu, 14 May 2026 22:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CcIZpVXl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4A937D127
	for <linux-media@vger.kernel.org>; Thu, 14 May 2026 22:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778796898; cv=none; b=ulEeOjm4AQNAMuJmlwiuOVgTqO3KkWuR93qDotzLeiBdUaOdqQXB9eh3l9H0IwpEDhz2X91k786iyXoVJ2UPtuLe3Qd6hNyFRSVQDZX/28fQI5d2e5e9OQp3roA1wsbB1HbLbmEfyFBVqE/UqnPk3srbpAaBw0YPfOU76yVADS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778796898; c=relaxed/simple;
	bh=KpWS3WG/wlh3PaFwfFvde+PAbWJn+DxyGEwwzcu/oGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGafo+oAaiz8d212o8wd8fyjMzgckfdq6qeY0M7Ax8FmN+/MxEZ2/68HNQYt10qiaB7Rc94Uwv32s2QJLz+ghDb+Ht8UrmyisxqDkUSFjWzv+DcIf9/HsL8y9WhCIzZmC7aYNvodiSZaCcudnRkgbnkAHYgN/N9ysGp5E0p5wcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CcIZpVXl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778796897; x=1810332897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KpWS3WG/wlh3PaFwfFvde+PAbWJn+DxyGEwwzcu/oGM=;
  b=CcIZpVXl13UW24pTixMziwdfUNWEp0wLhqhR8s7yQwywHB85N+KP9wqF
   ze3m7sCqXvyn4xqQ/tb+fUBs2LtGe1343fSBBnwVes/IKQbT7iMjSPrJk
   m6fsGNBzZ67oEqpevdMwHPVi/uoqrK7b73rLmfcDxEk40P0DNov8USZ60
   cjbSlX+Z2w2/I0MHwAQvW1oOlzWznClYodmlt7AMCLvyqNP0YEI7eDIrd
   hziUB+N5yFKsLUn4dN8BxQbI9q+u/dXAkiQJsoLJv+yS38KtbwV2pD7nh
   2i1iGATNFljkB2W7RAgpi1bXUsAxG0PchhjhoyuxXUnwqouDH06Umte+0
   Q==;
X-CSE-ConnectionGUID: ikr3zv5ORqGDdp7kbUkN+Q==
X-CSE-MsgGUID: 8WJLFVUjT6Wdpd88fWwpXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79731307"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79731307"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 15:14:56 -0700
X-CSE-ConnectionGUID: 8al1mNL7S825ZHdxwesTCw==
X-CSE-MsgGUID: XLdVX6YiTRuxYh8xZaYCog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="235865615"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.21])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 15:14:55 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E24DB121447;
	Fri, 15 May 2026 01:14:54 +0300 (EEST)
Date: Fri, 15 May 2026 01:14:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 10/17] media: nxp: imx8-isi: Use
 v4l2_subdev_get_frame_desc()
Message-ID: <agZJXtErVf-2WRiL@kekkonen.localdomain>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
 <20260513104358.2252605-11-sakari.ailus@linux.intel.com>
 <agVIaYwnJpUN7KLc@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agVIaYwnJpUN7KLc@lizhi-Precision-Tower-5810>
X-Rspamd-Queue-Id: 36161547619
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61629-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Action: no action

Hi Frank,

On Wed, May 13, 2026 at 11:58:33PM -0400, Frank Li wrote:
> On Wed, May 13, 2026 at 01:43:51PM +0300, Sakari Ailus wrote:
> > Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor. This is
> > preferred over calling the get_frame_desc() pad operation directly.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c     | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > index 605a45124103..5bb536465c57 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > @@ -5,6 +5,7 @@
> >   * Copyright (c) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >   */
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/device.h>
> >  #include <linux/errno.h>
> >  #include <linux/kernel.h>
> > @@ -32,7 +33,8 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
> >  	struct mxc_isi_dev *isi = xbar->isi;
> >  	const struct mxc_gasket_ops *gasket_ops = isi->pdata->gasket_ops;
> >  	const struct v4l2_mbus_framefmt *fmt;
> > -	struct v4l2_mbus_frame_desc fd;
> > +	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
> > +		NULL;
> >  	int ret;
> >
> >  	if (!gasket_ops)
> > @@ -44,15 +46,16 @@ static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
> >  	 * to match the configuration of the CSIS.
> >  	 */
> >
> > -	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc, remote_pad, &fd);
> > +	fd = v4l2_subdev_get_fmame_desc(remote_sd, remote_pad,
> > +					V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL);
> 
> cleanup.h perfer declear fd here
> 
> 	struct v4l2_mbus_frame_desc *fd __free(v4l2_subdev_free_frame_desc) =
> 		v4l2_subdev_get_fmame_desc()

That would indeed make sense. I'll take this into account for v2.

-- 
Regards,

Sakari Ailus

