Return-Path: <linux-media+bounces-8659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C0D8988E1
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 15:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C68481F23554
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 13:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375EE128361;
	Thu,  4 Apr 2024 13:36:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05138528B;
	Thu,  4 Apr 2024 13:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712237778; cv=none; b=ChB+L8cEDv7WnJNueFLzGGtSq32H2IuDftQCJEI+JYTxlv212fQ8VYylCFJvRDkJ5BpUQOyDAwbin/H4409uLmOtgYeUCH2Jy6sJymuAmMiY5cM9VAt73mj3BSkcuHWA6Ts1Cs6tNHyihswu29gfFcoswAGsxW2qDcFxzQH9bhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712237778; c=relaxed/simple;
	bh=D78tVMWbxjP85JEIbB025UO64yyRg+3ECNq9tSr2+nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DYwMID7Qn+1LFM1diWNHnIUnajQawO4aBUa7uSY3k5Iw7kxfI2oTDrcZeFNGBF7WrRR5u5HCC1nl0dicJj8qijJiYDBJToowkklG7jYo1+0QgHu5z76MYpRjKfGQ68T+X54VWQucbX8rznWTxHa4nZC48slFCQIASITLU6TW/Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2EEC433F1;
	Thu,  4 Apr 2024 13:36:14 +0000 (UTC)
Message-ID: <11107704-46a7-4228-99da-55389e210553@xs4all.nl>
Date: Thu, 4 Apr 2024 15:36:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/10] media: bcm2835-unicam: Add support for CCP2/CSI2
 camera interface
Content-Language: en-US, nl
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Naushir Patuck <naush@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, kernel-list@raspberrypi.com,
 linux-rpi-kernel@lists.infradead.org,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20240402000424.4650-1-laurent.pinchart@ideasonboard.com>
 <20240402000424.4650-5-laurent.pinchart@ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240402000424.4650-5-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Just two minor comments:

On 02/04/2024 02:04, Laurent Pinchart wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Add a driver for the Unicam camera receiver block on BCM283x processors.
> It is represented as two video device nodes: unicam-image and
> unicam-embedded which are connected to an internal subdev (named
> unicam-subdev) in order to manage streams routing.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Co-developed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v8:
> 
> - Use MIPI_CSI2_DT_* macros
> - Disable image stream on start error
> - Move hardware configuration to unicam_sd_enable_streams()
> - Get VC and DT from frame descriptor
> - Don't cache fmtinfo in unicam_node
> - Calculate line_int_freq based on subdev format
> - Fix try_fmt_meta regression from v5
> 
> Changes since v7:
> 
> - Indentation, line wrap and white space fixes
> - Add copyright notice for Ideas on Board
> - Use unsigned values for shifts in macro
> - Replace condition and assignment with max()
> - Don't set the serial to an empty string manually
> - Don't use loop for lane clocks setting
> - Store PUM value in struct unicam_format_info
> 
> Changes since v6:
> 
> - Fix typos in comments
> - Drop outdated comment
> - Indentation fixes
> - Turn UNICAM_SD_PAD_* into an enum
> - Drop unicam_format_info.metadata_fmt
> - Remove unneeded dev_dbg()
> - Report meta frame sizes as V4L2_FRMSIZE_TYPE_STEPWISE
> - Drop stray semicolons
> - Set V4L2_FMT_FLAG_META_LINE_BASED for metadata format
> - Rename error label
> - Use .get_mbus_config() to get number of data lanes
> - Drop minimum of 3 buffers in .queue_setup()
> - Merge locks for the two video nodes
> - Rework start/stop to avoid race conditions
> 
> Changes since v5:
> 
> - Move to drivers/media/platform/broadcom/
> - Port to the upstream V4L2 streams API
> - Rebase on latest metadata API proposal
> - Add missing error message
> - Drop unneeded documentation block for unicam_isr()
> - Drop unneeded dev_dbg() and dev_err() messages
> - Drop unneeded streams_mask and fmt checks
> - Drop unused unicam_sd_pad_is_sink()
> - Drop unneeded includes
> - Drop v4l2_ctrl_subscribe_event() call
> - Use pm_runtime_resume_and_get()
> - Indentation and line wrap fixes
> - Let the framework set bus_info
> - Use v4l2_fwnode_endpoint_parse()
> - Fix media device cleanup
> - Drop lane reordering checks
> - Fix subdev state locking
> - Drop extra debug messages
> - Move clock handling to runtime PM handlers
> - Reorder functions
> - Rename init functions for more clarity
> - Initialize runtime PM earlier
> - Clarify error messages
> - Simplify subdev init with local variable
> - Fix subdev cleanup
> - Fix typos and indentation
> - Don't initialize local variables needlessly
> - Simplify num lanes check
> - Fix metadata handling in subdev set_fmt
> - Drop manual fallback to .s_stream()
> - Pass v4l2_pix_format to unicam_calc_format_size_bpl()
> - Simplify unicam_set_default_format()
> - Fix default format settings
> - Add busy check in unicam_s_fmt_meta()
> - Add missing \n at end of format strings
> - Fix metadata handling in subdev set_fmt
> - Fix locking when starting streaming
> - Return buffers from start streaming fails
> - Fix format validation for metadata node
> - Use video_device_pipeline_{start,stop}() helpers
> - Simplify format enumeration
> - Drop unset variable
> - Update MAINTAINERS entry
> - Update to the upstream v4l2_async_nf API
> - Update to the latest subdev routing API
> - Update to the latest subdev state API
> - Move from subdev .init_cfg() to .init_state()
> - Update to the latest videobuf2 API
> - Fix v4l2_subdev_enable_streams() error check
> - Use correct pad for the connected subdev
> - Return buffers to vb2 when start streaming fails
> - Improve debugging in start streaming handler
> - Simplify DMA address management
> - Drop comment about bcm2835-camera driver
> - Clarify comments that explain min/max sizes
> - Pass v4l2_pix_format to unicam_try_fmt()
> - Drop unneeded local variables
> - Rename image-related constants and functions
> - Turn unicam_fmt.metadata_fmt into bool
> - Rename unicam_fmt to unicam_format_info
> - Rename unicam_format_info variables to fmtinfo
> - Rename unicam_node.v_fmt to fmt
> - Add metadata formats for RAW10, RAW12 and RAW14
> - Make metadata formats line-based
> - Validate format on metadata video device
> - Add Co-devlopped-by tags
> 
> Changes since v3:
> 
> - Add the vendor prefix for DT name
> - Use the reg-names in DT parsing
> - Remove MAINTAINERS entry
> 
> Changes since v2:
> 
> - Change code organization
> - Remove unused variables
> - Correct the fmt_meta functions
> - Rewrite the start/stop streaming
>   - You can now start the image node alone, but not the metadata one
>   - The buffers are allocated per-node
>   - only the required stream is started, if the route exists and is
>     enabled
> - Prefix the macros with UNICAM_ to not have too generic names
> - Drop colorspace support
> 
> Changes since v1:
> 
> - Replace the unicam_{info,debug,error} macros with dev_*()
> ---
>  MAINTAINERS                                   |    1 +
>  drivers/media/platform/Kconfig                |    1 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/broadcom/Kconfig       |   23 +
>  drivers/media/platform/broadcom/Makefile      |    3 +
>  .../platform/broadcom/bcm2835-unicam-regs.h   |  246 ++
>  .../media/platform/broadcom/bcm2835-unicam.c  | 2745 +++++++++++++++++
>  7 files changed, 3020 insertions(+)
>  create mode 100644 drivers/media/platform/broadcom/Kconfig
>  create mode 100644 drivers/media/platform/broadcom/Makefile
>  create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam-regs.h
>  create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam.c
> 

<snip>

> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> new file mode 100644
> index 000000000000..1418f209d6ad
> --- /dev/null
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -0,0 +1,2745 @@

<snip>

> +static int unicam_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct unicam_node *node = vb2_get_drv_priv(vq);
> +	struct unicam_device *unicam = node->dev;
> +	struct unicam_buffer *buf;
> +	struct media_pipeline_pad_iter iter;
> +	struct media_pad *pad;
> +	unsigned long flags;
> +	int ret;
> +
> +	dev_dbg(unicam->dev, "Starting stream on %s device\n",
> +		is_metadata_node(node) ? "metadata" : "image");
> +
> +	/*
> +	 * Start the pipeline. This validates all links, and populates the
> +	 * pipeline structure.
> +	 */
> +	ret = video_device_pipeline_start(&node->video_dev, &unicam->pipe.pipe);
> +	if (ret < 0) {
> +		dev_dbg(unicam->dev, "Failed to start media pipeline: %d\n", ret);
> +		goto err_buffers;
> +	}
> +
> +	/*
> +	 * Determine which video nodes are included in the pipeline, and get the
> +	 * number of data lanes.
> +	 */
> +	if (unicam->pipe.pipe.start_count == 1) {
> +		unicam->pipe.nodes = 0;
> +
> +		media_pipeline_for_each_pad(&unicam->pipe.pipe, &iter, pad) {
> +			if (pad->entity != &unicam->subdev.sd.entity)
> +				continue;
> +
> +			if (pad->index == UNICAM_SD_PAD_SOURCE_IMAGE)
> +				unicam->pipe.nodes |= BIT(UNICAM_IMAGE_NODE);
> +			else if (pad->index == UNICAM_SD_PAD_SOURCE_METADATA)
> +				unicam->pipe.nodes |= BIT(UNICAM_METADATA_NODE);
> +		}
> +
> +		if (!(unicam->pipe.nodes & BIT(UNICAM_IMAGE_NODE))) {
> +			dev_dbg(unicam->dev,
> +				"Pipeline does not include image node\n");
> +			ret = -EPIPE;
> +			goto err_pipeline;
> +		}
> +
> +		ret = unicam_num_data_lanes(unicam);
> +		if (ret < 0)
> +			goto err_pipeline;
> +
> +		unicam->pipe.num_data_lanes = ret;
> +
> +		dev_dbg(unicam->dev, "Running with %u data lanes, nodes %u\n",
> +			unicam->pipe.num_data_lanes, unicam->pipe.nodes);
> +	}
> +
> +	node->streaming = true;

Hmm, do you need to keep track of this here? Can't you use vb2_start_streaming_called()?

Generally I dislike keeping track of the same information in two places.

> +
> +	/* Arm the node with the first buffer from the DMA queue. */
> +	spin_lock_irqsave(&node->dma_queue_lock, flags);
> +	buf = list_first_entry(&node->dma_queue, struct unicam_buffer, list);
> +	node->cur_frm = buf;
> +	node->next_frm = buf;
> +	list_del(&buf->list);
> +	spin_unlock_irqrestore(&node->dma_queue_lock, flags);
> +
> +	/*
> +	 * Wait for all the video devices in the pipeline to have been started
> +	 * before starting the hardware. In the general case, this would
> +	 * prevent capturing multiple streams independently. However, the
> +	 * Unicam DMA engines are not generic, they have been designed to
> +	 * capture image data and embedded data from the same camera sensor.
> +	 * Not only does the main use case not benefit from independent
> +	 * capture, it requires proper synchronization of the streams at start
> +	 * time.
> +	 */
> +	if (unicam->pipe.pipe.start_count < hweight32(unicam->pipe.nodes))
> +		return 0;
> +
> +	ret = pm_runtime_resume_and_get(unicam->dev);
> +	if (ret < 0) {
> +		dev_err(unicam->dev, "PM runtime resume failed: %d\n", ret);
> +		goto err_pipeline;
> +	}
> +
> +	/* Enable the streams on the source. */
> +	ret = v4l2_subdev_enable_streams(&unicam->subdev.sd,
> +					 UNICAM_SD_PAD_SOURCE_IMAGE,
> +					 BIT(0));
> +	if (ret < 0) {
> +		dev_err(unicam->dev, "stream on failed in subdev\n");
> +		goto err_pm_put;
> +	}
> +
> +	if (unicam->pipe.nodes & BIT(UNICAM_METADATA_NODE)) {
> +		ret = v4l2_subdev_enable_streams(&unicam->subdev.sd,
> +						 UNICAM_SD_PAD_SOURCE_METADATA,
> +						 BIT(0));
> +		if (ret < 0) {
> +			dev_err(unicam->dev, "stream on failed in subdev\n");
> +			goto err_disable_streams;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_disable_streams:
> +	v4l2_subdev_disable_streams(&unicam->subdev.sd,
> +				    UNICAM_SD_PAD_SOURCE_IMAGE, BIT(0));
> +err_pm_put:
> +	pm_runtime_put_sync(unicam->dev);
> +err_pipeline:
> +	video_device_pipeline_stop(&node->video_dev);
> +err_buffers:
> +	unicam_return_buffers(node, VB2_BUF_STATE_QUEUED);
> +	node->streaming = false;
> +	return ret;
> +}

<snip>

> +static void unicam_unregister_nodes(struct unicam_device *unicam)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(unicam->node); i++) {
> +		struct unicam_node *node = &unicam->node[i];
> +
> +		if (node->dummy_buf_cpu_addr)
> +			dma_free_coherent(unicam->dev, node->dummy_buf.size,
> +					  node->dummy_buf_cpu_addr,
> +					  node->dummy_buf.dma_addr);
> +
> +		if (node->registered) {
> +			video_unregister_device(&node->video_dev);

Call vb2_video_unregister_device instead of video_unregister_device.
That ensures that unregistering the device will also stop streaming.
See comments in include/media/videobuf2-v4l2.h.

> +			node->registered = false;
> +		}
> +	}
> +}

<snip>

Regards,

	Hans


