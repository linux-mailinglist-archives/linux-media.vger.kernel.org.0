Return-Path: <linux-media+bounces-39428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A0DB208C9
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 14:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B108F18A29A9
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 12:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6244E2BDC38;
	Mon, 11 Aug 2025 12:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A5TjlTCW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A311017578;
	Mon, 11 Aug 2025 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754915484; cv=none; b=fbUT06WHsRVSYMz5SkIHkLO9su2pd5B/jOWZtnRR0Ajk3eJKInSffPSfpnBlMtOTZRacpOJRbnYBS57NvVFKLd9RV3CIzyUoJjrhVs1Q1sneka3cIN+VP8MrWQc68ooSWGHH+cgvMF5sLgcbBF2YDEAfnB29l6yaKU4GLmCR8oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754915484; c=relaxed/simple;
	bh=D8uBtwSRhl3sF0B7mOJUUtLl5LI4xWkEGITTeMcDlSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMXwZFqiJEWSkF2uveTuH7ayGlea1eoKvPOaGu/ivP9W280RYyCLOxvHCHfNgy9LMsYO2/mkw89Rf5kS7oZQiqpe9WNqaewa3HDTcEv2L1HBJgzUAXdayJ5EacODSdijS5kdoJ2AQoUDyunuzmmy2aUpALgCx4z468lXF4j7CMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A5TjlTCW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 845374A4;
	Mon, 11 Aug 2025 14:30:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754915428;
	bh=D8uBtwSRhl3sF0B7mOJUUtLl5LI4xWkEGITTeMcDlSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5TjlTCW4+k0jxTR1BUHwVSo8nso/3uq7KnMDB6S8RJN73GYZK5NHLTv+FoFpSRit
	 zPIlYCCe/K0ei3mO9A07xuE8FCXQo0OAykNh9Lb1FJx+CrPh1l5L75ZNxmQs0rlolS
	 yo1q0bZJEFBIQ4IhmSWbBWj9HGwnUE7i8yK1sRO4=
Date: Mon, 11 Aug 2025 15:31:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "Du, Bin" <bin.du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com
Subject: Re: [PATCH v2 4/8] media: platform: amd: Add isp4 fw and hw interface
Message-ID: <20250811123102.GC30760@pendragon.ideasonboard.com>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-5-Bin.Du@amd.com>
 <aIclcwRep3F_z7PF@kekkonen.localdomain>
 <b033bf6c-c824-4f6d-8025-b6542ea8f35f@amd.com>
 <aJnYE2Z7F-PK1VHL@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aJnYE2Z7F-PK1VHL@kekkonen.localdomain>

On Mon, Aug 11, 2025 at 11:46:27AM +0000, Sakari Ailus wrote:
> On Tue, Jul 29, 2025 at 05:12:03PM +0800, Du, Bin wrote:
> > On 7/28/2025 3:23 PM, Sakari Ailus wrote:
> > > On Wed, Jun 18, 2025 at 05:19:55PM +0800, Bin Du wrote:
> > > > ISP firmware controls ISP HW pipeline using dedicated embedded processor
> > > > called ccpu.
> > > > The communication between ISP FW and driver is using commands and
> > > > response messages sent through the ring buffer. Command buffers support
> > > > either global setting that is not specific to the steam and support stream
> > > > specific parameters. Response buffers contains ISP FW notification
> > > > information such as frame buffer done and command done. IRQ is used for
> > > > receiving response buffer from ISP firmware, which is handled in the main
> > > > isp4 media device. ISP ccpu is booted up through the firmware loading
> > > > helper function prior to stream start.
> > > > Memory used for command buffer and response buffer needs to be allocated
> > > > from amdgpu buffer manager because isp4 is a child device of amdgpu.
> > > 
> > > Please rewrap this, some lines above are quite short.
> > > 
> > Thanks, the line after the short line is supposed to be a new paragraph?
> > Should we put all the description in one paragraph?
> 
> One or more paragraphs work fine, but a new paragraph is separated from the
> previous one by another newline.
> 
> ...

Paragraphs are defined as a block of text that convey one idea. They
should be visually separated by a space. As we can't have fractional
line spacing in plain text, paragraphs need to be separated by a blank
line. This is a typography rule that maximizes readability. There should
be no line break between sentences in a single paragraph.

Whether you write commit messages, formal documentation or comments in
code, typography is important to give the best experience to readers.
After all, a block of text that wouldn't focus on the readers would have
no reason to exist.


Now compare the above with


Paragraphs are defined as a block of text that convey one idea. They
should be visually separated by a space.
As we can't have fractional line spacing in plain text, paragraphs need
to be separated by a blank line.
This is a typography rule that maximizes readability. There should be no
line break between sentences in a single paragraph. Whether you write
commit messages, formal documentation or comments in code, typography is
important to give the best experience to readers.
After all, a block of text that wouldn't focus on the readers would have
no reason to exist.

> > > > +	void *cpu_ptr;
> > > > +	u64 gpu_addr;
> > > > +	u32 ret;
> > > > +
> > > > +	dev = ispif->dev;
> > > > +
> > > > +	if (!mem_size)
> > > > +		return NULL;
> > > > +
> > > > +	mem_info = kzalloc(sizeof(*mem_info), GFP_KERNEL);
> > > > +	if (!mem_info)
> > > > +		return NULL;
> > > > +
> > > > +	adev = (struct amdgpu_device *)ispif->adev;
> > > 
> > > Why the cast?
> > > 
> > > adev isn't a great name here as it's usually used for struct acpi_devices.
> > > 
> > In the next patch, will use new helper function for this and will no longer
> > use amdgpu_device
> 
> Use correct types when you can; either way this doesn't seem to be changed
> by the further patches in the set.
> 
> ...
> 
> > > > +static int isp4if_gpu_mem_free(struct isp4_interface *ispif,
> > > > +			       struct isp4if_gpu_mem_info *mem_info)
> > > > +{
> > > > +	struct device *dev = ispif->dev;
> > > > +	struct amdgpu_bo *bo;
> > > > +
> > > > +	if (!mem_info) {
> > > > +		dev_err(dev, "invalid mem_info\n");
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	bo = (struct amdgpu_bo *)mem_info->mem_handle;
> > > 
> > > Why do you need to cast here?
> > > 
> > In the next patch, will use new helper function for this and will no longer
> > use amdgpu_bo
> 
> Not quite, on top of this patch number 6 adds more of the same.
> 
> ...
> 
> > > > +static struct isp4if_cmd_element *
> > > > +isp4if_append_cmd_2_cmdq(struct isp4_interface *ispif,
> > > > +			 struct isp4if_cmd_element *cmd_ele)
> > > > +{
> > > > +	struct isp4if_cmd_element *copy_command = NULL;
> > > > +
> > > > +	copy_command = kmalloc(sizeof(*copy_command), GFP_KERNEL);
> > > > +	if (!copy_command)
> > > > +		return NULL;
> > > > +
> > > > +	memcpy(copy_command, cmd_ele, sizeof(*copy_command));
> > > 
> > > kmemdup()?
> > > 
> > Kmemdup is to allocate memory and copy, can't be used here.
> 
> Isn't that what you're doing above?
> 
> > > > +
> > > > +	guard(mutex)(&ispif->cmdq_mutex);
> > > > +
> > > > +	list_add_tail(&copy_command->list, &ispif->cmdq);
> > > > +
> > > > +	return copy_command;
> > > > +}

-- 
Regards,

Laurent Pinchart

