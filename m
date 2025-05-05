Return-Path: <linux-media+bounces-31695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95446AA9011
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 11:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A10873A6A6D
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 09:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD1C1FCFF0;
	Mon,  5 May 2025 09:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JabQuK2g"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CED31F4174;
	Mon,  5 May 2025 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746438598; cv=none; b=YyRqqL9V5RX07VYKbESXRkxQk4CYNQ+qXXuT1GEWFIdmnQCiNsP+631vhMHXAdR47rD1E2dsfBwN/MPLg9DbSOLxOOwLb6esM3aKQeapE99zZPdchkaTyCo9SjqnDTO4L388+4oHWwCkCm2JEDLGcVrerehFnpNF30ck1S6G7NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746438598; c=relaxed/simple;
	bh=tipZ2S0o3QG1iCFQ1UsqU8tcKjAbQcWU0VEoS9DVUHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChuhDXZQFRO1+mp9g8ai6qEoNFOY7pO5WakKJI6JL6HftRInQ8/XVVAwN/vB8+WnG1eC/TkIlx81v1DCmyDKL8C2ZFbM64m9GFnRfwd20dkjF3afgv58cVRH/0gGek7SS+LyVbuUYNRTl1X6rsKSyWnfz0B7R//xEHImtPWHg2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JabQuK2g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8A61289;
	Mon,  5 May 2025 11:49:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746438584;
	bh=tipZ2S0o3QG1iCFQ1UsqU8tcKjAbQcWU0VEoS9DVUHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JabQuK2g4OhhQvwY1c2OOgSZ5CNPomCCfYOizL4SMUhgIYK5hJ/YvnVABRiGTN2QP
	 DG5NIYhxwVMv2t9X4LlVv/6y+8KsOvb3o8lsaZEOFjL6ZBcrTbjeey9Yu3R6Xeq0Yi
	 svpddiYjEFmoR6dGxaFQor0172/A72VEnYNlXZ5w=
Date: Mon, 5 May 2025 11:49:50 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v8] media: vsp1: Add VSPX support
Message-ID: <pzkf2brrpdihb4cmok6ge5zxrpif5tvcd6bes2kta3veunup2h@amcxq3qci5vb>
References: <20250502-b4-vspx-v8-1-b2a7592668dd@ideasonboard.com>
 <20250502202644.GF20093@pendragon.ideasonboard.com>
 <ptjenvbcovfzj5oukqriu7qx7qqz22r4h6sfmctpsdghwz3so3@naiwhbqwexn6>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ptjenvbcovfzj5oukqriu7qx7qqz22r4h6sfmctpsdghwz3so3@naiwhbqwexn6>

On Mon, May 05, 2025 at 10:19:57AM +0200, Jacopo Mondi wrote:
> Hi Laurent
>
> On Fri, May 02, 2025 at 11:26:44PM +0300, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
> > On Fri, May 02, 2025 at 03:23:10PM +0200, Jacopo Mondi wrote:
> > > Add support for VSPX, a specialized version of the VSP2 that
> > > transfers data to the ISP. The VSPX is composed of two RPF units
> > > to read data from external memory and an IIF instance that performs
> > > transfer towards the ISP.
> > >
> > > The VSPX is supported through a newly introduced vsp1_vspx.c file that
> > > exposes two interfaces: vsp1_vspx interface, declared in vsp1_vspx.h
> > > for the vsp1 core to initialize and cleanup the VSPX, and a vsp1_isp
> > > interface, declared in include/media/vsp1.h for the ISP driver to
> > > control the VSPX operations.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > > ---
> > > The VSPX is a VSP2 function that reads data from external memory using
> > > two RPF instances and feed it to the ISP.
> > >
> > > The VSPX includes an IIF unit (ISP InterFace) modeled in the vsp1 driver
> > > as a new, simple, entity type.
> > >
> > > IIF is part of VSPX, a version of the VSP2 IP specialized for ISP
> > > interfacing. To prepare to support VSPX, support IIF first by
> > > introducing a new entity and by adjusting the RPF/WPF drivers to
> > > operate correctly when an IIF is present.
> > >
> > > Changes in v8:
> > > - Remove patches already collected by Laurent in
> > >   [GIT PULL FOR v6.16] Renesas media drivers changes
> > >
> > > - Rebased on
> > >   https://gitlab.freedesktop.org/linux-media/users/pinchartl.git #renesas-next
> > >
> > > - Changes to the VSPX interface towards the ISP
> > >   - Split start/stop_streaming
> > >   - Add vsp1_isp_jobs_release() to release pending jobs
> > >   - Add vsp1_isp_free_buffer()
> > >   - Remove vsp1_isp_configure() and compute partitions on job creation
> > >
> > > - Driver changes
> > >   - Drop irq-driver flow
> > >     The VSPX used to schedule new jobs as soon as processing the last
> > >     one is done. This doesn't work well with the R-Car ISP design
> > >     for two reasons:
> > >     - The ISP needs per-job registers programming
> > >     - The ISP and VSPX job queues have to stay in sync
> > >
> > > - Minors
> > >   - Remove the jobs_lock as a single lock is fine
> > >   - Protect against VSPX/ISP irq races in job_run() by checking the
> > >     VSPX 'busy' register and remove the 'processing' flag
> > >   - Manually set the pipeline state to STOPPED before scheduling a new
> > >     job without waiting for frame_end
> > >
> > > Changes in v7:
> > > - Include VSPX driver in the series
> > > - Use existing VSP1 formats and remove patches extending formats on RPF
> > > - Rework VSPX driver to split jobs creation and scheduling in two
> > >   different API entry points
> > > - Fix VSPX stride using the user provided bytesperline and using the
> > >   buffer size for ConfigDMA buffers
> > > - Link to v6: https://lore.kernel.org/r/20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com
> > >
> > > Changes in v6:
> > > - Little cosmetic change as suggested by Laurent
> > > - Collect tags
> > > - Link to v5: https://lore.kernel.org/r/20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com
> > >
> > > Changes in v5:
> > > - Drop additional empty line 5/6
> > > - Link to v4: https://lore.kernel.org/r/20250318-v4h-iif-v4-0-10ed4c41c195@ideasonboard.com
> > >
> > > Changes in v4:
> > > - Fix SWAP bits for RAW10, RAW12 and RAW16
> > > - Link to v3: https://lore.kernel.org/r/20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com
> > >
> > > Changes in v3:
> > > - Drop 2/6 from v2
> > > - Add 5/7 to prepare for a new implementation of 6/7
> > > - Individual changelog per patch
> > > - Add 7/7
> > > - Link to v2: https://lore.kernel.org/r/20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com
> > >
> > > Changes in v2:
> > > - Collect tags
> > > - Address review comments from Laurent, a lot of tiny changes here and
> > >   there but no major redesign worth an entry in the patchset changelog
> >
> > You've come a long way since v1, I think we're getting close to a good
> > implementation.
> >
>
> Thank you and Niklas for reviews and testing
>
> > > ---
> > >  drivers/media/platform/renesas/vsp1/Makefile    |   1 +
> > >  drivers/media/platform/renesas/vsp1/vsp1.h      |   1 +
> > >  drivers/media/platform/renesas/vsp1/vsp1_drv.c  |  13 +-
> > >  drivers/media/platform/renesas/vsp1/vsp1_regs.h |   1 +
> > >  drivers/media/platform/renesas/vsp1/vsp1_vspx.c | 664 ++++++++++++++++++++++++
> > >  drivers/media/platform/renesas/vsp1/vsp1_vspx.h |  16 +
> > >  include/media/vsp1.h                            |  75 +++
> > >  7 files changed, 770 insertions(+), 1 deletion(-)
> > >

[snip]

> > > +
> > > +/**
> > > + * vsp1_isp_start_streaming - Start processing VSPX jobs
> > > + *
> > > + * Start the VSPX and prepare for accepting buffer transfer job requests.
> > > + *
> > > + * @dev: The VSP1 struct device
> > > + * @frame_end: The frame end callback description
> > > + *
> > > + * Return: %0 on success or a negative error code on failure
> > > + */
> > > +int vsp1_isp_start_streaming(struct device *dev,
> > > +			     struct vsp1_vspx_frame_end *frame_end)
> > > +{
> > > +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> > > +	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
> > > +	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
> > > +	unsigned long flags;
> > > +	u32 value;
> > > +	int ret;
> > > +
> > > +	spin_lock_irqsave(&vspx_pipe->vspx_lock, flags);
> >
> > Can this function ever be called with interrupts disabled ? If no, you
> > can use spin_lock_irq().
> >
>
> I think the question here should rather be: do we need to disable
> local interrupts at all when calling this function ? As the VSPX
> workflow is now driven by ISP and there are no contentions between any
> of the driver functions and the VSPX interrupt handler I guess I can
> use spin_lock() and spin_unlock() everywhere and replace the
> irqsave/irqrestore versions ?
>

I take this back. Using either spin_lock and spin_lock_irq trigger
lockdep warnings due to the usage of these function from ISP irq
context.

To be honest I spent a considerable amount of time making all of this
lockdep proof and I'll keep using the irqsave version for the time
being considering the limited overhead compared to _irq.

> > > +
> > > +	if (vspx_pipe->enabled) {

