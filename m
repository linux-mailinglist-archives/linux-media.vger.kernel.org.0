Return-Path: <linux-media+bounces-36037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3BCAEA629
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 21:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 814031886FF5
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 19:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4053C2EF66E;
	Thu, 26 Jun 2025 19:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sdIezr1S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435BD2F1FF9
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 19:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750965234; cv=none; b=bw4PeN2pZWDt5ovjHQ1wDBPwROOFPEZarO8P6RkgYZmAFiQml6V6NkIpu5w55vDPzb5Wo0KUWsf9au+3gSsoJWvx4WYFFl+ujIJ7ojUy+2ZLQzw7XlYXrH7sk1P6q+ZLTOJvnqiSswSkQ7WAZ5VUedEFTrPJNdHUVxeOx7gbFjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750965234; c=relaxed/simple;
	bh=3g/EkLqA4820oFqWIcKdpYjLi09S2HiDVU6a1SqoXIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5QhW8dFZEHsvBZSTvWZOC87LfnIr4lvTmGYWoJj55aV0DQaLRNVPhmXcQMiUQ/9WlRASt2lwdX021hWtY/mge5nzSl9FTDB44YVAhmXSb0ja7HxdVtBeX6a9uQLRcOab7uBACvX79hV6Nn5jAvQddnMQVQvVpirIV+FCR1c4Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sdIezr1S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DC46F833;
	Thu, 26 Jun 2025 21:13:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750965213;
	bh=3g/EkLqA4820oFqWIcKdpYjLi09S2HiDVU6a1SqoXIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sdIezr1SfX1DppiZO4GwLZWvw2xU4prrVEyDi0N+QWUce4V62/7llSbvSgEROGBAR
	 M1WtGFQ5QwWY1oMSeV6cVxoXvfTtPOVpX4IQL7rQ0g/Iub2RKkQUFWxxhL6SXWkCQ2
	 +Qqn0g+oPxgg80KHFs0G0bDBq/X1qsZ/2QjDw/yw=
Date: Thu, 26 Jun 2025 22:13:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com
Subject: Re: [PATCH 06/13] media: v4l2-subdev: Mark both streams of a route
 enabled
Message-ID: <20250626191328.GD30016@pendragon.ideasonboard.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-7-sakari.ailus@linux.intel.com>
 <20250619165604.GH32166@pendragon.ideasonboard.com>
 <aFRYMWoi9vpsdYKa@kekkonen.localdomain>
 <02b301f8-267e-4c65-bdea-b96c83c88bcd@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <02b301f8-267e-4c65-bdea-b96c83c88bcd@ideasonboard.com>

On Thu, Jun 26, 2025 at 06:22:53PM +0300, Tomi Valkeinen wrote:
> On 19/06/2025 21:34, Sakari Ailus wrote:
> > On Thu, Jun 19, 2025 at 07:56:04PM +0300, Laurent Pinchart wrote:
> >> On Thu, Jun 19, 2025 at 11:15:39AM +0300, Sakari Ailus wrote:
> >>> Streams are stored in sink-source pairs in sub-device state.
> >>
> >> Is it really this simple ? Don't we support for instance stream merging
> >> where two streams on possibly different sink pads are routed to a single
> >> stream on a source pad ?
> > 
> > As far as I'm concerned, yes. Each route has a sink and a source pad, you
> > may have multiple routes from a pad or to a pad, but these are all separate
> > routes. The UAPI as well as v4l2-subdev.c is aligned with this and I
> > wouldn't expect it to be otherwise.
> 
> But with stream merging/splitting we'll have one stream config on one
> pad, and two stream configs on the other. And thus two routes from that
> one config.

With the current code, we will have duplicated stream config entries for
the same stream in that case. Only the first one will be seen by the
v4l2_subdev_state_get_format() function, but both will exist.

> That said, if I recall right, I don't think merging/splitting has ever
> been really explored...

-- 
Regards,

Laurent Pinchart

