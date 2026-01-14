Return-Path: <linux-media+bounces-50729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C42B7D21432
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 22:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22762300762B
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 21:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9F42E541E;
	Wed, 14 Jan 2026 21:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lame6pPT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B604A333452;
	Wed, 14 Jan 2026 21:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768424638; cv=none; b=XUYgnYjIwDdL8hN7fZryWiVannjG8/JkXyNUcfiE8d24IpJBc4SVrRinJvWQ60pIztd7bOFrPq+t0O4BqEzafFLy/L7WvyK6D7oCh0CGaOTUMIHwnSak1EobJ1fXaepdQ087EWzbPLolVrY1kHVMnAQBqaNJSb4H035vUnxZcek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768424638; c=relaxed/simple;
	bh=JuMfxbuHvmWM1qa3yYjs66NJBP91XidboB9DZl+n38M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+IgEZAIfrFR+pcboxSpz2Fe61dt9cLyoQEps19tBwJXg2D9zfb/nCNvRnb8vc3/LT89ZoKHWDUMJ8p9z53tVVHVMY4UaQ3Y3ZUHruyYNU6R2JMX5J/dYDtp0mCwcoD4qcQ7n+H3l9xP2RpI/jD/NRf5eoX/qyK1qLl+XlFSQww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lame6pPT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768424637; x=1799960637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JuMfxbuHvmWM1qa3yYjs66NJBP91XidboB9DZl+n38M=;
  b=Lame6pPTRs5UjUQzuiK4/n0Trq3MfQ2bho6ihL5ZJjvf8T7MEIPAsdTK
   O+Ib1vYK2YNlz4Bu6VXI0SuQfXJ8Lpm5XRJAuNVYD3bMaxPVVQHgN9U3V
   ATGwNpX6Ip80iJDfjgmvBOzE8u4DhMcrFhIYQLBkOSU/wDAspfdTWvm0S
   VfRwIZvAJ9q1k48I1293CkOvqOW3NfTAS+o2ATC9MNKvJf2rlm6Zv+nW2
   h10gxlZjmQ7qppLfn8op0Ong0yxMk/Uo3p91eMuXpeACWdm5ngKDQ2uQT
   lE00wfzLt55d2afXIjYyQYnkrY7PCw0xQS1By5CBwTG7NOkjAMwEfXcGA
   A==;
X-CSE-ConnectionGUID: 60e27YOuQpWhVN8xtSg8bA==
X-CSE-MsgGUID: 3+TExfh9T4e5gIjFDMQBvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="57286030"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="57286030"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 13:03:56 -0800
X-CSE-ConnectionGUID: wz1ws1ksQeiqaR/8IGH+/Q==
X-CSE-MsgGUID: GhUgl2VQTKywS1MHAHrFNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204828408"
Received: from inaky-mobl1.amr.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.184])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 13:03:51 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 18719120742;
	Wed, 14 Jan 2026 23:03:49 +0200 (EET)
Date: Wed, 14 Jan 2026 23:03:49 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: Bin Du <Bin.Du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, mario.limonciello@amd.com,
	richard.gong@amd.com, anson.tsao@amd.com,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	Alexey Zagorodnikov <xglooom@gmail.com>
Subject: Re: [PATCH v7 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
Message-ID: <aWgEtfp1MWioqKox@kekkonen.localdomain>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-5-Bin.Du@amd.com>
 <aUkZP8i90uWaFliY@kekkonen.localdomain>
 <aV4MYcgdOviulN3E@sultan-box>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aV4MYcgdOviulN3E@sultan-box>

Hi Sultan,

On Tue, Jan 06, 2026 at 11:33:53PM -0800, Sultan Alsawaf wrote:
> Hi Sakari,
> 
> On Mon, Dec 22, 2025 at 12:11:11PM +0200, Sakari Ailus wrote:
> > Hi Bin,
> > 
> > On Tue, Dec 16, 2025 at 05:13:23PM +0800, Bin Du wrote:
> > > Isp4 sub-device is implementing v4l2 sub-device interface. It has one
> > > capture video node, and supports only preview stream. It manages firmware
> > > states, stream configuration. Add interrupt handling and notification for
> > > isp firmware to isp-subdevice.
> > > 
> > > Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
> > > Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> > > Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> > > Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> > > Signed-off-by: Bin Du <Bin.Du@amd.com>
> > > Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
> > > ---
> > >  MAINTAINERS                                   |   2 +
> > >  drivers/media/platform/amd/isp4/Makefile      |   3 +-
> > >  drivers/media/platform/amd/isp4/isp4.c        |  99 +-
> > >  drivers/media/platform/amd/isp4/isp4.h        |   7 +-
> > >  drivers/media/platform/amd/isp4/isp4_subdev.c | 975 ++++++++++++++++++
> > >  drivers/media/platform/amd/isp4/isp4_subdev.h | 124 +++
> > >  6 files changed, 1202 insertions(+), 8 deletions(-)
> > >  create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
> > >  create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index cccae369c876..48ffc8bbdcee 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -1149,6 +1149,8 @@ F:	drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > >  F:	drivers/media/platform/amd/isp4/isp4_hw_reg.h
> > >  F:	drivers/media/platform/amd/isp4/isp4_interface.c
> > >  F:	drivers/media/platform/amd/isp4/isp4_interface.h
> > > +F:	drivers/media/platform/amd/isp4/isp4_subdev.c
> > > +F:	drivers/media/platform/amd/isp4/isp4_subdev.h
> > >  
> > >  AMD KFD
> > >  M:	Felix Kuehling <Felix.Kuehling@amd.com>
> > > diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
> > > index a2a5bf98e912..6d4e6d6ac7f5 100644
> > > --- a/drivers/media/platform/amd/isp4/Makefile
> > > +++ b/drivers/media/platform/amd/isp4/Makefile
> > > @@ -4,4 +4,5 @@
> > >  
> > >  obj-$(CONFIG_AMD_ISP4) += amd_capture.o
> > >  amd_capture-objs := isp4.o \
> > > -		    isp4_interface.o
> > > +		    isp4_interface.o \
> > > +		    isp4_subdev.o
> > > diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
> > > index ad95e7f89189..bcd7cad32afd 100644
> > > --- a/drivers/media/platform/amd/isp4/isp4.c
> > > +++ b/drivers/media/platform/amd/isp4/isp4.c
> 
> [snip]
> 
> > >  static irqreturn_t isp4_irq_handler(int irq, void *arg)
> > >  {
> > > +	struct isp4_subdev *isp_subdev = arg;
> > > +	u32 intr_ack = 0, intr_en = 0, intr_status;
> > > +	int seen = 0;
> > 
> > Is int appropriate here? Should this be u32 or u64?
> 
> ffs() is just a macro alias for __builtin_ffs(). The parameter and return value
> of __builtin_ffs() are both int.

Ack, sounds reasonable.

> 
> > > +
> > > +	/* Get the ISP_SYS interrupt status */
> > > +	intr_status = isp4hw_rreg(isp_subdev->mmio, ISP_SYS_INT0_STATUS);
> > > +	intr_status &= ISP4_FW_RESP_RB_IRQ_STATUS_MASK;
> > > +
> > > +	/* Find which ISP_SYS interrupts fired */
> > > +	for (size_t i = 0; i < ARRAY_SIZE(isp4_irq); i++) {
> > > +		if (intr_status & isp4_irq[i].status_mask) {
> > > +			intr_ack |= isp4_irq[i].ack_mask;
> > > +			intr_en |= isp4_irq[i].en_mask;
> > > +			seen |= BIT(i);
> > > +		}
> > > +	}
> > > +
> > > +	/*
> > > +	 * Disable the ISP_SYS interrupts that fired. Must be done before waking
> > > +	 * the response threads, since they re-enable interrupts when finished.
> > > +	 * The lock synchronizes RMW of INT0_EN with isp4_enable_interrupt().
> > > +	 */
> > > +	spin_lock(&isp_subdev->irq_lock);
> > > +	intr_en = isp4hw_rreg(isp_subdev->mmio, ISP_SYS_INT0_EN) & ~intr_en;
> > > +	isp4hw_wreg(isp_subdev->mmio, ISP_SYS_INT0_EN, intr_en);
> > > +	spin_unlock(&isp_subdev->irq_lock);
> > > +
> > > +	/*
> > > +	 * Clear the ISP_SYS interrupts. This must be done after the interrupts
> > > +	 * are disabled, so that ISP FW won't flag any new interrupts on these
> > > +	 * streams, and thus we don't need to clear interrupts again before
> > > +	 * re-enabling them in the response thread.
> > > +	 */
> > > +	isp4hw_wreg(isp_subdev->mmio, ISP_SYS_INT0_ACK, intr_ack);
> > > +
> > > +	/* Wake up the response threads */
> > > +	for (int i; (i = ffs(seen)); seen = (seen >> i) << i)
> > 
> > unsigned int, please.
> 
> As mentioned above, ffs() takes an int and returns an int.
> 
> > The parentheses around ffs() appear redundant.
> 
> The parentheses are there because it's an assignment. Without them:
> 
> drivers/media/platform/amd/isp4/isp4.c: In function ‘isp4_irq_handler’:
> drivers/media/platform/amd/isp4/isp4.c:106:21: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
>   106 |         for (int i; i = ffs(seen); seen = (seen >> i) << i)
>       |                     ^
> 
> > The increment could probably be expressed as seen &= ~BIT(i).
> 
> Yes it can be, but it adds several more instructions before the loop body,
> without any improvement to the loop body (the sarx in the loop body is replaced
> by andn). The right shift trick is faster and this is a hot path (IRQ handler).

Fine by me, it won't make much difference in practice either way.

...

> > > +static int isp4sd_set_stream_path(struct isp4_subdev *isp_subdev)
> > > +{
> > > +	struct isp4_interface *ispif = &isp_subdev->ispif;
> > > +	struct isp4fw_cmd_set_stream_cfg cmd;
> > > +	struct device *dev = isp_subdev->dev;
> > > +
> > > +	/*
> > > +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
> > > +	 * zeroed, since this is not guaranteed on all compilers.
> > > +	 */
> > > +	memset(&cmd, 0, sizeof(cmd));
> > 
> > You could assign assign all these in the declaration and avoid zeroing the
> > memory explicitly at the same time. I presume possibly leaking some
> > information from memory to the firmware in case there are holes in the
> > struct isn't an issue.
> 
> Leaking kernel memory is bad. Also, there is no guarantee that the firmware will
> behave as expected with varying values for the padding bytes.
> 
> Please see my arguments from v4 on why these structs should be memset [1].

There should be no host CPU related ABI introduced padding in structs defining
firmware interfaces. Just use reserved fields in that case instead. In
other words, the above memset() is equivalent to zeroing the memory using
an assignment.

> 
> > > +	cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id = SENSOR_ID_ON_MIPI0;
> > > +	cmd.stream_cfg.mipi_pipe_path_cfg.b_enable = true;
> > > +	cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id = MIPI0_ISP_PIPELINE_ID;
> > > +
> > > +	cmd.stream_cfg.b_enable_tnr = true;
> > > +	dev_dbg(dev, "isp4fw_sensor_id %d, pipeId 0x%x EnableTnr %u\n",
> > > +		cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id,
> > > +		cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id,
> > > +		cmd.stream_cfg.b_enable_tnr);
> > > +
> > > +	return isp4if_send_command(ispif, CMD_ID_SET_STREAM_CONFIG,
> > > +				   &cmd, sizeof(cmd));
> > > +}
> > > +
> > > +static int isp4sd_send_meta_buf(struct isp4_subdev *isp_subdev)
> > > +{
> > > +	struct isp4_interface *ispif = &isp_subdev->ispif;
> > > +	struct isp4fw_cmd_send_buffer buf_type;
> > > +	struct device *dev = isp_subdev->dev;
> > > +	int i;
> > 
> > unsigned int, please. You can also declare this within the loop as you do
> > elsewhere. Consistency is nice.
> 
> Why does this need to be unsigned?

Do you need negative numbers there?

> 
> > > +
> > > +	/*
> > > +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
> > > +	 * zeroed, since this is not guaranteed on all compilers.
> > > +	 */
> > > +	memset(&buf_type, 0, sizeof(buf_type));
> > > +	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
> > > +		struct isp4if_gpu_mem_info *meta_info_buf =
> > > +				isp_subdev->ispif.meta_info_buf[i];
> > > +		int ret;
> > > +
> > > +		if (!meta_info_buf) {
> > > +			dev_err(dev, "fail for no meta info buf(%u)\n", i);
> > > +			return -ENOMEM;
> > > +		}
> > > +
> > > +		buf_type.buffer_type = BUFFER_TYPE_META_INFO;
> > > +		buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
> > > +		isp4if_split_addr64(meta_info_buf->gpu_mc_addr,
> > > +				    &buf_type.buffer.buf_base_a_lo,
> > > +				    &buf_type.buffer.buf_base_a_hi);
> > > +		buf_type.buffer.buf_size_a = meta_info_buf->mem_size;
> > > +		ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
> > > +					  &buf_type, sizeof(buf_type));
> > > +		if (ret) {
> > > +			dev_err(dev, "send meta info(%u) fail\n", i);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	dev_dbg(dev, "send meta info suc\n");
> > > +	return 0;
> > > +}
> > > +
> > > +static bool isp4sd_get_str_out_prop(struct isp4_subdev *isp_subdev,
> > > +				    struct isp4fw_image_prop *out_prop,
> > > +				    struct v4l2_subdev_state *state, u32 pad)
> > > +{
> > > +	struct device *dev = isp_subdev->dev;
> > > +	struct v4l2_mbus_framefmt *format;
> > > +
> > > +	format = v4l2_subdev_state_get_format(state, pad, 0);
> > > +	if (!format) {
> > > +		dev_err(dev, "fail get subdev state format\n");
> > > +		return false;
> > > +	}
> > > +
> > > +	switch (format->code) {
> > > +	case MEDIA_BUS_FMT_YUYV8_1_5X8:
> > > +		out_prop->image_format = IMAGE_FORMAT_NV12;
> > > +		out_prop->width = format->width;
> > > +		out_prop->height = format->height;
> > > +		out_prop->luma_pitch = format->width;
> > > +		out_prop->chroma_pitch = out_prop->width;
> > > +		break;
> > > +	case MEDIA_BUS_FMT_YUYV8_1X16:
> > > +		out_prop->image_format = IMAGE_FORMAT_YUV422INTERLEAVED;
> > > +		out_prop->width = format->width;
> > > +		out_prop->height = format->height;
> > > +		out_prop->luma_pitch = format->width * 2;
> > > +		out_prop->chroma_pitch = 0;
> > > +		break;
> > > +	default:
> > > +		dev_err(dev, "fail for bad image format:0x%x\n",
> > > +			format->code);
> > > +		return false;
> > > +	}
> > > +
> > > +	if (!out_prop->width || !out_prop->height)
> > > +		return false;
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +static int isp4sd_kickoff_stream(struct isp4_subdev *isp_subdev, u32 w, u32 h)
> > > +{
> > > +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> > > +	struct isp4_interface *ispif = &isp_subdev->ispif;
> > > +	struct device *dev = isp_subdev->dev;
> > > +
> > > +	if (sensor_info->status == ISP4SD_START_STATUS_STARTED)
> > > +		return 0;
> > > +
> > > +	if (sensor_info->status == ISP4SD_START_STATUS_START_FAIL) {
> > > +		dev_err(dev, "fail for previous start fail\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	dev_dbg(dev, "w:%u,h:%u\n", w, h);
> > > +
> > > +	if (isp4sd_send_meta_buf(isp_subdev)) {
> > > +		dev_err(dev, "fail to send meta buf\n");
> > > +		sensor_info->status = ISP4SD_START_STATUS_START_FAIL;
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	sensor_info->status = ISP4SD_START_STATUS_OFF;
> > > +
> > > +	if (!sensor_info->start_stream_cmd_sent &&
> > > +	    sensor_info->buf_sent_cnt >= ISP4SD_MIN_BUF_CNT_BEF_START_STREAM) {
> > > +		int ret = isp4if_send_command(ispif, CMD_ID_START_STREAM,
> > > +					      NULL, 0);
> > > +		if (ret) {
> > > +			dev_err(dev, "fail to start stream\n");
> > > +			return ret;
> > > +		}
> > > +
> > > +		sensor_info->start_stream_cmd_sent = true;
> > > +	} else {
> > > +		dev_dbg(dev,
> > > +			"no send START_STREAM, start_sent %u, buf_sent %u\n",
> > > +			sensor_info->start_stream_cmd_sent,
> > > +			sensor_info->buf_sent_cnt);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
> > > +			       struct v4l2_subdev_state *state, u32 pad)
> > > +{
> > > +	struct isp4sd_output_info *output_info = &isp_subdev->sensor_info.output_info;
> > > +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> > > +	struct isp4_interface *ispif = &isp_subdev->ispif;
> > > +	struct isp4fw_cmd_set_out_ch_prop cmd_ch_prop;
> > > +	struct isp4fw_cmd_enable_out_ch cmd_ch_en;
> > > +	struct device *dev = isp_subdev->dev;
> > > +	int ret;
> > > +
> > > +	if (output_info->start_status == ISP4SD_START_STATUS_STARTED)
> > > +		return 0;
> > > +
> > > +	if (output_info->start_status == ISP4SD_START_STATUS_START_FAIL) {
> > > +		dev_err(dev, "fail for previous start fail\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	/*
> > > +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
> > > +	 * zeroed, since this is not guaranteed on all compilers.
> > > +	 */
> > > +	memset(&cmd_ch_prop, 0, sizeof(cmd_ch_prop));
> > > +	cmd_ch_prop.ch = ISP_PIPE_OUT_CH_PREVIEW;
> > > +
> > > +	if (!isp4sd_get_str_out_prop(isp_subdev, &cmd_ch_prop.image_prop, state, pad)) {
> > > +		dev_err(dev, "fail to get out prop\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	dev_dbg(dev, "channel:%d,fmt %d,w:h=%u:%u,lp:%u,cp%u\n",
> > > +		cmd_ch_prop.ch,
> > > +		cmd_ch_prop.image_prop.image_format,
> > > +		cmd_ch_prop.image_prop.width, cmd_ch_prop.image_prop.height,
> > > +		cmd_ch_prop.image_prop.luma_pitch,
> > > +		cmd_ch_prop.image_prop.chroma_pitch);
> > > +
> > > +	ret = isp4if_send_command(ispif, CMD_ID_SET_OUT_CHAN_PROP,
> > > +				  &cmd_ch_prop, sizeof(cmd_ch_prop));
> > > +	if (ret) {
> > > +		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
> > > +		dev_err(dev, "fail to set out prop\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	/*
> > > +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
> > > +	 * zeroed, since this is not guaranteed on all compilers.
> > 
> > You should have explicit padding fields in any case and not rely on ABI in
> > this case.
> 
> It is error-prone for a human to make sure that all padding bytes have
> explicit struct members. And what about future changes to the firmware
> API where explicit padding might be forgotten?

Just don't do that. Use pahole to verify the result when making changes to
the structs.

> 
> Unless the firmware API structs are all __packed in a future firmware update, I
> think the memsets should remain.

If you want to be certain of the size of the structs, use BUILD_BUG_ON().

-- 
Kind regards,

Sakari Ailus

