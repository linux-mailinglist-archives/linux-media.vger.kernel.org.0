Return-Path: <linux-media+bounces-34869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBC1ADAAD0
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 10:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17F021748FF
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 08:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4A126E6FC;
	Mon, 16 Jun 2025 08:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kGzP0pAl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E44126C3BF;
	Mon, 16 Jun 2025 08:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062490; cv=none; b=TEpuddtTmfUnonyz3lKbFuV45p19DG1XiHHcKFD1MDODM93BJqA/mR5I5JaaCN99YbgmNJUR7g2/cmDBdoJkNjFLOlJmz6NYHVdBFMAxsXDPuChvDA7RG9EtA2PAd4n6Cig3habKIYI6aW9TF6KgFM7pTnDp+gvw1L1qIyq+cVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062490; c=relaxed/simple;
	bh=h9dqMOb+3H/0LE2FJ13aOXA0K8O0fQkPbQil9F8k2Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jg6Bk3KJWf/Bu4t8ypbT1ynk6X9kvli86qT0r9PKOYifCjUT+LbJmspZv75iJRdSbtplQu3oFMiX7Usrj4XYNgAz6JJFDT0IRpRkGP2b3KkcrqVs0frteAfwqrNmDSlloRGKpGSCVfRhLfYk/UeBqXRjIgk6NK/yFlb+6zBLsoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kGzP0pAl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-141-184.net.vodafone.it [5.90.141.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDC61351;
	Mon, 16 Jun 2025 10:27:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750062472;
	bh=h9dqMOb+3H/0LE2FJ13aOXA0K8O0fQkPbQil9F8k2Jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kGzP0pAl6JJyY/wbqxkTjSMdI/H7xZrh0WIoHmA9Ikx7C846U9ySTSLTLacqodHDL
	 5e+0fzcsfqIy8sUl1+zSjsihezqiGr7KQaYYhXeERPpkITWlrMzcq7Sumvef7+hUKs
	 9CGvTswwTNs5cRtMZUozQb58tSJ4a9VzlaTTne9A=
Date: Mon, 16 Jun 2025 10:28:00 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v8] media: vsp1: Add VSPX support
Message-ID: <wsm3wjqmeklnmupyjq6j7o2owczgejrepdo3ziem7sxxls7cj7@uoxvezgyxow5>
References: <20250502-b4-vspx-v8-1-b2a7592668dd@ideasonboard.com>
 <20250502202644.GF20093@pendragon.ideasonboard.com>
 <ptjenvbcovfzj5oukqriu7qx7qqz22r4h6sfmctpsdghwz3so3@naiwhbqwexn6>
 <20250614145540.GB14438@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250614145540.GB14438@pendragon.ideasonboard.com>

Hi Laurent

On Sat, Jun 14, 2025 at 05:55:40PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> I realize I haven't replied to this e-mail. Sorry about that. I've added
> a few comments below related to issues that I think are still relevant
> to v10.
>
> On Mon, May 05, 2025 at 10:19:57AM +0200, Jacopo Mondi wrote:
> > On Fri, May 02, 2025 at 11:26:44PM +0300, Laurent Pinchart wrote:
> > > On Fri, May 02, 2025 at 03:23:10PM +0200, Jacopo Mondi wrote:
> > > > Add support for VSPX, a specialized version of the VSP2 that
> > > > transfers data to the ISP. The VSPX is composed of two RPF units
> > > > to read data from external memory and an IIF instance that performs
> > > > transfer towards the ISP.
> > > >
> > > > The VSPX is supported through a newly introduced vsp1_vspx.c file that
> > > > exposes two interfaces: vsp1_vspx interface, declared in vsp1_vspx.h
> > > > for the vsp1 core to initialize and cleanup the VSPX, and a vsp1_isp
> > > > interface, declared in include/media/vsp1.h for the ISP driver to
> > > > control the VSPX operations.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > > > ---
> > > > The VSPX is a VSP2 function that reads data from external memory using
> > > > two RPF instances and feed it to the ISP.
> > > >
> > > > The VSPX includes an IIF unit (ISP InterFace) modeled in the vsp1 driver
> > > > as a new, simple, entity type.
> > > >
> > > > IIF is part of VSPX, a version of the VSP2 IP specialized for ISP
> > > > interfacing. To prepare to support VSPX, support IIF first by
> > > > introducing a new entity and by adjusting the RPF/WPF drivers to
> > > > operate correctly when an IIF is present.
> > > >
> > > > Changes in v8:
> > > > - Remove patches already collected by Laurent in
> > > >   [GIT PULL FOR v6.16] Renesas media drivers changes
> > > >
> > > > - Rebased on
> > > >   https://gitlab.freedesktop.org/linux-media/users/pinchartl.git #renesas-next
> > > >
> > > > - Changes to the VSPX interface towards the ISP
> > > >   - Split start/stop_streaming
> > > >   - Add vsp1_isp_jobs_release() to release pending jobs
> > > >   - Add vsp1_isp_free_buffer()
> > > >   - Remove vsp1_isp_configure() and compute partitions on job creation
> > > >
> > > > - Driver changes
> > > >   - Drop irq-driver flow
> > > >     The VSPX used to schedule new jobs as soon as processing the last
> > > >     one is done. This doesn't work well with the R-Car ISP design
> > > >     for two reasons:
> > > >     - The ISP needs per-job registers programming
> > > >     - The ISP and VSPX job queues have to stay in sync
> > > >
> > > > - Minors
> > > >   - Remove the jobs_lock as a single lock is fine
> > > >   - Protect against VSPX/ISP irq races in job_run() by checking the
> > > >     VSPX 'busy' register and remove the 'processing' flag
> > > >   - Manually set the pipeline state to STOPPED before scheduling a new
> > > >     job without waiting for frame_end
> > > >
> > > > Changes in v7:
> > > > - Include VSPX driver in the series
> > > > - Use existing VSP1 formats and remove patches extending formats on RPF
> > > > - Rework VSPX driver to split jobs creation and scheduling in two
> > > >   different API entry points
> > > > - Fix VSPX stride using the user provided bytesperline and using the
> > > >   buffer size for ConfigDMA buffers
> > > > - Link to v6: https://lore.kernel.org/r/20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com
> > > >
> > > > Changes in v6:
> > > > - Little cosmetic change as suggested by Laurent
> > > > - Collect tags
> > > > - Link to v5: https://lore.kernel.org/r/20250319-v4h-iif-v5-0-0a10456d792c@ideasonboard.com
> > > >
> > > > Changes in v5:
> > > > - Drop additional empty line 5/6
> > > > - Link to v4: https://lore.kernel.org/r/20250318-v4h-iif-v4-0-10ed4c41c195@ideasonboard.com
> > > >
> > > > Changes in v4:
> > > > - Fix SWAP bits for RAW10, RAW12 and RAW16
> > > > - Link to v3: https://lore.kernel.org/r/20250317-v4h-iif-v3-0-63aab8982b50@ideasonboard.com
> > > >
> > > > Changes in v3:
> > > > - Drop 2/6 from v2
> > > > - Add 5/7 to prepare for a new implementation of 6/7
> > > > - Individual changelog per patch
> > > > - Add 7/7
> > > > - Link to v2: https://lore.kernel.org/r/20250224-v4h-iif-v2-0-0305e3c1fe2d@ideasonboard.com
> > > >
> > > > Changes in v2:
> > > > - Collect tags
> > > > - Address review comments from Laurent, a lot of tiny changes here and
> > > >   there but no major redesign worth an entry in the patchset changelog
> > >
> > > You've come a long way since v1, I think we're getting close to a good
> > > implementation.
> >
> > Thank you and Niklas for reviews and testing
> >
> > > > ---
> > > >  drivers/media/platform/renesas/vsp1/Makefile    |   1 +
> > > >  drivers/media/platform/renesas/vsp1/vsp1.h      |   1 +
> > > >  drivers/media/platform/renesas/vsp1/vsp1_drv.c  |  13 +-
> > > >  drivers/media/platform/renesas/vsp1/vsp1_regs.h |   1 +
> > > >  drivers/media/platform/renesas/vsp1/vsp1_vspx.c | 664 ++++++++++++++++++++++++
> > > >  drivers/media/platform/renesas/vsp1/vsp1_vspx.h |  16 +
> > > >  include/media/vsp1.h                            |  75 +++
> > > >  7 files changed, 770 insertions(+), 1 deletion(-)
>
> [snip]
>
> > > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> > > > new file mode 100644
> > > > index 000000000000..6edb5e4929d9
> > > > --- /dev/null
> > > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> > > > @@ -0,0 +1,664 @@
>
> [snip]
>
> > > > +static int vsp1_vspx_rpf0_configure(struct vsp1_device *vsp1,
> > > > +				    dma_addr_t addr, u32 isp_fourcc,
> > > > +				    unsigned int width, unsigned int height,
> > > > +				    unsigned int stride,
> > > > +				    unsigned int iif_sink_pad,
> > > > +				    struct vsp1_dl_list *dl,
> > > > +				    struct vsp1_dl_body *dlb)
> > > > +{
> > > > +	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
> > > > +	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
> > > > +	struct vsp1_rwpf *rpf0 = pipe->inputs[0];
> > > > +	int ret;
> > > > +
> > > > +	ret = vsp1_vspx_rwpf_set_subdev_fmt(vsp1, rpf0, isp_fourcc, width,
> > > > +					    height);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	ret = vsp1_vspx_rwpf_set_subdev_fmt(vsp1, pipe->output, isp_fourcc,
> > > > +					    width, height);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	vsp1_pipeline_calculate_partition(pipe, &pipe->part_table[0],
> > > > +					  width, 0);
> > > > +
> > >
> > > You should also set rwpf->format.num_planes to 1 here.
> >
> > ack
> >
> > > > +	rpf0->format.plane_fmt[0].bytesperline = stride;
> > > > +
> > > > +	/*
> > > > +	 * Connect RPF0 to the IIF sink pad corresponding to the config or image
> > > > +	 * path.
> > > > +	 */
> > > > +	rpf0->entity.sink_pad = iif_sink_pad;
> > > > +
> > > > +	pipe->part_table[0].rpf[0].width = width;
> > > > +	pipe->part_table[0].rpf[0].height = height;
> > >
> > > Isn't this handled by vsp1_pipeline_calculate_partition() ?
> >
> > I don't see it happening in the vsp1_pipeline_calculate_partition()
> > call chain...
> >
> > vsp1_pipeline_calculate_partition() calls
> > vsp1_pipeline_propagate_partition() which calls the 'partition' op on
> > entities in the pipeline.
> >
> > The RPF implementation of the 'partition' op however initializes the
> > crop retangles on the entity, but not the part_table[].
>
> The RPF .partition() handler is implemented as
>
> static void rpf_partition(struct vsp1_entity *entity,
> 			  struct v4l2_subdev_state *state,
> 			  struct vsp1_pipeline *pipe,
> 			  struct vsp1_partition *partition,
> 			  unsigned int partition_idx,
> 			  struct v4l2_rect *window)
> {
> 	struct vsp1_rwpf *rpf = to_rwpf(&entity->subdev);
> 	struct v4l2_rect *rpf_rect = &partition->rpf[rpf->entity.index];
>
> 	/*
> 	 * Partition Algorithm Control
> 	 *
> 	 * The partition algorithm can split this frame into multiple slices. We
> 	 * must adjust our partition window based on the pipe configuration to
> 	 * match the destination partition window. To achieve this, we adjust
> 	 * our crop to provide a 'sub-crop' matching the expected partition
> 	 * window.
> 	 */
> 	*rpf_rect = *v4l2_subdev_state_get_crop(state, RWPF_PAD_SINK);
>
> 	if (pipe->partitions > 1) {
> 		rpf_rect->width = window->width;
> 		rpf_rect->left += window->left;
> 	}
> }
>
> The partition argument to the function is &pipe->part_table[0], so
> rpf_rect is pipe->part_table[0].rpf[0].
>
> Could you check if the values of pipe->part_table[0].rpf[0].width and
> pipe->part_table[0].rpf[0].height match width and height after you call
> vsp1_pipeline_calculate_partition() ?

Yes they do

I will drop the assignment of width and height

>
> > To be honest that partition part is still a bit obscure to me, so I
> > might be missing something indeed
> >
> > > > +
> > > > +	rpf0->mem.addr[0] = addr;
> > > > +	rpf0->mem.addr[1] = 0;
> > > > +	rpf0->mem.addr[2] = 0;
> > > > +
> > > > +	vsp1_entity_route_setup(&rpf0->entity, pipe, dlb);
> > > > +	vsp1_entity_configure_stream(&rpf0->entity, rpf0->entity.state, pipe,
> > > > +				     dl, dlb);
> > > > +	vsp1_entity_configure_partition(&rpf0->entity, pipe,
> > > > +					&pipe->part_table[0], dl, dlb);
> > > > +
> > > > +	return 0;
> > > > +}
>
> [snip]
>
> > > > +/**
> > > > + * vsp1_isp_start_streaming - Start processing VSPX jobs
> > > > + *
> > > > + * Start the VSPX and prepare for accepting buffer transfer job requests.
> > > > + *
> > > > + * @dev: The VSP1 struct device
> > > > + * @frame_end: The frame end callback description
> > > > + *
> > > > + * Return: %0 on success or a negative error code on failure
> > > > + */
> > > > +int vsp1_isp_start_streaming(struct device *dev,
> > > > +			     struct vsp1_vspx_frame_end *frame_end)
> > > > +{
> > > > +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> > > > +	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
> > > > +	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
> > > > +	unsigned long flags;
> > > > +	u32 value;
> > > > +	int ret;
> > > > +
> > > > +	spin_lock_irqsave(&vspx_pipe->vspx_lock, flags);
> > >
> > > Can this function ever be called with interrupts disabled ? If no, you
> > > can use spin_lock_irq().
> >
> > I think the question here should rather be: do we need to disable
> > local interrupts at all when calling this function ? As the VSPX
> > workflow is now driven by ISP and there are no contentions between any
> > of the driver functions and the VSPX interrupt handler I guess I can
> > use spin_lock() and spin_unlock() everywhere and replace the
> > irqsave/irqrestore versions ?
>
> It depends what the spinlock protects.
>
> The point of the _irq and _irqsave variants is to prevent deadlocks. If
> a code section protected by a spinlock is interrupted by an IRQ handler
> on the same CPU, and the IRQ handler tries to take the same lock, a
> deadlock will occur: the IRQ handler will spin on the lock to wait until
> it gets released, but the lock will never get released as the code that
> took it has been preempted by the IRQ handler. Note that such an IRQ
> handler running on a different CPU is not an issue, it will spin on the
> lock, but the lock will be released by the first CPU running in parallel
> to the IRQ handler.
>
> To solve that problem, the spin_lock_irq() and spin_unlock_irq()
> functions respectively disable and enable local interrupts (i.e.
> interrupts on the same CPU, not interrupts on other CPUs). They should
> be called in contexts where interrupts are enabled (so not in an IRQ
> handler, and not in a section covered by another spin_lock_irq() call or
> uby other calls that disable local interrupts), and will ensure that no
> IRQ handler can preempt the CPU.
>
> Sometimes, you don't know if your code is running in a context where
> interrupts are enabled or not. This is the case for instance in helper
> functions that can be used in either contects. Using spin_lock_irq() is
> safe there (disabling local interrupts when they are already disabled is
> a no-op), but spin_unlock_irq() will enable local interrupts, which
> would lead to problems. For these cases, spin_lock_irqsave() will save
> the state of local interrupts and disable them, and
> spin_unlock_irqrestore() will restore the local interrupts state to what
> it was before spin_lock_irqsave().
>
> It is safe to use spin_lock_irqsave() and spin_unlock_irqrestore()
> unconditionally, but it has a performance impact. Using the right
> variants isn't very difficult. Once you identify the data protected by
> the lock, you need to look at where the data is accessed.
>
> - If the data is accessed only in non-interrupt context, or only in
>   interrupt context, use spin_lock() and spin_unlock() everywhere.
>
> - If the data is accessed in both contexts, use
>
>   - spin_lock() and spin_unlock() in code that runs only in contexts
>     where local interrupts are disabled
>
>   - spin_lock_irq() and spin_unlock_irq() in code that runs only in
>     contexts where local interrupts are enabled
>
>   - spin_lock_irqsave() and spin_unlock_irqrestore() in code that can
>     run in either context
>
> The vspx_lock is documented as "protect access to the VSPX configuration
> and the jobs queue". That's quite vague, so the first thing you'll have
> to do is to list the exact pieces of data that the lock protects, and
> then decide on the locking scheme.
>

With the new design I think I can drop the _irq/_irqsave version from
most places but the VSP1 interrupt handler callback. I will have a
look

> > > > +
> > > > +	if (vspx_pipe->enabled) {
> > > > +		spin_unlock_irqrestore(&vspx_pipe->vspx_lock, flags);
> > > > +		return 0;
> > >
> > > Shouldn't this be an error ?
> >
> > Should it ? I don't think it's an error conceptually, as the ISP
> > driver is currently designed however a single call to this function
> > should happen, so I can flag this as an error.
> >
> > However, as S_STREAM(1) is called on every video node, I would not
> > rule out a design where each video dev tries to start the VSPX. The
> > ones that arrive late will just hit a nop.
>
> The API exposed by the vsp driver to the ISP driver needs to be designed
> and clearly documented. There are different design options, but the API
> should not rely on a particular call pattern from the ISP driver without
> documenting it. As the documentation above doesn't indicate what the
> call pattern is, I can't tell if the design is good or not.
>
> This being said, if there are multiple userspace-facing devices that all
> need to be started, someone will have to reference-count the VSP
> start/stop state. Doing so in the vsp driver seems to add complexity
> without any real benefit. I think that handling this in the ISP driver
> would be better. I recommend making calling vsp1_isp_start_streaming()
> on an already enabled VSP instance invalid, and returning an error. Same
> when stopping the VSP, the ISP driver should decide when the VSP should
> be stopped, and should not call vsp1_isp_stop_streaming() on an already
> stopped instance.
>

I'll make this an error and specify that the function shall be called
once only in the documentation.

> > > > +	}
> > > > +
> > > > +	if (!frame_end) {
> > >
> > > You can move this check before taking the lock.
> >
> > True that
> >
> > > > +		spin_unlock_irqrestore(&vspx_pipe->vspx_lock, flags);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	vspx_pipe->vspx_frame_end = frame_end->vspx_frame_end;
> > > > +	vspx_pipe->frame_end_data = frame_end->frame_end_data;
> > >
> > > Move this just before setting ->enabled to true, so you won't override
> > > the values if the function returns an error in the checks below.
> > >
> > > > +
> > > > +	/* Make sure VSPX is not active. */
> > >
> > > This should never happen unless there's a serious bug in the driver,
> > > right ? I would make that explicit in the comment:
> > >
> > > 	/*
> > > 	 * Make sure VSPX is not active. This should never happen in normal
> > > 	 * usage.
> > > 	 */
> >
> > ok
> >
> > > > +	value = vsp1_read(vsp1, VI6_CMD(0));
> > > > +	if (value & VI6_CMD_STRCMD) {
> > > > +		dev_err(vsp1->dev,
> > > > +			"%s: Starting of WPF0 already reserved\n", __func__);
> > > > +		spin_unlock_irqrestore(&vspx_pipe->vspx_lock, flags);
> > > > +		return -EBUSY;
> > > > +	}
> > > > +
> > > > +	value = vsp1_read(vsp1, VI6_STATUS);
> > > > +	if (value & VI6_STATUS_SYS_ACT(0)) {
> > > > +		dev_err(vsp1->dev,
> > > > +			"%s: WPF0 has not entered idle state\n", __func__);
> > > > +		spin_unlock_irqrestore(&vspx_pipe->vspx_lock, flags);
> > > > +		return -EBUSY;
> > > > +	}
> > > > +
> > > > +	vspx_pipe->enabled = true;
> > > > +
> > > > +	spin_unlock_irqrestore(&vspx_pipe->vspx_lock, flags);
> > >
> > > and close the guarded scope here
> > >
> > > 	}
> >
> > I found it to be less readable because of the increased scoping.
> >
> > > > +
> > > > +	/* Enable the VSP1 and prepare for streaming. */
> > > > +	vsp1_pipeline_dump(pipe, "VSPX job");
> > > > +
> > > > +	ret = vsp1_device_get(vsp1);
> > >
> > > This should be done before you read the registers.
> >
> > Ah right. I guess this function should be then re-designed.
> >
> > > > +	if (ret < 0) {
> > > > +		guard(spinlock_irqsave)(&vspx_pipe->vspx_lock);
> > > > +		vspx_pipe->enabled = false;
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(vsp1_isp_start_streaming);
> > > > +
> > > > +/**
> > > > + * vsp1_isp_stop_streaming - Stop the VSPX
> > > > + *
> > > > + * @dev: The VSP1 struct device
> > > > + */
> > > > +void vsp1_isp_stop_streaming(struct device *dev)
> > > > +{
> > > > +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> > > > +	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
> > > > +	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
> > > > +	unsigned long flags;
> > > > +
> > > > +	spin_lock_irqsave(&vspx_pipe->vspx_lock, flags);
> > > > +
> > > > +	if (!vspx_pipe->enabled) {
> > > > +		spin_unlock_irqrestore(&vspx_pipe->vspx_lock, flags);
> > > > +		return;
> > > > +	}
> > >
> > > 	scoped_guard(spinlock_irqsave)(&vspx_pipe->vspx_lock, flags) {
> > > 		if (!vspx_pipe->enabled)
> > > 			return;
> > >
> > > 		...
> > >
> > > (or spinlock_irq, see comment in vsp1_isp_start_streaming()).
> >
> > Am I mistaken that the _irq version you suggest still disables
> > local interrupts, which is something I shouldn't need
> >
> > -------------------------------------------------------------------------------
> > From "Documentation/kernel-hacking/locking.rst"
> >
> > If a hardware irq handler shares data with a softirq, you have two
> > concerns. Firstly, the softirq processing can be interrupted by a
> > hardware interrupt, and secondly, the critical region could be entered
> > by a hardware interrupt on another CPU. This is where
> > spin_lock_irq() is used. It is defined to disable
> > interrupts on that cpu, then grab the lock.
> > spin_unlock_irq() does the reverse.
> > -------------------------------------------------------------------------------
> >
> > I guess I should simply use spin_lock/spin_unlock
>
> See above.
>
> > > > +
> > > > +	vspx_pipe->enabled = false;
> > > > +
> > > > +	pipe->state = VSP1_PIPELINE_STOPPED;
> > > > +	vsp1_pipeline_stop(pipe);
> > >
> > > You can't call this with a spin lock held. We can look together at how
> > > to handle locking in this driver, and use a mutex instead of a spinlock
> > > (I know you went the other way around).
> >
> > Actually my only concern with mutexes is that they can't be called by
> > the ISP driver while it holds a spinlock. With this new version the
> > only function that would need to be called with a spinlock taken is
> > vsp1_isp_job_run() and vsp1_isp_jobs_release() which only contends the
> > jobs_queue with the rest of the functions of the VSPX driver.
> >
> > I could use a mutex as a main lock here and a spinlock to protect the
> > jobs queue.
>
> I think you'll need to do that, using a mutex to protect the whole
> start/stop functions, and a spinlock inside for specific fields of the
> vsp1_vspx_pipeline structure that are also accessed in the interrupt
> handler. Looking at v10, there's a race condition between start and stop
> due to not covering the whole functions with a mutex.

I'll need a mutex to protect the whole start/stop streaming paths yes.

However I still need to take a spinlock in the stop_streaming path as
there's a contention on vspx_pipe->enabled between stop_streaming and
job run.

>
> > Or I could simply call the vsp1_pipeline_stop() outside of the
> > critical section here.
> >
> > > > +	vspx_pipe->vspx_frame_end = NULL;
> > > > +	vsp1_dlm_reset(pipe->output->dlm);
> > > > +
> > > > +	spin_unlock_irqrestore(&vspx_pipe->vspx_lock, flags);
> > >
> > > 	}
> > >
> > > > +
> > > > +	vsp1_device_put(vsp1);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(vsp1_isp_stop_streaming);
> > > > +
> > > > +/**
> > > > + * vsp1_vspx_job_prepare - Prepare a new buffer transfer job
> > > > + *
> > > > + * Prepare a new buffer transfer job by populating a display list that will be
> > > > + * later executed by a call to vsp1_isp_job_run().
> > > > + *
> > > > + * The newly created job is appended to the queue of pending jobs. All pending
> > > > + * jobs must be released after stopping the streaming operations with a call
> > > > + * to vsp1_isp_jobs_release().
> > > > + *
> > > > + * @dev: The VSP1 struct device
> > > > + * @job: The job description
> > > > + *
> > > > + * Return: %0 on success or a negative error code on failure
> > > > + */
> > > > +int vsp1_isp_job_prepare(struct device *dev,
> > > > +			 const struct vsp1_isp_job_desc *desc)
> > > > +{
> > > > +	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> > > > +	struct vsp1_vspx_pipeline *vspx_pipe = &vsp1->vspx->pipe;
> > > > +	struct vsp1_pipeline *pipe = &vspx_pipe->pipe;
> > > > +	const struct v4l2_pix_format_mplane *pix_mp;
> > > > +	struct vsp1_dl_list *second_dl = NULL;
> > > > +	struct vsp1_vspx_job *job;
> > > > +	struct vsp1_dl_body *dlb;
> > > > +	struct vsp1_dl_list *dl;
> > > > +	int ret;
> > > > +
> > > > +	/* Memory will be released when the job is consumed. */
> > > > +	job = kmalloc(sizeof(*job), GFP_KERNEL);
> > > > +	if (!job)
> > > > +		return -ENOMEM;
> > >
> > > Hmmm... I think this can be improved. I would need to see how the ISP
> > > driver uses this API, but I'm thinking the job data could be stored in
> > > vsp1_isp_job_desc, without adding the job to a queue in this function.
> > > The job would then be passed to the run function, which would queue it.
> > > I think the resulting API would be cleaner. You will need an extra
> > > function to delete/destroy/cleanup a job that hasn't been queued (the
> > > counterpart of this function, essentially).
> >
> > I'm not sure I got this to be honest.
> >
> > A VSPX job is basically just a display list + a list handle.
> > Are you suggesting add the display list to vsp1_isp_job_desc and keep
> > a queue of jobs on the ISP side only ? Then pass the dl in to
> > vsp1_isp_job_run() ? This would avoid maintaing a queue of jobs on the
> > VSPX side at all most probably and save me the hassle to cleanup the
> > jobs queue on the VSPX side.
> >
> > I'll see how this could look.
>
> The implementation in v10 looks nicer.
>
> > > > +
> > > > +	/*
> > > > +	 * Transfer the buffers described in the job: an optional ConfigDMA
> > > > +	 * parameters buffer and a RAW image.
> > > > +	 */
> > > > +
> > > > +	job->dl = vsp1_dl_list_get(pipe->output->dlm);
> > > > +	if (!job->dl) {
> > > > +		ret = -ENOMEM;
> > > > +		goto error_free_job;
> > > > +	}
> > > > +
> > > > +	dl = job->dl;
> > > > +	dlb = vsp1_dl_list_get_body0(dl);
> > > > +
> > > > +	/* Disable RPF1. */
> > > > +	vsp1_dl_body_write(dlb, vsp1->rpf[1]->entity.route->reg,
> > > > +			   VI6_DPR_NODE_UNUSED);
> > >
> > > The route is disabled in vsp1_device_init(), and we never use RPF1. I
> > > think this can be dropped.
> >
> > ack
> >
> > > > +
> > > > +	/* Configure IIF routing and enable IIF function */
> > >
> > > s/function/function./
> > >
> > > > +	vsp1_entity_route_setup(pipe->iif, pipe, dlb);
> > > > +	vsp1_entity_configure_stream(pipe->iif, pipe->iif->state, pipe,
> > > > +				     dl, dlb);
> > > > +
> > > > +	/* Configure WPF0 to enable RPF0 as source*/
> > >
> > > s/source/source. /
> > >
> > > > +	vsp1_entity_route_setup(&pipe->output->entity, pipe, dlb);
> > > > +	vsp1_entity_configure_stream(&pipe->output->entity,
> > > > +				     pipe->output->entity.state, pipe,
> > > > +				     dl, dlb);
> > >
> > > I'm kind of tempting to call route_setup, configure_stream,
> > > configure_frame and configure_partition by iterating over the entities
> > > in the pipe, as done by vsp1_du_pipeline_configure(). The code would be
> > > more generic, at the cost of a few calls being duplicated between the
> > > config DMA and image configurations. What do you think ?
> >
> > The fact that the RPF0 is optionally configurable for ConfigDMA
> >
> > > > +
> > > > +	if (desc->config.pairs) {
> >
> > here
> >
> > makes it hard for me to see how this could be done cleanly.
> >
> > To be honest, the pipeline is fixed (rpf->iif->wpf) so I don't see
> > much benefits here
>
> Agreed.
>
> > > > +		/*
> > > > +		 * Configure RPF0 for config data. Transfer the number of
> > > > +		 * configuration pairs plus 2 words for the header.
> > > > +		 */
> > > > +		ret = vsp1_vspx_rpf0_configure(vsp1, desc->config.mem,
> > > > +					       V4L2_META_FMT_GENERIC_8,
> > > > +					       desc->config.pairs * 2 + 2, 1,
> > > > +					       desc->config.pairs * 2 + 2,
> > > > +					       VSPX_IIF_SINK_PAD_CONFIG,
> > > > +					       dl, dlb);
> > > > +		if (ret)
> > > > +			goto error_put_dl;
> > > > +
> > > > +		second_dl = vsp1_dl_list_get(pipe->output->dlm);
> > > > +		if (!second_dl) {
> > > > +			ret = -ENOMEM;
> > > > +			goto error_put_dl;
> > > > +		}
> > > > +
> > > > +		dl = second_dl;
> > > > +		dlb = vsp1_dl_list_get_body0(dl);
> > > > +	}
> > > > +
> > > > +	/* Configure RPF0 for RAW image transfer. */
> > > > +	pix_mp = &desc->img.fmt.fmt.pix_mp;
> > > > +	ret = vsp1_vspx_rpf0_configure(vsp1, desc->img.mem,
> > > > +				       pix_mp->pixelformat,
> > > > +				       pix_mp->width, pix_mp->height,
> > > > +				       pix_mp->plane_fmt[0].bytesperline,
> > > > +				       VSPX_IIF_SINK_PAD_IMG, dl, dlb);
> > > > +	if (ret)
> > > > +		goto error_put_dl;
> > > > +
> > > > +	if (second_dl)
> > > > +		vsp1_dl_list_add_chain(job->dl, second_dl);
> > > > +
> > > > +	scoped_guard(spinlock_irqsave, &vspx_pipe->vspx_lock) {
> > > > +		list_add_tail(&job->job_queue, &vspx_pipe->jobs);
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +
> > > > +error_put_dl:
> > > > +	if (second_dl)
> > > > +		vsp1_dl_list_put(second_dl);
> > > > +	vsp1_dl_list_put(job->dl);
> > > > +error_free_job:
> > > > +	kfree(job);
> > > > +	return ret;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(vsp1_isp_job_prepare);
>
> [snip]
>
> --
> Regards,
>
> Laurent Pinchart

