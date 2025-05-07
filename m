Return-Path: <linux-media+bounces-31958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C716AADDA1
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 13:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F38B01C0827C
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 11:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E042472AB;
	Wed,  7 May 2025 11:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HwHydESg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3DA24DFF1
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 11:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618251; cv=none; b=MbR3oCyoVsVUQezVfXjGWkTGKJBwg3Pfcl7Uo9beREbtc3Dydyzf1GjTMLnjWaTXg5IDdtc1fl62NSzEZ397bQvUNSGU7h8139b6cKPoz6lyF9yhXaSRo1obzMD9Fz8mBmIQXkr+AagR6IphvDUh6LVLdT/2+h143wZvYSmAoMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618251; c=relaxed/simple;
	bh=UHd+OEANcWFzZY11gWuF24tvSEitNY7oYiJOs4n/TFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ql33rS+4DeaDE4kbxdwzKBjJmsUAzHn9vN96wV/bJ92BHkQNWOfchqDvDxWughXAZDtnocQ/7i5Ey8gVu9ZbPOnjIJI7gzVYrx6Iybt4WXs7b7E4DsRshzDnER5eFZo8cCOAiUc9emoLOr1c/eWTtzi0kXGQDrAwG7EybGNXhV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HwHydESg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (static-176-133-119-130.ftth.abo.bbox.fr [176.133.119.130])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 879556D5;
	Wed,  7 May 2025 13:43:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746618236;
	bh=UHd+OEANcWFzZY11gWuF24tvSEitNY7oYiJOs4n/TFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HwHydESg8j32hPMFy+ms5jiPIyM+tdw9H5iaKcnwR4MWdNtVn7YTtZIUsMgKV30Wp
	 gwXjUDRP4geTzAIFMtSHGZLFYaPMyGd/soG6adMt9eLJLGR2lr5ocm5y9bUXW2L35y
	 fnlXuyyrqquXkB2UM16cFylMxeNGDf04iBnw+E60=
Date: Wed, 7 May 2025 13:43:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
Message-ID: <20250507114359.GC11059@pendragon.ideasonboard.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
 <20250507102844.0fa7f798@foz.lan>
 <20250507091907.GC11152@pendragon.ideasonboard.com>
 <CAPybu_1uHmSxdkG1tC24Kw5fiOrzeJe-kAjv=JiZWZykd-xF8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPybu_1uHmSxdkG1tC24Kw5fiOrzeJe-kAjv=JiZWZykd-xF8g@mail.gmail.com>

Hi Ricardo,

On Wed, May 07, 2025 at 12:33:33PM +0200, Ricardo Ribalda Delgado wrote:
> On Wed, May 7, 2025 at 11:25 AM Laurent Pinchart wrote:
> > On Wed, May 07, 2025 at 10:28:55AM +0200, Mauro Carvalho Chehab wrote:
> > > Em Tue, 25 Mar 2025 12:27:50 +0200 Laurent Pinchart escreveu:
> > >
> > > > Hello everybody,
> > > >
> > > > Another year, another libcamera workshop. After the previous editions in
> > > > Paris, Brussels and Vienna, we will organize the next workshop in Nice
> > > > on Friday the 16th of May. The event will be hosted by Embedded Recipes
> > > > ([1]) as part of their workshops day ([2]).
> > > >
> > > > This year, our workshop will be colocated with the Pipewire workshop on
> > > > the same day and at the same venue (but a different room), to facilitate
> > > > discussions about topics that span libcamera and Pipewire. The Linux
> > > > Media Summit will also be organized in a nearby location on Tuesday the
> > > > 13th ([3]).
> > > >
> > > > If you would like to attend, please register your interest by replying
> > > > to this e-mail, and indicate if you have any discussion topics you would
> > > > like to include in the schedule. We will draft and circulate an agenda
> > > > in the next few weeks after receiving topic proposals. If registrations
> > > > exceed our capacity, priority will be given based on topic submissions.
> > >
> > > Hi Laurent,
> > >
> > > I'm also interested on attending it.
> >
> > You're now on the attendees list. We will share logistics details at the
> > beginning of next week.
> 
> If there is still room I would like to attend as well.

You've just taken the last seat :-)

-- 
Regards,

Laurent Pinchart

