Return-Path: <linux-media+bounces-30699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1A9A9654A
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 11:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E9653BC530
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 09:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776F0204840;
	Tue, 22 Apr 2025 09:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKFbLyj+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6275B1F1818
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315920; cv=none; b=L1uM872iK7khghBQ4KpjMgy6h+k4gpupUollBT3llciFvsnagH2AylqIG75lo2Da6TiIhykvdLFlmrn6Ty+1N7eHlwv6tx9W1j+v/4DqMDCjPk++tXUzvHlou+pnn61N4cI8rz2X/dmoxD7W6X+bQbMgvrPDRUquBJEFXgpokSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315920; c=relaxed/simple;
	bh=/btNzVZUGF5ZbZBH1sHWNc6Gckz9bD0aHejVWH2Kw5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpAk9bvEER/9sg866UVoYkr58JPTpkJ1luBmH+Nj8ipwdukih7j3WMmf3yPxx9e9CWBmNSLiJc+BbKKA6VFzxR83bjWmlDHHfIQqYl0WPoHcd6PljGaNTS+C1ngO9U4PgfVU6eCCkZq3yhCxsXmftsC5Ej7qPFgwITikXca8joQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKFbLyj+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745315920; x=1776851920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/btNzVZUGF5ZbZBH1sHWNc6Gckz9bD0aHejVWH2Kw5g=;
  b=kKFbLyj+1bPc2XNQwmkiWOZagxCO37Iw7SizhbHG6z82q0ijuTU3WGuC
   q3vcAP8Il899XoG9rkm5jkad/62AzaKtNRHNjPoF72wPlZC9eUBMuhlFv
   3ejiT6eHdUYTm9oteD6k/OMAz7vmFZ8pyqaB/GDRqARyhdAQyICCtpulE
   ogJbXh1EAFT4KBq3llI8EJJWuZMSNEMCoiT4UQnCnoe6fyISQkBkNIg8m
   AUerQzpk2jJFLpjWuw+CD2eSy3V/4gIAnU6+vZaxzlONPViMXavp81FCb
   n8CA1FdL0QCZqOW7wvXVgOnYVP9nOYnZ+LKpuGc2nYrmYZqq4NSM6njas
   A==;
X-CSE-ConnectionGUID: qrckCHlKQJ6k+HfV7BV3Lw==
X-CSE-MsgGUID: ntA0XzhuQ1a3vpBuNRcgsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="47048431"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="47048431"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 02:58:39 -0700
X-CSE-ConnectionGUID: Cq3qOo41T0y/oIgSrSPeag==
X-CSE-MsgGUID: 0huv+qHiT+WvaGiuvmVhaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="132506418"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 02:58:32 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7640B11FA2F;
	Tue, 22 Apr 2025 12:58:29 +0300 (EEST)
Date: Tue, 22 Apr 2025 09:58:29 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>, Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Arthur Vinchon <arthur.vinchon@allegrodvt.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v2)
Message-ID: <aAdoRQseaaEDx5R0@kekkonen.localdomain>
References: <71a1ba46-04c3-4694-95e7-9e2906b1d899@jjverkuil.nl>
 <aAdGN8QaxU4XQcL2@kekkonen.localdomain>
 <34e53856-1a6b-4db2-b6ce-a8862c415034@jjverkuil.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34e53856-1a6b-4db2-b6ce-a8862c415034@jjverkuil.nl>

Hi Hans,

On Tue, Apr 22, 2025 at 09:59:38AM +0200, Hans Verkuil wrote:
> On 22/04/2025 09:33, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Mon, Apr 21, 2025 at 02:31:34PM +0200, Hans Verkuil wrote:
> >> Also, as you can see we are light on topics, so don't hesitate to add more.
> > 
> > I'd like to propose identifying camera modules as a topic.
> > 
> > The camera module isn't a functional component in the system and so has
> > (mostly) been omitted in system firmware as well as UAPI. Being able to
> > identify it, however, is becoming more and more important as the user space
> > becomes less and less system specific, largely thanks to libcamera. This
> > isn't just about passing information to the userspace as identifying the
> > modules themselves is a problem on its own.
> > 
> > I intend to post an RFC set regarding this to LMML at least a week before
> > the summit.
> > 
> 
> Thank you, I added this to the draft agenda. Do you have a guesstimate for the time you'll need?

I'd guess from 30 to 45 minutes, but it heavily depends on how much there
will be discussion.

-- 
Sakari Ailus

