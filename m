Return-Path: <linux-media+bounces-399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5890C7ED09A
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 20:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 012F71F27816
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 19:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC113D96E;
	Wed, 15 Nov 2023 19:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kKKw1mBw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4B8D63;
	Wed, 15 Nov 2023 11:56:31 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC1964A4;
	Wed, 15 Nov 2023 20:56:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700078163;
	bh=6JOB/9VYx7h3AYgO11Fk1AxgBXD3Uh3mlJ3vucexPmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kKKw1mBwlTa4Eq+tDYltUVDm6XnYh4h5DEawKF8NvPJq1YT4nP3LHHQ1OQgcBLCC+
	 1t5U6MKgDtCvS4Wgw9BGpIX1W7shw/9+Za7ranUsJ5JlZ/wu9LqZeJQCIg9fkhcuw3
	 YQaBG7pgqankbpm62iVXLuinAfsg3dGwT8WDG/98=
Date: Wed, 15 Nov 2023 21:56:34 +0200
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
Subject: Re: [PATCH v2 01/15] staging: vc04_services: Add new vc-sm-cma driver
Message-ID: <20231115195634.GC29486@pendragon.ideasonboard.com>
References: <20231109210309.638594-1-umang.jain@ideasonboard.com>
 <20231109210309.638594-2-umang.jain@ideasonboard.com>
 <5263ecbd-23af-4889-a7e0-b21aaf8bcfe0@i2se.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5263ecbd-23af-4889-a7e0-b21aaf8bcfe0@i2se.com>

On Mon, Nov 13, 2023 at 06:56:06PM +0100, Stefan Wahren wrote:
> Hi Umang,
> 
> Am 09.11.23 um 22:02 schrieb Umang Jain:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > 
> > Add Broadcom VideoCore Shared Memory support.
> > 
> > This new driver allows contiguous memory blocks to be imported
> > into the VideoCore VPU memory map, and manages the lifetime of
> > those objects, only releasing the source dmabuf once the VPU has
> > confirmed it has finished with it.
> > 
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > ---
> >   drivers/staging/vc04_services/Kconfig         |   2 +
> >   drivers/staging/vc04_services/Makefile        |   2 +-
> >   .../staging/vc04_services/vc-sm-cma/Kconfig   |  10 +
> >   .../staging/vc04_services/vc-sm-cma/Makefile  |   4 +
> >   .../staging/vc04_services/vc-sm-cma/vc_sm.c   | 817 ++++++++++++++++++
> >   .../staging/vc04_services/vc-sm-cma/vc_sm.h   |  54 ++
> >   .../vc04_services/vc-sm-cma/vc_sm_cma_vchi.c  | 507 +++++++++++
> >   .../vc04_services/vc-sm-cma/vc_sm_cma_vchi.h  |  63 ++
> >   .../vc04_services/vc-sm-cma/vc_sm_defs.h      | 187 ++++
> >   .../vc04_services/vc-sm-cma/vc_sm_knl.h       |  28 +
> >   10 files changed, 1673 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/staging/vc04_services/vc-sm-cma/Kconfig
> >   create mode 100644 drivers/staging/vc04_services/vc-sm-cma/Makefile
> >   create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
> >   create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm.h
> >   create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c
> >   create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.h
> >   create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm_defs.h
> >   create mode 100644 drivers/staging/vc04_services/vc-sm-cma/vc_sm_knl.h

[snip]

> > diff --git a/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c b/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
> > new file mode 100644
> > index 000000000000..5bbdb3a8468b
> > --- /dev/null
> > +++ b/drivers/staging/vc04_services/vc-sm-cma/vc_sm.c
> > @@ -0,0 +1,817 @@

[snip]

> > +/* ---- Private Variables ----------------------------------------------- */
> > +
> > +static struct sm_state_t *sm_state;
> > +static int sm_inited;
> 
> In case the driver cannot be loaded again, a comment about this should 
> be here.

Better, could we remove global variables ?

[snip]

-- 
Regards,

Laurent Pinchart

