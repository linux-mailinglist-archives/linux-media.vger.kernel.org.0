Return-Path: <linux-media+bounces-1051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4E57F9333
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 15:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E975628125F
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 14:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A498F8824;
	Sun, 26 Nov 2023 14:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O9nhbco4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B1509B
	for <linux-media@vger.kernel.org>; Sun, 26 Nov 2023 06:52:00 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1EB3DFB;
	Sun, 26 Nov 2023 15:51:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701010285;
	bh=1AkiTfZtEKxDSCItwejoaW5n5WS50jpFJb2Dv/geccY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9nhbco4OxCuJotd3t0sdGcctrIDK4UfdRLymALld6dO6okXs0BFoOgobayIiK2VG
	 y94Zh8aTHaFqAgwqbLtXSdR5ufjoigni6VmO/thHGegX6ZmU1l+g1ZLLH9KksGOkwW
	 fSiJXG3bvztBv3TVxVaWc3I3f+3Nx8EMaF7AsRRc=
Date: Sun, 26 Nov 2023 16:52:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 6/9] staging: vc04_services: Drop vchiq_log_error() in
 favour of dev_dbg
Message-ID: <20231126145204.GB12891@pendragon.ideasonboard.com>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
 <20231107095156.365492-7-umang.jain@ideasonboard.com>
 <2023112322-wife-aspect-135b@gregkh>
 <20231123134941.GD16377@pendragon.ideasonboard.com>
 <2023112338-scrambler-utilize-a31d@gregkh>
 <20231123172825.GJ16377@pendragon.ideasonboard.com>
 <2023112343-bobbed-throbbing-2c36@gregkh>
 <20231123180022.GA20170@pendragon.ideasonboard.com>
 <2023112643-algebra-exorcist-5e6c@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2023112643-algebra-exorcist-5e6c@gregkh>

On Sun, Nov 26, 2023 at 10:26:41AM +0000, Greg Kroah-Hartman wrote:
> On Thu, Nov 23, 2023 at 08:00:22PM +0200, Laurent Pinchart wrote:
> > On Thu, Nov 23, 2023 at 05:31:32PM +0000, Greg Kroah-Hartman wrote:
> > > On Thu, Nov 23, 2023 at 07:28:25PM +0200, Laurent Pinchart wrote:
> > > > On Thu, Nov 23, 2023 at 01:53:42PM +0000, Greg Kroah-Hartman wrote:
> > > > > On Thu, Nov 23, 2023 at 03:49:41PM +0200, Laurent Pinchart wrote:
> > > > > > On Thu, Nov 23, 2023 at 01:02:45PM +0000, Greg Kroah-Hartman wrote:
> > > > > > > On Tue, Nov 07, 2023 at 04:51:53AM -0500, Umang Jain wrote:
> > > > > > > > Drop vchiq_log_error() macro which wraps dev_dbg(). Introduce the usage
> > > > > > > > of dev_dbg() directly.
> > > > > > > > 
> > > > > > > > Add a new enum vchiq_log_type and log_type() helper to faciliate the
> > > > > > > > type of logging in dev_dbg(). This will help to determine the type of
> > > > > > > > logging("error", "warning", "debug", "trace") to dynamic debug.
> > > > > > > > 
> > > > > > > > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > > > > > > > ---
> > > > > > > >  .../interface/vchiq_arm/vchiq_arm.c           |  54 ++++----
> > > > > > > >  .../interface/vchiq_arm/vchiq_connected.c     |   6 +-
> > > > > > > >  .../interface/vchiq_arm/vchiq_core.c          | 126 ++++++++++--------
> > > > > > > >  .../interface/vchiq_arm/vchiq_core.h          |  23 +++-
> > > > > > > >  .../interface/vchiq_arm/vchiq_dev.c           |  47 ++++---
> > > > > > > >  5 files changed, 143 insertions(+), 113 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > > > > > > index 9fb3e240d9de..2cb2a6503058 100644
> > > > > > > > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > > > > > > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > > > > > > > @@ -696,8 +696,8 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
> > > > > > > >  
> > > > > > > >  	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
> > > > > > > >  	if (!instance) {
> > > > > > > > -		vchiq_log_error(state->dev, VCHIQ_CORE,
> > > > > > > > -				"%s: error allocating vchiq instance\n", __func__);
> > > > > > > > +		dev_dbg(state->dev, "%s: %s: %s: error allocating vchiq instance\n",
> > > > > > > > +			log_cat(VCHIQ_CORE), log_type(ERROR), __func__);
> > > > > > > 
> > > > > > > All dev_dbg() calls have __func__ in them automatically, you never need
> > > > > > > to duplicate it again as that's redundant :(
> > > > > > 
> > > > > > Oh ? I didn't know that, and can't find it in the code. I may be missing
> > > > > > something though. Are you referring to the +f flag for dynamic debug
> > > > > > entries ? It won't work if dynamic debug isn't enabled though, but maybe
> > > > > > we don't care about that ?
> > > > > 
> > > > > Yes, the "f" flag is what controls this, and if dynamic debug isn't
> > > > > enabled, you don't get any message here and we don't care about it :)
> > > > 
> > > > You do if you #define DEBUG, that's one of the three options for
> > > > dev_dbg() (dynamic debug and no_printk() being the other two). Maybe
> > > > __func__ should be added to the dev_printk() version of dev_dbg() to
> > > > have a consistent behaviour.
> > > 
> > > Drivers should NOT be defining DEBUG for anything in the tree, just use
> > > the normal interfaces, as no one will be selecting debug options from
> > > Kconfig.  DEBUG is really only good for out-of-tree work.
> > 
> > I didn't know that either. Of course '#define DEBUG' shouldn't be merged
> > upstream, but I thought it was supported by the kernel to make that
> > possible during development, as an alternative to dynamic debug. Does it
> > mean we should drop '#define DEBUG' support from dev_dbg() eventually ?
> 
> Probably, once all of the "define DEBUG" lines are dropped from the
> kernel itself, which might take a while :)

Would a patch that simply drops them be acceptable ? If not, what's
missing to remove them ?

-- 
Regards,

Laurent Pinchart

