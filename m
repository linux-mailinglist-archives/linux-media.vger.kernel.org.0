Return-Path: <linux-media+bounces-39517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0299B21FA5
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 150581AA6224
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 07:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7A82D323D;
	Tue, 12 Aug 2025 07:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IeP8YUI8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C831A9F99;
	Tue, 12 Aug 2025 07:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754984094; cv=none; b=VIWNvkM/dstEDRgpeQlYU8tS9vaNM114fKsnDtyivVSyDDJ+4xP4NTnuXesq1OPyxmgzoDzO3W/sIczG+GsqT9AP5/6KwzdesHlLmMTncUifLU47+F8gqT+rK+r4PqQG+ggp7yZ7xQ2+55QyujMQmpQbDAOUs4SzCdquH/RS8qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754984094; c=relaxed/simple;
	bh=/ALrOFJ9/fMeB0jkp0E7drCOhw3pyhpTTvvoWjCfuVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbNgMnEczvnqM3nwypimE22IFsBuT9ZkcQwK6SSo03UKJd7dMciks88pBEhZiDfPdy1g4LNaOT7Y0QIl27uwWDSuK6JyeyjrnET+xLyaccVYkzOsPnuGx9mPQfB/ENOm3aWM0J9jsdWHOObx7M2zZ7FFl5FMoYADL+Ae+u/dsfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IeP8YUI8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 790394A4;
	Tue, 12 Aug 2025 09:33:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754984037;
	bh=/ALrOFJ9/fMeB0jkp0E7drCOhw3pyhpTTvvoWjCfuVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IeP8YUI8zgsuCV6UGHT3iw7SXYrZ3/rdeK4Nn4Sy8FxP5bVAoigxS+M69I2QAuShc
	 eBNGcJqkGQVwYZe9vWfZIss60nqfofdfLdZihwyw6+8mnKaPmppIPpy4Vq9kpmvTi8
	 1wTTdt7HAONtf6U5HNDpqMQ4+DIBTI58ugJEoLWw=
Date: Tue, 12 Aug 2025 10:34:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com,
	Mario Limonciello <mario.limonciello@amd.com>, Richard.Gong@amd.com,
	anson.tsao@amd.com
Subject: Re: [PATCH v2 4/8] media: platform: amd: Add isp4 fw and hw interface
Message-ID: <20250812073432.GF30054@pendragon.ideasonboard.com>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-5-Bin.Du@amd.com>
 <aIclcwRep3F_z7PF@kekkonen.localdomain>
 <b033bf6c-c824-4f6d-8025-b6542ea8f35f@amd.com>
 <aJnYE2Z7F-PK1VHL@kekkonen.localdomain>
 <20250811123102.GC30760@pendragon.ideasonboard.com>
 <50f0958b-5234-4a89-a57e-5d330cca13af@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <50f0958b-5234-4a89-a57e-5d330cca13af@amd.com>

On Tue, Aug 12, 2025 at 11:36:23AM +0800, Du, Bin wrote:
> Many thanks Laurent Pinchart for the comments.
> 
> On 8/11/2025 8:31 PM, Laurent Pinchart wrote:
> > On Mon, Aug 11, 2025 at 11:46:27AM +0000, Sakari Ailus wrote:
> >> On Tue, Jul 29, 2025 at 05:12:03PM +0800, Du, Bin wrote:
> >>> On 7/28/2025 3:23 PM, Sakari Ailus wrote:
> >>>> On Wed, Jun 18, 2025 at 05:19:55PM +0800, Bin Du wrote:
> >>>>> ISP firmware controls ISP HW pipeline using dedicated embedded processor
> >>>>> called ccpu.
> >>>>> The communication between ISP FW and driver is using commands and
> >>>>> response messages sent through the ring buffer. Command buffers support
> >>>>> either global setting that is not specific to the steam and support stream
> >>>>> specific parameters. Response buffers contains ISP FW notification
> >>>>> information such as frame buffer done and command done. IRQ is used for
> >>>>> receiving response buffer from ISP firmware, which is handled in the main
> >>>>> isp4 media device. ISP ccpu is booted up through the firmware loading
> >>>>> helper function prior to stream start.
> >>>>> Memory used for command buffer and response buffer needs to be allocated
> >>>>> from amdgpu buffer manager because isp4 is a child device of amdgpu.
> >>>>
> >>>> Please rewrap this, some lines above are quite short.
> >>>>
> >>> Thanks, the line after the short line is supposed to be a new paragraph?
> >>> Should we put all the description in one paragraph?
> >>
> >> One or more paragraphs work fine, but a new paragraph is separated from the
> >> previous one by another newline.
> >>
> >> ...
> > 
> > Paragraphs are defined as a block of text that convey one idea. They
> > should be visually separated by a space. As we can't have fractional
> > line spacing in plain text, paragraphs need to be separated by a blank
> > line. This is a typography rule that maximizes readability. There should
> > be no line break between sentences in a single paragraph.
> > 
> > Whether you write commit messages, formal documentation or comments in
> > code, typography is important to give the best experience to readers.
> > After all, a block of text that wouldn't focus on the readers would have
> > no reason to exist.
> > 
> > 
> > Now compare the above with
> > 
> > 
> > Paragraphs are defined as a block of text that convey one idea. They
> > should be visually separated by a space.
> > As we can't have fractional line spacing in plain text, paragraphs need
> > to be separated by a blank line.
> > This is a typography rule that maximizes readability. There should be no
> > line break between sentences in a single paragraph. Whether you write
> > commit messages, formal documentation or comments in code, typography is
> > important to give the best experience to readers.
> > After all, a block of text that wouldn't focus on the readers would have
> > no reason to exist.
> 
> Really appreciate the detailed guide, will follow it. May I summarize 
> like this? 1 Separate paragraphs by a blank line. 2 Don't add line break 
> between sentences in a single paragraph, an exception to this is commit 
> message, because of the 75-character patch check limit, line break can 
> be added, but it should at the 75-character limit boundary

When I wrote "line break", I meant breaking the line after a sentence,
before the 75 columns limits. Text blocks should always be wrapped (at
75 columns in commit messages, or 80 in kernel code). What you should
avoid is line breaks not related to the columns limit.

This is fine:

This paragraph has a long sentence that does not hold on a single line
of 72 characters and therefore needs to be wrapped. There is no line
break otherwise, for instance between the first and second sentence, or
within a sentence.

This is not right:

This paragraph has a long sentence that does not hold on a single line
of 72 characters and therefore needs to be wrapped.
There is a line break between the first and second sentence,
and also a line break in the second sentence, which are not fine.

> >>>>> +	void *cpu_ptr;
> >>>>> +	u64 gpu_addr;
> >>>>> +	u32 ret;
> >>>>> +
> >>>>> +	dev = ispif->dev;
> >>>>> +
> >>>>> +	if (!mem_size)
> >>>>> +		return NULL;
> >>>>> +
> >>>>> +	mem_info = kzalloc(sizeof(*mem_info), GFP_KERNEL);
> >>>>> +	if (!mem_info)
> >>>>> +		return NULL;
> >>>>> +
> >>>>> +	adev = (struct amdgpu_device *)ispif->adev;
> >>>>
> >>>> Why the cast?
> >>>>
> >>>> adev isn't a great name here as it's usually used for struct acpi_devices.
> >>>>
> >>> In the next patch, will use new helper function for this and will no longer
> >>> use amdgpu_device
> >>
> >> Use correct types when you can; either way this doesn't seem to be changed
> >> by the further patches in the set.
> >>
> >> ...
> >>
> >>>>> +static int isp4if_gpu_mem_free(struct isp4_interface *ispif,
> >>>>> +			       struct isp4if_gpu_mem_info *mem_info)
> >>>>> +{
> >>>>> +	struct device *dev = ispif->dev;
> >>>>> +	struct amdgpu_bo *bo;
> >>>>> +
> >>>>> +	if (!mem_info) {
> >>>>> +		dev_err(dev, "invalid mem_info\n");
> >>>>> +		return -EINVAL;
> >>>>> +	}
> >>>>> +
> >>>>> +	bo = (struct amdgpu_bo *)mem_info->mem_handle;
> >>>>
> >>>> Why do you need to cast here?
> >>>>
> >>> In the next patch, will use new helper function for this and will no longer
> >>> use amdgpu_bo
> >>
> >> Not quite, on top of this patch number 6 adds more of the same.
> >>
> >> ...
> >>
> >>>>> +static struct isp4if_cmd_element *
> >>>>> +isp4if_append_cmd_2_cmdq(struct isp4_interface *ispif,
> >>>>> +			 struct isp4if_cmd_element *cmd_ele)
> >>>>> +{
> >>>>> +	struct isp4if_cmd_element *copy_command = NULL;
> >>>>> +
> >>>>> +	copy_command = kmalloc(sizeof(*copy_command), GFP_KERNEL);
> >>>>> +	if (!copy_command)
> >>>>> +		return NULL;
> >>>>> +
> >>>>> +	memcpy(copy_command, cmd_ele, sizeof(*copy_command));
> >>>>
> >>>> kmemdup()?
> >>>>
> >>> Kmemdup is to allocate memory and copy, can't be used here.
> >>
> >> Isn't that what you're doing above?
> >>
> >>>>> +
> >>>>> +	guard(mutex)(&ispif->cmdq_mutex);
> >>>>> +
> >>>>> +	list_add_tail(&copy_command->list, &ispif->cmdq);
> >>>>> +
> >>>>> +	return copy_command;
> >>>>> +}

-- 
Regards,

Laurent Pinchart

