Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4571B1655
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 21:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgDTT5b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 15:57:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48256 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbgDTT5a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 15:57:30 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8327897D;
        Mon, 20 Apr 2020 21:57:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587412647;
        bh=VyAYxn5QYg/qgAZ3QLAxeHFXObmm2KTLy1cekrs4/Co=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IKhnGhruHCVyCfW+bc7TXpXtGwConChaObWLBzXYbiqByrVChPlQLVGl/G4FdUPMl
         dLXsraIQVsxotRt3uqKwfPrz5ktBfU2tb7IgP5PW9Mdok0h1m4pjy/h0NdzdJNuSqI
         VkYK0qyxESSpoQaAtbkSWR96MVTLFEOhi89k09oE=
Date:   Mon, 20 Apr 2020 22:57:14 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Vishal Sagar <vishal.sagar@xilinx.com>,
        Hyun Kwon <hyunk@xilinx.com>, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        Michal Simek <michals@xilinx.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, hans.verkuil@cisco.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH v11 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
Message-ID: <20200420195714.GB8195@pendragon.ideasonboard.com>
References: <20200409194424.45555-1-vishal.sagar@xilinx.com>
 <20200409194424.45555-3-vishal.sagar@xilinx.com>
 <20200419180222.GB8117@pendragon.ideasonboard.com>
 <860c27da-eba0-ddcb-719b-52b2725bd9bf@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <860c27da-eba0-ddcb-719b-52b2725bd9bf@lucaceresoli.net>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Luca,

On Mon, Apr 20, 2020 at 09:24:25PM +0200, Luca Ceresoli wrote:
> On 19/04/20 20:02, Laurent Pinchart wrote:
> [...]
> >> +static irqreturn_t xcsi2rxss_irq_handler(int irq, void *dev_id)
> >> +{
> >> +	struct xcsi2rxss_state *state = (struct xcsi2rxss_state *)dev_id;
> >> +	struct xcsi2rxss_core *core = &state->core;
> >> +	u32 status;
> >> +
> >> +	status = xcsi2rxss_read(core, XCSI_ISR_OFFSET) & XCSI_ISR_ALLINTR_MASK;
> >> +	dev_dbg_ratelimited(core->dev, "interrupt status = 0x%08x\n", status);
> > 
> > As this is expected to occur for every frame, I would drop the message,
> > even if rate-limited.
> > 
> >> +
> >> +	if (!status)
> >> +		return IRQ_NONE;
> >> +
> >> +	/* Received a short packet */
> >> +	if (status & XCSI_ISR_SPFIFONE) {
> >> +		dev_dbg_ratelimited(core->dev, "Short packet = 0x%08x\n",
> >> +				    xcsi2rxss_read(core, XCSI_SPKTR_OFFSET));
> >> +	}
> > 
> > Same here, this will occur all the time, I'd remove this message. You
> > need to read XCSI_SPKTR_OFFSET though, and you should do so in a loop
> > until the XCSI_CSR_SPFIFONE in XCSI_CSR_OFFSET is cleared in case
> > multiple short packets are received before the interrupt handler
> > executes.
> > 
> > I also wonder if it would make sense to extract the frame number from
> > the FS short packet, and make it available through the subdev API. I
> > think it should be reported through a V4L2_EVENT_FRAME_SYNC event. This
> > can be implemented later.
> > 
> >> +
> >> +	/* Short packet FIFO overflow */
> >> +	if (status & XCSI_ISR_SPFIFOF)
> >> +		dev_dbg_ratelimited(core->dev, "Short packet FIFO overflowed\n");
> >> +
> >> +	/*
> >> +	 * Stream line buffer full
> >> +	 * This means there is a backpressure from downstream IP
> >> +	 */
> >> +	if (status & XCSI_ISR_SLBF) {
> >> +		dev_alert_ratelimited(core->dev, "Stream Line Buffer Full!\n");
> >> +		xcsi2rxss_stop_stream(state);
> >> +		if (core->rst_gpio) {
> >> +			gpiod_set_value(core->rst_gpio, 1);
> >> +			/* minimum 40 dphy_clk_200M cycles */
> >> +			ndelay(250);
> >> +			gpiod_set_value(core->rst_gpio, 0);
> >> +		}
> > 
> > I don't think you should stop the core here. xcsi2rxss_stop_stream()
> > calls the source .s_stream(0) operation, which usually involves I2C
> > writes that will sleep.
> > 
> > You should instead report an event to userspace (it looks like we have
> > no error event defined in V4L2, one should be added), and rely on the
> > normal stop procedure.
> 
> FWIW, since a long time I've been using a modified version of this
> routine, where after a Stream Line Buffer Full condition I just stop and
> restart the csi2rx core and the stream continues after a minimal glitch.
> Other subdev are unaware that anything has happened and keep on streaming.
> 
> Not sure this is the correct thing to do, but it's working for me. Also
> I proposed this topic in one of the previous iterations of this patch,
> but the situation was different because the stream on/off was not
> propagated back at that time.

Thanks for the feedback. How often does this occur in practice ?

-- 
Regards,

Laurent Pinchart
