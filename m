Return-Path: <linux-media+bounces-34247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9739CAD0263
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA08C3AE20E
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3576288C0E;
	Fri,  6 Jun 2025 12:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IjqZbUCB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876EA288537;
	Fri,  6 Jun 2025 12:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749213669; cv=none; b=tH/fCtXz5cHRuDV3Em4hx3N7XsHc62fap04rc0+PcyMXTkRSgNnqU/vKdx101fqovhRTEj8mRusg1Rj/ny13gVK9Z+DEArs0ramCm7rVPdHZdezyJnNrxbhganoNpt5YeSWBiEmPNTLXO3BOWgNkyRSfZYpJ8RySeabHNimGex0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749213669; c=relaxed/simple;
	bh=1N+xCDZJ/0b4qoHVQOlp9TIGFKwd8yBxgETiQhT7ccs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSFfqtrBJtYAWAMZIFhTyYA6L8c32kr4Vi14OBPGlrpV12fYPKHs6Kpkpg135ppGb7m66FOOjtlLNnAg11OzpdvllB7D7jnJhcxvu4na7Bi0gRsAXBpWnheyEMwGrApOeoFAm3hS0mdo6viK5uff/MMklMxQFaizUH96wkbdyew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IjqZbUCB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE0D211DD;
	Fri,  6 Jun 2025 14:41:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749213660;
	bh=1N+xCDZJ/0b4qoHVQOlp9TIGFKwd8yBxgETiQhT7ccs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IjqZbUCBHbdcVQfrDKzQGdv2IuKbNQccf7oIsi9R1bvR9ykq2PAIYLRgiIDNtHKK6
	 toGy0XWAjz4HHl6lvXBf0RmnGLhIoeBtpydCWlsjLWwmHl4lEBC29XwTc20Ik9ueL3
	 sjkTh+GGLlqPMLVyrDea76VDk4M/tSfxpQNS02/A=
Date: Fri, 6 Jun 2025 15:40:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: kieran.bingham@ideasonboard.com, rmfrfs@gmail.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: platform: Add user line interrupt to
 imx-mipi-csis driver
Message-ID: <20250606124054.GC27510@pendragon.ideasonboard.com>
References: <20250606121403.498153-1-isaac.scott@ideasonboard.com>
 <20250606121403.498153-3-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606121403.498153-3-isaac.scott@ideasonboard.com>

Hi Isaac,

Thank you for the patch.

On Fri, Jun 06, 2025 at 01:14:03PM +0100, Isaac Scott wrote:
> The NXP i.MX 8M Plus features an interrupt that triggers after the MIPI
> CSI receiver counts a user-configurable number of lines. This is useful
> for debugging, as it allows users to check if the amount of lines per
> frame equals what they are expecting.
> 
> Add support for this interrupt in the driver, and an entry into debugfs to
> allow the user to configure whether the interrupt is enabled, as well as
> the number of lines after which to trigger the interrupt.
> 
> This debugfs control can be altered while a stream is in progress, with
> 0 disabling the interrupt and >0 setting a new desired line count.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 45 +++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index bbc549c22aff..0e6bc3c87be4 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -88,6 +88,10 @@
>  #define MIPI_CSIS_INT_MSK_ERR_CRC		BIT(1)
>  #define MIPI_CSIS_INT_MSK_ERR_UNKNOWN		BIT(0)
>  
> +/* CSIS Interrupt mask 1 */
> +#define MIPI_CSIS_INT_MSK_1			0x18
> +#define MIPI_CSIS_INT_MSK_1_LINE_END		BIT(0)
> +
>  /* CSIS Interrupt source */
>  #define MIPI_CSIS_INT_SRC			0x14
>  #define MIPI_CSIS_INT_SRC_EVEN_BEFORE		BIT(31)
> @@ -109,6 +113,10 @@
>  #define MIPI_CSIS_INT_SRC_ERR_UNKNOWN		BIT(0)
>  #define MIPI_CSIS_INT_SRC_ERRORS		0xfffff
>  
> +/* CSIS Interrupt source 1 */
> +#define MIPI_CSIS_INT_SRC_1			0x1c
> +#define MIPI_CSIS_INT_SRC_1_LINE_END		BIT(0)
> +
>  /* D-PHY status control */
>  #define MIPI_CSIS_DPHY_STATUS			0x20
>  #define MIPI_CSIS_DPHY_STATUS_ULPS_DAT		BIT(8)
> @@ -221,6 +229,7 @@
>  #define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE	BIT(0)
>  
>  #define MIPI_CSIS_FRAME_COUNTER_CH(n)		(0x0100 + (n) * 4)
> +#define MIPI_CSIS_LINE_INTERRUPT_RATIO(n)	(0x0110 + (n) * 4)
>  
>  /* Non-image packet data buffers */
>  #define MIPI_CSIS_PKTDATA_ODD			0x2000
> @@ -281,6 +290,8 @@ static const struct mipi_csis_event mipi_csis_events[] = {
>  	{ 0, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End"},
>  	{ 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge"},
>  	{ 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge"},
> +	/* User Line interrupt */
> +	{ 2, MIPI_CSIS_INT_SRC_1_LINE_END,		"Line End"}
>  };
>  
>  #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
> @@ -333,11 +344,14 @@ struct mipi_csis_device {
>  
>  	spinlock_t slock;	/* Protect events */
>  	struct mipi_csis_event events[MIPI_CSIS_NUM_EVENTS];
> +
>  	struct dentry *debugfs_root;
>  	struct {
>  		bool enable;
>  		u32 hs_settle;
>  		u32 clk_settle;
> +		u32 int_line;
> +		u32 last_int_line;
>  	} debug;
>  };
>  
> @@ -686,6 +700,15 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
>  			MIPI_CSIS_DPHY_BCTRL_L_B_DPHYCTRL(20000000));
>  	mipi_csis_write(csis, MIPI_CSIS_DPHY_BCTRL_H, 0);
>  
> +	if (csis->debug.int_line > 0)
> +		mipi_csis_write(csis, MIPI_CSIS_LINE_INTERRUPT_RATIO(0),
> +				csis->debug.int_line - 1);

Should this become 

	mipi_csis_write(csis, MIPI_CSIS_LINE_INTERRUPT_RATIO(0),
			max(csis->debug.int_line, 1U) - 1);

to write MIPI_CSIS_LINE_INTERRUPT_RATIO to 0 when int_lines == 0, like
below ?

> +
> +	mipi_csis_write(csis, MIPI_CSIS_INT_MSK_1,
> +			csis->debug.int_line ?
> +			MIPI_CSIS_INT_MSK_1_LINE_END : 0);

You should also read csis->debug.int_line into a local variable like in
the interrupt handler to avoid races.

And you also need to clear MIPI_CSIS_INT_MSK_1 in
mipi_csis_enable_interrupts() (when on == false).

> +	csis->debug.last_int_line = csis->debug.int_line;
> +
>  	/* Update the shadow register. */
>  	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
>  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
> @@ -765,10 +788,12 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
>  	struct mipi_csis_device *csis = dev_id;
>  	unsigned long flags;
>  	unsigned int i;
> -	u32 status[2];
> +	u32 int_lines;
> +	u32 status[3];
>  
>  	status[0] = mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
>  	status[1] = mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
> +	status[2] = mipi_csis_read(csis, MIPI_CSIS_INT_SRC_1);
>  
>  	spin_lock_irqsave(&csis->slock, flags);
>  
> @@ -785,10 +810,25 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
>  	if (status[0] & MIPI_CSIS_INT_SRC_FRAME_START)
>  		mipi_csis_queue_event_sof(csis);
>  
> +	int_lines = READ_ONCE(csis->debug.int_line);
> +	if (int_lines != csis->debug.last_int_line) {
> +		if (int_lines > 0)
> +			mipi_csis_write(csis, MIPI_CSIS_LINE_INTERRUPT_RATIO(0),
> +					max(int_lines, 1U) - 1);
> +		else
> +			mipi_csis_write(csis,
> +					MIPI_CSIS_LINE_INTERRUPT_RATIO(0), 0);

The whole can be replaced with

		mipi_csis_write(csis, MIPI_CSIS_LINE_INTERRUPT_RATIO(0),
				max(int_lines, 1U) - 1);

> +
> +		csis->debug.last_int_line = int_lines;
> +		mipi_csis_write(csis, MIPI_CSIS_INT_MSK_1,
> +				int_lines ? MIPI_CSIS_INT_MSK_1_LINE_END : 0);
> +	}
> +

I don't think you need to do any of this with the spinlock held as the
spinlock covers the events field only, which you don't touch here. You
can move the code after spin_unlock_irqrestore().

>  	spin_unlock_irqrestore(&csis->slock, flags);
>  
>  	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status[0]);
>  	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, status[1]);
> +	mipi_csis_write(csis, MIPI_CSIS_INT_SRC_1, status[2]);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -928,6 +968,7 @@ static void mipi_csis_debugfs_init(struct mipi_csis_device *csis)
>  {
>  	csis->debug.hs_settle = UINT_MAX;
>  	csis->debug.clk_settle = UINT_MAX;
> +	csis->debug.int_line = 0;
>  
>  	csis->debugfs_root = debugfs_create_dir(dev_name(csis->dev), NULL);
>  
> @@ -939,6 +980,8 @@ static void mipi_csis_debugfs_init(struct mipi_csis_device *csis)
>  			   &csis->debug.clk_settle);
>  	debugfs_create_u32("ths_settle", 0600, csis->debugfs_root,
>  			   &csis->debug.hs_settle);
> +	debugfs_create_u32("int_line_0", 0600, csis->debugfs_root,
> +			   &csis->debug.int_line);
>  }
>  
>  static void mipi_csis_debugfs_exit(struct mipi_csis_device *csis)

-- 
Regards,

Laurent Pinchart

