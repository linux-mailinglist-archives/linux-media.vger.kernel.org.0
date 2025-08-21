Return-Path: <linux-media+bounces-40582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22416B2F987
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2A763BC979
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84ED31E0F3;
	Thu, 21 Aug 2025 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a51wQ/3Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F5131CA59
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 13:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755781313; cv=none; b=iXP+h//GIiPdwpKCxj/gR8xItyDHQ5VFKQnsVBO7hBThwXF2IkyinShh83nFYC4pS+iRO7jEBZ43KhD5+13nhR7h3EepP1uyKio54obs6FWDlNG1u6Wvlg2UVWbLC6zq4lLAICDX576ovBmt7QVeo+QJdS6jN8RLdICpPTRl5Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755781313; c=relaxed/simple;
	bh=NDCQKksbbW/Par6OMV0t9Q4IoXVY/Pv0bKvxBAPBCYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwEklL6tPDfaMZueoGlAKLRfG8rRposi+GrJSLQis61IiKxNovk/CwL0Z9Alg855XUaIB2W5kTqwsElZoa+aQGhvOEO4lD+xg1ttZ1v0UDsFBxJe4UpNou7rOKyy4N00jmgYG41FDNh5A/mt4EoVMjH6likQ8J0nH+RKyFn7h7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a51wQ/3Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3FC52EFF;
	Thu, 21 Aug 2025 15:00:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755781250;
	bh=NDCQKksbbW/Par6OMV0t9Q4IoXVY/Pv0bKvxBAPBCYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a51wQ/3YGp0qedmpN6Jm70S5iOe6MKAuhlJ1w0SY+EwWxo2+yY3xmyRV0bmDY2+8O
	 w0vGs6tgZjEW9CrPB6fyq8trFEzE/VOpMisfdPaNfvWQZAen/aoB5TP/n7JFY0dGh3
	 YYrQSkrH6RhivykypkvQpOp7jLOrZvgzwRLtntu8=
Date: Thu, 21 Aug 2025 16:01:25 +0300
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
Message-ID: <20250821130125.GF8865@pendragon.ideasonboard.com>
References: <20250821121207.552993-1-sakari.ailus@linux.intel.com>
 <20250821124148.GE8865@pendragon.ideasonboard.com>
 <aKcXdDDxzsNZ2Bq2@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKcXdDDxzsNZ2Bq2@kekkonen.localdomain>

On Thu, Aug 21, 2025 at 03:56:20PM +0300, Sakari Ailus wrote:
> On Thu, Aug 21, 2025 at 03:41:48PM +0300, Laurent Pinchart wrote:
> > On Thu, Aug 21, 2025 at 03:12:04PM +0300, Sakari Ailus wrote:
> > > Hi folks,
> > > 
> > > This set removes the workaround from v4l2_get_link_freq() that allowed
> > > calling it on a control handler. The Amlogic c3-mipi-csi2 driver is
> > > converted in the process as well.
> > > 
> > > As a result there's also no definition of v4l2_get_link_freq() without
> > > CONFIG_MEDIA_CONTROLLER but that should be fine now. The Amlogic patch is
> > > untested.
> > 
> > Could you please cherry-pick
> > https://lore.kernel.org/linux-media/20250821000944.27849-2-laurent.pinchart@ideasonboard.com/
> > and include it in this series ?
> 
> If a pad is const, I'd expect the container sub-device would be, too. I'll
> see if anything breaks if media_entity_to_v4l2_subdev() would switch to use
> container_of_const().

pad->entity will still not be const, so media_entity_to_v4l2_subdev()
will return a non-const pointer anyway.

-- 
Regards,

Laurent Pinchart

