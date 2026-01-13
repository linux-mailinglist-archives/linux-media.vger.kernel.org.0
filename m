Return-Path: <linux-media+bounces-50606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04873D1B405
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 21:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E009A30735FF
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 20:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AD42FD7A0;
	Tue, 13 Jan 2026 20:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LuPFaHD6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127F4276051
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 20:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768336681; cv=none; b=YqmFlxb1J+EwX/lFIOtdJPJimHCgOqegaNZDStQWrU2uNEur9WEu26/Oo2ICjOdpZbHtv/X5W8EUPbPmF4o12LK2p0/Z8712E7/JgacxIO2CluqWitIemnxweCYFwp1F78+nIVZuNY+RlClivP7F9dVv4PIJlY4cvfE3FLgKClc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768336681; c=relaxed/simple;
	bh=IDK6XarFAj4QILAu3Ivdd9tZgKEm6rNot75621OQtIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Unft9wdC5KY/As682qMIx54FwEAYbafJAFn9CTf/5DNtMiT5tDIz7ofhTA0vfsllCou7+/NNd8AVN9ye3VEk1LJbP3+TlGNvZI7F15E1l5E29hm1gJcE/MG+he411jMWHuNo1R3ze1KlPMn4epjenrenUcqC6j16kPoqbbUuO/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LuPFaHD6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768336680; x=1799872680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IDK6XarFAj4QILAu3Ivdd9tZgKEm6rNot75621OQtIY=;
  b=LuPFaHD6AA7Z48ghSLpB/5w+CQVVYYUbIG0KoWfMyto3/x40WKywkL77
   Ng+hEMniLgDgTInQn3cqaZ3ZQVPJryfY6qI6kk4EXl9YExNLj7R6uwUTD
   mfjFP4cMuDKXTxtMzRX7X0ioij0C95Mp+W+HTDETtSyH2tusKiUg5zvSq
   7nZCVNgzo6+dlHv7L++zNx++ucIv+cjRO5pZzYsMv5VD7Ka/FWXUXUOqG
   f7IbysaPA2FrbgRvMXxs36jFoLZ+X0gnh45i5An5V5sqPteusfSauvPtS
   iSuAnzh7f1G68iFL6PGc4OJD++pOKcTxF0KIKs5VMU3cT3n8LipVWRY8e
   Q==;
X-CSE-ConnectionGUID: iisRgbbCR0qKrNDRktHpuA==
X-CSE-MsgGUID: T13UpsZGRyWZ4gijOsjGzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80352780"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80352780"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 12:37:55 -0800
X-CSE-ConnectionGUID: Pm42Ul18SlqzOkfZum7oBA==
X-CSE-MsgGUID: tPpwbiU/TqGAhsuoh4JG6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208644637"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.58])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 12:37:48 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1F3F511FBC5;
	Tue, 13 Jan 2026 22:37:46 +0200 (EET)
Date: Tue, 13 Jan 2026 22:37:46 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
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
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 22/64] media: Documentation: v4l: Document internal
 sink pads
Message-ID: <aWatGtXJrvKkGfL3@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-23-sakari.ailus@linux.intel.com>
 <6faf46b5-e48f-448f-90a7-19003b76d3f3@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6faf46b5-e48f-448f-90a7-19003b76d3f3@nxp.com>

Hi Mirela,

On Wed, Jul 23, 2025 at 02:52:11PM +0300, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 6/19/25 14:57, Sakari Ailus wrote:
> > 
> > 
> > Document internal sink pads, pads that have both SINK and INTERNAL flags
> > set. Use the IMX219 camera sensor as an example.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by Julien Massot <julien.massot@collabora.com>
> > ---
> >   .../userspace-api/media/v4l/dev-subdev.rst    | 151 ++++++++++++++++++
> >   .../media/v4l/ext-ctrls-image-source.rst      |   2 +
> >   2 files changed, 153 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index 24a69c419dfe..835e910d4391 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
> >   sub-device and a (pad, stream) pair. For sub-devices that do not support
> >   multiplexed streams the 'stream' field is always 0.
> > 
> > +.. _v4l2-subdev-internal-source-pads:
> 
> This ref does not match the subtitle below, would be nice to rename
> _v4l2-subdev-internal-sink-pads

I dropped it -- it was unused.

> 
> Other than that,
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>

Thank you!

-- 
Kind regards,

Sakari Ailus

