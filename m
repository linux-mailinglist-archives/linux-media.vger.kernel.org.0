Return-Path: <linux-media+bounces-22869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B589E8F6F
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 10:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 412A2281D2A
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 09:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85EAD218ACD;
	Mon,  9 Dec 2024 09:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bp9orZ97"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392AE21660D;
	Mon,  9 Dec 2024 09:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733738001; cv=none; b=CMKAnXHzM9vTd+++u1anCrvsrux9QyYBcFqrdUJv1ekkApoSeOxDbJGAjadoj3aolBUuNcfrbZil29gwWqBYUI0KXDfmmh9fvd0geaI46p37zY2p205k966l8DzD2kH6VKCFT1iYg2Rq17k9BSb8Mchkcz4kDrnP3RloY9i4dEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733738001; c=relaxed/simple;
	bh=qmqlQ0SK+gQx6stg+eRMu+glM1RrZ6TpsciE4zz2ci4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uu8Z8wWlw0bQ94Je7qsorly0dgJ1cT48JywWoBwlIfITzMU5CnsKQgkHGmeGogNLNOy5T1TnurUtuGb8ZxknI4lJw8j7kl8dMkEKGMjsxTlLCYJseELV6qhpD9/Pu/piFt++nWYnKyXZ1Ky/K5DElkulTrJPWgGY7TVwqzd1ph4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bp9orZ97; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733738000; x=1765274000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qmqlQ0SK+gQx6stg+eRMu+glM1RrZ6TpsciE4zz2ci4=;
  b=bp9orZ976t+99sP6H5qtGlx/LBXB+Fu2IkkaDvIeW1vPkcL3Z64Ru9YY
   3xIVsktlYd3+oZVrb+1uGIqGt7I7Gv5uZRcztXjhEPsNzx+RGZwB5Dx3J
   ZaA2tKErj6G+ZlMgAViM8TjEQA86ukH+NjS4v9NmOC5xtHnRnzrELL/Xr
   0Tvy1Ro44dpjgSFARUbIpgZcDBZHlQ0Fr+jnsHrYedYCZ+S8h+z7NRkea
   wMFhp5pJTIdQd3j5nR4M5ahZhX0YKdnjTzpE9mH6Hk02MqS7HaOGo+h6W
   4DGQ672GHbVxtAhVUntiXl1JL5eOvGzR2aFf/0zQyzItR2eWJvkZy08Fc
   Q==;
X-CSE-ConnectionGUID: UrSRBcAYRHuhnPZXxVLqpg==
X-CSE-MsgGUID: XU9qxQ6cTtSVF1KqLIBdyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33369953"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="33369953"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 01:53:18 -0800
X-CSE-ConnectionGUID: CRbdIBR9TeuybfWNZCI6jg==
X-CSE-MsgGUID: +88ZpgNcQuOXHXGdNOj1Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="100054980"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 01:53:17 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A4B8911F775;
	Mon,  9 Dec 2024 11:53:13 +0200 (EET)
Date: Mon, 9 Dec 2024 09:53:13 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 01/15] media: i2c: ds90ub9x3: Fix extra
 fwnode_handle_put()
Message-ID: <Z1a-CV02K_o4rMHU@kekkonen.localdomain>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
 <20241204-ub9xx-fixes-v3-1-a933c109b323@ideasonboard.com>
 <Z1azue3G14MQpfiI@kekkonen.localdomain>
 <c740c233-315f-4431-8b86-8bdc1e3a72de@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c740c233-315f-4431-8b86-8bdc1e3a72de@ideasonboard.com>

Moi,

On Mon, Dec 09, 2024 at 11:46:45AM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 09/12/2024 11:09, Sakari Ailus wrote:
> > Huomenta,
> > 
> > On Wed, Dec 04, 2024 at 01:05:15PM +0200, Tomi Valkeinen wrote:
> > > The ub913 and ub953 drivers call fwnode_handle_put(priv->sd.fwnode) as
> > > part of their remove process, and if the driver is removed multiple
> > > times, eventually leads to put "overflow", possibly causing memory
> > 
> > This is, in fact, an extra put. It'll lead to underflow, not overflow.
> 
> Well, there are too many puts, so "put overflow" =). I don't think underflow
> is the right word here either, but it's probably better than overflow. Maybe
> I'll reword it so that it doesn't have a flow at all.

Sound good.

> 
> > I'd expect removing it once would be already too much.
> 
> True, but there's something keeping some refs to the fwnode even without
> these drivers (otherwise they'd be freed when these drivers are not around),
> so the issue shows only when those refs are taken out by the puts in these
> drivers.

Port nodes perhaps?

-- 
Terveisin,

Sakari Ailus

