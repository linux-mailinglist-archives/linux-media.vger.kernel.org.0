Return-Path: <linux-media+bounces-893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B58CD7F5FE4
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 14:15:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D11421C20FF9
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 13:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B8D24B31;
	Thu, 23 Nov 2023 13:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ykb+smdm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D899822F02;
	Thu, 23 Nov 2023 13:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CB3C433C7;
	Thu, 23 Nov 2023 13:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700745327;
	bh=jlb3jlZpe8bNPsYBsctY4IzfiqtgE64+/FoXoVoFy0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ykb+smdmRlDMgj5/2G++jc0acZkhug2sKq3N5gO4o5Nh10uPQ/OhXw7C09KUR/fAf
	 VxrdKt4gH3SWf1j+Befey4ZPPk1+xRGz+ezJKiahcTAKsenJIe26j5AuTKaxcgM9Bi
	 DQJT2zMJj6HLpLCNe5ScyJJ8D6x/f1sv9e8wP88w=
Date: Thu, 23 Nov 2023 12:57:14 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 5/9] staging: vc04_services: Do not pass NULL to
 vchiq_log_error()
Message-ID: <2023112341-daughter-richness-c87b@gregkh>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
 <20231107095156.365492-6-umang.jain@ideasonboard.com>
 <20231107122551.GA3051@pendragon.ideasonboard.com>
 <4a5f6ae3-2a1f-f708-d9e0-fad4f5b60a43@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a5f6ae3-2a1f-f708-d9e0-fad4f5b60a43@ideasonboard.com>

On Tue, Nov 07, 2023 at 06:01:58PM +0530, Umang Jain wrote:
> Hi Laurent,
> 
> On 11/7/23 5:55 PM, Laurent Pinchart wrote:
> > Hi Umang,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Nov 07, 2023 at 04:51:52AM -0500, Umang Jain wrote:
> > > vchiq_add_connected_callback() logs using vchiq_log_error() macro,
> > > but passes NULL instead of a struct device pointer. Fix it.
> > > 
> > > vchiq_add_connected_callback() is not used anywhere in the vc04_services
> > > as of now. It will be used when we add new drivers(VC shared memory and
> > > bcm2835-isp), hence it kept as it is for now.
> > > 
> > > Fixes: 1d8915cf8899 ("staging: vc04: Convert vchiq_log_error() to use dynamic debug")
> > > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > > ---
> > >   .../vc04_services/interface/vchiq_arm/vchiq_connected.c       | 4 ++--
> > >   .../vc04_services/interface/vchiq_arm/vchiq_connected.h       | 4 +++-
> > >   2 files changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> > > index b3928bd8c9c6..21f9fa1a1713 100644
> > > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> > > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> > > @@ -27,7 +27,7 @@ static void connected_init(void)
> > >    * be made immediately, otherwise it will be deferred until
> > >    * vchiq_call_connected_callbacks is called.
> > >    */
> > > -void vchiq_add_connected_callback(void (*callback)(void))
> > > +void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(void))
> > You're changing the prototype of the function, but the patch doesn't
> > update any user. If the function is unused, it looks like you can drop
> > it instead. Looking at the rest of the vchiq_connected.c file, I think
> > you can actually drop the whole file.
> 
> I mentioned in the commit message of this patch. There will be users in the
> near future.

We write code for today, not any potential users in the future.  If it's
not used now, let's delete it and then when we need it in the future,
you can add it back then.

thanks,

greg k-h

