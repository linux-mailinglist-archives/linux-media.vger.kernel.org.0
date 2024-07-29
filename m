Return-Path: <linux-media+bounces-15439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A14EC93F336
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 12:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 095F61F2273B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 10:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35289144D03;
	Mon, 29 Jul 2024 10:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wd91zrUu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03421448F1;
	Mon, 29 Jul 2024 10:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722250313; cv=none; b=dv9Kh5kT9I6rP58SxYluYIlIW3MbjxS9wHJJI3gnjILLLaVc+0KxOxWXYB7LJBEgXhmergt4GtxYMlOsN22nt0n8l/BgwU7Sa80gev5XK+sEaQ6nTlXDdY0mnGJ8GKnz+1mVqq1JVMv53hMzMqPqUiY9Hg9EVisGswWGE2VGLDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722250313; c=relaxed/simple;
	bh=uBt5in8jOIBoU2O0TL2DdejZ/gMrFSox1zF/AkAt0t8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=daXnTIUTsY0tDpcrOej1d1RO+YWWk0iQwzTD7wZ3w3YsQaChTldY+u+JI+eFQefUY7gzVNQ+kc08WFQYMxtayJGfgrp1pS8DWep0NsfPzcJRviNl6U1DuT0FsC866q7licv5UZ16LjwFaNm6rSQwwhYCGpoq3GLsacdt+8qkbZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wd91zrUu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE6BF45A;
	Mon, 29 Jul 2024 12:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722250261;
	bh=uBt5in8jOIBoU2O0TL2DdejZ/gMrFSox1zF/AkAt0t8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wd91zrUuI9ApEci7pQehZVOVrN4IYX28tt1rg0zx9FycmHXa37ZLrHBMhSbfRUh6K
	 O3fqhGpWgds0n/YpVaiRoX0b9W0VLrSraI8ADxwB7Ral+XYsMszsiQt3rv4i/lq6j8
	 W54tJoHvkipx32qfB9ieU+BquuLiL0D4Paa4WSyE=
Message-ID: <f523d984-b83e-49af-bddc-18720dc6f6cf@ideasonboard.com>
Date: Mon, 29 Jul 2024 11:51:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/18] media: uapi: Add parameters structs to
 mali-c55-config.h
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jacopo.mondi@ideasonboard.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 sakari.ailus@iki.fi
References: <20240709132906.3198927-1-dan.scally@ideasonboard.com>
 <20240709132906.3198927-17-dan.scally@ideasonboard.com>
 <20240722234849.GD32300@pendragon.ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20240722234849.GD32300@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Laurent - thanks for the review

On 23/07/2024 00:48, Laurent Pinchart wrote:
> Hi Dan,
>
> Thank you for the patch.
>
> On Tue, Jul 09, 2024 at 02:29:04PM +0100, Daniel Scally wrote:
>> Add structures describing the ISP parameters to mali-c55-config.h
>>
>> Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
>> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>> Changes in v6:
>>
>> 	- Flagged which struct goes with which enum value from
>> 	  enum mali_c55_param_block_type
>> 	- Used only types with well defined sizes in the structs
>> 	- Expanded the documentation for skipping in the AEXP histogram config
>> 	- Aligned the header struct to 64 bits
>> 	- Added a new union type to hold pointers to the parameter structs
>>
>> Changes in v5:
>>
>> 	- New patch
>>
>>   .../uapi/linux/media/arm/mali-c55-config.h    | 763 ++++++++++++++++++
>>   1 file changed, 763 insertions(+)
>>
>> diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
>> index 21b453bdee5d..ea9872e9076f 100644
>> --- a/include/uapi/linux/media/arm/mali-c55-config.h
>> +++ b/include/uapi/linux/media/arm/mali-c55-config.h
>> @@ -179,4 +179,767 @@ struct mali_c55_stats_buffer {
>>   	__u32 reserved3[15];
>>   } __attribute__((packed));
>>   
>> +/**
>> + * enum mali_c55_param_buffer_version - Mali-C55 parameters block versioning
>> + *
>> + * @MALI_C55_PARAM_BUFFER_V1: First version of Mali-C55 parameters block
>> + */
>> +enum mali_c55_param_buffer_version {
>> +	MALI_C55_PARAM_BUFFER_V1,
>> +};
>> +
>> +/**
>> + * enum mali_c55_param_block_type - Enumeration of Mali-C55 parameter blocks
>> + *
>> + * This enumeration defines the types of Mali-C55 parameters block. Each block
>> + * configures a specific processing block of the Mali-C55 ISP. The block
>> + * type allows the driver to correctly interpret the parameters block data.
>> + *
>> + * It is the responsibility of userspace to correctly set the type of each
>> + * parameters block.
>> + *
>> + * @MALI_C55_PARAM_BLOCK_SENSOR_OFFS: Sensor pre-shading black level offset
>> + * @MALI_C55_PARAM_BLOCK_AEXP_HIST: Auto-exposure 1024-bin histogram
>> + *				    configuration
>> + * @MALI_C55_PARAM_BLOCK_AEXP_IHIST: Post-Iridix auto-exposure 1024-bin
>> + *				     histogram configuration
>> + * @MALI_C55_PARAM_BLOCK_AEXP_HIST_WEIGHTS: Auto-exposure 1024-bin histogram
>> + *					    weighting
>> + * @MALI_C55_PARAM_BLOCK_AEXP_IHIST_WEIGHTS: Post-Iridix auto-exposure 1024-bin
>> + *					     histogram weighting
>> + * @MALI_C55_PARAM_BLOCK_DIGITAL_GAIN: Digital gain
>> + * @MALI_C55_PARAM_BLOCK_AWB_GAINS: Auto-white balance gains
>> + * @MALI_C55_PARAM_BLOCK_AWB_CONFIG: Auto-white balance statistics config
>> + * @MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP: Auto-white balance gains for AEXP-0 tap
>> + * @MALI_C55_PARAM_MESH_SHADING_CONFIG : Mesh shading tables configuration
>> + * @MALI_C55_PARAM_MESH_SHADING_SELECTION: Mesh shading table selection
>> + * @MALI_C55_PARAM_BLOCK_SENTINEL: First non-valid block index
> The sentinel value will change when adding new types. That may affect
> userspace. We managed to get rid of the sentinel in the rkisp1 driver,
> it would be nice to do the same here.


Ack - I'm sure it'll be possible.

>
>> + */
>> +enum mali_c55_param_block_type {
>> +	MALI_C55_PARAM_BLOCK_SENSOR_OFFS,
>> +	MALI_C55_PARAM_BLOCK_AEXP_HIST,
>> +	MALI_C55_PARAM_BLOCK_AEXP_IHIST,
>> +	MALI_C55_PARAM_BLOCK_AEXP_HIST_WEIGHTS,
>> +	MALI_C55_PARAM_BLOCK_AEXP_IHIST_WEIGHTS,
>> +	MALI_C55_PARAM_BLOCK_DIGITAL_GAIN,
>> +	MALI_C55_PARAM_BLOCK_AWB_GAINS,
>> +	MALI_C55_PARAM_BLOCK_AWB_CONFIG,
>> +	MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP,
>> +	MALI_C55_PARAM_MESH_SHADING_CONFIG,
>> +	MALI_C55_PARAM_MESH_SHADING_SELECTION,
>> +	MALI_C55_PARAM_BLOCK_SENTINEL,
>> +};
>> +
>> +/**
>> + * struct mali_c55_params_block_header - Mali-C55 parameter block header
>> + *
>> + * This structure represents the common part of all the ISP configuration
>> + * blocks. Each parameters block embeds an instance of this structure type
>> + * as its first member, followed by the block-specific configuration data. The
>> + * driver inspects this common header to discern the block type and its size and
>> + * properly handle the block content by casting it to the correct block-specific
>> + * type.
>> + *
>> + * The @type field is one of the values enumerated by
>> + * :c:type:`mali_c55_param_block_type` and specifies how the data should be
>> + * interpreted by the driver. The @size field specifies the size of the
>> + * parameters block and is used by the driver for validation purposes. The
>> + * @enabled field specifies if the ISP block should be enabled (and configured
>> + * according to the provided parameters) or disabled.
>> + *
>> + * Userspace is responsible for correctly populating the parameters block header
>> + * fields (@type, @enabled and @size) and correctly populate the block-specific
>> + * parameters.
>> + *
>> + * For example:
>> + *
>> + * .. code-block:: c
>> + *
>> + *	void populate_sensor_offs(struct mali_c55_params_block_header *block) {
>> + *		block->type = MALI_C55_PARAM_BLOCK_SENSOR_OFFS;
>> + *		block->enabled = true;
>> + *		block->size = sizeof(struct mali_c55_params_sensor_off_preshading);
>> + *
>> + *		struct mali_c55_params_sensor_off_preshading *sensor_offs =
>> + *			(struct mali_c55_params_sensor_off_preshading *)block;
>> + *
>> + *		sensor_offs->chan00 = offset00;
>> + *		sensor_offs->chan01 = offset01;
>> + *		sensor_offs->chan10 = offset10;
>> + *		sensor_offs->chan11 = offset11;
>> + *	}
>> + *
>> + * @type: The parameters block type from :c:type:`mali_c55_param_block_type`
>> + * @enabled: Block enabled/disabled flag
>> + * @size: Size (in bytes) of the parameters block
>> + */
>> +struct mali_c55_params_block_header {
>> +	__u8 type;
>> +	__u8 enabled;
>> +	__u32 size;
>> +} __attribute__((aligned(8)));
>> +
>> +/**
>> + * struct mali_c55_params_sensor_off_preshading - offset subtraction for each
>> + *						  color channel
>> + *
>> + * Provides removal of the sensor black level from the sensor data. Separate
>> + * offsets are provided for each of the four Bayer component color channels
>> + * which are defaulted to R, Gr, Gb, B.
>> + *
>> + * header.type should be set to MALI_C55_PARAM_BLOCK_SENSOR_OFFS from
>> + * :c:type:`mali_c55_param_block_type` for this block.
>> + *
>> + * @header: The Mali-C55 parameters block header
>> + * @chan00: Offset for color channel 00 (default: R)
>> + * @chan01: Offset for color channel 01 (default: Gr)
>> + * @chan10: Offset for color channel 10 (default: Gb)
>> + * @chan11: Offset for color channel 11 (default: B)
>> + */
>> +struct mali_c55_params_sensor_off_preshading {
>> +	struct mali_c55_params_block_header header;
>> +	__u32 chan00;
>> +	__u32 chan01;
>> +	__u32 chan10;
>> +	__u32 chan11;
>> +};
>> +
>> +/**
>> + * enum mali_c55_aexp_hist_tap_points - Tap points for the AEXP histogram
>> + * @MALI_C55_AEXP_HIST_TAP_WB: After static white balance
>> + * @MALI_C55_AEXP_HIST_TAP_FS: After WDR Frame Stitch
>> + * @MALI_C55_AEXP_HIST_TAP_TPG: After the test pattern generator
>> + */
>> +enum mali_c55_aexp_hist_tap_points {
>> +	MALI_C55_AEXP_HIST_TAP_WB = 0,
>> +	MALI_C55_AEXP_HIST_TAP_FS,
>> +	MALI_C55_AEXP_HIST_TAP_TPG,
>> +};
>> +
>> +/**
>> + * enum mali_c55_aexp_skip_x - Horizontal pixel skipping
>> + * @MALI_C55_AEXP_SKIP_X_EVERY_2ND: Collect every 2nd pixel horizontally
>> + * @MALI_C55_AEXP_SKIP_X_EVERY_3RD: Collect every 3rd pixel horizontally
>> + * @MALI_C55_AEXP_SKIP_X_EVERY_4TH: Collect every 4th pixel horizontally
>> + * @MALI_C55_AEXP_SKIP_X_EVERY_5TH: Collect every 5th pixel horizontally
>> + * @MALI_C55_AEXP_SKIP_X_EVERY_8TH: Collect every 8th pixel horizontally
>> + * @MALI_C55_AEXP_SKIP_X_EVERY_9TH: Collect every 9th pixel horizontally
>> + */
>> +enum mali_c55_aexp_skip_x {
>> +	MALI_C55_AEXP_SKIP_X_EVERY_2ND,
>> +	MALI_C55_AEXP_SKIP_X_EVERY_3RD,
>> +	MALI_C55_AEXP_SKIP_X_EVERY_4TH,
>> +	MALI_C55_AEXP_SKIP_X_EVERY_5TH,
>> +	MALI_C55_AEXP_SKIP_X_EVERY_8TH,
>> +	MALI_C55_AEXP_SKIP_X_EVERY_9TH
>> +};
>> +
>> +/**
>> + * enum mali_c55_aexp_skip_y - Vertical pixel skipping
>> + * @MALI_C55_AEXP_SKIP_Y_ALL: Collect every single pixel vertically
>> + * @MALI_C55_AEXP_SKIP_Y_EVERY_2ND: Collect every 2nd pixel vertically
>> + * @MALI_C55_AEXP_SKIP_Y_EVERY_3RD: Collect every 3rd pixel vertically
>> + * @MALI_C55_AEXP_SKIP_Y_EVERY_4TH: Collect every 4th pixel vertically
>> + * @MALI_C55_AEXP_SKIP_Y_EVERY_5TH: Collect every 5th pixel vertically
>> + * @MALI_C55_AEXP_SKIP_Y_EVERY_8TH: Collect every 8th pixel vertically
>> + * @MALI_C55_AEXP_SKIP_Y_EVERY_9TH: Collect every 9th pixel vertically
>> + */
>> +enum mali_c55_aexp_skip_y {
>> +	MALI_C55_AEXP_SKIP_Y_ALL,
>> +	MALI_C55_AEXP_SKIP_Y_EVERY_2ND,
>> +	MALI_C55_AEXP_SKIP_Y_EVERY_3RD,
>> +	MALI_C55_AEXP_SKIP_Y_EVERY_4TH,
>> +	MALI_C55_AEXP_SKIP_Y_EVERY_5TH,
>> +	MALI_C55_AEXP_SKIP_Y_EVERY_8TH,
>> +	MALI_C55_AEXP_SKIP_Y_EVERY_9TH
>> +};
>> +
>> +/**
>> + * enum mali_c55_aexp_row_column_offset - Start from the first or second row or
>> + *					  column
>> + * @MALI_C55_AEXP_FIRST_ROW_OR_COL:	Start from the first row / column
>> + * @MALI_C55_AEXP_SECOND_ROW_OR_COL:	Start from the second row / column
>> + */
>> +enum mali_c55_aexp_row_column_offset {
>> +	MALI_C55_AEXP_FIRST_ROW_OR_COL = 1,
>> +	MALI_C55_AEXP_SECOND_ROW_OR_COL = 2,
>> +};
>> +
>> +/**
>> + * enum mali_c55_aexp_hist_plane_mode - Mode for the AEXP Histograms
>> + * @MALI_C55_AEXP_HIST_COMBINED: All color planes in one 1024-bin histogram
>> + * @MALI_C55_AEXP_HIST_SEPARATE: Each color plane in one 256-bin histogram with a bin width of 16
>> + * @MALI_C55_AEXP_HIST_FOCUS_00: Top left plane in the first bank, rest in second bank
>> + * @MALI_C55_AEXP_HIST_FOCUS_01: Top right plane in the first bank, rest in second bank
>> + * @MALI_C55_AEXP_HIST_FOCUS_10: Bottom left plane in the first bank, rest in second bank
>> + * @MALI_C55_AEXP_HIST_FOCUS_11: Bottom right plane in the first bank, rest in second bank
>> + *
>> + * In the "focus" modes statistics are collected into two 512-bin histograms
>> + * with a bin width of 8. One colour plane is in the first histogram with the
>> + * remainder combined into the second. The four options represent which of the
>> + * four positions in a bayer pattern are the focused plane.
>> + */
>> +enum mali_c55_aexp_hist_plane_mode {
>> +	MALI_C55_AEXP_HIST_COMBINED = 0,
>> +	MALI_C55_AEXP_HIST_SEPARATE = 1,
>> +	MALI_C55_AEXP_HIST_FOCUS_00 = 4,
>> +	MALI_C55_AEXP_HIST_FOCUS_01 = 5,
>> +	MALI_C55_AEXP_HIST_FOCUS_10 = 6,
>> +	MALI_C55_AEXP_HIST_FOCUS_11 = 7,
>> +};
>> +
>> +/**
>> + * struct mali_c55_params_aexp_hist - configuration for AEXP metering hists
>> + *
>> + * This struct allows users to configure the 1024-bin AEXP histograms. Broadly
>> + * speaking the parameters allow you to mask particular regions of the image and
>> + * to select different kinds of histogram.
>> + *
>> + * The skip_x, offset_x, skip_y and offset_y fields allow users to ignore or
>> + * mask pixels in the frame by their position relative to the top left pixel.
>> + * First, the skip_y, offset_x and offset_y fields define a 2x2 pixel pattern of
>> + * which pixels covered by the pattern will be counted in the statistics.
> I have a really hard time parsing the second sentence. Let me try to
> rephrase it.
>
>   * First, the skip_y, offset_x and offset_y fields define which pixels will be
>   * counted in the statistics within a 2x2 pixels region.
>
> Is that what you meant ?


Yes, although I feel it's a bit iffy...perhaps "...which of the pixels within each 2x2 region will 
be counted in the statistics"?

>
>> + *
>> + * If skip_y == 0 then two pixels from each coveredregion will be counted. If
> s/coveredregion/region/
>
>> + * both offset_x and offset_y are zero, then the two left-most pixels in each
>> + * 2x2 pixel region covered by the pattern will be counted. Setting offset_x = 1
> I'd drop "covered by the pattern" as I'm not sure what that means.
OK, I think it reads fine that way.
>
>> + * will discount the top left pixel and count the top right pixel. Setting
>> + * offset_y = 1 will discount the bottom left pixel and count the bottom right
>> + * pixel.
> That sounds strange, I would have expected offset_y to control something
> vertically, not control the horizontal position on the second line. If
> that's how the hardware operates, why not.
Yes it is strange, but that's what the documentation says.
>
>> + *
>> + * If skip_y != 0 then only a single pixel from each region covered by the
>> + * pattern will be counted. In this case offset_x controls whether the pixel
>> + * that's counted is in the left (if offset_x == 0) or right (if offset_x == 1)
>> + * column and offset_y controls whether the pixel that's counted is in the top
>> + * (if offset_y == 0) or bottom (if offset_y == 1) row.
>> + *
>> + * The skip_x and skip_y fields control how the pixel masking pattern is
>> + * repeated across the image data. The first instance of the pattern is always
> And here maybe "control how the 2x2 pixel region is repeated ...".
> s/pattern/region/ in the rest.
Okedokey
>
> This is otherwise a great explanation, thank you.
Thanks!
>> + * in the top left of the image data. The skip_x field controls how many pixels
>> + * are ignored in the x direction before the pixel masking pattern is repeated.
>> + * The skip_y field controls how many pixels are ignored in the y direction
>> + * before the pixel masking pattern is repeated.
>> + *
>> + * These fields can be used to reduce the number of pixels counted for the
>> + * statistics, but it's important to be careful to configure them correctly.
>> + * Some combinations of values will result in colour components from the input
>> + * data being ignored entirely, for example in the following configuration:
>> + *
>> + * skip_x = 0
>> + * offset_x = 0
>> + * skip_y = 0
>> + * offset_y = 0
>> + *
>> + * Only the R and Gb components of RGGB data that was input would be collected.
>> + * Similarly in the following configuration:
>> + *
>> + * skip_x = 0
>> + * offset_x = 0
>> + * skip_y = 1
>> + * offset_y = 1
>> + *
>> + * Only the Gb component of RGGB data that was input would be collected. To
>> + * correct things such that all 4 colour components were included it would be
>> + * necessary to set the skip_x and skip_y fields in a way that resulted in all
>> + * four colour components being collected:
>> + *
>> + * skip_x = 1
>> + * offset_x = 0
>> + * skip_y = 1
>> + * offset_y = 1
>> + *
>> + * header.type should be set to one of either MALI_C55_PARAM_BLOCK_AEXP_HIST or
>> + * MALI_C55_PARAM_BLOCK_AEXP_IHIST from :c:type:`mali_c55_param_block_type`.
>> + *
>> + * @header:		The Mali-C55 parameters block header
>> + * @skip_x:		Horizontal decimation. See enum mali_c55_aexp_skip_x
>> + * @offset_x:		Skip the first column, or not. See enum mali_c55_aexp_row_column_offset
>> + * @skip_y:		Vertical decimation. See enum mali_c55_aexp_skip_y
>> + * @offset_y:		Skip the first row, or not. See enum mali_c55_aexp_row_column_offset
>> + * @scale_bottom:	Scale pixels in bottom half of intensity range: 0=1x ,1=2x, 2=4x, 4=8x, 4=16x
>> + * @scale_top:		scale pixels in top half of intensity range: 0=1x ,1=2x, 2=4x, 4=8x, 4=16x
>> + * @plane_mode:		Plane separation mode. See enum mali_c55_aexp_hist_plane_mode
>> + * @tap_point:		Tap point for histogram from enum mali_c55_aexp_hist_tap_points.
>> + *			This parameter is unused for the post-Iridix Histogram
>> + */
>> +struct mali_c55_params_aexp_hist {
>> +	struct mali_c55_params_block_header header;
>> +	__u8 skip_x;
>> +	__u8 offset_x;
>> +	__u8 skip_y;
>> +	__u8 offset_y;
>> +	__u8 scale_bottom;
>> +	__u8 scale_top;
>> +	__u8 plane_mode;
>> +	__u8 tap_point;
>> +};
>> +
>> +/**
>> + * struct mali_c55_params_aexp_weights - Array of weights for AEXP metering
>> + *
>> + * This struct allows users to configure the weighting for both of the 1024-bin
>> + * AEXP histograms. The pixel data collected for each zone is multiplied by the
>> + * corresponding weight from this array, which may be zero if the intention is
>> + * to mask off the zone entirely.
>> + *
>> + * header.type should be set to one of either MALI_C55_PARAM_BLOCK_AEXP_HIST_WEIGHTS
>> + * or MALI_C55_PARAM_BLOCK_AEXP_IHIST_WEIGHTS from :c:type:`mali_c55_param_block_type`.
>> + *
>> + * @header:		The Mali-C55 parameters block header
>> + * @nodes_used_horiz:	Number of active zones horizontally [0..15]
>> + * @nodes_used_vert:	Number of active zones vertically [0..15]
>> + * @zone_weights:	Zone weighting. Index is row*col where 0,0 is the top
>> + *			left zone continuing in raster order. Each zone can be
>> + *			weighted in the range [0..15]. The number of rows and
>> + *			columns is defined by @nodes_used_vert and
>> + *			@nodes_used_horiz
>> + */
>> +struct mali_c55_params_aexp_weights {
>> +	struct mali_c55_params_block_header header;
>> +	__u8 nodes_used_horiz;
>> +	__u8 nodes_used_vert;
>> +	__u8 zone_weights[MALI_C55_MAX_ZONES];
>> +};
>> +
>> +/**
>> + * struct mali_c55_params_digital_gain - Digital gain value
>> + *
>> + * This struct carries a digital gain value to set in the ISP.
>> + *
>> + * header.type should be set to MALI_C55_PARAM_BLOCK_DIGITAL_GAIN from
>> + * :c:type:`mali_c55_param_block_type` for this block.
>> + *
>> + * @header:	The Mali-C55 parameters block header
>> + * @gain:	The digital gain value to apply, in Q5.8 format.
>> + */
>> +struct mali_c55_params_digital_gain {
>> +	struct mali_c55_params_block_header header;
>> +	__u16 gain;
>> +};
>> +
>> +/**
>> + * enum mali_c55_awb_stats_mode - Statistics mode for AWB
>> + * @MALI_C55_AWB_MODE_GRBR: Statistics collected as Green/Red and Blue/Red ratios
>> + * @MALI_C55_AWB_MODE_RGBG: Statistics collected as Red/Green and Blue/Green ratios
>> + */
>> +enum mali_c55_awb_stats_mode {
>> +	MALI_C55_AWB_MODE_GRBR = 0,
>> +	MALI_C55_AWB_MODE_RGBG,
>> +};
>> +
>> +/**
>> + * struct mali_c55_params_awb_gains - Gain settings for auto white balance
>> + *
>> + * This struct allows users to configure the gains for auto-white balance. There
>> + * are four gain settings corresponding to each colour channel in the bayer
>> + * domain. Although named generically, the association between the gain applied
>> + * and the colour channel is done automatically within the ISP depending on the
>> + * input format, and so the following mapping always holds true::
>> + *
>> + *	gain00 = R
>> + *	gain01 = Gr
>> + *	gain10 = Gb
>> + *	gain11 = B
>> + *
>> + * All of the gains are stored in Q4.8 format.
>> + *
>> + * header.type should be set to one of either MALI_C55_PARAM_BLOCK_AWB_GAINS or
>> + * MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP from :c:type:`mali_c55_param_block_type`.
>> + *
>> + * @header:	The Mali-C55 parameters block header
>> + * @gain00:	Multiplier for colour channel 00
>> + * @gain01:	Multiplier for colour channel 01
>> + * @gain10:	Multiplier for colour channel 10
>> + * @gain11:	Multiplier for colour channel 11
>> + */
>> +struct mali_c55_params_awb_gains {
>> +	struct mali_c55_params_block_header header;
>> +	__u16 gain00;
>> +	__u16 gain01;
>> +	__u16 gain10;
>> +	__u16 gain11;
>> +};
>> +
>> +/**
>> + * enum mali_c55_params_awb_tap_points - Tap points for the AWB statistics
>> + * @MALI_C55_AWB_STATS_TAP_PF: Immediately after the Purple Fringe block
>> + * @MALI_C55_AWB_STATS_TAP_CNR: Immediately after the CNR block
>> + */
>> +enum mali_c55_params_awb_tap_points {
>> +	MALI_C55_AWB_STATS_TAP_PF = 0,
>> +	MALI_C55_AWB_STATS_TAP_CNR,
>> +};
>> +
>> +/**
>> + * struct mali_c55_params_awb_config - Stats settings for auto-white balance
>> + *
>> + * This struct allows the configuration of the statistics generated for auto
>> + * white balance. Pixel intensity limits can be set to exclude overly bright or
>> + * dark regions of an image from the statistics entirely. Colour ratio minima
>> + * and maxima can be set to discount pixels who's ratios fall outside the
>> + * defined boundaries; there are two sets of registers to do this - the
>> + * "min/max" ratios which bound a region and the "high/low" ratios which further
>> + * trim the upper and lower ratios. For example with the boundaries configured
>> + * as follows, only pixels whos colour ratios falls into the region marked "A"
>> + * would be counted::
>> + *
>> + *	                                                          cr_high
>> + *	    2.0 |                                                   |
>> + *	        |               cb_max --> _________________________v_____
>> + *	    1.8 |                         |                         \    |
>> + *	        |                         |                          \   |
>> + *	    1.6 |                         |                           \  |
>> + *	        |                         |                            \ |
>> + *	 c  1.4 |               cb_low -->|\              A             \|<--  cb_high
>> + *	 b      |                         | \                            |
>> + *	    1.2 |                         |  \                           |
>> + *	 r      |                         |   \                          |
>> + *	 a  1.0 |              cb_min --> |____\_________________________|
>> + *	 t      |                         ^    ^                         ^
>> + *	 i  0.8 |                         |    |                         |
>> + *	 o      |                      cr_min  |                       cr_max
>> + *	 s  0.6 |                              |
>> + *	        |                             cr_low
>> + *	    0.4 |
>> + *	        |
>> + *	    0.2 |
>> + *	        |
>> + *	    0.0 |_______________________________________________________________
>> + *	        0.0   0.2   0.4   0.6   0.8   1.0   1.2   1.4   1.6   1.8   2.0
>> + *	                                   cr ratios
>> + *
>> + * header.type should be set to MALI_C55_PARAM_BLOCK_AWB_CONFIG from
>> + * :c:type:`mali_c55_param_block_type` for this block.
>> + *
>> + * @header:		The Mali-C55 parameters block header
>> + * @tap_point:		The tap point from enum mali_c55_params_awb_tap_points
>> + * @stats_mode:		AWB statistics collection mode, see :c:type:`mali_c55_awb_stats_mode`
>> + * @white_level:	Upper pixel intensity (I.E. raw pixel values) limit
>> + * @black_level:	Lower pixel intensity (I.E. raw pixel values) limit
>> + * @cr_max:		Maximum R/G ratio (Q4.8 format)
>> + * @cr_min:		Minimum R/G ratio (Q4.8 format)
>> + * @cb_max:		Maximum B/G ratio (Q4.8 format)
>> + * @cb_min:		Minimum B/G ratio (Q4.8 format)
>> + * @nodes_used_horiz:	Number of active zones horizontally [0..15]
>> + * @nodes_used_vert:	Number of active zones vertically [0..15]
>> + * @cr_high:		R/G ratio trim high (Q4.8 format)
>> + * @cr_low:		R/G ratio trim low (Q4.8 format)
>> + * @cb_high:		B/G ratio trim high (Q4.8 format)
>> + * @cb_low:		B/G ratio trim low (Q4.8 format)
>> + */
>> +struct mali_c55_params_awb_config {
>> +	struct mali_c55_params_block_header header;
>> +	__u8 tap_point;
>> +	__u8 stats_mode;
>> +	__u16 white_level;
>> +	__u16 black_level;
>> +	__u16 cr_max;
>> +	__u16 cr_min;
>> +	__u16 cb_max;
>> +	__u16 cb_min;
>> +	__u8 nodes_used_horiz;
>> +	__u8 nodes_used_vert;
>> +	__u16 cr_high;
>> +	__u16 cr_low;
>> +	__u16 cb_high;
>> +	__u16 cb_low;
>> +};
>> +
>> +#define MALI_C55_NUM_MESH_SHADING_ELEMENTS 3072
>> +
>> +/**
>> + * struct mali_c55_params_mesh_shading_config - Mesh shading configuration
>> + *
>> + * The mesh shading correction module allows programming a separate table of
>> + * either 16x16 or 32x32 node coefficients for 3 different light sources. The
>> + * final correction coefficients applied are computed by blending the
>> + * coefficients from two tables together.
>> + *
>> + * A page of 1024 32-bit integers is associated to each colour channel, with
>> + * pages stored consecutively in memory. Each 32-bit integer packs 3 8-bit
>> + * correction coefficients for a single node, one for each of the three light
>> + * sources. The 8 most significant bits are unused. The following table
>> + * describes the layout::
>> + *
>> + *	+----------- Page (Colour Plane) 0 -------------+
>> + *	| @mesh[i]  | Mesh Point | Bits  | Light Source |
>> + *	+-----------+------------+-------+--------------+
>> + *	|         0 |        0,0 | 16,23 | LS2          |
>> + *	|           |            | 08-15 | LS1          |
>> + *	|           |            | 00-07 | LS0          |
>> + *	+-----------+------------+-------+--------------+
>> + *	|         1 |        0,1 | 16,23 | LS2          |
>> + *	|           |            | 08-15 | LS1          |
>> + *	|           |            | 00-07 | LS0          |
>> + *	+-----------+------------+-------+--------------+
>> + *	|       ... |        ... | ...   | ...          |
>> + *	+-----------+------------+-------+--------------+
>> + *	|      1023 |      31,31 | 16,23 | LS2          |
>> + *	|           |            | 08-15 | LS1          |
>> + *	|           |            | 00-07 | LS0          |
>> + *	+----------- Page (Colour Plane) 1 -------------+
>> + *	| @mesh[i]  | Mesh Point | Bits  | Light Source |
>> + *	+-----------+------------+-------+--------------+
>> + *	|      1024 |        0,0 | 16,23 | LS2          |
>> + *	|           |            | 08-15 | LS1          |
>> + *	|           |            | 00-07 | LS0          |
>> + *	+-----------+------------+-------+--------------+
>> + *	|      1025 |        0,1 | 16,23 | LS2          |
>> + *	|           |            | 08-15 | LS1          |
>> + *	|           |            | 00-07 | LS0          |
>> + *	+-----------+------------+-------+--------------+
>> + *	|       ... |        ... | ...   | ...          |
>> + *	+-----------+------------+-------+--------------+
>> + *	|      2047 |      31,31 | 16,23 | LS2          |
>> + *	|           |            | 08-15 | LS1          |
>> + *	|           |            | 00-07 | LS0          |
>> + *	+----------- Page (Colour Plane) 2 -------------+
>> + *	| @mesh[i]  | Mesh Point | Bits  | Light Source |
>> + *	+-----------+------------+-------+--------------+
>> + *	|      2048 |        0,0 | 16,23 | LS2          |
>> + *	|           |            | 08-15 | LS1          |
>> + *	|           |            | 00-07 | LS0          |
>> + *	+-----------+------------+-------+--------------+
>> + *	|      2049 |        0,1 | 16,23 | LS2          |
>> + *	|           |            | 08-15 | LS1          |
>> + *	|           |            | 00-07 | LS0          |
>> + *	+-----------+------------+-------+--------------+
>> + *	|       ... |        ... | ...   | ...          |
>> + *	+-----------+------------+-------+--------------+
>> + *	|      3071 |      31,31 | 16,23 | LS2          |
>> + *	|           |            | 08-15 | LS1          |
>> + *	|           |            | 00-07 | LS0          |
>> + *	+-----------+------------+-------+--------------+
>> + *
>> + * The @mesh_scale member determines the precision and minimum and maximum gain.
>> + * For example if @mesh_scale is 0 and therefore selects 0 - 2x gain, a value of
>> + * 0 in a coefficient means 0.0 gain, a value of 128 means 1.0 gain and 255
>> + * means 2.0 gain.
>> + *
>> + * header.type should be set to MALI_C55_PARAM_MESH_SHADING_CONFIG from
>> + * :c:type:`mali_c55_param_block_type` for this block.
>> + *
>> + * @header:		The Mali-C55 parameters block header
>> + * @mesh_show:		Output the mesh data rather than image data
>> + * @mesh_scale:		Set the precision and maximum gain range of mesh shading
>> + *				- 0 = 0-2x gain
>> + *				- 1 = 0-4x gain
>> + *				- 2 = 0-8x gain
>> + *				- 3 = 0-16x gain
>> + *				- 4 = 1-2x gain
>> + *				- 5 = 1-3x gain
>> + *				- 6 = 1-5x gain
>> + *				- 7 = 1-9x gain
>> + * @mesh_page_r:	Mesh page select for red colour plane [0..2]
>> + * @mesh_page_g:	Mesh page select for green colour plane [0..2]
>> + * @mesh_page_b:	Mesh page select for blue colour plane [0..2]
>> + * @mesh_width:		Number of horizontal nodes minus 1 [15,31]
>> + * @mesh_height:	Number of vertical nodes minus 1 [15,31]
>> + * @mesh:		Mesh shading correction tables
>> + */
>> +struct mali_c55_params_mesh_shading_config {
>> +	struct mali_c55_params_block_header header;
>> +	__u8 mesh_show;
>> +	__u8 mesh_scale;
>> +	__u8 mesh_page_r;
>> +	__u8 mesh_page_g;
>> +	__u8 mesh_page_b;
>> +	__u8 mesh_width;
>> +	__u8 mesh_height;
>> +	__u32 mesh[MALI_C55_NUM_MESH_SHADING_ELEMENTS];
>> +};
>> +
>> +/** enum mali_c55_params_mesh_alpha_bank - Mesh shading table bank selection
>> + * @MALI_C55_MESH_ALPHA_BANK_LS0_AND_LS1 - Select Light Sources 0 and 1
>> + * @MALI_C55_MESH_ALPHA_BANK_LS1_AND_LS2 - Select Light Sources 1 and 2
>> + * @MALI_C55_MESH_ALPHA_BANK_LS0_AND_LS2 - Select Light Sources 0 and 2
>> + */
>> +enum mali_c55_params_mesh_alpha_bank {
>> +	MALI_C55_MESH_ALPHA_BANK_LS0_AND_LS1 = 0,
>> +	MALI_C55_MESH_ALPHA_BANK_LS1_AND_LS2 = 1,
>> +	MALI_C55_MESH_ALPHA_BANK_LS0_AND_LS2 = 4
>> +};
>> +
>> +/**
>> + * struct mali_c55_params_mesh_shading_selection - Mesh table selection
>> + *
>> + * The module computes the final correction coefficients by blending the ones
>> + * from two light source tables, which are selected (independently for each
>> + * colour channel) by the @mesh_alpha_bank_r/g/b fields.
>> + *
>> + * The final blended coefficients for each node are calculated using the
>> + * following equation:
>> + *
>> + *     Final coefficient = (a * LS\ :sub:`b`\ + (256 - a) * LS\ :sub:`a`\) / 256
>> + *
>> + * Where a is the @mesh_alpha_r/g/b value, and LS\ :sub:`a`\ and LS\ :sub:`b`\
>> + * are the node cofficients for the two tables selected by the
>> + * @mesh_alpha_bank_r/g/b value.
>> + *
>> + * The scale of the applied correction may also be controlled by tuning the
>> + * @mesh_strength member. This is a modifier to the final coefficients which can
>> + * be used to globally reduce the gains applied.
>> + *
>> + * header.type should be set to MALI_C55_PARAM_MESH_SHADING_SELECTION from
>> + * :c:type:`mali_c55_param_block_type` for this block.
>> + *
>> + * @header:		The Mali-C55 parameters block header
>> + * @mesh_alpha_bank_r:	Red mesh table select (c:type:`enum mali_c55_params_mesh_alpha_bank`)
>> + * @mesh_alpha_bank_g:	Green mesh table select (c:type:`enum mali_c55_params_mesh_alpha_bank`)
>> + * @mesh_alpha_bank_b:	Blue mesh table select (c:type:`enum mali_c55_params_mesh_alpha_bank`)
>> + * @mesh_alpha_r:	Blend coefficient for R [0..255]
>> + * @mesh_alpha_g:	Blend coefficient for G [0..255]
>> + * @mesh_alpha_b:	Blend coefficient for B [0..255]
>> + * @mesh_strength:	Mesh strength in Q4.12 format [0..4096]
>> + */
>> +struct mali_c55_params_mesh_shading_selection {
>> +	struct mali_c55_params_block_header header;
>> +	__u8 mesh_alpha_bank_r;
>> +	__u8 mesh_alpha_bank_g;
>> +	__u8 mesh_alpha_bank_b;
>> +	__u8 mesh_alpha_r;
>> +	__u8 mesh_alpha_g;
>> +	__u8 mesh_alpha_b;
>> +	__u16 mesh_strength;
>> +};
>> +
>> +/**
>> + * union mali_c55_params_block - Generalisation of a parameter block
>> + *
>> + * This union allows the driver to treat a block as a generic pointer to this
>> + * union and safely access the header and block-specific struct without having
>> + * to resort to casting. The header member is accessed first, and the type field
> If this is for driver usage only, I would move the structure to the
> driver. Let's minimize the UAPI surface.


I have actually used the union in libcamera too, to clean up the code there handling filling the 
blocks. We could redefine it within libcamera of course but given it's useful in userspace too, I 
thought it made sense to keep it in the header...what do you think?

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>> + * checked which allows the driver to determine which of the other members
>> + * should be used. The data member at the end allows a pointer to an address
>> + * within the data member of :c:type:`mali_c55_params_buffer` to initialise a
>> + * union variable.
>> + *
>> + * @header:		Pointer to the shared header struct embedded as the
>> + *			first member of all the possible other members (except
>> + *			@data). This member would be accessed first and the type
>> + *			field checked to determine which of the other members
>> + *			should be accessed.
>> + * @sensor_offs:	For header->type == MALI_C55_PARAM_BLOCK_SENSOR_OFFS
>> + * @aexp_hist:		For header->type == MALI_C55_PARAM_BLOCK_AEXP_HIST and
>> + *			header->type == MALI_C55_PARAM_BLOCK_AEXP_IHIST
>> + * @aexp_weights:	For header->type == MALI_C55_PARAM_BLOCK_AEXP_HIST_WEIGHTS
>> + *			and header->type =  MALI_C55_PARAM_BLOCK_AEXP_IHIST_WEIGHTS
>> + * @digital_gain:	For header->type == MALI_C55_PARAM_BLOCK_DIGITAL_GAIN
>> + * @awb_gains:		For header->type == MALI_C55_PARAM_BLOCK_AWB_GAINS and
>> + *			header->type = MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP
>> + * @awb_config:		For header->type == MALI_C55_PARAM_MESH_SHADING_CONFIG
>> + * @shading_config:	For header->type == MALI_C55_PARAM_MESH_SHADING_SELECTION
>> + * @shading_selection:	For header->type == MALI_C55_PARAM_BLOCK_SENSOR_OFFS
>> + * @data:		Allows easy initialisation of a union variable with a
>> + *			pointer into a __u8 array.
>> + */
>> +union mali_c55_params_block {
>> +	struct mali_c55_params_block_header *header;
>> +	struct mali_c55_params_sensor_off_preshading *sensor_offs;
>> +	struct mali_c55_params_aexp_hist *aexp_hist;
>> +	struct mali_c55_params_aexp_weights *aexp_weights;
>> +	struct mali_c55_params_digital_gain *digital_gain;
>> +	struct mali_c55_params_awb_gains *awb_gains;
>> +	struct mali_c55_params_awb_config *awb_config;
>> +	struct mali_c55_params_mesh_shading_config *shading_config;
>> +	struct mali_c55_params_mesh_shading_selection *shading_selection;
>> +	__u8 *data;
>> +};
>> +
>> +/**
>> + * define MALI_C55_PARAMS_MAX_SIZE - Maximum size of all Mali C55 Parameters
>> + *
>> + * Though the parameters for the Mali-C55 are passed as optional blocks, the
>> + * driver still needs to know the absolute maximum size so that it can allocate
>> + * a buffer sized appropriately to accommodate userspace attempting to set all
>> + * possible parameters in a single frame.
>> + *
>> + * Some structs are in this list multiple times. Where that's the case, it just
>> + * reflects the fact that the same struct can be used with multiple different
>> + * header types from :c:type:`mali_c55_param_block_type`.
>> + */
>> +#define MALI_C55_PARAMS_MAX_SIZE				\
>> +	(sizeof(struct mali_c55_params_sensor_off_preshading) +	\
>> +	sizeof(struct mali_c55_params_aexp_hist) +		\
>> +	sizeof(struct mali_c55_params_aexp_weights) +		\
>> +	sizeof(struct mali_c55_params_aexp_hist) +		\
>> +	sizeof(struct mali_c55_params_aexp_weights) +		\
>> +	sizeof(struct mali_c55_params_digital_gain) +		\
>> +	sizeof(struct mali_c55_params_awb_gains) +		\
>> +	sizeof(struct mali_c55_params_awb_config) +		\
>> +	sizeof(struct mali_c55_params_awb_gains) +		\
>> +	sizeof(struct mali_c55_params_mesh_shading_config) +	\
>> +	sizeof(struct mali_c55_params_mesh_shading_selection))
>> +
>> +/**
>> + * struct mali_c55_params_buffer - 3A configuration parameters
>> + *
>> + * This struct contains the configuration parameters of the Mali-C55 ISP
>> + * algorithms, serialized by userspace into a data buffer. Each configuration
>> + * parameter block is represented by a block-specific structure which contains a
>> + * :c:type:`mali_c55_params_block_header` entry as first member. Userspace
>> + * populates the @data buffer with configuration parameters for the blocks that
>> + * it intends to configure. As a consequence, the data buffer effective size
>> + * changes according to the number of ISP blocks that userspace intends to
>> + * configure.
>> + *
>> + * The parameters buffer is versioned by the @version field to allow modifying
>> + * and extending its definition. Userspace shall populate the @version field to
>> + * inform the driver about the version it intends to use. The driver will parse
>> + * and handle the @data buffer according to the data layout specific to the
>> + * indicated version and return an error if the desired version is not
>> + * supported.
>> + *
>> + * For each ISP block that userspace wants to configure, a block-specific
>> + * structure is appended to the @data buffer, one after the other without gaps
>> + * in between nor overlaps. Userspace shall populate the @total_size field with
>> + * the effective size, in bytes, of the @data buffer.
>> + *
>> + * The expected memory layout of the parameters buffer is::
>> + *
>> + *	+-------------------- struct mali_c55_params_buffer ------------------+
>> + *	| version = MALI_C55_PARAM_BUFFER_V1;                                 |
>> + *	| total_size = sizeof(struct mali_c55_params_sensor_off_preshading)   |
>> + *	|              sizeof(struct mali_c55_params_aexp_hist);              |
>> + *	| +------------------------- data  ---------------------------------+ |
>> + *	| | +--------- struct mali_c55_params_sensor_off_preshading ------+ | |
>> + *	| | | +-------- struct mali_c55_params_block_header header -----+ | | |
>> + *	| | | | type = MALI_C55_PARAM_BLOCK_SENSOR_OFFS;                | | | |
>> + *	| | | | enabled = 1;                                            | | | |
>> + *	| | | | size =                                                  | | | |
>> + *	| | | |    sizeof(struct mali_c55_params_sensor_off_preshading);| | | |
>> + *	| | | +---------------------------------------------------------+ | | |
>> + *	| | | chan00 = ...;                                               | | |
>> + *	| | | chan01 = ...;                                               | | |
>> + *	| | | chan10 = ...;                                               | | |
>> + *	| | | chan11 = ...;                                               | | |
>> + *	| | +------------ struct mali_c55_params_aexp_hist ---------------+ | |
>> + *	| | | +-------- struct mali_c55_params_block_header header -----+ | | |
>> + *	| | | | type = MALI_C55_PARAM_BLOCK_AEXP_HIST;                  | | | |
>> + *	| | | | enabled = 1;                                            | | | |
>> + *	| | | | size = sizeof(struct mali_c55_params_aexp_hist);        | | | |
>> + *	| | | +---------------------------------------------------------+ | | |
>> + *	| | | skip_x = ...;                                               | | |
>> + *	| | | offset_x = ...;                                             | | |
>> + *	| | | skip_y = ...;                                               | | |
>> + *	| | | offset_y = ...;                                             | | |
>> + *	| | | scale_bottom = ...;                                         | | |
>> + *	| | | scale_top = ...;                                            | | |
>> + *	| | | plane_mode = ...;                                           | | |
>> + *	| | | tap_point = ...;                                            | | |
>> + *	| | +-------------------------------------------------------------+ | |
>> + *	| +-----------------------------------------------------------------+ |
>> + *	+---------------------------------------------------------------------+
>> + *
>> + * @version: The version from :c:type:`mali_c55_param_buffer_version`
>> + * @total_size: The Mali-C55 configuration data effective size, excluding this
>> + *		header
>> + * @data: The Mali-C55 configuration blocks data
>> + */
>> +struct mali_c55_params_buffer {
>> +	__u8 version;
>> +	__u32 total_size;
>> +	__u8 data[MALI_C55_PARAMS_MAX_SIZE];
>> +};
>> +
>>   #endif /* __UAPI_MALI_C55_CONFIG_H */

