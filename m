Return-Path: <linux-media+bounces-19361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 777559993F5
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 22:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B04C1F23CF2
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 20:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEAB81E22F7;
	Thu, 10 Oct 2024 20:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PE+u9+Xw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49A21E1325;
	Thu, 10 Oct 2024 20:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728593594; cv=none; b=t8gWgBRl6iFxeSAz+V/Kvw/1awwIaiStQPQQYQusUQK2frU2lm1QLVeN+QDVls4LdWmMZWdl+wslKC8rfkHJaVow9yBRxiJD10upvzw5NJCFjeROATomLhIBfoojZHnGjlhUqKFibh6GQvzs/UTE9wshZIztsrNMirVfabhs3e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728593594; c=relaxed/simple;
	bh=jU7UFTshCSAxqX4WT453J1cU+GNKcMxswMc9fN2HqiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvNIYZ/X+Z59JOxAjdnwuKzBYoDG+mgFciHmPEE2WUjvKrty28QvMscXamTLBWjSNQsFe2YiwibBfYet+T471GW0FMozyhEp2vuKnmfsT2fDFOgGLuVqWGeVM8rOwfIxd1UQfp5Z2aqouIJCPyKx/BxJoVIqZ7zZRxTOSH9zHKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PE+u9+Xw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [132.205.230.15])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24C0F4D4;
	Thu, 10 Oct 2024 22:51:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728593492;
	bh=jU7UFTshCSAxqX4WT453J1cU+GNKcMxswMc9fN2HqiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PE+u9+Xwk5PZlJt6MHYYQWgzXhvFjsUi2R5MTm+AFsRNa0PmKC5hl3yN1Jz1femib
	 2Ds3K6DPCHJi63d6A/vSgb5ER/GG1osScurKYf51uQcHDWnfwGhiGA/mguI3ZRjQdB
	 RLB6hKAuu0/Hibfq211qCAEuY3reD5izVJ2F88VY=
Date: Thu, 10 Oct 2024 23:53:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: platform: video-mux: Fix mutex locking
Message-ID: <20241010205306.GN32107@pendragon.ideasonboard.com>
References: <20240909154828.1661627-1-paul.elder@ideasonboard.com>
 <20240909155603.GE9448@pendragon.ideasonboard.com>
 <ZweUEDVQ05Ikk1RY@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZweUEDVQ05Ikk1RY@valkosipuli.retiisi.eu>

On Thu, Oct 10, 2024 at 08:45:04AM +0000, Sakari Ailus wrote:
> On Mon, Sep 09, 2024 at 06:56:03PM +0300, Laurent Pinchart wrote:
> > On Mon, Sep 09, 2024 at 05:48:28PM +0200, Paul Elder wrote:
> > > The current order of locking between the driver mutex and the v4l2
> > > subdev state lock causes a circuluar locking dependency when trying to
> > > set up a link. Fix this.
> > > 
> > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > This being said, I think we should deprecate the video-mux driver and
> > implement a driver that uses the V4L2 subdev internal routing API
> > instead of basing the routing configuration on link setup. Any opinion ?
> 
> Sounds good to me. But do we need a new driver? The subdev client streams
> capability flag should help here, just as it does on other drivers.

Good point, we could switch the driver behaviour depending on client
capabilities. I like this !

> I applied this one, with spelling fixed in the commit message.

-- 
Regards,

Laurent Pinchart

