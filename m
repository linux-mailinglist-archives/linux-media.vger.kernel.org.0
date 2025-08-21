Return-Path: <linux-media+bounces-40588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC094B2FA92
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9629BAA3FF1
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22171335BA4;
	Thu, 21 Aug 2025 13:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B7E7cI3E"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E6032BF37
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 13:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782856; cv=none; b=gd0S3GodSF8gyjJnDSvZADfB8UX/fVXT0+EE+kh5BZH0RqFb9/ORyt4ZYysCa1IFfBWB1dexPfbA3sXDyCM0z6gITS1vPDbtzwPeIY7siS/yJvMlCSBDLxCQweXilV7JRRguLH/p7k/OjuCACYy1srO1sUJHDfVeUm/kUyyAtiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782856; c=relaxed/simple;
	bh=HvPfBTHozEkUbEnM0accUL58pSwpXKRg1UBuc1TKCCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BwSQ30zQW+KyA3bghKkQaEz+Hc3hWu0CK3eGsUi6hx6CmX3moApVJJZVRvy0IBgXm9AnTmufyf8SRAtQnuez5gUb/2ywVXZm4hY9cTHkr+9FujEwYEkv44EXGZggnNDayPR9/5H+ePby+man27XPF8cqvPKeIVCcS/YSX+Zcp0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B7E7cI3E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5D199C7B;
	Thu, 21 Aug 2025 15:26:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755782793;
	bh=HvPfBTHozEkUbEnM0accUL58pSwpXKRg1UBuc1TKCCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B7E7cI3EZnGd8gef3R1agtbCYhPnSOXiEEsa41J6FppDEEs16zuG76XGifq1vbtbC
	 aNEXV5i+3wsA9PsE6mUhzmkIkTNgEQgUynfq//lo1rIpdEpV6vOMkh8krHTcnraxnp
	 Z79ua1ICFMdtoK9FDO4rbg/zzk2c57AVtIclQnus=
Date: Thu, 21 Aug 2025 16:27:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Keke Li <keke.li@amlogic.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2 0/3] Drop control handler argument support for
 v4l2_get_link_freq()
Message-ID: <20250821132709.GA1484@pendragon.ideasonboard.com>
References: <20250821121207.552993-1-sakari.ailus@linux.intel.com>
 <20250821124148.GE8865@pendragon.ideasonboard.com>
 <aKcXdDDxzsNZ2Bq2@kekkonen.localdomain>
 <20250821130125.GF8865@pendragon.ideasonboard.com>
 <aKcd9DtPXy7j7yYQ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKcd9DtPXy7j7yYQ@kekkonen.localdomain>

On Thu, Aug 21, 2025 at 04:24:04PM +0300, Sakari Ailus wrote:
> On Thu, Aug 21, 2025 at 04:01:25PM +0300, Laurent Pinchart wrote:
> > On Thu, Aug 21, 2025 at 03:56:20PM +0300, Sakari Ailus wrote:
> > > On Thu, Aug 21, 2025 at 03:41:48PM +0300, Laurent Pinchart wrote:
> > > > On Thu, Aug 21, 2025 at 03:12:04PM +0300, Sakari Ailus wrote:
> > > > > Hi folks,
> > > > > 
> > > > > This set removes the workaround from v4l2_get_link_freq() that allowed
> > > > > calling it on a control handler. The Amlogic c3-mipi-csi2 driver is
> > > > > converted in the process as well.
> > > > > 
> > > > > As a result there's also no definition of v4l2_get_link_freq() without
> > > > > CONFIG_MEDIA_CONTROLLER but that should be fine now. The Amlogic patch is
> > > > > untested.
> > > > 
> > > > Could you please cherry-pick
> > > > https://lore.kernel.org/linux-media/20250821000944.27849-2-laurent.pinchart@ideasonboard.com/
> > > > and include it in this series ?
> > > 
> > > If a pad is const, I'd expect the container sub-device would be, too. I'll
> > > see if anything breaks if media_entity_to_v4l2_subdev() would switch to use
> > > container_of_const().
> > 
> > pad->entity will still not be const, so media_entity_to_v4l2_subdev()
> > will return a non-const pointer anyway.
> 
> It may be technically correct but const suggests the argument (and what is
> referred from that) is const henceforth, but that's not the case.

Yes, and that's why I'm adding a const here. The function retrieves the
link frequency, it should not change the state of the pad, entity or
subdev. That's the meaning conveyed by the API change. Internally, due
to the nature of the C language, we go from a const struct media_pad to
a non-const sturct media_entity. That's fine, it's inside the
v4l2_get_link_freq() function, and it means the function must simply be
careful not to break the API contract. It doesn't change the nature of
the contract.

> I simply wouldn't change this. 

-- 
Regards,

Laurent Pinchart

