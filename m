Return-Path: <linux-media+bounces-31865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B031AACACE
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 18:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2FAF7BC666
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 16:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F36284691;
	Tue,  6 May 2025 16:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdviS0Mn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E73A2853EB
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 16:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548535; cv=none; b=Mb5VRpHjodISKf8HoUHmJFuX9UDjeCy1QylPaWBVby2FFBPNZnlIySdtgZVkv97TzrC7c2jy/1/mR4oU0tSIjT6K6E3qGDjVPU+uIfOOz9HXlSdh7TT/+6kl/MSONmc/Kjcg4CIDtxO4cDF88GL/lV35ZoyDsdKEnDKS8RzYcN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548535; c=relaxed/simple;
	bh=0OJJiC4k3BdjB8BZWRyOYVKqnw0kOmKzFTYv6JnTVMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jgUX3UF8w1bOgA8Vh1BsckTkWwVSIp3MJpG9LGsfl1BLLN8Ml/UQP+KactAuXXSU+4gLW2uEOVoztNxZgqqwPC3sjkuNHAgsaL8Bp9RU9Br+eZSNqFDvjAuh+EuxMpKtWc3EHvdj3r/NyOGeVFSX3l7E+Xbj81alb5v7MlltaTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdviS0Mn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746548534; x=1778084534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0OJJiC4k3BdjB8BZWRyOYVKqnw0kOmKzFTYv6JnTVMM=;
  b=fdviS0MnVfGhIktN/eSbOuHs7XB0AO31A1y+EK/009IeN6gzH39o8sWP
   zKYtDAlzebAhCHeeHJ+gE5uHVcMi8CKRK5xGf4HZlVL4sla1HkiklsqG4
   JhHgGbsLOKqzHpyINNGNtB0lvvyRHXEfdLFervmpUElpJeOU9FOqYh9sU
   +zlwzB+hvechph87oqbchZzKHDReGKX9cBkIZh7YBeia1ZNNtjgTKBN6S
   pB+M3Q49mgRGOkGJq9D5p2K/DgGDZdwFOYM6nX+v/GdR8hRHW6SQDUVF/
   ZDmyBVR2NNcnwXCz7BS6pDHDhNrM7si5lXZcJdFAbcMP9aFGkdviMXCSV
   g==;
X-CSE-ConnectionGUID: 9Gl8Pg6URSOIUXa9h7mHTg==
X-CSE-MsgGUID: 3SFVwHVTRQeSMWwsAB3gLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35855024"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="35855024"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 09:22:13 -0700
X-CSE-ConnectionGUID: PRfgMLQrRyKVLGGMklGtJg==
X-CSE-MsgGUID: AspzHUC2TBCy1pdDXlGz+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="139733787"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.98])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 09:22:06 -0700
Date: Tue, 6 May 2025 18:21:55 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sean Young <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Tomasz Figa <tfiga@chromium.org>, 
	"Hu, Jerry W" <jerry.w.hu@intel.com>, Steve Cho <stevecho@chromium.org>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Kevin Hilman <khilman@baylibre.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Arthur Vinchon <arthur.vinchon@allegrodvt.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, Hans de Goede <hdegoede@redhat.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Maxime Ripard <mripard@kernel.org>, Stefan Klug <stefan.klug@ideasonboard.com>
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v4)
Message-ID: <5ldxin2mtevbzweu2p4innfe5wu3p4nbd4pbikfgddijxck7sl@l55lspiylvwi>
References: <f6d44024-a78e-42b8-971a-797ed8fbb1ff@jjverkuil.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6d44024-a78e-42b8-971a-797ed8fbb1ff@jjverkuil.nl>

Hi Hans,

On Fri, May 02, 2025 at 10:15:27AM +0200, Hans Verkuil wrote:
> We have the following confirmed in-person attendees:
> 
> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> (Media Maintainer, Huawei)
> Nicolas Dufresne <nicolas.dufresne@collabora.com> (Collabora)
> Benjamin Gaignard <benjamin.gaignard@collabora.com> (Collabora)
> Hans de Goede <hdegoede@redhat.com> (Red Hat)
> Stefan Klug <stefan.klug@ideasonboard.com> (Ideas on Board)
> Paul Kocialkowski <paulk@sys-base.io> (sys-base)
> Jai Luthra <jai.luthra@ideasonboard.com> (Ideas on Board)
> Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas on Board)
> Benjamin Mugnier <benjamin.mugnier@foss.st.com> (STMicroelectronics)
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas on Board)
> Ricardo Ribalda <ribalda@chromium.org> (Google)
> Maxime Ripard <mripard@redhat.com> (Red Hat)
> Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
> Devarsh Thakkar <devarsht@ti.com> (Texas Instruments)
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> (Ideas on Board)
> Hans Verkuil <hans@jjverkuil.nl> (Media Maintainer, Cisco Systems Norway)
> Arthur Vinchon <arthur.vinchon@allegrodvt.com> (Allegro DVT)
> 
> And the following remote participants:

Hi Hans, Sorry for the VERY late response. Is is possible to add me to
the remote participants list ?

Mehdi Djait <mehdi.djait@linux.intel.com> (Intel)

> 
> Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
> Martin Hecht <mhecht73@googlemail.com> (Avnet Silica)
> Hu, Jerry W <jerry.w.hu@intel.com> (Intel)
> jackson.lee <jackson.lee@chipsnmedia.com> (Chips 'n Media)
> Mirela Rabulea <mirela.rabulea@nxp.com> (NXP)
> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)

--
Kind Regards
Mehdi Djait

