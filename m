Return-Path: <linux-media+bounces-21980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F269D850E
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 13:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AF672881AE
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 12:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7150199FBA;
	Mon, 25 Nov 2024 12:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QfFYkWXF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE6419146E;
	Mon, 25 Nov 2024 12:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732536458; cv=none; b=JyPGVzw2HTgw1VwFG3Ky3YCqZ12prLQ6wEqopAC6S4uecQguyotJTwEhC45EvoSjrJ0+7stdHc2oZCVwql3E+fA33J/gbVsNTvsd/qDCg89sF6iFZnZcAPY+h1TPoNSewyCXZqii2q4x3PBk6nNPnFPBbh0toye7u7J4qe5uqNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732536458; c=relaxed/simple;
	bh=R01beLZ4YFaqdF6EsHFi8Y1vIcFrETivFyk1AC46si8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBIYzRhrtSVtLvttYdQaw5CdAle4IibMgzPi+N2bWdnueC/aGD+qiIICYPpNW1GkK9lJDKf0cehMOgLXzGluAqSMXO7ATnmaXlqPwaWWcHJFuFwP4Eo5CvVsOYnCzUs8PGqOg11N0CjXu20DCI+UIeu/0r7nPHT49rnnJvtjlhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QfFYkWXF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB45BA2F;
	Mon, 25 Nov 2024 13:07:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732536432;
	bh=R01beLZ4YFaqdF6EsHFi8Y1vIcFrETivFyk1AC46si8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QfFYkWXFVEBldFAEycAa5OX9yTPNTf1Kp2OfkSS+fsDS+J73rRZiSUHsgqZ3f2wLH
	 K/XflwA2W4GXJxrpbllVqtxz7YMAi20xz4SFwqtiCjjk8RZ+8gzs2C7CNfKNC4n8Kq
	 HtA8gQgz8nnTI9mYbeIYsXgxLtaGyYFT8OoLJXt0=
Date: Mon, 25 Nov 2024 14:07:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l: subdev: Prevent NULL routes access
Message-ID: <20241125120725.GI19573@pendragon.ideasonboard.com>
References: <20241122143717.173344-1-demonsingur@gmail.com>
 <Z0Q3ukermwmPax2b@kekkonen.localdomain>
 <0ff25743-30c6-4c26-955f-c4c26578ebb6@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0ff25743-30c6-4c26-955f-c4c26578ebb6@ideasonboard.com>

On Mon, Nov 25, 2024 at 01:33:15PM +0200, Tomi Valkeinen wrote:
> On 25/11/2024 10:39, Sakari Ailus wrote:
> > On Fri, Nov 22, 2024 at 04:37:12PM +0200, Cosmin Tanislav wrote:
> >> When using v4l2_subdev_set_routing to set a subdev's routing, and the
> >> passed routing.num_routes is 0, kmemdup is not called to populate the
> >> routes of the new routing (which is fine, since we wouldn't want to pass
> >> a possible NULL value to kmemdup).
> >>
> >> This results in subdev's routing.routes to be NULL.
> >>
> >> routing.routes is further used in some places without being guarded by
> >> the same num_routes non-zero condition.
> >>
> >> Fix it.
> > 
> > While I think moving the code to copy the routing table seems reasonable,
> > is there a need to make num_routes == 0 a special case? No memcpy()
> > implementation should access destination or source if the size is 0.
> 
> I think so too, but Cosmin convinced me that the spec says otherwise.
> 
>  From the C spec I have, in "7.21.1 String function conventions":
> 
> "
> Where an argument declared as size_t n specifies the length of the array for a
> function, n can have the value zero on a call to that function. Unless explicitly stated
> otherwise in the description of a particular function in this subclause, pointer arguments
> on such a call shall still have valid values, as described in 7.1.4.
> "
> 
> The memcpy section has no explicit mention that would hint otherwise.
> 
> In 7.1.4 Use of library functions it says that unless explicitly stated 
> otherwise, a null pointer is an invalid value.
> 
> That said, I would still consider memcpy() with size 0 always ok, 
> regardless of the src or dst, as the only memcpy implementation we need 
> to care about is the kernel's.

I was going to mention that too. The kernel C library API is modeled
on the standard C library API, but it takes quite a few liberties.

What I think is important in the context of this patch is to ensure
consistency in how we model our invariants. I'm less concerned about
relying on memcpy() being a no-op that doesn't dereference pointers when
the size is 0 (provided the caller doesn't otherwise trigger C undefined
behaviours) than about the consistency in how we model routing tables
with no entry. I'd like to make sure that num_routes == 0 always implies
routes == NULL and vice versa (which may already be the case, I haven't
checked).

-- 
Regards,

Laurent Pinchart

