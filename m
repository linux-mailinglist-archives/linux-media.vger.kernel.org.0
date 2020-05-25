Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED191E0F2F
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2020 15:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403792AbgEYNOT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 May 2020 09:14:19 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:57137 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390674AbgEYNOS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 May 2020 09:14:18 -0400
Received: from [78.134.112.142] (port=42672 helo=[192.168.77.62])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1jdCvk-0072GJ-Oc; Mon, 25 May 2020 15:14:12 +0200
Subject: Re: [PATCH v13 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
To:     Vishal Sagar <vishal.sagar@xilinx.com>,
        Hyun Kwon <hyunk@xilinx.com>,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        Michal Simek <michals@xilinx.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, hans.verkuil@cisco.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hyun Kwon <hyun.kwon@xilinx.com>
References: <20200512151947.120348-1-vishal.sagar@xilinx.com>
 <20200512151947.120348-3-vishal.sagar@xilinx.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <e3ccf942-0a0d-1c4c-30bf-db9f127126f4@lucaceresoli.net>
Date:   Mon, 25 May 2020 15:14:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512151947.120348-3-vishal.sagar@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Vishal,

thanks. I have only a few minor nitpicking comments.

On 12/05/20 17:19, Vishal Sagar wrote:
> The Xilinx MIPI CSI-2 Rx Subsystem soft IP is used to capture images
> from MIPI CSI-2 camera sensors and output AXI4-Stream video data ready
> for image processing. Please refer to PG232 for details.
> 
> The CSI2 Rx controller filters out all packets except for the packets
> with data type fixed in hardware. RAW8 packets are always allowed to
> pass through.
> 
> It is also used to setup and handle interrupts and enable the core. It
> logs all the events in respective counters between streaming on and off.
> 
> The driver supports only the video format bridge enabled configuration.
> Some data types like YUV 422 10bpc, RAW16, RAW20 are supported when the
> CSI v2.0 feature is enabled in design. When the VCX feature is enabled,
> the maximum number of virtual channels becomes 16 from 4.
> 
> Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[...]

> +static int xcsi2rxss_start_stream(struct xcsi2rxss_state *state)
> +{
> +	int ret = 0;
> +
> +	/* enable core */
> +	xcsi2rxss_set(state, XCSI_CCR_OFFSET, XCSI_CCR_ENABLE);
> +
> +	ret = xcsi2rxss_soft_reset(state);
> +	if (ret < 0) {

'if (ret)' is enough, it's a classic nonzero-on-error return value.

> +/**
> + * xcsi2rxss_irq_handler - Interrupt handler for CSI-2
> + * @irq: IRQ number
> + * @data: Pointer to device state
> + *
> + * In the interrupt handler, a list of event counters are updated for
> + * corresponding interrupts. This is useful to get status / debug.
> + *
> + * Return: IRQ_HANDLED after handling interrupts
> + */
> +static irqreturn_t xcsi2rxss_irq_handler(int irq, void *data)
> +{
> +	struct xcsi2rxss_state *state = (struct xcsi2rxss_state *)data;
> +	struct device *dev = state->dev;
> +	u32 status;
> +
> +	status = xcsi2rxss_read(state, XCSI_ISR_OFFSET) & XCSI_ISR_ALLINTR_MASK;
> +	xcsi2rxss_write(state, XCSI_ISR_OFFSET, status);
> +
> +	/* Received a short packet */
> +	if (status & XCSI_ISR_SPFIFONE) {
> +		u32 count = 0;
> +
> +		/*
> +		 * Drain generic short packet FIFO by reading max 31
> +		 * (fifo depth) short packets from fifo or till fifo is empty.
> +		 */
> +		for (count = 0; count < XCSI_SPKT_FIFO_DEPTH; ++count) {
> +			u32 spfifostat, spkt;
> +
> +			spkt = xcsi2rxss_read(state, XCSI_SPKTR_OFFSET);
> +			dev_dbg(dev, "Short packet = 0x%08x\n", spkt);
> +			spfifostat = xcsi2rxss_read(state, XCSI_ISR_OFFSET);
> +			spfifostat &= XCSI_ISR_SPFIFONE;
> +			if (!spfifostat)
> +				break;
> +			xcsi2rxss_write(state, XCSI_ISR_OFFSET, spfifostat);
> +		}
> +	}
> +
> +	/* Short packet FIFO overflow */
> +	if (status & XCSI_ISR_SPFIFOF)
> +		dev_dbg_ratelimited(dev, "Short packet FIFO overflowed\n");
> +
> +	/*
> +	 * Stream line buffer full
> +	 * This means there is a backpressure from downstream IP
> +	 */
> +	if (status & XCSI_ISR_SLBF) {
> +		dev_alert_ratelimited(dev, "Stream Line Buffer Full!\n");
> +
> +		/* disable interrupts */
> +		xcsi2rxss_clr(state, XCSI_IER_OFFSET, XCSI_IER_INTR_MASK);
> +		xcsi2rxss_clr(state, XCSI_GIER_OFFSET, XCSI_GIER_GIE);
> +
> +		/* disable core */
> +		xcsi2rxss_clr(state, XCSI_CCR_OFFSET, XCSI_CCR_ENABLE);
> +		state->streaming = false;
> +
> +		/*
> +		 * The IP needs to be hard reset before it can be used now.
> +		 * This will be done in streamoff.
> +		 */
> +
> +		/*
> +		 * TODO: Notify the whole pipeline with v4l2_subdev_notify() to
> +		 * inform userspace.
> +		 */
> +	}
> +
> +	/* Increment event counters */
> +	if (status & XCSI_ISR_ALLINTR_MASK) {
> +		unsigned int i;
> +
> +		for (i = 0; i < XCSI_NUM_EVENTS; i++) {
> +			if (!(status & xcsi2rxss_events[i].mask))
> +				continue;
> +			state->events[i]++;
> +			dev_dbg_ratelimited(dev, "%s: %u\n",
> +					    xcsi2rxss_events[i].name,
> +					    state->events[i]);
> +		}
> +
> +		if (status & XCSI_ISR_VCXFE && state->en_vcx) {
> +			u32 vcxstatus;
> +
> +			vcxstatus = xcsi2rxss_read(state, XCSI_VCXR_OFFSET);
> +			vcxstatus &= XCSI_VCXR_VCERR;
> +			for (i = 0; i < XCSI_VCX_NUM_EVENTS; i++) {
> +				if (!(vcxstatus & (1 << i)))

You can use BIT(i) instead of (1 << i).

> +/**
> + * xcsi2rxss_set_format - This is used to set the pad format
> + * @sd: Pointer to V4L2 Sub device structure
> + * @cfg: Pointer to sub device pad information structure
> + * @fmt: Pointer to pad level media bus format
> + *
> + * This function is used to set the pad format. Since the pad format is fixed
> + * in hardware, it can't be modified on run time. So when a format set is
> + * requested by application, all parameters except the format type is saved
> + * for the pad and the original pad format is sent back to the application.
> + *
> + * Return: 0 on success
> + */
> +static int xcsi2rxss_set_format(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_pad_config *cfg,
> +				struct v4l2_subdev_format *fmt)
> +{
> +	struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
> +	struct v4l2_mbus_framefmt *__format;
> +	u32 dt;
> +
> +	/* only sink pad format can be updated */

This comment should be placed...

> +	mutex_lock(&xcsi2rxss->lock);
> +
> +	/*
> +	 * Only the format->code parameter matters for CSI as the
> +	 * CSI format cannot be changed at runtime.
> +	 * Ensure that format to set is copied to over to CSI pad format
> +	 */
> +	__format = __xcsi2rxss_get_pad_format(xcsi2rxss, cfg,
> +					      fmt->pad, fmt->which);
> +

...here.

> +	if (fmt->pad == XVIP_PAD_SOURCE) {
> +		fmt->format = *__format;
> +		mutex_unlock(&xcsi2rxss->lock);
> +		return 0;
> +	}
> +
> +	/*
> +	 * RAW8 is supported in all datatypes. So if requested media bus format
> +	 * is of RAW8 type, then allow to be set. In case core is configured to
> +	 * other RAW, YUV422 8/10 or RGB888, set appropriate media bus format.
> +	 */
> +	dt = xcsi2rxss_get_dt(fmt->format.code);
> +	if (dt != xcsi2rxss->datatype && dt != XCSI_DT_RAW8) {
> +		dev_dbg(xcsi2rxss->dev, "Unsupported media bus format");
> +		/* set the default format for the data type */
> +		fmt->format.code = xcsi2rxss_get_nth_mbus(xcsi2rxss->datatype,
> +							  0);
> +	}
> +
> +	*__format = fmt->format;
> +	mutex_unlock(&xcsi2rxss->lock);
> +
> +	return 0;
> +}
> +
> +/*
> + * xcsi2rxss_enum_mbus_code - Handle pixel format enumeration
> + * @sd : pointer to v4l2 subdev structure
> + * @cfg: V4L2 subdev pad configuration
> + * @code : pointer to v4l2_subdev_mbus_code_enum structure

Remove space before colon here.

Looks good otherwise, and my comments are minor details so:
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

I tried to runtime test this driver as well replacing the v10 driver
that I'm using at the moment, but ran into many problems, apparently in
the media entity navigation. The diff between v10 and v13 does not
justify these problems, so I'm assuming v13 needs a more recent kernel
than the 4.19 I'm currentl stuck on.

-- 
Luca Ceresoli
