Return-Path: <linux-media+bounces-41698-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BAEB4232B
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 16:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DF4E3A35E1
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAAF302CB6;
	Wed,  3 Sep 2025 14:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMx18jOP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160AB2FE587
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 14:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908597; cv=none; b=naQ1L2e4v39Z/ZpstebU7AY/j/OdXSRe7i2EidL1CKvTcL2OKQRy0nMeWnKU2+3puarcSTmvagmCGF8B2StAueN1vU8rfsbakCTL3Feys9Tivoi7l1T0vxUTXWFXLreXHGJrUiXyPHMJxg1f5BFvLElcxiD+swXxg2a4XZznuyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908597; c=relaxed/simple;
	bh=dnJAevJFjjG27GAtPKxafCKPt8rLzruLRRhLXTV+wsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9zYjtBtG1guOqG4jCT+EgXFyQI31psPpcQo0cu8GNvBYsKKei0ErczsZ4RmobDGsttiPjPiWiOaQwXqafAgN2FLLFY11D3tqczPfgpKWVmgIy3jAESmTHOB05AzBzp0eF1hQe5RHv41ZinBUeRdHv19n9Nvoi5TbQW7gdNucyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMx18jOP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756908596; x=1788444596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dnJAevJFjjG27GAtPKxafCKPt8rLzruLRRhLXTV+wsA=;
  b=dMx18jOPS8cFna1urjBlQkmHjuD3Uxp/rvxflnE/k4YSp1T5wk/O2Ezv
   PkE73WOoBG4fwqRqHACgAIvpKGz07/UE5jPbwKSdMFZ/qcCc/BW+3UHom
   YWzYW7C+ZQrDOEuS6KVmI7dvyu8AOetijNlcSBV2A10HnXMbeebxnCLI3
   QnLhGegimaZMDl+Kz38QAbel0ktltUCGigsqSddVgFcFjJ1DZN846X5Td
   yE+wLU7IL9juYj1B586QdOwcRoEUMlj0c//2zF4WA5AkRJ1uCkZugsRlU
   J98QOztf1UkdZjD6zkcY8BGWJMcFPwafH1rqSGqLnhKH/Sq4LkhlzQ6H9
   w==;
X-CSE-ConnectionGUID: howAYo2KRxiAHz2eMZcCyA==
X-CSE-MsgGUID: 3rQDXTbyRFO87H+dAY2IDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="69926468"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="69926468"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 07:09:49 -0700
X-CSE-ConnectionGUID: Wo7gJUzhTqacPeHzBmFD0Q==
X-CSE-MsgGUID: B7lb8r8WRmKD3mukuofgkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="195240269"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.204])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 07:09:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0C43F11F99F;
	Wed, 03 Sep 2025 17:09:38 +0300 (EEST)
Date: Wed, 3 Sep 2025 17:09:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
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
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 03/66] media: Documentation: There are either
 immutable or mutable routes
Message-ID: <aLhMIXb34Iiv6gCL@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-4-sakari.ailus@linux.intel.com>
 <20250903132226.GE3648@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903132226.GE3648@pendragon.ideasonboard.com>

On Wed, Sep 03, 2025 at 03:22:26PM +0200, Laurent Pinchart wrote:
> On Mon, Aug 25, 2025 at 12:50:04PM +0300, Sakari Ailus wrote:
> > Document that each sub-device may have either immutable or mutable routes,
> > not both of them.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/userspace-api/media/v4l/dev-subdev.rst | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index f30a98a9cf78..4da67ee0b290 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -594,6 +594,11 @@ and user-created routes are fully replaced when ``VIDIOC_SUBDEV_S_ROUTING`` is
> >  called on the sub-device. Such newly created routes have the device's default
> >  configuration for format and selection rectangles.
> >  
> > +A sub-device may only have either immutable routes (routes that have
> > +``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE``) flag set or routes that are all user-created
> 
> ``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE`` flag set) or routes that are all user-created
> 
> > +or user-removable (routes that do not have ``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE``
> > +flag). This is subject to change in the future.
> 
> I'd add
> 
> Mixing immutable and non-immutable routes is not allowed.
> 
> between the two sentences.
> 
> But... that's actually not right. An immutable route is always active.
> What we don't allow is combining driver-created "static" routes (as in
> routes that can be disabled but can't be removed) and user-created
> "dynamic" routes.

Indeed, this should be discussing the STATIC flag. The two aren't the same
even though often set (or unset) in the same occasion.

-- 
Sakari Ailus

