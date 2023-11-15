Return-Path: <linux-media+bounces-397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FA37ECC25
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 20:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1C2A1C208FA
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 19:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD9A37170;
	Wed, 15 Nov 2023 19:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SH3pZ8Us"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA09FD43;
	Wed, 15 Nov 2023 11:27:01 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B11F29A;
	Wed, 15 Nov 2023 20:26:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700076393;
	bh=HuvqlF4fz7sV1Btrlh+F7H9LaWiQ+2kuf+3ugMlgbII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SH3pZ8UsCtCH4aQvZPeCAc/JEA/VsNBXYIruQ7dpIXgRP2IGApeRfodtdKOUtGSpQ
	 0tOr+1ARI49S/OtijiXwNSvJPJsz59o9H2NBHHE56PSaGaE0p4IY14TOJCG81AV3Yt
	 ovyzzYOmN4QpKG4xN/kKoiu6Rj5D6hoe0jcEpkEg=
Date: Wed, 15 Nov 2023 21:27:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
	kernel-list@raspberrypi.com, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 05/15] staging: mmal-vchiq: Use vc-sm-cma to support
 zero copy
Message-ID: <20231115192705.GC21100@pendragon.ideasonboard.com>
References: <20231109210309.638594-1-umang.jain@ideasonboard.com>
 <20231109210309.638594-6-umang.jain@ideasonboard.com>
 <3b9ec650-8a99-4bac-9ac9-d2cd87efced5@i2se.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3b9ec650-8a99-4bac-9ac9-d2cd87efced5@i2se.com>

On Wed, Nov 15, 2023 at 08:03:47PM +0100, Stefan Wahren wrote:
> Hi Umang,
> 
> Am 09.11.23 um 22:02 schrieb Umang Jain:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > 
> > With the vc-sm-cma driver we can support zero copy of buffers between
> > the kernel and VPU. Add this support to mmal-vchiq.
> > 
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > ---
> >   .../staging/vc04_services/vchiq-mmal/Kconfig  |  1 +
> >   .../vc04_services/vchiq-mmal/mmal-common.h    |  4 +
> >   .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 84 +++++++++++++++++--
> >   .../vc04_services/vchiq-mmal/mmal-vchiq.h     |  1 +
> >   4 files changed, 83 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/staging/vc04_services/vchiq-mmal/Kconfig b/drivers/staging/vc04_services/vchiq-mmal/Kconfig
> > index c99525a0bb45..a7c1a7bf516e 100644
> > --- a/drivers/staging/vc04_services/vchiq-mmal/Kconfig
> > +++ b/drivers/staging/vc04_services/vchiq-mmal/Kconfig
> > @@ -1,6 +1,7 @@
> >   config BCM2835_VCHIQ_MMAL
> >   	tristate "BCM2835 MMAL VCHIQ service"
> >   	depends on BCM2835_VCHIQ
> > +	select BCM_VC_SM_CMA
> 
> i think we need more explanation in the commit message of the relation 
> between these both modules.
> 
> On the one side BCM_VC_SM_CMA should be a driver, but it's not a driver 
> for a specific hardware. It looks like more an extension of VCHIQ MMAL 
> or does other (maybe not yet imported) vc04 driver make also use of this.
> 
> My question is: is BCM_VC_SM_CMA a real member on the VCHIQ bus and why?

The vchiq_device pointer passed to the vc_sm_cma probe function is used
in the driver for the sole purpose of accessing the underlying struct
device, which, beside being used for dev_*() log calls, is just passed
to dma_buf_attach(). It does indeed appear to be more of a service than
a device.

-- 
Regards,

Laurent Pinchart

