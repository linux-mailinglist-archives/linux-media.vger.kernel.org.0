Return-Path: <linux-media+bounces-12383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 103D48D72E9
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2024 02:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F5451C20B2B
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2024 00:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D33B816;
	Sun,  2 Jun 2024 00:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fKmlz089"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A595D386;
	Sun,  2 Jun 2024 00:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717287914; cv=none; b=BNygOCQWon/h9ABG/H2MR33mq9VO3JR8/CPTlyYND1gWgYSU0D0bQFVCovzimhrUI4aL75R5N2TMRjfum19tyZ7fR3u3TNY3dpvqpu6sl8T+jOW8JxKpuRc8E7muW+Nb2pa3b/+qhkM8Hy5hdr+XOv10KGPa5WOHm5wzxAY3LEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717287914; c=relaxed/simple;
	bh=NwBkjLhOAWaDOQNynIe4IfcCRGoezklLk/F+FbI8uyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBSofpM6imVsUaK0DFAucBodQssyjVbMbnlN/XGepn/KEsGSJY0Q/Gytf8Fe7mjq1Vp7CjKU/lLun3MnmHb4L1u6AVQj9uWmgoWljBS01HPEiaUHq8EVYM0PRuStoBCiqJK1t8y449/x6mHKXf0slz859wlqlpatS+1kI8L4p18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fKmlz089; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E225766B;
	Sun,  2 Jun 2024 02:24:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717287897;
	bh=NwBkjLhOAWaDOQNynIe4IfcCRGoezklLk/F+FbI8uyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fKmlz089MwBLxuuY+8Nie/Lw8NolXQUI229oGochjc/BWrjjUGAjkfP0wlo8jVjic
	 1/xb0R2C5pax9O+sRsl3BaFiQ8ct7zx2rJmnhHGQgyA3TqjzFC7L2ReDrNS1rrrDkr
	 yZT0KrJdVgEWraYULMPFILY+LvIiQM/YlSrPwdMc=
Date: Sun, 2 Jun 2024 03:24:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v5 14/16] media: uapi: Add parameters structs to
 mali-c55-config.h
Message-ID: <20240602002448.GD23937@pendragon.ideasonboard.com>
References: <20240529152858.183799-1-dan.scally@ideasonboard.com>
 <20240529152858.183799-15-dan.scally@ideasonboard.com>
 <20240531000907.GG5213@pendragon.ideasonboard.com>
 <58dc4951-e724-4f6c-97be-16f5396686a9@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58dc4951-e724-4f6c-97be-16f5396686a9@ideasonboard.com>

Hi Dan,

On Fri, May 31, 2024 at 08:30:21AM +0100, Daniel Scally wrote:
> On 31/05/2024 01:09, Laurent Pinchart wrote:
> > On Wed, May 29, 2024 at 04:28:56PM +0100, Daniel Scally wrote:
> >> Add structures describing the ISP parameters to mali-c55-config.h
> >>
> >> Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
> >> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> >> ---
> >> Changes in v5:
> >>
> >> 	- New patch
> >>
> >>   .../uapi/linux/media/arm/mali-c55-config.h    | 669 ++++++++++++++++++
> >>   1 file changed, 669 insertions(+)
> >>
> >> diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
> >> index 8fb89af6c874..fce14bc74f4a 100644
> >> --- a/include/uapi/linux/media/arm/mali-c55-config.h
> >> +++ b/include/uapi/linux/media/arm/mali-c55-config.h
> >> @@ -179,4 +179,673 @@ struct mali_c55_stats_buffer {
> >>   	__u32 reserved3[15];
> >>   } __attribute__((packed));
> >>   
> >> +/**
> >> + * enum mali_c55_param_buffer_version - Mali-C55 parameters block versioning
> >> + *
> >> + * @MALI_C55_PARAM_BUFFER_V0: First version of Mali-C55 parameters block
> >
> > So you like versions to be 0-based ? :-)
> 
> Hah - sure. I'll switch it to V1.
>
> >> + */
> >> +enum mali_c55_param_buffer_version {
> >> +	MALI_C55_PARAM_BUFFER_V0,
> >> +};
> >> +
> >> +/**
> >> + * enum mali_c55_param_block_type - Enumeration of Mali-C55 parameter blocks
> >> + *
> >> + * This enumeration defines the types of Mali-C55 parameters block. Each block
> >> + * configures a specific processing block of the Mali-C55 ISP. The block
> >> + * type allows the driver to correctly interpret the parameters block data.
> >> + *
> >> + * It is the responsibility of userspace to correctly set the type of each
> >> + * parameters block.
> >> + *
> >> + * @MALI_C55_PARAM_BLOCK_SENSOR_OFFS: Sensor pre-shading black level offset
> >> + * @MALI_C55_PARAM_BLOCK_AEXP_HIST: Auto-exposure 1024-bin histogram
> >> + *				    configuration
> >> + * @MALI_C55_PARAM_BLOCK_AEXP_IHIST: Post-Iridix auto-exposure 1024-bin
> >> + *				     histogram configuration
> >> + * @MALI_C55_PARAM_BLOCK_AEXP_HIST_WEIGHTS: Auto-exposure 1024-bin histogram
> >> + *					    weighting
> >> + * @MALI_C55_PARAM_BLOCK_AEXP_IHIST_WEIGHTS: Post-Iridix auto-exposure 1024-bin
> >> + *					     histogram weighting
> >
> > Do you expect applications to need to set the histogram configuration
> > and weights separately ?
> 
> **Need** to no, but it's convenient. I don't particularly expect the histogram configuration to be 
> changed past the first frame, but changing the metering mode for example would require a new weights 
> array and separating them avoids re-writing the config unnecessarily.

Fine with me.

> >> + * @MALI_C55_PARAM_BLOCK_DIGITAL_GAIN: Digital gain
> >> + * @MALI_C55_PARAM_BLOCK_AWB_GAINS: Auto-white balance gains
> >
> > I was thinking that those two could be combined, but if the former is
> > used by AEC and the latter by AWB, maybe keeping them separate would
> > make like easier for userspace.
> 
> They're used by the separate algorithms yes.
> 
> >> + * @MALI_C55_PARAM_BLOCK_AWB_CONFIG: Auto-white balance statistics config
> >> + * @MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP: Auto-white balance gains for AEXP-0 tap
> >> + * @MALI_C55_PARAM_MESH_SHADING_CONFIG : Mesh shading tables configuration
> >> + * @MALI_C55_PARAM_MESH_SHADING_SELECTION: Mesh shading table selection
> >> + * @MALI_C55_PARAM_BLOCK_SENTINEL: First non-valid block index
> >
> > You should indicate somewhere the correspondance between the block type
> > and the block data structure. It could be done in the definition of each
> > data structure for instance.
> 
> Hmm...just in the documentary comment? Or something more strict?

Just in the comments. As the mapping isn't 1:1 (here are structures used
by multiple block types), documenting the mapping explicitly could avoid
confusion and mistakes.

> >> + */
> >> +enum mali_c55_param_block_type {
> >> +	MALI_C55_PARAM_BLOCK_SENSOR_OFFS,
> >> +	MALI_C55_PARAM_BLOCK_AEXP_HIST,
> >> +	MALI_C55_PARAM_BLOCK_AEXP_IHIST,
> >> +	MALI_C55_PARAM_BLOCK_AEXP_HIST_WEIGHTS,
> >> +	MALI_C55_PARAM_BLOCK_AEXP_IHIST_WEIGHTS,
> >> +	MALI_C55_PARAM_BLOCK_DIGITAL_GAIN,
> >> +	MALI_C55_PARAM_BLOCK_AWB_GAINS,
> >> +	MALI_C55_PARAM_BLOCK_AWB_CONFIG,
> >> +	MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP,
> >> +	MALI_C55_PARAM_MESH_SHADING_CONFIG,
> >> +	MALI_C55_PARAM_MESH_SHADING_SELECTION,
> >> +	MALI_C55_PARAM_BLOCK_SENTINEL,
> >> +};
> >> +
> >> +/**
> >> + * struct mali_c55_params_block_header - Mali-C55 parameter block header
> >> + *
> >> + * This structure represents the common part of all the ISP configuration
> >> + * blocks. Each parameters block shall embed an instance of this structure type
> >
> > s/shall embed/embeds/
> >
> >> + * as its first member, followed by the block-specific configuration data. The
> >> + * driver inspects this common header to discern the block type and its size and
> >> + * properly handle the block content by casting it to the correct block-specific
> >> + * type.
> >> + *
> >> + * The @type field is one of the values enumerated by
> >> + * :c:type:`mali_c55_param_block_type` and specifies how the data should be
> >> + * interpreted by the driver. The @size field specifies the size of the
> >> + * parameters block and is used by the driver for validation purposes. The
> >> + * @enabled field specifies if the ISP block should be enabled (and configured
> >> + * according to the provided parameters) or disabled.
> >> + *
> >> + * .. code-block:: c
> >> + *
> >> + *	struct mali_c55_params_block_header *block = ...;
> >> + *
> >> + *	switch (block->type) {
> >> + *	case MALI_C55_PARAM_BLOCK_SENSOR_OFFS:
> >> + *		struct mali_c55_params_sensor_off_preshading *sensor_offs =
> >> + *			(struct mali_c55_params_sensor_off_preshading *)block;
> >> + *
> >> + *		if (block->size !=
> >> + *		    sizeof(struct mali_c55_params_sensor_off_preshading))
> >> + *			return -EINVAL;
> >> + *
> >> + *		handle_sensor_offs(sensor_offs);
> >> + *		break;
> >> + *
> >> + *	case MALI_C55_PARAM_BLOCK_AEXP_HIST:
> >> + *		struct mali_c55_params_aexp_hist *aexp_hist =
> >> + *			(struct mali_c55_params_aexp_hist)block;
> >> + *
> >> + *		if (block->size != sizeof(mali_c55_params_aexp_hist))
> >> + *			return -EINVAL;
> >> + *
> >> + *		handle_aexp_hist(aesp_hist);
> >> + *		break;
> >> + *
> >> + *	...
> >> + *
> >> + *	}
> >
> > I would probably skip this. The kernel-side of the implementation can be
> > found in the driver. I would document the UAPI here with examples
> > focussing on the userspace side only.
> 
> OK.
> 
> >> + *
> >> + * Userspace is responsible for correctly populating the parameters block header
> >> + * fields (@type, @enabled and @size) and correctly populate the block-specific
> >> + * parameters.
> >> + *
> >> + * For example:
> >> + *
> >> + * .. code-block:: c
> >> + *
> >> + *	void populate_sensor_offs(struct mali_c55_params_block_header *block) {
> >> + *		block->type = MALI_C55_PARAM_BLOCK_SENSOR_OFFS;
> >> + *		block->enabled = true;
> >> + *		block->size = sizeof(struct mali_c55_params_sensor_off_preshading);
> >> + *
> >> + *		struct mali_c55_params_sensor_off_preshading *sensor_offs =
> >> + *			(struct mali_c55_params_sensor_off_preshading *)block;
> >> + *
> >> + *		sensor_offs->chan00 = offset00;
> >> + *		sensor_offs->chan01 = offset01;
> >> + *		sensor_offs->chan10 = offset10;
> >> + *		sensor_offs->chan11 = offset11;
> >> + *	}
> >> + *
> >> + * @type: The parameters block type (enum mali_c55_param_block_type)
> >> + * @enabled: Block enabled/disabled flag
> >
> > Does this flag apply to all blocks ? If not, it would be good to
> > indicate which blocks it applies to.
> 
> It's part of the header, so it's available to all blocks...they can all be disabled somehow though 
> the exact mechanism differs.
> 
> > Also, I think we discussed previously that, when a block is disabled,
> > its configuration parameters are not applicable anymore, and could then
> > be skipped. Is that something useful to do ?
> 
> We don't pass blocks where the values are unchanged (so only a couple go in each frame - white 
> balance and digital gain IIRC), but if we want to transition a block from enabled to disabled for 
> whatever reason the driver would need to see it

When userspace wants to disable a block, it will include the block in
the params buffer with .enabeld set to false. That's not an issue. What
I was wondering is if the rest of the block (after the header) was
needed in that case, or if we could include the header only in that
case.

> >> + * @size: Size (in bytes) of the parameters block
> >> + */
> >> +struct mali_c55_params_block_header {
> >> +	enum mali_c55_param_block_type type;
> >> +	bool enabled;
> >> +	size_t size;
> >
> > enums, bool and size_t shouldn't be used in a UAPI, as they size may
> > vary between 32- and 64-bit architectures, making 32-bit userspace on a
> > 64-bit kernel require compat handling in the driver. Use types with
> > well-defined sizes. Same below.
> 
> Ack
> 
> >> +};
> >> +
> >> +/**
> >> + * struct mali_c55_params_sensor_off_preshading - offset subtraction for each
> >> + *						  color channel
> >> + *
> >> + * Provides removal of the sensor black level from the sensor data. Separate
> >> + * oﬀsets are provided for each of the four Bayer component color channels
> >
> > That's a weird spelling of offsets.
> 
> Err...you mean "off"? It's from the documentation - I can spell it properly though.

I mean "oﬀsets" vs. "offsets". But now that you mention it, the
shortened "off" spelling in the structure name can be a bit confusing.

> >> + * which are defaulted to R, Gr, Gb, B.
> >
> > I think it would be useful to indicate, for each structure, what block
> > it corresponds to in the ascii diagram in patch 12/16.
> 
> Sure, ok.
> 
> > On a side note,
> > at some point turning that diagram into SVG may make sense.
> 
> That diagram is incomplete...it's only supposed to highlight the tap points and the blocks that 
> surround them. So we'll need to extend it to accommodate that (which probably will be easier as an SVG)

Agreed.

> >> + *
> >> + * @header: The Mali-C55 parameters block header
> >> + * @chan00: Offset for color channel 00 (default: R)
> >> + * @chan01: Offset for color channel 01 (default: Gr)
> >> + * @chan10: Offset for color channel 10 (default: Gb)
> >> + * @chan11: Offset for color channel 11 (default: B)
> >> + */
> >> +struct mali_c55_params_sensor_off_preshading {
> >> +	struct mali_c55_params_block_header header;
> >> +	__u32 chan00;
> >> +	__u32 chan01;
> >> +	__u32 chan10;
> >> +	__u32 chan11;
> >> +};
> >> +
> >> +/**
> >> + * enum mali_c55_aexp_hist_tap_points - Tap points for the AEXP histogram
> >> + * @MALI_C55_AEXP_HIST_TAP_WB: After static white balance
> >> + * @MALI_C55_AEXP_HIST_TAP_FS: After WDR Frame Stitch
> >> + * @MALI_C55_AEXP_HIST_TAP_TPG: After the test pattern generator
> >> + */
> >> +enum mali_c55_aexp_hist_tap_points {
> >> +	MALI_C55_AEXP_HIST_TAP_WB = 0,
> >> +	MALI_C55_AEXP_HIST_TAP_FS,
> >> +	MALI_C55_AEXP_HIST_TAP_TPG,
> >> +};
> >> +
> >> +/**
> >> + * enum mali_c55_aexp_skip_x - Horizontal pixel skipping
> >> + * @MALI_C55_AEXP_SKIP_X_EVERY_2ND: Collect every 2nd pixel horizontally
> >> + * @MALI_C55_AEXP_SKIP_X_EVERY_3RD: Collect every 3rd pixel horizontally
> >> + * @MALI_C55_AEXP_SKIP_X_EVERY_4TH: Collect every 4th pixel horizontally
> >> + * @MALI_C55_AEXP_SKIP_X_EVERY_5TH: Collect every 5th pixel horizontally
> >> + * @MALI_C55_AEXP_SKIP_X_EVERY_8TH: Collect every 8th pixel horizontally
> >> + * @MALI_C55_AEXP_SKIP_X_EVERY_9TH: Collect every 9th pixel horizontally
> >> + */
> >> +enum mali_c55_aexp_skip_x {
> >> +	MALI_C55_AEXP_SKIP_X_EVERY_2ND,
> >> +	MALI_C55_AEXP_SKIP_X_EVERY_3RD,
> >> +	MALI_C55_AEXP_SKIP_X_EVERY_4TH,
> >> +	MALI_C55_AEXP_SKIP_X_EVERY_5TH,
> >> +	MALI_C55_AEXP_SKIP_X_EVERY_8TH,
> >> +	MALI_C55_AEXP_SKIP_X_EVERY_9TH
> >> +};
> >
> > Does this mean that that the histogram can't operate on every pixels,
> > but will always skip at least every other pixel ?
> 
> Horizontally, yes. So the maximum pixel count would be (width / 2) x height.
> 
> >> +
> >> +/**
> >> + * enum mali_c55_aexp_skip_y - Vertical pixel skipping
> >> + * @MALI_C55_AEXP_SKIP_Y_ALL: Collect every single pixel vertically
> >> + * @MALI_C55_AEXP_SKIP_Y_EVERY_2ND: Collect every 2nd pixel vertically
> >> + * @MALI_C55_AEXP_SKIP_Y_EVERY_3RD: Collect every 3rd pixel vertically
> >> + * @MALI_C55_AEXP_SKIP_Y_EVERY_4TH: Collect every 4th pixel vertically
> >> + * @MALI_C55_AEXP_SKIP_Y_EVERY_5TH: Collect every 5th pixel vertically
> >> + * @MALI_C55_AEXP_SKIP_Y_EVERY_8TH: Collect every 8th pixel vertically
> >> + * @MALI_C55_AEXP_SKIP_Y_EVERY_9TH: Collect every 9th pixel vertically
> >> + */
> >> +enum mali_c55_aexp_skip_y {
> >> +	MALI_C55_AEXP_SKIP_Y_ALL,
> >> +	MALI_C55_AEXP_SKIP_Y_EVERY_2ND,
> >> +	MALI_C55_AEXP_SKIP_Y_EVERY_3RD,
> >> +	MALI_C55_AEXP_SKIP_Y_EVERY_4TH,
> >> +	MALI_C55_AEXP_SKIP_Y_EVERY_5TH,
> >> +	MALI_C55_AEXP_SKIP_Y_EVERY_8TH,
> >> +	MALI_C55_AEXP_SKIP_Y_EVERY_9TH
> >> +};
> >> +
> >> +/**
> >> + * enum mali_c55_aexp_row_column_offset - Start from the first or second row or
> >> + *					  column
> >> + * @MALI_C55_AEXP_FIRST_ROW_OR_COL:	Start from the first row / column
> >> + * @MALI_C55_AEXP_SECOND_ROW_OR_COL:	Start from the second row / column
> >> + */
> >> +enum mali_c55_aexp_row_column_offset {
> >> +	MALI_C55_AEXP_FIRST_ROW_OR_COL = 1,
> >> +	MALI_C55_AEXP_SECOND_ROW_OR_COL = 2,
> >> +};
> >> +
> >> +/**
> >> + * enum mali_c55_aexp_hist_plane_mode - Mode for the AEXP Histograms
> >
> > As histograms are computed on bayer data, I'd talk about "component"
> > instead of "plane" here, unless the word plane matches documentation.
> 
> Plane is from the documentation yes.
> 
> >> + * @MALI_C55_AEXP_HIST_COMBINED: All color planes in one 1024-bin histogram
> >> + * @MALI_C55_AEXP_HIST_SEPARATE: Each color plane in one 256-bin histogram with a bin width of 16
> >> + * @MALI_C55_AEXP_HIST_FOCUS_00: Top left plane in the first bank, rest in second bank
> >> + * @MALI_C55_AEXP_HIST_FOCUS_01: Top right plane in the first bank, rest in second bank
> >> + * @MALI_C55_AEXP_HIST_FOCUS_10: Bottom left plane in the first bank, rest in second bank
> >> + * @MALI_C55_AEXP_HIST_FOCUS_11: Bottom right plane in the first bank, rest in second bank
> >> + *
> >> + * In the "focus" modes statistics are collected into two 512-bin histograms
> >> + * with a bin width of 8. One colour plane is in the first histogram with the
> >> + * remainder combined into the second. The four options represent which of the
> >> + * four positions in a bayer pattern are the focused plane.
> >
> > How does that work with x/y skipping ? Is skipping then applied to 2x2
> > blocks, or still to pixels ?
> 
> To pixels, so particular configurations of the skipping and the offsets can cause some of the colour 
> component histograms to be empty.

Does it mean that in modes other than MALI_C55_AEXP_HIST_COMBINED the
user should pick a /3, /5 or /9 downsampling ? I think it would be
useful to explain this a bit better.

> >> + */
> >> +enum mali_c55_aexp_hist_plane_mode {
> >> +	MALI_C55_AEXP_HIST_COMBINED = 0,
> >> +	MALI_C55_AEXP_HIST_SEPARATE = 1,
> >> +	MALI_C55_AEXP_HIST_FOCUS_00 = 4,
> >> +	MALI_C55_AEXP_HIST_FOCUS_01 = 5,
> >> +	MALI_C55_AEXP_HIST_FOCUS_10 = 6,
> >> +	MALI_C55_AEXP_HIST_FOCUS_11 = 7,
> >> +};
> >> +
> >> +/**
> >> + * struct mali_c55_params_aexp_hist - configuration for AEXP metering hists
> >> + *
> >> + * This struct allows users to configure the 1024-bin AEXP histograms. Broadly
> >> + * speaking the parameters allow you to mask particular regions of the image and
> >> + * to select different kinds of histogram.
> >> + *
> >> + * @header:		The Mali-C55 parameters block header
> >> + * @skip_x:		Horizontal decimation. See enum mali_c55_aexp_skip_x
> >> + * @offset_x:		Column to start from. See enum mali_c55_aexp_row_column_offset
> >> + * @skip_y:		Vertical decimation. See enum mali_c55_aexp_skip_y
> >> + * @offset_y:		Row to start from. See enum mali_c55_aexp_row_column_offset
> >
> > Do the offsets need to be multiples of 2 ?
>
> It's effectively a boolean field to decide whether to skip the first column/row or not.

That should be mentionedThat should be mentioned..

> >> + * @scale_bottom:	scale of bottom half of range: 0=1x ,1=2x, 2=4x, 4=8x, 4=16x
> >
> > Could you elaborate on this ?
> 
> Will do
> 
> >> + * @scale_top:		scale of top half of range: 0=1x ,1=2x, 2=4x, 4=8x, 4=16x
> >> + * @plane_mode:		Plane separation mode. See enum mali_c55_aexp_hist_plane_mode
> >> + * @tap_point:		Tap point for histogram from enum mali_c55_aexp_hist_tap_points.
> >> + *			This parameter is unused for the post-Iridix Histogram
> >> + */
> >> +struct mali_c55_params_aexp_hist {
> >> +	struct mali_c55_params_block_header header;
> >> +	__u8 skip_x;
> >> +	__u8 offset_x;
> >> +	__u8 skip_y;
> >> +	__u8 offset_y;
> >> +	__u8 scale_bottom;
> >> +	__u8 scale_top;
> >> +	__u8 plane_mode;
> >> +	__u8 tap_point;
> >> +};
> >> +
> >> +/**
> >> + * struct mali_c55_params_aexp_weights - Array of weights for AEXP metering
> >> + *
> >> + * This struct allows users to configure the weighting for both of the 1024-bin
> >> + * AEXP histograms. The pixel data collected for each zone is multiplied by the
> >> + * corresponding weight from this array, which may be zero if the intention is
> >> + * to mask off the zone entirely.
> >> + *
> >> + * @header:		The Mali-C55 parameters block header
> >> + * @nodes_used_horiz:	Number of active zones horizontally [0..15]
> >> + * @nodes_used_vert:	Number of active zones vertically [0..15]
> >
> > Is the image automatically split in the number of zones with a uniform
> > distribution ?
> 
> That's my understanding yes
> 
> > What happens if the number of zones is 0 ?
> 
> I don't know; haven't tried. I'll test it out.

I hope it wont cause the blue smoke to come out of the chip :-)

> >> + * @zone_weights:	Zone weighting. Index is row*col where 0,0 is the top
> >> + * 			left zone continuing in raster order. Each zone can be
> >> + *			weighted in the range [0..15]. The number of rows and
> >> + *			columns is defined by @nodes_used_vert and
> >> + *			@nodes_used_horiz
> >> + */
> >> +struct mali_c55_params_aexp_weights {
> >> +	struct mali_c55_params_block_header header;
> >> +	__u8 nodes_used_horiz;
> >> +	__u8 nodes_used_vert;
> >> +	__u8 zone_weights[MALI_C55_MAX_ZONES];
> >> +};
> >> +
> >> +/**
> >> + * struct mali_c55_params_digital_gain - Digital gain value
> >> + *
> >> + * This struct carries a digital gain value to set in the ISP
> >> + *
> >> + * @header:	The Mali-C55 parameters block header
> >> + * @gain:	The digital gain value to apply, in Q5.8 format.
> >> + */
> >> +struct mali_c55_params_digital_gain {
> >> +	struct mali_c55_params_block_header header;
> >> +	__u16 gain;
> >> +};
> >> +
> >> +/**
> >> + * enum mali_c55_awb_stats_mode - Statistics mode for AWB
> >> + * @MALI_C55_AWB_MODE_GRBR: Statistics collected as Green/Red and Blue/Red ratios
> >> + * @MALI_C55_AWB_MODE_RGBG: Statistics collected as Red/Green and Blue/Green ratios
> >> + */
> >> +enum mali_c55_awb_stats_mode {
> >> +       MALI_C55_AWB_MODE_GRBR = 0,
> >> +       MALI_C55_AWB_MODE_RGBG,
> >> +};
> >> +
> >> +/**
> >> + * struct mali_c55_params_awb_gains - Gain settings for auto white balance
> >> + *
> >> + * This struct allows users to configure the gains for auto-white balance. There
> >> + * are four gain settings corresponding to each colour channel in the bayer
> >> + * domain. Although named generically, the association between the gain applied
> >> + * and the colour channel is done automatically within the ISP depending on the
> >> + * input format, and so the following mapping always holds true::
> >> + *
> >> + *	gain00 = R
> >> + *	gain01 = Gr
> >> + *	gain10 = Gb
> >> + *	gain11 = B
> >
> > How about naming them accordingly then ? :-)
> 
> The gainNN comes from the register field names; I've used them for everything...does doing that 
> consistently have value? Or should I rename them?

I'm OK keeping the current names.

> >> + *
> >> + * All of the gains are stored in Q4.8 format.
> >> + *
> >> + * @header:	The Mali-C55 parameters block header
> >> + * @gain00:	Multiplier for colour channel 00
> >> + * @gain01:	Multiplier for colour channel 01
> >> + * @gain10:	Multiplier for colour channel 10
> >> + * @gain11:	Multiplier for colour channel 11
> >> + */
> >> +struct mali_c55_params_awb_gains {
> >> +	struct mali_c55_params_block_header header;
> >> +	__u16 gain00;
> >> +	__u16 gain01;
> >> +	__u16 gain10;
> >> +	__u16 gain11;
> >> +};
> >> +
> >> +/**
> >> + * enum mali_c55_params_awb_tap_points - Tap points for the AWB statistics
> >> + * @MALI_C55_AWB_STATS_TAP_PF: Immediately after the Purple Fringe block
> >> + * @MALI_C55_AWB_STATS_TAP_CNR: Immediately after the CNR block
> >> + */
> >> +enum mali_c55_params_awb_tap_points {
> >> +	MALI_C55_AWB_STATS_TAP_PF = 0,
> >> +	MALI_C55_AWB_STATS_TAP_CNR,
> >> +};
> >> +
> >> +/**
> >> + * struct mali_c55_params_awb_config - Stats settings for auto-white balance
> >> + *
> >> + * This struct allows the configuration of the statistics generated for auto
> >> + * white balance. Pixel intensity limits can be set to exclude overly bright or
> >> + * dark regions of an image from the statistics entirely. Colour ratio minima
> >> + * and maxima can be set to discount pixels who's ratios fall outside the
> >> + * defined boundaries; there are two sets of registers to do this - the
> >> + * "min/max" ratios which bound a region and the "high/low" ratios which further
> >> + * trim the upper and lower ratios. For example with the boundaries configured
> >> + * as follows, only pixels whos colour ratios falls into the region marked "A"
> >> + * would be counted::
> >> + *
> >> + *	                                                          cr_high
> >> + *	    2.0 |                                                   |
> >> + *	        |               cb_max --> _________________________v_____
> >> + *	    1.8 |                         |                         \    |
> >> + *	        |                         |                          \   |
> >> + *	    1.6 |                         |                           \  |
> >> + *	        |                         |                            \ |
> >> + *	 c  1.4 |               cb_low -->|\              A             \|<--  cb_high
> >> + *	 b      |                         | \                            |
> >> + *	    1.2 |                         |  \                           |
> >> + *	 r      |                         |   \                          |
> >> + *	 a  1.0 |              cb_min --> |____\_________________________|
> >> + *	 t      |                         ^    ^                         ^
> >> + *	 i  0.8 |                         |    |                         |
> >> + *	 o      |                      cr_min  |                       cr_max
> >> + *	 s  0.6 |                              |
> >> + *	        |                             cr_low
> >> + *	    0.4 |
> >> + *	        |
> >> + *	    0.2 |
> >> + *	        |
> >> + *	    0.0 |_______________________________________________________________
> >> + *	        0.0   0.2   0.4   0.6   0.8   1.0   1.2   1.4   1.6   1.8   2.0
> >> + *	                                   cr ratios
> >> + *
> >> + * @header:		The Mali-C55 parameters block header
> >> + * @tap_point:		The tap point from enum mali_c55_params_awb_tap_points
> >> + * @stats_mode:		AWB statistics collection mode, see :c:type:`mali_c55_awb_stats_mode`
> >> + * @white_level:	Upper pixel intensity (I.E. raw pixel values) limit
> >> + * @black_level:	Lower pixel intensity (I.E. raw pixel values) limit
> >> + * @cr_max:		Maximum R/G ratio (Q4.8 format)
> >> + * @cr_min:		Minimum R/G ratio (Q4.8 format)
> >> + * @cb_max:		Maximum B/G ratio (Q4.8 format)
> >> + * @cb_min:		Minimum B/G ratio (Q4.8 format)
> >> + * @nodes_used_horiz:	Number of active zones horizontally [0..15]
> >> + * @nodes_used_vert:	Number of active zones vertically [0..15]
> >> + * @cr_high:		R/G ratio trim high (Q4.8 format)
> >> + * @cr_low:		R/G ratio trim low (Q4.8 format)
> >> + * @cb_high:		B/G ratio trim high (Q4.8 format)
> >> + * @cb_low:		B/G ratio trim low (Q4.8 format)
> >> + */
> >> +struct mali_c55_params_awb_config {
> >> +	struct mali_c55_params_block_header header;
> >> +	__u8 tap_point;
> >> +	__u8 stats_mode;
> >> +	__u16 white_level;
> >> +	__u16 black_level;
> >> +	__u16 cr_max;
> >> +	__u16 cr_min;
> >> +	__u16 cb_max;
> >> +	__u16 cb_min;
> >> +	__u8 nodes_used_horiz;
> >> +	__u8 nodes_used_vert;
> >> +	__u16 cr_high;
> >> +	__u16 cr_low;
> >> +	__u16 cb_high;
> >> +	__u16 cb_low;
> >> +};
> >> +
> >> +#define MALI_C55_NUM_MESH_SHADING_ELEMENTS 3072
> >> +
> >> +/**
> >> + * struct mali_c55_params_mesh_shading_config - Mesh shading configuration
> >> + *
> >> + * The mesh shading correction module allows programming a separate table of
> >> + * either 16x16 or 32x32 node coefficients for 3 different light sources. The
> >> + * final correction coefficients applied are computed by blending the
> >> + * coefficients from two tables together.
> >> + *
> >> + * A page of 1024 32-bit integers is associated to each colour channel, with
> >> + * pages stored consecutively in memory. Each 32-bit integer packs 3 8-bit
> >> + * correction coefficients for a single node, one for each of the three light
> >> + * sources. The 8 most significant bits are unused. The following table
> >> + * describes the layout::
> >> + *
> >> + *	+----------- Page (Colour Plane) 0 -------------+
> >> + *	| @mesh[i]  | Mesh Point | Bits  | Light Source |
> >> + *	+-----------+------------+-------+--------------+
> >> + *	|         0 |        0,0 | 16,23 | LS2          |
> >> + *	|           |            | 08-15 | LS1          |
> >> + *	|           |            | 00-07 | LS0          |
> >> + *	+-----------+------------+-------+--------------+
> >> + *	|         1 |        0,1 | 16,23 | LS2          |
> >> + *	|           |            | 08-15 | LS1          |
> >> + *	|           |            | 00-07 | LS0          |
> >> + *	+-----------+------------+-------+--------------+
> >> + *	|       ... |        ... | ...   | ...          |
> >> + *	+-----------+------------+-------+--------------+
> >> + *	|      1023 |      31,31 | 16,23 | LS2          |
> >> + *	|           |            | 08-15 | LS1          |
> >> + *	|           |            | 00-07 | LS0          |
> >> + *	+----------- Page (Colour Plane) 1 -------------+
> >> + *	| @mesh[i]  | Mesh Point | Bits  | Light Source |
> >> + *	+-----------+------------+-------+--------------+
> >> + *	|      1024 |        0,0 | 16,23 | LS2          |
> >> + *	|           |            | 08-15 | LS1          |
> >> + *	|           |            | 00-07 | LS0          |
> >> + *	+-----------+------------+-------+--------------+
> >> + *	|      1025 |        0,1 | 16,23 | LS2          |
> >> + *	|           |            | 08-15 | LS1          |
> >> + *	|           |            | 00-07 | LS0          |
> >> + *	+-----------+------------+-------+--------------+
> >> + *	|       ... |        ... | ...   | ...          |
> >> + *	+-----------+------------+-------+--------------+
> >> + *	|      2047 |      31,31 | 16,23 | LS2          |
> >> + *	|           |            | 08-15 | LS1          |
> >> + *	|           |            | 00-07 | LS0          |
> >> + *	+----------- Page (Colour Plane) 2 -------------+
> >> + *	| @mesh[i]  | Mesh Point | Bits  | Light Source |
> >> + *	+-----------+------------+-------+--------------+
> >> + *	|      2048 |        0,0 | 16,23 | LS2          |
> >> + *	|           |            | 08-15 | LS1          |
> >> + *	|           |            | 00-07 | LS0          |
> >> + *	+-----------+------------+-------+--------------+
> >> + *	|      2049 |        0,1 | 16,23 | LS2          |
> >> + *	|           |            | 08-15 | LS1          |
> >> + *	|           |            | 00-07 | LS0          |
> >> + *	+-----------+------------+-------+--------------+
> >> + *	|       ... |        ... | ...   | ...          |
> >> + *	+-----------+------------+-------+--------------+
> >> + *	|      3071 |      31,31 | 16,23 | LS2          |
> >> + *	|           |            | 08-15 | LS1          |
> >> + *	|           |            | 00-07 | LS0          |
> >> + *	+-----------+------------+-------+--------------+
> >> + *
> >> + * The @mesh_scale member determines the precision and minimum and maximum gain.
> >> + * For example if @mesh_scale is 0 and therefore selects 0 - 2x gain, a value of
> >> + * 0 in a coefficient means 0.0 gain, a value of 128 means 1.0 gain and 255
> >> + * means 2.0 gain.
> >> + *
> >> + * @header:		The Mali-C55 parameters block header
> >> + * @mesh_show:		Output the mesh data rather than image data
> >> + * @mesh_scale:		Set the precision and maximum gain range of mesh shading
> >> + *				- 0 = 0-2x gain
> >> + *				- 1 = 0-4x gain
> >> + *				- 2 = 0-8x gain
> >> + *				- 3 = 0-16x gain
> >> + *				- 4 = 1-2x gain
> >> + *				- 5 = 1-3x gain
> >> + *				- 6 = 1-5x gain
> >> + *				- 7 = 1-9x gain
> >> + * @mesh_page_r:	Mesh page select for red colour plane [0..2]
> >> + * @mesh_page_g:	Mesh page select for green colour plane [0..2]
> >> + * @mesh_page_b:	Mesh page select for blue colour plane [0..2]
> >> + * @mesh_width:		Number of horizontal nodes minus 1 [15,31]
> >> + * @mesh_height:	Number of vertical nodes minus 1 [15,31]
> >> + * @mesh:		Mesh shading correction tables
> >> + */
> >> +struct mali_c55_params_mesh_shading_config {
> >> +	struct mali_c55_params_block_header header;
> >> +	bool mesh_show;
> >> +	__u8 mesh_scale;
> >> +	__u8 mesh_page_r;
> >> +	__u8 mesh_page_g;
> >> +	__u8 mesh_page_b;
> >> +	__u8 mesh_width;
> >> +	__u8 mesh_height;
> >> +	__u32 mesh[MALI_C55_NUM_MESH_SHADING_ELEMENTS];
> >> +};
> >> +
> >> +/** enum mali_c55_params_mesh_alpha_bank - Mesh shading table bank selection
> >> + * @MALI_C55_MESH_ALPHA_BANK_LS0_AND_LS1 - Select Light Sources 0 and 1
> >> + * @MALI_C55_MESH_ALPHA_BANK_LS1_AND_LS2 - Select Light Sources 1 and 2
> >> + * @MALI_C55_MESH_ALPHA_BANK_LS0_AND_LS2 - Select Light Sources 0 and 2
> >> + */
> >> +enum mali_c55_params_mesh_alpha_bank {
> >> +	MALI_C55_MESH_ALPHA_BANK_LS0_AND_LS1 = 0,
> >> +	MALI_C55_MESH_ALPHA_BANK_LS1_AND_LS2 = 1,
> >> +	MALI_C55_MESH_ALPHA_BANK_LS0_AND_LS2 = 4
> >> +};
> >> +
> >> +/**
> >> + * struct mali_c55_params_mesh_shading_selection - Mesh table selection
> >> + *
> >> + * The module computes the final correction coefficients by blending the ones
> >> + * from two light source tables, which are selected (independently for each
> >> + * colour channel) by the @mesh_alpha_bank_r/g/b fields.
> >> + *
> >> + * The final blended coefficients for each node are calculated using the
> >> + * following equation:
> >> + *
> >> + *     Final coefficient = (a x LS\ :sub:`b`\ + (256 - a) x LS\ :sub:`a`\) / 256
> >> + *
> >> + * Where a is the @mesh_alpha_r/g/b value, and LS\ :sub:`a`\ and LS\ :sub:`b`\
> >> + * are the node cofficients for the two tables selected by the
> >> + * @mesh_alpha_bank_r/g/b value.
> >> + *
> >> + * The scale of the applied correction may also be controlled by tuning the
> >> + * @mesh_strength member. This is a modifier to the final coefficients which can
> >> + * be used to globally reduce the gains applied.
> >> + *
> >> + * @header:		The Mali-C55 parameters block header
> >> + * @mesh_alpha_bank_r:	Red mesh table select (c:type:`enum mali_c55_params_mesh_alpha_bank`)
> >> + * @mesh_alpha_bank_g:	Green mesh table select (c:type:`enum mali_c55_params_mesh_alpha_bank`)
> >> + * @mesh_alpha_bank_b:	Blue mesh table select (c:type:`enum mali_c55_params_mesh_alpha_bank`)
> >> + * @mesh_alpha_r:	Blend coefficient for R [0..255]
> >> + * @mesh_alpha_g:	Blend coefficient for G [0..255]
> >> + * @mesh_alpha_b:	Blend coefficient for B [0..255]
> >> + * @mesh_strength:	Mesh strength in Q4.12 format [0..4096]
> >> + */
> >> +struct mali_c55_params_mesh_shading_selection {
> >> +	struct mali_c55_params_block_header header;
> >> +	__u8 mesh_alpha_bank_r;
> >> +	__u8 mesh_alpha_bank_g;
> >> +	__u8 mesh_alpha_bank_b;
> >> +	__u8 mesh_alpha_r;
> >> +	__u8 mesh_alpha_g;
> >> +	__u8 mesh_alpha_b;
> >> +	__u16 mesh_strength;
> >> +};
> >> +
> >> +/**
> >> + * define MALI_C55_PARAMS_MAX_SIZE - Maximum size of all Mali C55 Parameters
> >> + *
> >> + * Though the parameters for the Mali-C55 are passed as optional blocks, the
> >> + * driver still needs to know the absolute maximum size so that it can allocate
> >> + * a buffer sized appropriately to accomodate userspace attempting to set all
> >> + * possible parameters in a single frame.
> >> + */
> >> +#define MALI_C55_PARAMS_MAX_SIZE				\
> >> +	sizeof(struct mali_c55_params_sensor_off_preshading) + 	\
> >> +	sizeof(struct mali_c55_params_aexp_hist) +		\
> >> +	sizeof(struct mali_c55_params_aexp_weights) +		\
> >> +	sizeof(struct mali_c55_params_aexp_hist) +		\
> >> +	sizeof(struct mali_c55_params_aexp_weights) +		\
> >> +	sizeof(struct mali_c55_params_digital_gain) +		\
> >> +	sizeof(struct mali_c55_params_awb_gains) +		\
> >> +	sizeof(struct mali_c55_params_awb_config) +		\
> >> +	sizeof(struct mali_c55_params_awb_gains) +		\
> >
> > Some data structures are duplicated, please explain why somewhere, or it
> > may appear to be a bug.
> 
> I'll add an explanatory comment
> 
> >> +	sizeof(struct mali_c55_params_mesh_shading_config) +	\
> >> +	sizeof(struct mali_c55_params_mesh_shading_selection)
> >
> > I think this will work fine now, but as soon as you add a block that
> > contains a 64-bit field, you'll have issues. Many CPUs expect 64-bit
> > accesses to be aligned. If some structures have a size that are not
> > multiples of 64-bit, you'll end up having unaligned blocks.
> >
> > I would recommend aligning the size of each data structure to 64 bits. A
> > simple way to do so would be to align the size of the header to 64 bits.
> > Please test the result to make sure I'm right though :-)
> >
> >> +
> >> +/**
> >> + * struct mali_c55_params_buffer - 3A configuration parameters
> >> + *
> >> + * This struct contains the configuration parameters of the Mali-C55 ISP
> >> + * algorithms, serialized by userspace into an opaque data buffer. Each
> >
> > It's not opaque, you've documented it fully :-)
> >
> > s/opaque //
> 
> Yeah wrong word...I can't think of a better one - I'll just remove it.
> 
> >> + * configuration parameter block is represented by a block-specific structure
> >> + * which contains a :c:type:`mali_c55_params_block_header` entry as first
> >> + * member. Userspace populates the @data buffer with configuration parameters
> >> + * for the blocks that it intends to configure. As a consequence, the data
> >> + * buffer effective size changes according to the number of ISP blocks that
> >> + * userspace intends to configure.
> >> + *
> >> + * The parameters buffer is versioned by the @version field to allow modifying
> >> + * and extending its definition. Userspace should populate the @version field to
> >
> > s/should/shall/
> >
> >> + * inform the driver about the version it intends to use. The driver will parse
> >> + * and handle the @data buffer according to the data layout specific to the
> >> + * indicated revision and return an error if the desired revision is not
> >
> > s/revision/version/g
> >
> >> + * supported.
> >> + *
> >> + * For each ISP block that userspace wants to configure, a block-specific
> >> + * structure is appended to the @data buffer, one after the other without gaps
> >> + * in between nor overlaps. Userspace shall populate the @total_size field with
> >> + * the effective size, in bytes, of the @data buffer.
> >> + *
> >> + * The expected memory layout of the parameters buffer is::
> >> + *
> >> + *	+-------------------- struct mali_c55_params_buffer ------------------+
> >> + *	| version = MALI_C55_PARAM_BUFFER_V0;                                 |
> >> + *	| total_size = sizeof(struct mali_c55_params_sensor_off_preshading)   |
> >> + *	|              sizeof(struct mali_c55_params_aexp_hist);              |
> >> + *	| +------------------------- data  ---------------------------------+ |
> >> + *	| | +--------- struct mali_c55_params_sensor_off_preshading ------+ | |
> >> + *	| | | +-------- struct mali_c55_params_block_header header -----+ | | |
> >> + *	| | | | type = MALI_C55_PARAM_BLOCK_SENSOR_OFFS;                | | | |
> >> + *	| | | | enabled = 1;                                            | | | |
> >> + *	| | | | size =                                                  | | | |
> >> + *	| | | |    sizeof(struct mali_c55_params_sensor_off_preshading);| | | |
> >> + *	| | | +---------------------------------------------------------+ | | |
> >> + *	| | | chan00 = ...;                                               | | |
> >> + *	| | | chan01 = ...;                                               | | |
> >> + *	| | | chan10 = ...;                                               | | |
> >> + *	| | | chan11 = ...;                                               | | |
> >> + *	| | +------------ struct mali_c55_params_aexp_hist ---------------+ | |
> >> + *	| | | +-------- struct mali_c55_params_block_header header -----+ | | |
> >> + *	| | | | type = MALI_C55_PARAM_BLOCK_AEXP_HIST;                  | | | |
> >> + *	| | | | enabled = 1;                                            | | | |
> >> + *	| | | | size = sizeof(struct mali_c55_params_aexp_hist);        | | | |
> >> + *	| | | +---------------------------------------------------------+ | | |
> >> + *	| | | skip_x = ...;                                               | | |
> >> + *	| | | offset_x = ...;                                             | | |
> >> + *	| | | skip_y = ...;                                               | | |
> >> + *	| | | offset_y = ...;                                             | | |
> >> + *	| | | scale_bottom = ...;                                         | | |
> >> + *	| | | scale_top = ...;                                            | | |
> >> + *	| | | plane_mode = ...;                                           | | |
> >> + *	| | | tap_point = ...;                                            | | |
> >> + *	| | +-------------------------------------------------------------+ | |
> >> + *	| +-----------------------------------------------------------------+ |
> >> + *	+---------------------------------------------------------------------+
> >> + *
> >> + * @version: The Mali-C55 parameters buffer version
> >> + * @total_size: The Mali-C55 configuration data effective size, excluding this
> >> + *		header
> >> + * @data: The Mali-C55 configuration blocks data
> >> + */
> >> +struct mali_c55_params_buffer {
> >> +	enum mali_c55_param_buffer_version version;
> >> +	size_t total_size;
> >> +	__u8 data[MALI_C55_PARAMS_MAX_SIZE];
> >> +};
> >> +
> >>   #endif /* __UAPI_MALI_C55_CONFIG_H */

-- 
Regards,

Laurent Pinchart

