Return-Path: <linux-media+bounces-34299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C844AD0EDD
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 20:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EFAA3ADF59
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 18:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51DF207A08;
	Sat,  7 Jun 2025 18:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HK0/gP6x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7167D1D5CE8;
	Sat,  7 Jun 2025 18:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749321543; cv=none; b=LFPEjskIMEl3eqmISgcxgkZM03hHdJVGQlPsLSuITV0edQin2r6DQ/oKgwvPWDdKq+EQcOk7fYQipqUyKRD3sdeus0/Wi0NoHaYxHpfnSrizsqcvJ/1xj37LxpaikSTjttj81pKJyGGwYiB7q7VnAQfiM2gMp8Cz5YjBBR6Doek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749321543; c=relaxed/simple;
	bh=gSJpUsaZYlEbICcWfKc4Nz/rYj0X8kE4NZyIticpvMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwTfTYeIksi2vv5cUGjTp6/xcEZn5GsGeVF8XqtBtxNfFLYPWkpmDrbvu/D82Rq128CHju3f9stS+b39i+XMDGo7bFAVOvWTKZBKfaiujTgrHBDWBieLvjlLRe4J6QhlRxjCHlvOKMwa7E6mk4J0PCGist4fqpW5Ooz8ixm1l7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HK0/gP6x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9CFB12EC;
	Sat,  7 Jun 2025 20:38:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749321533;
	bh=gSJpUsaZYlEbICcWfKc4Nz/rYj0X8kE4NZyIticpvMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HK0/gP6xNlwxEzUAEJK0KnSCuB9Ukggj8xI2stI3WPTtR//EQuwQpZsFRr4odrDjg
	 dP9H5D3l+cL0aYoNN1bs/R0r6G5cV+2mCm5sOthKynOdb2RpAgaqHSF+ujPudVtR5Y
	 YbTXzqFOothqzGP96AVDBqiVkQUgvEVq3Z2XsU5Q=
Date: Sat, 7 Jun 2025 21:38:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: kieran.bingham@ideasonboard.com, rmfrfs@gmail.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: platform: Refactor interrupt status
 registers
Message-ID: <20250607183847.GD27510@pendragon.ideasonboard.com>
References: <20250606154414.540290-1-isaac.scott@ideasonboard.com>
 <20250606154414.540290-2-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606154414.540290-2-isaac.scott@ideasonboard.com>

Hi Isaac,

Thank you for the patch.

The subject line should start with "media: imx-mipi-csis: ".

On Fri, Jun 06, 2025 at 04:44:13PM +0100, Isaac Scott wrote:
> The NXP i.MX 8 MP CSI-2 receiver features multiple interrupt and debug
> status sources which span multiple registers. The driver currently
> supports two interrupt source registers, and attributes the
> mipi_csis_event event entries to those registers through a boolean debug
> field that indicate if the event relates to the main interrupt status
> (false) or debug interrupt status (true) register. To make it easier to
> add new event fields, replace the debug bool with a 'status index'
> integer than indicates the index of the corresponding status register.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> ---
> 
> Changes since v1:
> - Switched from magic numbers to enum.
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 69 +++++++++++-----------
>  1 file changed, 36 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index d060eadebc7a..394987d72c64 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -248,8 +248,13 @@
>  #define MIPI_CSI2_DATA_TYPE_RAW14		0x2d
>  #define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
>  
> +enum mipi_csis_event_type {
> +	MAIN = 0,
> +	DEBUG = 1,

Those names are too generic and prone to namespace clashes.
MIPI_CSIS_EVENT_TYPE_MAIN and MIPI_CSIS_EVENT_TYPE_DEBUG would be
better.

No need to resubmit for this, I'll update the code when applying.

> +};
> +
>  struct mipi_csis_event {
> -	bool debug;
> +	enum mipi_csis_event_type status_index;
>  	u32 mask;
>  	const char * const name;
>  	unsigned int counter;
> @@ -257,30 +262,30 @@ struct mipi_csis_event {
>  
>  static const struct mipi_csis_event mipi_csis_events[] = {
>  	/* Errors */
> -	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
> -	{ false, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type Ignored" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,	"Early Frame End" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,	"Early Frame Start" },
> +	{ MAIN, MIPI_CSIS_INT_SRC_ERR_SOT_HS,			"SOT Error"},
> +	{ MAIN, MIPI_CSIS_INT_SRC_ERR_LOST_FS,			"Lost Frame Start Error"},
> +	{ MAIN, MIPI_CSIS_INT_SRC_ERR_LOST_FE,			"Lost Frame End Error"},
> +	{ MAIN, MIPI_CSIS_INT_SRC_ERR_OVER,			"FIFO Overflow Error"},
> +	{ MAIN, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,		"Wrong Configuration Error"},
> +	{ MAIN, MIPI_CSIS_INT_SRC_ERR_ECC,			"ECC Error"},
> +	{ MAIN, MIPI_CSIS_INT_SRC_ERR_CRC,			"CRC Error"},
> +	{ MAIN, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,			"Unknown Error"},
> +	{ DEBUG, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,		"Data Type Not Supported"},
> +	{ DEBUG, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,		"Data Type Ignored"},
> +	{ DEBUG, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,		"Frame Size Error"},
> +	{ DEBUG, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame"},
> +	{ DEBUG, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,		"Early Frame End"},
> +	{ DEBUG, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,		"Early Frame Start"},
>  	/* Non-image data receive events */
> -	{ false, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame" },
> -	{ false, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame" },
> -	{ false, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame" },
> -	{ false, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame" },
> +	{ MAIN, MIPI_CSIS_INT_SRC_EVEN_BEFORE,			"Non-image data before even frame"},
> +	{ MAIN, MIPI_CSIS_INT_SRC_EVEN_AFTER,			"Non-image data after even frame"},
> +	{ MAIN, MIPI_CSIS_INT_SRC_ODD_BEFORE,			"Non-image data before odd frame"},
> +	{ MAIN, MIPI_CSIS_INT_SRC_ODD_AFTER,			"Non-image data after odd frame"},
>  	/* Frame start/end */
> -	{ false, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start" },
> -	{ false, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge" },
> -	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge" },
> +	{ MAIN, MIPI_CSIS_INT_SRC_FRAME_START,			"Frame Start"},
> +	{ MAIN, MIPI_CSIS_INT_SRC_FRAME_END,			"Frame End"},
> +	{ DEBUG, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,		"VSYNC Falling Edge"},
> +	{ DEBUG, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,		"VSYNC Rising Edge"},
>  };
>  
>  #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
> @@ -765,32 +770,30 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
>  	struct mipi_csis_device *csis = dev_id;
>  	unsigned long flags;
>  	unsigned int i;
> -	u32 status;
> -	u32 dbg_status;
> +	u32 status[2];
>  
> -	status = mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
> -	dbg_status = mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
> +	status[MAIN] = mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
> +	status[DEBUG] = mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
>  
>  	spin_lock_irqsave(&csis->slock, flags);
>  
>  	/* Update the event/error counters */
> -	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
> +	if ((status[MAIN] & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
>  		for (i = 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
>  			struct mipi_csis_event *event = &csis->events[i];
>  
> -			if ((!event->debug && (status & event->mask)) ||
> -			    (event->debug && (dbg_status & event->mask)))
> +			if (status[event->status_index] & event->mask)
>  				event->counter++;
>  		}
>  	}
>  
> -	if (status & MIPI_CSIS_INT_SRC_FRAME_START)
> +	if (status[MAIN] & MIPI_CSIS_INT_SRC_FRAME_START)
>  		mipi_csis_queue_event_sof(csis);
>  
>  	spin_unlock_irqrestore(&csis->slock, flags);
>  
> -	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status);
> -	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, dbg_status);
> +	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status[MAIN]);
> +	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, status[DEBUG]);
>  
>  	return IRQ_HANDLED;
>  }

-- 
Regards,

Laurent Pinchart

